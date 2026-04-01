Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A16910FCACE
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 20:19:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w822L-0006nT-M5; Wed, 01 Apr 2026 16:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w821m-0006KY-J2
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:19:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w821j-0001gZ-L9
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:19:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso1135585e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 13:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775074738; x=1775679538; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qb+zd90ZS/Btq5gwYIJLAyNUgmi4p8lYTj1rYDPe6wE=;
 b=W68HzSq6hSff1voJw0i40p9Is1E9t15rss9vLXCpUoV7iZPSKbbJi7EmwExchtJPC+
 C9Qn4UJ2KI5sZfTCqgvvWO81hPNhNYImGvFYQ9w3XmHtPcTPZlxaUMe7JXRwQwyOq4PA
 EJxo1YmTmsBhsIC7BvXSoL6vZMX8LiTvXPubLt5F3vCc/TY+Ml9gNHGM15o8WNApYyUc
 L3ZCIPt2msXFB4z8N//CK4LIur7DnKqMkxSUJ2HoE5bolIsbwYbgBXXO1tE/WpPNGZ+w
 sE6+/iNth5RnbdAVTBedBAp0rIW3+x/uFh+cO2WsEHUkh33yvzjiFukeF2yPJR2edlms
 9m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775074738; x=1775679538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qb+zd90ZS/Btq5gwYIJLAyNUgmi4p8lYTj1rYDPe6wE=;
 b=HojKaczdZuHj4qvIkmF3VuW2ojM8U0cCEbBoj1MBoP6lN2F7q6NT3d455SFrB28CLE
 507IqRZydcgmDXERxsi3G7Hxl9HhUjiJiUeGwyQ4vEYjfump1J1RCbN/igYkcn0h9lBL
 osQYGTKEUAu92Gq26bCkjn1WiN3gDELD+RWWGOwCDfxMyHF8EVdPtWWeuGm/wmVDCjpE
 GXt7sMUnPv0TSO2IQGLHguM/dV691BbsoS+xCtHNozvvPdIe7BLa8w7ycLzOtBBl238r
 cTROt2jG5+ipzRZwmCh/vrS/uJWXgDklJWp49O6VVUfAo5tkGADWwm1dNn50IHQMuJx9
 AOJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw/fy0y5FcOhX79uMeepcRyjEzvY5Whn0CJabFCcBG8slBRRxYjT2lB/Qj72u3MWXu4f9kA7uukQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxw1oMfafyv5HXF11kUZP6Ugg0fYQ2Vgik4WaN6aN0xGDxVbDCN
 9zmeGqqfwKooedxhdGo+2XAVB8DmX6kgWmX0jYLbBAczT3u/eo8LqUfPc1yVmQUZgSY=
X-Gm-Gg: ATEYQzwhdQ/2hl9XDgXQNTreXaaV4s2f0eDGMnd1kXu6fWTwp7xJA1cVUbthYK+qCXE
 QS/RnAPQr1VCjjHnSB4GU71J7N5i1upPedlZWS3gBFHPlK6j8J4IMzHvlTjwLorXt+gr9nMQVei
 YEavv26nrdAAXWiMryf552/v97e9xloK1J3Yo+1UKIM1+3LSqGp/HytG03q0d7B3h46Znq3zful
 5pTw4D2ng1aV2jGpKTedIkwZ+8l9kC3GZLemm5ZGxUFyEMX2WoxyGNDi1ne42P4xqeOPLVE8nJL
 mKqsmgpBVeIlvGaZk8PF64NOVEL9SY9xFH8i5Qd7xzaWNN0VEq15F630+FDrE76KSf0u0yOWdf6
 SSw9rcscnK/7nOUEc3Q8/gIWOXqtcmQYMZxACu92w+1COs6lTZm9ZD1XvA54kl+eICR3XQLIQDo
 ccKWTYSOa+9rN+QolqIxpGoLrV5FJEuG/RlGkOURA0bULJrpQLBb81clAaU4wRty9j/XVNNvJk
X-Received: by 2002:a05:600c:4707:b0:486:f634:ef1 with SMTP id
 5b1f17b1804b1-48883597cfamr88074825e9.17.1775074738181; 
 Wed, 01 Apr 2026 13:18:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a63c963sm20790425e9.4.2026.04.01.13.18.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Apr 2026 13:18:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-riscv@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Anton Johansson <anjo@rev.ng>, Song Gao <gaosong@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, Bibo Mao <maobibo@loongson.cn>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-11.1 8/8] target/arm: Compile KVM as common object
Date: Wed,  1 Apr 2026 22:17:52 +0200
Message-ID: <20260401201753.92290-9-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401201753.92290-1-philmd@linaro.org>
References: <20260401201753.92290-1-philmd@linaro.org>
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

Neither of kvm.c nor hyp_gdbstub.c use target-specific code.
Move them from arm_system_ss[] to arm_common_system_ss[] to
compile them once. The arm_system_ss[] source set ends up
unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/meson.build | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index f14debc6a2f..1b5d346d474 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,7 +1,6 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
-arm_system_ss = ss.source_set()
 arm_user_ss = ss.source_set()
 
 arm_common_system_ss.add(files('gdbstub.c'))
@@ -19,7 +18,6 @@ arm_common_ss.add(files(
 arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
 ))
-arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 
 arm_user_ss.add(files('cpu.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
@@ -39,7 +37,12 @@ arm_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
 arm_common_system_ss.add(files('cpu.c'))
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
-arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
+arm_common_system_ss.add(when: 'CONFIG_KVM', if_true: files(
+  'kvm.c',
+  'hyp_gdbstub.c',
+), if_false: files(
+  'kvm-stub.c',
+))
 arm_common_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 arm_common_system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
 		                 if_true: files('common-semi-target.c'))
@@ -67,7 +70,6 @@ else
 endif
 
 target_arch += {'arm': arm_ss}
-target_system_arch += {'arm': arm_system_ss}
 target_user_arch += {'arm': arm_user_ss}
 target_common_arch += {'arm': arm_common_ss}
 target_common_system_arch += {'arm': arm_common_system_ss}
-- 
2.53.0


