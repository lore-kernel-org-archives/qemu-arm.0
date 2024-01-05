Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp842493ejo;
        Fri, 5 Jan 2024 09:05:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqYaOXrSBSCVXy8tKEpGqy69pYihBB9kSUn1WZ86kxWk05G0eki+ZaD+1ccgfFUDjmx3dG
X-Received: by 2002:ad4:4ea5:0:b0:67a:9836:fcaa with SMTP id ed5-20020ad44ea5000000b0067a9836fcaamr2487156qvb.23.1704474358936;
        Fri, 05 Jan 2024 09:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704474358; cv=none;
        d=google.com; s=arc-20160816;
        b=plJAxKFwB0Kb5U8ps03WQjhBHTwTeuGJKyF0xQngUwd9btb13p/wHN6c4c77mOjjJ4
         Esh+NxtcVAaF6ahYN4WPDvP6AH/9anx7M58eP4HZrLYCD17EkipxCfmqmwMioFOxHQG6
         6C31uC9RXggmVzrKZHHPYWm2bJrX3u290tr7Lvrord0K2OhBmr/kFSjpmBUKkFB4eTiI
         acSc2BlE2J6MUeBiCU7zCKLyhg3ciRl7XWhLe5NCCS9UzM+vYGLN1j0O1WWArneKgF99
         6vk2erR0xSaiTKoevApoATv53L7VwL77gc1o18rwNEfxIf9pHkpQoyga3dRfnD6k8pd4
         XZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aEKJmkt/kEh0jAkLCdfh1+fpI+Ncd11yrNhGOqJTJao=;
        fh=whb9EMpRFBCXgLLf7q1IbCRO5wVenswrFX/A4qaBwcA=;
        b=MY/lHRPz1DdZMD8RRARZS3KtDcrtsiJ4o/Fj2sXdkAG1GHdwt0ne8dcu+g6Tk0MhK4
         t83/tnwtRtsTHqGFDqJXUmqIFnpchvugTBrFO0pQee8wguPMylnAxH+uKidLmKwQzE7Z
         4iy7ZB5+y1sUVJQoQV4iRvq8BXsQv0lLEDqznwH4iUfDIjFp46ByzBirkPpmwCdlTWsD
         L3NP/tGeY4xzDcABOg1CJSQKkFbJ/pcyhVBGxu8yuxH72/qMUiiImZLVLsPWoWCriQUG
         XPtLigIAVC94SN0dnvKslaNQ9l+k5f2VQt+mlUZn34MN+IaLOD1uOqgqiOfjrLvG+xRG
         GrMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MogocZ9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28-20020a0cb35c000000b0067f753c0f73si2225056qvf.278.2024.01.05.09.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 09:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MogocZ9b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLndD-0007uq-VQ; Fri, 05 Jan 2024 12:05:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLndC-0007ud-H9
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:05:14 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLndA-0005QK-8G
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 12:05:14 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e3ab65709so5181135e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 09:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704474310; x=1705079110; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aEKJmkt/kEh0jAkLCdfh1+fpI+Ncd11yrNhGOqJTJao=;
 b=MogocZ9bwYR+2NE7ubyx9IQJTk/rqodPdS2872oCx0LPBs+5WvAK/Y4FaAyJEwi8w3
 n9l7Hzpmx6/FLzBHQcWHQGaGZo+FljbNg6Q56SWgH7UDYpiZZmWBPplMfRHTOXyhfeTG
 Ecmq7FGSsIPAkwwhXLijx73OLk3iS6LAlsb/vQbE8DXO2R8MIZW8Ep0hqA8FR6DjBVtG
 DGp+pggwzptanAEsGI9Hh78w60kdGCQF7rO80x6OILypmuLRHt8ZEiLxXoJUUlrchEmG
 0yX7Mi53Ecf+gGLR17wjol1AbRddSdMvNAbiqwmnXV+pXSXW+4EMMupTUT+32rmqZidc
 +1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704474310; x=1705079110;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aEKJmkt/kEh0jAkLCdfh1+fpI+Ncd11yrNhGOqJTJao=;
 b=U4lA/i7Yvv1WO38G1/bcvlX/2pr45N17JftWL6Hl+BZwzvVwim/ElCflrmbHdqmdOt
 1zzP1G9fdETdG6xzAkC4gn3dhO9OT9vWw1LuFCX9WT37WgJGYzt0JiPd1PpXxu3jTWUz
 gzj4JcQRkRA/sCDsgFpQ9LnP55vOIXua/tH3WwfgCyAeXJYJAEWp+kKlBFlz3/2eBeIJ
 oyOIg48l/FAJR77vh+kPWjEx8hQG4shau5z47Wjvqtbab2Y8RWHiMp+iAHyoq9RE7o0E
 dHwV9742Vy8N8RADgaQ9UCo+H9glyB0/0J7WWtBz3o0/FoAZkc59z9tp0JGs3A7fMiKg
 VbaA==
