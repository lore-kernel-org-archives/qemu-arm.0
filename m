Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5196BCA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 17:11:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVzy-0005Oy-Dy; Mon, 11 Aug 2025 13:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVzg-00056D-LB
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:07:35 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVzU-0001tZ-4g
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:07:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a10a09fb7so1695625e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754932033; x=1755536833; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kpYoiyGaNwP9QeQLj/6KulYrhyYzjmCLEuykA1SH0I=;
 b=bj4dpKzRuDJ2ATnqsKN173uTtTqetauLwEaprycqgSaazZGpiCgCeuaGkY7e3uUUuq
 /9hvCWzG/YXoaF6mzghGvutHv0e22fN9MFe28D8dkXL9svaUBL9H2HBjKndvvHQoG7FV
 HwYvFhVs/AQ9b2B27WWjasbPuCncKwuGiMrpRRHrvfnL0c9xzIupAr9+3h9Jl60W2ltn
 89aYLOYRXIVgLd5c6Vf6HYIjNpX/AwQJahPyR3rj83scGXA/DmGQDqHTGv4GE1Djc/m8
 XqwPTxt5L2h8Vxxf6y8Gb9KBTZ9si2Ek/hhc4wtPtDzxnOFsZo6RzEEoKnGnrevSylis
 Md2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754932033; x=1755536833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kpYoiyGaNwP9QeQLj/6KulYrhyYzjmCLEuykA1SH0I=;
 b=u+E+IrkoXdyWOFaJ27wZ+NHR4QbQQHmGvNxB3+f0H+bcHQ6DrWyShw0SrCY+lXNrtl
 l8NUDeJKYWCD3ZAwwo3eANIJDyJzaq7WcbtfYI1whoaCd5DKDxG+WF1IBTZWBpg/hzza
 gsUh9PJ7b5VwKGVPIPlafQW+4pMEn0qnluFq3TD7mruIP1UYaBRCwKa4Q+LAPJx7NsFr
 IfpljFOS1UU6ybwazk/nlCif5R28U7KL7O6o+jmBJnynRO8KQ7m54RuVhL5DO7OHO05C
 1Z06h2C8hYeLkA+6J/HPUQ9CtsQpX2dg7BG4+RxP1DqPj/VS240rgaXRxWZz+afr19Gg
 kyeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe9KwR0aw/f6K5pI5PagR+wOQcL8kr7v/GTLdiVih/oxh33h0uC+ShCA89GrPazYPa9JssQjP0rw==@nongnu.org
X-Gm-Message-State: AOJu0YxHuH/zsGLOIurg0xvaTQl7KNUU1ax3FHSH9qX/JktFe+OUC0it
 BG4bpl4TFKB7WrdBQtgw4l8L/i4KqdKy74oPtoAUPji/f9YcSZbpjQIndifW3s5aIMM=
X-Gm-Gg: ASbGnctQ9sQcuG1ZKfI2CohPz78z2yAE2f9cx8lNz6KvKMS6OD5NClcZ4VB1OXtbCyL
 ZLTYZNekniAJQvDVE1FBEM76CxGH2iY3I0/v992ZFt6m3c1KM3eBmC6EqgDDUkZC3j2KFxGFaXm
 +Rt6rmUGkIDhHqyJREwHXVtD/ai1GWJ/X5ZxbKo76HXBf82wH2aWuxkmffIy19uKFl7WxKV598g
 0RIraOYFURO2E7e+05SPbPyigA3Rj2FofqDAPfgqV+px8ST4KTyDehPcK+VXHAX0zALOfXoNh/c
 x1LLudSb6Id3PWqs8qE3XLxbPm4K3UwTVSgq0DGdbUxlX2psXxgdptKe3YXeoZ5tSONnC1Ys7ID
 Or4KiQ8cgsVwuuvdEcsEDVgCgGGxaJ9utsaRLRdoSnNHH01T1ose+rXlDCokuF27mccR8KzEt
X-Google-Smtp-Source: AGHT+IGPNlPGCtPBypS+3QH5V8BmL3guma48smLhKJ8u6uzLKRJHeGM33dI4w+1pFfja9aZ7mD/1ew==
X-Received: by 2002:a05:600c:35c5:b0:458:bfe1:4a91 with SMTP id
 5b1f17b1804b1-45a10be7b42mr4144935e9.20.1754932033011; 
 Mon, 11 Aug 2025 10:07:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58553f8sm279207095e9.14.2025.08.11.10.07.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Aug 2025 10:07:12 -0700 (PDT)
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
Subject: [RFC PATCH 11/11] target/arm/hvf: Allow EL2/EL3 emulation on Silicon
 M1 / M2
Date: Mon, 11 Aug 2025 19:06:11 +0200
Message-ID: <20250811170611.37482-12-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811170611.37482-1-philmd@linaro.org>
References: <20250811170611.37482-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Another API PoC.
---
 target/arm/hvf/hvf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d74f576b103..0519903c928 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -17,6 +17,7 @@
 #include "system/hvf.h"
 #include "system/hvf_int.h"
 #include "system/hw_accel.h"
+#include "system/tcg.h"
 #include "hvf_arm.h"
 #include "cpregs.h"
 #include "cpu-sysregs.h"
@@ -1014,11 +1015,14 @@ bool arm_hw_accel_cpu_feature_supported(enum arm_features feat, bool can_emulate
     case ARM_FEATURE_GENERIC_TIMER:
         return true;
     case ARM_FEATURE_EL2:
+        if (can_emulate) {
+            return true;
+        }
         ret = hv_vm_config_get_el2_supported(&supported);
         assert_hvf_ok(ret);
         return supported;
     case ARM_FEATURE_EL3:
-        return false;
+        return can_emulate && tcg_enabled();
     default:
         g_assert_not_reached();
     }
-- 
2.49.0


