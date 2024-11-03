Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1587375njc;
        Sun, 3 Nov 2024 06:35:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjTFr2w4l/aqINK6Kmv6DySKMFUXWEz7ANYIHDHfCu3q4pxVQjr1taloQfiHmZ7DPAJJjy8++3p/hLIg==@linaro.org
X-Google-Smtp-Source: AGHT+IHGn0C9Ic9V/oo1I4ar1bhZJw/bRa7qY1lQS9ZbeykFxsOm15BamwIk9pgS4xmbWpPkylG+
X-Received: by 2002:a05:620a:199c:b0:7af:cd3c:1f30 with SMTP id af79cd13be357-7b193eed8d3mr4522230685a.25.1730644525525;
        Sun, 03 Nov 2024 06:35:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730644525; cv=none;
        d=google.com; s=arc-20240605;
        b=X9n+NDs3U6qfySYaVjf8qiGx1iOrs3CFC8Y1ZEryOCG1T2dq+iRCYRTXqx9tP82PX1
         Gd/rqbYWnFuayXkcjq3o3qqrVTtXVC4UoJJjRwAvlT93HS30SgvJzGLOHucy+XUo6GiD
         EObzmywbNat+k/zhFz2yebatU5kIhfBaoFE2nR7Bxf5q1wVVbXtPOPBBMAbBnTZT8ax7
         pJrO0k52/p2OlojF4LOnxMYInDNIHQMImyPJlpCGWiMD/+ygAW9WUi5McVzh+11CRDkR
         ojWsQyCj0MXfMq4ImXp+xlELadfiC5W9oySfxeqCpLX4tvgCCwqWCBszKHAV4eEyPpUH
         CdLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=l1tRuAZZ7aREu/MsJgTHobQvvKWIyq2PiRipCLDoKy8=;
        fh=rjnzg5XgkbnYEl74faRRP+wjQE1K6cVhaSwNO81RJBs=;
        b=efdeq0Pp0b034HCioCNTJ/aFEFOx4TZSsYbqsBfcRBVC20dNqRqDENIHXIyJkPSBe2
         KNzdcmUyoaniEOhCk/rXX/fT8kwFP3Cab4FVmhBRT/kKbdLDUL+f6LmEuV4SwlQEYdiF
         tqAYriTErNyqNNt1XKG0gJjseED6JAo2uB+dB1iZKo+qvpL/yliGkdfrohTjoWRWwQqu
         uvqDFnMoY2ubNZLUCMCysijaP/bvENH5P8QkuyH1PH0xu/pRaQ2xWu6oyh3lSo2n9IQw
         0CLQRWu97mKDD/Nrh2kYazah8gMksyUJ+eHM7+CfoT1djNZNzDHu8cw+1JAPFYnRkaux
         ViKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=C8wVVQza;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a82e5csi856560985a.277.2024.11.03.06.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 06:35:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=C8wVVQza;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7bgS-0000PL-KV; Sun, 03 Nov 2024 09:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7bgQ-0000ON-Dz; Sun, 03 Nov 2024 09:34:26 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1t7bgO-0001vb-Tt; Sun, 03 Nov 2024 09:34:26 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a5f555cfbso262794866b.1; 
 Sun, 03 Nov 2024 06:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730644462; x=1731249262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l1tRuAZZ7aREu/MsJgTHobQvvKWIyq2PiRipCLDoKy8=;
 b=C8wVVQzahyXhnDw/YXcCpE6XRKdVAU4l6TE9+tlp7mDlklEKbAPV8BLigGRoY7FKvL
 JFJEuzoTpgEoR3nN+I1qteTay58wSEbS+cjqZ6FxjKMFp6jD2Rz9p7SuZlFAsxl0leC8
 +5v3kxA3Vu5fTgnv7fyrlX3nZt36eVztisL4xKVGcn0+DOKX0MIPFy3lmtrv9ae+0mrn
 ArdlOtS987cfFBzslgaiiCJiE3KeZ3Kw9k7RXJ76mHi2yVPt7wQc3HoHyl4YzyTdAiC2
 yHRR8BMmRTC93qxAWMvfqV89eBWQhJELUVh3I+3XxEykMdtfxQ1isi1m+nVFrze1mXOm
 wi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730644462; x=1731249262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l1tRuAZZ7aREu/MsJgTHobQvvKWIyq2PiRipCLDoKy8=;
 b=rrXFuny9T0JN7q0+OB+v1x5z6PjTTa5thR+Mx3g4VaFfnUR48Y5kzDIVfoZzsLSqiA
 ceAHa4nAzDgGB5YWaPBOuKsfHq+Sk/YA/SXkFSmnsA1TpA6ew/JyEEuWrYmTm+qiMnBm
 PFcC+Ps8rwWyiJHdWWf6FMRLns4aPXc8goLShh0AbN+PIsXINH+KFrwrVzkYUeQevOaG
 i7PHsYc+aMkLRa0ywyrovfe5AzUDAnFuDsVtc6bn+ZjFoMXZxCrdmLHlwPqUKu7514sY
 n9KiRuHyTwcfwKxi518NZo1vmnqM1CLKGdMYuEMCPvk8N9t6ZzQ/+iSTlU6MqmlBaBb6
 2Now==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1XnPe1P9dKD89w93UJOyT7DnZrR+PtjXg9rxd4gdzsk7eOl1ZYqrgLtmR8+fDBKJZudVoIyzd5w==@nongnu.org,
 AJvYcCXiG9htq6uDcOE7U9SGtiYDb1gnMNFXAIZ83BINMuUMGEoTOB/fp5tnPXp8/8KHvPoC/0xf4Yuh8D24c6VI@nongnu.org
