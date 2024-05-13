Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2072429ejb;
        Mon, 13 May 2024 03:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdVpJbfjEyyrt71VnxiEQxRgHpeFqF2LT2qPLJTE74NdSaKi2c1NpONRJL8w70MEiuxgiMsAmOHibEsFUdVS1bK1AJbX30
X-Google-Smtp-Source: AGHT+IH+8S79ChyzvVrCKB8jkxIav0kVkEd3Tb/CVovB/KmtlF6nwWpTjwZJ40g4s3AbmvhBF52k
X-Received: by 2002:a05:622a:316:b0:43d:85ae:bf2 with SMTP id d75a77b69052e-43dfdaabf82mr115239551cf.21.1715595153978;
        Mon, 13 May 2024 03:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715595153; cv=none;
        d=google.com; s=arc-20160816;
        b=WS2bKACbibqQQb+GRyhP22H3Ue4utKS1JWTaxel9zAgYOYhKBqaoBVebhQ3HxLSnId
         1zp0POAgoNworcBs3ceTMZuonJk12h7rCli8TDpod7DVB9czhqLtKbsOUH1bbJBA+8U+
         Pz6UqDYSBFWqP8ua2Tb0U4UCYHsobv3TKIQIB6uuztN2a+g2TIXnEfYZ/KZFiRPA/N57
         raTVSqO727RoAM1iwFLXtA66kNoIgZdYSvGADvJ0fVkEbs/oO2UO08+ZZnq/yDcFtEVw
         rgVL5UOxB8udRsgtP/ddpUK7eq22Hw61bdQ0Y8cZjBK8inznaLmPxvW3ItiE8r1eUHRd
         Uc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3yXxmMXz6raz0yk5kfkPN65fGosWmMze3CL97q/kGb8=;
        fh=Zxfc77OjbXs2A0OQnL9hW0Uy+b6RLzbh2SNoGPoWNrY=;
        b=TUoGHQM8LVRRzQmuz4jzJNX8rHuWp8DdzFc+kd73e3TVadcIcqPggGmDI/An9jKuXf
         etdpXvapOY65fIWGcZnPEyl2DoxorY+yzkflUKmdNuIp1yJj7CAW8tx+X6ky46k9kScd
         P0X5y49uu6VZlup8Y23Ytu/FXao0fk+J4CSXVbnx8X33GRXUPNHijjBMUCKG66fV2jRV
         kW3GnrC6SDBERU58OZonM0o79V/J1J5wOjFNlArUPmdVRIBAzxNVy8I42/7xzQD6lo8E
         VOZIeOAJLnlfAcCfX7vg59q6+tul9eXFN2En2kHSZDpoKau/pt7PZ8q1jY5ET9f2Otef
         j8Sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OsJ70k2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df566f86fsi91008061cf.354.2024.05.13.03.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2024 03:12:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OsJ70k2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6SeS-0005p3-7w; Mon, 13 May 2024 06:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1s6SeQ-0005ok-S8; Mon, 13 May 2024 06:11:22 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1s6SeP-0006Nl-5R; Mon, 13 May 2024 06:11:22 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59b81d087aso1036142866b.3; 
 Mon, 13 May 2024 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715595077; x=1716199877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3yXxmMXz6raz0yk5kfkPN65fGosWmMze3CL97q/kGb8=;
 b=OsJ70k2LDdxPvGdXRxlNKyTZV5Okg0OyrMrCf1pe7djzt164GPyehr2ajxzBf9+D/d
 SFHrv90wjC3Cg7X/jzN277rOetRkQgsV1uJj4GapfBFAEcnXZDF3KOgQ6XSkUoSm5MYX
 0s6TMOXxSPUxuabKF237K8k6MTsI72wDEZVHKgE8dOUJCLe/l9++cOTiJfBZFD2XyAtA
 6Fh7Z3zhkR5QKaD9kA8vSNqZGg2//THGNz1OhtQ0pKOx1NqzuQEid5oe9Xa4HsRjGqGq
 2v4dNQkTUqfxDs/aSnHc1i/++uQ+Ty0+e7koq0i2xy/r16cIRw/d9ITpZZ1zVtt5vcFw
 iT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715595077; x=1716199877;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3yXxmMXz6raz0yk5kfkPN65fGosWmMze3CL97q/kGb8=;
 b=vTW8Ltyv1rIJKz1NMOg2o2IXfxy4ru2WBpHuVt9C5NErqiIKrodd+x3Vm4Lq+0eoMl
 lkojoMPnEBMQF2i5z+qRZ097mhcwceGwRlDJm2cU1aU6bkdw++E68H2R0eP9DptXG3v+
 vHqNCqKp0iCSw42rf4K/nR/3oFKjTOmGgBY2BJXElusoW8Lmv8DYpxKkg+0bYfSpQ1xJ
 fXkS2KBsVwGCSx1dnUcoAcD705IDX3d5bQbgbZZFvm9lvaIurDU/AevZGBKZk0cq7IkY
 KrMqdlm/dns/WKfXdHqt5YvPOQYzxSjeVDo1+BUeRHUaMu15f5UVeJCunG2xnV8Efcw3
 wC6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP4ou7g0dE7knRM/q0UC+S9qADl0SIvAzoYO2x3aqrXIWExKhfiCi9sJB8FKCWdhpF2d8xFsT92CmGSNqZt93SJqZCDa0P85UcDjLBi70+5BvLSI5JZZJ3gRVHEg==
X-Gm-Message-State: AOJu0Yzb7VVj9LhuyqIgH30gXBJM3QCQ7gqC+RdcHIuq67Lnt6DV/avH
 zpKEJdvGcXhCgwqJyAPyJxaKybdOQtyQDfcM9KHUuI6JfBvYTCPbOy7f2w==
X-Received: by 2002:a17:906:f59a:b0:a55:6602:e3a9 with SMTP id
 a640c23a62f3a-a5a2d53b27fmr1096572866b.1.1715595076679; 
 Mon, 13 May 2024 03:11:16 -0700 (PDT)
Received: from archlinux.. (business-90-187-110-129.pool2.vodafone-ip.de.
 [90.187.110.129]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17894d2asm574906666b.87.2024.05.13.03.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 03:11:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/3] Trivial ARM changes
Date: Mon, 13 May 2024 12:11:05 +0200
Message-ID: <20240513101108.5237-1-shentey@gmail.com>
X-Mailer: git-send-email 2.45.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 73t/WHnwNT76

This series improves the tracing experience in two devices used in ARM cont=
ext.=0D
It also removes a duplicate statement in an IMX watchdog which may indicate=
 a=0D
bug (see comment underneath commit message).=0D
=0D
Best regards,=0D
Bernhard=0D
=0D
Bernhard Beschow (3):=0D
  hw/rtc/ds1338: Trace send and receive operations=0D
  hw/timer/imx_gpt: Convert DPRINTF to trace events=0D
  hw/watchdog/wdt_imx2: Remove redundant assignment=0D
=0D
 hw/rtc/ds1338.c        |  6 ++++++=0D
 hw/timer/imx_gpt.c     | 18 +++++-------------=0D
 hw/watchdog/wdt_imx2.c |  1 -=0D
 hw/rtc/trace-events    |  4 ++++=0D
 hw/timer/trace-events  |  6 ++++++=0D
 5 files changed, 21 insertions(+), 14 deletions(-)=0D
=0D
-- =0D
2.45.0=0D
=0D
