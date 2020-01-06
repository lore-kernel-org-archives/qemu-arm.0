Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp22867078lff;
        Sun, 5 Jan 2020 17:57:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqweRRobjQJALtPm3+ebU+7VDmUbZCwPT7WpJvw8PbnXJ7cPn/HQVDPrJxE1CNoH1CMkjYvn
X-Received: by 2002:ac8:71d7:: with SMTP id i23mr74657050qtp.50.1578275849438;
        Sun, 05 Jan 2020 17:57:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578275849; cv=none;
        d=google.com; s=arc-20160816;
        b=b+zGaVhkRXt0dfrtrvhbsGgoAYbbS2410iIGmDOuszw/4IYsbp9RIz1X/S4u0NSJK5
         TaZCDaQF0qXH3dDa1gcWkhbzsAXU84TQaH9MtH6c/6G4xmQHKdXmbosYvG9I+F3e+TfP
         dnuBPGN06nEO8SBccAVbrf+P6x/pzx2OaWs17poG4ob++GlDvdwVLs/oZ5kvr+RnkGZL
         Sy4qSqniyRlIo+npBd3U6xmWZQJTrwkYrgtuk6KeIObOpgrf/lpAh+NcibCftfoF7SW0
         htHphRzx0x6UWAqZ4ILogGiBmTSCC2htFVWYWyeOKVFe7YLP2ESHhlAfQEzJUvMAnuu/
         NSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=IrOxMySqchKgl3to9ckDNrcbUUYNhBMsdmyqm5Ipnp8=;
        b=EjhNVLwupPZrfAmTVD18PX6/PdjRCuLDX5iLt+iWwk48zztJfqNDA4LC5YNvP7mPwP
         CA8RX7qa5o5Omy0yAjZQCWj4Lps2P/nB+j1eXpUvGP//DWGKjBj9ghFjr12Pbab8601s
         3LjjF0R0f0SqYkLEKAyilpYcnbKAk5OWGrASG6sIBLwcUPJshz2gdoqk90o6gzzWKYL4
         gk0hg8Ow3yqam94IBhsR6mpyvgqyQzG6gYP/dc4l8KhC8Bqxt2KNqGN5mzu3hex7/h4s
         QSEQ/PxFJBrBbihikoflipJ7dUSjw9/ZdhPlSTGEU2hsq2VKTls3Elvja70YvRwbnjUy
         4p/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j65si26385921qtb.274.2020.01.05.17.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jan 2020 17:57:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioHe4-0007G8-Ps
	for alex.bennee@linaro.org; Sun, 05 Jan 2020 20:57:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ioHdy-0007G0-1c
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 20:57:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ioHdx-0007OP-0y
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 20:57:21 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2284 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ioHdw-0007NY-Mr; Sun, 05 Jan 2020 20:57:20 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C1C9B904D1D47B245BCD;
 Mon,  6 Jan 2020 09:57:18 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Mon, 6 Jan 2020 09:57:10 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH] arm/translate-a64: fix uninitialized variable warning
Date: Mon, 6 Jan 2020 09:57:00 +0800
Message-ID: <20200106015700.52992-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2eslRgYVJWKr

From: Pan Nengyuan <pannengyuan@huawei.com>

Fixes:
target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitiali=
zed in this function [-Werror=3Dmaybe-uninitialized]
    genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
    if (!feature) {

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>=20
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d4bebbe629..211e3d813f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13564,8 +13564,8 @@ static void disas_crypto_three_reg_sha512(DisasCo=
ntext *s, uint32_t insn)
     int rm =3D extract32(insn, 16, 5);
     int rn =3D extract32(insn, 5, 5);
     int rd =3D extract32(insn, 0, 5);
-    bool feature;
-    CryptoThreeOpFn *genfn;
+    bool feature =3D false;
+    CryptoThreeOpFn *genfn =3D NULL;
=20
     if (o =3D=3D 0) {
         switch (opcode) {
--=20
2.21.0.windows.1


