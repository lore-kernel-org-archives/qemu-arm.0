Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DDFC9830D
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:27:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Mzy-0003qi-Ht; Wed, 23 Sep 2026 09:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mw1-0004VB-Bb
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:23:00 -0400
Received: from mail-dy2-x13.google.com ([2607:f8b0:4864:36::13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9Mvz-0007nT-Is
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:22:53 -0400
Received: by mail-dy2-x13.google.com with SMTP id
 5a478bee46e88-32dec843c37so1562335eec.3
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169768; x=1790774568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qFqvsxy7L8PH7M6DU9x+2jtR9XBAWYnvWHhVICE/SQI=;
 b=sxM8CpsWquPzIjedB3QiXVZhy4Pu3ZnkZXhL8yO39m+S5H3R7TJ9Qzssp4VrHxUVvX
 fSiohiPuzER28QEKGqK13vTVypGvS3HhP7lHA28F+vsTSBUg5R29DbtK98Q9vF11fTV0
 N3+Yzk7LoUVem/v46FsVN8CVeQ+Pq3sheLwptbtwhjq5RBitgxpPjvhk5WNTtdSKk0/J
 zRDsP3KboC2SMiQNpi0Xway6NEqSB1EyJEad0fl1ytgb3S91eAOGkcJwM+f3ei0bZPgB
 AI6JrXJGXYHT9PhJbCUSrzdGTVMTkJygC4ZvfXKvJ0fqwf9XvLJ3F8OQsMW8p4jEXBjw
 MsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169768; x=1790774568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qFqvsxy7L8PH7M6DU9x+2jtR9XBAWYnvWHhVICE/SQI=;
 b=c88MF9tqbxeHgKOrCEBqUIKK9lixWeKvuC9ULTPF5M7AfVC2dIYc76fUGOGzj5RcIu
 QRsxnscHKQRrDouGaCeAvw1DnP5AGqT0ENBlNO3VePXA/VY4lGb062n0BTVeEcC5hqnq
 /qArycCg7vj1iZ3ytYAFxwm30XPvs+FWXUV7GGHXqdgqFQqbVNFrfUeJ+Z33A9aEOee/
 6M7Vm/2+kkXIsEg8DyVowWkQqD0gQFg8up1gvS3bv5xO2bRNy7QB4sKkzWcNYcOo2sY6
 T4BMeoW4PD+MvQYmh1wBIy7e2RtzO0WbfEQ9JZRZPt/zWeriiggZ5CMxM9ko/1som/n2
 LWuA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxj+UUuLterPwHoHbxjEIuFpe1XTH2VcyvySu8BqdBhWf14JetpncFVsgdvMn9sEMvwTHF4qPmffA==@nongnu.org
X-Gm-Message-State: AFuF++lyDmtbonxVQwnZ8QZCMdcA9MSEQJE1IlxL35FqmWDTg90bItzR
 8jp4vqPetJRamqBqkpFDNUeoc9tAprVrSAF4yuv1ywIF989kz5f1wita
X-Gm-Gg: AYBFou1sewqiEo65RH2rCK4W80ed32n3r4Gk2couWx54H7HFGaQ0WdK4WSyeiYRCvW0
 Q+J5Qf7+8jti85tx+nNiaKizZenN69IGDWD5rCXMPgW1Rq5ECblfsYNpZaI9e4UngkhbiTndkaw
 3WfQnJl/lRtWW4prbr374ngAxNEFyyZFL//O0giPS1Y3LPlSkVSaxuyVi1Zt+7vs35POdBrNb46
 g1el2oL0P3nXq8tHFKWVm1t7KPhja1QbucLZYg0/RJ1XIyiNR5Rd3KkKWfEDixzpTyrl2g/Wfau
 aGur9RuaRd0XAz9LMO5AyPaza/f4w/xOfb68uAhHlLcWgI/FWrUS2KjXPTcEKMbh3JAHV4zj3yt
 K+w40M2JIXErexYHTGo4WgnnCbncvOsiKLgRoCUA82ip81hLUaW+aUHXWOc6C9X9wsP1wUe2K6R
 IcuE/HovLT7veDWT8+pn1diRC6M7ZKyOd7aOHv902LDsk/qJo/YLnt/UwTfNyUtbxD78XEkMRxl
 JXKgKOYb8cprQeHFYC9ygEGpJCW2wc=
X-Received: by 2002:a05:7300:59a1:b0:33b:e842:d272 with SMTP id
 5a478bee46e88-33e8be6c06bmr2642017eec.5.1790169767812; 
 Wed, 23 Sep 2026 06:22:47 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:47 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 036/114] target/riscv: select ELF dump class from
 target_riscv64
Date: Wed, 23 Sep 2026 21:15:10 +0800
Message-ID: <20260923131635.1894-37-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::13;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x13.google.com
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

- Replace TARGET_RISCV64 with target_riscv64() so dump class still
  follows the QEMU target, not guest MXL.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/riscv/arch_dump.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
index 12b68799070..2704bd8d94e 100644
--- a/target/riscv/arch_dump.c
+++ b/target/riscv/arch_dump.c
@@ -175,11 +175,11 @@ int cpu_get_dump_info(ArchDumpInfo *info,
 
     info->d_machine = EM_RISCV;
 
-#if defined(TARGET_RISCV64)
-    info->d_class = ELFCLASS64;
-#else
-    info->d_class = ELFCLASS32;
-#endif
+    if (target_riscv64()) {
+        info->d_class = ELFCLASS64;
+    } else {
+        info->d_class = ELFCLASS32;
+    }
 
     info->d_endian = (env->mstatus & MSTATUS_UBE) != 0 ?
                      ELFDATA2MSB : ELFDATA2LSB;
-- 
2.52.0.windows.1


