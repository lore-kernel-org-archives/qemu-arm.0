Received: by 10.25.208.211 with SMTP id h202csp703881lfg;
        Thu, 24 Mar 2016 08:11:30 -0700 (PDT)
X-Received: by 10.140.93.247 with SMTP id d110mr11199228qge.28.1458832289935;
        Thu, 24 Mar 2016 08:11:29 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u68si6863410qgd.75.2016.03.24.08.11.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Mar 2016 08:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 81560627DC;
	Thu, 24 Mar 2016 15:11:28 +0000 (UTC)
Received: from [10.36.112.25] (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u2OFBMKj001222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Mar 2016 11:11:24 -0400
Subject: Re: [PATCH 1/8] tcg: Clean up direct block chaining data fields
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Sergey Fedorov <serge.fdrv@gmail.com>
References: <1458815961-31979-1-git-send-email-sergey.fedorov@linaro.org>
 <1458815961-31979-2-git-send-email-sergey.fedorov@linaro.org>
 <87poukq9fk.fsf@linaro.org> <56F3F377.4070809@gmail.com>
 <87mvpnrkby.fsf@linaro.org>
Cc: sergey.fedorov@linaro.org, qemu-devel@nongnu.org,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Richard Henderson <rth@twiddle.net>,
        Claudio Fontana <claudio.fontana@huawei.com>,
        Andrzej Zaborowski <balrogg@gmail.com>,
        Aurelien Jarno
 <aurelien@aurel32.net>,
        "Vassili Karpov (malc)" <av1474@comtv.ru>,
        Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
        Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56F4039A.5050907@redhat.com>
Date: Thu, 24 Mar 2016 16:11:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <87mvpnrkby.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 24 Mar 2016 15:11:29 +0000 (UTC)
X-TUID: f4yiu8P07dLT



On 24/03/2016 16:01, Alex Bennée wrote:
>>> >> OK I found that tricky to follow. Where does the value of the pointer
>>> >> come from that sets these bottom bits? The TB jumping to this TB sets it?
>
> Where I get confused it what is the point of jmp_list_first? If these
> are two circular lists do we care which the first in the list is? The
> exit condition when coming out of searching seems when ntb with index =
> orig tb with index.

Say you have a list for blocks that jump to TB. The next pointer is in
jmp_list_next[0] for blocks whose first jump is to TB. It is in
jmp_list_next[1] for blocks whose second jump is to TB.

However, because it is a circular list, you also need TB itself to be a
part of the list. For TB, the next pointer is in jmp_list_first.

Because TB probably doesn't jump to itself, the first link of the list
of blocks that jumps to TB is not in jmp_list_next[].  Thus QEMU places
it in tb->jmp_list_first.

Say you have three tbs.  TB1's first jump and TB2's second jump lead to
TB0.  Then the list starting at tb0->jmp_list_first goes like this:

    tb0->jmp_list_first = tb1 | 0;
      .--------------------'    |
     |                 .--------'
    tb1->jmp_list_next[0] = tb2 | 1;
      .--------------------'      |
      |                 .---------'
    tb2->jmp_list_next[1] = tb0 | 2;

There is also a case where a TB jumps to itself; it then appears twice
in the list with different values in the low bits, such as this:

    tb->jmp_list_first = tb | 0;
     .--------------------'   |
     |                .-------'
    tb->jmp_list_next[0] = tb | 2;

Other blocks jumping to TB would appear in the same list, too, either
before or after the tb|0 link.

Paolo
