Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2602310ejm;
        Sun, 23 Apr 2023 22:58:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350bMTtZxU0u3Q4ODDsL/wxBECvakGHRKvGN9ta8/N6S5dMTBB0fihNBR9ti+rlCodp84UhY5
X-Received: by 2002:a05:622a:120c:b0:3e4:26de:162d with SMTP id y12-20020a05622a120c00b003e426de162dmr21322049qtx.16.1682315895181;
        Sun, 23 Apr 2023 22:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315895; cv=none;
        d=google.com; s=arc-20160816;
        b=KX46Fa9rRZrlko8J0hQsrF4b+FwangfnCm666afkiZFmMR+4kamydH5tebmgw9vzR6
         UO94cc+gLqwIlmzWzKn+vfLCMR3JCFONthGlzVXor6UI0dV90r5EItcWUKNK1rZXBpoL
         OkFpksca/KI+9s6S9iMxQbEcCTAVizvEyeINlZ2sqmqRRkWdd7tISeEJru2FJltfQ2S9
         qkbdvw8zmxOP1HGxFX74F1z1QWWM8a3Q4qRdhBBly1Ix4UC36y1LS+8cNVJVcKd9uTKn
         ojG+YUus4drDZstyXpaRissCRVhtEpgv9WYYEzc5j/d4PXrsYDgGOj8UKXoNux70S/K6
         1y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qWj3vIxSlO8Q0IQAph2NSAlaNgeUKOrsmzRl/9QoxjM=;
        b=OIw/Z5aC2sdC+HI7i2cWkbvUFo2yqJwb5MlBcLvWTS8spkqBWfO3M0AVD5q8EZ5hbI
         1qQa+kc5iFelsdXmKSrfBEGioUXBXcRmb0ohr3R8YEuK4aTLOZZVhwakdF+8N/QNAETi
         dbIYgyzbGrZFnniVTNHZL9kF8z90tFNDbgSybhK4Y09zb7hNdABcqT0bWLSPS2wbYW4Y
         G7Ce8EgLBLx8WUhqsEO4TYmCLK/1bFzC8Su4CkOFZHfbq0qBJFzfi9s8HeEFiKYullnh
         ZHBt/5yfhTqhgC7HPVi4+n7MFzkbwsSJ9SPOIlIRard4lbaYyqNyBY003vx3AMRZcV3O
         lKeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yoEw3zDY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj10-20020a05620a190a00b0074d973f6427si7073327qkb.93.2023.04.23.22.58.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yoEw3zDY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp5R-00085G-9s; Mon, 24 Apr 2023 01:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0x-0006k4-Kw
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:43 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqp0I-0005Lq-UQ
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:45:22 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so25580745e9.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682315078; x=1684907078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWj3vIxSlO8Q0IQAph2NSAlaNgeUKOrsmzRl/9QoxjM=;
 b=yoEw3zDY0foIEusVR8XPn1czPjOqYt0FlfxOlDHu/7lLIXoCvJGMkvOOY1kPxOza3r
 vf6f7Cy5PUo9K3vcDxbUGLllgOCePFNf1ygpwUrIvS9iNIzMebgUl7KVjDC/MOuLD1uu
 clkKcLhTozayONu84y3uPCt8pl8jPifTCkoUWNDZgupGfyAcu7bMozj6ozW0Scg1ob0c
 9tqrezJtxWHaII5Fc9xZp+4881AovhSlKue2cjvyhaVVZSExZg4k6ToYmnar7IMb1R2w
 Gxdlr0/Hg9lY1HHvbiUDRtMae68PyJEVVNYweOoGm3SVVWMmUg4H3xaNL1BzHW0/orX4
 Un2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682315078; x=1684907078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWj3vIxSlO8Q0IQAph2NSAlaNgeUKOrsmzRl/9QoxjM=;
 b=izSFO776ByarZt9MUnjd0mu9LdWBQCwd+DGhZHwUjfocvpOI6OY8THjhM/zcePKSBr
 yhVyU7XYWSE5ztxS1feTuzGaVl6YK+Df70fPILfTEQq4wgcrv7XiDCJYXi0qhFnXE+gw
 fx71UHA4uVuk9+/qZOpiSZg+YQVLJn97wC5308UdSWAL2dnnefXx8zk7WRTGbZ6ur8po
 39WViXrGa+aFN3m4BBeYIMgXgtHXtdCbTemQBiDcBF1DgBtLHsKxCe0O+aYGAnMeiwP8
 nAc3mrLSSYO6y1YwXFCVYG8MLkpu2wExai94vliB0j1j0xTle3hNesiWrBN9pVMNHovh
 p7xw==
X-Gm-Message-State: AAQBX9e9teoRpB/BvGA8mfxDLWQWogf+ciCIbk+lon+2HEn47F1IDOuC
 S4YsWbidkmi5UI2rzyrb1mP/cA==
X-Received: by 2002:a05:600c:2309:b0:3ed:f5b5:37fc with SMTP id
 9-20020a05600c230900b003edf5b537fcmr6650896wmo.1.1682315078064; 
 Sun, 23 Apr 2023 22:44:38 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm9986693wrp.59.2023.04.23.22.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:44:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 54/57] tcg/ppc: Remove unused constraints A, B, C, D
Date: Mon, 24 Apr 2023 06:41:02 +0100
Message-Id: <20230424054105.1579315-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2ove4YbfMhce

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1

