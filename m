Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2167338ejb;
        Tue, 24 Oct 2023 09:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV+2BiTfH0/oQ63xpbjm/1Mr4BGzEiWGWXNAETzNc9FWz+YIfcUDIKNS4W8aIY2XDYsSMa
X-Received: by 2002:a05:620a:bcb:b0:775:937b:c594 with SMTP id s11-20020a05620a0bcb00b00775937bc594mr15219504qki.58.1698164682734;
        Tue, 24 Oct 2023 09:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698164682; cv=none;
        d=google.com; s=arc-20160816;
        b=bDKp8IfMVfrmH/poaP+efNjTm6BKGTIH7bK6U8S6nbUW0wXhq4f9GWZ4gMvGdl/TjC
         CSbFsJIxGEIo3IWSC/hInbGeDjGJlmQYtBm8MpJuzpBPABUj3/+fVlMTuh+R0UTvOxko
         6kfezUgjP+ZCi9lxvn7sT0MCmIZEg+fEAAbIGcY+/okhYrGru5ZjKp9dTobMRlNTkJjk
         XbwCa/xdcuUZkrfy3X4dAOabb+wjr1HrH/UjKl++qzkXlGj6F/qlQPScWcAq5liHzXoL
         uqt09s6rb7IOXk4kb1EVe5H07iyjRjTbkWAecc2i8e0F10+PQkfHvjxEKVvdwjr9wlJZ
         +mHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=IZ/JIaCD4bgqQwPEUaUAuoz6MNhWNnrfpvJBP8QkU5o=;
        fh=WVEKgOIyTrr8n58k2pegoTwEDRNm1XlZWphDTwgTwzs=;
        b=dJRh1NiM+0gmNGm15u1OWGkIGdcOFUcX4htMqT0e0yFqWPHMMM8SyfgJLKj6QnvVi6
         tB/ra/r94Lnw8yQ1Ky8Jw6K4qieRxATc9m7wm3lH3vt4qNKcRbDyTzBh8HGEXGlf2iFh
         XaKo+fLRYII3PWEKn/L/lRh3tuoAOKicvdgTK85riQcngf52iHxluzqnuJPZu5e1Qij7
         ewF1e0o4s8BE07Q7G+WghUIdkslHBUQq6luGwG1Wiq9O1aVCqIb9LiqDc4cMZ1MLYhG+
         qf5WR+cztM/oFuviDrzuMIONrZWhYrJs0GWc599WTwmp3bBwkokwNfnN08fPP9TrJ+23
         mZVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IlGVaHJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020a05620a0c4300b0077436023378si7320721qki.649.2023.10.24.09.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IlGVaHJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvKCp-0000gs-7A; Tue, 24 Oct 2023 12:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKCm-0000g1-Uh
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:24:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKCl-0000tn-Ad
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:24:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40806e40fccso34334355e9.2
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698164666; x=1698769466; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IZ/JIaCD4bgqQwPEUaUAuoz6MNhWNnrfpvJBP8QkU5o=;
 b=IlGVaHJjY9f0gMSiomodMGs1FNDQTVIOAjO47AhUHJ8s86JMcz0M01+XKwCyb3H8ec
 VFyLxM4q8TjNUmmoD5q1UwYT76nMXxNDKQIQ9K56s08mK6Abt0FAdVkG1K1f4NLJxH21
 RlXTVyCNRvG/YnTd3cWnpIoeUvnEaBi08Nr5bEulSxYcSntQL0TigmDmjD3ByngiPymJ
 ZzsUIexvfYPbEqLxhx699sYrvUiGThTdzSfK/DqtA26YRkEVWhq5wvIwgjI+iOuYCpcl
 V9j1ntXS+iMGSGSf4N9SPkJlDwfRv1xKaiyj6aZOFZ+N8LFsNX7cuan39wbTeNvelKmI
 2ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698164666; x=1698769466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IZ/JIaCD4bgqQwPEUaUAuoz6MNhWNnrfpvJBP8QkU5o=;
 b=fJxqa9iuvJ62S6vz+YYne+EBqdquYb+iPGaFf4DR1lkMHjlIcFkRG4bHaLhqM5UcHX
 yy1BKd9TfmIuRlzT5wHhelraNscwu25ZFvmZvxS5iZsgsX0dsYALto6GX9p0R7T2MJ7R
 uSHZonIpq2Ad7j+l5FwSzdQljowlzkNsUU/wQKx+m9mZveiq32yNzEli5bDFFDiiFt3G
 Nc6qUqAg0zcoPtpcshFjAqIlZAq/WnrComk4cJxO+Bwfznubr6C3Gagm6XEfhhVK3aOD
 lGw+EmdgzXXx649S2p1YkkjsTDh9brNUhOSSqjNfKYJLQRAH2vSF7hgAPc9kzE9EfDQH
 Em9A==
