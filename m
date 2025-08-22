Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1709FCA0EEB
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 15:08:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upTIA-0002bF-Ue; Fri, 22 Aug 2025 11:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGo-0001op-QO
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:01:37 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1upTGV-000507-UE
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 11:01:34 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-245fd2b63f8so22104765ad.3
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874871; x=1756479671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VOVnisglo5jzNI/INr1+W/vKqDDJp3WOe2RoZiFusOw=;
 b=LX4Jq8G/URrRA4zxuMDed21XxvKKKHCv1Cevk1thilAkoSxpuKYcHlw2eyRPZ9HcPG
 xaUapCAorHZb7WZaMbQ+/WYnc1yzQrggs3Et2/V5uB0qX46vgZ2q5GrStXFOoX/6CKUJ
 xWsuLBQNa3oQTP/Pjqbuv/+R6DwQ83GfOJzq9scQzSxd3orKqktN4jLm+IKtjuLEoiEg
 n51/fWgWXs5zngu2vmcgZRUKwHxKmqDwATiBAeWx6KuEp7fZJkjRnBZwMpopYNvV3Qyu
 d8iUot/mmYIa/W1OjIv6ZpNu8s6/iduCNO9or4i+S85HxhOKzOhc6baLNJ0Lbh5r66U1
 x3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874871; x=1756479671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VOVnisglo5jzNI/INr1+W/vKqDDJp3WOe2RoZiFusOw=;
 b=dEKlr8MIrA0XOEtlIa4ckUBX9Tkf1kBvzbnPs1Z5/c7InoH5hbIJJwXWhUHiLjtQiT
 IRgBK3Su52goPg8a/bB/TgqYI1o/OWSfX+zCqcGmleOql5iMUblvpwKC2bNxY1AoNTcY
 lgJ8Mp0RMtdN9tPNm15Z5BUkbFVMXMEPTd5UQUOR/9jDjQbAK3WAnvErUIcPc1hJh5Mp
 ybsZSCwXlyiPhnkce63gcQTVAdQUeJdfaUdezJ4qrPQL5Vv/iZfq64afoN7qwoaqmWN8
 Ft0qAUARrrDaZVqBF+JV+n8gvhDx7LOoxZzQlVadNgdk8/g96h4aExxbpGe+ed8Q269L
 Pd7Q==
X-Gm-Message-State: AOJu0Yw3a93z2FxPZZpADgC0AbytKTUk+VwE2pt0Xi/7W1SHDxBh5bve
 CsWCBq4Ym6Tq7mdpewW8mQ8khCgXO9BuE7lWNDbcpYChFyBBGPfxrxtmByh66OMJJM4=
X-Gm-Gg: ASbGncuBagEhyqG59EA9tC9nWb22W9kz03rGqolBw/UoeSTOQIq+TjaU8UFwo9mWouF
 bLHFXll9LQw1Sm/jyudffCYngcLbwdDmkM3caI5nSVSz+iIICmwEwCB+ZNmSGpIG/uIp2nXsMsT
 QE2iy03F+zLfgBon/MFEqKNjg5yxkSDwV/XD0HBm7wKC06fDwevSuv95MaKGk0BQaKZdFbcb4hd
 bERnXAnBx3WJXuuXT6LRGttMVUdu4YZJWk0EvSs9DzRDrDE41gv56acHCHJWkXkUL/kqK56yLAc
 +d+sWsZkvfMw7GUJgMw64+g5RmX/9f5oSA1VRhFgzembrJrdNx08S95tMRc7qJD6Ygd30pgG6iB
 lIuN76GvyIdYZmbvp1Fgpks4XzI0+nn+yhf6DsZ5keNY=
X-Google-Smtp-Source: AGHT+IHG9SrUtbT4bltQf5ip7UYhwh2l2YL9y9U7JzczYp5hwsJvwbBP2bBw9V4Nqpj+yfm9QJrI+Q==
X-Received: by 2002:a17:902:e84f:b0:246:648f:80a3 with SMTP id
 d9443c01a7336-246648f8493mr3259795ad.50.1755874870919; 
 Fri, 22 Aug 2025 08:01:10 -0700 (PDT)
Received: from pc.taild8403c.ts.net ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed5406e4sm85929495ad.165.2025.08.22.08.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 08:01:10 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 05/12] target/riscv/common-semi-target: remove
 sizeof(target_ulong)
Date: Fri, 22 Aug 2025 08:00:51 -0700
Message-ID: <20250822150058.18692-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Only riscv64 extends SYS_EXIT, similar to aarch64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/riscv/common-semi-target.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index ba40e794dcc..7e6ea8da02c 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -25,16 +25,16 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     env->gpr[xA0] = ret;
 }
 
-static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
-{
-    return sizeof(target_ulong) == 8;
-}
-
 static inline bool is_64bit_semihosting(CPUArchState *env)
 {
     return riscv_cpu_mxl(env) != MXL_RV32;
 }
 
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
+{
+    return is_64bit_semihosting(cpu_env(cs));
+}
+
 static inline target_ulong common_semi_stack_bottom(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
-- 
2.47.2


