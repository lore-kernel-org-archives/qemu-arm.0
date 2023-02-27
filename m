Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5054840ejc;
        Mon, 27 Feb 2023 13:37:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8cqM0fP/89cpaekolnhnSLqp3IBuaY0KgAQioPnYdquU77Ykwji9k1Pjs9o9+4s4YguLqw
X-Received: by 2002:ad4:5e8c:0:b0:56e:9a34:4eaf with SMTP id jl12-20020ad45e8c000000b0056e9a344eafmr1547885qvb.36.1677533830919;
        Mon, 27 Feb 2023 13:37:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533830; cv=none;
        d=google.com; s=arc-20160816;
        b=fE5vEbyQuY1mvy24KcnXnTmhYurBzg6HmBeEtzCucra9r2Qkdc9QASFtjk1FlsUsCA
         6vT0Hx6NMvgLUb3/Tce0hpQ9Mu8EbTIVr4TKT2YOHfnlCwDV7z4HqtcyVAced7Zp7Byc
         XECblItAompDVQzdqfkcZoLzmMiDYoU+fbCB7Mp87oNdCN/N8tMU6cKOFcyzA7APNppw
         zVgXY0gGh/291gBZcksdNiAE7fG0RsTE6LcL8ljNsxcNIml0CaniD9Aa62SuXKuIWI5+
         mM7YJGr1XIX3fQTa3gqgtxL/JvrDYpvC7ahEXRvjK2r5PI+T4pQROCOM4CcR8zGMQ5V5
         Q9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=if+lkqRgEYOFjjmMSjmK1jVJBm0kqeclPvBFCVYME/0=;
        b=ahz98GxL/Clv33oDlOBs9JixMRcSdNOtbNsdliEeNhO7MLV2BXeAMPzMBGPK+8vBGY
         l+L7gXZq5iGizWrunuVCLDsRW6TmJWonTAlL9zK/Y7nFshh9NLyF5chTzh4ARm4PJT6y
         ySdA8kewk+PM9hGfvCDiR0iG3jePKt+2bArpVj90GxPPSwmtAXBrVbjfKS5O3OeehlOo
         +SzFk3z9Jb1VmbAaVcSCUJzfp3MsonMoLDpf5hL2/N1YvkpWp9Q1kugrHfvLEyqxCaBU
         jdKfyUObx7AXf6j6lj9YRoIbGGQXgSF6MN2jinZD3E82jEqdmgirBFT4n/MdOdIHkwE5
         DSfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CT1ILTAn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a0cdd07000000b0056eb47532bbsi7046081qvk.583.2023.02.27.13.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:37:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CT1ILTAn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWl7s-00077X-GP; Mon, 27 Feb 2023 16:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7q-00076K-CR
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:38 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl7o-0004GU-MD
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 16:33:38 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i10so8243833plr.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 13:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=if+lkqRgEYOFjjmMSjmK1jVJBm0kqeclPvBFCVYME/0=;
 b=CT1ILTAnD1amO22eHK1BQcBgxhXrdu/+lNurgh9Nu2rQHBY/8T/ZN+R4c91nDk4OXB
 ay8PAvj5ddmYCTuYAWT6nMYdEDl+usUkfQsluGpY+r6olhHUY5OerrHqCYBy4EPF8oo+
 QHBQmRPaARsstCvW8PtsnRJdMpY3uDdy2vCJ+Jn5ThPa1ZUaqdl1LgbasGrdj8sdkGPy
 vm+GFMb6its/8wvuJM53B92QqFp/svtfuxyKi7nWa7rXI7jZPESd9NIy5LPDsfvpfgZA
 GTV0DeRy1Z/EU7LNqaUZh89dNQvQrhvaBi0oJWWManQ1csuu+O6eCgevXjCCY/TJcaMk
 Q2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=if+lkqRgEYOFjjmMSjmK1jVJBm0kqeclPvBFCVYME/0=;
 b=JnIrJMDnCiqSaDrpMXnMuRIODqJGuPJZuoOZQodEktPaWMg7pUYC4j6U76pQElqhwP
 7rTQqtFqQLDiwJsWVMJUM7M1AMNgCnPjn2wxuktYSHxf2D80SS8R+WUFt5y/Mm4TMiMv
 BHeMt6gSl/kfAd+BzTFE3tfMY4vbatawvcVltqcJRRWXeqkc2fI7s2GkVAhYmlOymm9z
 fmpSeAQKwLZf/tMz1sOs8vaxUCREXneQfcbEFh57haLE0seYawffFm5dO5z10NLDBzvx
 ps/ICmD3B8VDDpdTBcE2xOBtyZIZvVSG8on6vYPFYiuJG5tAhmUbsdwAc3kBsb3m4b2Q
 roPQ==
X-Gm-Message-State: AO0yUKUWirQNzrPLfX4Ad4f4mmnNzWMI+gKFjwtWK/yGBY9TGRZUbOeN
 PrJS1sFRrCHG1Dt0YYM/Lsz+qqgA6X1xxJa54WE=
X-Received: by 2002:a17:90b:1e07:b0:235:31e9:e792 with SMTP id
 pg7-20020a17090b1e0700b0023531e9e792mr624458pjb.20.1677533615337; 
 Mon, 27 Feb 2023 13:33:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 02/14] target/arm: Unexport arm_gen_dynamic_sysreg_xml
Date: Mon, 27 Feb 2023 11:33:17 -1000
Message-Id: <20230227213329.793795-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eLe3+0OT3QNV

This function is not used outside gdbstub.c.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 -
 target/arm/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 12b1082537..32ca6c9a0d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1116,7 +1116,6 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
  * Helpers to dynamically generates XML descriptions of the sysregs
  * and SVE registers. Returns the number of registers in each set.
  */
-int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
 int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 
 /* Returns the dynamically generated XML for the gdb stub.
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index cf1c01e3cf..52581e9784 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -305,7 +305,7 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
     }
 }
 
-int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
+static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
-- 
2.34.1

