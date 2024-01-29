Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp1044179eja;
        Sun, 28 Jan 2024 21:37:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXDYYkEyVbz+v+WXeAmpMa/YQP65PV/7lt7qBNnbpKV2ybqILKqSRGnfV7gLNyuYOLGymB
X-Received: by 2002:a05:6214:dcc:b0:682:54bb:f65e with SMTP id 12-20020a0562140dcc00b0068254bbf65emr5755161qvt.83.1706506679332;
        Sun, 28 Jan 2024 21:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706506679; cv=none;
        d=google.com; s=arc-20160816;
        b=B0Pfpcg71nzHn9oFz3l++yq9O2mNor4Ollxbpo6ga5oHgVu+EESz1lydgTBeI/zRS1
         VWdM5189HQbx73gEXI929lnjqbC23eZXV8yqCWK6qzRSCxN/mbTkclAp5/xc7NDKmRCY
         ToJrBCEhyshJTvntlPMtOQ7ruLvdpNz7gjoAFkKI2CZki8LaBeR9UOfNM4Gml7lu5h+K
         vXhC2O2izpQRbTH1wpN4WzfhAV6TrLV1wMQgVa43/NjQ8sAe0PgdvzGaKS1TvF5VPTYx
         3+KS5CR0HMFr4P2OVCuW2tijizxbXlltPsyiOMGSC/ycM+TNL2O1mFB+AZiPxrRZ7N18
         YgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=VermG5Cfc8w9LGkz5KR8XRJjuHmOTA/Dq8nZBQyLotA=;
        fh=aMq9oiRNAyxXNrZUlR8FI5c+BCQNfdDPJO+mo//LuFI=;
        b=Ie4kRCKlZtPZkx8+enV8Y4Hm4X6gi3JQcL+WQSahOMHUZcYn+/vwN6BrdYPFsPPXHB
         bJBNynYd4kN+EcPJOtlPrXFKrvkApc7dnmNQLr2pe6Z4IcMrbUIjtL+uVgOHO0jgAjdj
         ijbNHdsd/v/UkXqaRF2mVQFzz/JseqE/H+jrap2j/KedQ73Iuk3SbC3NlBm8Q4Qv9cAG
         7Iiak9ZluWE1tvWYFAbvbR+OmFBm4cExpiPTonAlipwmyVj1ngaLdVaFFEgk+ngH4S6a
         E/PET7AqglFQbfrLg06IjprgHpGcDbFPStH9tD6d0WLUdQ6e5wRkradGK6a68xHB5rnW
         mGSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=JJ7Af56+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a05621420c400b0068c46b80c08si2814294qve.141.2024.01.28.21.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jan 2024 21:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=JJ7Af56+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUKL6-0008PZ-HL; Mon, 29 Jan 2024 00:37:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1rUKKt-0008OY-Ms; Mon, 29 Jan 2024 00:37:37 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1rUKKr-0005YT-Gd; Mon, 29 Jan 2024 00:37:35 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6ddb807e23bso908973b3a.0; 
 Sun, 28 Jan 2024 21:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706506651; x=1707111451; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=VermG5Cfc8w9LGkz5KR8XRJjuHmOTA/Dq8nZBQyLotA=;
 b=JJ7Af56+17bazm/Nb8gjScdSbdzwJKDxf4CVF2zkIOfN+cMjeewxkXSKmNK8wMMvx3
 2ZcFPv+mZEXlewtn8zRKlhKIH1ky0dMmNO1V3f++Bu0waD6XlZhYiG+aLJUWyP5x2CvZ
 jtKPVUrpalu1RmguPXKfk5V1Lm3l7gdURs2xHoPR95Z+8KvB2ZEYL2bHGBL1pnk5bfuY
 nhJCmt93NFcRWmHC2mZWZ0OwdYpjqGgEJGt8UGLzFkYm8OwfSZr69o3YXPyPDSITwvPN
 ifSR74Dz+oMx+YPZ/o2bysESAKwtNl/uXGD+2yZG10e8TuRQGJ55AwhY5deJYY3hfSEy
 Br5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706506651; x=1707111451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VermG5Cfc8w9LGkz5KR8XRJjuHmOTA/Dq8nZBQyLotA=;
 b=jeOvQWBORZ8d5R4QPpXUaNWjKX6QhspZJX5QiW6ymFSysG/Wv0ZBeF8Mm/kvp5v566
 64oCYSx+GpuL/T9Zp4ez9eDRzH999FBizg6TesibuiZ8T8GFb0uaWFxoYwisCkzbG+8p
 /Tf0TCKBoOlERkVDDLkN78rlQQouit8YAJDDbYpQQ5ErlvnoETljxYa7JfE7IM947NV3
 vE70tsirDYg09o7gVGNZHiphMyAAB3LTf7Oou9y93hMgGSzMwdiXtOzQusgADtieW/A+
 zl/wJaS7ej4rJTMbakXgSD7/ZahCBZZ0dprlkulS5zLobqKc9uDubzdfTXVQpZsw5oxI
 PrVA==
X-Gm-Message-State: AOJu0YyCll4F8LbY4z7hdT7H5Oztk2EYhuhGlJe9AgugrqiHTgDgYWDG
 +Xp66R3H6KL8BDuiaqwDzvOGmdOUyq3p4XxOvXaX2yH83accLsS5VvwtBfGQ
X-Received: by 2002:a05:6a00:9390:b0:6db:de9f:5f10 with SMTP id
 ka16-20020a056a00939000b006dbde9f5f10mr1708397pfb.15.1706506651048; 
 Sun, 28 Jan 2024 21:37:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 fe8-20020a056a002f0800b006d9a9727a8esm5133541pfb.178.2024.01.28.21.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 21:37:29 -0800 (PST)
Date: Sun, 28 Jan 2024 21:37:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2] hw/arm: add PCIe to Freescale i.MX6
Message-ID: <22f96da3-7fa6-4806-989b-400e12dfb1d7@roeck-us.net>
References: <20240108140325.1291-1-n.ostrenkov@gmail.com>
 <9ee6eee8-2135-48f3-99a3-d572699fa4f7@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ee6eee8-2135-48f3-99a3-d572699fa4f7@roeck-us.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=groeck7@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gmZVSAxNDY4t

On Sat, Jan 27, 2024 at 11:11:58AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Mon, Jan 08, 2024 at 02:03:25PM +0000, Nikita Ostrenkov wrote:
> > Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
> > ---
> 
> This patch, with the "sabrelite" emulation and the Linux upstream kernel
> (v6.8-rc1, using imx_v6_v7_defconfig), results in:
> 
> qemu-system-arm: ../system/memory.c:2750: memory_region_set_alias_offset: Assertion `mr->alias' failed.
> 
> with the backtrace below. Any idea what might be wrong ?
> 
Never mind. I found the problem. I'll send a patch.

Guenter
