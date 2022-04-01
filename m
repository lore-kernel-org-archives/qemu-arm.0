Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp705946lfb;
        Fri, 1 Apr 2022 01:27:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXWpfhMGgacIm8n9rvtUW74RGTKtDrZTd972uO/z2Nu/2aWNSNlzFfys35KXjhiMBfOWe1
X-Received: by 2002:a0c:d688:0:b0:42c:3cb0:3923 with SMTP id k8-20020a0cd688000000b0042c3cb03923mr6910116qvi.69.1648801634329;
        Fri, 01 Apr 2022 01:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648801634; cv=none;
        d=google.com; s=arc-20160816;
        b=x9atqzSeoA7uvWtKpKQJkeG2I5qp+NocXP5FQp8gHHY5IL47Zq3SwGnF953ZKmDnDl
         UNzxhcEJEnzDqVOa/C/gCfnvmLDDFu9e1JcS9+qwUzC2ZClnf8XBH1pn5sqoGvEAudM8
         3ruPsx7SZta822mmGPReO6Z2qAjiXBazcvKenkgCMbRl9pB4pdoc4T6K5YnbYE6FOk0e
         2zFxvoeLZWVS7pkbS1WflZGaYFiqN5v468YDEtmlbMdA4Z2kn2uBP8K+V0Xn7od11odI
         QLbHZGQpoMEZ0la5gh1Ij7GfNVyy3RTw2pDkWM6dXV5sKe314FEJRBRM7QpbeFr+sHyF
         JH1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=Ok/eFYSyMIDWPLR3+wbpOx70tluoiUodTB6IQ/klXpo=;
        b=FkIcQxymo3Mm7BDxnXIhfapSOu/WWgOUwiomlfQXV4NFmhWiindFmexfLVx3Cqgcnu
         rMMXPsrDz3llHA6YzbqmxA9ujZn55XfVPM/vMp0190teFcJxfstNZ94FDk01vVhD5tfK
         IG+5F4IQ6Nd3U4PCd/ReTeOAfbwY3rVfq6TmpWRj377p5GGLFuh3iTIkRwM9m3RPiZ04
         nLYa6ecTwxaBdfeQDtE2vIR+Bb+eSJw7QI4YBs5wOXwR2F09Pm1+HWv33anhNM3xQ9+v
         JjMp7GIBB+U9wyFURA3PfZty3hpa84EKSCmumiWDjqd0Cb65fbnyGK9DN4bFAqmRK94d
         WkFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=d2os131e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020a37660d000000b0067e4be237f7si938695qkc.60.2022.04.01.01.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 01:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=d2os131e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naCch-0007NO-Ss
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 04:27:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1naCOE-0000t1-3A; Fri, 01 Apr 2022 04:12:17 -0400
Received: from [2a00:1450:4864:20::136] (port=40614
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1naCOB-0005ni-UD; Fri, 01 Apr 2022 04:12:13 -0400
Received: by mail-lf1-x136.google.com with SMTP id t25so3429840lfg.7;
 Fri, 01 Apr 2022 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ok/eFYSyMIDWPLR3+wbpOx70tluoiUodTB6IQ/klXpo=;
 b=d2os131eEvCGwYyjVrtk0LZUIB96KKJmbOYOedihQL4ojFdIU/rdjLSAuYtEBKzlN6
 R5kx46T2mdjtf9bs7kRvHes3241h3ewkb3hkd3GpAasSeGKZliclpUrUV2/ncQYe9/zy
 vX7nKiEUJQWxZBANOajy6Rvx7rU4lPB6hK7XQTdWhWgSa2BdgSuY7EUjSJaSx49Buqpb
 /I1KQM3hbR/dSRfviilSxq7NqxTZTXo3bY9SycXgcCo+Ja61+k8/3WgKFNfALj6NhvT4
 5KPYi7SM0uqTi9JulRQxNyLEh4Rag44asEsexCdVlCFaoYhvdlBySrZeBejUyijAAZ/8
 RM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ok/eFYSyMIDWPLR3+wbpOx70tluoiUodTB6IQ/klXpo=;
 b=sbXTt2maGjFJ/Vi3VFys62hI5IFtU9D3lqevukc3HL9+jfDBh0tFZuogccakVOATCf
 aBa5Xq9uQ+c2v4HdichTZgfhiSbltdIUwoHNGbECKpT55sZ/SnNRSpb07Jh1Anw/bRz5
 uDdId+gTS9Z9Hh0mOMchJPHIoRkbLRJ9XKZmFl2tFNmk1f8Ji0+ufTwZ6F7OD2oovCoa
 nw7exYuXpwmvSy3OqgAgdxIy8tN0xzdSMbrrgj8+pcQrD1Cq0e+lqCREJ0t7crplxwta
 uR37W+qyrXq4g9OOUtw7xvooy45QK4nTe4fnGaNo4TgMhDfJzqhmMN68borHT1z+ECeB
 JwOg==
X-Gm-Message-State: AOAM532flmGqiFr9CD4bQE5Z5KDS3GvRyPZQeQ6qISJpaEsPD+cHlUCt
 U0WCl8mmNRcpDyL6ScZ5ntQ=
X-Received: by 2002:a05:6512:3dab:b0:44a:247:2d8 with SMTP id
 k43-20020a0565123dab00b0044a024702d8mr13067548lfv.628.1648800729385; 
 Fri, 01 Apr 2022 01:12:09 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a2e3c15000000b0024af39be634sm138445lja.28.2022.04.01.01.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 01:12:08 -0700 (PDT)
Date: Fri, 1 Apr 2022 10:12:07 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 2/2] hw/arm/xlnx-zynqmp: Connect 4 TTC timers
Message-ID: <20220401081206.GB18849@fralle-msi>
References: <20220331222017.2914409-1-edgar.iglesias@gmail.com>
 <20220331222017.2914409-3-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331222017.2914409-3-edgar.iglesias@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -1006
