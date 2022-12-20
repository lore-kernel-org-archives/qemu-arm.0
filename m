Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4226126ejb;
        Tue, 20 Dec 2022 03:03:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuGZJ0BIZ++HMRoNEwtHXT2AhUA1U2QsqHqdxR0pC8LwM2FPofL7twkaviivGP+UdwNFHjy
X-Received: by 2002:a67:eb89:0:b0:3ba:cda:ca14 with SMTP id e9-20020a67eb89000000b003ba0cdaca14mr5940102vso.10.1671534238519;
        Tue, 20 Dec 2022 03:03:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671534238; cv=none;
        d=google.com; s=arc-20160816;
        b=lS0M4jQPd572ZiW9sL7KeHx6nnvcQiCaZHUYLv4j3iSCuoIwFXOuS0kYZjPY00I9eh
         lbPSzvPSP9zucCGitegV5eAXjrUGlDj+ymE+ywh7XkoHRGFZy8BPEQQ8GpQ6E3mn4Ttt
         cZ17MnjhQ8EeAKKChZoST1QX6Ncsr3fE1eGTK3IVEAuq7qtx5ny8iQSB3DT4TcFXb7Mn
         CeViuxhewRaJW8d1DxqNFbqMiPTzNSOlFGgGpfvJrbfxpy+H6e+nCekMgAZrAN6DvE/i
         HblLpj1lEE/vn+SKBc+wOzSLENWIAqea2pGpGnGVMHlT4YMdYtLC4Wa30TtX1Lu6csXg
         q6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=fPmO79giYZzgVoPI/GK7FFkiLhjSBTX80hRxj5reGpE=;
        b=b4T01VqHJSMVnXCXBgCz3KU8snZcM5MhYhuZ7TOvNxBbZIQ6f882RO8alALrCAjXjc
         sHlpoROk5h3A/ybDnM6PFFvlrc2yGkuqIW1U0aivIDi/JhI4EFa33mPujgxYj98G3L0f
         NG6z/8LBZiKdWh74VLRVxeN5/qioUdnGkS0FpX7hP25kuZaG9J6ufPUARi1uCyrnfuck
         rb6ZeLB/Cg6JRtZDe6KhbNWI+2+OWETj8HosSnObA1ESfMLxXN9lqgKFnDz3UPVLQ4I7
         vBUlZDx+h7mTbNXxbiXl7siP0Fe8k6uqA7ozipGzpibzbTAH41ZUa426Oyu2Z7rSC0jO
         xK7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtQt8o0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10-20020a05620a408a00b006cfa81f5df9si4013983qko.103.2022.12.20.03.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 03:03:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtQt8o0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7aPB-0000ds-3q; Tue, 20 Dec 2022 06:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aP0-0000Yw-AL
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:03:19 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aOx-0002Fa-JA
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 06:03:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id a17so10204097wrt.11
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 03:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fPmO79giYZzgVoPI/GK7FFkiLhjSBTX80hRxj5reGpE=;
 b=JtQt8o0Uvfl+5a8lKDZ0G5urocXjf7pdOmapsI+uQjX20JwkQQNDHpTQKbBUVvSBVL
 y+0g2aA61s98h3zN2o4k+iE5QlxSWSDTTcgJlwu9z8DymYWYT6goGlMVTGxCu7QFCahp
 SQ2ci0Ml0Snldje5/ePa7bwaJuLajKE8LsNkIgbbqSh5pXGwjFhUjQZYjvPZ3CgN/whl
 7iPuQlpvz2dWZOOBJFsGQEGGAzhs9oqCBtMmF9rkBulnsbPA7TB+ZxSTR9vICVdF1eJT
 VoOMDpK5fsV4RHIR9TiD2760UIGY8Ef6lYHGTZpflXZaKIaBHtOHjHVo8FQFBbSVXusF
 YRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fPmO79giYZzgVoPI/GK7FFkiLhjSBTX80hRxj5reGpE=;
 b=MDrnn+OKDTHnfGjx1pV1OOcL+PL5Uzew19akQ4IXZwHJD2856lN9WLaDeQNH5kOLyY
 WhucL47lnSYV4WvRvGkZ94/yW3bFNMRrIlQPhuRFgtNBb6NYI+wMhnxX7reclMvnbzi5
 3igTMEzFJYC40Auo5jS0iAIXxsVKwOsw12wRzj/Fp1k5zXD+Rz2kWD1goqk89CQcq3Nb
 vogAF64Fc2D8L5kF0f/rx79iJrgfIyLsrLA/SNHatpFCh61TpYTDOnvHd6+zflzMbk75
 hMHrObaPkeZwodlSxAZMUh1Qe7jLZ7rz7t/+8CRvogt9929kqTt/sIxAUFIHsfJbU0DV
 VE8w==
X-Gm-Message-State: ANoB5pl/qrsU48gXk1EqpEai3heyoxyfy40WutL0V9NAyBwr2IhXC81g
 n1gPM/rpIIwCxGVtRqGeY+qZMg==
X-Received: by 2002:a05:6000:15cb:b0:242:fa3:3825 with SMTP id
 y11-20020a05600015cb00b002420fa33825mr35987048wry.37.1671534193513; 
 Tue, 20 Dec 2022 03:03:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d50c2000000b002362f6fcaf5sm12315814wrt.48.2022.12.20.03.03.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:03:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 0/5] target: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Tue, 20 Dec 2022 12:03:05 +0100
Message-Id: <20221220110310.8656-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: nrYPCz3CIX1A

All series reviewed, can patches be picked by corresponding
maintainers?

The "qapi-commands-machine.h" header is not generated in user-only
emulation. This series removes its use in user-emu code by moving
the QMP code depending on this header into a separate sysemu unit.

Since v1:
- renamed cpu-monitor.c -> monitor.c on loongarch

Philippe Mathieu-Daude (1):
  target/i386: Restrict 'qapi-commands-machine.h' to system emulation

Philippe Mathieu-Daudé (4):
  target/arm: Restrict 'qapi-commands-machine.h' to system emulation
  target/loongarch: Restrict 'qapi-commands-machine.h' to system
    emulation
  target/mips: Restrict 'qapi-commands-machine.h' to system emulation
  target/ppc: Restrict 'qapi-commands-machine.h' to system emulation

 target/arm/helper.c            | 29 -------------
 target/arm/m_helper.c          |  1 -
 target/arm/monitor.c           | 28 +++++++++++++
 target/i386/cpu.c              | 74 ++++++++++++++++++----------------
 target/loongarch/cpu.c         | 27 -------------
 target/loongarch/meson.build   |  1 +
 target/loongarch/monitor.c     | 37 +++++++++++++++++
 target/mips/cpu.c              | 29 -------------
 target/mips/sysemu/meson.build |  1 +
 target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++
 target/ppc/cpu-qom.h           |  2 +
 target/ppc/cpu_init.c          | 48 +---------------------
 target/ppc/monitor.c           | 50 ++++++++++++++++++++++-
 13 files changed, 197 insertions(+), 169 deletions(-)
 create mode 100644 target/loongarch/monitor.c
 create mode 100644 target/mips/sysemu/monitor.c

-- 
2.38.1

