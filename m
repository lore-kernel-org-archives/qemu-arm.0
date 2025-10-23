Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DCACCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:51:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtn6-0006fv-9Y; Thu, 23 Oct 2025 07:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtma-0005Tn-LY
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:47:04 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmY-00021m-He
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:47:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso7863505e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220020; x=1761824820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WEm2BcJk3lcGKEr7IiOVTfv620coTuiYKu5tYc8rMA8=;
 b=B/m8CyAvrL1dp9hwtQALXfgKWu3ecsnq3ec2stNixiGht3YR70iu3+T3LJ+f3g1XWG
 B7w4eMwyQmMO/P/9aIFFpbKUy4T9K42qsvvak9XmuHKMueWWS1SshsNuIDz/QL3/ve2b
 aAmYfkrvf6UAYc1D5NgI0sUB4ktngwknyT97RhR5bzi2YlsFpXcIUQ4HVDnvQsvH+puf
 KEdRjFlZ42ZYd7QDkNAlfQG1mPnGGniF61OzSkONzwe+j++9g4LiQCEclZdwWoyvJkDz
 w+0ziOOBTlu+9XNy8uPgUlfDdlwV8LR98dBhZRI+uC8kKPShTV74HYZogaYWtbh43TwH
 yF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220020; x=1761824820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WEm2BcJk3lcGKEr7IiOVTfv620coTuiYKu5tYc8rMA8=;
 b=pfksPUssiybGM2Y5RoWdmt49i9RbebpUUoY6VuJhYh7ei4tcBkcCN2hYswpLb3Afjy
 2hDV3r1KESzrpz2UU0QUWPyLCv1eDqi8nBuym/WGo45s5FUDabHFQJW6MK9YFqhd4N9O
 Rpj03v4ve+nbQ+sj1vOQGczAj0tA6jGiITvCAMbxVsbsbUZzDrEyKKbp0x5TDownOToB
 g4teOXoU43KpfbtzZ7dGdHGBk+RpACjsQqu2A1oCmrIjdskencYp/NOdCdwMYBKSly+e
 FCfcVQzRtXwDudF3BLYCMZUNR/ctPP8jQbrC5p+8eD3d12GcFQReImcpLfoeTcEzco/s
 QE6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXYiV9Vi/GduCKazDiFbtUjDU6bELAq0F+9xOl4v3WxH8fHtNuWXqU11RYMDV+3iVJXTIqolEaXw==@nongnu.org
X-Gm-Message-State: AOJu0YzIwOuRKKEmdU/1CW5NRbPbsLhOPRNGkijOhodv6GkYCClm/jJ9
 waRiOnjMbe58ayVh3NwcQ2TPtgJvIFsWlrlnzMI5iSzZlts57DPhEoQpAutNfm+iVjY=
X-Gm-Gg: ASbGncuAa2Gv38yYbkBv7cVuUg+uGHbTwqu5cHBg+cSMoDwfZirAXAzpYnPMc2IhHqR
 49zOsXWD0LMdAgTH/p0S58ES+9mTXanA2gZIytrWPfVYkbLdHL+HsB2h7se/GwfrDr4szreLcs1
 UA1oU6eRnan70edaI2Nv3z8mQoIEA/5KyN+4C+zga37yd5ghUQDaUJBYUivrj2p43O8sx6ZC2Bp
 ysNpqSMjEdvS+eK/Qu1+7TsKmU41q3WUh8fc/ml/Id7KqTUNN6hoSNGVbvJuAlokjgwhGWTUjzN
 yvELgbVwxTOzDk/ItdBQVzYcZ52woU4CgEiymb+AqnmGv8Z1V6OMkwYwL1Q4avVKp4wyTS+x5IX
 lm04Fu7/B7Ki3HJCQI/qvH09BCTXuFBg7PjdD/YAtFVESuDgPzhZpuaVTzg1zRlmfPm0tFSnfOa
 jRggaga9b1YcRS+WNiW30/8OzaEhiaB56JH+1z+Sb/8r+zdL1Tzw==
X-Google-Smtp-Source: AGHT+IFKE5roY/bkcaEQEOTqu3CjBRxYnQ/OO6PwAG+GdSng70O8BIBK0ua/LUwzRZbr5og1Ol1JaQ==
X-Received: by 2002:a05:600c:870e:b0:46e:37a7:48d1 with SMTP id
 5b1f17b1804b1-4711791f94dmr228790845e9.34.1761220020286; 
 Thu, 23 Oct 2025 04:47:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf152absm39588465e9.9.2025.10.23.04.46.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:46:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Peter Collingbourne <pcc@google.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH v2 04/58] target/arm/hvf: Check hv_vcpu_set_vtimer_mask()
 returned value
Date: Thu, 23 Oct 2025 13:45:41 +0200
Message-ID: <20251023114638.5667-5-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

hv_vcpu_set_vtimer_mask() returns a hv_return_t enum type
(defined in <Hypervisor/hv_error.h>). Assert we succeeded,
as we are not ready to handle any error path.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 4c98faebbed..bbe0b24b821 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1782,7 +1782,8 @@ static void hvf_sync_vtimer(CPUState *cpu)
 
     if (!irq_state) {
         /* Timer no longer asserting, we can unmask it */
-        hv_vcpu_set_vtimer_mask(cpu->accel->fd, false);
+        r = hv_vcpu_set_vtimer_mask(cpu->accel->fd, false);
+        assert_hvf_ok(r);
         cpu->accel->vtimer_masked = false;
     }
 }
-- 
2.51.0


