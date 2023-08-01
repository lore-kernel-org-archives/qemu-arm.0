Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp3197841ejb;
        Tue, 1 Aug 2023 16:10:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEef6xgCqyFE7GmKLEXHC80yKIoqNmzXzpH73l9++5vs3G6DkbEHmtT9/X9l9YSj9DIxqWF
X-Received: by 2002:ac8:7d44:0:b0:403:b11a:34c4 with SMTP id h4-20020ac87d44000000b00403b11a34c4mr17742399qtb.1.1690931439693;
        Tue, 01 Aug 2023 16:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690931439; cv=none;
        d=google.com; s=arc-20160816;
        b=UmLMMX7IjCzMNnqXRJCh8voaqetMfLh4aNQe1GXViyekH0E1Bl9yrfoXo6IaRLcMFv
         dR0v+F4Yvjez/Ae8vi+un0WwObsE9u+p5ZNbNuJdgq4hMEUqjB//ar+nWP6GmMVKQm7T
         AeA6k4oetoP3FEswiQnuxjNe3lKmA2Dg0Dx0nxiYMx6BTK4C474Emz42rK8pVsk9D5nZ
         JcxKuCqMcfoRMWFdtGftLgD5SkY3Sz0Qp3rJBH8k0NuU1L9rnwnkoeqHXpJMfHEkhCH/
         jeK56f1sZYKOWzlcVzR7f5jB93PyyRPgVtFIBfDbUauZUX57YiHGqr2/HOW2N4t7LFKo
         9Ixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=sp634pRSUqF9WF1PtSbtGXi+RFw0g0fFt9aLSA0g/Fs=;
        fh=h2NiM73TDUwPJRVMw4rHnLE/myHehhKeVHVn89dXDpc=;
        b=tR/JN6IvOZTGNxyYafa8lD2kPDkHZ8pnwVP9VH+WKhx9BD9g0Mn4ukCXmQcSaSPTHk
         z+3Yaa615XksfnzpILb8HUcDkYe/KMi49gYbcp9JAVPdrYf9bFdFKtDY/t2k/iExCPPS
         mPPgGcbEcXO8CQBY9vW+s6sKSFGO3zdEWd1taiBcI6cGpKzP/FdQuPu5WhIDoejjEIk/
         VMA3ZD7pXFhDHOGkpiBXyWRoSgq+H6wVBqgr+R48WaLIw3LsEiYntQHBtsC5u/9jdrtT
         vfLLzAPKGe5vctbC5wwHCbWCdVrlwxC3VlPjG3RPjEgy3XQUE7dFqITkqwvgatUU2l9j
         Sqsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=O2GV6pPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05622a05cd00b00403e72e49f0si8036953qtb.783.2023.08.01.16.10.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Aug 2023 16:10:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=O2GV6pPz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQyU7-0007MU-74; Tue, 01 Aug 2023 19:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qQyU5-0007KP-TW; Tue, 01 Aug 2023 19:08:57 -0400
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qQyU3-0004eK-0U; Tue, 01 Aug 2023 19:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1690931324; x=1691536124; i=deller@gmx.de;
 bh=J7s0kfyr83vTEr41j8bE45Amb+LVZNxTmzK8O/quZto=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=O2GV6pPzcuCbtke1nXDzkm/jZSPKyQE5ZLpSDGTXb1cwljNZCsKvgnHx+bKXl6K8v0IZkzq
 hiUL47Q/NXI2I4JDT5VJ+gkAJqEuN8aRiEATgZ5zwGc1+OabYlOvpBs5ZBHpSoUXwMRfkoyfA
 7Bu2yI1FME87dlgm1bUeZ7M1F7WEX4PI0p9i5EpvdbIMHEep9povopRbQBsmqKfOgwYdMNhjC
 O0ObyhZOILQ5ZR+9i7REIBNJsrvdMyrubF2dRLEUB4g5+EFWMcH623beUCU9nyXpW8Xlb+hNc
 54zihtrSZl7Ef5Iax9lQKWEX+ccXWZeOIoNgvdECorJo53zYYx/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.150.247]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MsHru-1pYTDS1YgU-00tje8; Wed, 02
 Aug 2023 01:08:44 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v2 0/3] linux-user: /proc/cpuinfo fix and content emulation
 for arm
