Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E662ECCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:15:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcyr-0005AS-UV; Tue, 28 Oct 2025 02:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcyq-00059i-7H
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:14:52 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcyn-0006xW-Uw
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:14:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so27643215e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761632088; x=1762236888; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xopSbsh+IkB5STrBQ4YQZEElngQLIdle4gTE7izg1DA=;
 b=sj61ARNi0XBMmQbi0sLIpwX9bKnFUdjcfmK2uJ9df5iXiIEzfTF2tCoo5BJX01y71I
 YmR2PJYRe+d0UGXmkLP9kjEo8PZ1zLSLkbVGVEm5Dhq/33j2nNcqDE9G464rE2J1gOUj
 gSqbFDuAe/J+xg4JLC1aAKRlMzVG/mugsLQYu5cp6DvdhHO2sMdT2yaWda0WUwXp8o3n
 3lEibwyj9NCihsefawc/z0rWeHxOFEufYKTvdYU22MU0C7X+s9xMWCUZ9IH8UPDQ8P9k
 bo0UrDsJ0vzsIM/wTgrX9eeXfWEkSEUzwTeuElcAyWaTpkcS/z1d0npdszcdPEaVrgZ8
 GDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761632088; x=1762236888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xopSbsh+IkB5STrBQ4YQZEElngQLIdle4gTE7izg1DA=;
 b=MGnDC6C9L5TtQZu0h2NmKBJezE5VrsAKrGMxF1BxT1py5V05fPm+LNgWo4nhbLOeny
 SWgyPInid/dr4lPZF4A4X0oi1nhl0+JMSdqRBL+ezPFWq1YoOwn7EFgMDeuaIiWWy3Mp
 nQhgmg3O3fmU0NK+pwIAP1FMyyEyse6yX+QoW5YEOombQVtJ9NtXBvCV18QV3CNU9e1H
 e5TxcGVPnEO2Fh0Lbuyps37uIQBUyt+N8+aBKdcLE3Q4ukyjfd6mlT1ZCrERbc1BiYTE
 K3FJoXOlG0LrDPMi7/2DXudl/uhNyly9WddijFbrlNWn/Vd88rMIx529LcIacRlinvmT
 z99A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG6oq+zD4bYMVa4lnXwxqnqIxqyRbSohZReSUw3xALHLvbUGGYxmf+9QtqqoqrGw/ffWKe2JX55A==@nongnu.org
X-Gm-Message-State: AOJu0Yxne2md2mmvCYgcrt11/H804oTiYPq+lh7sez2E93HGL/csDrhR
 7jdn1hAN+3eef10pVNsdl7MSDkwDoxLDd4/pMMHoXo54gG6edeBpHHHK0eXDQACxuxc=
X-Gm-Gg: ASbGncvTeUxBl5VVsVHxRJGAZeGuUJRQZU9v17bHNiPXg80ru3huk7TPn7HmEyGdVz1
 VmpvT6d3MW3fH9P6vQgXNmip3im4/E4ycZmBE/69niYrmWftrot+pmDWWC8fU3b1E4NHuP9G4gx
 B+EDqxJ5FaLdwHQgw9NYLQRvGrxoMI3Ecdv0QUqbAB823hD8ouuSd2XzLgfj/RNBiDt32KBiEuv
 ckC3RewqiRUjHpBhwZSRCRkCCFwGgFNOU5w/lkRd6TuV1xbzC9xPs4vuRIgBZc1Rr1aNsKPHwRE
 1A+C2+gyo8d4mtKnZ9n7oJ1f1ilFjp6ocKol9sYpSIJqNqPJmbPebqFxFBtfKwxDINktQGi2N/R
 Uh/VgXhY5GaAYigjzCrixWZIB9sdL1hqI2b0qLD+D/MKdJT8tTWgcTZhRJdwaY7C+6y76qqXZa4
 7zNc4XFZ5bWn/coUdsOoIKcYexE07qZKE3FrMhNbIfjW0o9+otjngsWzTakWVzTTDrXA==
X-Google-Smtp-Source: AGHT+IFdki5X+CVKIM6h0vlW1vNseSwY0yfDZG660fTQBpPc/avxGPJbyTQMxHrcza8TsFbKKyrn4w==
X-Received: by 2002:a05:600c:3b14:b0:45d:d505:a1c3 with SMTP id
 5b1f17b1804b1-47717e7f1efmr15560625e9.37.1761632088131; 
 Mon, 27 Oct 2025 23:14:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd489fa4sm170886655e9.16.2025.10.27.23.14.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:14:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 45/59] accel: Introduce AccelOpsClass::cpu_target_realize()
 hook
Date: Tue, 28 Oct 2025 06:42:21 +0100
Message-ID: <20251028054238.14949-46-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Allow accelerators to set vCPU properties before its realization.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/accel-cpu-ops.h | 1 +
 accel/accel-common.c          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
index 0674764914f..9c07a903ea0 100644
--- a/include/accel/accel-cpu-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -34,6 +34,7 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelClass *ac);
 
+    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 850c5ab4b8e..eecb2a292af 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -106,6 +106,11 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
     }
+    if (acc->ops
+        && acc->ops->cpu_target_realize
+        && !acc->ops->cpu_target_realize(cpu, errp)) {
+        return false;
+    }
 
     return true;
 }
-- 
2.51.0


