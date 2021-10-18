Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2890059lfc;
        Mon, 18 Oct 2021 04:24:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY13yvGIDy/6uoREg+DhG4G3AXKIMHp2HXDor/UyiGkinVk8O/V+zIYfRYVlo/K7+v/KSi
X-Received: by 2002:a67:d48a:: with SMTP id g10mr26152687vsj.3.1634556298855;
        Mon, 18 Oct 2021 04:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634556298; cv=none;
        d=google.com; s=arc-20160816;
        b=A1A9xAYsd7fn5E6m4AbtXOiNk4nvdXuo5+SU96PC8Q66DGpxAZpUGUZ4uMPrz3y7+K
         L+m0owjo6D0UI2bo+awi7MG3Ek90GA5T3vKz1KFysO6U4su96U+Xl1NDyNaI3r6DPVUv
         5UyYVCglPAWq3jtfbyivtL+2Pwa+Yhx2xFjXu+JJWKh2xzK28J8GC0ooRyA9GoVUt82j
         7d3yEtZw9hA0blTUcNlpA3JE66Sgm2aWqpl+TQMvE3todU7A3Ck4SmuSFaPOvF+SSwgK
         NGoSIQ3riIYxBeJVJ8fi3EYN874qRoU86zYJzdmFQ8jA7TbcRaxrWxixJZzek0R5KLM6
         RxSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=qUlcCqen1IZe73bGFd/HmIsGdFed/EX5BIwY/7EJN+E=;
        b=aS5WITjYwe1LM7Sde0ARptfx9SBo44cGVZD2zRTGuIKTvHH5Lvm/sv/YDA/OlMsAQX
         pILTbwrDmpijgqoBOatq6rv3qC+sJB6ighgm4OnftL9JczxhsWA/iH33mo7BZAj59s4O
         izWvHk405iJ0tCvgnRX0IHjC5L6L0eZ39afbiAOwmTGxElhx8lnBfEVsm5QQYTjxrixV
         ec6ePqCVT7qyCHXiM3/uyPV+qedFk0ZBkV9zowre0eF+23gSZ9j2XcQhu5kUp8//sk4d
         8rvd623BYpKgww/Epfqc4m9cQ8HyjB/Yk7cmh9iaiY4CZ5bkH9smhkfgjLgyJzbTo0Oi
         DPKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZVtgM27z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si11746533uam.149.2021.10.18.04.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 04:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ZVtgM27z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcQlG-0004i3-4G
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 07:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mcQij-0000cX-1U; Mon, 18 Oct 2021 07:22:21 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:34529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mcQif-0008O4-Q1; Mon, 18 Oct 2021 07:22:20 -0400
Received: by mail-lj1-x22c.google.com with SMTP id 145so8363873ljj.1;
 Mon, 18 Oct 2021 04:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qUlcCqen1IZe73bGFd/HmIsGdFed/EX5BIwY/7EJN+E=;
 b=ZVtgM27zAWvmbDvYdZY37xGdyavkq93CvD27KMKzrEXWr0d6xCcBE9uM6rLsNrRJAe
 TuKNowd4Q8glHnrTAAdU6L0aFDVXiqzDEoz4jnRIGbNSrviojPCfDlT4i8/cD+g/1hLO
 CL5o2k1vkmztqmkw5gyt8G5O5hpLxUf9ymtNRlzEje7tldrlW4VJz8T5JN45gskV2Jkg
 kdV9reoPsXHIDLI62C0HRmcgHkreFqWMOhd7N5R+JYDm7Mwi/U/Zwfd9GkXYGiLX1+I6
 agorhYIg9ZsVOsUmi3iXb19NA9iCiS+6YRIGUwYukL6XN6vaFN0CPHMGtWyWw7POUhhT
 CJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qUlcCqen1IZe73bGFd/HmIsGdFed/EX5BIwY/7EJN+E=;
 b=mJxAsQmHtoanFhGpj7S2UcUebSbJQ+6enoInjHTzGkB61LDyCV9hivdmIXv3rOdRLF
 DS0Jxr63sS/rYjCCOjv99WcdcSilVTQdvjID1AD8czzkOCfIH16vEDq+OnDzzumLWm6L
 x17nKaPGJ2xj9ISF2k/LD4k/XIonYdcXfhngNQdl3cbwNHFC3dQwDcDffRU2Y0Bln9R1
 5WQ76Bx9iaR9dFlfaasnhJL0FB6ekBvzhdkwdYuzfe2EaGBtzQirwn7i5wSiT08zqTDz
 SRR/RjnzydqcBDOc9z28T0XZfflMJupjBJDt9T/BXnQFIKC13HuH6cXzmKq0PpWtOukQ
 flAQ==