X-Gm-Message-State: AOJu0YxQJ5zhdh04Ubyl5FgAx6w8TSEL0H26rhDQYGI3Zw6yGovgDnaZ
 J686AMuoKDBNyBgA79xCZUaONQ==
X-Received: by 2002:a05:600c:4593:b0:401:b504:b6a0 with SMTP id
 r19-20020a05600c459300b00401b504b6a0mr10130263wmo.3.1698164666210; 
 Tue, 24 Oct 2023 09:24:26 -0700 (PDT)
Received: from m1x-phil.lan (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr.
 [176.172.55.165]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c45ca00b00407752f5ab6sm12592013wmo.6.2023.10.24.09.24.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 09:24:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/11] hw/arm/aspeed: Split AspeedSoCState per 2400/2600/10x0
Date: Tue, 24 Oct 2023 18:24:11 +0200
Message-ID: <20231024162423.40206-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: mEG+Gar5Dfy+

Hi,

This series is extracted for a bigger work.

Cortex-A MP clusters (TYPE_A15MPCORE_PRIV) should create
the ARM cores in its own state. Unfortunately we don't do
it that way, and this model calls qemu_get_cpu().

In order to remove the qemu_get_cpu() call there, we first
need to rework some SoC users.

This series rework the Aspeed SoC state, so it is clear
what fields are really used by a SoC type (2400 / 2600 /
10x0). It will then be easier to have the MP cluster create
the core instances.

Regards,

Phil.

Philippe Mathieu-Daudé (11):
  hw/arm/aspeed: Extract code common to all boards to a common file
  hw/arm/aspeed: Rename aspeed_soc_init() as AST2400/2500 specific
  hw/arm/aspeed: Rename aspeed_soc_realize() as AST2400/2500 specific
  hw/arm/aspeed: Dynamically allocate AspeedMachineState::soc field
  hw/arm/aspeed: Introduce TYPE_ASPEED10X0_SOC
  hw/arm/aspeed: Introduce TYPE_ASPEED2600_SOC
  hw/arm/aspeed: Introduce TYPE_ASPEED2400_SOC
  hw/arm/aspeed: Check 'memory' link is set in common aspeed_soc_realize
  hw/arm/aspeed: Move AspeedSoCState::armv7m to Aspeed10x0SoCState
  hw/arm/aspeed: Move AspeedSoCState::a7mpcore to Aspeed2600SoCState
  hw/arm/aspeed: Move AspeedSoCState::cpu/vic to Aspeed2400SoCState

 include/hw/arm/aspeed_soc.h               |  35 +++-
 hw/arm/aspeed.c                           | 101 +++++------
 hw/arm/aspeed_ast10x0.c                   |  53 +++---
 hw/arm/{aspeed_soc.c => aspeed_ast2400.c} | 201 +++++-----------------
 hw/arm/aspeed_ast2600.c                   |  75 ++++----
 hw/arm/aspeed_soc_common.c                | 154 +++++++++++++++++
 hw/arm/fby35.c                            |  27 +--
 hw/arm/meson.build                        |   3 +-
 8 files changed, 364 insertions(+), 285 deletions(-)
 rename hw/arm/{aspeed_soc.c => aspeed_ast2400.c} (76%)
 create mode 100644 hw/arm/aspeed_soc_common.c

-- 
2.41.0

