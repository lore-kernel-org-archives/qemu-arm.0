Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D22C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:10:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMVD-0000Hp-TC; Sat, 26 Sep 2026 03:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRj-0005JV-1n
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:51 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRg-0000em-9u
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:41 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33c24422d4dso1849613eec.2
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406219; x=1791011019; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=7wEmknfoBmg3TeWeQqrxAB6fpgRVpCKeiHIEFEVt1/A=;
 b=Vu6gjm/6BrMZ/agQ3kP4OYimlBoDqmd5T8bMKJo7V/L+kxuXoGfu22bMRbJuBzPo86
 bEuq3xAYRxBmiREk7PMG9KtXKuS3pgOjFhJ7GcmypqGVUml9kmYA2l3Ibp+LnVXQom2Y
 oH8uLRAnGPOEH3AtwWwDZ2ktBM0S88ilAqhOwdCH0wqtvYDobn31apzynlt7Cww76hxy
 lMhtAl9v7KYkvyNY9rbvMMATBM+9Zq1KD0Vl+r4ne765zgYUTyk5o6FQZ2vGlA8GK6Pf
 bydtRtSPviWFzXQRrNFU4gP5nZ7ZCZa6CB3sJUgRw4QfPyZuDikuU9Ho3QgiemiI7CcN
 e6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406219; x=1791011019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7wEmknfoBmg3TeWeQqrxAB6fpgRVpCKeiHIEFEVt1/A=;
 b=jLOaw8Rif/7O0CDA6MN24fbs8s6JoFEk052oiKNpfhP447l+mZcvuDFbQbUAvpfXMb
 bvI0cEswwCfSeugw78rcVPKJmBC2j9QRMA8/GV2WyiA9pXuszatY7AQaEhacKf17SDZK
 IY/auOeKr4FLvsfuNTIjLRiQbEAD2tuIPaImCwpgG2GXDsZK5Z8/uoOqDcdAIYwuwdo0
 LML84yGiK0DXPeeYVcR89Pfytlip81SnKEAgYfFbXjRRmHksYTz3Ddcd4uGNonG2kNca
 9Qu/g4LnUe8RIDnTlZ5Q0BrlqOJmQypmXrGNkm0LSx1ZU3OTbddCtyqeFPwBDWV4wEnx
 h+CA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwognCOTchxPElAq7spRk76XAteecdg+FKMozD9svwMtkIDy8+JZcR44NhFbUuwoKRPtAB3xnXcag==@nongnu.org
X-Gm-Message-State: AFuF++lVK2xaLO1CVGY2R8K0velV0QOl7Df6u6RZnzWpV26QHO5eZiAl
 +bWb8v5vslKgY+KV2U/ImrljNSD9jffYh7tFV2oiTnO3tvWBrQLZyAFSCoRuZhy0
X-Gm-Gg: AYBFou0z1Yo6REbfkoFIqReG8UThIvcqnMETku85q4q1TIR+rwthAApa8ruUsxJ8be1
 a11AbFGaag0IKTkDNMM0w2jRsthDWbm2wbjy00a21ZrQP/43al4ZBa7Yfv60kT3U/F74Tw2N2Wc
 PPoAXJ3pCywHGwE/oeQ3Gdrp9tUiPWJAYp/dj9tHbMlirO07xmzBIAD4BSDkuX0uLUvr+zbq0se
 82Mnrg2LvS9fr2M/gMD3pkIfCQQu4RX0UnMWTIJlZOsYBS3PsN1JMXEpPVYF5pOePi2hkcKYMsW
 EK35iCxLlAIOKlhkU63Db0t5CqXYC9Oh/DXzCGaqkPT+N+oPaOtpkBq4NkGYJMRNByvzwG3onZR
 q2S02zU/xlbz+Cy8PqE3eqWY2eplxGttORDPUZyW82SjdA3PVw/I2ZDbXb/rGoU4KlnvH3tnnyK
 sMNlGCmWtpKaQzUIicMuwNm594ekYVrpPgwS89HR/cyMmH0i6t8wJLd8GYrtlBT/Qgy8c7n94OJ
 4R36S8d7wMIBh0+SBehJTOve9kJudA=
X-Received: by 2002:a05:7301:4201:b0:33b:ea8c:811b with SMTP id
 5a478bee46e88-3426fbbeb5dmr2159328eec.5.1790406218912; 
 Sat, 26 Sep 2026 00:03:38 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:03:38 -0700 (PDT)
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
Subject: [PATCH v4 39/55] target/microblaze: fold system sources into common
 source sets
Date: Sat, 26 Sep 2026 15:00:38 +0800
Message-ID: <20260926070057.1234-40-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add microblaze_system_ss to microblaze_common_system_ss and drop
target_system_arch so mmu.c and machine.c are not built per target.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/microblaze/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/microblaze/meson.build b/target/microblaze/meson.build
index 9c1ecd1cf1c..93138637bf2 100644
--- a/target/microblaze/meson.build
+++ b/target/microblaze/meson.build
@@ -21,7 +21,7 @@ microblaze_system_ss.add(files(
   'mmu.c',
   'machine.c',
 ))
+microblaze_common_system_ss.add_all(microblaze_system_ss)
 
 target_user_arch += {'microblaze': microblaze_user_ss}
-target_system_arch += {'microblaze': microblaze_system_ss}
 target_common_system_arch += {'microblaze': microblaze_common_system_ss}
-- 
2.52.0.windows.1