X-Gm-Message-State: AOJu0YznvY7nJvp7LoPU+wsrM62u98uR6QPhrk2eG1aMBJOs80SU8ZNn
 OZrdbuhaxUmPxa9LMz3WgkgpSfVbPjPXAOLbM6F7Px48Ijp9splPTEaT8g==
X-Received: by 2002:a05:6402:51ca:b0:5cb:728e:926b with SMTP id
 4fb4d7f45d1cf-5ceb92a38f5mr11181518a12.17.1730644462250; 
 Sun, 03 Nov 2024 06:34:22 -0800 (PST)
Received: from archlinux.. (pd9ed7f6d.dip0.t-ipconnect.de. [217.237.127.109])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74c667sm3350723a12.20.2024.11.03.06.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 06:34:21 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/4] Trivial ARM changes
Date: Sun,  3 Nov 2024 15:33:26 +0100
Message-ID: <20241103143330.123596-1-shentey@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iRwtnX4ijGq3

This series improves the tracing experience in three devices used in ARM=0D
context. It also removes a duplicate statement in an IMX watchdog.=0D
=0D
v2:=0D
* Fix format strings in trace events for imx_gpt (Phil)=0D
* Add patch for tmp105 which improves tracing=0D
=0D
Bernhard Beschow (4):=0D
  hw/rtc/ds1338: Trace send and receive operations=0D
  hw/timer/imx_gpt: Convert DPRINTF to trace events=0D
  hw/watchdog/wdt_imx2: Remove redundant assignment=0D
  hw/sensor/tmp105: Convert printf() to trace event, add tracing for=0D
    read/write access=0D
=0D
 meson.build            |  1 +=0D
 hw/sensor/trace.h      |  1 +=0D
 hw/rtc/ds1338.c        |  6 ++++++=0D
 hw/sensor/tmp105.c     |  7 ++++++-=0D
 hw/timer/imx_gpt.c     | 18 +++++-------------=0D
 hw/watchdog/wdt_imx2.c |  1 -=0D
 hw/rtc/trace-events    |  4 ++++=0D
 hw/sensor/trace-events |  6 ++++++=0D
 hw/timer/trace-events  |  6 ++++++=0D
 9 files changed, 35 insertions(+), 15 deletions(-)=0D
 create mode 100644 hw/sensor/trace.h=0D
 create mode 100644 hw/sensor/trace-events=0D
=0D
-- =0D
2.47.0=0D
=0D