Date: Wed,  2 Aug 2023 01:08:39 +0200
Message-ID: <20230801230842.414421-1-deller@gmx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XJ+QlLC/2Go6MxjLeHSaPiHjWCz79PoPId0PPN83pzXax/rW+9t
 6/qnNNqfWlPitUuwWrozFUdF4o8TZmkLjxe/Hj1eYUjO0ZJIsH6xJh/SQy4Y6k7LCCtIKiy
 qg4hsGjSh2tIQA0/tE8p9u/WK9jGMAwnOGZYaEbNIQwXvXKfZhKOYz9vGBlp/BF5Stq5Goq
 pCJ6rgGeXZlsYDmZFPy6g==
UI-OutboundReport: notjunk:1;M01:P0:6hVnGhjo8uw=;VGfryNlTgyLjM2IP0js5LZ2sXF8
 xJ8tDw5UhMVPn0L32DNSQItrGrw2CRyO7JFg5qzfQ+zA11lw8kmd68+vjTf+lAp7oX97UgvNX
 APrkK57qTOs2I2fW6KkQjB9IobE4WPl+ZyRsSadIxxihyQ6Ftuq8izuqU1pCtU/R1Pcl0cwdY
 J72Omg9fmFsmmfTngP9ZbzdR7D8XmNMq4kZWtUy+Kx9kLaHyTYtgw0Bl/Zyq73yB17FtM7CDC
 b5706YvSvzS/VKZpn6K4EdvZ9dhkOc78onDBOkd3hzXC1SSAl9J3xbIZQtEbQgRw6XeQtAQ0t
 4F7c/xqn22YU8PTuea4XEWiuIopICxinV89Nw/1v2gbUKVV0RHxB8qKLMO40FUpXpfJnvXGlf
 KE9bzkld0WznLyRDarcECssVA+0tB09tZm5IlQXfuoYZ4lXWGKYeiTiprOuGZOmM9t9oDM8Ae
 /50gncQZswVsmY1EvZATRuEl6gKtUPKrbOaauHdl8orzcpNSS7KYeXF0HJ7OcfBiuMTCudOeo
 3GMOAAV/+iG32Vw7t5dz/WymuS20GCjl0Sy8BZyAxgP0zBiT+EIO/jywIhV3S2X53aQr1weur
 RGCWRrujuC+qE3xfVotMTiAb8ekLZesrGeLUu9wAKUye9WFIMJ2CLDtTlOs+TKRhR9J1DZBN2
 tc4glyIAe0+nsxUhpY1h4psfWFtCYfvd4sCjIko6DuIxvTdaCALcPo/KnSkgVpxIGbDRq4YJn
 EgVqVl9a/sxddJuxWXJFQpOILjdzFk2joGoA/HG0U614919/MUJpmmjYDSB2w6eHF6FLoCakM
 WePvKgOwBoFG8h3fJ+e+ogQfIjojPupJOMsADgnj2F9J/IkOpcv8ifX+wFVpW6+REYDA2Q5Q3
 o5RaLj6apauHYJ8rBKP6iJ2cChBM06C/IOPa6vXDTjzkfhnFI3owSG2NNKmadMY+1nHsxVVxa
 SRe6ic4FKaUIC39QpzSWV2KfMRY=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w4y8M2g9f6kp

- One fix for correctly detecting /proc/cpuinfo access
- A new /proc/cpuinfo output for arm/arm64.
- A new /proc/cpuinfo output for Alpha

Helge Deller (3):
  linux-user: Fix openat() emulation to correctly detect accesses to
    /proc
  linux-user: Emulate /proc/cpuinfo on aarch64 and arm
  linux-user: Emulate /proc/cpuinfo for Alpha

 linux-user/elfload.c | 130 +++++++++++++++++++++++++++++++++++++++++--
 linux-user/loader.h  |   6 +-
 linux-user/syscall.c | 126 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 254 insertions(+), 8 deletions(-)

=2D-
2.41.0

