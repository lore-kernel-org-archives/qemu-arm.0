Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1775FCA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 17:11:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVzy-0005MZ-5d; Mon, 11 Aug 2025 13:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVzZ-00053h-B8
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:07:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVzR-0001t5-2W
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:07:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so27083505e9.1
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754932028; x=1755536828; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SL9BjJEaO0GjattCvBT1sYPxfZkwHVSu+LlGdRsmcAg=;
 b=V8abu0MXhk47x0rElHb6U4LfPfhuu82xDMcWKcWrUTEo7W55rT36w8OeF6LN8rOsom
 VK3eBtojb9ufCF54hbGcORVUIviY6XUdasF3AIoTYRyFlL2bBhUa+LcQKuzJDfskQ31+
 F+HrjYd4VX3gGnfWmsUYIHULHuowjJmbjsGbiZMTmYZDs8/8veCVG3DnO2AmCRvdC9Oe
 mEeK0je60+SWjBmam6QDVX9XPxm+IgPtHp9AsNBRh7Qfoh+FmkqfzmCh38IwpzQ4usuU
 Haj2YTBWpxS5iKVMzAxHhXheMbLE8AtrO1I+VTsEZegCqLAQFleLClrMQfWTYISnxH6F
 8Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754932028; x=1755536828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SL9BjJEaO0GjattCvBT1sYPxfZkwHVSu+LlGdRsmcAg=;
 b=M3OV3n/lPYMYx1oBCDg+rGTdQBlB+PZ2/UqBeQVSz//R3yntZShkCpcawLQmuysZnG
 LtCXXiWLXxX9dQrzVIMk6++J445BsHW3zYyyJyNL8fzh+sELRTfiv3c3Jrj5cnTnvptb
 rJRVRkee5dLPEvLLdwqglMi/mm366YN7xecrKO+y67/4KVpTaoRLy+pONI00psBKidSR
 kL/5I150M73k+bh189X6WhzHwvn+FswjPgUd6dw2Xdt7HD086nSFejrlPSrd4tmvfts0
 Gq0jLA06s4MXCMvz4BXgIG+wqMfS6neUa6BdKfd3uf65i7hjXAuvTFCStGRGQiF/gXlD
 F7QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOEQiHkqt7pplQC//4/p+7ea+gwaVGu2FBJ9oiDldQC4SC9tXawZmjZJaln9ah1jfTGftmLIYbEw==@nongnu.org
X-Gm-Message-State: AOJu0Yzy9jQsKu2LK3G4NgYDc7djTsqLONOReQ13SvLBbOtpRcW5WY9K
 dCrQyzaSGvO9/DOJwcoqByanZl2Zc/fNF8qf9yi0tJPmmKrDrF6bJTRC7JF2GNAyAG0=
X-Gm-Gg: ASbGnct5ejw+gXeO9yTfrrYfFappcKsFlyQAEfJBWCpL9YsOSeYrjDPmfOuaYgB+bn3
 7mDgfe3NK+WMy6x0Kq3HMQLLQnB30ScD3J+1jyrAqO/E53//uF+rQVZSNaq80Eh+wTjahfzB9gt
 IPbdg9pNk2sXr7LoFqltMXckdDyhoU0Fu9Keg2vkU4Ra7bIy3zUfyoPL33xYw5NkYOadyqIlj4k
 pY2+7G5YYzUYdryWZrZPHkeLgvSkvOmSZsk01X93ZjKkTAYCXQzFyzXqSjHNp7LxwfMv3crM1Qx
 GaekAf1p0lnZlVZ5yR6qpAra8T5/yoXT7lpnOPnHRUgLplpFPOwANY5r4xCtDVERrLekormxiKs
 x4HPH6IEYUkyVqa1rAgz7vu3JJT8BWyNYUeD6UNosjeruyryIHZDSj/rj9rLRj1JbvzHgRAMS
X-Google-Smtp-Source: AGHT+IHfoaigvwFcg4KswaUsW5gj91pCHoOh4NHtbdx2nxS2EGq2EkpPF+O3AaqXm2LpMC3Avw3iGQ==
X-Received: by 2002:a05:600c:1c12:b0:450:d386:1afb with SMTP id
 5b1f17b1804b1-45a10baf6f9mr5082985e9.9.1754932027824; 
 Mon, 11 Aug 2025 10:07:07 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dcb86d6asm311891055e9.5.2025.08.11.10.07.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Aug 2025 10:07:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Miguel Luis <miguel.luis@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Haibo Xu <haibo.xu@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Mark Burton <mburton@qti.qualcomm.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 10/11] target/arm/hvf: Consider EL2 acceleration for
 Silicon M3+ chipsets
Date: Mon, 11 Aug 2025 19:06:10 +0200
Message-ID: <20250811170611.37482-11-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811170611.37482-1-philmd@linaro.org>
References: <20250811170611.37482-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Just a proof-of-concept...
---
 target/arm/hvf/hvf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 778dc3cedf7..d74f576b103 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1000,6 +1000,9 @@ uint32_t hvf_arm_get_max_ipa_bit_size(void)
 
 bool arm_hw_accel_cpu_feature_supported(enum arm_features feat, bool can_emulate)
 {
+    hv_return_t ret;
+    bool supported;
+
     if (!hvf_enabled()) {
         return false;
     }
@@ -1011,6 +1014,9 @@ bool arm_hw_accel_cpu_feature_supported(enum arm_features feat, bool can_emulate
     case ARM_FEATURE_GENERIC_TIMER:
         return true;
     case ARM_FEATURE_EL2:
+        ret = hv_vm_config_get_el2_supported(&supported);
+        assert_hvf_ok(ret);
+        return supported;
     case ARM_FEATURE_EL3:
         return false;
     default:
-- 
2.49.0


