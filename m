Received: by 10.25.208.137 with SMTP id h131csp90777lfg;
        Wed, 27 Apr 2016 23:46:34 -0700 (PDT)
X-Received: by 10.55.187.67 with SMTP id l64mr13021757qkf.175.1461825994031;
        Wed, 27 Apr 2016 23:46:34 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 140si4279149qhi.87.2016.04.27.23.46.33;
        Wed, 27 Apr 2016 23:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 57B4041AF6;
	Thu, 28 Apr 2016 02:44:12 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.209
X-Spam-Level: 
X-Spam-Status: No, score=0.209 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_LOW=-0.7,
	T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8V4FtSdI1mxC; Thu, 28 Apr 2016 02:44:10 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 906F341267;
	Thu, 28 Apr 2016 02:44:10 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 7A40240FA6
 for <kvmarm@lists.cs.columbia.edu>; Thu, 28 Apr 2016 02:44:09 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ja8n1hddFJo3 for <kvmarm@lists.cs.columbia.edu>;
 Thu, 28 Apr 2016 02:44:08 -0400 (EDT)
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
 [209.85.213.41])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 90F4C40402
 for <kvmarm@lists.cs.columbia.edu>; Thu, 28 Apr 2016 02:44:08 -0400 (EDT)
Received: by mail-vk0-f41.google.com with SMTP id u23so20812401vkb.2
 for <kvmarm@lists.cs.columbia.edu>; Wed, 27 Apr 2016 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=CurJWqribTBH1VhcI1ACpoBLd+gL/+++yjezLP2YCNg=;
 b=CdNitMO9jfZJqApa0afF+LaEI/xwYKu3FcMkCVtILcGACmcGwnPclVV81OB3JVAmBb
 xR1eArsokwZWKhI+cY6TuIExaOEcZvBmA6R3VOCpSN817Oh5dCskCt9ye+8yAAXqDWZm
 +DmH4puqXjUo/kgDQB3+RzLCDlxI0KxYCBh9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=CurJWqribTBH1VhcI1ACpoBLd+gL/+++yjezLP2YCNg=;
 b=TiruqGiNurMhYgpYiWIu3Z0NaKlRBRj4eFtXO9DYT0GZKmGGvOWAn+pgToxnQCIX+G
 SkaENxDmL9zAMVL/CmQ+CucdspLscBgscbJpvyCUIAAX6j1anbgBrVW48AKN88reELuJ
 At1H3f7KJG9qVTUnTMlpretZbRwUya04dKCeTu/+ffv+sL/YvnenQ4hTAjO6peTN4YYJ
 jUeEeSoZ9Ymp4/Bbt94ei4zQ1GoSdUioXLYuFCC7xiCC4GDYr7QRHrIV0Jtz1N6kNiaE
 N4UDWonrzrIiW9PSvR0ZXVg8IUMY95M5bgV7KpKpZzgWE3T2Q1VVOZQx30l+4EunwRrV
 ViMw==
X-Gm-Message-State: AOPr4FXytZui7IgOEw60UL05+EhxY9uVJvG5q1KI+D4BONkgv1BA3l89LI5Cwso3NcLgk9g/9JzLItWuUQDOUCGd
X-Received: by 10.31.196.197 with SMTP id u188mr1431927vkf.139.1461825989188; 
 Wed, 27 Apr 2016 23:46:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 27 Apr 2016 23:46:09 -0700 (PDT)
In-Reply-To: <708585848.188261461823397987.JavaMail.weblogic@ep2mlwas06d>
References: <708585848.188261461823397987.JavaMail.weblogic@ep2mlwas06d>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2016 07:46:09 +0100
Message-ID: <CAFEAcA9eEdNhPSWgM39WoySe29+wLUz687PBDptHM20GwZC9Gg@mail.gmail.com>
Subject: Re: Re: [Query] Does Linux & Qemu support KVM for ARM32 guest on
 ARM64 host
To: r.sande@samsung.com
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Marc Zyngier <marc.zyngier@arm.com>, Andre Przywara <andre.przywara@arm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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
X-TUID: FFYAIJrxUt79

On 28 April 2016 at 07:03, RAVINDRA KUMAR SANDE <r.sande@samsung.com> wrote:
> I have another query, for Arm32 host with KVM enabled.
> I see that "qemu-system-arm  -enable-kvm   -machine vexpress-a9  ..." gives error
> kmv_init_vcpu (IOCtl on /dev/kvm) failed, guest not supported.
>
> Is there any way to emulate vexpress-a9  with  -enable-kvm   on qemu ?

No. You can only emulate a CPU of the same type as the host
you're using, and the vexpress-a9 must use a Cortex-A9 CPU,
so it can't be used under virtualization.

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
