Received: by 10.182.105.169 with SMTP id gn9csp1085457obb;
        Mon, 9 Nov 2015 02:52:04 -0800 (PST)
X-Received: by 10.129.40.214 with SMTP id o205mr22339726ywo.145.1447066324232;
        Mon, 09 Nov 2015 02:52:04 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j194si7158723ywg.46.2015.11.09.02.52.04
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:52:04 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id A2EBAC10047C;
	Mon,  9 Nov 2015 10:52:02 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9ApqZ3001452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 05:51:55 -0500
Subject: Re: [PATCH 09/16] target-arm: Support multiple address spaces in page
 table walks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56407AC8.9020100@redhat.com>
Date: Mon, 9 Nov 2015 11:51:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-TUID: weKwTm7XdXH6



On 05/11/2015 19:15, Peter Maydell wrote:
> If we have a secure address space, use it in page table walks:
>  * when doing the physical accesses to read descriptors,
>    make them through the correct address space
>  * when the final result indicates a secure access, pass the
>    correct address space index to tlb_set_page_with_attrs()
> 
> (The descriptor reads are the only direct physical accesses
> made in target-arm/ for CPUs which might have TrustZone.)

What is the case where you have no secure address space and you have
TrustZone?  KVM doesn't have TrustZone, so it should never be in a
secure regime, should it?

Paolo
