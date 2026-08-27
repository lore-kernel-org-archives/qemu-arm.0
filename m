Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB6CC61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 04:17:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzRXK-00078y-Nb; Thu, 27 Aug 2026 00:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRXF-00077V-Tq
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:16:18 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzRXE-0006SX-2W
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 00:16:17 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-381b831d535so3004407a91.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 21:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787804175; x=1788408975; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=d9vZmtDzK9BaCqOMKO6CDu9rwbtI575ats31dCsjvHc=;
 b=XoMAhyboNNICnsEGDiBhmX6Ie1Onuqo2aXeEGiFrCk8hkTzunYlJwYy2M5i4hMrxEH
 s4K72HUWZqQBcZ2iLjkCRu4/UyEburhvc46LO40WjuI1zZLZDtAUcxlsG+R31Q2eHmKq
 ADFp9YTlQn1dNLHLf4+LhfkdzbE7xM4mfMPe+zsj+tN6DKDKWR8+x9EQGJg6O8V+pY7N
 1/G0qMXYHFczRC2QqbrxsLEyhz0cOHX6GzHNPFLofslmsCSihsvys5hGG6e/3GwXqcxS
 mRuYebmbz3alsv9Ya7w7CIMM/8BhZbu7gMG0J2GQOBR2rnWceDXnz2PVbCTnt2gnbKZu
 60bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787804175; x=1788408975;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=d9vZmtDzK9BaCqOMKO6CDu9rwbtI575ats31dCsjvHc=;
 b=dUsOK8hhfMF71NV7BHqZcmgv44Uz4eAo9crXbdlUeewtPXbKJDIGPb6QnWRDnKs0ZV
 pg6sm/LuNSvCO9tUN0PwnBQ7Xp9Fd1S8b5Ey3h3E828xtvP7SCBmxO/k5USwlEefcpU6
 3srts6Jk4M47U31I2+nXjY5859VLP/+wRVbIvCoUX7cWspxsy/9dYvglt26aYq11aaFL
 4rBixfKXIFZwW62NwuG6wJI7OApzNlVs46iOXkrW7oxIWwPoEkH0Egjg7MLQJacYzLt0
 Fr2NC0TbBbWdW+FJLC9zgwsJUvfWIEIQaqfcRKWv+gl0YegTMLUJe25Kypdlk1+TBara
 GqZQ==
X-Gm-Message-State: AFuF++mU7gu94yuXjzGsB1TXqQXL6bNQopYHENckO719WpwEhl3bQriB
 AFZEQBwb0ToYgU8UnA6DBVy+TRQO+UJktyu8eWBk/aedLaJnIpC+UOl+uHl+0ufCF9c=
X-Gm-Gg: AR+sD104a29RaVw6Yrz7G9s6dU7YUx6TKEDRLXQkoXPcECrHiQRCdyApDkMP+x3OxsQ
 xxjFGQaaIZeiNbyb4eLWVrd/jvVZiOYv4w0lc4f9zgTlNNJqu2wqc6QOp8MJe4KV+EJRkd6eHVe
 7288Pyqnifmh22/opmyILQQNVMbL1PR7TualKoKCtTV1v1eUUrKUNoHsGmWqSljAEONS4apF4xB
 NxM361DjPt7gjZVTZSLgOWI8tELivQ3Ysq5QuJAHZKMYa2/WUR5bzEm04kXwzhQQJdZa5N0mycB
 GV6eRpDHBA24gUY/fNfmSAALCtX7OWIU3janKjzOsxiPr0hW4BhfxV5+ei49KVEqCzGTGQWPfZF
 stZI28ny5a3ImUCUONM1YT/a/Ep5mJAt+mm1eXPrQf563VJ2uaW1DA2r7z8TxtFxnTwvWpKVQgO
 oRKJAtXS3R+OzxXUiI97DymALpLgHL+O9kQT0+ErkNM53hx7SB4TISJ7o/VlWHLmbue6L8uXG7D
 xZRAzcwQX9AO/EpPgk=
X-Received: by 2002:a17:90b:180d:b0:38e:4f41:83df with SMTP id
 98e67ed59e1d1-3966d8e0f37mr23232769a91.15.1787804174487; 
 Wed, 26 Aug 2026 21:16:14 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396b0d81682sm969597a91.7.2026.08.26.21.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 21:16:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com,
 philmd@oss.qualcomm.com
Subject: [PATCH v4 5/6] target/arm: Use -cpu max-v8 with aarch64=off
Date: Wed, 26 Aug 2026 21:15:56 -0700
Message-ID: <20260827041557.775080-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827041557.775080-1-richard.henderson@linaro.org>
References: <20260827041557.775080-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Armv9 does not support privileged aarch32 execution, so
aarch64 cannot be disabled.  These tests must use Armv8.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/arm-cpu-features.c                    | 4 ++--
 tests/functional/aarch64/test_virt_aarch64_off.py | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index cb4d01fd46a..7348fb8d28b 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -493,8 +493,8 @@ static void test_query_cpu_model_expansion(const void *data)
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
 
-        /* TCG allows us to turn off AArch64 on the 'max' CPU type */
-        assert_set_feature(qts, "max", "aarch64", false);
+        /* TCG allows us to turn off AArch64 on the 'max-v8' CPU type */
+        assert_set_feature(qts, "max-v8", "aarch64", false);
     }
 
     qtest_quit(qts);
diff --git a/tests/functional/aarch64/test_virt_aarch64_off.py b/tests/functional/aarch64/test_virt_aarch64_off.py
index 13d8b73b0d7..73c9a4109c0 100755
--- a/tests/functional/aarch64/test_virt_aarch64_off.py
+++ b/tests/functional/aarch64/test_virt_aarch64_off.py
@@ -18,9 +18,9 @@ class ArmVirtMachine(LinuxKernelTest):
     def test_arm_virt(self):
         self.set_machine('virt')
         # KVM aarch64=off requires a host CPU that supports it, so
-        # restrict the test to TCG only
+        # restrict the test to TCG ARMv8.
         self.require_accelerator('tcg')
-        self.vm.add_args('-cpu', 'max,aarch64=off')
+        self.vm.add_args('-cpu', 'max-v8,aarch64=off')
 
         kernel_path = self.ASSET_KERNEL.fetch()
 
-- 
2.53.0


