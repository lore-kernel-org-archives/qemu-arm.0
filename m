Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBF6C9EC67
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:31:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFCY-0000ns-In; Mon, 12 Jan 2026 05:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFCV-0000ew-14
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:07 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFCT-0001g0-DW
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:06 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-477632b0621so38629485e9.2
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213863; x=1768818663; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdxPWV01/6nmJEhYXTQC44DzHogM6aeRuubkA7qkB3I=;
 b=s9LiGzaOTTUg0sj8xF6Vj2FoMQaUrjuHMH6CEyuTWQhCF4ax+FeA87kc0trIochtMJ
 Z6B+3w/NjSNQP/iUtkmXAFmwJVPepMA/ZSfu+jaBSp2BWpLpDZyF6Y9viKbwgZO8YsbW
 59QUkSqdRoEuW4OcEqevjdndh/Qmcxp9qhNPWn8groM5W7jaTocWqKkWUpVIgCZzh3f4
 PH4tcxQHdD4hKXrt87hsgv9hkXZk83oG0TmDFAbIAMSZYGpfLAgV8LmIfPW8/5bpFkyC
 5kyKInVTeb7cNbDnrK+HKNKJBBtr6dojwMx7IZBe8tJl/JO0w1rb+AtGhmBnY/4KvBlW
 AShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213863; x=1768818663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sdxPWV01/6nmJEhYXTQC44DzHogM6aeRuubkA7qkB3I=;
 b=uIHS5pdc8ZGbTkjxu2cq6LVVasiuRe9chF9nIVjJFR8BE5wl4tMz805/iJ/Ew0ep3f
 qsutFqZsZtQnq5RDhUblsanMuZ2oJRLFzAFKql0U15PrFX7puH3IvuxJrHmVtTU9C/iD
 tMwBx0q/5YtkO5seUECh6dt1Wv+GEPJphfBkGTO3rbDylpEGqX1kFn9YY93sPchlMvYA
 xBoWGmLgYHSJfNMtAUOPXAROWvp41vl9b3oC08HaiDmfxfnItPfhP9ilSJXCgKAD++/R
 s2+LZOkRSkMoORXxfoqoHSb0OdGBjHnKf/ShxB8Ppbo4FusvQ2pAxZQpG/qijzb1xFOU
 9OvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkMGQpatFPkgakHCaqT1fJtiepgbgpNQ1zi5gThiKguaEXz1VTZEf7+PlnlMiEeVEw4OyN19N0Sw==@nongnu.org
X-Gm-Message-State: AOJu0Yxi/a/5lfYTjvlf8swW8U24APPJ08unL410ahgE+PV7GoE+mQ66
 xYnXnqTiye9TbnqNH6Djw8JUZpg3NRSk7LVQ1bB42+HaeESzP8MZ4H+UVPgaHQAqD6M=
X-Gm-Gg: AY/fxX6tBSjmv+FFr9EnK8yCMkQBI/kuzsjTCdyKybRNQqarmP46/vY7rLMggtGjUkR
 3bPrgdAxSXhJIvJYu54AX4zHXrRTRag8RBIvEmS2EuY/QzFGobKfHtOxnpDZp1JSDRQHLWzd4Gl
 henmT3QBm5sJI1XKuLDB+7UPedBbOBShqsyiesayfNlUk1pw2vvZ/JGyiCW2rmdaa+sVXHYpeSD
 lh/gJBgI3lTHw2GJ+iXSU+3iBNWmgwTNt4V6PX+QpouKiKz4V+yA7Z1QRdbnYbFLctCG27WZ68F
 i2yOf6OSqt+aix2ykEDowierwLIAD5Mnb4Ow56Ybvp0eKPhSoW552TciQCco3rQNam1VwfaO06G
 gCDL6Ul455FS5tDfsy3bvI8F/btYk2caKeRmEoJD+JRcprKcuLkuu2wtRYqNh5IY1vwuYY9OVah
 Iu9+8/1yULTWeEJ4qreXyhZtDwXUg9ERJTPWwxopUZUFnTh+m2pvSnzM+SpBtR
X-Google-Smtp-Source: AGHT+IGW/uS96/6kTtHUuZ1heBSX/hPA0wMfZihSjWAG/nFtfzwmyfRFPLTg+jz0Q9fvgJX4YgUYfg==
X-Received: by 2002:a05:600c:83c9:b0:45d:5c71:769a with SMTP id
 5b1f17b1804b1-47d84b3b650mr194319305e9.26.1768213863556; 
 Mon, 12 Jan 2026 02:31:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f390a69sm344400635e9.0.2026.01.12.02.31.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:31:03 -0800 (PST)
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
Subject: [PATCH v6 04/19] target/i386/hvf: Use hvf_unprotect_dirty_range
Date: Mon, 12 Jan 2026 11:30:18 +0100
Message-ID: <20260112103034.65310-5-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 target/i386/hvf/hvf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 731cd954630..1610000d9ca 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -142,8 +142,7 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
             uint64_t dirty_page_start = gpa & page_mask;
 
             memory_region_set_dirty(slot->region, gpa - slot->start, 1);
-            hv_vm_protect(dirty_page_start, page_size,
-                          HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
+            hvf_unprotect_dirty_range(dirty_page_start, page_size);
         }
     }
 
-- 
2.52.0


