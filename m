Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B644C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:08:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMQ4-0002dl-7X; Sat, 26 Sep 2026 03:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPz-0002Ni-Kd
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:55 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPx-0000Ss-SD
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:55 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-328664c2da6so1083867eec.1
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406112; x=1791010912; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JM/7bmm5w0DrybT6q8HGQqwVn9iraKsL9TCtK46LPGc=;
 b=SGSYDK/P9ccNbfGTniWKsBhJoUzBvO0lGkrnZlxk7XV52PNDuZP4dTcJ7nHxnB1Svx
 AUyteEADuzj3TIA8/o7FxVak0RtAdwikW0lPMZQ58Cr1GSmFRYEYwMEX0mYFWx9SMSkj
 B89PxEHahViuSWbQVFJssNS+MgZd3v6jgSToifl62RkclhfT+dcbveMzAopTahab3EW+
 3qu0IKLiuuFzfIx12g8gKIV2Gu7l+29QTI7j+43jQnrRRQ6SHQ0RfxXhtHj0jMWiN5U/
 a4EqZtPFGqlN06KWE3v31eRwLpImJ6upMGIKQr4SFl6WEh4tZ/Xdz9IT1dU/iaRmNPIp
 cYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406112; x=1791010912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JM/7bmm5w0DrybT6q8HGQqwVn9iraKsL9TCtK46LPGc=;
 b=ISqWyoPWdcjSV6pBc6RwXyLlmi8lSJ0nJRbjHpnDR3sAiilqwXEKuoBGPkRkBjoxUm
 gxFplzMkrRlkG6RV9LE99nOwW2tHk10WNinklOef4kT4PK4CxRpxSTNm9KtiB9RrQPL0
 sHGm6znKP8x8GoQaO6gVjVEf4FGWW+zJaxdK/SpFTuYHxl92B8o2jA1+d/gc1Dq6eGFA
 OrBShmsnv+TP/3lzUkAbwujnjs0ATVedjn2gpC3vSloIiA5kdq6Bsg3qO2oe39C3jMha
 oD96sU620nFTjxQ7bhTtRUyCPEil8ZslL7D47WSUYojhsAahIDvQCyxDX3cfhSb8lrhT
 4htw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz4nNucyxsOYtOedqN44+6Dxp7JXbHT1bn6Q3kKVyEW+rL5qcqVIHM+3juKMekzbXMdlRg7g1lIzQ==@nongnu.org
X-Gm-Message-State: AFuF++li8qlSJ/luh2iqHRNDMokqfTI1hMwdUK1OJnUji2p+3ZoIFNmn
 ZfZOdAsNAaRJo5AQQBdS5Gf0/xnyFoAQ071+XB4Hl6hf9TWiZbQyjFC4
X-Gm-Gg: AYBFou0DZsFotWJ+ZTBjUbapJEZKdR7EhmmXhMHBUBeSTI9pCoEYzOFmmDIYxzbCZ0F
 EkgO5aQEPRoy0ANHe8EhVWeYkPPyFmqm0MOiSW1Y91Ueqihs3Y80mYWAKftTNVJ+rvFPIpum46w
 UMVf+tg4J5uzx0hKwUkGDGmUOIK5poZ7vgYraR2Gn8MOZui23wgN/gd89iH067N4236/gibLVYZ
 KUrFt3C3TQ4McSvv/VQTWAaLcPd0XcFoLkWlC1xdppyCQrIJcKeYbZOkJFSFaxolnP0jwZ7tG1L
 dQKfoWp4a69wNC+MI484tHJ0SbbLP0Ae3kDYOfSkxgiFPtFxj+mHqq0PuKKBnCOfNsUxrWN9bx/
 s1b83yQH4BqOzLpkH0Ph9Uo6vnIne0MKBlK7TLn3tCTk9BJiAEVM1jG4spmBD4LQXbzhcJONe61
 Wda6az2j2zAnNrEviSuWp9vW8BIBwJH3q45zYCwNHgRyo8atK1rzT5Gz/8l9m944UevxCSR56vo
 HrBl0GKpO+ZT85a/rynzSGDfHDtODs=
X-Received: by 2002:a05:7301:4281:b0:33c:1521:89aa with SMTP id
 5a478bee46e88-34271a8deb8mr2052589eec.24.1790406112321; 
 Sat, 26 Sep 2026 00:01:52 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:01:51 -0700 (PDT)
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
Subject: [PATCH v4 12/55] target-info: add target_is_any()
Date: Sat, 26 Sep 2026 15:00:11 +0800
Message-ID: <20260926070057.1234-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
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

target_is_any() returns true for every TargetInfo. A type that is
not target-scoped can use it as TypeInfo.is_available.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/target-info.h | 9 +++++++++
 target-info.c              | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/include/qemu/target-info.h b/include/qemu/target-info.h
index 89656da1ca4..3bbe1d9b607 100644
--- a/include/qemu/target-info.h
+++ b/include/qemu/target-info.h
@@ -53,6 +53,15 @@ const char *target_cpu_type(void);
  */
 bool target_big_endian(void);
 
+/**
+ * target_is_any:
+ * @ti: TargetInfo to inspect
+ *
+ * Returns true for every TargetInfo. Usable as TypeInfo.is_available
+ * for types that are not target-scoped (TYPE_OBJECT).
+ */
+bool target_is_any(const TargetInfo *ti);
+
 /**
  * target_is_base_arm:
  * @ti: TargetInfo to inspect
diff --git a/target-info.c b/target-info.c
index 6d57cad5d33..ad93a4b125e 100644
--- a/target-info.c
+++ b/target-info.c
@@ -96,6 +96,12 @@ bool target_big_endian(void)
     return target_endian_mode() == ENDIAN_MODE_BIG;
 }
 
+bool target_is_any(const TargetInfo *ti)
+{
+    (void)ti;
+    return true;
+}
+
 bool target_is_base_arm(const TargetInfo *ti)
 {
     switch (ti->target_arch) {
-- 
2.52.0.windows.1


