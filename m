Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699E3CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:54:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBttp-00079N-56; Thu, 23 Oct 2025 07:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBttV-0006r0-2i
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:54:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBttR-0002h1-A2
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:54:12 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-427091cd4fdso451819f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220447; x=1761825247; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwdGU+8Ecc8JQqbY944iaIzcFK2N7jYfLXWaVKyTPPg=;
 b=XkuuBFxUFFNqSc9997pD9XCiCmTOfJxVpcuxXyAOWFbMjDI7dmj17pj9QkYv09nFQI
 HgwFNB9jNTl1skYCFWmR4xUDRUO3DHvVwfzezMxgl/xlw0kPQRkLK8HVX48sFlez6JsW
 5NCPZiyAo5nW3HveG3Godx6gQpvUSXvxO3vG51T5O3ATWxZVm6fEydg0TDgyhCkzsvqr
 iAuYB8ZHixbLnelc5YOdj7Dx1K2Ga9jzKQJqAv1DRDt26a9z4mQZhPrXiJ5yoFc4872r
 ZFcgUqqCTLyK+YAr0ZcrC+pSnX3FzTutDE0UID3fHjDc9eQHv6U1HZAD+/+HGCnFWtO8
 mp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220447; x=1761825247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mwdGU+8Ecc8JQqbY944iaIzcFK2N7jYfLXWaVKyTPPg=;
 b=a6PBo2oox9hxCgluLEm4phcWcvGI4h3cKC3B+3nrotFv3Nl/wez+w7oO/X3lkhZ8/V
 VeH+ryJSfXErSIY9iF+0QW/ld7yG/mizZhklmm27CyD+EkgQG9MjZ4tfrtTTSbx0Pb78
 tZrOa146YdmsX4Gr13LwhRRwmaoc3CmCmEf2TyipW10i2cUV4eBU5o+Ev7PXOYDKjdp+
 l2NnrTtFyNMrSsNnJXeKcaHWVT7f3KBOKiMKhkFBUkiXJcdKgzK3OrGCmiwiGdOxobAR
 ekI+vVxYU0yqQZzu69hgdogn8Cj5wE8sV9oINSKJfeNhOm35JuH7tXydSgzqYy2WvtJ9
 m2pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJl1PoHVaP7Gbgu9vDpFZA5e2iFCzfAKrrl9qKddkgTfgIi0BtoI1S4n17MgMQplfqb60/3YgEAA==@nongnu.org
X-Gm-Message-State: AOJu0YwoAuTmFObBfRUGWL3ov/lCN3OmFAnfBnb3d4fD1A+OWpfdzfM0
 VtHKgp7rJz6gEKK18yfzHmYPRlfHh2VBKkqIxiYSbwvC7ozkaXpaVrAa2UXr/XN2eYQ=
X-Gm-Gg: ASbGncuq9MiOZA9Rvhila2y4w0uPDL/3EULiLEdI2SWN2dmKirIUDtjbdiKK0pGYqjw
 PapB9XorQHG7Rd6nshmLX6HxMwmZFpPpue/IY31EhOgDDSZegjISWEbxRDxvHZ5PLWAC4sH8sjr
 WlDsrQ0Lub3V49TZS42mHgpUcZzkQeWl13dYIzIee+Zp0MrpzcgUSF0fc2kHWFVAUnRaG2wliSi
 FRNjkO96MrRMvBwkxb/dxA8nCAoT4Uf8OoyeNePphbQigYShKIosnZxfP+nDJqkHM/CvVNuC0fC
 nh6Ig/CVzZA3SLvKJbt4dgWoYofFwgpCz3l6UMbdmz04b+qtuuIpt2bVbaXpDAbCR4CGc4fYF+o
 xlM7jJmPIeijdACk7UYxjROaRAi7/XVQO8JWguVwzppptLyKPxDuW6M76CDNdbVC5FFAg4mjWox
 umlv5wauHz7IPhSCoiemc+Z1f6j6kij4+N3QaiEdCgeQ71411cQ6dVwOxT3OAInFExjjbNSa4=
X-Google-Smtp-Source: AGHT+IEyg+aUPhFKlAw/V/LNeN7y+v4DAkNAXRKcFvZ2PKm0nj6AUPECgMCz96ad5W1JYZM9aIcQqA==
X-Received: by 2002:a05:6000:1445:b0:429:8d0f:e91 with SMTP id
 ffacd0b85a97d-4298d0f101fmr95347f8f.3.1761220447443; 
 Thu, 23 Oct 2025 04:54:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57cesm3728842f8f.17.2025.10.23.04.54.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:54:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 41/58] accel/hvf: Remove mac_slots
Date: Thu, 23 Oct 2025 13:52:52 +0200
Message-ID: <20251023115311.6944-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

This data structure is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/hvf/hvf-all.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 21386acd143..c767e13c212 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -21,15 +21,6 @@
 
 bool hvf_allowed;
 
-struct mac_slot {
-    int present;
-    uint64_t size;
-    uint64_t gpa_start;
-    uint64_t gva;
-};
-
-struct mac_slot mac_slots[32];
-
 const char *hvf_return_string(hv_return_t ret)
 {
     switch (ret) {
-- 
2.51.0


