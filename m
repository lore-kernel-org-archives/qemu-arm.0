Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1200534lfc;
        Wed, 10 Feb 2021 03:39:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDp+GNHfufajZFH1ZY/Zt95nHzwLNhtRmBRFSECVS/zUsJJfvdkea0i00isEFVW0dfx5FA
X-Received: by 2002:a25:15c4:: with SMTP id 187mr3491903ybv.505.1612957186093;
        Wed, 10 Feb 2021 03:39:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612957186; cv=none;
        d=google.com; s=arc-20160816;
        b=CiYVRP5IRGFvWOKLtKJzJ9xz75/meYpq9+H+yRp0k1A236JuJd1DwqsY/TB3PRh4O2
         48Y0D2IwDIQh5zkoXp9nRounzq1hSPJ5WsPV1Iy9MrAkwT3AX4SPODrP7vkluqpeuiOD
         nihG1gxyrlC+n0M/+SIVuvxtUY5u4rTk3ymmTPVAlBqbiI5n8XeoxDsxr4nkjqc4SWVx
         xHhdSQhZ/HazoTBuaRS8qDM6aSkgthbRs6AhVcARR77IS1uCXlUDfyn0itusEUISssYG
         Fm7i1DrL2VTrWJlR2yA/5pgvzGCIbe+yI+wcqhev2O9X26L4hCHVu/duHwN7bteFRPe2
         U7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=pKIIXODYUHiXhhYdsdhw082kI/XvHKAZkUWlDjvH2Sc=;
        b=z0ekCNaw7XEev2XR6fyasZXHKa+VIBc2kjIEMeQVDWl+IFAXy07Tz+fc7zyfB0ZXfm
         6ZOI/4wrcIQ9rEdgTLriSsQHICQ5gSyl4UceEHeX8bX87+NZ3V1K/zmqhWSjTzbTsbVF
         YdkVF8MjM3AlFhklZn3nA9Mrw0iomX45SEam/TWhMIkjLbYb49bzUjBklGuwCrxK4LS6
         afrQapDXxU4f5WqgXMZE9oRD3WXSqioYRk9gUzkB+TvCUU/w2dxOSCsIISWQ9mqif5SM
         hRtut5eAPhvsjBinC/mDCoFLqsdCzysFKVjjf3LNEBEvQhonev2C0tVQRKtJ8DED2eu/
         wKEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JEaT4Bp3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l35si1918546ybj.200.2021.02.10.03.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Feb 2021 03:39:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JEaT4Bp3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9nqT-0007zW-HH
	for alex.bennee@linaro.org; Wed, 10 Feb 2021 06:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9nqI-0007yU-SA; Wed, 10 Feb 2021 06:39:34 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:45795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9nqC-0006bx-Uz; Wed, 10 Feb 2021 06:39:34 -0500
Received: by mail-lf1-x133.google.com with SMTP id j19so2265707lfr.12;
 Wed, 10 Feb 2021 03:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pKIIXODYUHiXhhYdsdhw082kI/XvHKAZkUWlDjvH2Sc=;
 b=JEaT4Bp33XUl8FuqttUX5Kk7Bs8vMul2lv3jHIy0rhP1wSFqbV3GV8fLfiDs1E/Mhd
 TQhLJVHjA+cjuv7GKlaE/k3KjEuyGjT0VPBNfoOrbOEg0iEj0cJyHxxxlgTR+GroPQyC
 VeLsDJWlb36narGHVUdL9mHPpKzTJ4+/jI0bJHVL7p4q0JQJ3ONBSuNoEE0LUApLkGeg
 +AhzSbp8epn7orwZS3PkUahHo1g4Z8uOpNvnoidKTv1cC2lqTi35hQkGBSUpoZAtlA1M
 7letWQAtGnNnc2yuY0szI0GGyNncyqMXcO+MWRPFyVbX8gqcWN5AequdecxRe71Lmb4C
 Mg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pKIIXODYUHiXhhYdsdhw082kI/XvHKAZkUWlDjvH2Sc=;
 b=r3zmD0tJ7af4lsFh3LKDGIyPsoCuOpRW3pfxeLOED98bZGMpBcA9t2aV7ky1V6m3ZD
 BtkrvQ/kcFMyBojLXDFKL46obffrAgfeui05I+4ESpXua8jjr96y1CUYAgoh9MFmlbUp
 0DDA+LaPb3Fdj3ivAEmV2vkvQWVsqNHRfk8OC4O2oiqMKfzxR6nVCisnhshZqrNAWoDO
 PKCCrrqy3sfZfPC2+tvClJQ6Vu9Dx863WYUjG0aOgzbACmvrp52kXkeGKE7jVPJYmCz6
 NSzUBunG7yfSzsWeMaktQ4gtJoHAETPdJ+EQkXRWUx2qHYGyiEAM2puBknFwsaWzCJ7L
 ZhAg==
