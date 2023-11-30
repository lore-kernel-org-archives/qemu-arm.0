Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp50252ejb;
        Thu, 30 Nov 2023 00:00:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8qYC/Zk6bqrTYUDZuc+4pIyVt262QdPWOZEvc6WpI3u2Hc8tdwGeN1W5fS8eMS+X6W67q
X-Received: by 2002:a05:620a:15ad:b0:77d:6be2:faf1 with SMTP id f13-20020a05620a15ad00b0077d6be2faf1mr20971411qkk.65.1701331236148;
        Thu, 30 Nov 2023 00:00:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701331236; cv=none;
        d=google.com; s=arc-20160816;
        b=ylsEK97vblGKhUS7alN3KOlwB/UaxN2bR7QGNHXI/RqVYiJYl8qE4ijPbcrWOrDCSp
         l+sBZaw+vajfHKFfe7UAxcVp/K420JlVGnedC5+tE8v+rSJ2NDiU+24rYDpdYa8rT50n
         ZXciCazfVRc6VOvZVmDpPipPZGr3q6V+uCSs9uK8kNieCsE1t13wiSp5OT7d9cdfZQGS
         Be/5kj/3hMhviAvR66nzANcnyTbymVJIyUo3sxwrh+x7U+0RRyJqmnCuVtyJi02zkwqE
         6rHUPcA9Z9N9V8taBIFCVB/x/IetHy+7Shc1InRPS+jT9WhdRbIUc7qHNpSZGcfwGorI
         zf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=GQXmI5dG7Gt3cquF9yAt8aqpNMg5Z7f0qPD848Q1k2g=;
        fh=esR+ogMZLubBrDBGBaqlC7clgujgq1Yy5VgYndkYPbc=;
        b=G2sEgOxWcK3R2QJ8fUUhV885I9AhkyDQt9mmu6BECZQoEOJcDGaZomvrn3TS9UagAJ
         wdG6mrxq8c9tWE60xWqt4ryZrUKsxZhNSiXf0jHfg2VcDWkFh5GLqFqdXjTzw5mGs8hL
         4YReqf23IL3UlILTzsbLjhY3b86ohzmNjF3XPq9fcyisUjCpO/B4sg76iFqsyJzwztWq
         kV5mhSkh/bd8YJfZzy9Cmn/3qwhjL4DUpZ89+UZaBp38MrLFYXa+0Sa0aTJbW8XwokkW
         9VX5l7HtEBU20JudWJ7ymC/mDuglDBU8+H7/4XRCuZaTqR4U+ZVA4zlz4ZoomfwQjr/N
         DWzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFr879MS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs7-20020a05620a470700b0077a09f1b640si577167qkb.376.2023.11.30.00.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 00:00:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFr879MS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8by3-0002D3-85; Thu, 30 Nov 2023 03:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8by1-0002Cn-99
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 03:00:13 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8bxx-00026T-43
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 03:00:11 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3316c6e299eso419393f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Nov 2023 00:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701331205; x=1701936005; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GQXmI5dG7Gt3cquF9yAt8aqpNMg5Z7f0qPD848Q1k2g=;
 b=eFr879MSgHVbT5w2vcqQzJEwmMkgB3v0pB+E6GMUE0eD55ed1uZgj0xgTDTiPMumbI
 2Z9lQDj2Bz1U61m7gCR2+HORKpX+A2TkIcYGUs6ZO5wyT1xGahXap0LlnjSQFvXykv5J
 IUEL+cRITj1ElLEF5hB489QVCWB2giDd+zzekxbvHybW5cakuFr6lSQg5ZdtRQt86Ag9
 XGKxH1NX9kdk5TSd+zhMIiSoxcRcN85FwzEq4ZMjd093i2oKhCi9FPPJVD0RbJbdpAO0
 lHxMjvWpQfGh+S/xmWSuHdIWs/jKkmhRRx6lSmPmKwrxP7URJwr/Bd0AH4xV3ymFgppU
 795A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701331205; x=1701936005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GQXmI5dG7Gt3cquF9yAt8aqpNMg5Z7f0qPD848Q1k2g=;
 b=jyJae/vwU43ACH0OAVYZbPAQoIXMFrvLi84hwLSbjN5ssN4brvRulQIJLIQsHXPkDP
 4oXtD2LyKVp3G4AiP2sRaCPJmkv1lMdBUhUpWXOlCrmXW1kqZJb5O4D1O443kkeohwIs
 wey7lyNE+dz1rNAtafhwbl0CZT45XQBCjxjZhcp8WPN+sUMZgz5qi9EpSion+aiwFcFS
 6HMKVwpJ6/QFSOJTMua40o72pLhLs5HfIWG2i2QaTee9aDB5SGaxwKlP8AcC1Me2oa6f
 Je22kZIurjNeaPBF7PqOmejBinSAUjlMf5zBjxeaiRREUzy3c/Peh9NGar0unamQUZ7r
 5wsQ==
X-Gm-Message-State: AOJu0Yz/vmtuIK2GxDnNMwNvFsLEVlP1td6KaQRBZLXvh/+DbqMeRsZE
 d6prkqB3QTKG7GpvqzgwyF861Q==
X-Received: by 2002:a05:6000:807:b0:333:880:e2b0 with SMTP id
 bt7-20020a056000080700b003330880e2b0mr8686426wrb.2.1701331205214; 
 Thu, 30 Nov 2023 00:00:05 -0800 (PST)
Received: from localhost.localdomain (53.red-88-28-16.dynamicip.rima-tde.net.
 [88.28.16.53]) by smtp.gmail.com with ESMTPSA id
 l7-20020a5d6747000000b003316db2d48dsm771518wrw.34.2023.11.30.00.00.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Nov 2023 00:00:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0] accel: Do not set CPUState::tcg_cflags in non-TCG
 accels
Date: Thu, 30 Nov 2023 08:59:58 +0100
Message-ID: <20231130075958.21285-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Kx5YO5AgoTl9

'tcg_cflags' is specific to TCG.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Other targets already use it restricted to TCG, or are TCG-only.
---
 target/arm/cpu.c  | 2 +-
 target/i386/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 25e9d2ae7b..098e964644 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1781,8 +1781,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     int pagebits;
     Error *local_err = NULL;
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     /* Use pc-relative instructions in system-mode */
-#ifndef CONFIG_USER_ONLY
     cs->tcg_cflags |= CF_PCREL;
 #endif
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cd16cb893d..dfb96217ad 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7222,8 +7222,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     static bool ht_warned;
     unsigned requested_lbr_fmt;
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     /* Use pc-relative instructions in system-mode */
-#ifndef CONFIG_USER_ONLY
     cs->tcg_cflags |= CF_PCREL;
 #endif
 
-- 
2.41.0

