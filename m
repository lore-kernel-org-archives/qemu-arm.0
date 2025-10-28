Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF39DCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:49:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDca1-0008GI-T0; Tue, 28 Oct 2025 01:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcZz-0008FK-B6
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:49:11 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcZw-0003j5-RK
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:49:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-474975af41dso37718035e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630547; x=1762235347; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h63K7KJw7fL2qe3qT9jwFp5KsLmsyTaO/eJCwYKGslM=;
 b=ivNiX5gLvdSK2zHFSa4rXWmApyHJobHQYexH7cDiArJl1yqu6a7q/pGdLagGz9C2Jy
 jf1zVi6bBAiakJTZ5BEQbQZMa6IAb7J3vW6HrNhmNUMWaOaAMTtqCdlZIqPjT451tGER
 nL7w/NFGojZgc8kIHwdIvnglkPi5Ch2n7zGay4dbeWWfypl6IG3/GHooe4Zwi2I0LoNn
 5tXgeCiajruXfwkNZLel05M0SaWQcDNBZXLcO9TRXhKzvCpY+KURU1+i26i9Wh8Xi5a5
 S/LQNEWpxRntAZQFxtIFctb0g7kkR0zPf0bZqNFkhg+IMcyC3ttgeNPnAeU2WslNlaeO
 thHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630547; x=1762235347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h63K7KJw7fL2qe3qT9jwFp5KsLmsyTaO/eJCwYKGslM=;
 b=AtD22Bh2aVldqK9LF4SQpMwYGI7ab8g14y+wqOiQT+TROuRkokj+ZIzCh6/+0DyUib
 oz3vq2lwVykdaSfshsHxx5miwJsurORvf7lcF/GKucVE3wuMYQ91tpee/gSh98UuEIQL
 mRN39lGRcL4Uz9vGhSfIHBg0ZniXhDp0mBL/Q3c+QykUj25G6X+o9OJ6+xArz2V1AX23
 Za5WkmzDx8n+xemd+z5Ck/qZeU2Ar+3bsWwQ+ieRObcqWW5KOoqOCva21KateICJG8Qj
 gwfoS+HzI20GJMxwm6KiuGA0sO0s7cbZgXi1tMmvkH0oapkZxmxiQsOQg4nxddk3R3Ba
 3dQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIbjPHhEm/hiKZB896FT5TgAxsMq/NxPRsYNtIwPR+UXyAOm0R1a6GukQHKTqy0Ul4Ij1PSNIedw==@nongnu.org
X-Gm-Message-State: AOJu0YwPAcEl4GaPgdRkZ8sTiJxo5+86h+m4yIEneMROd1Snp98OUHWH
 D0Deb5rom2aG63acxKp6pDUy06DIWWYEngyNAfn+xuMjnWAKmXqeF0NJdfNJ+bKAinY=
X-Gm-Gg: ASbGncticA4FLHmmVzogtxokzKVqM/pmQjd3lmaNlB2vrrPILhGreSuwK7YMH+aZU+F
 6omJWDT/ZLsqoJOdJ1njGcqbAYFhSSuIuYqe0u6Ab/tpZm0JMK+y0VlT2JX0FmbqE8fwciALY2v
 kekE8pH3l18rLhuKU3flWeFfantYwRBpOv7P/QuCm/kxWp1nIhE/bQRZBiEluLZLF1xrCknuaoJ
 Zsf2rbAnUi9HCpcPuJw+NPElfZ9WohI4fNxfEZNWomzcSTbaxOy/jokSUd27Nf1icoNttVIYeCP
 lN0P0yarHRRxjeZchrs0GEQN/h+TbwA9iQ539h6PDezvsvbmi+cq74RfFXKJWS/Ces2+H7JHT/c
 9tbIR0W/g5R7n2lZv4JZKjB1gOet63J/10CkmU+OT3ICjJpOFWcA5cQyN7RnexdZM3opdIBtTOL
 m6yqm0OKrpNLvwRhWd5HJqAIDMGHUQINq4xEc8vOsfllATt6ZEwYaFtmQ=
X-Google-Smtp-Source: AGHT+IG8SyepO8HAE4XKAL4Hjo11+ewbrPLiNSuCnBknM7uUOvKDJVBR/LhWSReNENe8yY2P7TaJLg==
X-Received: by 2002:a05:600c:680a:b0:471:13fc:4ad3 with SMTP id
 5b1f17b1804b1-47717df7ee5mr17662185e9.2.1761630546982; 
 Mon, 27 Oct 2025 22:49:06 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd478202sm174432655e9.14.2025.10.27.22.49.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:49:06 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/59] target/arm/hvf: Mention hvf_sync_vtimer() must run
 on vCPU thread
Date: Tue, 28 Oct 2025 06:41:45 +0100
Message-ID: <20251028054238.14949-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Since hvf_sync_vtimer() calls hv_vcpu_get_sys_reg(),
which must run on a vCPU, it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8095cb0805a..bfccf5e9a2a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1764,6 +1764,7 @@ static void hvf_wfi(CPUState *cpu)
     hvf_wait_for_ipi(cpu, &ts);
 }
 
+/* Must be called by the owning thread */
 static void hvf_sync_vtimer(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
-- 
2.51.0


