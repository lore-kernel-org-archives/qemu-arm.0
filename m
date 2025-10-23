Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6F6CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:31:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwLt-0003WN-QX; Thu, 23 Oct 2025 10:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLV-0002pT-S0
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLT-0001sx-Fp
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4298a028de6so568445f8f.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229873; x=1761834673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/pnrcoc7cYS7GwGVqSI0sbh32hz5/hHl5ailiW8kns=;
 b=EsDjM/dYUM45rokp2gdyIcESbPlvuJPcqXQ62wMX1k/BMvH2Ek8BuQluFpAEddeJXM
 qKQpXFqf/ijupwVMmzQUYRMfTtYRaxhriVkimHeJZqTY45PzVdYJVB4Win01RiOnteBm
 Dvs9YcKn/bqDjwNXJqD+7o6+Og53huTNKLsVMxA+sEfDc+KMzJeUKV/1Mo7Nhe89L/jN
 Xt+seVhPT6bBCGd4VOF3i2RHgd4v6PPX3jXGrSilczzGNjmxvdKzvrHMmfLGnhDLJJ+I
 nres1bNI+ciWXUhHLLGt0vVOuoJWGjyDiOXVypCdxfuCxMKix7qKbW3F95WVtSQE5wcT
 Xwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229873; x=1761834673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y/pnrcoc7cYS7GwGVqSI0sbh32hz5/hHl5ailiW8kns=;
 b=oAx5f9Y7KyHdxjrBjaXgYs3/oA7MdB7TaTi3Gvd6e0/njDBIoC2cgxo2jRFRnVsWCg
 jIs3UqXQHIFlnJ4nmosvHIimFo6Av8OTdr+aaBjHk1l7DworserZecfqYz4bAyaIoqFy
 5SsC1fG/YN7jXD0HrXGdGjBj5fX6tCmWE4DKWkpenZPs/6r/AQ4O9PyTuCRbIweb+AUq
 Yaw6mc6Ut9iMy+xL0cLc9R/+tkQAvmfeJBMeglb9p043jgdSVOaGPLqWXUiN0dAj5l88
 k6fOJqFG9ZdNuaXv4+ugRmEhK3WHsuzdLhkFxO1r4yXcpF1WZJrLDDRSfbNHL3y6sXrE
 qqTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQnSVtOjJZHt4kTfQBB+GInCwPMh7iNHBHW8oshnTzUhF9PI7e8tBnknULLXQEHXu57kGIVCq9rg==@nongnu.org
X-Gm-Message-State: AOJu0YyU4lVCKv0JQOgoZ6Pqymzv93/aqaDUz8NWTaufF8eWxhwmWPXO
 s1Z5+GWa8wX+7i1p0jKSB4JZjc9WniJwZI6lYNUgrIbahe0v3gM4qxrSSNVu6YdnJEBk5KaeDaZ
 gdCdkltI=
X-Gm-Gg: ASbGnct1GnyHGjF1B0p+utIEJTxqIvJA70rfkDe1LHRGwzocvfUyRJntr4GsX6d3t5C
 kka4e/7aAUZtbBrOH2alJ7c78VgcIASXjRp7hiOEt/Kd6EkADZGzNOz2oqKtrDKdgH7G8hwp+Fn
 hcB0n4H7LEnm890i5klJvZ6YQ/bZrIO9GZ/+RiM1KPVvk4pNbuG7p/dV69zYbczkSiZPI+cu5iw
 f6aM7F14S+HiHtje97H8cne9nMXq6mhjOHrcyfjWYp74UutX1f22NOyvpVxPCBqn5aqYUV4kRM+
 TWqlfWDPU9jklfX2BS4C896U+pGtlIevzofFn7AxcFLVxKxrzxAbx5ArQr4CoQnlWEChenDgqUk
 bMu0Cy5BTn9GCqVGs4ATweIKZenFt7LercS7YsswcfEjJ/lTpHaqUP3OYn4QdnSFJj3/33yKPgj
 CapRL3DAlFUQ5O8qbLX9eFX0Ajkf3x/5xzKQRyyUyIvgkwy0qnbg==
X-Google-Smtp-Source: AGHT+IHkR8W1MvRpp609Gf74Z1yewPmxQUUgOJcQ3VVKK1u2vq1dtS5BzGk9WOf6s75DONZ03Q6q1A==
X-Received: by 2002:a05:6000:2c0f:b0:3ec:db87:ff53 with SMTP id
 ffacd0b85a97d-42853255d50mr6053232f8f.12.1761229873078; 
 Thu, 23 Oct 2025 07:31:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898cc930sm5145512f8f.33.2025.10.23.07.31.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:31:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Peter Collingbourne <pcc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 24/58] accel/hvf: Restrict ARM specific fields of
 AccelCPUState
Date: Thu, 23 Oct 2025 16:30:45 +0200
Message-ID: <20251023143051.11195-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Do not expose ARM specific fields to X86 implementation,
allowing to use the proper 'hv_vcpu_exit_t' type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/hvf_int.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 195d64dcf18..3d2be4092ef 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -59,10 +59,12 @@ extern HVFState *hvf_state;
 
 struct AccelCPUState {
     hvf_vcpuid fd;
-    void *exit;
+#ifdef __aarch64__
+    hv_vcpu_exit_t *exit;
     bool vtimer_masked;
     sigset_t unblock_ipi_mask;
     bool guest_debug_enabled;
+#endif
 };
 
 void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
-- 
2.51.0


