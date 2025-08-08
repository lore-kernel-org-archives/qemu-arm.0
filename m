Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006B4C87FD3
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 11:33:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukLJt-0000Ge-Pv; Fri, 08 Aug 2025 07:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ukLIw-0008FC-W0
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 07:30:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ukLIt-0002yH-5k
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 07:30:33 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b7910123a0so1784142f8f.1
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 04:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754652629; x=1755257429; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d7n1X2ojJ/UxjeZIdqOk4jWSGMDGO8oFdwK1nyBZWWU=;
 b=xHomyXODQ6lIU1MXqyBp7rty9548LjEfBN77dtyGBpdpES2FqYmMoOnpo2zoFE+Wan
 hQG3YVOgKGyEnlhS+R5Vj3ydbP4a1PPLjqmJdwFpABFXROXTfqEPYLjPxKA3GRNJYkv9
 5deGA/HEFB6qzVBpQp1kA4KJ2Tp3KOiBX2OV+ZZ7yJ2kp3+xL+Odw+nJAJ6R2vI1Tgoc
 Lc341BJTblMzxP9iqt4RzCZy5EeWyTmZAz/GTS0N8hZzzXNhuT7dGAJ6gkbwBj/CyaKY
 yfzN73siCWABHs6QOcvUuGTqxhLfmBSzV8AV9jgN7XTzb408xmRNTW9GLnhCDcoZzIC1
 CP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754652629; x=1755257429;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d7n1X2ojJ/UxjeZIdqOk4jWSGMDGO8oFdwK1nyBZWWU=;
 b=FsxE6P5N/SlkMwAwVKkujhZ3CR94HEEmW9QwE+3I0+59Tv1ifbsKzdZKJ2lMI3cyA/
 x1oRMFmU6lsNLEpgvCMBuT6vSsnzVC+CqNdLorydcs4yOJoPUDTHu4FxXc2QFVP5DVnH
 gKJoQRN71fa+EPCXepe5GHxQlYThqKTqrlFdXnF6HoPN5rE0bml+I5OIpHsxv5uLoFuT
 1wQar1b16wbB+MWioDk899jeW6MCd3unair2A/gc4Nkzx8hrD1t2hqY6GF6wSSmpkqND
 IT6sA3WhkVjMLzleTROm2Rxjf7U9/DKwyAX/vg0YY3nxyx3VvG5576ZE+biHoEns0pWo
 IOpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGdtr0A8vHR6AQjiW+dC74d75zIn4c7GuwfvrkdWF8aeMdKvRXyR5A1MJrUbRfJRFwQ3CFif7KIg==@nongnu.org
X-Gm-Message-State: AOJu0YyTBVrmfuWFfTIDwbCCMQt12+5rr0OW2EZl3ZhuyJNOdOBifEQ2
 PWUDD9kYVYbgHIdGwB3h/ZxVuMj58EQ35j4/peqVTpnVQgeE4urOkOQYvna3R9Dzmeo=
X-Gm-Gg: ASbGncs+7nCWzHyWV6NKH3jNNvfWw74c+GZy3wvukJM1Fw9AOQIEYOY+B+rCewvHM5M
 7/zkoqBLahvW0q2TUawgk/IcCiRKkfG6SZryOXlnCxtp2r9DUGz4bJlKt+7XTUnVrz8o2nwYiK3
 /u3vUYZ4iedF4N6ZRJQDTZj1owUiz4+jU4WEL3SjoQcUpCsrHgjrKkZus2+b/dVN5MaKj0cDfRL
 ScpYDc8VMHgpUWU8x15RkhVlxMFmpzz/0DsxBjtZSjOGpqtaKL6HD03kBIoDVw4pGpo0kXm5Ngf
 q3OqSs8Itc9uDkYdawdiBdsvjj8Kgy7I2aLH4aDCyVU+sNgWW+HJjW+ZrRSuDlpNQzWcNOiMQT8
 K52Vx65y6uxaAZLWdj1h9gNDSIDYlH5ywB3lbyQkJ/hWOEhNF1fWwAcOqPe+CITNxy9i1yoSsbB
 OyJLs=
X-Google-Smtp-Source: AGHT+IFTuc01YwonXEcaixOV+n49JYbDb7JOVe7eXecZ8W66XKVF0EElRtQRfD5X/VvHoJFCYexFQQ==
X-Received: by 2002:a05:6000:4029:b0:3b7:7d96:e24a with SMTP id
 ffacd0b85a97d-3b900b7b057mr2300141f8f.35.1754652629126; 
 Fri, 08 Aug 2025 04:30:29 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4440194.home.otenet.gr. [79.129.176.114])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9386sm30034248f8f.18.2025.08.08.04.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 04:30:28 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 08 Aug 2025 14:30:13 +0300
