Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2156480njc;
        Mon, 22 Jul 2024 14:46:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX97+SYBowxpiAr6ycqv9JuydcH0u4yxPB06OU1Cq/bHRhtXP7AeG8VKmptPqFzG5bhumHkCS2mu1JJjaSK6yAeWtJYOBJf
X-Google-Smtp-Source: AGHT+IEZ+qtw2OebzGWjhlghn3tW374JDCiT6Iy3/jNo3SC8tO2v1TsWVzq3k0LXZlMiRBOZ6+N3
X-Received: by 2002:a05:622a:1828:b0:446:11ac:e828 with SMTP id d75a77b69052e-44fa5383865mr143723951cf.52.1721684818140;
        Mon, 22 Jul 2024 14:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721684818; cv=none;
        d=google.com; s=arc-20160816;
        b=V1Z36vPJ0jA6MFGjHKD23dK1vpOkCPvShD1qpWzJkW+8kEAdyxcVmQalwKdTHYxPS4
         DmzKYbt3TwDzXyaaS1zeGfDbZZL5+uKITQfSbeZm6Lbyq7Wmvx0QVoUAVWvgYfvJHgFB
         s6WN1jf4CR+VkuwKig9l5Z49bILU7GiX2Wo8FP4K/KJR38zeHSNEAMNjIIMQph067lS3
         tMDihEAiQvxXrGK/kmABGxr5Uh937kMKHNhRpV6cVAqYUDaPY+USwMJh9Pzwva1Bgatq
         bH10LUMezApLVzS9GCwDtiz7WY69nUrb1T+KZxHkPYLkhyrdayJ8/6f6I/5vDsx5d+6c
         234w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x//+WoaO7Dn+k8eyr+KqgxuGF53Mml0Sq9XIPzmFBuA=;
        fh=2KclHCzik5tDCVS9REVvUg38rwm9EbnXEtbkm1gMIvY=;
        b=XhfVPAbELKfd2+t+kOkVb9eMcCN3Z6Kzyh8yIyP0VP7UegvVMnxY2ZbuxSbvbiNKT3
         CgdoWIXREXzFJZDGTGNApMJTXSppdK66Elis4Q3PLPdtb8CNQtxXaXCzv+pD+4vhJjMp
         N3QiSgCJvoGtbh5Mj32QYao30X7AWOCEnMXD4uiQVeUG4iX1haxpi4oA8JsoKr8jZtwB
         MGymCJdjArTZeJd3qlmBaydulRsv4Xo2HGMWr2prvUrMjfc4Gz4kuNgaWf6yfBBoL4Yt
         IHprIn6nknfdPLOU9oPKr5BpJLB3BvN/2cuTTQoDOAhnYIQ+zBesizFlMguHL+bZnnpe
         WTmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=1hRQ6M5F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cd2b536si84780751cf.223.2024.07.22.14.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=1hRQ6M5F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW0qn-0008UA-DZ; Mon, 22 Jul 2024 17:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0q6-0005Pe-Tg
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:45:03 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0q4-0004NV-EK
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:45:02 -0400
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-807687b6652so231605439f.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721684699; x=1722289499;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x//+WoaO7Dn+k8eyr+KqgxuGF53Mml0Sq9XIPzmFBuA=;
 b=1hRQ6M5FtQxdbEfOnQ4HYyEAwt/YZDR4d5xUArTWqT5pP6kBh3yDidcED/d9zsVnh0
 wH8bBZH9zoI7EoDclIJ43/5yBdHN1UmIqJy6kA3e3E/1BrO/ZHcHJrkQw5bXDlLrxMXp
 6UWxZwmmj3FwkMCoJCTmLztvdA/mlMtxx7MBFsQVl/QtnHVt4yVEdD76JCMeqYEDXOfE
 w2Hk9sRnKwevAGMZehQ2RZ6AS1OneZ13r0kz+lnVCehzj6Mpa9KmOX1Oi3r+x932XGYv
 iw7ba+fEdTptdWpTV9wJZQu6o/alyTZt1V6kVhMkqD1XQIfn79WWQqm3B59nHBXC1KUw
 K5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721684699; x=1722289499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x//+WoaO7Dn+k8eyr+KqgxuGF53Mml0Sq9XIPzmFBuA=;
 b=B6hPngasU0ubRt5aWbhhX0JNVWXRyb3Rr/+ukUItgbYt4avtnWIN5sKBYvVGTWt+h2
 C+WJE3H+T5RnzZQJ/bI+H87LHwh6iH3QMWM+XB90MMVLPPn+4IgJPYmUTBSyeSmQT6xO
 +tzqeE7BQRo2FpyVZxSOwIb64oYoqSr79wJ/675kFBuCD3oPTySkFo4X40JCTPjHG2Q4
 TcB7asm7I49n1IAKZwRpApKwUy3PPgGkVUuCDNpN5VnsquZhhdQHShW/sAlJta9EV46+
 7ebZJK51Yl4W6bmVeQgvOhP1iGVdM7yBYLFYyLjqeIX5n3BWtuNKcLRHPilSM1NMqMW0
 QaBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/83AT9KbEXWLZWQURmjmmhpjzhb3LCGtXS69onDUHxvZlDTwmRBiBr3Frv5ID8y724ljqTCxQtMHVzfrENRxjF5Oo
X-Gm-Message-State: AOJu0Yz32Ff/Lp4H1n/obiVHsouRfFHdotUknTXZpemTst8+9nKM1AJq
 SkJnrFd16OOpUaj84/QWJOEJKbsEQve36DxSlpQU8DyECDEqOYZGR7IBLjVMeL6I0gdnXuzhNOr
 77hU=
X-Received: by 2002:a05:6602:482:b0:7f6:1cd3:9659 with SMTP id
 ca18e2360f4ac-81b33edfba6mr1400411139f.6.1721684699006; 
 Mon, 22 Jul 2024 14:44:59 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2343d2ff3sm1816830173.128.2024.07.22.14.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 14:44:58 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 14/14] bsd-user: Add aarch64 build to tree
Date: Mon, 22 Jul 2024 15:43:13 -0600
Message-ID: <20240722214313.89503-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240722214313.89503-1-imp@bsdimp.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
X-TUID: +h+s6P26Tum6

Add the aarch64 bsd-user fragments needed to build the new aarch64 code.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 configs/targets/aarch64-bsd-user.mak | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 configs/targets/aarch64-bsd-user.mak

diff --git a/configs/targets/aarch64-bsd-user.mak b/configs/targets/aarch64-bsd-user.mak
new file mode 100644
index 00000000000..8aaa5d8c802
--- /dev/null
+++ b/configs/targets/aarch64-bsd-user.mak
@@ -0,0 +1,3 @@
+TARGET_ARCH=aarch64
+TARGET_BASE_ARCH=arm
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/aarch64-pauth.xml
-- 
2.45.1

