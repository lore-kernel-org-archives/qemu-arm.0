Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A99C87FDA
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 11:33:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukLJw-0000IK-5u; Fri, 08 Aug 2025 07:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ukLJ2-0008Mr-76
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 07:30:44 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ukLIu-0002yS-63
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 07:30:37 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so1517800f8f.3
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 04:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754652631; x=1755257431; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GwpFYhGeznRr6+q3T7zVU58Gdck7R9DYOTkt4rNGfxc=;
 b=sxAiBhqpmJ8/xw+pHBy9cHVjwpjfAncvY43ban8iiOqPNZrSMiNeffoRWvPV+xTldR
 gGMsDjcg9ihCge1EkzCvZwr5tFn+SFBop24HeVbrC8NRIXPLgC7vadiwfPdWW4gJrf97
 ackskI6T8zAjmHOfWhbEB9qUR2meJpfn+HuCFQ8tHPHxNbni+2X9k6TiNoCaREtYG8IT
 bb1r7YYPB+PkV3TpakwXYR3+HuRyUhx6PsGUuXVFpEs1l28QT4fA33QTGgcSKNPZrwhI
 pH5l7r167+wOOfUH45kT0JOqPWRVz+LCMvi0X/54FYxRP/vn7fr07w6IyGjxGOCUMTvW
 LoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754652631; x=1755257431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GwpFYhGeznRr6+q3T7zVU58Gdck7R9DYOTkt4rNGfxc=;
 b=mI/QWiE1PQ9SNYe9SM1Z6HhrZXAmkcImxyoCw1SCUOumZ/fqCfJbEUQm5iC/ouqXYi
 BRs0ZAFJvjnbtkpGp74T7Cd3DgnG5SZOnKe2RRdLokw33wACm4MehFq1P72Vsz6TvhC5
 FedxHSfltJI28QvZS+d5g8Fn5O3hn7netLA5ziMDjmhQmNEtQw8LKcxd+i/k7XfbHU9v
 O/Bi5nqMNShK0UF1HcoCzcUAc6OSPXjEQr0vyDb+3Q6pbeiOuPRuEELzjWCQjP353+5d
 dWH6aMj9W75Ctnsp3us7anaKiUw+JGduKknEHi7z6NSeTCs+2Z5ElUIyaJkyctrZi1PQ
 l+iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC6uwqgIl/btvrELp4REQhfstncXPStt9bfwNYRnu7DoMJTVKB9J2SS22ierV1qxVXtqF33CyTSQ==@nongnu.org
X-Gm-Message-State: AOJu0YyKwRTtoK6O4LYnYoMIEVTEaYKQ/E1NS5QNmgAML2pzrmWqrz4Q
 5ohFJDQhJqQsoqKGHIwhSMNERDCiGru0IY3Q26LlAvUhTvKzKr5Hyq8j8QJWfPdIcx8=
X-Gm-Gg: ASbGncuV/KJ64om0JMSowDs+FtDssq/dgYF/NBmhjpiocIlF4ZAflU7o7Ilecg80Hke
 wNzHVILTf5uiVxhhIV9cDQZKlBMeEywDsiLP7qbQ8ltHsFsmVAtIstV6oBRH5JOahGZAN2HiNoq
 ukeroyFZAVGn/Hne3Vetv+SuQ/EVR1BS8bG5tJOQsmUn7EPS6Qtbs81/TiIAxscVOqsiXzk9Rhe
 uDfGe4xdbsrKJ2Cv930iEwgvcw9FRB9RI+TsEQ+DIRkD9Ev/PAIgAHsv1Z5xpfwKqSFEktV83/n
 oFwDjsHneOGNTZGStLMOwLLnd4C2Zf6Y+Npx4CLC/RXJSS3FJ1q/EQvCT8M5N2D8w1wqGZwvL0f
 m/72j3dWh3w7JKds5Egu26LzFgG3ZrdyUKaQoLbHma6ZgdZ8uEO3zJ7rNmm7d5VUXu26Z
X-Google-Smtp-Source: AGHT+IGN4QUS09lseJvhZXQxtEUb+QSmc/a4dzcpZQQ1cjD+ioi62Zx0FFDz0cunx1K+Nv2Vdd+zwg==
X-Received: by 2002:a05:6000:288b:b0:3b5:f0aa:b1e5 with SMTP id
 ffacd0b85a97d-3b900b4dac6mr1936506f8f.19.1754652630524; 
 Fri, 08 Aug 2025 04:30:30 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4440194.home.otenet.gr. [79.129.176.114])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9386sm30034248f8f.18.2025.08.08.04.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 04:30:29 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 08 Aug 2025 14:30:14 +0300
