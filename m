Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BCEEBFD30
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 10:38:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCEg5-0000Ys-OP; Mon, 13 Apr 2026 06:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wCEg4-0000YX-I6
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 06:38:00 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wCEg1-0001mw-91
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 06:37:59 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488b8efed61so40117045e9.1
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776076675; x=1776681475; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/gRv9RLfF/F+lj385yyoTJLt207V/mbUmBgkzmiVuuw=;
 b=LNt2gAR/dlr21TUCevbumLhYgrg4sk+C2jLRYKumROvX1b40Asz/XVUNYg8Enk480x
 HRzhCg9cIejpdgxwslkGPSwHGIj9Ou/XQE4JYIeed4TQv1wiHZCNzuwjBoNCmYNqqO8j
 Aa//y5DE4eAhhIqruOO7oc13whBUaX61Uqe2FjBUo45Qlewg2JQVRb+b4c4rUEO9xjmu
 NkIMPuidp8sBzgtqBGZyF5aII1EBIaYcbwtb0et/krHakhzOiDzBQuNRBAEKIZpe/pHk
 0p+w1LU0mfRcwxMSlctJS/XQ32L0pi8ucH28H5Oqc6bTP+gCiMkl7rxpDYSoE7wopGyR
 1AeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776076675; x=1776681475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/gRv9RLfF/F+lj385yyoTJLt207V/mbUmBgkzmiVuuw=;
 b=HQ3Y9IhY//DQ5olYjdksbpbceQsGiBZVcKL0sLfg2YscqGKaTuZ2jg/qXwsrMftKdS
 +PSKBefyJR1ctcqivnxExAHOBrglyyAI2N1rI4WWBQpNtetH/HyymA5gYlcWGBMNCXiY
 CvmeeAvDQAVGDn0ivIKaJvatcYdlhAs0yO029nKzQySEqxKMD81zVRIc2ZS+2OunQovM
 3u9qV4Z8kPdZfBF569TRdKa/5RM5L0ck9JWQmhhwJpyvWcEBVbjqVvipJeqhzgtBMSqK
 ZwLeU8kB6IjPe05yl8FKU1riX7d3tnDhP1HpDQUP5tfydUXG5AUm6/DtoaCBy8SjmAJi
 tCIQ==
X-Gm-Message-State: AOJu0YyevbwsIF6edg4POXw9mO0ZeKhPbqNQoagoqQLaV6rM/7pxFCBT
 iMLnxHov1DgLLxb7MkBi5MiE1ygvG4mmiKYjNqCT4qrzeu5KjX2ASCDvfV++XUcQrfH51lUoUmh
 oHIkD+Ok=
X-Gm-Gg: AeBDievzvs4DGC47jIDE8RFFYIAosrgK6SvCNkMC5AlIlm/ehoNexY6NOZ6bktcVmjF
 ZEwx8iuUknKz+YnaCOVP/gb7sHfBaQbMTP3W1tmh9/z9mfZsNuUQdKZ7NyKO6BJHPsMVnvAsJBG
 yqs2xFyNo4v1EEcvGBMrgZY9JQH4nVq9Nwa2GU9e1x94OEZGUZglEkKUYxAYravkSts6Lsy90Nx
 yN81NQ5GiKUAsiSkyI0Jf+JypS2TWBM78Uzxp5OTGPh3PAdTJu2GpNToLHJjeNugno6gRgSPVh1
 VaUr8WF2KFMD3rZC5wvyp2fjSAPmHYa8AUzbY9pKsas56z5n1JG7/SkraJTJPVMjMkd+dEFWn13
 6iGIl5dR25U3+s71WG3+cqw3nk2hn19aYMsw2U5gChWXWeawr1WWBZ0+z+RhAnF/7idpWKrn5Av
 bbTaVdr2Kyr++qv+gz9BzfzKTs6I7f9hLwrkJGDq7B5CRziiXpw8QoE1motUieRByhQ1P93T9US
 Oy+ZuX5z5HIfkiq+nXnUDDwWhRjJOu7xppA/sIF/g==
X-Received: by 2002:a05:600c:440f:b0:488:84b1:b216 with SMTP id
 5b1f17b1804b1-488cd58011dmr160933685e9.9.1776076675363; 
 Mon, 13 Apr 2026 03:37:55 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e46713sm32893051f8f.21.2026.04.13.03.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 03:37:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-11.0 ?] docs: Deprecate Arm OABI and NWFPE support
Date: Mon, 13 Apr 2026 11:37:54 +0100
Message-ID: <20260413103754.45745-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Linux for 32-bit Arm has had two major ABIs: the original OABI and
the more modern EABI.  OABI support was marked as obsolete in GCC 4.7
and dropped in GCC 4.8.  In the Linux kernel, compatibility handling
for OABI (OABI_COMPAT) is not generally enabled by default and is not
compatible with building a Thumb2 kernel.  Distros dropped OABI
support fifteen years or more ago.

NWFPE floating-point emulation handles the ancient FPA11 coprocessor,
which is only needed/supported with OABI.  Our implementation is old,
untested and not thread-safe.

Mark OABI and NWFPE support as deprecated so we can remove it in a
future release.  Our main motivation here is to be able to drop the
2500+ lines of NWFPE emulation code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This just came up today; it's tempting to squeeze the deprecation
notice into 11.0 so we don't have an extra three months before
we can delete it, but we could just deprecate in 11.1 instead.

 docs/about/deprecated.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index a6d6a71326..10de10dc23 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -452,6 +452,31 @@ It was implemented as a no-op instruction in TCG up to QEMU 9.0, but
 only with ``-cpu max`` (which does not guarantee migration compatibility
 across versions).
 
+linux-user mode CPUs
+--------------------
+
+OABI and NWFPE support for Arm CPUs
+'''''''''''''''''''''''''''''''''''
+
+Linux for 32-bit Arm has had two major ABIs: the original OABI and the
+more modern EABI. OABI support was marked as obsolete in GCC 4.7 and
+dropped in GCC 4.8 (released in 2013). In the Linux kernel,
+compatibility handling for OABI (OABI_COMPAT) is not generally enabled
+by default and is not compatible with building a Thumb2
+kernel. Distros dropped OABI support fifteen years or more ago.
+
+The original floating-point coprocessor for 32-bit Arm was the
+FPA11. This was not present in many CPUs but did get baked into the
+OABI for how to pass floating point arguments, and so the Linux kernel
+has support for emulating it via the config option FPE_NWFPE; QEMU
+follows that. FPA11 support was also removed from GCC in GCC 4.8.
+
+QEMU's NWFPE code is old and untested and not thread-safe; the OABI
+ABI is long-obsolete. We are therefore deprecating both OABI support
+and NWFPE emulation, and they will be removed in a future QEMU
+release.
+
+
 Backwards compatibility
 -----------------------
 
-- 
2.43.0


