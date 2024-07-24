Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3360807njc;
        Wed, 24 Jul 2024 15:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVl1yCfwdlHz6fn/oLQIAHPDn7xyn753hxA2NADrcR4ivz2KPRP7pySjHOab69rKEoUHxbmlMw/QfzxZJUrqYRe1kf3iVWc
X-Google-Smtp-Source: AGHT+IFD7JuRILxda2wu7jcXKUZlYIA5zmml0xdfM00727NZIl/nAdSxWcuy4IDGaknCfrOfxOeg
X-Received: by 2002:a05:6808:1882:b0:3d6:2e22:a09b with SMTP id 5614622812f47-3db10ffe9d8mr1126074b6e.37.1721858862231;
        Wed, 24 Jul 2024 15:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858862; cv=none;
        d=google.com; s=arc-20160816;
        b=PtniSrgjwKPYkIMzIl0S+pi1y0LN8EoxhCdNLLk6XgiW/GP6ZUGZXqhn9chCmX5dL7
         lMAaoE6QRIO1ZTDJ1myYdMEYopbCNyTHxqrk1djjcFXNyG2MciZ+Aw0a45q/Dz0GNwMY
         6Lw4yLt8Z/IwGmgMnOQXaHD/TWC6xNIt7hyahPtQdqfz9GVWOmFLLhMrMQNsHyEyGHc1
         +63H8WfO4+X0s9zpV5wlO8H9YIkzRNOC9D5bOHhHtDSu++DH1CdCn+BKKVU60ujy3aU7
         +ZKLNgkvR4QvcPfq1/MIaBzfHlo9wo7ah23VtwyaC3A4DT67QGqXh9O34SlYmmUdzmiP
         pNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sKGM9WxUN43+saolT8pUI05xHvMsh3XU6bG+jc3msxQ=;
        fh=kfG1x+0axBVcoHBm/VY+M9QswZGiHYSoouuZYTNaYcI=;
        b=JKPbzsTKDHm073Jj13y6KaHGt127LzEkU40XmDkLm0jY4H5d3kFT5Khk0ztYEjLmiX
         FjpCR2y4iZl//0iQ2VWPjf/XwauxuGIE5w5TAMrHGgVVSJgcQxFfZdRAKRbTaXRh3d6U
         WBH9zLijkdnPaR3gRGcSIMFuB4VRofoF7Dka7jeiODU0XQblaUozr1Z2Q0+H4k8OtoI8
         GIYlXElA3FtUQOe0Kzy8idvR9/g/y+Vdg7hE6NeI7NqIOH7qRULQuAsIFxWI4rAeNP3M
         8gkDmfclG7HXZxmD38ZxKdmet/OAw48JgW1XApF5WIv4uC6/cl6tWhzcCID+bVdUhQU7
         4HtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=fj0DpHg4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe8425805si1062141cf.599.2024.07.24.15.07.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=fj0DpHg4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWk8G-0001gt-TA; Wed, 24 Jul 2024 18:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk8E-0001X4-Qk
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:47 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk8C-0006ef-RV
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:46 -0400
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-816d9285ebdso12588239f.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858804; x=1722463604;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKGM9WxUN43+saolT8pUI05xHvMsh3XU6bG+jc3msxQ=;
 b=fj0DpHg4ax3OrtyshVGMggH2e9cZJw2LH+0ojPaVgcqKZWQE2pSA9JMy031cRpldl8
 kGXOJkLfBqAfwHKPhu0T5v+V4Cqir9Uv/JdZyIQzAySbVx66xkrLbnl3fPc2CPS0sThQ
 3dfvqi8fcPHBDzAORCixXraDV/fd5+I6usOLJXdnoFajrfl6cOOhoJ7Bqa0B5JWJHuZ5
 L4jrhQrolV1m3aUo7pqLUqoq6B9CMOpynd8vEFP7svtE0l6if7+9DxHeF4+4zeNC0nVh
 nlumkNKglAEhcsIx28l22AGS3ocZA/1FfG89mFvI6YDzq4Sh+0OqoDN4U6eusNlHDKB3
 FKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858804; x=1722463604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKGM9WxUN43+saolT8pUI05xHvMsh3XU6bG+jc3msxQ=;
 b=fC+hOs0S95puqwtVGslGXlzy2yPinWED0WKBJ9pjIs/J1hasjgeJjGzeEM+SArW5M5
 hJ2E3EpbxAWqJ2+OsIZ5sSsqPntw4DzfdMgZD8qXRnDrVEmiNkA6TjgBE7D76oCPsT5b
 asHx74etAiN9R2FasHzejNDKT5AAp0hgiPNzcpsu1/Q74zqfKaBZV+9PEBorqTFW5Bur
 Ojym49fkPavw9ptKsxMsjn/scARUFYRhFjqtJKfGh/VRWv5mIxirbDs5btSlDZRXPp+5
 mZE5Sa3xi8F/ZDOAUBIUQGuaDawOjYOZc9/Ib4FQqT3MTPFQkVmLPx7rdtIRKmY84jcU
 hh4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKEqIB31YCCDPzTTFwXzbSVlL9Gtpv/wQ2zdQ8+N9B6Raia2c9MSyMxXFNytiA8QJx6Ko7Fz+Es/pavQr4dxytMVYa
X-Gm-Message-State: AOJu0Yyw90Fvteoi/LYKBOBCwF5eQ+9vky47JIAXiz5baRKQcedNJpM6
 QsK0oFO/VUD2+BeK5BdNdlAMFUxus0PacdF98IQQa6SDNJhiwe7eE7y11NgncZs=
X-Received: by 2002:a05:6602:6417:b0:816:ec51:f415 with SMTP id
 ca18e2360f4ac-81f7ba78fb7mr165580839f.0.1721858803744; 
 Wed, 24 Jul 2024 15:06:43 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:42 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 13/15] bsd-user: Make compile for non-linux user-mode stuff
Date: Wed, 24 Jul 2024 16:04:46 -0600
Message-ID: <20240724220449.10398-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: ES+yDjpxE1sa

We include the files that define PR_MTE_TCF_SHIFT only on Linux, but use
them unconditionally. Restrict its use to Linux-only.

"It's ugly, but it's not actually wrong."

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index c8cef8cbc0e..5221381cc85 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -404,6 +404,7 @@ int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GByteArray *buf, int reg)
 
 int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
 {
+#if defined(CONFIG_LINUX)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
@@ -425,6 +426,9 @@ int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg)
     arm_set_mte_tcf0(env, tcf);
 
     return 1;
+#else
+    return 0;
+#endif
 }
 
 static void handle_q_memtag(GArray *params, void *user_ctx)
-- 
2.45.1

