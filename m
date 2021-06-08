Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4737834lfa;
        Tue, 8 Jun 2021 12:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1R7C9GHt6fMZ1e+80t9Z0kpHfEyXBwMj+yTGM1niDgKs8W2lUQteAL0BTBCVNGWgwLPXO
X-Received: by 2002:a1f:3ac1:: with SMTP id h184mr2019257vka.8.1623181006179;
        Tue, 08 Jun 2021 12:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623181006; cv=none;
        d=google.com; s=arc-20160816;
        b=IgzYHKQPL3ySlyaTim2CFEmSInPQJVNgS+I4h7Y9cbny6M/HTJHRkaWkvXMDI24xTr
         jKGfH1Y+Y9ZXW2EIENMkxD9/56ZbQEoPNE7Jr0O5OFjikGMCxazY3TZMq4UIUR+cfb5R
         wz5ZAI+tJ515nk5R+mlAEuT+C6qgkHpUcATSA6a8/NpIsRlBBEOCAaFAFveMdFaY7jLs
         0WbtLU6z70rSDbyL2vfHcxkZPD9kq3tipBYPzqdnTfGGJAgX61nchT+qFhi0TH2fc1JS
         KWRpucZRxO66TjSUejdtRqSbrnhKQLuk8uSvJkpVOAkoMjyKLkCXXD/v+l0jciKfvkLT
         8ZPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=5LX8/9AG8cYA4y9g3HrAOBw7qQRlU6SryOU3/B80moU=;
        b=lksZ6F8Fd6YJYe8niZodcrwpBK+53X5l5uuxIPwp0LgolN2j1E4VXdhnwIG6hp9j4L
         css5vL8PRK81VEEd82gX/dMySLiiW+TJ9ai2wWLriyEqxa7U47662v2M9v+aUNGa8Pyc
         qAGZZ7BgVGs7cYxojwMDpi7qh7gjBhbfE10ThkSnbbqACM5SXULyvsJujaTrAvLzwnrw
         FSDSSG9XfHK4RxzgeFrnEmSkQ9H0LT44G0T/gUrY5HC67Zv/Zjj4iG8a1fO6FX1UDAhj
         q6s8dIBqZfOhcUkRks1H2HUShEK51vroIzwjDPqtwu7O4C/xcIkYLXVuqCa5Yxgq45+/
         Px6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=EPsBvQKi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n35si6614698uae.84.2021.06.08.12.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 12:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=EPsBvQKi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqhWn-0007j2-CT
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 15:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3tsa_YAcKCE8Cv4AB8vx55x2v.t537v3B-r83454x4B.58x@flex--venture.bounces.google.com>)
 id 1lqhWU-0007hf-7S
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 15:36:26 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:51914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3tsa_YAcKCE8Cv4AB8vx55x2v.t537v3B-r83454x4B.58x@flex--venture.bounces.google.com>)
 id 1lqhWS-0001zL-Oy
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 15:36:26 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 d6-20020a2568060000b0290535b52251cfso28193298ybc.18
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=5LX8/9AG8cYA4y9g3HrAOBw7qQRlU6SryOU3/B80moU=;
 b=EPsBvQKi79EceczMTKajanAnL/gXIVJ4MDuoMh+uEeuTQS6sBHAwKeElZeMVh7SNnS
 TSRnT6Tst5oYJBj/t8CQNtUcZR3e4tE8npYZBMIG60os1v4Guosr20Nx9yU9MUmRKlDs
 5aKC1xgx9foYuu/Lwyu/Dd1pX9PWGkEKHRsW+k4hxFKyGShCWHRxPiZvoSKXUzlLewzK
 dNxkpxQm6LxJMQK+YwR+IxrgXZaqFWS3nX2ifIMgvNHlKtCc+l1KFQecWxgStAaEthsC
 yMbfewHeai6bDXBJGhmNwGc6um6BTTmD3Cyt7ZyGA7oF/oy6uuSPBFj0NL6UWVzoPtT9
 vasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=5LX8/9AG8cYA4y9g3HrAOBw7qQRlU6SryOU3/B80moU=;
 b=FgCfBrhO/9hV12tmbmLp+rI5LiJzbWE2kaaFEw6fTNn1UumYXNb+yF7I8QqiBIAFv5
 wxpmSQPBVG7rIAmngMHSZaZPt6YJYYkI0uvUd/aLbgw8RA3GSLJVUbjgfMG8qwo4EGnx
 G1sv3VEI2D8A4HOH9yP4tI+ADkrKOaeIZkQsYXEiEt2MKbrVBdralueo1du7wVCYjykT
 ND1EPZIcSioWkyNFrdvO+BX6AAxvZBPevz0PRn4HTb49EYX5zg5B0vqnD7bd//oIt9Ta
 BfM7sEmQhC4wVXI1bdRzo8wi/fNc489hXqKUQFLTdLXIJQkTNpS8jLquzQ4g+9FIpKdZ
 8HhQ==
X-Gm-Message-State: AOAM533PhsyGnimtoIP9XV+Vft/vQkP5yZf0s7lbGPveV6RvQz7x01XB
 Dcpgx05aCuONasHJT7o8AoWhQR6EjzvW
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:a25:7085:: with SMTP id
 l127mr35166833ybc.293.1623180982888; Tue, 08 Jun 2021 12:36:22 -0700 (PDT)
Date: Tue,  8 Jun 2021 12:36:03 -0700
Message-Id: <20210608193605.2611114-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3tsa_YAcKCE8Cv4AB8vx55x2v.t537v3B-r83454x4B.58x@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fK0LoDHSuZFw

This is a board supported by OpenBmc.

v2:
- Fixed missing hyphen in Cortex name and dropped TODO on hardware
strap value.

Patrick Venture (2):
  hw/arm: add quanta-gbs-bmc machine
  hw/arm: quanta-gbs-bmc add i2c comments

 hw/arm/npcm7xx_boards.c | 93 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

-- 
2.31.1.751.gd2f1c929bd-goog

