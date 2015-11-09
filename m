Received: by 10.182.105.169 with SMTP id gn9csp1077502obb;
        Mon, 9 Nov 2015 02:30:35 -0800 (PST)
X-Received: by 10.129.128.65 with SMTP id q62mr25822113ywf.210.1447065035067;
        Mon, 09 Nov 2015 02:30:35 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u66si7109828ywa.211.2015.11.09.02.30.34
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:30:35 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id D6F87C0AED5D;
	Mon,  9 Nov 2015 10:30:33 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9AUS5L025534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 05:30:31 -0500
Subject: Re: [PATCH 02/16] exec.c: Allow target CPUs to define multiple
 AddressSpaces
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-3-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <564075C4.2090305@redhat.com>
Date: Mon, 9 Nov 2015 11:30:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446747358-18214-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-TUID: QXGACHIMPzhj



On 05/11/2015 19:15, Peter Maydell wrote:
> Allow multiple calls to cpu_address_space_init(); each
> call adds an entry to the cpu->ases array at the specified
> index. It is up to the target-specific CPU code to actually use
> these extra address spaces.
> 
> Since this multiple AddressSpace support won't work with
> KVM, add an assertion to avoid confusing failures.

Actually it won't work _now_ with KVM, but it could.

It would be a good idea to map the multiple CPU AddressSpaces to KVM's
own multiple address spaces.  It's possible to modify i386 to do this,
using address space 0 for normal operation and address space 1 for SMM,
just like KVM.

More on this as I reply to the remainder of the series...

Paolo

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
