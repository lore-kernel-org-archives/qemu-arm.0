Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp393230ejt;
        Sun, 26 Nov 2023 06:43:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2ey602gFsfaHn9KX2p4MDuPCSUjDvZjB+NnIDKVhfZul0hbV60UhTeuX5gx1jrLTNjq6j
X-Received: by 2002:a05:6214:f6e:b0:67a:2b2c:d08b with SMTP id iy14-20020a0562140f6e00b0067a2b2cd08bmr5021391qvb.38.1701009787472;
        Sun, 26 Nov 2023 06:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701009787; cv=none;
        d=google.com; s=arc-20160816;
        b=ywGC+JOebEZ5VpzmNI/ONu7kUn0057bINjsvzdL0x4uqOZfLPGEnMvu2VsAwRp5pX5
         nK00AC59sXued38NefOw0SxKse8HAjsUIi2HURlLF3kbZXMURfH/ndrL1aGAX9h3pc5s
         2rz5qKk3GDo3V8o7KE31MMTZNQIXqF7KZO4+ChQps7P6GaReYqO/yGSsNOCJJa12YFcg
         tpy3VbsyrvzYTV87xmVg1HxZRTYXEqmmv9kQ16bjEPRyakJNBnWgrwG8LMpsNiIUnRDD
         bYpovFm0BVuK6H/8vrBjlerr3U1mQfTP0WyOAwnvp71ZWdhl1AVOAGW1GgPHxGGspcvU
         +bxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:subject:mime-version
         :date:from;
        bh=QHzZaiP3k8EOOk94hqiA0idzl/iS0/099vEAsqZqJxU=;
        fh=ZT/vC6Y8mjJBKDjOrmjRH6K81Y/TtfGORCH+BBvMzeA=;
        b=s+jKBOqBfUiWjU0JmPyZCIXq2D8bbHx0qKn46nwG2/4kTep/pz5ponjyJlgepk8JF6
         h7NTxe5AGyF9ctKpPdi8/GT3pHfQHGn4TSgsNd2ORLuh1db5cM9oEQ94InPWkFfnLrlw
         WqiUl5S8K0H02pOEB+9c6SdlGH2wVfRHboZrX1IjeMW+uusBTVeoTnkOpH3x4jgFp7/P
         Khu4PfJTGrf3nLyyHG8CKZWFTxCBZX3ZczLI8KWG+ZW0YFUbSboC7YTGRYzV5YsohrRH
         b801B4mgkbu6jZzE6rVnipeZ6rpZ5l7EYZh4EdEHVjxN0/WdaFqb1pbCKp9sAz8fDZrV
         rH5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020a0ce40d000000b0066cf18c5cd9si7189263qvl.606.2023.11.26.06.43.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 06:43:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7GLV-0003GS-Jp; Sun, 26 Nov 2023 09:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1r7GLH-0003Fm-S1; Sun, 26 Nov 2023 09:42:39 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1r7GLF-0006XP-Gx; Sun, 26 Nov 2023 09:42:39 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 928D411EF5A;
 Sun, 26 Nov 2023 14:42:33 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Sun, 26 Nov 2023 14:42:33 +0000
MIME-Version: 1.0
Subject: [PATCH qemu 0/2] hw/arm: Add minimal support for the B-L475E-IOT01A
 board
Message-ID: <170100975340.4879.5844108484092111139-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, ines.varhol@telecom-paris.fr,
 arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: ~inesvarhol <inesvarhol@proton.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SBV5WERHBFzm

This patch allows to emulate the B-L475E-IOT01A ARM Cortex-M4 board.
It's a minimal version without any implemented peripherals yet.
We've corrected the patch according to the reviews of Philippe Mathieu-
Daud=C3=A9 (thank you !),
and additionally completed the MAINTAINERS file with the new devices.

I'm not sure whether it's alright to send this patch before peripherals
are implemented ?
If it's not, we'll resend the complete patch later on.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (2):
  hw/arm: Add minimal support for the STM32L4x5 SoC
  hw/arm: Add minimal support for the B-L475E-IOT01A board

 MAINTAINERS                             |  15 ++
 configs/devices/arm-softmmu/default.mak |   1 +
 hw/arm/Kconfig                          |  11 +
 hw/arm/b-l475e-iot01a.c                 |  79 +++++++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32l4x5_soc.c                  | 277 ++++++++++++++++++++++++
 include/hw/arm/stm32l4x5_soc.h          |  68 ++++++
 7 files changed, 453 insertions(+)
 create mode 100644 hw/arm/b-l475e-iot01a.c
 create mode 100644 hw/arm/stm32l4x5_soc.c
 create mode 100644 include/hw/arm/stm32l4x5_soc.h

--=20
2.38.5
