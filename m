Received: by 10.28.4.212 with SMTP id 203csp2908207wme;
        Mon, 16 Apr 2018 10:35:20 -0700 (PDT)
X-Google-Smtp-Source: AIpwx483EBU2FKnl3vwsYxQldvktDfUbrAwimfHFPIdG5Eu7juhx9rYPJ2Ifqwg/8Ba3QsDkKBB3
X-Received: by 10.129.61.15 with SMTP id k15mr4797946ywa.257.1523900120064;
        Mon, 16 Apr 2018 10:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523900120; cv=none;
        d=google.com; s=arc-20160816;
        b=PpVVTmMT75SxQCnqBTRWn5YOAh749cY+XDoY5yWGCqKebwu+JNnh/8IcmpDCNLI0Uf
         YzQoodk577tdymr7yj6L/03L4yR4NNbWSWrRNRKBE6BIHLDYUT0onirxovyCVfVIPKaA
         1S6YWVexJyLe5ee+FK6+WrQ5F/US8aBaDNyU/QG446KSjfibDnWe8wVuS2ZPad4l8dWj
         jh3oGHK/sy5Q32FIFG6zsgnysn9Uiq1fpXNmIDgJb7HFH0v8ucOa0Ru4B58FINbJnQoD
         z2EiO1UjOGWr61goJUUJa9nHZuslb5qrGbBgUanUYa/9TWW1t2XeNC5h2S4diXbxQQ6G
         qPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dXE+2nYss3TRBwyTjdLcP/Z3HPDQa/qDITdWHBDril0=;
        b=eKK0e/SeA1XJkW0eVVtMdFz2WTPJK5ts3avmZ03QJn1Orq3Njj+O2Pg/+lAKcHco12
         2k6opie/wg2dqbfJVzKzUDi5udIMiedUjvLE3ipBu9Fb85RZ8caxHdegLhyP6YeGamkc
         xvnvqof+LSf/aIrdyKMnyY/3PErpv0b0/FVXJjnSa++CtdqFORsqv8P5BFH8sUiNKXo/
         YVdPGJXfrKVOx/Hw/1Raij42jSBvhpt6KW5aABPqkLDwhyU1McXSD7h/ANaUFgLjb7rg
         yu6v5rEt1V41/AMtG3Xu/iMaq+p8AoIBskUvUjoLwLz+eOHbEfTu9vq5OvuUainUq5y4
         cbRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H+baVAhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4si5133320qkj.380.2018.04.16.10.35.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 10:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H+baVAhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60550 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f882B-00013L-IB
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 13:35:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f881x-00011A-4W
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 13:35:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f881w-0006zX-0w
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 13:35:05 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:44097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f881v-0006z5-SH
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 13:35:03 -0400
Received: by mail-ot0-x242.google.com with SMTP id p33-v6so18282848otp.11
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 10:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dXE+2nYss3TRBwyTjdLcP/Z3HPDQa/qDITdWHBDril0=;
	b=H+baVAhC9cnLCpSLJotf4xjXdoQqL7iyA8HRTlVsZEyY1Jz3/XHwQTpf7yI8Xc45Cw
	oO3SKII3yz/XfCrx2iars4HGrM45aKiIRv4hrzl98MljSwOtrp3ONK1xp3BxJ5WxWait
	/j07EsiABHsdxquoUysAr+YnIW31NV+a3Q49s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dXE+2nYss3TRBwyTjdLcP/Z3HPDQa/qDITdWHBDril0=;
	b=nfb8v4FUl7hf1/OyUsYBtbb3UffQSNB5HfNwOl9yiYZG+ssUCLR3ANPp3ws/1aeX5M
	61jcQFUOuNS0PojwoJTgrURaWvz+Zdu+MNaJ58jSV+vqrv2Jky80qgNXwuVluVm2glEc
	18wOjR02qD7dJUvo/DWJXgvpaQ5y9iCT6NW23ggADakLeeW7m5H3GAmxucjlu9P/MBTs
	NLvEJuzLvh2lKPnWmWhkWwRoUE5UklBudnUt9siGMFrbAlNpbsptNDafZZnPyzuazREN
	T8EHL/1y+UDDzSRSXcXpzWlju6x/T9mUuM6jQ2onSXOdEzc5Am/JdKjcmvVkT7jOTWrE
	6+4Q==