X-Gm-Message-State: AOAM533WjIC+gdYOnzbcNIFYGmpA82it2i/hxigOvcz1Rnm/4Kwl8tmk
 WM3ZLskqIzOsI9eZJxklOvE=
X-Received: by 2002:a2e:b618:: with SMTP id r24mr32408680ljn.414.1634556135790; 
 Mon, 18 Oct 2021 04:22:15 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 f4sm1378935lfr.43.2021.10.18.04.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 04:22:15 -0700 (PDT)
Date: Mon, 18 Oct 2021 13:22:13 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [PATCH 3/3] hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse
 device
Message-ID: <20211018112213.GE23846@fralle-msi>
References: <20211015203532.2463705-1-tong.ho@xilinx.com>
 <20211015203532.2463705-4-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015203532.2463705-4-tong.ho@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: opzqq6efcthM

On [2021 Oct 15] Fri 13:35:32, Tong Ho wrote:
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/nvram/xlnx-zynqmp-efuse.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
> index 1f87dbf988..228ba0bbfa 100644
> --- a/hw/nvram/xlnx-zynqmp-efuse.c
> +++ b/hw/nvram/xlnx-zynqmp-efuse.c
> @@ -434,11 +434,12 @@ static void zynqmp_efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
>      if (!errmsg) {
>          ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_ERROR, 0);
>      } else {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_ERROR, 1);
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s - eFuse write error: %s; addr=0x%x\n",
> -                      object_get_canonical_path(OBJECT(s)),
> -                      errmsg, (unsigned)val64);
> +                      path, errmsg, (unsigned)val64);
>      }
>  
>      ARRAY_FIELD_DP32(s->regs, EFUSE_ISR, PGM_DONE, 1);
> @@ -448,6 +449,7 @@ static void zynqmp_efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
>  static void zynqmp_efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
>  {
>      XlnxZynqMPEFuse *s = XLNX_ZYNQMP_EFUSE(reg->opaque);
> +    g_autofree char *path = NULL;
>  
>      /*
>       * Grant reads only to allowed bits; reference sources:
> @@ -538,10 +540,10 @@ static void zynqmp_efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
>      return;
>  
>   denied:
> +    path = object_get_canonical_path(OBJECT(s));
>      qemu_log_mask(LOG_GUEST_ERROR,
>                    "%s: Denied efuse read from array %u, row %u\n",
> -                  object_get_canonical_path(OBJECT(s)),
> -                  efuse_ary, efuse_row);
> +                  path, efuse_ary, efuse_row);
>  
>      s->regs[R_EFUSE_RD_DATA] = 0;
>  
> @@ -731,9 +733,11 @@ static void zynqmp_efuse_reg_write(void *opaque, hwaddr addr,
>      s = XLNX_ZYNQMP_EFUSE(dev);
>  
>      if (addr != A_WR_LOCK && s->regs[R_WR_LOCK]) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s[reg_0x%02lx]: Attempt to write locked register.\n",
> -                      object_get_canonical_path(OBJECT(s)), (long)addr);
> +                      path, (long)addr);
>      } else {
>          register_write_memory(opaque, addr, data, size);
>      }
> @@ -784,8 +788,10 @@ static void zynqmp_efuse_realize(DeviceState *dev, Error **errp)
>      XlnxZynqMPEFuse *s = XLNX_ZYNQMP_EFUSE(dev);
>  
>      if (!s->efuse) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          error_setg(errp, "%s.efuse: link property not connected to XLNX-EFUSE",
> -                   object_get_canonical_path(OBJECT(dev)));
> +                   path);
>          return;
>      }
>  
> -- 
> 2.25.1
> 
> 
