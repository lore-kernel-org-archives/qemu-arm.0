Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1398857ejm;
        Fri, 22 Sep 2023 08:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZFQLau1SHM7v8xACzdvAywbGjHOSUyvOa2Ics8uvw46CUO/OC8SmV3wBEWSMw8rBoqGbJ
X-Received: by 2002:a0c:e34b:0:b0:636:6205:fb01 with SMTP id a11-20020a0ce34b000000b006366205fb01mr8845966qvm.34.1695396634219;
        Fri, 22 Sep 2023 08:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695396634; cv=none;
        d=google.com; s=arc-20160816;
        b=dLzcej1Hn9d/m1vlmS+2acAkJG2fZP9j2n1wrz6kADd+WjHD9xlTL+J8agNuHQ/Sw1
         5lZ5SZTKRsBPixV/D1S1UL/b2bS7V2sAJCdz6WufsavGwTd19empl0FgCvi86gEEl8r2
         PrIpXNCq6BjoSj2GNL8wHY0oI43BXZBhYW3OI0gUykWd42NNYW80x2uFZGqGnLEIqK3M
         lUBZl3+ilOjcZu/LEl5kEShVLQg+E4Ak1Picn78iGlHHh1zpB+tce1mUdU+j6gAW1Lq9
         0w4oqURjUFCkDFjCL3iKLWm7krraB2TvNN1/1nR+aUYtlVujtPyQK8MDC3ZrvOhExkzi
         G1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tfQhaCaoJV4bmK5DuDmiHN4FfP5XPw57DLNfRS7tR5k=;
        fh=uVBMvYrx+X7m1lFjfWwA+UgXnF+hI4+JyNcPtFqOEwM=;
        b=l4dW/N8v2r5nYb6m/383DJv3Cd/SaS3TTX2fFnO+2uVn5VnPn8Cc8jG8Bush39P4Y9
         TXJMKtvWTz2Aifm8OFsS38FfzzvJE2QfRo0Fp+6R7nFK2Cpwf/TYYWtBiBG6t8yt1jGp
         uSDGhcJTpOMdOvS37yOzQAoO+ShS1tCxXZeulXZN1kV4NcJ59ADYmLCDQTGPzkzKCoKI
         vJFs1pneqQIeXeTvIQ0TUjIXNpY1vVGjlgUrFGlS82h/N49z4WlESavE/qF4ztoXOGQw
         Gnx+M+MTpaX+4O/zt7BH5I6e1bfWCs176XMJCXtiSGPzK4qu815UxE3QLX+NTUrU0J1N
         p2Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akXCkgC+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020ad4576f000000b0063cfc873795si2532373qvx.217.2023.09.22.08.30.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 08:30:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akXCkgC+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qji6f-0005bg-MU; Fri, 22 Sep 2023 11:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qji6P-0005Kg-HT
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:29:58 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qji6J-00007M-27
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 11:29:56 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4053cb57f02so10476945e9.1
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695396589; x=1696001389; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tfQhaCaoJV4bmK5DuDmiHN4FfP5XPw57DLNfRS7tR5k=;
 b=akXCkgC+kokjTnyKMAgDdXU3euZRS/Fg8BqKZntSHV71W3PxNsx6y4v5A552JFC9WO
 8r/7/BfVA1qeWlMcB/tdxx8F/vrmY5Awh4YGu0uzIRQbkn7FH6ZSNjoeSvb+hDzx6wn4
 wGWJd2l3Qz4QifNhB4xFjwdVCYUrdbjOEl2HwQ0FctLFOkNYn8aflNXRzlhL2D0Fw85Q
 L8LZxrJPn4Q+vYXPf6c5v+ziQeMXINm9aVp1pPHL4k04Z3+yx2VfMgGFfIo5UYsVqnsZ
 QFWpLJD37NdGoEvVGxVBiv2q2c0y1BHa+JMLawZaVWqL+PgxTfpOrRTqz6OSl7cYbnZP
 Kt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695396589; x=1696001389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tfQhaCaoJV4bmK5DuDmiHN4FfP5XPw57DLNfRS7tR5k=;
 b=f7mUyle/w7tZKln61A06oLiz26D38x6nKdf/qFFdWbzKRRxShLqkDXRniSfCJcOq3t
 zi9M8f/tdk+RrnNn9Msv32/ehF+rhdiuQ/dovo2AhfcmWSeQ1ez2XVPAyVgP496F1b5T
 TDH+E9ay2xdfmbDGtrEiIq5GBMZcibGUUsmlEb8GlJAoT8cFOpsrkqM5+pyGtMNxLqk4
 G55MxCQGlyFiZizdMX0XxwmFqvrMrKonxDQxaLzknEj+cojdYTVqldAf8nSQ/mV2nUKx
 E5dZIudykhm1JUCOASCCIASk3AVWwSOBHheV3n/l+iJyRiBmR/JK1TpvPfV06jfYACza
 mnbQ==
X-Gm-Message-State: AOJu0YzMl6OpRfqrWshoH9TsNjTWbAG2kpZpAY9Rcdw++xCelmNQU+/8
 wiumelpsRYFTP3oAWePkEtPknVwW6ayhhNlW0kY=
X-Received: by 2002:a7b:c5ca:0:b0:404:fc52:a3c6 with SMTP id
 n10-20020a7bc5ca000000b00404fc52a3c6mr8573033wmk.25.1695396588166; 
 Fri, 22 Sep 2023 08:29:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a05600c171600b00405442edc69sm777137wmn.14.2023.09.22.08.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 08:29:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 0/4] arm: fix some -Wshadow warnings
Date: Fri, 22 Sep 2023 16:29:40 +0100
Message-Id: <20230922152944.3583438-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: c7SGmhul8Iqq

These patches fix some -Wshadow warnings in arm related code.

-- PMM

Peter Maydell (4):
  hw/intc/arm_gicv3_its: Avoid shadowing variable in
    do_process_its_cmd()
  hw/misc/arm_sysctl.c: Avoid shadowing local variable
  hw/arm/smmuv3.c: Avoid shadowing variable
  hw/arm/smmuv3-internal.h: Don't use locals in statement macros

 hw/arm/smmuv3-internal.h | 41 +++++++++++++---------------------------
 hw/arm/smmuv3.c          |  4 ++--
 hw/intc/arm_gicv3_its.c  |  6 +++---
 hw/misc/arm_sysctl.c     |  6 +++---
 4 files changed, 21 insertions(+), 36 deletions(-)

-- 
2.34.1

