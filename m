Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1472935wrs;
        Wed, 13 Mar 2019 03:22:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpK9FviQAkf8a/KdrCqW7nBnrtAGS8w8QYxfYIIG0De1Sb6Y43bH9W85aj/j/YKPiQr6Wj
X-Received: by 2002:ac8:2269:: with SMTP id p38mr19267597qtp.340.1552472572318;
        Wed, 13 Mar 2019 03:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552472572; cv=none;
        d=google.com; s=arc-20160816;
        b=ptV/halHPD2s9oaDosyHzLuQ6stw0e5Dw5RP84kqRuQuofk4v+kz4hFpD8aSw1Q7oT
         vwy8qMcDL8zXMzl6COSrUFRoJLAFp5iLd5o0uoa8zueoDXF8f63DRn/p9KWBkf3QGhg8
         yJOKISC2eEFYRemToSMwbxKlR817UDpwn/PWVw78ZraacNllhj5MyizMYOT3ukr/gMcB
         mGDW3boy6kSTiTrkkJUjkKh9+ripSgfpAR+n++B8igqTW113+5iZwfMezNEzzCCBRYfd
         +8h6vaHjF5+GfjTNhM6mnjJtzMfIi94FC3tp2oBF/hBQRMiuwPhtV0s4svBvm06+BedI
         TBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=sMktU14TwrD7DTvQKy0j9UXcjtHJST7KSvH+7JSRIJY=;
        b=Y8BObhoL3rXe/lEiV187nr/qGlnDaedpVf8HuTeOMSSlhcpwbISrMB3senO6XdA3ds
         1tDJSVNvBWN2joBOOIm5eqbdMXhUyI41IPxGGBE9CWBftTEOuCp2CfES6416eaRRzZYd
         YGxA26lItbczkpr1IVzkRPaM+FV5SPBJDILlucNKJU07eNvVqzoDFG4fMIBjiW7gGEXE
         zLwDSsV1dUHwZhe9i53dsgBrfO2y9vmn2QSdjc+ckrVUlVag7RGxr+PrkJ+qVQ2DzTD2
         0dWf30P/bscvth4NOHLrn8qiDzi3b8KFvRJ297r5vOX6LGr6CMS43pfrFPK5yihHG/fC
         AcVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 15si5188399qtv.151.2019.03.13.03.22.52;
        Wed, 13 Mar 2019 03:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D8B884A429;
	Wed, 13 Mar 2019 06:22:51 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=ham
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uztx-67OSMDM; Wed, 13 Mar 2019 06:22:50 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id CC85C4A36C;
	Wed, 13 Mar 2019 06:22:50 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 901034A36C
 for <kvmarm@lists.cs.columbia.edu>; Wed, 13 Mar 2019 06:22:49 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEyoRIVpWGMz for <kvmarm@lists.cs.columbia.edu>;
 Wed, 13 Mar 2019 06:22:48 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 6CE5A4A2BE
 for <kvmarm@lists.cs.columbia.edu>; Wed, 13 Mar 2019 06:22:48 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D79F980D;
 Wed, 13 Mar 2019 03:22:47 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D3DA3F71D;
 Wed, 13 Mar 2019 03:22:46 -0700 (PDT)
Subject: Re: Re: [RFC] arm/cpu: fix soft lockup panic after resuming from stop
To: Heyi Guo <guoheyi@huawei.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1552370960-2061-1-git-send-email-guoheyi@huawei.com>
 <CAFEAcA-29Q-sTg2wLre0GJJCr2gfu89rg0vuTOf7cW5drE4d7Q@mail.gmail.com>
 <136f773f-9b08-a39b-3ecb-2c00ff290b49@arm.com>
 <f528c40f-7b31-3bd2-ca93-1c579961581d@huawei.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <f54d219f-1a2c-c263-66e7-903da4162d66@arm.com>
Date: Wed, 13 Mar 2019 10:22:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <f528c40f-7b31-3bd2-ca93-1c579961581d@huawei.com>
Content-Language: en-GB
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: C2gR5SEPju70

On 13/03/2019 01:57, Heyi Guo wrote:
> Dear all,
> 
> Really appreciate your comments and information. For "Live Physical
> Time", is there any document to tell the whole story? And may I know the
> timeline to make it happen?

The documentation is available here:
https://developer.arm.com/docs/den0057/a

I also posted an RFC for Linux support last year:
http://lists.infradead.org/pipermail/linux-arm-kernel/2018-December/620338.html

In terms of timeline I don't have anything definite. We need to get the
spec nailed down before much progress can be made on the code. And at
the moment Live Physical Time (LPT) isn't that useful on it's own
because there are a number of other issues with migrating an arm64 guest
from one host to another which has different hardware (e.g. handling
different CPU errata).

Steve
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
