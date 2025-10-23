Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9CECCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:14:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBw4j-0005mF-RI; Thu, 23 Oct 2025 10:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw4h-0005js-IG
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:13:55 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw4f-0007N1-1g
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:13:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so437062f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761228831; x=1761833631; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zY05lUWL5hjS7DHXCd+KmMwND4lCTa4Rhsa0suClLwM=;
 b=rp0XvCetBO0tu0kraSVYqj+hjeIjs4TP1eqhEOH9Jw2OXuQXAGw46CX3U7xm2sNYua
 KEknV3Fm5uZobVibxQ+4un9OVXC56KYMh7papS/FrSufnSWHYx3Uj5I1kGem3lqe8T9/
 hE0wfaUjpXDRMb5fFtUkn70dfYb7FikkwJ+sSf1qIQtlpiKiXnQrhCtLKIt2sFp7K4nz
 bv9KBYfIkQfpZOxG5GNOu8xk9ZRCddSvQmOl0BCzxYKg8ZklREkWRaPjJT6aP3qChB22
 7RCtSjlnkfcFln8tqI1g/4roxXWgSQUIlSxNd1j7USNkDvdWAsM8VPu8dg/aeZa5pozR
 hqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228831; x=1761833631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zY05lUWL5hjS7DHXCd+KmMwND4lCTa4Rhsa0suClLwM=;
 b=w8uJ0dAlQexTERt6KC25Mp7UznuJ3CAwwyFpjtRlAFxjD5by5TGot6Oa3sug4N3wJa
 b5nNeB+elXUhR6i7O55NFlRL6av17ysRdMwSuam5wJpIx2vp2GETMrxZj8bFlogVKwcq
 eJ3eJnVFWrW1YCutJA0YP1cB37kZDBhlW+8KHFOreI54SvMwdvkn9x+kH0zwKwkpZSiR
 rbcFt0mSlpduAWsayI2IlbRbgZqswsDELSxX7jGQymBppfGjpOUW14KZAkCrdAKSea0b
 tB+b4h9CGwgFIjsf+z5Uwhs8zlA6fJ6szT4iOq5BNLutGrDB7Nbw1lAaqRKZs7cb8nyb
 ycZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQVsBLeSVD3gCdVaIcZaCczCwlU9bOFUHx2kkZrtMIVTWpu3+aN7C8H3gxPUVWUORkG6ax0KEFaw==@nongnu.org
X-Gm-Message-State: AOJu0YzFgo1siQ4pJmtXuC5p1ZJA53r0ccr/pKSPKUa5TwXgaku+cBmU
 C2aoJq0zuWLi2Axh3Qy6NcCS6yPxEtEyM1urli/gJODfkNm0c6TjpKPwJWW37jhIvB4=
X-Gm-Gg: ASbGncvyWezAxxnnAi9iJfseR9nx/1sNuH7vWJ4KSCe1fAD2PYxwivp6SSTbnSX6vPH
 2hY+LOivTZz2TxyNgzvTevChep+b+NcS3rchtNnptvWGz1mP1L+G1B+hP5+gpYBhzaNrixy4JnA
 g5QkC8jmCpuFDcqrIH3nSig5G2MhLqpPpAL3Vlgm1fE2K+UFWVaU33ifH3xDMrA+YPJ1Lxfdo8X
 T3XZ4SlrxhdUJVZQO03dxnohAgWjSn77Xw1OpG//Ruy22zYrIDPq+Is9aeJvg8khHxO+vpOojLv
 zftJodml+cnYcEQ5dnGaeZGzWi0x2VPevWT89hXs0DbqQAG7+mb4BzlVk9bLosIBTcTGOV4RpQg
 zX4Xl8lniAGZzrqeMHYqTE8NjX+dcG464itpkp3aYIflyue3nrMYg9zLlD7Vsru8JJMyIA8CsYK
 EFjH2XKwDWL63UsX+7jtjUahwi6V6ocNICYjTQM5HE0WWMGugS+g==
X-Google-Smtp-Source: AGHT+IHKALC50pEh/jaA/fWPXts/42PDw4MAyTPilvL5xMm7aMDasliC8OltecvOzQmm8C4mc4pS/A==
X-Received: by 2002:a05:6000:184e:b0:427:e1bf:13db with SMTP id
 ffacd0b85a97d-427e1bf1a8emr11593709f8f.54.1761228831549; 
 Thu, 23 Oct 2025 07:13:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57cesm4405567f8f.17.2025.10.23.07.13.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:13:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 12/58] target/arm/hvf: Mention hvf_inject_interrupts() must
 run on vCPU thread
Date: Thu, 23 Oct 2025 16:13:31 +0200
Message-ID: <20251023141339.10143-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
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

Since hvf_inject_interrupts() calls hv_vcpu_set_pending_interrupt(),
which must run on a vCPU, it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ee04943b0f8..0d8ff49ae15 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1664,6 +1664,7 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     return 1;
 }
 
+/* Must be called by the owning thread */
 static int hvf_inject_interrupts(CPUState *cpu)
 {
     if (cpu_test_interrupt(cpu, CPU_INTERRUPT_FIQ)) {
-- 
2.51.0


