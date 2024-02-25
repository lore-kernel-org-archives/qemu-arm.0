Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1643388ejf;
        Sun, 25 Feb 2024 09:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXR8QUUSyiaphfSl665zuMsfLgafwXnSYPAls05A7ZUwRT2L03E8Bk7MvPc65iQioyA0btCNHBbBcUiCXos9KKqV9vnQeFS
X-Google-Smtp-Source: AGHT+IH7Y3t7jMStuFDBIWhpxPtFdQTLCtCt3PFv1dhmJXGV7SJPp/fbda1iD9QL1FGF5vWwb8iU
X-Received: by 2002:a05:6358:5e8c:b0:17b:5d21:e86e with SMTP id z12-20020a0563585e8c00b0017b5d21e86emr6104842rwn.3.1708881472570;
        Sun, 25 Feb 2024 09:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708881472; cv=none;
        d=google.com; s=arc-20160816;
        b=vS9z30+9vEDhQSfbOD+9YhlRy8C2FObiistYaKQf0Jn5cFYC2EftYj04Fe0P1HM54m
         AodA4vy4pQaZSPIz9I2M8GusFmMnNO7iUY38kw4q2qLQIt2N018uGvwSVe3nBErUlp5z
         yzTTeBt/QjjXprhauNrYE4t9Pbi4/Ydcwu29p4nYXOIDZp004zjXB36W3fypI0bG1j/Q
         Cc9AIlU0M54aazJpDua59ESvuaq+uDD3UvGJsiIlqYWBcMDadXb60DCc5lGCVPkZbPAC
         T9pcC+2YiuVri5uYOneag/tYSZucRs6YccRf8ONtZx2H0MeVrSNsY0tXwv7Ypo61nQ8K
         W/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Nb2EkkM4HFBzPufUcNJ/oJaQMVNp/FOLKGxdMc6L4GE=;
        fh=SskdMZOi/Od9NnSQ9aOgcLB0DLGFpnzN26c/Fy3PW9M=;
        b=e9LEuIbHrdTMcxOOIUhzTC25eYsAfayMfnscmFlu2aeRZGzK8uQhnQrVINiL5CNFRp
         FYgjGMbEdi/rYH8TH2dMY+8pKxc1tEJ33oplywZFIB2A15/uFpN6ZXlIRvd6e4HfScLi
         iDHtRWQ6xkMfRzbU3Hpw3U8Yp4bxXhT5BDMyJX1KdZreDSg0fCK3tyYz3Kqi2tkYgVUH
         dfqd0WlLibSO3Zwdm7r+tYJv14erm5V5z2LSKD0bxnDtroUWzyZiw3Lgly2SSJIym9W+
         SUH/FFqMF3XyUOxUbsL0+285oJivxfJR0NdHFkrPPsTQwYEL0qYf33nuHAHOpDvAeKlz
         ZBJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fCj/b/PT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21-20020a05620a22d500b00787a0ef012asi3206382qki.341.2024.02.25.09.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 09:17:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fCj/b/PT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reI7K-0001ra-KV; Sun, 25 Feb 2024 12:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reI7J-0001qr-GK
 for qemu-arm@nongnu.org; Sun, 25 Feb 2024 12:16:45 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reI7H-0003va-6c
 for qemu-arm@nongnu.org; Sun, 25 Feb 2024 12:16:45 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412a4b86f5fso1201265e9.0
 for <qemu-arm@nongnu.org>; Sun, 25 Feb 2024 09:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708881401; x=1709486201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nb2EkkM4HFBzPufUcNJ/oJaQMVNp/FOLKGxdMc6L4GE=;
 b=fCj/b/PTKYbehiBJ450x2N7BMGfTf+cJqKt/DAby3sb8riWQ/SORxCi+Blt8s3MLFo
 3fFHsJdJB2pOBEhlPFLiFbLW3E6Mx1fx8oRZuVrtrPpkP9OIVMc3ykPHez3YBGxrBHn7
 YCrYJ6iZspy5n0gdyiiUJtr5iLBM1+GYrIkZ+soijo0K23+tOzG5Cgle1+Lpn8QXJTMx
 mRVwo52u0NJOnPEA81mfr6hQUPSN4rR9jORLGaSxSsgPYZz+mxGroGu3fi6pghb4ROup
 fKd1OwcduVAJlb9hqVI7+eC3aT+L7Rs0Eoj5yn85bSCReh0lcFC0qo9ncfdGYkij3+39
 2nfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708881401; x=1709486201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nb2EkkM4HFBzPufUcNJ/oJaQMVNp/FOLKGxdMc6L4GE=;
 b=H1GudLWhziZLvzuNvT5bHGH6P+XpW1Qn9CKMzFY4r9QCQKnwayxi2YP6fyWturzrOh
 NTaRjKDlW7b47l4lm2XYNUGHIjjGWfTfzHxrYS0U4pkrEo5vyy15iOnpSUeoCeaj0+z8
 nPg1rUYlLzZGpVhcwHC+BDO22Rvhgs0Qhxs/rVeM05n6ju32XG84WW8FA68K6wlAu/tN
 VPXxH/C/AF1fCepkjCQQdYuk64tdBpU6+v5EVkYOOjRgU4gwyasZmj9C5KSfgAXpZPBF
 6qzIgQFsL7JUQC2CU+cSrGb2awVjSHmn/IINBu4Nl92pzfsMLOFmJ4NnK3L+hKCBg/KO
 bsnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPjH1OG+P7I0S/eFWL0YZXhFlN078BQrRDz2DSmrM3V7Yi72oZoZeLJZuZsmHgyvQzE6cNyDrFprm+fA2/taOPcoQW
