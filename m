Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED29ACD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:12:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtGV-0005yN-8M; Fri, 15 May 2026 10:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtGT-0005sm-S6
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:45 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtGR-00048J-Ja
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-44a14580111so6697229f8f.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854302; x=1779459102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mPHHkuT68LQ8THDPOQM1jypUgrX1zdRt0XHWxhQhz5I=;
 b=T61bIlh26ZAWb4Ox/oMXW/yaFzl256ZJNd27NvY3iB1XcqNAE/yWXAvmB1l1UQD4k3
 hQV/YTz1a5kQ7KOEccCfPuEjgFhHESDZDMBPRznAkxqvNq7IQTnOJgbJqxr86B2rHszR
 1HjDjkg/ps+QsULzqFXACZUa77WT++VUUHGfDbrHV13Gn84rICl332KQDPAaT87fg2gb
 Gahpl6BTKNOGyx75dZaGfQuEk4EK2icmYQSSxE5Tkmy3D1F6GuW/if3z8LPrPgYnFrQ8
 LZE7yT9ubgBqEp/1p4seAltk/NpfTNxzLmLwx/2orNrnFCqhMr++6BMh7X8ceJYahtsr
 k/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854302; x=1779459102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mPHHkuT68LQ8THDPOQM1jypUgrX1zdRt0XHWxhQhz5I=;
 b=CP2mQke/QP5BOoFlos8XVhp/f5XceipLF2AgfQj4ZPIEPJVzag0PWhc8yPaCrAffWV
 HIxA1PAeo/hOVbWW+jN9xdtDUv8F8+63ub7ZRs6XA8ECyPJuIp4JtgUQ2rDq3kvAtiz9
 /K5M0qyA3+lomriGNwSrM9GRArhFt+8mQeKz2m/zq+01l1Lw4FDgPK7kTP/GCpz4UTsF
 Jc/qjalsvSxa/h7JdLHZb3UX+RW2aJlmyQ0TJ3MW9fknvCVkWh607PmbjaNZxFmH5QyY
 8NbgA+EUBMr1WsXaOoCM9aADuH1MoErgcuDrVbB/eaHbtnHsQuGtC7UB2uUNh5TNQBaD
 Jz0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+jUWQ9pflJFGWBLboCFpE9wQJMgpPpUPvs9jDA4i+HHi0fE6MfmZTz2BvA5lI3VxekzUtBUXnPcg==@nongnu.org
X-Gm-Message-State: AOJu0YwvnmF94F/iDv0+uzoQpQrI5hirofIvm3EWnqN3j3VdzxHMXVSQ
 ElGmbz6jDvFRPdh7TC5mb9cI0w1BifC0AG7vR7xYOydb37+jFwkando0wOA/1dgAdnM=
X-Gm-Gg: Acq92OEdGt0WdMyHMNAIiPFk/mOmegbR37i0MbNxYtvECXGZeUw1CDZyHIPO6lHsux4
 I34cwt7YJPoigg2Jp/Lp2gdbhShYyXF6VuEM1cUpjH9gh/J3Co0IhjTvF8qw2BgzElc99hExmP8
 jwJWe8nZMCf51e0H5bRScLL9R6FvqR64a7MM85s4PB45hS/pErbXkdr/oGqBYqKJcn8sKbohvor
 gFbEB9kccegQvAQeke6NB8Lvmk5NSd7DXe7GzVLn5harjGOu7FEKg4H6UUMn07+/jZIAj632d/p
 UYnywtzZnlhRRC5MEVBVBOBEM/6FoHbHvxhzWCYS/LJCMIWGneu0MF0An+RG94gP6InPCystL7b
 3IWP8v/fwVSaU16deR+1DyPIKoEBHdonF/EubM5yQd7vbPvis3GFc+K/4fmeoVfvLPwxGuuTE57
 HpdhfpgmDrH5qpZXUJxOEz1KZ++OBEtuFrlSJkyFPIfSK3pIbmEsWqug6ffEDSYT9V0Ixe5ptey
 eVGtG4LtAo=
X-Received: by 2002:a5d:5d01:0:b0:452:a293:4d91 with SMTP id
 ffacd0b85a97d-45e5c34b279mr6122960f8f.0.1778854301916; 
 Fri, 15 May 2026 07:11:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13484679f8f.36.2026.05.15.07.11.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:11:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 09/20] target/arm: Build cpu64.o as common object
Date: Fri, 15 May 2026 16:10:20 +0200
Message-ID: <20260515141032.3271-10-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

While gdbstub64.o is already built once, build it as
common object, reducing target-specific set in arm_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 9eeccb2adca..f821331fbee 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -27,15 +27,13 @@ translate32_d = [
   decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
 ]
 
-arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
 arm_stubs_ss.add(files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
 ))
 
-arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-  'cpu64.c',
+arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64 + files(
   'gengvec64.c',
   'translate-a64.c',
   'translate-sve.c',
@@ -79,6 +77,9 @@ arm_common_user_system_ss.add(
   'vec_helper.c',
   'vfp_helper.c',
 ))
+arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+))
 
 arm_common_system_ss.add(files(
   'cpregs-at.c',
-- 
2.53.0


