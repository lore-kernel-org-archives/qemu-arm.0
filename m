Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3827636ejb;
        Tue, 21 Feb 2023 18:35:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9rFh5EOGTTwwoFO1qZO9NllaL3VK1dEFfg4RW80/z3B8XkmkUDz1jg0+a/JhWmCapIwSZz
X-Received: by 2002:a05:622a:592:b0:3bd:7a6:67b9 with SMTP id c18-20020a05622a059200b003bd07a667b9mr10854250qtb.29.1677033353851;
        Tue, 21 Feb 2023 18:35:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033353; cv=none;
        d=google.com; s=arc-20160816;
        b=PHtR0nMXHucTHRI/CGQGK1C/GwpbwuceNGsu90XGBQ8ZKC3/xUiOTqMX+8LghLKJ48
         U4bXAjEao4FLh2RjX1Ear4RvS8ePWkZMOBgLDwnPfUunURMxYWtKhp1tHaURHRTKSoN0
         7af6CarxNJuAjof+DZ0GbVjVSUy4D6ttnnimO6h93rhcwKh9EF+ntn598kcDA/Rc3fmz
         H3Nisr3Vy8wp1P73/MpAApKi2l7bxVfhE5JyHLidDVDwOGUb5du7CQo0FvKO7fUKwvnU
         H26aY6ZRrsSsChh7VwuHGTFGtLfO03XEoIfgJVgHr2Y9DjVwchqAkgu5B/IKYgkFcmnJ
         RHAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jhdYZZcA+QihWdoYLAkQ3l5owX/qDX7C/pLuLVYgynI=;
        b=bXpvVBXA66Fs0h1yzg0lE/8zRXkVxCFzgXEbxzGcS259wAtJXWo+gbUO8y9W0+nwyO
         LCxQSeIg6d+GCE2eCqwJQEuA5VXGCX7fK+/GYc2mBb3yJrw5rswbDokkwUxYjBzyF4ff
         uQqMjYoW+fzz6KZFG8yygkcl1HN3idpRK8UkJfoHdbAUAhlUMI/Lw51KaylJs4yDCQE3
         76sTQ4spThIeCj9LWb9g/C5wyvpvJ1/No7MStw9/1GVHF/UIpcrGtldV6eSEcOPsGjtF
         aKK+YMwyu21ksNN9FWGUaZt9LGOpKz23IaiweIOOZBta6SebXcJ6h7zky9S3/tjVH2sS
         /cGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sFuMbbqK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a05620a24d100b007389c641884si13899926qkn.396.2023.02.21.18.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:35:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sFuMbbqK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexN-0007U7-1v; Tue, 21 Feb 2023 21:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex3-0007JH-GO
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:50 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex1-0001aS-Uo
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:49 -0500
Received: by mail-pj1-x1041.google.com with SMTP id pt11so7906699pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhdYZZcA+QihWdoYLAkQ3l5owX/qDX7C/pLuLVYgynI=;
 b=sFuMbbqKDsHUnhkyXGAU36DJ5Z8J6UCbNI4zZrm/FEGgyBm8lXkxW30ErX5QoUWAiC
 Gh20cwwJFl76iDDcqbLRJ6Q8oErdAYhF00UhfBjUnvppAFvqXp1GsrnLx4No7yBVcZi0
 6JIYFrGqo9/B/ZTDl8osPtF3IkJ8WA5PNWTgOduMjTY0RdTLp6PgqZEYQpya0LCx2Wqi
 GS+xTSWXpwjNkmXAJm7mGaXJ9pvmDSoqYR70wRhj18gkwkYk3lyyJYX93jDDkm1fJqxx
 Yw56EJWCx7nd4Nufjs9LVeCPdGSAXv6X7dTdPfWlpOJz3Kyzy5deEdR24B73+4TL8C9P
 b6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhdYZZcA+QihWdoYLAkQ3l5owX/qDX7C/pLuLVYgynI=;
 b=pFwud1eFFhcghnwiFyu9/uHEKniujuwipAY2vjSsmXPy3JHnxrh8m/dBjq3WC4up/X
 01nCKEc1nHknmMLlJZPBbyix9oOGl2Lgs0u8RJCnN3GsGuN/4hQHYkMaIlES6bK2qN5f
 Gm8VZE6TDzXaTZO0FYKGetXiQJCugce9SPvP9uTgUjHJx6ENOX5jmwIkE4ZxEtJPdVif
 C9LkdTwDlKjaUYnCZVAFm4VU2OgL7AOXX4UzKH3ZOuShd0b711ptbim9ew2x6xJGiEZV
 bPKiyFY+aKB4MqfzMtbtYja7yC8rsOEwbKCZFlasDDpxStbXI93SRGiYA+BR6tivnq5Z
 zxkw==
X-Gm-Message-State: AO0yUKWjJOPRnV3pubaiUPpoICfDGDT9UehlK+Jh9aNSM0JHLTqolZ77
 zTXQon1ID6086MJL7Svx+xQB9pMtI23uC6KkyElk8g==
X-Received: by 2002:a17:903:11cd:b0:19c:32a6:a362 with SMTP id
 q13-20020a17090311cd00b0019c32a6a362mr9723313plh.6.1677033226573; 
 Tue, 21 Feb 2023 18:33:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 05/25] target/arm: Add isar_feature_aa64_rme
Date: Tue, 21 Feb 2023 16:33:16 -1000
Message-Id: <20230222023336.915045-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LhKItKKJLora

Add the missing field for ID_AA64PFR0, and the predicate.
Disable it if EL3 is forced off by the board or command-line.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 6 ++++++
 target/arm/cpu.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cb4e405f04..b046f96e4e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2190,6 +2190,7 @@ FIELD(ID_AA64PFR0, SEL2, 36, 4)
 FIELD(ID_AA64PFR0, MPAM, 40, 4)
 FIELD(ID_AA64PFR0, AMU, 44, 4)
 FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, RME, 52, 4)
 FIELD(ID_AA64PFR0, CSV2, 56, 4)
 FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
@@ -3808,6 +3809,11 @@ static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
 }
 
+static inline bool isar_feature_aa64_rme(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RME) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 876ab8f3bf..83685ed247 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1947,6 +1947,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
+
+        /* Disable the realm management extension, which requires EL3. */
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, RME, 0);
     }
 
     if (!cpu->has_el2) {
-- 
2.34.1