X-Spam_score: -100.7
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-100.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 asifsiddiqui120@gmail.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 alistair@alistair23.me, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IuTT2oCqLGMx

On [2022 Apr 01] Fri 00:20:17, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Connect the 4 TTC timers on the ZynqMP.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  include/hw/arm/xlnx-zynqmp.h |  4 ++++
>  hw/arm/xlnx-zynqmp.c         | 22 ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
> index 9d9a9d0bf9..85fd9f53da 100644
> --- a/include/hw/arm/xlnx-zynqmp.h
> +++ b/include/hw/arm/xlnx-zynqmp.h
> @@ -41,6 +41,7 @@
>  #include "hw/or-irq.h"
>  #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
>  #include "hw/misc/xlnx-zynqmp-crf.h"
> +#include "hw/timer/cadence_ttc.h"
>  
>  #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
> @@ -84,6 +85,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
>  #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
>                                    XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
>  
> +#define XLNX_ZYNQMP_NUM_TTC 4
> +
>  /*
>   * Unimplemented mmio regions needed to boot some images.
>   */
> @@ -128,6 +131,7 @@ struct XlnxZynqMPState {
>      qemu_or_irq qspi_irq_orgate;
>      XlnxZynqMPAPUCtrl apu_ctrl;
>      XlnxZynqMPCRF crf;
> +    CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
>  
>      char *boot_cpu;
>      ARMCPU *boot_cpu_ptr;
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 5bfe285a19..375309e68e 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -68,6 +68,9 @@
>  #define APU_ADDR            0xfd5c0000
>  #define APU_IRQ             153
>  
> +#define TTC0_ADDR           0xFF110000
> +#define TTC0_IRQ            36
> +
>  #define IPI_ADDR            0xFF300000
>  #define IPI_IRQ             64
>  
> @@ -316,6 +319,24 @@ static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
>      sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
>  }
>  
> +static void xlnx_zynqmp_create_ttc(XlnxZynqMPState *s, qemu_irq *gic)
> +{
> +    SysBusDevice *sbd;
> +    int i, irq;
> +
> +    for (i = 0; i < XLNX_ZYNQMP_NUM_TTC; i++) {
> +        object_initialize_child(OBJECT(s), "ttc[*]", &s->ttc[i],
> +                                TYPE_CADENCE_TTC);
> +        sbd = SYS_BUS_DEVICE(&s->ttc[i]);
> +
> +        sysbus_realize(sbd, &error_fatal);
> +        sysbus_mmio_map(sbd, 0, TTC0_ADDR + i * 0x10000);
> +        for (irq = 0; irq < 3; irq++) {
> +            sysbus_connect_irq(sbd, irq, gic[TTC0_IRQ + i * 3 + irq]);
> +        }
> +    }
> +}
> +
>  static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
>  {
>      static const struct UnimpInfo {
> @@ -721,6 +742,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>      xlnx_zynqmp_create_efuse(s, gic_spi);
>      xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
>      xlnx_zynqmp_create_crf(s, gic_spi);
> +    xlnx_zynqmp_create_ttc(s, gic_spi);
>      xlnx_zynqmp_create_unimp_mmio(s);
>  
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
> -- 
> 2.25.1
> 
