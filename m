Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3805462lfb;
        Mon, 6 Sep 2021 06:41:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQQhbOrB9TJ7iPhh8/weJJv96JKNXV/KFEjPyVnxSyFrAbE/vuSA/XK8p3jjafdyNN6LGF
X-Received: by 2002:a02:b605:: with SMTP id h5mr10796493jam.119.1630935708005;
        Mon, 06 Sep 2021 06:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630935708; cv=none;
        d=google.com; s=arc-20160816;
        b=bqi+RYAexkaMmYXGLQSwLhptBzHx3HbYUdeigF2CKq61AQviX5NyAqYkBOh2nVZL3R
         vWyvZAOdVHxbn2QLvL+pwMyCqJS0kbu/qInNPan4+0dSMJGlu8jqF1KGeC8Wxa6PIynr
         sV7B2agIAAyPt0ae6Zp5PZ6Uqy6jzwGB/Z3xJtswbMfb3OB+jhNubAmOFT64R5Mppj13
         8yY5K0PYRek8CBVJg9gzXO0B8Um37NAbhUqvgLCQ9h3shuBl64DmzKqdlFTCskeAgTzG
         0Xr9GjN/H4HlmqEaJ0+/RlJO6u8PSG6RXVT5c/mDr+gBTkxzCpXV75LgWJGSIFOyN+0t
         IkIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=7hX8pcfClyecpQ+u2ryVt37NGwkCMaGiDqwps6yjoeo=;
        b=Tn4os4XrF+ODSBJMosNC4lFwiD+JkWp/JF4xv+TssCm9NzbahSaPFVhNz1aj5qxRQI
         TFHTJnrRbf7G7KLxhS6d5l1FVMg1qvArL2lHNVeNPzXWJ4LplLliKHgMfxYXVThMkbDK
         A6H7+eNALGpSQIf1RQiy8Vc0sokdotjwbhqQ4pcb3zlGJ/43ZSSoBW/bJMI4OIgSx2MH
         tkvdlrB0OANY3nyMV31Wk9k1sHoyVg5QJ7ybJn/rTRmXhWmmUpsFzAod0cnOnQnTuV5g
         gcy0fpT+7BMnHu2yQpnjv6eZjqJCsD3H3iLvWHBrzQDZx8cQjaVoM8dGIuCKh5nNbQ9r
         UaNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=Sfr0C4ti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si6208165jae.132.2021.09.06.06.41.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 06:41:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=Sfr0C4ti;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNEsd-0002Sv-5K
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 09:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNErb-0000ec-TJ
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 09:40:43 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:56888
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNErO-0006iv-O2
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 09:40:43 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 186DZ5pJ014829
 for <qemu-arm@nongnu.org>; Mon, 6 Sep 2021 06:40:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=7hX8pcfClyecpQ+u2ryVt37NGwkCMaGiDqwps6yjoeo=;
 b=Sfr0C4tiFuVLb4HBBp7d1y8jknOLIxDb2tgwj8A5hyYTYMpTamG7vDRwX0d8ooqrhJWS
 xbzM7Q4ZpWXf3u3x03PmH9KFnCjRu8jR+H2oQIxvFkWI+4sLB61YRDkyRZ6vm4Ot77HB
 PsPKV6/F81y8AUQFK39e3C6jK5sJp3Theto= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net with ESMTP id 3awgun9egp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 06:40:29 -0700
Received: from intmgw003.48.prn1.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 6 Sep 2021 06:40:27 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 564731ACBBDB; Mon,  6 Sep 2021 06:40:24 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <f4bug@amsat.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v2 1/1] hw/arm/aspeed: Initialize AST2600 UART clock selection
 registers
