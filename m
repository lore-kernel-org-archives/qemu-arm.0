Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp579635lfg;
        Mon, 24 Feb 2020 09:29:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqzovq8IADLfkOKrYk5FPweo8EpEJKs44j4Td3mm03aK+Baom45afGyObg6MFHdUzG6CkqE9
X-Received: by 2002:a0c:f404:: with SMTP id h4mr46133204qvl.251.1582565339969;
        Mon, 24 Feb 2020 09:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582565339; cv=none;
        d=google.com; s=arc-20160816;
        b=kVqbNhUP2WgktQ2xAcyZnQro3Gwik7vT6DY1Pa3U53iVDyzNGHJJTPYEhys20yGISt
         LI9srcuABl7A5vaBjM+ltHY8yRSef8QOl3b1NnjhWNf+QkXMYS8RnlgH8meg0LP7gE8a
         2tmU7OlZaDvHPcZ0vDJr3x89qzDIPQf9PAXAd/Di/zKRggL5ODpYDudlvlf36De8ux9o
         WQj0MH1e3cBZ4ltbMvOZXsp7MOG6Lq2mdnm7zqyffOdXfelWNOGqzP7bBIdGxGTvjQsN
         qML4FQOM4A8lldBoF2iNIpY8nODLG7RoUck8OkmhJctJoX1kG1FgSO0PVeCokkcIcpzM
         8lxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=5brZzZlL8zAr210MI+xk/RtI4mcYUOD8ts7Ls8WMhRo=;
        b=V86gvv36oBlDOgkKMdWlAKDJLTKKvBjE7xXCk4oAdNi0Eru6Iy7aLA8WpZZE1OvclC
         DvfG9/WHugcaTNYyEmXLfvBa0sjth6SgBfD/hbHvJTXP6dFKXZO3dcouhWBEqaKmEhuy
         iwQPUCUXKI/XqglZwkNrqL4OZ/s207Y61/ObhUIT4hFBCyICEGRO2Drfw7ExB/dAoeMY
         IgPLq2hje7/kuRliKMQFyRWjRLUQXoKjVoVw+fSZoPkfolefeoq8IsJFsVzsGIOfOdgZ
         KPqs9EA+A1veuGavIqzpQcvZH7G4acQPlQ5yKQi219p/dGetB+Szi6OWkeNK4+w4fizY
         fYLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jmWZBk+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25si6302653qtk.278.2020.02.24.09.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 09:28:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jmWZBk+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6HXP-00076r-C0
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 12:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6HXH-00075R-DE
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:28:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6HXG-0001SW-DI
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:28:51 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6HXG-0001Ri-6s
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:28:50 -0500
Received: by mail-wr1-x441.google.com with SMTP id r11so11363729wrq.10
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 09:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5brZzZlL8zAr210MI+xk/RtI4mcYUOD8ts7Ls8WMhRo=;
 b=jmWZBk+g9mQkShgJTIhGnv8KBAyi4Ix7rs2tzeEnYtm7t+W/CGuBVQo65CVsd/hyXj
 h2VpDRr3QzdofdMeDf/gPHVXzexUEsXddjkHajiSducbSuJN0bMdhUMbe3B7opSMji/U
 0MaKyyY9ulnw0v0p7M94Ek9fdx4BT9Okt/x6FfhPhMaFmoGYxaj3HI1WX3ITZSytzGXj
 0G658bmYJs9EQjS/HiNYaRJV1bvNh1geEyPcgnWjD/0yTf7TCjN68uf+tzfxwP+EPpK5
 D7m6Nj24ywt7sR09FKEV2P0AzL+0cIprJCIixBkG162DAphGcHcx4D6dswIFyHrG6Io9
 Btjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5brZzZlL8zAr210MI+xk/RtI4mcYUOD8ts7Ls8WMhRo=;
 b=aKKTORb1sZ/Bqd1cj0pdqDe810gETs///fC3LnlhOjLlioLD6ew5yi2ZPPWCh1BPaS
 y7te95uNpLSIwBzk55foxzUVrEXfY0NftjA3SiUuvsxeDajjZUJwT2N7wrGbNGCTJkrd
 1cYX83nQB10PXTkW/1K48bJ2A2gxR4jtdMVp1Q7H/TSLjRlsjrHSWwR2YaGESden61NE
 Fp3o2hMhcFCNcIMOYf7iMQuUpU1wbivCyP0cbnjL5jJawgiUSPKlH1J1oSn0lmKRoc+Q
 fJWRHjsCgYaBv33V/05/R2PfCwObu1anyAIMosjvZLeuIP2SOIoYQEww0uVFYuOz4sWo
 rIsw==
X-Gm-Message-State: APjAAAX5Z7hT4QsvF3eTafSKfs+PFrjG8c2IO/MiYPACTb5J3Igk49YT
 AODxT8bmUClyn28gkO6G2qzBcBLGalTc/Q==
X-Received: by 2002:adf:f692:: with SMTP id v18mr69351961wrp.246.1582565328715; 
 Mon, 24 Feb 2020 09:28:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b10sm60652wmj.48.2020.02.24.09.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 09:28:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Implement v8.3-RCPC and v8.4-RCPC
Date: Mon, 24 Feb 2020 17:28:43 +0000
Message-Id: <20200224172846.13053-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rldeFufKmaO8

This patchset implements the Arm architectural features
ARMv8.3-RCPC and ARMv8.4-RCPC. These provide a handful of
new load and store instructions which have "LoadAcquirePC"
semantics. These are slightly weaker than standard
"LoadAcquire", so we choose to implement them in QEMU as
LoadAcquire.

Patch 1 is a trivial fix to the PMU isar function which
I managed to cut-n-paste with the wrong FIELD_EX* macro.

I've tested these using risu against an Arm AEM FVP model:
this doesn't do anything to test the memory barrier semantics
but does work as a check that the decode is correct and
that the various signed/unsigned/extend/etc operations
are being done correctly.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Fix wrong use of FIELD_EX32 on ID_AA64DFR0
  target/arm: Implement v8.3-RCPC
  target/arm: Implement v8.4-RCPC

 target/arm/cpu.h           |  14 ++++-
 linux-user/elfload.c       |   2 +
 target/arm/cpu64.c         |   1 +
 target/arm/translate-a64.c | 114 +++++++++++++++++++++++++++++++++++++
 4 files changed, 129 insertions(+), 2 deletions(-)

-- 
2.20.1