X-Gm-Message-State: AOJu0YzVe0o+CIDvMJKWEjmv4atUo1KPwZMNrkrOfwCreFii3ZdwUkG6
 QNsMrS8XRmMvf0P6OGu0nifE7hNwuEGjzw==
X-Received: by 2002:a1c:4c18:0:b0:40d:7eb2:bf93 with SMTP id
 z24-20020a1c4c18000000b0040d7eb2bf93mr1384600wmf.46.1704474310418; 
 Fri, 05 Jan 2024 09:05:10 -0800 (PST)
Received: from [192.168.69.100] (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 fc12-20020a05600c524c00b0040d5a9d6b68sm2143198wmb.6.2024.01.05.09.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jan 2024 09:05:10 -0800 (PST)
Message-ID: <566d5a05-5cd3-40fe-b40e-8e82524d8ea6@linaro.org>
Date: Fri, 5 Jan 2024 18:05:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/71] HW core patches for 2024-01-05
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20240105154307.21385-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a0NUPL8WB/XD

On 5/1/24 16:41, Philippe Mathieu-Daudé wrote:
> The following changes since commit 05470c3979d5485003e129ff4b0c2ef98af91d86:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2024-01-04 19:55:20 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/hw-cpus-20240105
> 
> for you to fetch changes up to a318da6b3f6a88e6cfd6953c519def9457e8962f:
> 
>    target/sparc: Simplify qemu_irq_ack (2024-01-05 16:20:15 +0100)
> 
> ----------------------------------------------------------------
> HW core patch queue
> 
> - Unify CPU QOM type checks (Gavin)
> - Simplify uses of some CPU related property (Philippe)
>    (start-powered-off, ARM reset-cbar and mp-affinity)
> - Header and documentation cleanups (Zhao, Philippe)
> - Have Memory API return boolean indicating possible error
> - Fix frame filter mask in CAN sja1000 model (Pavel)
> - QOM embed MCF5206 timer into SoC (Thomas)
> - Simplify LEON3 qemu_irq_ack handler (Clément)
> 
> ----------------------------------------------------------------


> Philippe Mathieu-Daudé (37):

>    backends: Simplify host_memory_backend_memory_complete()

I neglected to run checkpatch.pl on this patch, so it lacks:

-- >8 --
diff --git a/backends/hostmem.c b/backends/hostmem.c
index 30f69b2cb5..987f6f591e 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -346,5 +346,7 @@ host_memory_backend_memory_complete(UserCreatable 
*uc, Error **errp)
      unsigned long maxnode = (lastbit + 1) % (MAX_NODES + 1);
-    /* ensure policy won't be ignored in case memory is preallocated
+    /*
+     * Ensure policy won't be ignored in case memory is preallocated
       * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
-     * this doesn't catch hugepage case. */
+     * this doesn't catch hugepage case.
+     */
      unsigned flags = MPOL_MF_STRICT | MPOL_MF_MOVE;
@@ -365,3 +367,4 @@ host_memory_backend_memory_complete(UserCreatable 
*uc, Error **errp)

-    /* We can have up to MAX_NODES nodes, but we need to pass maxnode+1
+    /*
+     * We can have up to MAX_NODES nodes, but we need to pass maxnode+1
       * as argument to mbind() due to an old Linux bug (feature?) which
@@ -393,3 +396,4 @@ host_memory_backend_memory_complete(UserCreatable 
*uc, Error **errp)
  #endif
-    /* Preallocate memory after the NUMA policy has been instantiated.
+    /*
+     * Preallocate memory after the NUMA policy has been instantiated.
       * This is necessary to guarantee memory is allocated with
---

Since the PR is already in the testing pipeline:
- if it get merged, I'll send a cleanup patch
- otherwise if it fails I'll fix it.

Sorry for missing that.

Phil.
