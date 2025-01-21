Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp154259dlq;
        Tue, 21 Jan 2025 06:27:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhU1b2IEd4vW0A6bWyDqutQI0y0fYF/QFCKt7dRDFhpPtz8swEoF3tPDr3aApmOgfYP6sJH5HYzZ1Dxw==@linaro.org
X-Google-Smtp-Source: AGHT+IFw+2QSXQX5eZCkVP75uWMhOpXngeYqPzZa7WUNmyGvmDwS3/86zK811YPzuFsoqc5gpuhz
X-Received: by 2002:a05:620a:2603:b0:7be:3cec:ec4d with SMTP id af79cd13be357-7be631f4c89mr2259035285a.24.1737469651445;
        Tue, 21 Jan 2025 06:27:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469651; cv=none;
        d=google.com; s=arc-20240605;
        b=k6+9Vg+tdprhHkHMqWjp2CvrFi4tr9X4RjVk2bPjGm0mlmdBwnsblnepPLPm1JC0v/
         gTX+5NLO8cAvu5bx8VRE/nraj80YI6BPCVaIHkL2jcvLLym0HNAWygcfeol/GyREP9ew
         5qCBqoVIEQZlXwtxUXj2EVmArSfjUCYeBz121/RQzJRGulfb6SmaIkStRsM7f1zRB/SN
         w90A1o4N6v12xSiXPw14SVDxWAcRZg+CgYqm2nWvUItwkJaCNvPAZEbafN+EyedRINoP
         nzWwseaYrTyidMCkGeePsvlGLRooYEu1ZvonWzSvGlDKidtAsVML/tylyEYQBwy6AbqG
         0zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B/u41E4nMIW/k62qEE4hRVrm65mo7EuY+EqapQU9Sik=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=byK6eQkbgmHLU159Td/IHT81ofUqviKAgRKvXrSTgI1MJ6n/NcJx2IfHBLh93Y5yvF
         D5ocfgB4+6HInziFxguyLS2G4YhyUyPHuv29yVk932x0I3t4DQ/ce8OZ3d55DJtEq3DW
         r0Mc2IpzTXVffUujmxGJ6I02HenXL20tuAAvllP6tqEA6Mt9g06h+HNGsLZRMTyMhPe8
         SyoW/UgBx62NYpQ245hT6QQZiC2gC5brQD+lmk/IOh3YRZ9DDrHb6mP2ES7DGv8wK4Yt
         7zq2DWTNMvHgk7U2GDM4Vp9btMU+7sHqJMH3pwueDsUXgiuhCbqFeoZA0DNVdJYQ1Owc
         Dyrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZTD6XLFK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614f4f0fsi1257820885a.598.2025.01.21.06.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:27:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZTD6XLFK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFBF-0000pJ-DY; Tue, 21 Jan 2025 09:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBE-0000o4-3m
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:36 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBB-00039y-Gm
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:24:35 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso4678806f8f.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469471; x=1738074271; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/u41E4nMIW/k62qEE4hRVrm65mo7EuY+EqapQU9Sik=;
 b=ZTD6XLFKLcto8WNVSAU+8MjLWrJnrXwXz+feujfbhtqTXLRiSm2Fxr9/04+x2ygort
 Ob+cgcDlmTlXBC9lidhRWuRinwKnd9mNswoPASyV0mZZp4f9elbT0vxlvQlw7kwSqJB6
 EU1CrIE11cE7s4MvIehYcDaBi9OeF924Q7tjz0sXDn1/KShvLPuvi7fhbJ+B20tgGvit
 N2CEmVP8CBz0UxqMGZhR09wti26dYkQLaQc03J/+LJWCBqiLWTimP5b1MPZKY7S9zEUB
 zbKy5ndsNT7D80PTW5HsJ4F2EbIUA++PQld3fLfRy92zgW1ZpekNXoIM+56Di9/M+CPm
 eOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469472; x=1738074272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/u41E4nMIW/k62qEE4hRVrm65mo7EuY+EqapQU9Sik=;
 b=WeFLCgh5oRTXizsXt2+FVQ/uEUfXh/RiSW0x0DEHbW0X6q+3umeNzfRzhXculnDra7
 zj8U6p0NI+IN+njTSIHqmV8f5Kk/yZU9FIIdNP3ZA6ZEj9KLZjTFq+tbmWOfGODy3rdZ
 c3lDM8bzS2EPRbjaRO0vHAPttENchqY0r7EsBWed+0P1+vxrzVJ6S0ML1Yl8FKBapngT
 dIQypGokpLWbbyZLV4ZCVRxR0gzTvmYxUpK7FfEyltz7BxnJIp2PjoPp6MokiiOesTfe
 wekQn0ejRLYc8nQPk5PWV8ShbmDZyCoTJ5YfgbLenOdp/F8/BUI1MFE89n2udCWILwNG
 bPyw==
X-Gm-Message-State: AOJu0Yyg0xnvhi+bGJ2/aX7UJ8G8M4NAY3c9zFdK8VvMxZ8/m2EUEQnR
 biD1mUvGf1HDuYSwwD/olCOfIzRFguvpBShit0caqeNY3YoHTu4xqRs8azx3X5E=
X-Gm-Gg: ASbGncsYTtZ0bgoZ35dyynW/tGMRDYu0xxZMvTgASBZ1BfvMLK3BWyNmunn+h0E954B
 X4fnxbvOe4wfQrEGHiShz3gBEfzkJLZHkY3sr3GiXVVQvDgWQ62Hg5f3uQvzPTFXrsjIj1NRw/V
 WPqvIWAFVuh+ftjsdomDXeH6CSJyqFv1vAnVPh8xRJ5qbBUMsvccJNbl7v7g1++26ypT5k7WdLx
 YRsTZ1EheGiNgOFbuzMV0OLbZdch0c9DevlfwKq868Y6hPfCX/HWM0SPiIzjpCOhFxpp/kzKpyd
 TCrSsSYouauSqnhAL1yukhqvYWZXvjNplufsPI+kqhES
X-Received: by 2002:a05:6000:144e:b0:38a:88bc:d57d with SMTP id
 ffacd0b85a97d-38bf56562e1mr14596922f8f.2.1737469471577; 
 Tue, 21 Jan 2025 06:24:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389040854bsm185820005e9.7.2025.01.21.06.24.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/28] target/avr: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:23 +0100
Message-ID: <20250121142341.17001-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: O9fF//nt3okp

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/avr/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 8a126ff3222..8712813f3e2 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -200,6 +200,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps avr_sysemu_ops = {
+    .has_work = avr_cpu_has_work,
     .get_phys_page_debug = avr_cpu_get_phys_page_debug,
 };
 
@@ -232,7 +233,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-    cc->has_work = avr_cpu_has_work;
     cc->mmu_index = avr_cpu_mmu_index;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
-- 
2.47.1

