Received: by 10.25.77.65 with SMTP id a62csp2228250lfb;
        Tue, 7 Feb 2017 07:39:30 -0800 (PST)
X-Received: by 10.200.40.177 with SMTP id i46mr14493477qti.279.1486481970554;
        Tue, 07 Feb 2017 07:39:30 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id l63si3206628qki.234.2017.02.07.07.39.30;
        Tue, 07 Feb 2017 07:39:30 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D6BAC40BC4;
	Tue,  7 Feb 2017 10:38:57 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jh4ewPo1JiTR; Tue,  7 Feb 2017 10:38:56 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C14D640A74;
	Tue,  7 Feb 2017 10:38:56 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 6D30C40A66
 for <kvmarm@lists.cs.columbia.edu>; Tue,  7 Feb 2017 10:38:56 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YbQoHCTTY81I for <kvmarm@lists.cs.columbia.edu>;
 Tue,  7 Feb 2017 10:38:55 -0500 (EST)
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id CCD0D40296
 for <kvmarm@lists.cs.columbia.edu>; Tue,  7 Feb 2017 10:38:54 -0500 (EST)
Received: by mail-wm0-f52.google.com with SMTP id r141so157141674wmg.1
 for <kvmarm@lists.cs.columbia.edu>; Tue, 07 Feb 2017 07:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xZ2LrD1dvPbw6KmQ0hNCUL7qXoQnLZm7nIm2owffVt8=;
 b=MeTa92YMCV4Xns7+eU2PP/pGVtJxGn4MVvRh4K4Xwd8h6Torg91Jkwrd2iC/P4evPe
 /eEYZy4+tEHTLWeiooYacBWZV23lYXcNajgxFxLtQvaHdLYS7Xp4GhJKkO7D9zFnwotV
 peXBMjL2djfEKCZlQ49b+uKVTJVrQtYNXyXWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xZ2LrD1dvPbw6KmQ0hNCUL7qXoQnLZm7nIm2owffVt8=;
 b=km78hn3wZ00abnnTgVYbHEH2ADiyuWKtGIKvT5q/2oXRkDNcE1Nr4gZINuSE3Mu95c
 AA4BajqHP1uM99MhRN25PpCb/fZuSybJAbDGMP7x/Xlgs+OtfJJ4/M6n8tEdcmcmDQmj
 TEBTrMcabQ+00vVJOzJru4hWMK+92tRZwPRUQORMD1vKNZvfV1Z7Uhz7JZHcHK3xtHIO
 8DALtxDZm0RNpxtWV8jPmcN/QeO1SUHmch4hsUwujg/XiUTiQw83bFGvirHxJasrBAFG
 60s/BAYOCBjmtdEsBpGiOBnMdjJoIeOGX/1WWJIfhjyoypd3rAIeNtzR2/JFsAyYMusE
 SgIQ==
X-Gm-Message-State: AMke39nfxcJeDFLdEz9HcdA9KjWNEF8HnF63XyK7/el8O468KusHHjAYxxLQXhX6tVD7fjQdzGIBUZaXiXeYTYpo
X-Received: by 10.28.91.16 with SMTP id p16mr12993204wmb.111.1486481964268;
 Tue, 07 Feb 2017 07:39:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 7 Feb 2017 07:39:03 -0800 (PST)
In-Reply-To: <1484558821-15512-5-git-send-email-zhaoshenglong@huawei.com>
References: <1484558821-15512-1-git-send-email-zhaoshenglong@huawei.com>
 <1484558821-15512-5-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2017 15:39:03 +0000
Message-ID: <CAFEAcA90zm3gqvNO6QTGcpg2=rYMbC=G0E+p-6ERXf=UXSXe9Q@mail.gmail.com>
Subject: Re: [PATCH RFC 4/6] target: arm: Add a generic type cpu
To: Shannon Zhao <zhaoshenglong@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 wu.wubin@huawei.com,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
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
X-TUID: ul0VVplz0sdB

On 16 January 2017 at 09:26, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Add a generic type cpu, it's useful for migration when running on
> different hardwares.
>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  target/arm/cpu64.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 549cb1e..223f31e 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -204,6 +204,59 @@ static void aarch64_a53_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
>  }
>
> +static void aarch64_generic_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,armv8";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_VFP4);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> +    set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    cpu->kvm_target = QEMU_KVM_ARM_TARGET_GENERIC_V8;
> +    cpu->midr = 0x410fd000; /* FIXME: this needs to adjust */
> +    cpu->revidr = 0x00000000;
> +    cpu->reset_fpsid = 0x41034070;
> +    cpu->mvfr0 = 0x10110222;
> +    cpu->mvfr1 = 0x12111111;
> +    cpu->mvfr2 = 0x00000043;
> +    cpu->ctr = 0x84448004; /* L1Ip = VIPT */
> +    cpu->reset_sctlr = 0x00c50838;
> +    cpu->id_pfr0 = 0x00000131;
> +    cpu->id_pfr1 = 0x00011011;
> +    cpu->id_dfr0 = 0x03010066;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->id_mmfr0 = 0x10101105;
> +    cpu->id_mmfr1 = 0x40000000;
> +    cpu->id_mmfr2 = 0x01260000;
> +    cpu->id_mmfr3 = 0x02102211;
> +    cpu->id_isar0 = 0x02101110;
> +    cpu->id_isar1 = 0x13112111;
> +    cpu->id_isar2 = 0x21232042;
> +    cpu->id_isar3 = 0x01112131;
> +    cpu->id_isar4 = 0x00011142;
> +    cpu->id_isar5 = 0x00011121;
> +    cpu->id_aa64pfr0 = 0x00002222;
> +    cpu->id_aa64dfr0 = 0x10305106;
> +    cpu->id_aa64isar0 = 0x00011120;
> +    cpu->id_aa64mmfr0 = 0x0f001101; /* only support 4k page, 36 bit physical addr */

Not 64K as well? That seems rather limiting.

> +    cpu->dbgdidr = 0x3516d000;
> +    cpu->clidr = 0x0a200023;
> +    cpu->ccsidr[0] = 0x7003e01a; /* 8KB L1 dcache */
> +    cpu->ccsidr[1] = 0x2007e00a; /* 8KB L1 icache */
> +    cpu->ccsidr[2] = 0x700fe07a; /* 128KB L2 cache */
> +    cpu->dcz_blocksize = 4; /* 64 bytes */
> +    define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
> +}

What's the general principle behind the values we're using
here for the various ID and feature registers?

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