Subject: [PATCH 1/4] gdbstub/aarch64: add CurrentEL register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-gdbstub-aarch64-pstate-regs-v1-1-14ba70be1b3d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=zql1mb08Gst0dH1hdlJZnLdmUwUUNytFuYpgCKSSGHY=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9sZC9SVmNXZ2VldEdlK3RvL1lXYjVzZWRJd1VVCnR4aGNYRUVBL2NwRldhaVFv
 bitKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUpYZjBRQUt
 DUkIzS2Nkd2YzNEowRE9uRC80aldET014SXpOYjN1a3hKc3hoUUgyRjZhOWUzQm5yeWYybDY4dw
 piSTVUM0k5WUlWTnNWdkVEdmZFMnlmSlB0QzVHWDFSckdBN3hlNURJaEcvNXRNUmVSbGRvSE4wb
 klhU2ZvWU80CllOdDVZYnRVckRuL0Z6MERhcTZPbmhFLzFFSUZnbGpnNzdpb1d4SVNYTjZnZTVv
 NnRxbk5oZjNnUStKVGRZTTkKSFJTZUpBckExbVpMek94MFcxL0xVYUwyNUorOHcwQ2RhbXFhSUd
 aY1R5YzJQL3ZOMTNXcS9IMjdlRHFML2JZNQo3UDIyK1k0a09tck1GdmZaL285VkhOVXA5QzFBL0
 JkbUdSNE5SSDR5RmtaV1VCUXo4am82OGloaHB2Y0tDdGRFCnVKQmxYQklIa1hkZkxuWlA0ZnJtc
 nEwbkJrV3NkS0wwSHZCNGZrSzA3citOK2VETWhlNUJpbEI4cWRSUVFRSXcKRlM1RlFRYWp1VUtD
 Q0s3UFZpaFNIeklpYUhBMmQrUFZlMzcwby9VUXA5MU9JK1lJZ3JNeGRmNUZobTlzaldHSApYSTN
 SaHl3TFRiaVFGQUx4YXFwdVQ0Q0pIdVpRY2EveC8rL2pPK3VQMkYzSUtKalZlQ3dLNWZyLzJqUH
 pVcjUxCkdQU3QxSFk1aDVGN253ZVBIZWxqY1VDVnVvSis2dnMrZndWR0JnQ1dFNzlxUklKMndSM
 VJmOVVPOG1UU0xQWWMKZUQ0eWtuaHNjUGN3L0FGWXRLZmM2M0pyMU5iRjYzc2sxYVVQejk4Mldr
 Z0p0Zmh2UUkyTW91TnkxbWZmb25VWApmTHJzcTNyZTB5RWM4bzNPSThoOHAvV3FDNHBPRG9CUUV
 5b0p1ZUt6YXRaRmN5bWZ4bkw5ejQvWmdvNXdiNkhICko5ZU1kZz09Cj1rTkNWCi0tLS0tRU5EIF
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 gdb-xml/aarch64-core.xml | 5 +++++
 target/arm/cpu.h         | 1 +
 target/arm/gdbstub64.c   | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/gdb-xml/aarch64-core.xml b/gdb-xml/aarch64-core.xml
index b8046510b9a085d30463d37b3ecc8d435f5fb7a4..19ad743dc5607b4021fb795bfb9b8e9cf0adef68 100644
--- a/gdb-xml/aarch64-core.xml
+++ b/gdb-xml/aarch64-core.xml
@@ -91,4 +91,9 @@
   </flags>
   <reg name="cpsr" bitsize="32" type="cpsr_flags"/>
 
+  <flags id="current_el_flags" size="8">
+    <!-- Exception Level.  -->
+    <field name="EL" start="2" end="3"/>
+  </flags>
+  <reg name="CurrentEL" bitsize="64" type="current_el"/>
 </feature>
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dc9b6dce4c92297b2636d0d7c0dce580f1806d5b..c3070cd9863381fac40f5640e0a7a84dfa1c6e06 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1473,6 +1473,7 @@ void pmu_init(ARMCPU *cpu);
  * AArch32 mode SPSRs are basically CPSR-format.
  */
 #define PSTATE_SP (1U)
+#define PSTATE_EL (3U << 2)
 #define PSTATE_M (0xFU)
 #define PSTATE_nRW (1U << 4)
 #define PSTATE_F (1U << 6)
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 08e28585396816ab90d6d8e460ff8171892fe8da..16b564e1a970cb5e854a705619f71ffc61545a73 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -48,6 +48,9 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         return gdb_get_reg64(mem_buf, env->pc);
     case 33:
         return gdb_get_reg32(mem_buf, pstate_read(env));
+    case 34:
+        /* CurrentEL */
+        return gdb_get_reg64(mem_buf, env->pstate & PSTATE_EL);
     }
     /* Unknown register.  */
     return 0;
@@ -77,6 +80,9 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         /* CPSR */
         pstate_write(env, tmp);
         return 4;
+    case 34:
+        /* CurrentEL */
+        return 0;
     }
     /* Unknown register.  */
     return 0;

-- 
2.47.2


