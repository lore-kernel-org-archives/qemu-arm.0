Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2176951ejb;
        Wed, 21 Feb 2024 13:26:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzmUuJJevDHX9f9hQlTVSMjmwnMn2lu5WgucXT2lpwtxBNmhR9/tyOBn7Rzsxs3ZJdWMHoP0cR6hpEGHxzLnoGHRpv1iN4
X-Google-Smtp-Source: AGHT+IEQZU3QpHNEXoLwSfzGQ/JY8EkCDVCxt6yhNBQFqVR0Vuo7Tk4pCM60SoJJUsqQnPxQhygH
X-Received: by 2002:a05:6214:258d:b0:68f:6314:e130 with SMTP id fq13-20020a056214258d00b0068f6314e130mr14970736qvb.59.1708550782600;
        Wed, 21 Feb 2024 13:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550782; cv=none;
        d=google.com; s=arc-20160816;
        b=jGFJonAoIZwz4GBpaznDdSLK1O32ggo8S/h3mEcrZx5jR8ptBdGW9zFVF7pQY0OvJr
         zF6D5D0NpKqy/JWH66p1gavKEyWccSZJ+n7VXMBfaXR1Yv2l+rJTAMc5K1kO2nho9rdT
         3q1820gk4/5bfNDV4GeCFd8n708/VEp7WCX399jfVmgg9flluYvLZLqTMTT2/+x/SRCE
         AD6yrMfv/yBNOF1YqUN/zMuETI/HDkIWYsjPXZunWJVy4I6dbVILUa8l7HgDO3FnIOML
         y7cFGXjFriwz7TvIIIkGq70Wd02WR1Y4weewJnFsycDs1F2woL5t8hKhHRuzEZNkMRIE
         zzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BV4BUYH/p7RXmaoiTzArsDf4sWF/v6E5dOHqrTpk5Lc=;
        fh=o1GZbbQ62ngg4dlaZxb53qVVhksovwgU8pY3p3NX8Es=;
        b=JqU9Ci+HJVwSTlJiLXwaGr+jfrOyBLMymZA91WGS4+53JAFqKfh0i5+poFeJEUz1aE
         Ct6TY8j1gg5+toGXf6dqYdSSoZGC/MI3NhbdGx9Tge55x9bk0blF0peDvgB6tN6u2gQt
         4GChZwbM8D1TRL/Kjkg8Ew0kwKStMqHV190cw+eTTSa4EYSSqKtkQ8U5/hAR6HAHOe57
         Sh1E14jzZNBDsQU/3Hqepyo/foYtr8dSoSZszIhoOgXtiUqlqADu4nMy6RoRHnWFsUio
         za9Ern2nHxAmmD2kBYtdy9nE/kuQMpqhGDa95aFuhlkrW8nAJVbfVVyEhaXUOEkBjVZf
         NdTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DzMyjL/5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc25-20020a056214411900b0068f65a8d4f6si8022348qvb.269.2024.02.21.13.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DzMyjL/5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctzL-0000y1-Ap; Wed, 21 Feb 2024 16:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctzI-0000W1-3y
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:18:44 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctzF-0001C0-2w
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:18:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41275855dc4so8168425e9.0
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550318; x=1709155118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BV4BUYH/p7RXmaoiTzArsDf4sWF/v6E5dOHqrTpk5Lc=;
 b=DzMyjL/50C8/xkdUgx6OqzMnHuTdlHHoL/oIIgattKBfNrAQ7ClF6Vz7PnUo9ytoEe
 eRQF5QjIzYzP5oZL0rR9k87zBBe0YxNs11sDY+6VjApXXHPK6ZEiVpKtKFt4CETVq+k9
 xgPV7MmMxv4M/DNs5btHLEL3+oxLGIG9scM1G4ZDjjLEn4ON5/OhgbNihnQRSSzfq3Tz
 xkjyEvSf/h/me/tbERSi5Akc2xTyCpfS9+/2vkOf1wjjUeOvMwk3sCWmKL0FB1iylfCU
 aW+cmVmZ+F+WfZI2JdWXRRrIdeiawuBJYfKN+jkfCr3++RmvsUhQzxix1hEbvUR1Ijki
 VXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550318; x=1709155118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BV4BUYH/p7RXmaoiTzArsDf4sWF/v6E5dOHqrTpk5Lc=;
 b=VNDlCn7bMZYbWFdoLZslj+c5miTqH236cnzMpQPCQ2McEpUw1sqZPhDZkZZxG7ZhjD
 4T9HaLNaBsSnxXgnQShn+m7FEIUKSXDrmWDdlon/2+e6CRBaoWqDjW3vY1p4faEvqiK5
 5l7S1+iNnPHhCmQ36pGyi+R7XrISYuYtcDrgbQINORf3fVZVh3WScQazU1ovcEERAxzm
 uSlXGZNFcVn/+4plJY0I/tBAOp5H09+8PhZLT9J984O9550fGb+c9hcea69pRieEcf5i
 H6iwiKpyDyazHUzLEcFeYnoPsZ2xJwegUgGrPjxRYvvz8iTrmMzdbAGmaAftAANUo9OM
 Inmw==
X-Gm-Message-State: AOJu0YyutIosyXOCDofHf3o4Kie8rpV2ojb3LDO8X6Z4DttLFkxiv6as
 rXinH2Dp/C5U2eVSuHu2iYvxlvPBAWfrGMq3UEFGPb9edhk23F3AqDTKSLncyA4zPiOtpCg3zcg
 +8To=
X-Received: by 2002:a05:600c:4fd5:b0:411:b834:9c79 with SMTP id
 o21-20020a05600c4fd500b00411b8349c79mr14858240wmq.13.1708550317938; 
 Wed, 21 Feb 2024 13:18:37 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c4f4500b004127dd1f713sm436127wmq.27.2024.02.21.13.18.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:18:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 17/25] hw/isa/meson.build: Sort alphabetically
Date: Wed, 21 Feb 2024 22:16:17 +0100
Message-ID: <20240221211626.48190-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: 9LfCxyrZRO/F

From: Bernhard Beschow <shentey@gmail.com>

Fixes: fbd758008f0f "hw/isa: extract FDC37M81X to a separate file"

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240218131701.91132-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/meson.build b/hw/isa/meson.build
index f650b39507..3219282217 100644
--- a/hw/isa/meson.build
+++ b/hw/isa/meson.build
@@ -1,10 +1,10 @@
 system_ss.add(when: 'CONFIG_APM', if_true: files('apm.c'))
+system_ss.add(when: 'CONFIG_FDC37M81X', if_true: files('fdc37m81x-superio.c'))
 system_ss.add(when: 'CONFIG_I82378', if_true: files('i82378.c'))
 system_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('isa-bus.c'))
 system_ss.add(when: 'CONFIG_ISA_SUPERIO', if_true: files('isa-superio.c'))
 system_ss.add(when: 'CONFIG_PC87312', if_true: files('pc87312.c'))
 system_ss.add(when: 'CONFIG_PIIX', if_true: files('piix.c'))
-system_ss.add(when: 'CONFIG_FDC37M81X', if_true: files('fdc37m81x-superio.c'))
 system_ss.add(when: 'CONFIG_SMC37C669', if_true: files('smc37c669-superio.c'))
 system_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686.c'))
 
-- 
2.41.0

