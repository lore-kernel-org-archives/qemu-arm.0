Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1256605lfc;
        Mon, 9 Mar 2020 08:14:29 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt58S+J+5FznUZPpSXWPfTygqcHkB8L/kvSSS2Iw7pq1vFBSDMQP9uM9ad4FSCYqD0I1TyO
X-Received: by 2002:aed:30ce:: with SMTP id 72mr14257583qtf.89.1583766868940;
        Mon, 09 Mar 2020 08:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583766868; cv=none;
        d=google.com; s=arc-20160816;
        b=WQ35iqag7QTjxsMJcyUHTHnEkSbYKovOgS8KrtssQkwsEQIpQupWnUknYPStCYChW0
         OCxLV7ojqsrcTqp680YZHpo3ak7T9GjCkOWVzLaLQeCkSOPPMrfAVqqLHz/b6ONLpN9J
         fmOSmH85G4oODBSCVJ3fpJpGpmDCkWRdzD6CNJbFwfbVT5zSWezXx0ToE4blYCJ4Tvll
         rwI/zVjjBm2rWLoVMLs4vM5594n3hTZlIHRBe6sE3NZB9XAT7DSsCq4Q2aYqSUrnWho4
         +a43b0PioigIJtdfTp5kZQ+HS6HfezOEdA8nArhb0Uf+ti16Ib0eRg/DqUhHu6gbOoVi
         oy9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=lnUC22vsZEWNfWpA/7sczTmEPsF/Qe09+Uv6k31gHq0=;
        b=DBTdkPGxqO9BeQc6G9aEoMSPu3d0vDLjQAaH4NZY4jKFiPzA5tCeozntwT5K5MQjgy
         aoaLeEhvZqU2Q6ojwcE4X6p0RIS3//OMeVybqqNaDb2oNUc8nbVpb4X0XkD56sxHpPOJ
         ZQK5RFszCoR7SJrpS/eqTNaZs4bvPaXZ10VtYfEqjqP/TrrBGlMUp9jsAUDonZqPwm+J
         CmQtb8qQfphTJEqDvJcY5gWT0NfFa6i7nu6MdsvSHuzEU0/H7zW5tN6GMBpw5B6kaVzc
         a5E9HCDaFUVZfPjxrUPS/3+Ik7C4pElWBKX2De0aNhDhp+2PHoJd9CcRnE8H+HcSWj2/
         0rEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si6204061qtq.38.2020.03.09.08.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 08:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBK6u-0006zH-CY
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 11:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBK2U-0007uS-EW
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBK2T-0007hf-CQ
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 11:09:54 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56317)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBK2O-0007dx-Ih; Mon, 09 Mar 2020 11:09:48 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MlwBh-1jbc562ffX-00j3HZ; Mon, 09 Mar 2020 16:08:47 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] maint: Include top-level *.rst files early in git diff
Date: Mon,  9 Mar 2020 16:08:06 +0100
Message-Id: <20200309150837.3193387-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
References: <20200309150837.3193387-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mld9B2FysAyq/JRuJU+HFs/fY2Io+TPiAPpRJFtmcONIGZ7Rto7
 jJngslIHaKNCPsm6Jad44FfZYle4J+6wCXsvIg+eevB7FPsW8i/2B6S/wQ0UuUmvv+k4XfL
 MhUkN6utxBSs6g0zJ1g4BnqSzC/pU7OydL3bgdaqwI450A+P7TjcOC7DelGlHUzvqN/mkrg
 jffHr+MimU0GPcCXXHKIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fI/dpnRvQCE=:004FYDGB+IXXAKS5m2OuEq
 iZgWkTOPZvx6OXWgcaA9G2+5FYYFSvkdty/JRl2zEMtKq+HtDm3zKoZprgiJISrSF/Dc5Undy
 VsA+CGtFua24pZWKwQdfHUCVozfTllzbtvnVMO78pvGM8WMqgKXaCSyi6DoQ/piNMTX9io4eJ
 8PPXAQjP0oX1eVe/o60yV+uHdmLuztVi8EReo13c+8x2a3tl5Umz4UTAg9rYOXwNxCfBgMXAB
 iizvsmBPQoz3dARVsTTBSuwVkVaANhJVNEE1N02y0x/zaembnwNc2eF4pQsnGoQJf1ClnV6dO
 yHFVAmld2/6rMW3NDdm6dB1lRlYeNrDuZSCvN8q+1ttOqmZA7dsCCBF0AoR1/Ise2ScB89cK8
 vOrr/JvvhaEvTr0zOtXrV7G+8ZbIieoPyJvEsWQgLSS7gI0KLeTLRNwNjLqciriZm/NE/bXRn
 +rI6PCih5nYdVR8reMjX8TY/RKRIH/C+qXsObPHg5w7/shoQrDQrTAbVtL4rJmoIDwgXrQamy
 cUnhRPJPMuLKa+14MSDSxYvT8An7GWFRo2GiwONhSlpRVnLAzndyMJ6WLP1oRABdQ3pRziGld
 tMfjT5igKE4yAH6SlhMjvCCb/snjW65pfOO/g1C5H90SfEXEggtXj1DOU9eEk47t9UXHmKRMG
 srR2YiIkNBUZ6HxwuZj3sa2o169Ayoo1VpytZyjr2HZVk/Ht+BPFiBpSluUBfbr4pnpomCI+g
 QFvkFDPavc07FsHHb2bCUdZIncL7QRH9yWZOj6iT8fp7IZZZKpFyAhiXPEEPSeRpGCSOFwLH8
 Kb8JYqmKFMJ00Sh6NzMvtAeRRnu+l9Iwczk+nXXCMhUMrNanwc3h5+pNBEAfApeHjJQnf/8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d2aOZOHwmfXC

From: Eric Blake <eblake@redhat.com>

We are converting more doc files to *.rst rather than *.texi.  Most
doc files are already listed early in diffs due to our catchall
docs/*, but a few top-level files get missed by that glob.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20200220162214.3474280-1-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/git.orderfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index 7cf22e0bf546..73fd818d7f3e 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -11,6 +11,7 @@
 
 # Documentation
 docs/*
+*.rst
 *.texi
 
 # build system
-- 
2.24.1

