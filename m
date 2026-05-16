Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A65CD4F46
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:16:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIcZ-0002S3-Pt; Sat, 16 May 2026 13:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcY-0002Rd-Gv
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIcW-00086P-SN
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:16:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so6226605e9.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951771; x=1779556571; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xr7AB72ORRy71rA35bL81bHEuFs70DepQLKA20BG1Qg=;
 b=nZ3uuSnYWWuc7qtc4dQbNiJwTBK9peBjptfM4uy2wgXrHi6IMI7HwC3DeGFYbRreS6
 R1fM75ZMWee8JLf33kx4hue97AlYKNdQgHe1v4yO23lt0grwEOZUkTYFaWC6/1vbYrRD
 GcmQWBx2ZBPJILZsnCOqgbn2yfdpWUXOHBNCoU9uXAHEFT2mMRGG31kw2jI9+h1sErqU
 gCf3XQc0z3KO1FwQ8CmXyjSRZ17j0erMzyIEjfsZuuhUAhn5qR1Bkl+8tiG+VHEbh+iX
 XrNQufi2JqP1ubEU8omvA8SBSGO7X0mh4EyYrPTvfV4KM04a2eLxsMK/gC85al70dH+m
 +vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951771; x=1779556571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Xr7AB72ORRy71rA35bL81bHEuFs70DepQLKA20BG1Qg=;
 b=H8K7B22jjwCZuZ3cSPErh4Ao61hpMg2LJd4Serspaw5qiJs0vR0Y7HMWad4IOaIm9f
 MaQsjPdusjqrc1fm7MBl3KRPOg+f7eRGL2592OjfAmpXzxrPWBy39l4+Jh9K2EQdkoTw
 LE5MJoTlu+6pYKBt+rc8+XhCLJL/CPjCEZsmXsOGOopGnDJSmGRBcb4hxav1l6EnUNM9
 JhZkm2rtfJHXi9lS2hAYdkB0ljqbm2hPKijdzAhNW3IAnjM/42GCeSthJeSnFsVqNmhE
 JIq/HaSLqALqjIKxzwtmtQWQoRof2xK3Y5nrK6h/FbT5hLy5Sb3q3WEdAXdt+FiQ9pQf
 oQpQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+WhrGpFN7kEn9psgxQVO5W8qI7oMmJDt99W2dm8YMOIgI+n7ne3S9YSjmYEviJvT99ce7g+mh7gw==@nongnu.org
X-Gm-Message-State: AOJu0YwxoBs2VsldYumiMcmRyBaGRfhJR09iG3glXX8xWmaP1tPv4uYA
 Jvpj+FvZjfeby0N2rmhZP57HpYEzQ0Dwbru5b1vT5QjGaqLJ+SBp+VMn+vEsDusTlwE=
X-Gm-Gg: Acq92OHqhc0khvekCYvoauIia7aqgswx4jjm1TzMazk+fuflBHlcFiNFK5TjRBdG1Cc
 GBjzwv3LXI7L8ba/hwePB9Jgr4PnwcrPy5PfeOzhRcSSbUNIu7cTz9ABKRS0eWZQnHrxq9X2Ntm
 nu+J/bWavLJdeEXHKm1OoppHsm0d6CGDq5A+NKsFa9OjsJMIosc9dmIXtTA7lw8cLC/pxJzVURN
 qxUpdSA1dHnbB7PJu2Fub3pCNPjYX23NgPX6m8rsGDDPzRa+dplQVtO5E4NK7NXZQNMTdshg/OS
 ZFqfomSt0LGpogiq3JpfC54/8rAx8Q99dYLFNHRGonwd1s1cGh5uUmAN8OSJqSWJik1hUjNI3VT
 2vtxAok6tFUr9U5R7X1M3dJ0BixjjsijN4Jgky9cVBof6CzH3wtQaUWlPcuwuGvitnE9DIo5uvt
 zUm35IZL0N0C5n9YHRrB+4i3Fo/0nxm9nn4lD7u/3H79F64TM961yyCBfY2ViRwpqwZGfAhqLPt
 MmiekBNUTk=
X-Received: by 2002:a05:600c:5298:b0:48e:635a:18d2 with SMTP id
 5b1f17b1804b1-48fe60e51d1mr122723765e9.2.1778951771167; 
 Sat, 16 May 2026 10:16:11 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fffb9aac4sm22165725e9.9.2026.05.16.10.16.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:16:10 -0700 (PDT)
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
 Fabiano Rosas <farosas@suse.de>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 06/21] hw/arm/aspeed: Build objects once
Date: Sat, 16 May 2026 19:15:08 +0200
Message-ID: <20260516171524.19184-7-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
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

Commit 064f1ce95fe ("hw/arm/aspeed: Split AST2700 EVB
machine into a separate source file for maintainability")
remove the last TARGET_AARCH64 use.

Now than Aspeed machines can be filtered when running a
qemu-system-arm or qemu-system-aarch64 binary, we can
compile the aspeed.c file once, moving it from arm_ss[]
source set to arm_common_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/arm/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 144e4827660..7c3d66f4378 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -43,7 +43,7 @@ arm_common_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'x
 arm_common_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
-arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+arm_common_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed.c',
   'aspeed_soc_common.c',
   'aspeed_ast2400.c',
@@ -66,8 +66,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast2600_gb200nvl.c',
   'aspeed_ast2600_rainier.c',
   'aspeed_ast10x0.c',
-  'aspeed_ast10x0_evb.c'))
-arm_common_ss.add(when: ['CONFIG_ASPEED_SOC', 'TARGET_AARCH64'], if_true: files(
+  'aspeed_ast10x0_evb.c',
   'aspeed_ast1700.c',
   'aspeed_ast27x0.c',
   'aspeed_ast27x0_evb.c',
-- 
2.53.0


