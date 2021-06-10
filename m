Received: by 2002:a0c:aa83:0:0:0:0:0 with SMTP id f3csp1953324qvb;
        Thu, 10 Jun 2021 11:35:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7vhDS17s0gZlp4SgpbODNPpaH+Di0+3Jcoi3jXOsNCdcqk2VJRa3unK3j7tSS32PUJbrg
X-Received: by 2002:a1f:6057:: with SMTP id u84mr5763573vkb.11.1623350134000;
        Thu, 10 Jun 2021 11:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623350133; cv=none;
        d=google.com; s=arc-20160816;
        b=Otb/MXIMsC9xUaC5Qwg0K9qxL/iPYHhkpXAUsJVgvYxS3J5HLfCEwUHEyfmz6evEwY
         rlFB0DSyMnK2yzbWuQoclHXnd8jQZu2/z7TtjiT0uNtH8oXgFK2p+ii+x9C13O8VmojR
         4hy+0obVeMRtxsISXMCpOwOf1FQcP9G9jHSN/PsjS+Xo2R9cnSZspqPD6x+Fv+5U027I
         Kc+ECf4nFTlA7Fd4Tct/ZS1t7v617LeAdUaptelBuGnzXsarhlMV7zmjIQHDaMetTlBw
         YSXV5Rz/wnPucBkafBsrs0H020rWxeys/aId2VHMvTAPBhpsnNvOlAhavsAefhl8Rslf
         lzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=vmV+Ia7s3qb/4y8WWTtd2eHWz6fhbSyyW0GXOMIrz/c=;
        b=w4BMOuZq7RnCfxQorjJWOu1um+tEZ07gj5Z6fcXeR8UGbL6atg7mofvZlchQqlCTCv
         j91peJKoQHrIIncUtBKS2675WXutI7ElX9jca9UXzIbWgoNPH/oDlSIpcXxAhNCouuhV
         FGEzWYYtn7gnXvoe4IVRz99A3N77RYtpD2LQoiai15MrcOOABUcTMfj5et8xyX0ENkni
         3CXeLWi+ywSjSz/jYm4T53Bl/14w6jVMzZJ9k714+aRGJPG+taFvS4YxSrufuOOKoT9T
         iRl7ITVIPk0uB60Qz4mtuspaXJYLuGhd4qNEVBpEU09pWQYt/WhD09EcRvFAw5pIfQ0f
         0Xfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmx.net header.s=badeba3b8450 header.b=WtFeiCKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si2328416vsq.208.2021.06.10.11.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 11:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmx.net header.s=badeba3b8450 header.b=WtFeiCKV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrPWf-00031t-Cu
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 14:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrPWP-0002x7-Bj; Thu, 10 Jun 2021 14:35:17 -0400
Received: from mout.gmx.net ([212.227.15.19]:50741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrPWM-0005PW-Ps; Thu, 10 Jun 2021 14:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623350107;
 bh=qBuU1SSi7IuD58YXYaSoqAAca+SXsbvJCIYG6Wk/ftg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=WtFeiCKVcbGIB+86X1C8oGks3qiI6e6CiVYX2x21HayvrtFbDlsu9u7gNG6vtWLYH
 zH8eBrCejR+q3fI1OsHcpCrPPrAh7EYaYOUUolNkh+EoNNNsejkGWEHEdNCxrTEXgI
 KMS7R824SVqG+7YAwbx2FmCcupbfKiVPdyxHUdFI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MMXUD-1laZK939Xz-00JXBv; Thu, 10
 Jun 2021 20:35:06 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/1] hw: virt: consider hw_compat_6_0
Date: Thu, 10 Jun 2021 20:34:59 +0200
Message-Id: <20210610183500.54207-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v/12hOeHA9KaSB5+usBPWXIvwz7AwpaBhAKTFWZ3ylnmdUiPZsa
 uQFzZhC1thVtwvQ1WxsGAc872BBT3pdMkWJVxwVUkJCUkUI8IdXznXHLBlTYL59UVvCCDy7
 yVSuuRJEGdnrjBfKX8Ji+AdQUkOhNcAERiULa/Dypa/o2G3d8WpgVYLsXHoNxSojOLeSb0L
 zgWN9Ld5DA3WdKRm76zPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rND5nwB9Rc0=:fDqus6XAwpXNIVVxmcQY4x
 HfIVfGOPtEoUMcD3EIjJUh8JyyEvJBVrXjn10Xpg9MU/HEcXM/TZE7HF8zzdNYxvODfAb3oec
 wM8MHEZe3jphexop9MGc77eopF58TNDwhsGtiiRh9NpKl9AZ3x/FGxKLLiaBh4PWOEon0tUpv
 EQaUX5wiK5J8F21dZUgFj/asrnvHp611jPwvjww7JhXRTEQZewtoMRodju80Qw7yQ9+Hfsf4P
 giFWucYw0ggqoyjRZpWqTnZkMRUbCompyF0xuabMbHZhX+zp9/4XfLiJLdMQ+Iw/FO6ddkEZL
 is/JJZdgbOipIPafXoQSa2NlvAtjHU1X6OKI0/mu+24OO40hOOQsAWnzyhKV9to40aChFd95h
 gkGSuXBiigxgS2HKjUlIql6Rm7IzmC8M1zKyjy1EM5r4kxTXswEEQcpOmMfCRPFnJcBd6CU83
 //6P5XNQuvjvktWaQLohUon7Wi3pS/Gxm8e0pK9jb2c+9F+OOtXyCT1TCn8PkqVNfPjOX0MIt
 9AJBbihdJQyPmOgjCnLU5nFDVD/Zbx4Pwi2CfhLO7JXQQA9h78PhD5culbg5Up7yDwcCYMoDW
 9ApkQ/ehgFPOq5I0T2p1pZ6sEYuypLDtIWmm0yXozTGAJbwqgvQ5q8YlFRVsrlJWZkZO3HRG7
 S5OKS9QMvEKZn3zVBwgw3yYhONPywRrkneyBW111THUbetI6VsVwEbplXoiI+niu6UBmuIdK1
 xjzKp6suqkY3SRJGkKcKL6pXAb5iX01ROMhfLoPe35cniMx3EDby4IaCR97Xw/2K4iNZ2idey
 VSPZdoPjRBNPMkrs1yrU1fqt5BvNW6N5x7E3qDOzHKPi24KgMxYw2srFlCaOEZRcSeFiJCPhi
 OT1wWwhifxqTX4WoZYyPbKZTCjZ0R9rWMAj8660/arjJwTCeCJw9ndvT+TV8E9BqDMU/I83qs
 y3UgQR/aBNgHP5vAvKWgvIwNhZLtyjudl6LiY43YbeD2OY4N1eDR1Evt6pJgDtqszwOb5zdiw
 X/zpMRqv93SgjvE11yaVaaWguRHUm2TW3a/FkRrhg8/NWG2pd2bc6z9wg4SVUfpzP00vqRXRT
 UOtlIViDfsVXA1+nemMiY2Y4uw4ociQ3t7O
Received-SPF: pass client-ip=212.227.15.19; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <its@irrelevant.dk>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YWumKbWkgaZo

virt-6.0 must consider hw_compat_6_0.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
=2D--
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d..8bc3b408fe 100644
=2D-- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2764,6 +2764,8 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)

 static void virt_machine_6_0_options(MachineClass *mc)
 {
+    virt_machine_6_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
 DEFINE_VIRT_MACHINE(6, 0)

=2D-
2.30.2

