Received: by 10.25.205.13 with SMTP id d13csp2174299lfg;
        Tue, 13 Dec 2016 04:38:47 -0800 (PST)
X-Received: by 10.237.60.51 with SMTP id t48mr84278889qte.24.1481632727398;
        Tue, 13 Dec 2016 04:38:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s13si28054484qte.138.2016.12.13.04.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 04:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37865 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGmM0-0006bt-Px
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 07:38:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cGmLq-0006Z2-Rz
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:38:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cGmLl-0005tm-Se
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:38:34 -0500
Received: from mail-wj0-f194.google.com ([209.85.210.194]:33758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cGmLl-0005tY-Lz; Tue, 13 Dec 2016 07:38:29 -0500
Received: by mail-wj0-f194.google.com with SMTP id kp2so16287704wjc.0;
	Tue, 13 Dec 2016 04:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bKl+ATSnd7cyuOPt8yuHid87SvxYjpuzsIEFxuE99uc=;
	b=TLYtkPvfmaGuLNABNuWpwfJ2Ymsp97E4T8BobR8ZPrdbujJpYNVHFF4/7/2aa/nrFt
	+ckBFAKPCZxc+/a8kVGOHO6N+A7sixDdHgIG3IThfRIAWEeWObs3LJuUJfBllKbD2jiY
	+hn0oolZbivAlecpEkcM+Cu1Eap+imySCzlRq1pzyw1wxL91sqFntq9SjcMthYfTIYFj
	/48Q74UEfT9Fn/Lxnxi/8tAkMtZeg3qgNKay0Vb43ZwDZLEWqf1wJ1jmLjkv7X9rw2lb
	WA4D8P5gYUjgaztvD81Qu78nnSH/oS+jHwRaq4iNNYxitYTadJAzDhkD5nFTyFAMhMfW
	U91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bKl+ATSnd7cyuOPt8yuHid87SvxYjpuzsIEFxuE99uc=;
	b=BUOXTOJYFMYuxqrVqS22zGCHu7SEX7UxBKNQuJcUVGroyCdSQswl+uZ/mGe/6cp7WK
	EyCT84q4VhV2rrgKfoy32RqRQRmjEh+T3jBG2zQRxeepaPNbnRlKjMXjtyr7zUTeX05D
	1Eo9EMFO97IuTTLZbAuFS9xopwOmajSf+n6+VSwyo5EswBqAXUkysGUAs5fhYSC/0Mah
	sTXVHIylpIfVU9bXwvfw08lQvlJIFycgNyGOTHMvXuBeJZU0V3SIVEbWZwfZO9jlxt7l
	5yEces2mOFki73rSif33z22UOMuqQCXE2oaD1HcV9eavNVN7KUvpzGZlaACM1ZsFzL8C
	bCVg==
X-Gm-Message-State: AKaTC028MjGWuIPkwNtbKwTFmfoHsGIE0gFk5TsZ7k/Aiy8qmfKNDb5A3DG0paNCHK1n5w==
X-Received: by 10.25.0.196 with SMTP id 187mr8575079lfa.156.1481632648393;
	Tue, 13 Dec 2016 04:37:28 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	t126sm9929568lff.26.2016.12.13.04.37.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 04:37:27 -0800 (PST)
Date: Tue, 13 Dec 2016 13:37:26 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161213123726.GM9606@toto>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-11-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481625384-15077-11-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.194
Subject: Re: [Qemu-arm] [PATCH 10/23] target-arm: Expose output GPIO line
 for VCPU maintenance interrupt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fwixlnYhOmKU

On Tue, Dec 13, 2016 at 10:36:11AM +0000, Peter Maydell wrote:
> The GICv3 support for virtualization includes an outbound
> maintenance interrupt signal which is asserted when the
> CPU interface wants to signal to the hypervisor that it
> needs attention. Expose this as an outbound GPIO line from
> the CPU object which can be wired up as a physical interrupt
> line by the board code (as we do already for the CPU timers).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  target-arm/cpu.h | 2 ++
>  target-arm/cpu.c | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index ca5c849..c38488a 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -555,6 +555,8 @@ struct ARMCPU {
>      QEMUTimer *gt_timer[NUM_GTIMERS];
>      /* GPIO outputs for generic timer */
>      qemu_irq gt_timer_outputs[NUM_GTIMERS];
> +    /* GPIO output for GICv3 maintenance interrupt signal */
> +    qemu_irq gicv3_maintenance_interrupt;
>  
>      /* MemoryRegion to use for secure physical accesses */
>      MemoryRegion *secure_memory;
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 99f0dbe..5e0d21d 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -466,6 +466,9 @@ static void arm_cpu_initfn(Object *obj)
>                                                  arm_gt_stimer_cb, cpu);
>      qdev_init_gpio_out(DEVICE(cpu), cpu->gt_timer_outputs,
>                         ARRAY_SIZE(cpu->gt_timer_outputs));
> +
> +    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->gicv3_maintenance_interrupt,
> +                             "gicv3-maintenance-interrupt", 1);
>  #endif
>  
>      /* DTB consumers generally don't in fact care what the 'compatible'
> -- 
> 2.7.4
> 
