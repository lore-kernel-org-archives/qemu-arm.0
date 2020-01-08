Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp198371lff;
        Tue, 7 Jan 2020 18:39:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9dkqDLYQ3F+0QRxOJuJqaATcTVGskFtt6vOJJnIaH9LP11YXxwgfgtExz2DC+NJnCHy60
X-Received: by 2002:ad4:4b08:: with SMTP id r8mr2253610qvw.250.1578451187536;
        Tue, 07 Jan 2020 18:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578451187; cv=none;
        d=google.com; s=arc-20160816;
        b=uyJiVARaClvbZ782lXLKhELNrqp+pGwjrOCucol+7rnzkf4JNtR+McjpaZKdyGHJWc
         aHC1PgjZJ69KjCCwTpC6VlxCddUNSWx/12lSOXJftSusWpplbfjP5ZRPR4gpLuIG1IR+
         momybOoN4j+mE6Vp5o3GNEoBgLgYxsXopDxYQlbmmblLM/f/XA0gW7EKUGT2ieF6g9mt
         UW0uGoSO3joUfqL8DewG8OjDedOp2xzjqnqD3ekFk8yXD89Fn2S060zHtL7Xndo67s0j
         OMTZfwilC1G5JsAeU61dQ5CG3rGcmEO8G+ztaSV1D+7M+0moVXlSBprELOI8HxasbR5x
         ADhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=9NBPWRVVxuDE7oQ92ah+SgvhAHFWL+ws5cYaQr+zWb0=;
        b=ZmGw0tlDVkKNE3yCHNVJQNwLaW0o6e9Klk1PDRmsuAvAtb+I+VPgCSKuG/wsBBv4G1
         K5Ih1CNO8l07fMDhYAMiabDISl9DzsJhc/iVHjeezGJiCWwF3LLs16XerbeauwvIcGdm
         6NBILIL40KsMRpMePV/IC+2V69jb6dFjOyBWUlQM5mVRZN4o7rwb+ZTYuIPz84DBZXG5
         HP0xSpHGxn7HuTJC6VtCpNkfEduJGUL5FSQnGVMtp0h74XZQABeDUwLnRebTpW91IXZ3
         ffOAlKs7gogOEHOjYkS+rTy90Nh5sdqsOuDh23WO/HwNUWhfXyEDKm4axhH7cw87d8fk
         D5mA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si960981qth.239.2020.01.07.18.39.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 18:39:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ip1G6-0007kh-I3
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 21:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ip1Ft-0007hk-Ra
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 21:39:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ip1Fs-0001Mt-Hy
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 21:39:33 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2287 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ip1Fr-0001H3-3j; Tue, 07 Jan 2020 21:39:32 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 408923B9DA37C5863BAA;
 Wed,  8 Jan 2020 10:39:25 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Wed, 8 Jan 2020 10:39:18 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH v2] arm/translate-a64: fix uninitialized variable warning
Date: Wed, 8 Jan 2020 10:39:15 +0800
Message-ID: <20200108023915.52288-1-pannengyuan@huawei.com>
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
X-TUID: cee6TEnmXT5k

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
---
Changes v2 to v1:
- add a default label to fix uninitialized warnings(suggested by Richard =
Henderson)
---
 target/arm/translate-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d4bebbe629..63a3d26687 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13585,6 +13585,8 @@ static void disas_crypto_three_reg_sha512(DisasCo=
ntext *s, uint32_t insn)
             feature =3D dc_isar_feature(aa64_sha3, s);
             genfn =3D NULL;
             break;
+        default:
+            g_assert_not_reached();
         }
     } else {
         switch (opcode) {
--=20
2.21.0.windows.1


