Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70C3CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:20:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIdT-000489-BU; Sat, 16 May 2026 13:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOId1-0003ZO-Cn
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcz-0008Ap-MG
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:43 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43d73422431so534420f8f.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951800; x=1779556600; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/8BFtttVT3g+0FRyeC1PPimTkeRBXGfBRsBUAZi9y4=;
 b=sKdXmDqyjs0tVzeHMcfqfZN2FtZomB8VKkQAmVwlKXfX/mwCZPE+5mLGYDesy0FEFN
 FsMm09b0qUnrCRjXxFqWbOxa53n/f9UHAFNEyNDi1GGLQOU1pa1O8vNFQtNExlAPM5VU
 SKpovTkTB+kjw4TyjxJ96ONbQzWAHsIFCkueGqeyILYtMted/DAUrT/3unc/BEYootFq
 j5c+NS052rRybMv6m815V7UCskr6XTElyUZXx5qfmIQHDuTB4s4YaxjR5EFlVsCiiP/V
 mVTZOq+SE9/9NQUbIIJU6TJBC48dEBkpEay2KY9My+FLOGzz34N+Xm3rnwrlbjuXzrlt
 KslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951800; x=1779556600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0/8BFtttVT3g+0FRyeC1PPimTkeRBXGfBRsBUAZi9y4=;
 b=QdHrlRLCwJE5TrkZNetDUIHwoqp/5xCyY0szBE10wrn5NHBtJLLZM8UuGWoqsnLUta
 RGulFcwV3ZIJ28sOzcfZAfKetywax2yA1CROgvn+vTGYYm25MLL/Gl98nQdx3D2N0VSd
 VUQFdxzeDeGVHQ79yqOTs6qZUqLT7oTO76ryB7q4Yo0F+ZlTZyr7xdKkLwkOCYPcnWDK
 pSoJ+PXjrvixtR+V13S0qjHo6t+k9nRe1+XolzEwdn6+nJ+P30yYAhJ9wAOCNk/fWL3U
 /J9RJTS+TH7Z3848nScG4I81ye74IwqEx+ZPom1Xqx3orrRr4I2LBlmrylCjLsU2Ntt4
 0nZg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qAUIOxLw9EDuFsvkg25GWsAGienKj8Jj3CNddF8+7BoigPMNLqeOFwgMv2Yndu7xvsRZybyBbgg==@nongnu.org
X-Gm-Message-State: AOJu0YwZxxCMCUwzGaoMX0ujNno/Oa+yLcHDAG95fDyHxr5u0UpLoHxF
 QJXfmZVUFz0Q2Hi3UQZ/0B7rQwa27Ow0GgctDyEmyCw99610PIrQgen+BNDm8qH35qg=
X-Gm-Gg: Acq92OEpWW95dWYGonY0o3VFYO5k/Nq6VnwFX1wiK9eBFgQDemG2yOVN65d7+BBr9HI
 mXQhdwthxSovFYtS9PEB4Q+EwkMBXMJmkW133b85B+4lht6X+141nsTknNo7aGfh4SxlQjAD7Jt
 JdRWHEoY+pMmWaECF4EbNq0X8Jbo3ROuuCsibD/rDyjNtcyHtmJNTfRIOVSHAE5z4YVz6Va3BKf
 GxUvhA0NZLoQGuG7dIPHG35V3rX0wHRQ9U+gK7YaOsaXWicxjR+LkinuE6YqRZrNlHj7VpJOF/W
 ofU7w1xWmPgpxKn/bvtC6UaORDPDDhBU/TU78P7BWRqji0H5ZJ0Jn80DClQgyQ7OjAlhTopBBkO
 n6TGnVgJi4mtRPZPegk4OfPwqqAHNAQMFS3KFZul4YIyNNsVo/Ua7Y8nV+GO8J+gVwW0pDF2GZO
 hJdEHCcvPVR49Fgtr+VaIMziIyiM23hiImpMV7ava9grqWXUAqIH/P1KvOBbITWbvjJlyx3zfY
X-Received: by 2002:a05:6000:2c12:b0:43d:7af0:3a7c with SMTP id
 ffacd0b85a97d-45e5c608d29mr12287288f8f.29.1778951800226; 
 Sat, 16 May 2026 10:16:40 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a178adsm24948033f8f.18.2026.05.16.10.16.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:16:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v7 10/21] target/arm: Build cpu64.o as common object
Date: Sat, 16 May 2026 19:15:12 +0200
Message-ID: <20260516171524.19184-11-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

While gdbstub64.o is already built once, build it as
common object, reducing target-specific set in arm_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/tcg/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 9eeccb2adca..97d31b7515e 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -35,7 +35,6 @@ arm_ss.add(files(
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-  'cpu64.c',
   'gengvec64.c',
   'translate-a64.c',
   'translate-sve.c',
@@ -79,6 +78,9 @@ arm_common_user_system_ss.add(
   'vec_helper.c',
   'vfp_helper.c',
 ))
+arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+))
 
 arm_common_system_ss.add(files(
   'cpregs-at.c',
-- 
2.53.0