X-Gm-Message-State: ALQs6tDrr20d+DhyWbpIDvLabUGl9qMiws9wmeRp4ttJiCibozq5D90r
	U145N4gcoKEeI+i5g8vwRwY9bB5xCHLcj0oJcj0Gpg==
X-Received: by 2002:a9d:4a90:: with SMTP id
	i16-v6mr4997120otf.294.1523900103202; 
	Mon, 16 Apr 2018 10:35:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 10:34:42
	-0700 (PDT)
In-Reply-To: <1523551221-11612-5-git-send-email-imammedo@redhat.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
	<1523551221-11612-5-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 18:34:42 +0100
Message-ID: <CAFEAcA94GLNWcG=cMkg93hfqMZ7UdE9Vsx01FP_o6J5a_jRzBQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH for-2.13 4/4] arm/boot: split load_dtb() from
 arm_load_kernel()
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QwKrJ5ZZ0K5M

On 12 April 2018 at 17:40, Igor Mammedov <imammedo@redhat.com> wrote:
> load_dtb() depends on arm_load_kernel() to figure out place
> in RAM where it should be loaded, but it's not required for
> arm_load_kernel() to work. Sometimes it's neccesary for
> devices added with -device/device_add to be enumerated in
> DTB as well, which's lead to [1] and surrounding commits to
> add 2 more machine_done notifiers with non obvious ordering
> to make dynamic sysbus devices initialization happen in
> the right order.
>
> However instead of moving whole arm_load_kernel() in to
> machine_done, it's sufficient to move only load_dtb() into
> virt_machine_done() notifier and remove ArmLoadKernelNotifier/
> /PlatformBusFDTNotifierParams notifiers, which saves us ~90LOC
> and simplifies code flow quite a bit.
> Later would allow to consolidate DTB generation within one
> function for 'mach-virt' board and make it reentrant so it
> could generate updated DTB in device hotplug secenarios.
>
> While at it rename load_dtb() to arm_load_dtb() since it's
> public now.
>
> Add additional field skip_dtb_autoload to struct arm_boot_info
> to allow manual DTB load later in mach-virt and to avoid touching
> all other boards to explicitly call arm_load_dtb().
>
>  1) (ac9d32e hw/arm/boot: arm_load_kernel implemented as a machine init done notifier)
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/arm/arm.h        | 37 ++++++++++++++++++-------
>  include/hw/arm/sysbus-fdt.h | 37 +++++--------------------
>  hw/arm/boot.c               | 67 +++++++++++----------------------------------
>  hw/arm/sysbus-fdt.c         | 64 ++++---------------------------------------
>  hw/arm/virt.c               | 64 ++++++++++++++++++++-----------------------
>  5 files changed, 86 insertions(+), 183 deletions(-)
>
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index 188d18b..312e533 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -39,15 +39,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>   */
>  void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
>
> -/*
> - * struct used as a parameter of the arm_load_kernel machine init
> - * done notifier
> - */
> -typedef struct {
> -    Notifier notifier; /* actual notifier */
> -    ARMCPU *cpu; /* handle to the first cpu object */
> -} ArmLoadKernelNotifier;
> -
>  /* arm_boot.c */
>  struct arm_boot_info {
>      uint64_t ram_size;
> @@ -56,6 +47,9 @@ struct arm_boot_info {
>      const char *initrd_filename;
>      const char *dtb_filename;
>      hwaddr loader_start;
> +    hwaddr dtb_start;
> +    hwaddr dtb_limit;
> +    bool skip_dtb_autoload;

skip_dtb_autoload is a flag that the board code needs to set, so can
we have a comment documenting what it does, please?

>      /* multicore boards that use the default secondary core boot functions
>       * need to put the address of the secondary boot code, the boot reg,
>       * and the GIC address in the next 3 values, respectively. boards that

Otherwise this looks good, especially the diffstat :-)
I'm assuming Eric will check the platform-bus/sysbus-fdt parts
of this patch.

thanks
-- PMM
