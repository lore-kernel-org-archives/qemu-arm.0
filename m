Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21351C98338
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:13:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMVu-0001mX-1b; Sat, 26 Sep 2026 03:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSG-0005eo-JA
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:25 -0400
Received: from mail-dy2-x26.google.com ([2607:f8b0:4864:36::26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSC-0000ic-Fk
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:15 -0400
Received: by mail-dy2-x26.google.com with SMTP id
 5a478bee46e88-33be7dfcfc1so2110435eec.1
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406249; x=1791011049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RNlqCeZxxjHAxzDk9z7qImwINCBhWsreM3aP9qjpGBI=;
 b=c0on/Pv0GVJ4/31GKofUVlJ4V0qM1Bms/ELoH87hLngFz0ZuvPO6qhoucDO2siqRCg
 GDqephXtY6fqfvrczM5wMwigUQ4zRX9hZ5yN7YOy7F8WTUOvSBsLlw3ZxiZZp5OxtkCO
 8syg2x0Z3UXELkxmu+/jDqYaavFPP6kqW6MLd9Zez4aN/1n72eM4battLcUj8WRIUXpB
 Oi9eqUZtwRvnw4IAhnyRyMMnmDGyO2Y+JXGzxoMz0MnGBswyguCf/JRRCJwCT81eHUzJ
 VKJXu62WcIo6hOrC+47A1dDJWk3W/IyjFn5x7Lor69nj0jt8TNiFUOx/n7aPl/mjJm9q
 AHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406249; x=1791011049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RNlqCeZxxjHAxzDk9z7qImwINCBhWsreM3aP9qjpGBI=;
 b=OYhaYJQIsLFNjVrceBfYUJzIz/Q49N7BzcBOBFpVKh4oVYUws60oySJNUw8Aa90VwI
 ZHDj09TdC4lQF5Z6nRcQIVkX/MpZNgHdT35xi5XKzUfE9U9K7otlIJbH2Yh186+UeZtO
 kA+mRsYCB0iIGKCF+zhcXKbPlNgbPHg3fTbnluN5hSxpIOjzodBXPyXk5w3NH7iIVSjD
 oxB895KPc9463WqtBsuti+GLApo8vqXSakEWekjZ8JA3VzsRMPnVJZVxb4t0egRVNQkP
 wqwBKZRYOJGZ5VOSoKr4HWGsJ6jwN/GNQx5QQb55K52NOmsGkuskmjcl/43prH9UBNuE
 Y6YA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzJKOlLghfGDS4Wzc5cMxikUKcziTlpn2AgF+NBEjLvQ1PQzbyW3fNJiN/qHlzCRb6cN9ipjkyYDQ==@nongnu.org
X-Gm-Message-State: AFuF++lO8MXjFW0dgx9NiZIck1xWtKvj3KUTNLHGLFB8gub6+4BScTmV
 t7lnDFtA2yXXFcl01/kLefLVzOVXHHEG5AchHxmXbCrODtSg0iAeDZCJ
X-Gm-Gg: AYBFou3FOR7jUMd2p86qRlxfL0FaZB4LeQz2g+d7BfPhVDCiglJ3qyED61ARn38rA6F
 o98tLe2mRmmBsEOzeB/ilwhthgatIgarv1i8sWA9LFlQ17ycb0CelYnltaLubtH3agOKBmaE0aw
 ySgb6Ilr57UdGfA4vuZufk0Um4axteXZpCNG+T1RfHoI4YY9k8z/VGBUHWguCCofiVd7W+al/qC
 GkoGOGWj2SbRyCk9IcblaFAOzAkyUm/qedzlFlfUEXSJ/47eSDbSvf9GLpmLjL/+6+akgzl5vne
 1FEetG+AECPOLz8RcAKLGJrS+tNF/gFoSRqdZfDDnRB/mtLgwcSzHLS7Qi4H3Gn0aCMQECJnANF
 a6ZORqpUllfQ/+0Ab6nMulfxWzcsg+Q8wxhoWBtkdQ7BaK0AfV8x05U8+omUN9h5/iuLcxNgjaV
 PuB0OAJb6xszCLtEA0OJ2yPX3kdGz9DON9M5XHbbGxDX7LhzEDQI8s3aT40P/HhkHdtY9+cJ2R1
 R+xCQfqK8Nztk2Z1FOdAcsQtWeSjQc=
X-Received: by 2002:a05:7300:a987:b0:333:fe81:85dd with SMTP id
 5a478bee46e88-3426fbbe744mr3025019eec.3.1790406249289; 
 Sat, 26 Sep 2026 00:04:09 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:04:08 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 47/55] target-info: add target_is_microblaze
Date: Sat, 26 Sep 2026 15:00:46 +0800
Message-ID: <20260926070057.1234-48-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::26;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x26.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add target_is_microblaze() and target_microblaze(). The first
reports SYS_EMU_TARGET_MICROBLAZE. The second checks the current
TargetInfo.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h | 15 +++++++++++++++
 target-info.c              | 10 ++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 812e4b04a7b..17fafa0888e 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -210,6 +210,21 @@ bool target_is_s390x(const TargetInfo *ti);
  */
 bool target_s390x(void);
 
+/**
+ * target_is_microblaze:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns whether @ti is Microblaze.
+ */
+bool target_is_microblaze(const TargetInfo *ti);
+
+/**
+ * target_microblaze:
+ *
+ * Returns whether the target architecture is Microblaze.
+ */
+bool target_microblaze(void);
+
 /**
  * target_is_base_riscv:
  * @ti: TargetInfo to inspect
diff --git a/target-info.c b/target-info.c
index b25e2ada438..0716e2021b8 100644
--- a/target-info.c
+++ b/target-info.c
@@ -204,6 +204,16 @@ bool target_s390x(void)
     return target_is_s390x(target_info());
 }
 
+bool target_is_microblaze(const TargetInfo *ti)
+{
+    return ti->target_arch == SYS_EMU_TARGET_MICROBLAZE;
+}
+
+bool target_microblaze(void)
+{
+    return target_is_microblaze(target_info());
+}
+
 bool target_is_base_riscv(const TargetInfo *ti)
 {
     switch (ti->target_arch) {
-- 
2.52.0.windows.1


