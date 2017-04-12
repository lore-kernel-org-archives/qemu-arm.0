Received: by 10.25.0.144 with SMTP id 138csp120307lfa;
        Tue, 11 Apr 2017 20:43:55 -0700 (PDT)
X-Received: by 10.200.48.237 with SMTP id w42mr2052466qta.27.1491968635758;
        Tue, 11 Apr 2017 20:43:55 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n20si18245490qki.228.2017.04.11.20.43.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 20:43:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19C5780466;
	Wed, 12 Apr 2017 03:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 19C5780466
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 19C5780466
Received: from [10.72.8.56] (ovpn-8-56.pek2.redhat.com [10.72.8.56])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v3C3hjo3024616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 11 Apr 2017 23:43:48 -0400
Subject: Re: [PATCH 09/10] target/i386: optimize indirect branches with TCG's
 jr op
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1491959850-30756-1-git-send-email-cota@braap.org>
 <1491959850-30756-10-git-send-email-cota@braap.org>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Claudio Fontana <claudio.fontana@huawei.com>,
        Andrzej Zaborowski <balrogg@gmail.com>,
        Aurelien Jarno
 <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
        Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
        alex.bennee@linaro.org, Pranith Kumar <bobby.prani+qemu@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2ede0852-6888-8bcb-ac5a-363478841bc7@redhat.com>
Date: Wed, 12 Apr 2017 11:43:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491959850-30756-10-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 12 Apr 2017 03:43:54 +0000 (UTC)
X-TUID: ClAbKGoGxNpA



On 12/04/2017 09:17, Emilio G. Cota wrote:
> 
> The fact that NBench is not very sensitive to changes here is a
> little surprising, especially given the significant improvements for
> ARM shown in the previous commit. I wonder whether the compiler is doing
> a better job compiling the x86_64 version (I'm using gcc 5.4.0), or I'm simply
> missing some i386 instructions to which the jr optimization should
> be applied.

Maybe it is "ret"?  That would be a straightforward "bx lr" on ARM, but
it is missing in your i386 patch.

Paolo
