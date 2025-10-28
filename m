Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299A9CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:45:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcVw-0004NP-Mj; Tue, 28 Oct 2025 01:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcVt-0004Lu-Qa
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:44:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcVo-0002ku-JW
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:44:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso3187466f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630289; x=1762235089; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXJBYBBxDFZzibjViQ0cPD/hzZBaElfD+qR56RI2SXQ=;
 b=NIZJdRJBFBu1dLBn1wHVCieIj6Y6+Iq/EGs3FIS+tEBdMQJdBrldN/Or8/wZVVFVC/
 zRY3p80iXITkq2rdmhyPiAoExA7sq7D6iFbPZXFs/anBOo2Hu7Av0gxc1iIftK7WUGvT
 JqZlr9+tEHZma/midvFMxBOvEodp5VnTxPQSira9NbNmaCuXpC0Gx34VW7i76gDpwsjd
 S6TYd/xLpjFizRkmsaTwZhwzFvRjZD/dMkIVyO7bbjqT8hhT/f2MpOKWEOB123Iwu/v5
 GvmjUfkzitsS32ofSKnXjxQJh+bAHiJ+i18wGTVuGTuPxVbh9L3n+cpELy5imw8Ro70U
 iyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630289; x=1762235089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXJBYBBxDFZzibjViQ0cPD/hzZBaElfD+qR56RI2SXQ=;
 b=iOKebhB+IT00lsY/ShOZzepNq4Os7BHlpVycwpdqK7cEWtI2aI1M6BPsSpUp+ey8Xf
 5i/eF306DkWvsP0YDY+gbT2kjdpJ6BQ/10Z091s9y2MdI6AR9rEqdSo62yE4QJQ5NnyV
 dXQLvUDhtduOsobiR1DFUCQUzAR3FJ3G6/bsou1b2XxYbwJXG7r/BQuTIFPws27d0BLt
 WfaHZw1TvH5PLasYn/suJNhX6BFgHt5QpN3t0N5wrrLci3ptHgTrnHX0bEjPsNVFoM1X
 GEGqlELyd/jd4fmTC316jnRqSg82ygEEgmTyaM8/gtlThWt1N/02mZjixQvixxBQtu5k
 9S8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOM5JiuxdYwZYMsnoyhIJ3DAmRrUHE06mpvg0G0GNe3if3beDj1kmeoTLjC0sQoBMLi2Cxsohn4A==@nongnu.org
X-Gm-Message-State: AOJu0Yzq30/eCyq7xv5liAINzykyCjfjLjG3i1TPgvVeKTRUbBeDK4cn
 7Q0b1rh7iwLjRa1P5HEzR2Zfh5UtFFP1h2BdHzOemmQdrNSQNCrJZqite41J2q/zNTY=
X-Gm-Gg: ASbGncvUHDaEAczTcB+sJT88o1Buq99I4qG9xLHu+EZ2TXOnYvxjSvVlJONCrImR1/D
 FKrqiCJS4HQaVBQHpzM/jHFs09C5OhFhI85YoK0OWSyvIGsFqJKLpgEVxIi6Xo22/QkocbxXN38
 4Fn+ClXVmf8Nqb+yGD/HCw5x6rAaBtubQeVyu1ag3EWbXQYHICJoldZsGYu1xQO5DZNdFnwrswR
 SVTn6I6PEROJ2i0TEufYC+rdQBbIUlMkB6D6bkTaVXtrBEwhPkD1n0j2ruVhXObX21y1gb6RtOs
 Lx2BiTwAxLD8FXzMIxb9RdLpNnLxK2L8g2PrIOencvEgCLgmoTlxksMaykDNTdTAZoZ05J8SxES
 hG2gbcb+cGcMJHxsan3tCDOdyBKbM8BQKWMbOI2gCVAAcgM8eYmDlHktKlEM7i2Po/g/fsMDbIc
 lRUXg/6j5R0jS3kuStp3aVIoFTKJUNsT82rL/O6Odp/iyKy4WE4vOKyj0=
X-Google-Smtp-Source: AGHT+IGEFvpmIwIspPKKlIzjFpjfzi6Gy8JyBGuNuotOF1i3Klx0iY+oFvmZYD18xKgSn3uT/YQWFw==
X-Received: by 2002:a05:6000:2501:b0:427:6c6:4e31 with SMTP id
 ffacd0b85a97d-429a7e59e7fmr1886003f8f.22.1761630289136; 
 Mon, 27 Oct 2025 22:44:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cbb2bsm18299358f8f.13.2025.10.27.22.44.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:44:48 -0700 (PDT)
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 03/59] target/arm/hvf: Check hv_vcpus_exit() returned value
Date: Tue, 28 Oct 2025 06:41:39 +0100
Message-ID: <20251028054238.14949-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
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

hv_vcpus_exit() returns a hv_return_t enum type (defined
in <Hypervisor/hv_error.h>). Assert we succeeded, as we
are not ready to handle any error path.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 91bbd3a6aae..4c98faebbed 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -963,9 +963,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    hv_return_t ret;
     trace_hvf_kick_vcpu_thread(cpu->cpu_index, cpu->stop);
     cpus_kick_thread(cpu);
-    hv_vcpus_exit(&cpu->accel->fd, 1);
+    ret = hv_vcpus_exit(&cpu->accel->fd, 1);
+    assert_hvf_ok(ret);
 }
 
 static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
-- 
2.51.0