X-Gm-Message-State: AOJu0YwSj2iWW1fgAJLQDmuvBfHZ0UgXj0g8/U8tyNdt0UJC8+YwBUlK
 5bEZqC1v5wlFTzVjLRxHrtUO41Kz0FC2ptSqHwDa069hW+Mw0JuhxDShbQRkWM8=
X-Received: by 2002:a5d:49ce:0:b0:33d:1392:7469 with SMTP id
 t14-20020a5d49ce000000b0033d13927469mr3042088wrs.67.1708881400800; 
 Sun, 25 Feb 2024 09:16:40 -0800 (PST)
Received: from m1x-phil.lan ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a5d4bcb000000b0033db2fe4d76sm5669594wrt.4.2024.02.25.09.16.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 25 Feb 2024 09:16:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/3] hw/ide: Make "ide_internal.h" really internal
Date: Sun, 25 Feb 2024 18:16:34 +0100
Message-ID: <20240225171637.4709-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: L0AVMuv6onDu

Since v1:
- Remove use of "ahci_internal.h" in SBSA-Ref
- Rename "internal.h" -> "ide_internal.h"

Supersedes: <20240223142633.933694E6004@zero.eik.bme.hu>

BALATON Zoltan (1):
  hw/ide: Remove last two uses of ide/internal.h outside of hw/ide/

Philippe Mathieu-Daudé (2):
  hw/arm/sbsa-ref: Do not open-code ahci_ide_create_devs()
  hw/ide: Include 'ide_internal.h' from current path

 hw/ide/ahci_internal.h                             |  2 +-
 include/hw/ide/internal.h => hw/ide/ide_internal.h |  0
 include/hw/misc/macio/macio.h                      |  2 +-
 hw/arm/sbsa-ref.c                                  | 11 ++---------
 hw/ide/ahci.c                                      |  2 +-
 hw/ide/atapi.c                                     |  2 +-
 hw/ide/cmd646.c                                    |  2 +-
 hw/ide/core.c                                      |  2 +-
 hw/ide/ide-bus.c                                   |  2 +-
 hw/ide/ide-dev.c                                   |  2 +-
 hw/ide/ioport.c                                    |  2 +-
 hw/ide/isa.c                                       |  2 +-
 hw/ide/macio.c                                     |  2 +-
 hw/ide/microdrive.c                                |  2 +-
 hw/ide/mmio.c                                      |  2 +-
 hw/ide/pci.c                                       |  2 +-
 hw/ide/piix.c                                      |  2 +-
 hw/ide/sii3112.c                                   |  2 +-
 hw/ide/via.c                                       |  2 +-
 19 files changed, 19 insertions(+), 26 deletions(-)
 rename include/hw/ide/internal.h => hw/ide/ide_internal.h (100%)

-- 
2.41.0