Subject: [PATCH 2/4] gdbstub/aarch64: add NZCV register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-gdbstub-aarch64-pstate-regs-v1-2-14ba70be1b3d@linaro.org>
References: <20250808-gdbstub-aarch64-pstate-regs-v1-0-14ba70be1b3d@linaro.org>
In-Reply-To: <20250808-gdbstub-aarch64-pstate-regs-v1-0-14ba70be1b3d@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=M+o0NxtbVX/WeQLjyp8sVxOp2zp/MN1L8BDmz068olY=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9sZC9SYkFDZy9qRVFKMTl5WTVoc0VINmVwV1ZWClBiMkZidm1heG5hSEtyUnBN
 T1NKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUpYZjBRQUt
 DUkIzS2Nkd2YzNEowSVB2RC85VHVUSGRLZ2FneFc4czJzaFRaSUlBZE5iTnZrZHM3YVZiM24xbw
 p6a0Z0VXhhcVBrWnBwR0dUaXIySlVQcnZRSk8ybmNaM0JMZWJENEFHUlp1MmFuQzF4VGhlNGxXa
 XRoQ3hNbEtsCnNnbkhZaEtOOWpjalNTclVLWi8wMlVTRWlqdzdId0d1b3ZNV1oxS0Y5UTVrK0lE
 eDZDU0RyVkdRL1pNLzVMakoKeGMvaXF6WDU2RHJhenhVaE41YUdvWkJpQjNzdnZJWkhEL2RhTFR
 OWXhKSmEvL21TR01CT2lUS2piSExYZXQyMgp1RVNhUXY0Q3ptTFdLNEIrQnk3TktObjVuZEtXQ2
 5Ua3VrWElZZFZ5L1NmQVROamVjWVpRUHN1dlRNVStwM2xsCkpvVytrWjdvemUrTW1xRWtHSTQyM
 DFkWk5DQ3RWZjlJTVBiaFFsVHMrUmFpSndha2VHOEgxV2dDTHNYR29ZWHoKY3YyeWZzaFhONkox
 bitlbW5maWRwdVJ0bnhMc3U0RXU3dTlGZmxjM1Zwd1JZUzRmUm4rS0NDTFZub0Z6aXlnaAphQlF
 nRG1Kd29LeldJTm1aLyt4TEFwNjVETG5kYnBIU09paG1xU0JqNUMzNnM0cXNoVW1nWHVKTkFuU0
 YvQzZ1CklGWmcrd2pqTEI0cWRzVEUvbzJGVzl1ZytpQVl2ekdxaEpwckVEMTU3Um9Fa2JMQTFtS
 1RKOVZ2QlB2b2lneUgKZ1VsY3M5aFJCVzA4WEJlKzBpZWY4S3l6bVBnWURFdTRPOTkyTVhUYW1y
 MmFhOUpYMFlCWUJrR213U0hYQ3hvTgp3T1o3V05aRDMzWjJBYTUvYTVSRDZiN3ZROEVQRldFL0c
 0RlRLckN6dFBFaXB3Mm51NWZUNUEwMURBWXR0dnBBCkgrZFk3QT09Cj1WMUxPCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 gdb-xml/aarch64-core.xml | 14 +++++++++++++-
 target/arm/gdbstub64.c   |  8 ++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/gdb-xml/aarch64-core.xml b/gdb-xml/aarch64-core.xml
index 19ad743dc5607b4021fb795bfb9b8e9cf0adef68..2b74b87f908f792c24f76f212e4f7eaf335ddbc2 100644
--- a/gdb-xml/aarch64-core.xml
+++ b/gdb-xml/aarch64-core.xml
@@ -95,5 +95,17 @@
     <!-- Exception Level.  -->
     <field name="EL" start="2" end="3"/>
   </flags>
-  <reg name="CurrentEL" bitsize="64" type="current_el"/>
+  <reg name="CurrentEL" bitsize="64" type="current_el_flags"/>
+
+  <flags id="nzcv_flags" size="8">
+    <!-- Overflow Condition flag.  -->
+    <field name="V" start="28" end="28"/>
+    <!-- Carry Condition flag.  -->
+    <field name="C" start="29" end="29"/>
+    <!-- Zero Condition flag.  -->
+    <field name="Z" start="30" end="30"/>
+    <!-- Negative Condition flag.  -->
+    <field name="N" start="31" end="31"/>
+  </flags>
+  <reg name="NZCV" bitsize="64" type="nzcv_flags"/>
 </feature>
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 16b564e1a970cb5e854a705619f71ffc61545a73..dd3c6222a577efa03753cf07371afdedeefdb771 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -51,6 +51,9 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     case 34:
         /* CurrentEL */
         return gdb_get_reg64(mem_buf, env->pstate & PSTATE_EL);
+    case 35:
+        /* NZCV */
+        return gdb_get_reg64(mem_buf, pstate_read(env) & PSTATE_NZCV);
     }
     /* Unknown register.  */
     return 0;
@@ -83,6 +86,11 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     case 34:
         /* CurrentEL */
         return 0;
+    case 35:
+        /* NZCV */
+        tmp = (pstate_read(env) & ~PSTATE_NZCV) | (tmp & PSTATE_NZCV);
+        pstate_write(env, tmp);
+        return 8;
     }
     /* Unknown register.  */
     return 0;

-- 
2.47.2


