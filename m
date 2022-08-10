Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3743649ejf;
        Wed, 10 Aug 2022 05:41:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5wi5UeCsXEp2P559ZIql8T4f8564N6IPDz6mOWE7veHg/PqcFAWZokn4DpUuUWqde3HjSQ
X-Received: by 2002:a37:8a43:0:b0:699:fac5:224d with SMTP id m64-20020a378a43000000b00699fac5224dmr20439811qkd.599.1660135271476;
        Wed, 10 Aug 2022 05:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660135271; cv=none;
        d=google.com; s=arc-20160816;
        b=xom5KTY+VEJX0EFRjfbTiZWGcKvS8SwGHDQD5/SUiPNLbBUVoLLzSuoromvEaBykBe
         kRrSirRDmHwPj/RtMzjo6poKqmnA9tS8/HDdEQ4ahdtBsUIe7sYTVpNneYTQcvafJtqV
         vddCDrLPeafjUB1QvsPqddftdqmoVQ+YUiTI9hNVlVv8XM98vimcCWsek7cbckV8+aVv
         6oXyJrruw2EXqUR8IMtG/lch+v5htFkHfhHeDzkLy154eB6oxAt08x4+AzFt1eFb80Nc
         3WuwRCByL4JgQNRrI3i06ILtHFIt0bRgEo0HYRVnJNNrh8kEjzYlVa2FLp/4h66juI5S
         AHkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=YwtBVSDaKQeD+dN5ZmEHae/j9nsXNIDRS5w7dEnlKtY=;
        b=Aijpoa/4qDv+S6GXsaPTCXX5uMKWQoMhvHiorzLo4s0tG6LG9/Jvgkjtb9sYKrHOVv
         heBh2LxuVFi0O7itm4pbv7GJmNu4y7NtRjB4/9AG5LrfZJc6RammYOjUszLINK6PHCH+
         +fwW1DMno5qwIMl1cJhuvg2YCwufP5puSjT8I6pnyQTib+5DVlpZAiiC/AtF5ZHKcsCg
         fYZ8LcRgPJgE0a239H/kLEic3nFVuOLcc0KLcP98u4fTHv39wYuuxqeyivLoxQDrvN8K
         GWmNfQuFc3xumG9aMb+6d8KFLqp/f0IDUn8IYSqsM8hmhPVLkQI3x7Uu72zxBvK/okAz
         sosw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ZqRnYZM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gh6-20020a05621429c600b00474527d9145si8655465qvb.146.2022.08.10.05.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 05:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=ZqRnYZM3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLl1K-00068K-Uo
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 08:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkvp-0001c9-7b
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:35:46 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oLkvn-0004Np-O6
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 08:35:28 -0400
Received: by mail-wr1-x429.google.com with SMTP id j7so17624610wrh.3
 for <qemu-arm@nongnu.org>; Wed, 10 Aug 2022 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=YwtBVSDaKQeD+dN5ZmEHae/j9nsXNIDRS5w7dEnlKtY=;
 b=ZqRnYZM3W+kmRmGp+0Z8uJjsNreHR5DeAl6HqYfJqUZO6Ybi1NeWbJg2iTk1vrkyDX
 vprkydeEIzmmGBuOfYoGlj0M3FOgBGOxOPeCLu+dnVi9dFBPKQ4WPnSbVFU1hkXbmBWs
 YkWCwc123NTrNfvpiFOsP79khSdQ0kwb8JFSlCuuauaxdtZYot+NH41NhL3h+PkcN+0v
 98P/0zhFEh0McodrG2vQHKe9WSN/Qiqv4bm7OEYPRmIlk5eN13KXFpYD1W8m3TW7sQse
 xld1/85R1+MlfSSpQlxStyu7SHme5uLWaqJoolJc+u9yA6Z76HdIpCY0+h8KGGlhmgfF
 y0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=YwtBVSDaKQeD+dN5ZmEHae/j9nsXNIDRS5w7dEnlKtY=;
 b=7FPRHBYekJiTqxf1iDY749sXbs1ojjUXmaPzSLrKfEnjE19Wjj6GdC/xN/d4urLOf7
 G2fdfkx9RfkPnbSRYXE8oKd5lNMB6wevbmE4HdU5bvCv5iFHdrGySw9hHEAXrmGQ2SRG
 byf/dUthjKVTTS7wwRCOXLwkqVOXtP8cSnC+Gsj5SknU9oSs9ytsWPzQBLwGcraEBnPQ
 q+VkXLWd92rB6dCvxGx4NjA9UFhjE33KocuHko74eA+XeRLUn5dqo0Zi629hZ7xUdNA2
 v+zn+UpRCqM0EJKmWxDGLIa6ll3bEyJTNiK725yBRDaBSxnUZKwdmr+O2fP+uYBkeGw1
 /OLA==
X-Gm-Message-State: ACgBeo3wonlLlb0moH1TQPDqKYfSkSQHkJOS4U5T4Zw1gBrrOxBAyBrJ
 IEB2Rm9EOP9zUPysMTtUT7MNDA==
X-Received: by 2002:a5d:5483:0:b0:220:6b87:8f79 with SMTP id
 h3-20020a5d5483000000b002206b878f79mr17554240wrv.17.1660134926304; 
 Wed, 10 Aug 2022 05:35:26 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b003a319bd3278sm2474717wmq.40.2022.08.10.05.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 05:35:25 -0700 (PDT)
Date: Wed, 10 Aug 2022 14:35:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 4/6] hw/core: use qemu_fdt_setprop_strings()
Message-ID: <20220810123524.2fgqfsr4vrrjqjke@kamzik>
References: <20220809185639.750345-1-qemu@ben.fluff.org>
 <20220809185639.750345-5-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809185639.750345-5-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KzvNZni9NnCI

On Tue, Aug 09, 2022 at 07:56:38PM +0100, Ben Dooks wrote:
> Change to using the qemu_fdt_setprop_strings() helper in
> hw/core code.
> 
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---
>  hw/core/guest-loader.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/core/guest-loader.c b/hw/core/guest-loader.c
> index c61ebc4144..7b8e32e06f 100644
> --- a/hw/core/guest-loader.c
> +++ b/hw/core/guest-loader.c
> @@ -56,18 +56,15 @@ static void loader_insert_platform_data(GuestLoaderState *s, int size,
>      qemu_fdt_setprop(fdt, node, "reg", &reg_attr, sizeof(reg_attr));
>  
>      if (s->kernel) {
> -        const char *compat[2] = { "multiboot,module", "multiboot,kernel" };
> -        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                      (char **) &compat,
> -                                      ARRAY_SIZE(compat));
> +        qemu_fdt_setprop_strings(fdt, node, "compatible",
> +                                 "multiboot,module", "multiboot,kernel");
> +
>          if (s->args) {
>              qemu_fdt_setprop_string(fdt, node, "bootargs", s->args);
>          }
>      } else if (s->initrd) {
> -        const char *compat[2] = { "multiboot,module", "multiboot,ramdisk" };
> -        qemu_fdt_setprop_string_array(fdt, node, "compatible",
> -                                      (char **) &compat,
> -                                      ARRAY_SIZE(compat));
> +        qemu_fdt_setprop_strings(fdt, node, "compatible",
> +                                 "multiboot,module", "multiboot,ramdisk");
>      }
>  }
>  
> -- 
> 2.35.1
> 
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
