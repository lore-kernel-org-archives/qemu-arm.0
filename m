Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp1031852lfc;
        Fri, 17 Dec 2021 15:30:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJJ/mTuwJ6+fNu86Cbhv4N0Z4nnqNch9L4LeDFGaUpbrTcav9NpbMyRc1CgCZRXScA06ef
X-Received: by 2002:a5b:402:: with SMTP id m2mr7023441ybp.38.1639783850962;
        Fri, 17 Dec 2021 15:30:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639783850; cv=none;
        d=google.com; s=arc-20160816;
        b=EQhStux5y/stN4M6aTJmgBmAdO+hYfk/GYctzUUn+h7ziDBUQf5aCaawXpMoxs8m2Z
         HaDaDCKw1u6QHsPkZw6sFUWIK3iZRtpdo/u+CUrHddK8M006WzRMoptgZUDyYs25epuP
         vpk3mw5m6xQBkynlbpIy+UM1mrjHG/JWhtk3EnCNr1ZtKkhNBQozmchsw8qPK/kMi255
         yGIwYVkClsuXRNl7x2ZT/TIwCYMrATX1/qDpmbe89K1ZvLTmwVp3lkUWIJRC3Pxg/tTa
         26su0feBOD6JSg3WqVSHCY2DM7E7dNEVMWzb6EzpTvFar9zmXRkSXkQve9BcEE+y5HS7
         aEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZWh94a2WR9TR/m4jLsj5NcXBuLuKIaQMWt5ljQ5CZKA=;
        b=N+BzsqwbN3bkZUG70T9x6Ydg4jxpdxosgqq++t+hcKK1vPdi6JH5GfUOxDuoM0ZU51
         fbuZeJz8YkMu4lzu5lydmyHtc/HZ8sxJ0V3ht/Z6qXgGjBqGWjLJUCtlEo2M53ddRNro
         AYkNn6jAlAAmPvzuZYZ25pkgu6HUgXLkFLfpvLEVRiUSLulI0+lihmFRO6xA7uj0Pxsq
         wBBJVjKe6D7xcIr+9ood1Oq0WNIwkN3QIZPtXP0326ZRvQ5ZKY9sQ5hswNXNtN9JxCw9
         AJ7FR4PFnN6X83HQf26DA9fft22m1O4UYotZ6tvi0m8JMp53CbBVGsNXzviPaNS/L3jL
         3p6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=gsWrkAwG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12si13837965ybu.738.2021.12.17.15.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 15:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=gsWrkAwG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myMgb-0001nF-SN
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 18:30:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMg3-0001lc-0v; Fri, 17 Dec 2021 18:30:15 -0500
Received: from [2a00:1450:4864:20::431] (port=35690
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myMg1-0000dm-H0; Fri, 17 Dec 2021 18:30:14 -0500
Received: by mail-wr1-x431.google.com with SMTP id j18so6884065wrd.2;
 Fri, 17 Dec 2021 15:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZWh94a2WR9TR/m4jLsj5NcXBuLuKIaQMWt5ljQ5CZKA=;
 b=gsWrkAwG7JQ3ro2uXXlPsj8gYZmtDryKTIdklmZu4t2cUqc7EdRp58So1wPuOZyfhD
 0B4Mete5qBQYg3vHk/myqkj96HXwpDNzEVD3XUO3sxQsBlL8gy7+i/vX4zQD8BnL5f6G
 6wAJtSz3MhUJsDOpFaomxBJYhp7MTcmXaMQknTR7c6YXALA+XSme1Vg9yvEHcungClGk
 thoXPd195gYpxDGP1b+UB4Tbwl5PPm0SoZMmn9eXPLKt3y5hCWz8jdImFSzx+RHmwhAf
 +U7IfC0Ki6894c5p1W6L8/A3Jt1+Pe42LkrPQQyeV7WfltaV+Gh8rQ6JqAr3dRYU7Jej
 bkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZWh94a2WR9TR/m4jLsj5NcXBuLuKIaQMWt5ljQ5CZKA=;
 b=pzScdKHKh7K+PxlcC6z33wZyJxmmsHoSqwouRXZlNu2PnZWllUDHD3WfsavzEN4Z12
 wNbhedfQaZo3hC2AbpQR0XtfKj44Sq09yt2Kw2dt5ONA13sQ6b3KNrArn3n/fz/G3oT/
 QZ7Pad0fwemem8wrQetbd3otfAR7HdWXIG0O3jf3M+9aaxcqosL72yT+E6RCIUQiYOSZ
 Dv0N1sStzoiDFkwqtOJowRKBS00y36HLoa4Yir+1/brDEryRe4sEl04l4X7uNA/jljpt
 JXRtCJ6Joz9GnykihefngNDfKpVG3OWjPGWquZnfrHqPs75EezWAlHRpyTQ77TMC4o89
 zlcQ==
X-Gm-Message-State: AOAM530FaG7Z7jnk1KDNc6vcWqmsvPMMOhIcMU1lyS6P/3+BI9Sr1XjV
 pVOVzBjRXT3fjT2uU+45AosgxotqWuM=
X-Received: by 2002:a5d:6c6a:: with SMTP id r10mr2354781wrz.60.1639783809603; 
 Fri, 17 Dec 2021 15:30:09 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id i1sm5155281wml.26.2021.12.17.15.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 15:30:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] hw/net: Move MV88W8618 network device out of hw/arm/
 directory
Date: Sat, 18 Dec 2021 00:30:03 +0100
Message-Id: <20211217233006.1466747-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D46IfGoMMDkq

This series simply extract the MV88W8618 device from the ARM=0D
machine in hw/arm/ and move it to hw/net/.=0D
=0D
Since v2:=0D
- declare MARVELL_88W8618 in hw/arm/Kconfig=0D
- use MARVELL_88W8618 Kconfig (rth)=0D
=0D
Since v1:=0D
- update (c) notice=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw: Move MARVELL_88W8618 Kconfig from audio/ to arm/=0D
  hw/arm/musicpal: Fix coding style of code related to MV88W8618 device=0D
  hw/net: Move MV88W8618 network device out of hw/arm/ directory=0D
=0D
 include/hw/net/mv88w8618_eth.h |  12 +=0D
 hw/arm/musicpal.c              | 380 +------------------------------=0D
 hw/net/mv88w8618_eth.c         | 402 +++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |   2 +=0D
 hw/arm/Kconfig                 |   3 +=0D
 hw/audio/Kconfig               |   3 -=0D
 hw/net/meson.build             |   1 +=0D
 7 files changed, 421 insertions(+), 382 deletions(-)=0D
 create mode 100644 include/hw/net/mv88w8618_eth.h=0D
 create mode 100644 hw/net/mv88w8618_eth.c=0D
=0D
-- =0D
2.33.1=0D
=0D
