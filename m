Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3812714ejb;
        Mon, 19 Dec 2022 13:11:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvN9jyT3vnEKfbmUcCnMNgFN4SzgLlzOXJEFNPvt6svEwvKhcUa/ws09hrb+OQyafJYuKbS
X-Received: by 2002:a05:622a:1786:b0:3a6:9318:9c90 with SMTP id s6-20020a05622a178600b003a693189c90mr16371534qtk.66.1671484304847;
        Mon, 19 Dec 2022 13:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671484304; cv=none;
        d=google.com; s=arc-20160816;
        b=dK0HCgNGYI/i1fhoKUGTlGNPerv7n4hZ2T9euC7VKKRByY/i29iRJLaZFvT35OFsLb
         qjWBRoCBYHETJls+9I+CAjTO7/LNckixO6YAqZMKtYZ+I96eVbH6PI3f4h9h/kRhc0NJ
         qD7Hvo00FyvhuTZFehTVGae/mbM4KlU9aHlozql/Gik67vFQH9pRR33BwJXDCpymSNNc
         Ez+/0sBOZgePVFEKmNGvTufq4Gr5vcL/iiI5+kICrsSOL6SGgd4AVn5lnFJJlY8jAvTq
         rdso+iAlhgp+jx2KhNaKtp5XNtOoGf42Xn55Zc0fX2geqTSiHTPfQbu4DeVHMLTmOAOx
         AkKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zh2BhjGyR+505UTOkbHhlLSYmk781PI1Kr+7wOMQdrY=;
        b=yJB2vGQQNMWFEfhXaz2KGJpluuij0iUEk8rjyKv+3WcWV66IwxTHSviHhvHT9FSy80
         P6vShSTJ9KyP3LTmO9zi95TNF362yPMzsiQ/jESnPMJSfshdIIlqTNiLWZXrGKqO91PY
         bY7lHDSK15CtL6k5actFUkbgxiXxl9NWQO5LANBWX0TZ1nPeO2noS5zMp7bw/c7aBnhQ
         LJUB/lyit59EglCxixbaVZsY9LtqOFtNWlnNZ6Wwf5dfojHINfkGFmAoU1SnqsjjMCqI
         cItVsj2NlzjWJB4RPDP+gl0ibPDJBP8IOFATmKdzluMQKeuDgtgTuEOPe1UHpjQ61yEK
         XoOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h2QSNvj4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020ae9c003000000b006bbbdefd8a1si4136089qkk.727.2022.12.19.13.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 13:11:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h2QSNvj4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7NPG-0002ri-Hw; Mon, 19 Dec 2022 16:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPE-0002rA-U6
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 16:10:40 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7NPD-0003sY-9Q
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 16:10:40 -0500
Received: by mail-ed1-x534.google.com with SMTP id a16so14737730edb.9
 for <qemu-arm@nongnu.org>; Mon, 19 Dec 2022 13:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zh2BhjGyR+505UTOkbHhlLSYmk781PI1Kr+7wOMQdrY=;
 b=h2QSNvj4t9GE6VAVfl5inolgOCKTDTHJcUCqJvm54c8j0JFgzZG+GIBeIMPLYdhsdG
 j9jzPlHosAgwlFwAyqNSDsIKc/FDUfE7kUcWnvcYQD5lxQheHi6NgV/w5hIjbEShcrd3
 +uQVIdCEkBMq95h4ctj6GoHS39ppeoYRi40ncl6bHXC0GMdXdD1h12LFdq6ADv8Awk67
 WxW/1DOcN4yxrXTb12LjcuDt/3JF7VzbeTQ8Htd0LI2F5aCcU6Q3bsVTL2EH85nAnEsW
 nPiEX10O+9fc9uW0Acl+ZFfjAYo5IdWUCmqqRyqX/Jsxn+z//w9Ant6vc4GW8CgePFIs
 dRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zh2BhjGyR+505UTOkbHhlLSYmk781PI1Kr+7wOMQdrY=;
 b=fHmEclLxzqD814F6f9Kv928sOM5/DFfmsJSMiMEPD+fnU3JEhOb2mTgUGUXxYrNAii
 uJMLP+n0e6TQ6kki5BHKbB7lOIn7EuMU91wMsbqR1epSoiCOPoJzOxAmxzE0TfzEaSdC
 4l7MvVpDQ89O3G191scYH8WVqtfvnhbshYq8/JeUfMEWAOb5t2cnZ3JrGoSg3xwqNVl3
 aBfb8LBJT8u7+a1LuB2rHdlhW9y3vbe31oelcGJJrZGmEwWC5TErgqTKA+5n74FIkc0s
 cCMfXoekKGEqzP62mmYeZl5d9UEMRnUABAu0xnILwbDFLo2EhhfezwcoVN70SHXL2rb6
 OK8g==
X-Gm-Message-State: ANoB5pnwips0seDoRNG1Asy5kBND4Sb9wI8jNdfEqNZ7GGXBsIMP1WeD
 MPsMi/iPynJ7EPVgFxJUeGQS/w==
X-Received: by 2002:aa7:d403:0:b0:470:31fb:cdcc with SMTP id
 z3-20020aa7d403000000b0047031fbcdccmr24958380edq.6.1671484237462; 
 Mon, 19 Dec 2022 13:10:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 eg53-20020a05640228b500b0044dbecdcd29sm4843803edb.12.2022.12.19.13.10.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 13:10:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH 0/4] target: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Mon, 19 Dec 2022 22:10:30 +0100
Message-Id: <20221219211034.70491-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dYClrFcqVSup

The "qapi-commands-machine.h" header is not generated in user-only
emulation. This series removes its use in user-emu code by moving
the QMP code depending on this header into a separate sysemu unit.

Philippe Mathieu-Daudé (4):
  target/arm: Restrict 'qapi-commands-machine.h' to system emulation
  target/loongarch: Restrict 'qapi-commands-machine.h' to system
    emulation
  target/mips: Restrict 'qapi-commands-machine.h' to system emulation
  target/ppc: Restrict 'qapi-commands-machine.h' to system emulation

 target/arm/helper.c            | 29 --------------------
 target/arm/m_helper.c          |  1 -
 target/arm/monitor.c           | 28 +++++++++++++++++++
 target/loongarch/cpu-monitor.c | 37 +++++++++++++++++++++++++
 target/loongarch/cpu.c         | 27 ------------------
 target/loongarch/meson.build   |  1 +
 target/mips/cpu.c              | 29 --------------------
 target/mips/sysemu/meson.build |  1 +
 target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++++++++++
 target/ppc/cpu-qom.h           |  2 ++
 target/ppc/cpu_init.c          | 48 +-------------------------------
 target/ppc/monitor.c           | 50 +++++++++++++++++++++++++++++++++-
 12 files changed, 158 insertions(+), 134 deletions(-)
 create mode 100644 target/loongarch/cpu-monitor.c
 create mode 100644 target/mips/sysemu/monitor.c

-- 
2.38.1

