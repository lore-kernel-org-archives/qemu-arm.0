Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA8CCEACCB
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:09:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK06x-0004Jl-9w; Fri, 14 Nov 2025 15:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK02r-0007Df-Cv
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:05:23 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK02p-00050e-SF
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:05:21 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477632d45c9so18301185e9.2
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150718; x=1763755518; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZhaKZtIHcKQyEzCs44RThvX4QVJ1Sgd9Tp4DxoQS0nM=;
 b=QpVMznyz4/5ADSa9rH3ROIHR0v5G52s+uC2Fit/j8VAAJdVNPPNC5H+ilIx0hEujFn
 BnU5NN6UBDvdiLYQZ1EGT5NuwC4fVIuvrHFwMxeUdauUlt4Y71l2YP36sNn1efT5K1T3
 qCCjFTJ2zMnO4hMHn2NLI6poxQUAZFp8SPGfiWmof0ehTX7eMQ5lj0i262qkRR4R/4ci
 b31+uttRGvZChs4AyABWHsbGhVHW9oIXs6xr3WblpS4Gib6Mw5HRFu7HtjJO6KKWFxsd
 SPc6zAD5crC9h2aoA1i3trMzNYqV0KwX1mfkiZoWG+q/EVlRw42yn1pr9rZVJGkdYX5A
 8BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150718; x=1763755518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZhaKZtIHcKQyEzCs44RThvX4QVJ1Sgd9Tp4DxoQS0nM=;
 b=susi0k6fM2HctFZAQgh97JnuBAaRG5gs8EYnJL4n0noaugLzPYRPRx4EM+rElxQ2my
 HgF3IhqLFHg/sBaH6wHga5ivFr05d40sX+fDOk4GkGrEV2dWDniA1DnoL4MIJCL52DW/
 wgC332OP/JFdqYpol6i1mCloM5r76xw+7aqMRbr4+QOZsHrCsQ9cZiJzF5NuWMYA1FiB
 YpzcU6CZAKYGHOKpWsbtSEbxgH21p3bIYypg5kANCtFJUD2zHz0s/Xhnn/q77mGZhWvX
 UnzBtAvbjK0rxmXh7+l97YjjlTyenn0UDKRZLgngV1upkc/B0kgrWc0anN/2/rxFUUpF
 AV3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5k/MY/kv1TCBwc/kVRazCQuEAqLJ8AHMDWW7STMmrlA1pZneaPlZ/ZnlDKr6dM/CRAJORA9HV0Q==@nongnu.org
X-Gm-Message-State: AOJu0YxYtuhYahOk249MpHUo6w2GWRpOLqIdm1RegkC8IC8cjD4Zz797
 ECzX+OQFvmnkzlRCfJcoumKOU3+HvbrPaKAZEn3c/6cy4WbKPiWUTh+Ghf7Q4zLD8IUr2I/wy2S
 nTakvmUgezw==
X-Gm-Gg: ASbGnctNK9lGM/Q3uUDZFnOc/MCIoupkMZ0aIvrZiXFS2FWUyvqQX7cRb/68LTUR2dB
 DWTtNodm48Mjd+AIxyYfsMbN/bETPlFQVzTd4xthtu1EQ8weXzxjyAeogWh/iR7FXnirtmyPG6Z
 jpcN6nQzWkUFgOLU7aD2WssuVRZNaCOU6zTJYcL9ifoZlWDqyT2t7I/3K7UhUwKo0gUETK1yg3z
 4hUjUHEzwYiW+ItcyrSpAWh6vu7WJx7JKRWdjdeqSA2ioj+57HwDx5sfzNoWTG46DUjfNpXmK1J
 s3PGAyzlnnm4dCBT20qht7jPRcF7B748pV826zD9PNZXtCA9xCz/zAXpRwhoqcw75Sf2LzGUx4W
 GS+y4FnKXCybgtflQuLMBuzD50Fy7WSbAAS3a95vZq4JR7JCshNlNzfsPzm4KHir21C5RZIdUKV
 ngVl6kgCetfeaULk6dxR4MURSng40/xys4MxBunVkzOSn/zHGuQA==
X-Google-Smtp-Source: AGHT+IGxOPmZaiU2QIqOX8vP2waXUQsTuY9lyWNssyfSaOv12O7A6NZdYYkp5MiCp7Ro8Cax4ElNMQ==
X-Received: by 2002:a05:600c:8b21:b0:471:13dd:bae7 with SMTP id
 5b1f17b1804b1-4778fe883e3mr50226165e9.30.1763150718467; 
 Fri, 14 Nov 2025 12:05:18 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477969b3c12sm7706355e9.13.2025.11.14.12.05.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:05:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 07/19] accel/hvf: Move hvf_log_sync to hvf_log_clear
Date: Fri, 14 Nov 2025 21:04:09 +0100
Message-ID: <20251114200422.4280-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Right idea, wrong hook.  log_sync is called before using
dirty bit data (which for hvf is already up-to-date),
whereas log_clear is called before cleaning the range.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/hvf/hvf-all.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 601e63c7f9a..f203a6251f0 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -224,12 +224,13 @@ static void hvf_log_stop(MemoryListener *listener,
     }
 }
 
-static void hvf_log_sync(MemoryListener *listener,
-                         MemoryRegionSection *section)
+static void hvf_log_clear(MemoryListener *listener,
+                          MemoryRegionSection *section)
 {
     /*
-     * sync of dirty pages is handled elsewhere; just make sure we keep
-     * tracking the region.
+     * The dirty page bits within section are being cleared.
+     * Some number of those pages may have been dirtied and
+     * the write permission enabled.  Reset the range read-only.
      */
     hvf_protect_clean_range(section->offset_within_address_space,
                             int128_get64(section->size));
@@ -254,7 +255,7 @@ static MemoryListener hvf_memory_listener = {
     .region_del = hvf_region_del,
     .log_start = hvf_log_start,
     .log_stop = hvf_log_stop,
-    .log_sync = hvf_log_sync,
+    .log_clear = hvf_log_clear,
 };
 
 static int hvf_accel_init(AccelState *as, MachineState *ms)
-- 
2.51.0


