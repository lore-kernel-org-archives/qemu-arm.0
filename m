Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AACC9EC63
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:32:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDJ-0001gT-KA; Mon, 12 Jan 2026 05:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDA-0001TD-5r
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:50 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFD8-0001mC-HZ
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so22597765e9.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213905; x=1768818705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jk+GlBfd4MnMnSNPuwPicByGCHTQSdU/sy3BPUcATpE=;
 b=ukJSNDeY7CMN7aoyxOEImP3spMmfn6l83KnLnutvN5svpMel7RdR2v9kanL4lWTqK+
 0GM7AsxzE0EPMYJf9GA2+EgnL51x7qKzU60gUACpZ250XT2VI+KpYrqJ5dY6mfA6T6R1
 eb5VFoG63X1IhS9mpitsMVQohS5ignAJ9FEfvmiyO+Ta9ZKo4FXP9LP+MMvrqvXDgY7k
 dV2eV7qKhJaX3jKF0j19vihD0csAsf+DVBC8h7ROCcaOUxEVSHypnrI4b7W8uZaIOxL0
 d3JQUuVgH1LQ426D4FneRvmOD2ptIKmto0IZP9OT+kq41kxtGBDyGfSElqLdjmlIXb14
 IhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213905; x=1768818705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jk+GlBfd4MnMnSNPuwPicByGCHTQSdU/sy3BPUcATpE=;
 b=nmDISo+lU+dXKPtijJb+rs/Y7FjyQQWYgstkBxgomoXkyWUx8cqVOldH+850T4gq1M
 mHmP5HrWl56NTj87OAUlHvCg3zep0Qq6ScvA0KLZ9UVrFajyahWQAu42QoL2XkiX2Dzr
 SN7tGp0VFq0iP8/uv4VAPk8sYI9ctUqTD6d3y/UnSQr4o9oDXAPQWX0LtXxreUfmizl0
 C/7labWKWKM+i3ZkqpHkNoMEdn+i/PdOvf5j7DGUaiLv3y+U0OuW50awVlXfYi17LffP
 1Z61dZdKaJYs991ZSMr8hK9Gep/55XVBvbS++QcxGKVDK3O142LiQROPkxqQk7PooLg4
 s2YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzUa/0+UQyldOOIt/twvHTH9t8AzEI/AbkhzB3TSyAAunVvrcQWI6GyRW1oCSsChBNbhya8/cVzg==@nongnu.org
X-Gm-Message-State: AOJu0YyWaj+xJsmAGSdg4WDq2p3lZ8gI9Nck5SQ/HKwp0vcSSI74Eysy
 LO66hhXDBVI8GQ+UmwvWOLqmS3oEBpuLFzIbIh1Hesw3BO2MSJ35NqQTZEfayhtlPJAoyabtVIw
 mdJ+8nCk=
X-Gm-Gg: AY/fxX5xGqegkShvp/pluEpemeJIE7Up6cvL9AfM/JasVSvwEJWb5Gr8TmH44skCYEy
 C+NOvGDD85UrwRtho+YBOh33u5W5Bg5/fyIpjHrG0ubEmbwzbE01Uv4YqvXndnA9wNQfBo7Ph3Z
 /ZxBuuYAEwNGujxU+6FVfpUuh567byOLEQVA7/dfPh5MC0B7ZlW+8G/2vf/+lBCVjkohXUt/AvC
 ZBKZuO3cZt1xLGcYHnyS0buAMBCR/CzjOxlfkruC/qbSHg7rgDAG6EZYM+jXTjHIATccIUf1roI
 FBhZBxu18MmR/O2e2SLGbc09WgdJvRQbVNGG737oZWUzhwddr9atXp9I0JLD1qWNolY3RJbaImy
 vD8OtfNBnxe5ELd2dJ5eJgFP+DnFm1RRcardClgBMhAQml+deEWE2On8/eYabp5WUoNMnC0/Pq9
 oCyBHPEpvmtXY9w4n5UmjfULAuu+gF1NP90Y2elQWOWYkwPMxcJuc174jFI4Bn9qRLhd/OoTU=
X-Google-Smtp-Source: AGHT+IHizxSyKMy535RWVIsej9xSU97E5QPdXR7pyxDK29UWY3XaC/0ccXP7hOmpNCgyvRi2Jl5k5w==
X-Received: by 2002:a05:600c:681b:b0:477:a219:cdc3 with SMTP id
 5b1f17b1804b1-47d8486d5e6mr179002385e9.12.1768213905078; 
 Mon, 12 Jan 2026 02:31:45 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee24esm37617534f8f.33.2026.01.12.02.31.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:31:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 10/19] accel/hvf: Remove mac_slots
Date: Mon, 12 Jan 2026 11:30:24 +0100
Message-ID: <20260112103034.65310-11-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This data structure is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 accel/hvf/hvf-all.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index dd9ea641ea5..0fbe27dfa26 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -22,15 +22,6 @@
 
 bool hvf_allowed;
 
-struct mac_slot {
-    int present;
-    uint64_t size;
-    uint64_t gpa_start;
-    uint64_t gva;
-};
-
-struct mac_slot mac_slots[32];
-
 const char *hvf_return_string(hv_return_t ret)
 {
     switch (ret) {
-- 
2.52.0


