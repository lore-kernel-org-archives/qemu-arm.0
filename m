Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp5008300lfg;
        Tue, 29 Jun 2021 07:44:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPj8F4J2YPGF53Mz8KhVindfMa6ckHgu3WNX8UqET3uj/rhpOtTJJC8KXIFpXX+Qll1FsG
X-Received: by 2002:a67:f94d:: with SMTP id u13mr25225651vsq.39.1624977868173;
        Tue, 29 Jun 2021 07:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624977868; cv=none;
        d=google.com; s=arc-20160816;
        b=fzU7xluONtZ/6AYfTboK47kFNT+fSgOBMVLcLp1V8W6JbW9/wEi9WbyTYtw/3OUqHB
         W2DSQQs5SKDo7lbC0SLD2N9IIT0Z6f7+qNID62vhKT3QqalP4YvN+rmdIPQPH6CQeyv4
         Z4lSHsHJDCgo4sgzg91C5kG2JiBzjtrUKZ0vjqrlNsy823Fmnp0NwOjhO4WhLo8ookdI
         7BV+VJ7UoYQhroxzc4sBDLGfNj2+XXWJMuMG8IhqHQlJZAEiqxTLq5h+EGtcV7qs305R
         Gzz0A+4mdkFulKc3LmPMXzZqrB1mmmGPWS0jItnr99ccgOtXIimwyHbp8vVFvneCi3Y8
         +UUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=e/SRFQe2fCa+aFfmmsKP4Qeh21jiPzHXjj14m8YwEKQ=;
        b=mWhRoCCHEKXVGFLRgHZ/APOYbm0ONvytDZwBbs4F1TtvKuVOGy1imNs9feox0jCrdd
         OkWXGBr4FQ3hQ+sbPw6MGlks4nv/bE/E4k7Ai/vioezbvVB9KNHg/WJVpi8CQRaQidSn
         659gDofz4psi24JkfGihMYwBu9wdb3/QSL2IbhrkpPfePCwfgoExup0xV+sUPHCKGLjm
         wGweDMuYd9pNE9l+akZ7EZs2bOVt1dLhmS+rDD9f3VujZahmKJH+D62XzfiyYJCBavmf
         1Tzmnktjpksc7qnqDbveULTlslVmPYoo3YdmOVwaAlPCPlkfwtaeuLBlJa57eP7ZuNb8
         DlhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si10952038uao.226.2021.06.29.07.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 07:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyEyR-00022U-CO
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 10:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lyEef-0006jA-JO; Tue, 29 Jun 2021 10:24:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36481
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lyEed-0005wD-63; Tue, 29 Jun 2021 10:24:01 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TE2gf0184719; Tue, 29 Jun 2021 10:23:45 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39g3fqbhxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 10:23:45 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15TEDPAk007442;
 Tue, 29 Jun 2021 14:23:43 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 39dughhbdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 14:23:43 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15TENel834472412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 14:23:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7E59A409F;
 Tue, 29 Jun 2021 14:23:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76423A4083;
 Tue, 29 Jun 2021 14:23:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 29 Jun 2021 14:23:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.54.151])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A8FCA2201D3;
 Tue, 29 Jun 2021 16:23:38 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/4] arm/aspeed: rainier: Add i2c eeproms and muxes
Date: Tue, 29 Jun 2021 16:23:33 +0200
Message-Id: <20210629142336.750058-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629142336.750058-1-clg@kaod.org>
References: <20210629142336.750058-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 60ZKwtJpJ6hhWVjJYtVKneho-yIYEiR0
X-Proofpoint-ORIG-GUID: 60ZKwtJpJ6hhWVjJYtVKneho-yIYEiR0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_06:2021-06-28,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1034 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106290095
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.207,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VOHM0LQjzSOc

From: Joel Stanley <joel@jms.id.au>

These are the devices documented by the Rainier device tree. With this
we can see the guest discovering the multiplexers and probing the eeprom
devices:

 i2c i2c-2: Added multiplexed i2c bus 16
 i2c i2c-2: Added multiplexed i2c bus 17
 i2c i2c-2: Added multiplexed i2c bus 18
 i2c i2c-2: Added multiplexed i2c bus 19
 i2c-mux-gpio i2cmux: 4 port mux on 1e78a180.i2c-bus adapter
 at24 20-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
 i2c i2c-4: Added multiplexed i2c bus 20
 at24 21-0051: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
 i2c i2c-4: Added multiplexed i2c bus 21
 at24 22-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write

Signed-off-by: Joel Stanley <joel@jms.id.au>
[ clg: Introduced aspeed_eeprom_init ]
Message-Id: <20210625050643.161042-1-joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1301e8fdffb2..62862a244842 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -674,9 +674,21 @@ static void g220a_bmc_i2c_init(AspeedMachineState *b=
mc)
                           eeprom_buf);
 }
=20
+static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize=
)
+{
+    I2CSlave *i2c_dev =3D i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev =3D DEVICE(i2c_dev);
+
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
+}
+
 static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
+    I2CSlave *i2c_mux;
+
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB)=
;
=20
     /* The rainier expects a TMP275 but a TMP105 is compatible */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP10=
5,
@@ -685,11 +697,20 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
                      0x49);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP10=
5,
                      0x4a);
+    i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4)=
,
+                                      "pca9546", 0x70);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
=20
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP10=
5,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP10=
5,
                      0x49);
+    i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5)=
,
+                                      "pca9546", 0x70);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
=20
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP10=
5,
                      0x48);
@@ -697,6 +718,12 @@ static void rainier_bmc_i2c_init(AspeedMachineState =
*bmc)
                      0x4a);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP10=
5,
                      0x4b);
+    i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6)=
,
+                                      "pca9546", 0x70);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
=20
     /* Bus 7: TODO dps310@76 */
     /* Bus 7: TODO max31785@52 */
@@ -704,11 +731,15 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
     /* Bus 7: TODO si7021-a20@20 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP10=
5,
                      0x48);
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB)=
;
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB)=
;
=20
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP10=
5,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP10=
5,
                      0x4a);
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB)=
;
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB)=
;
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9552",=
 0x61);
     /* Bus 8: ucd90320@11 */
     /* Bus 8: ucd90320@b */
@@ -716,14 +747,27 @@ static void rainier_bmc_i2c_init(AspeedMachineState=
 *bmc)
=20
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", =
0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", =
0x4d);
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB=
);
=20
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423",=
 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423",=
 0x4d);
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * Ki=
B);
=20
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP1=
05,
                      0x48);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP1=
05,
                      0x49);
+    i2c_mux =3D i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11=
),
+                                      "pca9546", 0x70);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
+    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
+
+
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB=
);
+
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB=
);
+
+    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB=
);
 }
=20
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
--=20
2.31.1

