Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B89CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 02:57:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1c96-0001yL-QA; Wed, 24 Sep 2025 22:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1c95-0001y4-VH
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 22:55:48 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1c8y-0002WC-Fu
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 22:55:47 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so310455f8f.0
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 19:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758768934; x=1759373734; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMSkQ8tS0Fq3QSh+vFnvslWSeFrUAxUcnptpA9cP+L4=;
 b=NXMwhVlA2jZsZhIoG/0DOBcr1eSNbEtKg/G9n9tZ4go3CtEqAXsL6RlOOHqcmfgquu
 mCFnSlhmdDUeD2RldT+Y4QcJGZgMbCXD76ivtTfwH3R714ZBrRrYrXMixcUfk2nzcSvC
 RRIUKhn8aj79U87S4Vl0QsbKFz37PBYtvB3U530nbvFvjyM+QO1VOIoOM3K1REDveWry
 Jbr3mNlV0DLPqpf3tU5zrcLInSmwmUIbYrd9hGlcrRDSWb3XWCrC5mwVBs7ZtoB5CYGL
 45AI9LPgsI+Rgl+dSI9+R5OVHmqVLwGAEJimhJvHOndy4izNdEXMrPItDf420co6H4IX
 HinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758768934; x=1759373734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GMSkQ8tS0Fq3QSh+vFnvslWSeFrUAxUcnptpA9cP+L4=;
 b=B2TyUTrLIDtLrgq4gfOjr+P6Cf5jorMPNlwu4AyOc5Scgv+OI6IO8A/bkyE+QxumK9
 CdicKMcvKm6k/4twMAZ53BANrQYK9+ZUQOkTlg2AFC8nrSN+qm0Yq+YT46NJyycQhksW
 tqtiFVDtdTRE+2caeOKeFQwCo5Sk7IFe9UBFLeByBtotdPyS26E3LiwIor2vqMLD4o/Z
 cB6X7AbLynw9E5sqYUAzRTcoYYXGKaUYE2TutZJjgC/A02cWXV4Dr0+NUojFf1EdyGIy
 iLokET9m6eKfy+xsXy93foVqcWX1RWcwO6lzY9oZEOgqC4btGt5ERYHiu0W+b77Lsxu8
 rROA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEzK7255J3W1xp2VF3CV+/HrYGOVe6rcLJrDjJFT+AtI3+rN146dtGcW5v85P10/eeLBONcDvBkQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw28pFxd4Ugz5E1UK33W6LWyPilogeVuH2EYyDi7rM3pbFCPmto
 U1K8x5oRgYPG7f26ZH1yDSVFIwg3oBnlEaCnqTov0DYsFKun8t1pHerXRyhpiKBEoSo=
X-Gm-Gg: ASbGncuYqKwMj1gEcxmw5UMjbXcXTGWfg6Ksd/Ib5YiBk07lDnrsHUi1+3k0m+oNwpj
 19cbmmPxOoiJMSAiV6TdkShs+XyWzmF2/FU8BePIK2XCvx8daNJejAR7RTqPmRatNORjYdFmCpq
 Fu5i1z7UirpJaUDa9G1FWc103QgTugPEYDuH9bl/gjyFo3/N7TrFWX4/baLCkkfbvrb8yWL5ut7
 7AI4spiy8MJwqbSbtxT+ma8BgZd/cmqJsMbdNgJOkZbtD5JnqJSVCUmArSlTzOQpT0Lfadparmd
 K6D95m25FQ6byXwDhnekQqTgLtGdEyg9519LUVT4rlC9vIkIsX7yTXlGcKVwe+POxy/ZGJ3MrSq
 uVsw+sImyU4g+TrFwHdev3WlULquIktB6Tgi7y69IAmYTXoan5sCR3HVGR2yTZJI8RxFPp+Qc
X-Google-Smtp-Source: AGHT+IGUgr+uSOvWhJNgshrow4YUrsqarBBn7PfgQ8z4KuRBhxvHTHxpq90zU3j/a00h/1m/rIhrZQ==
X-Received: by 2002:a05:6000:607:b0:3e7:451f:3a6e with SMTP id
 ffacd0b85a97d-40e4bff51d6mr1567732f8f.51.1758768934460; 
 Wed, 24 Sep 2025 19:55:34 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb74e46bcsm939728f8f.8.2025.09.24.19.55.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Sep 2025 19:55:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH 2/4] cpus: Access CPUState::thread_kicked atomically
Date: Thu, 25 Sep 2025 04:55:17 +0200
Message-ID: <20250925025520.71805-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925025520.71805-1-philmd@linaro.org>
References: <20250925025520.71805-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

cpus_kick_thread() is called via cpu_exit() -> qemu_cpu_kick(),
and also via gdb_syscall_handling(). Access the CPUState field
using atomic accesses. See commit 8ac2ca02744 ("accel: use atomic
accesses for exit_request") for rationale.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/cpus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/cpus.c b/system/cpus.c
index 6062226d4ac..818a8047198 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -480,10 +480,10 @@ void qemu_process_cpu_events(CPUState *cpu)
 
 void cpus_kick_thread(CPUState *cpu)
 {
-    if (cpu->thread_kicked) {
+    if (qatomic_read(&cpu->thread_kicked)) {
         return;
     }
-    cpu->thread_kicked = true;
+    qatomic_set(&cpu->thread_kicked, true);
 
 #ifndef _WIN32
     int err = pthread_kill(cpu->thread->thread, SIG_IPI);
-- 
2.51.0


