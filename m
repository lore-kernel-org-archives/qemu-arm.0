Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B923ECCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:39:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuXS-0001u0-BF; Thu, 23 Oct 2025 08:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUV-0005YX-Bs
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUT-0008RS-4N
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so4679685e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761222742; x=1761827542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Kvjs75qZYXzJtgjOCgCUdq6Pu4BO5ORL4SkTS1d+ok=;
 b=cZS76eJoTIiiJJNW8TTQmvmI+z9czLAYye6vBDkx4XRAHFOOlGatyZQ9DUNR98KUiY
 fHE4swXS64Mz2DXvpRyKIhA3LwHtI+7MoRl7sIw49/saWBZ1gYHz7atxWWgGZpLtV37a
 ts8aN0GXocIokV8PhnRKfX3a10//NA8fQkiR2Qcfen2xH3fvg4zihd+mImHzl5FUIgDO
 AdrAfnN13VjmZSTG7+SpAo96VOvE5FMrPBDu3WXZWJnjDzibi4WWOhOrOtwt8bVaFK21
 ntd1VdC8um0bcfr6yZ0qURgCGJUpGHUMo2SRE3ZvSnDZHMPIYbRdel3hKuNjNLBgHek6
 hKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761222742; x=1761827542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Kvjs75qZYXzJtgjOCgCUdq6Pu4BO5ORL4SkTS1d+ok=;
 b=f7KhPejPgZZNRAMGrPmCR6fBhLjEKirff6DCx6w3yYJMs7QXoSdPSQY5D1LRwMGaOh
 QNcgG5c6KoIqtVlesiLck0Lx9ieYrD0Drn8m4KjgZrs4EsBSgQhQsqfWjndXeM/AxXxm
 U1+nBphw24o69ihNjHYx20gK+IvJwa3M/u+LJO6Di35AnbStQN7UKq+U9OiVI7uFQIbz
 voxdBeEW+K/sqz13okR/eOnBw4W6kxDTaXz9Zv2Aq+fQt9oLP+javpRQyo4xiKqx5Glu
 /KzZX+VCQRBuEMEVsC2oi4D//GQXv4o5l6CoyueRWmDptdY4b0NOK/Om4qATneCP4Yih
 CwTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRUSbXbdDjAffVfat3YARPnlTjE++/Ylq+EGtX+eRAodAJOGoJglN17C9nCCFWhlyMp8AaLeNnhg==@nongnu.org
X-Gm-Message-State: AOJu0YztnJEOitk/Wr+On+Wdw0bez16iiQOZhQ8BwaHQrFGsOJTcbQvK
 UjISRIH3SAFsS+hZOcqIPHCqYOyP6S/+u6Wo2cQDyF2zGjbtfXdyNAwM1L48ZLSBITk=
X-Gm-Gg: ASbGncvT0Sf12qAirgWkbEswKTOxAzJ/NRPZ2aHiBRQZkg37A8onQQKD9ppofcUB1Nk
 xOfjbQ/obOeWznFF7ckY8oO5irOpb+Xdu23Q3TqqEfGZsAUsbK9FsCcIiXMxF3Yw90oGdStHIOz
 532B14+ok0mWTGn0rC9Qq7Ziw1YMbqFh0Qw6qIB55T/ycLAt62rD3koNQowgJ39pI3LGtUhB/A7
 ti+18PO5tMhiSkMoiGOfPAZH4OipjtBrGNheoh2k+AeoLA7y9+BjupY3iMLZRdeAT8sZHmI4lBP
 ofk3ccREAlK77CrFTcCq4ge1dPC6aJmSMt6FQkP97vxjbG8ulWRm0XgT22Q7KSxa7WNBua8Uyp+
 au6Oz8CS34Rv3ttriZQAuvp24MyA8Cb0KELGeF44PzCXS22YoH/IO5zDVfTMttcAN9iZyQZDvOb
 W7T2eZE6GLlee46d0oLEy5ddOGvErx2cDb502iGUGixNvoYzlnu1ZI+hSnlEmV
X-Google-Smtp-Source: AGHT+IEx8BFpjNXhusxQrpqpHoXCU7z+MXPRfMepaQ3/Co4IjjhB0iiMYA7kTEFc7OtLYixtJcW5wQ==
X-Received: by 2002:a05:600c:8714:b0:471:b5d:2db9 with SMTP id
 5b1f17b1804b1-475cb03016cmr15327865e9.21.1761222742547; 
 Thu, 23 Oct 2025 05:32:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4281314sm95056335e9.4.2025.10.23.05.32.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 05:32:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 57/58] hw/arm/virt: Warn when HVF doesn't report IPA bit
 length
Date: Thu, 23 Oct 2025 14:31:41 +0200
Message-ID: <20251023123142.8062-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Emit a warning when HVF doesn't return the IPA bit length
and return -1 as "this accelerator is not usable", allowing
QEMU to try with the next one (when using '-accel hvf:tcg').

Reported-by: Ivan Krasilnikov
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2981
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 175023897a7..1d65fa471dc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3225,8 +3225,12 @@ static int virt_hvf_get_physical_address_range(MachineState *ms)
 {
     VirtMachineState *vms = VIRT_MACHINE(ms);
 
-    int default_ipa_size = hvf_arm_get_default_ipa_bit_size();
-    int max_ipa_size = hvf_arm_get_max_ipa_bit_size();
+    uint32_t default_ipa_size = hvf_arm_get_default_ipa_bit_size();
+    uint32_t max_ipa_size = hvf_arm_get_max_ipa_bit_size();
+    if (!default_ipa_size || !max_ipa_size) {
+        warn_report("HVF didn't report IPA bit length");
+        return -1;
+    }
 
     /* We freeze the memory map to compute the highest gpa */
     virt_set_memmap(vms, max_ipa_size);
-- 
2.51.0