X-Gm-Message-State: AOAM531XpOJc8bj0qLjlK2wDCBT9ttKKPvpCl6P2zWKlCnqVc+y7Lskl
 3fJQp917Gx/QDHFSVUAryVA=
X-Received: by 2002:ac2:4285:: with SMTP id m5mr1394621lfh.649.1612957166769; 
 Wed, 10 Feb 2021 03:39:26 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id c11sm412047ljn.106.2021.02.10.03.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 03:39:26 -0800 (PST)
Date: Wed, 10 Feb 2021 12:39:25 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 5/5] hw/ssi: xilinx_spips: Remove DMA related code
 from zynqmp_qspips
Message-ID: <20210210113925.GL477672@toto>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
 <1612951813-50542-6-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612951813-50542-6-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: huJW0Ez4Ppuh

On Wed, Feb 10, 2021 at 06:10:13PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Now that the XLNX CSU DMA model is implemented, the existing codes
> in the ZynqMP QSPIS are useless and should be removed.

We should also modify XLNX_ZYNQMP_SPIPS_R_MAX in the header file.

Otherwise, this looks good to me.


> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v3:
> - new patch: xilinx_spips: Remove DMA related code from zynqmp_qspips
> 
>  hw/ssi/xilinx_spips.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 8a0cc22..1e9dba2 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -195,13 +195,6 @@
>  #define R_GQSPI_MOD_ID        (0x1fc / 4)
>  #define R_GQSPI_MOD_ID_RESET  (0x10a0000)
>  
> -#define R_QSPIDMA_DST_CTRL         (0x80c / 4)
> -#define R_QSPIDMA_DST_CTRL_RESET   (0x803ffa00)
> -#define R_QSPIDMA_DST_I_MASK       (0x820 / 4)
> -#define R_QSPIDMA_DST_I_MASK_RESET (0xfe)
> -#define R_QSPIDMA_DST_CTRL2        (0x824 / 4)
> -#define R_QSPIDMA_DST_CTRL2_RESET  (0x081bfff8)
> -
>  /* size of TXRX FIFOs */
>  #define RXFF_A          (128)
>  #define TXFF_A          (128)
> @@ -417,9 +410,6 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
>      s->regs[R_GQSPI_GPIO] = 1;
>      s->regs[R_GQSPI_LPBK_DLY_ADJ] = R_GQSPI_LPBK_DLY_ADJ_RESET;
>      s->regs[R_GQSPI_MOD_ID] = R_GQSPI_MOD_ID_RESET;
> -    s->regs[R_QSPIDMA_DST_CTRL] = R_QSPIDMA_DST_CTRL_RESET;
> -    s->regs[R_QSPIDMA_DST_I_MASK] = R_QSPIDMA_DST_I_MASK_RESET;
> -    s->regs[R_QSPIDMA_DST_CTRL2] = R_QSPIDMA_DST_CTRL2_RESET;
>      s->man_start_com_g = false;
>      s->gqspi_irqline = 0;
>      xlnx_zynqmp_qspips_update_ixr(s);
> -- 
> 2.7.4
> 
