Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2256346ejb;
        Fri, 8 Dec 2023 03:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt38sRNpqg2REeY21JV2NIpgQMxwi02/kNWzWKFCGsMU/vlIxeTooDmTPZTjVw/cQuYC1j
X-Received: by 2002:a05:6214:20ab:b0:67a:ea02:3f84 with SMTP id 11-20020a05621420ab00b0067aea023f84mr4497036qvd.29.1702035488714;
        Fri, 08 Dec 2023 03:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702035488; cv=none;
        d=google.com; s=arc-20160816;
        b=p6M4P3EFpAG9fWDJ8X5kQtLNtZc8rs+bT3JgotuTkB9PH3/KVE14f1zC2w2p1Q+RxL
         2EGlqBZJTfjTrcbQi5nJhWCAzs5+lATpW5bzX1+5GwxKrUPF4sE7BVmaFg1crKxKX//9
         Phf0gQEqmDGyCWHZEo+nnOR9O9QXfoXleNFE23zh8S51AMR2w9CDE2wrRgcsXefaCBhP
         1jwW+MN4RYPKMqw0Cd3vGxeH6L0XXXInKh8p22rSiBVk+Ds8grAwHO3pAsAXYkCKF8EZ
         fx8j2ZL1zTb3yCxzqy/xChU4nbYA82gtVQoJ5Gon8/UOy557fGCwK5lnisQaT79sGLiw
         9qTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OW+X1QC8WatkMetvJ6Ywtj3P4pbS5e79ta84qcwdOpI=;
        fh=QdevGGL2LydCvB/btUcdJnXEA7h6h6ICE8REXL8PVZU=;
        b=RDUz/30JQGjRJWx8YEx09a0JfwEkEAqzrWUu9isk4x7a8Dp0YZ3tVRxNopC2ou4TM2
         AcXEmMM8L/mgasQ1LQHxJT7simhMVBxagPSbgiO0RX2J77/PYrlMctcM9Qg70i5SvTRY
         VSuJZPoiqp30I3/jfRHyzMfihHMCPvdETMwcJkoZEubEkLa3WTz25MB0p/rwhA1XjndU
         5PLoB/IZCY6CN5T4x/ygzE71+2IbsSMNN9gg+/Ihb4pBVCNrPC4ThSZgQ+yzBfDFJCB/
         nLIy7sy2fcKFOMqynsSLNnUNBSwMw+K1eHFImsc3AJFArYC0Wji+C0aKobSyeGZaFb6g
         BSrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MOo0wKrI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020ad45289000000b0067ae0a2a124si1876998qvr.374.2023.12.08.03.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Dec 2023 03:38:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MOo0wKrI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBZ9G-0004CX-Rj; Fri, 08 Dec 2023 06:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ9D-00044e-1p
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:35:59 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBZ9B-00049k-BU
 for qemu-arm@nongnu.org; Fri, 08 Dec 2023 06:35:58 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3360ae1b937so366507f8f.0
 for <qemu-arm@nongnu.org>; Fri, 08 Dec 2023 03:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035356; x=1702640156; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OW+X1QC8WatkMetvJ6Ywtj3P4pbS5e79ta84qcwdOpI=;
 b=MOo0wKrIV2oBZEcjZdCO2bTFejsZ+zzJNlHu/oeGs1tfZtjOTJ2evCCqGbzUJYfddf
 m0rN4MVlAqBpLMv1Ya1/fLIA4DTbOwcqqF9ppQET4C6LbHKHgx+IZRrsFk3WZYkopgvI
 5VwF/nJ2hXrN91NUfxviAUV9nhk18hi2KxXq1E/YRfq8Euh/XWFc/NpDOJ2Vyk4zV1Cf
 EhWjBZErq5f67cFDfFWW71Kno2RPOEbuRvAEVJyrGSk33olkyDe0T8kOUxvHbRLdtx69
 Mbp81UI+ccPB92R8dGQPQFV2vqqEIRkWzjN7hZG/WshcrjkDcqTfZwmKY4pG9aGST5IJ
 PFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035356; x=1702640156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OW+X1QC8WatkMetvJ6Ywtj3P4pbS5e79ta84qcwdOpI=;
 b=agDACZ93VMzmcRQZCrVMz8xLTiC8ns2QEj42Zs9b53UATuekUzNrd1Iz09bE+OugwB
 KUIjQkNWp6V903p+vNwup6wVPOT4Mf/bTpBQslfUMpJ/oiE0ss29vYknRc+kt+QcB1Cg
 utqaE5rbw/zXVw8NUXfd+/hvCp6z7zVQQmkxdcuCc/vL0Jc6hLTyPUSscJ1JGTBHyJ7S
 b9x8XNpIjTjbIyly3NBA/gy2bRYK0yQEH8Pu5Y+cjlXef30NkVXqwkRUp3ao00xeIZLR
 QXdbRxvnoDKSp3P/xOhdWhaqKkGmdBZXq0r183gqFC+Au+b1x5dhZiWYP5kHEzgZs88s
 DQog==
X-Gm-Message-State: AOJu0YzQVbvNaQTm/vMNVpalkdVtkPnkbJ2bS2ZyQBbSYNxkudMp2sDy
 0Z6LfYUq19Z1mhC4H0Qe0E38RA==
X-Received: by 2002:a5d:6311:0:b0:333:2fd2:813d with SMTP id
 i17-20020a5d6311000000b003332fd2813dmr2679405wru.90.1702035356092; 
 Fri, 08 Dec 2023 03:35:56 -0800 (PST)
Received: from m1x-phil.lan ([176.176.146.181])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adff245000000b003332ef77db4sm1840624wrp.44.2023.12.08.03.35.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Dec 2023 03:35:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 4/6] target/arm: Ensure icount is enabled when emulating
 INST_RETIRED
Date: Fri,  8 Dec 2023 12:35:26 +0100
Message-ID: <20231208113529.74067-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208113529.74067-1-philmd@linaro.org>
References: <20231208113529.74067-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d2dObKF6nMY4

pmu_init() register its event checking the pm_event::supported()
handler. For INST_RETIRED, the event is only registered and the
bit enabled in the PMU Common Event Identification register when
icount is enabled as ICOUNT_PRECISE.

PMU events are TCG-only, hardware accelerators handle them
directly. Unfortunately we register the events in non-TCG builds,
leading to linking error such:

  ld: Undefined symbols:
    _icount_to_ns, referenced from:
      _instructions_ns_per in target_arm_helper.c.o
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

As a kludge, give a hint to the compiler by asserting the
pm_event::get_count() and pm_event::ns_per_count() handler will
only be called under this icount mode.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
As discussed in
https://lore.kernel.org/qemu-devel/CAFEAcA-HVf8vWLzmdStEo2NrSKQdZV612rBjiaj-gLW4vXyvpA@mail.gmail.com/
better would be to restrict the PMU events to TCG, but this is
out of the scope of this series.
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index adb0960bba..333fd5f4bf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -940,11 +940,13 @@ static bool instructions_supported(CPUARMState *env)
 
 static uint64_t instructions_get_count(CPUARMState *env)
 {
+    assert(icount_enabled() == ICOUNT_PRECISE);
     return (uint64_t)icount_get_raw();
 }
 
 static int64_t instructions_ns_per(uint64_t icount)
 {
+    assert(icount_enabled() == ICOUNT_PRECISE);
     return icount_to_ns((int64_t)icount);
 }
 #endif
-- 
2.41.0