Date: Mon, 6 Sep 2021 06:40:23 -0700
Message-ID: <20210906134023.3711031-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210906134023.3711031-1-pdel@fb.com>
References: <20210906134023.3711031-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: 5lBK-EqNNGmxzgaY5Hmn5tu6TtHid3MR
X-Proofpoint-ORIG-GUID: 5lBK-EqNNGmxzgaY5Hmn5tu6TtHid3MR
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_06:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060086
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=888312a924=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BcYFxuAw5oBK

From: Peter Delevoryas <pdel@fb.com>

UART5 is typically used as the default debug UART on the AST2600, but
UART1 is also designed to be a debug UART. All the AST2600 UART's have
semi-configurable clock rates through registers in the System Control
Unit (SCU), but only UART5 works out of the box with zero-initialized
values. The rest of the UART's expect a few of the registers to be
initialized to non-zero values, or else the clock rate calculation will
yield zero or undefined (due to a divide-by-zero).

For reference, the U-Boot clock rate driver here shows the calculation:

    https://github.com/facebook/openbmc-uboot/blob/15f7e0dc01d8/drivers/clk=
/aspeed/clk_ast2600.c#L357

To summarize, UART5 allows selection from 4 rates: 24 MHz, 192 MHz, 24 /
13 MHz, and 192 / 13 MHz. The other UART's allow selecting either the
"low" rate (UARTCLK) or the "high" rate (HUARTCLK). UARTCLK and HUARTCLK
are configurable themselves:

    UARTCLK =3D UXCLK * R / (N * 2)
    HUARTCLK =3D HUXCLK * HR / (HN * 2)

UXCLK and HUXCLK are also configurable, and depend on the APLL and/or
HPLL clock rates, which also derive from complicated calculations. Long
story short, there's lots of multiplication and division from
configurable registers, and most of these registers are zero-initialized
in QEMU, which at best is unexpected and at worst causes this clock rate
driver to hang from divide-by-zero's. This can also be difficult to
diagnose, because it may cause U-Boot to hang before serial console
initialization completes, requiring intervention from gdb.

This change just initializes all of these registers with default values
from the datasheet.

To test this, I used Facebook's AST2600 OpenBMC image for "fuji", with
the following diff applied (because fuji uses UART1 for console output,
not UART5).

  @@ -323,8 +323,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
       }

      /* UART - attach an 8250 to the IO space as our UART5 */
  -    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
  -                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
  +    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART1], 2,
  +                   aspeed_soc_get_irq(s, ASPEED_DEV_UART1),
                    38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);

       /* I2C */

Without these clock rate registers being initialized, U-Boot hangs in
the clock rate driver from a divide-by-zero, because the UART1 clock
rate register reads return zero, and there's no console output. After
initializing them with default values, fuji boots successfully.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/misc/aspeed_scu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 05edebedeb..a95dca65f2 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -119,6 +119,8 @@
 #define AST2600_CLK_SEL3          TO_REG(0x308)
 #define AST2600_CLK_SEL4          TO_REG(0x310)
 #define AST2600_CLK_SEL5          TO_REG(0x314)
+#define AST2600_UARTCLK_PARAM     TO_REG(0x338)
+#define AST2600_HUARTCLK_PARAM    TO_REG(0x33C)
 #define AST2600_HW_STRAP1         TO_REG(0x500)
 #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
 #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
@@ -681,6 +683,8 @@ static const uint32_t ast2600_a3_resets[ASPEED_AST2600_=
SCU_NR_REGS] =3D {
     [AST2600_CLK_SEL3]          =3D 0x00000000,
     [AST2600_CLK_SEL4]          =3D 0xF3F40000,
     [AST2600_CLK_SEL5]          =3D 0x30000000,
+    [AST2600_UARTCLK_PARAM]     =3D 0x00014506,
+    [AST2600_HUARTCLK_PARAM]    =3D 0x000145C0,
     [AST2600_CHIP_ID0]          =3D 0x1234ABCD,
     [AST2600_CHIP_ID1]          =3D 0x88884444,
 };
--=20
2.30.2

