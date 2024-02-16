Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1307370ejb;
        Fri, 16 Feb 2024 07:36:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVgjp5gpOs90ARyXrw8gE4W6mTFdrE/9Q+pdHRkRzihKgwTaySxQ1Zf93e4P0HkycP173GcYBHUPPTEpVu9lJGsMUKJH7M5
X-Google-Smtp-Source: AGHT+IGKQjnhoXIel7X4iPXbAaZVlR2gb+3G9TWdegXr6wR0UGQNVLp9eMQqcfPPotJbJoWRPrJu
X-Received: by 2002:a05:620a:1274:b0:787:38ae:988a with SMTP id b20-20020a05620a127400b0078738ae988amr4318096qkl.1.1708097771536;
        Fri, 16 Feb 2024 07:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708097771; cv=none;
        d=google.com; s=arc-20160816;
        b=YABHxztuLrF460Ei5XrNlBtw7eewHT+EyLYdegdVFqwTdhqUpo53r9DJ6edX6uwUHK
         fOeX3kuU7oMTObOKW1+S5OSXxo3ZX1K6Q7rcpEOfYEXiI0yMumAhFLw85DfWuTyu5Kpa
         bN5xSjviRlBxmBCZzkk6/tp04sMqV//A59rfO9UpoWIGlRjm8OO4N/IzIq69xcGJO0XF
         7Rn5c97X5ie7Kc/OzPGCMf0Dm0t2JmEEfOToqLdVvJSllg1n8dHu07fwEZMrqKqLuG6l
         W9J5i/Q+u7KVagCPmKtKj55f/A49rOV1VDAuPawJGcKkri7UNtaBaTSOqustLwEJsvc4
         pJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=5HOBSsoYfdBIXejJenW3gKcLKAp6yUaDTVDJ5Gv25Ps=;
        fh=h3pJrkJhGoJp/wHY9f1bkDozA0kJ+GZVISDAuSRv/L4=;
        b=U/G/ZyN8mHCZEUzPi6ut1PgGyxXr1XZM9NZTvQVX3U/b0ltLY/AFZeX6w6zfsucx7a
         ZLDQtizx+AY2g9fh9hTt1nxv86NGqE6AjrH8Lv1ucTw2L4TMu9GTWrJ1opdQoY+Fobzk
         Dimn59g2yNIVQmpm2/GstylLnXI8CLyHgrsJobrKTEHlTuwmOrfWopHSYYsOMV+fbgka
         wCQbgqWWdAwXTzmelHW4C/2WghMvRQnI+Tm250q2VBWWuGZ0Lbgm9g9YXhlG1tABX6d2
         MXGI0vEPLj+hpRpS37lwCm9qlB1vqvQ1N3tB3EvKTJf0uS73ywdcjkTZsrnPgxiNyot6
         hqGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cBUPFm/9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8-20020a05620a164800b00786117e1cffsi129934qko.7.2024.02.16.07.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 07:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cBUPFm/9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rb0FP-00042N-Nh; Fri, 16 Feb 2024 10:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0FN-00040n-Tz
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:35:30 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0FH-00089c-Ec
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:35:24 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3de25186fbso88558066b.0
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708097721; x=1708702521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5HOBSsoYfdBIXejJenW3gKcLKAp6yUaDTVDJ5Gv25Ps=;
 b=cBUPFm/9ARt4iwX3YvtP2YQXmFTos1TjqTfIXGfPzBi55fri9o8P21yfBu16bv/gvW
 o4tsTCuAOJLhoaAK9bQRBoyIVgfnSe6L1dROZNczLYcbXrkSGRFUVgxyPTEeies+fNWc
 LtX+pcvd2TpeHZ82iZW6TRFqWrwetGmJLnD3parO8+P6mO8UZa94LpJGY8wuYvH9BiC7
 CF/0IIFKWwkG1Irbe8hk04WhCifEwXF0VaHK+esJC/GCDWAnnnP4Hs+okv6qxnIOsqLm
 /bKrryBJKU8Hu8PHfN//7sLYb2g/AOJ9kWsP9BqpAy6v8xLL8+dJlTul0wwChAyT+21V
 Iyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708097721; x=1708702521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5HOBSsoYfdBIXejJenW3gKcLKAp6yUaDTVDJ5Gv25Ps=;
 b=bnxWk6N7Mx5Wo1vnajAtbCZiSIWxWDEXT9IFnV/RwC38Q8E7ovyBe+nXFlb9sqOnSt
 SA9AZDrcst0fpr7JgPweSv+qocm9Cvyio5mnNKEtG/h8R6z9Uej7Gv5akxBMLjar3L0t
 WRHZwXDB3keDiuX199j2AVtntIu9ScrDcL0pro3D8w2cZJSWSXdmVBH5kbv0d29s+iLl
 Vm+xByx4UX1K/zge3UE13RniwCUydA1Sd6UtWT1TiRusjHEYz3Wl5+09lo4iz/qjKQzh
 +Yx6MTTv5r881txHs5D8pRoHwIZ/zEEq9w95FyDOP/94/OGO/ljKTSS8ql6bF30sSKLo
 QF8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnFGTkrc7C6OHX9DUPsTXVC6xuSCsgwzUizZ+UM5Joz57KUEIjbi9xc+sXRn7FN/sjkm1BU4SWwxSOo+8z7qgl3Q5f
X-Gm-Message-State: AOJu0YzfasSU+9KHXdlycU0LbCpFEgSxbe5AXXEZrNEAt8Sv2IPoVJNY
 9qPzB8pAfGXJwJ6C3eg3EYur+iIPcCwoyGrOCUyjgJ5doeC28bJqLxa+MW79R14=
X-Received: by 2002:a17:906:8c6:b0:a3d:d9a1:e84e with SMTP id
 o6-20020a17090608c600b00a3dd9a1e84emr1587399eje.38.1708097720897; 
 Fri, 16 Feb 2024 07:35:20 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a3dd52e758bsm45098ejc.100.2024.02.16.07.35.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 07:35:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/6] hw: Remove sysbus_address_space()
Date: Fri, 16 Feb 2024 16:35:11 +0100
Message-ID: <20240216153517.49422-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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
X-TUID: t+5VQr0GKaZ2

Pass address space as link property for devices where
it seems to matter, otherwise just use get_system_memory().

Philippe Mathieu-Daudé (6):
  hw/arm: Inline sysbus_create_simple(PL110 / PL111)
  hw/display/pl110: Pass frame buffer memory region as link property
  hw/arm/exynos4210: Inline sysbus_create_varargs(EXYNOS4210_FIMD)
  hw/display/exynos4210_fimd: Pass frame buffer memory region as link
  hw/i386/kvmvapic: Inline sysbus_address_space()
  hw/sysbus: Remove now unused sysbus_address_space()

 include/hw/sysbus.h          |  1 -
 hw/arm/exynos4210.c          | 12 +++++++-----
 hw/arm/realview.c            |  7 ++++++-
 hw/arm/versatilepb.c         |  8 +++++++-
 hw/arm/vexpress.c            | 15 +++++++++++++--
 hw/core/sysbus.c             |  5 -----
 hw/display/exynos4210_fimd.c | 19 ++++++++++++++++---
 hw/display/pl110.c           | 20 ++++++++++++++++----
 hw/i386/kvmvapic.c           | 12 ++++++------
 9 files changed, 71 insertions(+), 28 deletions(-)

-- 
2.41.0

