Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp514634lft;
        Mon, 20 Jun 2022 08:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUlZ4HBPACrq4U7qOeMb/Tg1aob/72eNuO68lz1JL5VKQt4dV0gW6XfAB66R7oa/2TumJw
X-Received: by 2002:a0c:c308:0:b0:470:2f12:71b6 with SMTP id f8-20020a0cc308000000b004702f1271b6mr9339999qvi.97.1655739007544;
        Mon, 20 Jun 2022 08:30:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1655739007; cv=pass;
        d=google.com; s=arc-20160816;
        b=Lrk9+46pCYlHkwjb5oAWs1mR8t6yYWBVITfZDhvm7et1HRo8JtTzSAimyg63ErNqm0
         3Z5zW01Hj3O+uPRbnqMGLtxOkNhIts/vni3drZW/3nBgT/5WlfNiC9qjhkilckh2eHwY
         RHgNB/Vb9Me7of3OT23mihJQ4hKK2O6MhE+6Pa+HXTcqxDYnLGiYRVMd/XTTWhfRBDsH
         0QJj3wiCwPZjGKnP5t59HpgMZHSqPjDOWqOm7bUJHpixRXjLLRsq9zRST6GD9aH5QCwB
         Lb4R1FYkrhd4qYzc5MSA+BAFK976A39zeCcd0DG/NiWNyXQj/mXN4w1Ntxe+8/57HmFM
         5+6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=ZPZMJFT219LH7E163sHdty9uRMYRvktpwWQXQepGGPo=;
        b=kcSkuJhzZ40HCZuKGXy3FaIST9jg7zA3yO1Y2ynkZ9fLoELONTbztUfHvSDInAnAjL
         hsHxyNv3SsckIzeWB1+eCw1JoOAvt+mrcMA2uDC7oRvW6dxY0pfxZZ9l51UGrqEoE4Ug
         gpHzpatpzqsVHjCQP/v3lWz4GFhCCWI0yzk13YohgM6Ein7G0BFZnvB1h8QHZyJXlCJP
         r5dTQW3cM1O4rljHF7QVhsH3GPtdxQ4AekRgwgYpfKr17chPFWKcv8Qwwvvn3tKRbW6a
         LWzy4jXHjD0Ol56kNMnGw2XFwcbV4GNqNUpDC2Mu2SunU7bDA7y5TiFCbIji3glM7KBM
         aEyA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=lqdNZ6K7;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020ac85dc8000000b00304da6ab2a6si8175497qtx.4.2022.06.20.08.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 08:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@outlook.com header.s=selector1 header.b=lqdNZ6K7;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=outlook.com
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3JLr-0007tZ-0N
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 11:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lck2000@outlook.com>)
 id 1o3J0p-0002AW-SI
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 11:08:23 -0400
Received: from mail-sy4aus01olkn2161.outbound.protection.outlook.com
 ([40.92.62.161]:11589 helo=AUS01-SY4-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lck2000@outlook.com>)
 id 1o3J0n-0007mZ-MQ
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 11:08:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kam0EADYUYhtAc/VdBqeZn9TC+nQ55x719TwAfaZPjOy4ABbNxMf/yMzbwq4IuTm2/PbxdhSoy0xJXhtw6IdYS60eZdZSUe5IH150LH+KEbVI9uL53Npm+MuGbqnhfic/Iq6lrU4aDyFHhVBQHjeYu/b8ZTPmmeZcOvwUjDSKGB/GJBdMI9NB7kGQFY9ph30moXLiDCk76QUIP/St0s5243WLzp9vc/8owLlYGt0ImPSRLlVPhzjaT7C1h8NLqyEW/1WawFsG+e1F7L4WHSEFxFIHN8KN0SZNkuSZOmyZT4HghebXobjjQ+YbQDrpPMDyV/y/f1u+iFHBz7Ssl5nXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPZMJFT219LH7E163sHdty9uRMYRvktpwWQXQepGGPo=;
 b=N0bRb204U+2IDhRt6m9RtPqm580PBowsE9qH2/eIVRRfmjESzpwQ73jPtiPNfPsp6y5A7ngroIz6243MhDEKVCvL4q/MMRhE3KC8F+qsiJG05yCMpMaZz3MXRf9e4wpO2sR/XO8CP9Bgw1n72eaqGtYsHTR6aktnvt9gn27oroJBmr4T370DZfDhxhL7nO4nyvuKh78towc2ou1rdZV/3D7UKOGj8UaGki0zzppPmKGTTbEi8C3/SD4YA23HS/zSVYUEyonTNZVuSIU73dZAY13ZPBQfENUkZ56Jzb8SGJ2QFry6zNCwhAUIVF8we93Bxp/6ykrX8XFpu+dWXSI56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPZMJFT219LH7E163sHdty9uRMYRvktpwWQXQepGGPo=;
 b=lqdNZ6K77VsjraaYlBllkZmFL7T6CS7FmxQrGoawhE2W6KjKXD3JdQfO/U2sns27g/4Dxe14o7Dz3GIjwJBQoEMzXR8A508NRF9tYH4a0IeHRm41QF8fzrRwMS2tgaRRNGCpZfSs3fsGAOS87nh0XJY+NyfcTsf7GzD723vhpSG5PO2szvxj5R8s+AUC28ArneOtohl2POnuTWawlJkaXK7gQCmVR7f539GS+pR2oq+LsOWJju/QBSb/6aK0FYs836REoIrpPrt/xcwYE69i9E3JcSIX1EudZPLR3F+EQ4y/iJcmYH+8WRRaTyTeAegD94gGZbB0V+TOq8T/EkA0mQ==
Received: from SY4PR01MB8581.ausprd01.prod.outlook.com (2603:10c6:10:19d::11)
 by MEXPR01MB1752.ausprd01.prod.outlook.com (2603:10c6:200:35::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Mon, 20 Jun
 2022 15:03:13 +0000
Received: from SY4PR01MB8581.ausprd01.prod.outlook.com
 ([fe80::f526:93ab:f91e:9443]) by SY4PR01MB8581.ausprd01.prod.outlook.com
 ([fe80::f526:93ab:f91e:9443%4]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 15:03:13 +0000
From: l ck <lck2000@outlook.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Program can't exit from the exeception
Thread-Topic: Program can't exit from the exeception
Thread-Index: AQHYhLbOUrMZvHRCWEK/CYIDD0cSpw==
Date: Mon, 20 Jun 2022 15:03:13 +0000
Message-ID: <SY4PR01MB8581F06E9DF1FC1CB79F6E45BAB09@SY4PR01MB8581.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [TGnobnrV/MDv9AuQbqLK8jgzba2Hs+eL]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0a443aa-36d2-4d2f-544e-08da52cdff7a
x-ms-traffictypediagnostic: MEXPR01MB1752:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QpfRkrBC02FlD/MNM8zkPLw4mQwycBDz/1E7Toa87fBCxQsHqxBN+bky0VITiJWUIedG48r1bbnylPdckBVPQ8/NAGW3sCDERDFfd8G0tJj5XB0RzifL+0mO4viPLjZO1xI8SsdK3ZkwYvC6f8V6wFcqGKyvXQymWXcH4asFE/Lv2TaGamafoDYo6AL7nIrn4KvorNzVSupaRmv+SNwX9CZGRJ1NZtFrAx+rTqafSSjyGs+H4w8jB7xk3fMQrzgX5462GM8Mtbrepm77bm280IKTfFRDDh8x3Igas0jc2P5kIZz3Y3nP6ajHMlJLpVdjChAkcbuVBLi4M6BeEMA7L6yH184DZxH9sz+4RvVoLjtdJ+MtSsSfqFi2WNFSQxPB0me8tF8sddH+UvYcD4ofyU+vdLNxBu37t5dEK6PRMN4m5/ml8eVAx/Y6L5h1wdyCXJ9XToQRahFtYVx2VJWFk8evAAyifeJv3051psqu72DStmu2RDV6WHt9ZE6uro2R5mwAKkngxjmGGyxv3t0NIQ5iLv1p36GQ+iQvyiFaLIVZU7KNjWZboNvn+qk/inFiC1ZXWqGupCE7ndsI4GmnklrXtZpYuXQfT3QuQen8+Ph747UwplDeCMaaW+I5HUIXlu4deHJLgHlh0NloQgP2iGXJpFquePj2AuLH0qMqvfw=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jlachWj0DCdCAG4XWLlbgUDHNOmi0DXd5tOyp0N68vKhIOKVlF+jvoF0Lnxo?=
 =?us-ascii?Q?sks8lPy+VZALFKGdDEyr++l5jpWVqrVSj5hdmIzOUrYenZA6MbzlxtRKhHtf?=
 =?us-ascii?Q?eIhQlv0axQCcGXf9oskQttmzvUxBssdyrxzyZt7+gRcgcearsx3PqcFwqW67?=
 =?us-ascii?Q?vr610stk6rWP8KbuncjRm9X3IYB65Acu/gNVcYBysq3j2AHG9UKKn7+albeI?=
 =?us-ascii?Q?/y1L2gQSu/VKVTKzV7jwV6mOsi2aXfW6S3q6AtzJLebu/4aHTtWPxGqY31Zw?=
 =?us-ascii?Q?s1pVMqCLMlfkkaS866ElbUNXJmlah5f5GWyXldCS2GarYR4amdZ9KtYVM35c?=
 =?us-ascii?Q?kZTpXV/mUJe1Y7xR35mc0cEo92fEK1d7tqKjgvIGNtTB+FFEZwj2rLzAKIMb?=
 =?us-ascii?Q?TSyEo86DNMDv5rEGuEIL014dbGlPpJ/j5V+nCQRjMDOYuAlKJjXWAMqeFfcC?=
 =?us-ascii?Q?3pM2c07YQmRwS5f/mQflQroNz1OAzWe2Gm1TaiQ4HNzj8YMbg0VJNtkudqyX?=
 =?us-ascii?Q?SYcs94Pa4BwUZS3yZnuKfjQzuA0x6tCESBqxpO/39unD52DOAXT7l3nFE/J9?=
 =?us-ascii?Q?taQ5nRuxgxN/xinsmgMkz1t9bZG7KHLFGD0NvaL9dnQUCUjEeaYsP5R8KiWa?=
 =?us-ascii?Q?N7q91v/PrCaDcKHLJTzv+n5qqPL7xwFgjwnIBshNH21Il76EXBnYcXsTC54a?=
 =?us-ascii?Q?/CeyehmA4WVRDVOrkA+h2S0zXa45PkEhrHBEXFZR+31nvBQ29/MusIjB3kbU?=
 =?us-ascii?Q?b4tqQ6zZ2OEIeEn0VeP+gu6WzwrLP+VwA5zYvkrTWRAj3SdeD/Cj7lAZlk3a?=
 =?us-ascii?Q?XRNZ9bFuSauYP6J16cFEG+olhZfKJACQN7MgwoDEym16CnzV25a9iOFgxLIo?=
 =?us-ascii?Q?85riZ8EPIJOml9IG78OX4NEh8XYgeqJwBk5cHEBmKNuKLrbyplryneylBUHO?=
 =?us-ascii?Q?ggk0edwUMmcqiCCpwltSSlOH2KPPHVqnxNmg7qK2nBXt14d6cuiL+sGYXSw1?=
 =?us-ascii?Q?wJ74EIPpCzOm7/2efuPmmqIF0UTsiAJ5yJddicVLAT3B7I3aOo7wnn6ISuyJ?=
 =?us-ascii?Q?kjdzBpM9cy8sKB9vgt9MNwJarW+9DOU7/PK3gHe7NQAtC1Ml5+viRCK1AS/B?=
 =?us-ascii?Q?ISnPjSumcDm+OYCb+ySidVd6cymCB65khN/FKbNDfMKK2VMV68CBIBk2hnma?=
 =?us-ascii?Q?xMHyanRiVz2cRuR/VJZjnWO5m2We2nWEAa8Eld0zSxdLLtFsRAqGsaQz+mVu?=
 =?us-ascii?Q?FkCAhfnMGZB7NAZd+Km8QZe3XNGoX3fjvm2cq7r5sLUoafxeQ7z4WwRYull6?=
 =?us-ascii?Q?VS3Wd+RV6K/EUF2fdI0oSnBtcCIkF8hoqprT5rwZA+C/DP0tHGj44p4kLzGF?=
 =?us-ascii?Q?BbzxFyZa8z3moOZD0h4rontZ7Nz19ylYPK6x9/qSHp3kX8UkfvG2uoycpWZW?=
 =?us-ascii?Q?73zqqh2FytLtK4Lb3xHSYR3z9JBbrOS2?=
Content-Type: multipart/alternative;
 boundary="_000_SY4PR01MB8581F06E9DF1FC1CB79F6E45BAB09SY4PR01MB8581ausp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY4PR01MB8581.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a443aa-36d2-4d2f-544e-08da52cdff7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 15:03:13.3701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEXPR01MB1752
Received-SPF: pass client-ip=40.92.62.161; envelope-from=lck2000@outlook.com;
 helo=AUS01-SY4-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Jun 2022 11:29:43 -0400
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jjYCkCbs8C1E

--_000_SY4PR01MB8581F06E9DF1FC1CB79F6E45BAB09SY4PR01MB8581ausp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi everyone, when I tried to run a exeception demo in netduino2, it can't e=
xit from the exeception, in which after executing the assembly instruction =
`br lr`, it can't return back to the normal execution. This is the content =
after I executed `qemu-system-arm -M netduino2 -kernel demo.elf -d int` in =
terminal:

```shell
Loaded reset SP 0x0 PC 0x0 from vector table
Loaded reset SP 0x20001000 PC 0x12b from vector table
Taking exception 5 [IRQ] on CPU 0
...taking pending nonsecure exception 53
...loading from element 53 of non-secure vector table at 0xd4
...loaded new PC 0x1c1
Taking exception 8 [QEMU v7M exception exit] on CPU 0
Exception return: magic PC fffffff9 previous exception 53
...tailchaining to pending exception
...taking pending nonsecure exception 53
...loading from element 53 of non-secure vector table at 0xd4
...loaded new PC 0x1c1
Taking exception 8 [QEMU v7M exception exit] on CPU 0
Exception return: magic PC fffffff9 previous exception 53
...tailchaining to pending exception
...taking pending nonsecure exception 53
...loading from element 53 of non-secure vector table at 0xd4
...loaded new PC 0x1c1
```

I wrote the demo based on those two commits

[https://github.com/hac425xxx/qemu-fuzzing/commit/609538e1407de884f6c9e4d](=
https://github.com/hac425xxx/qemu-fuzzing/commit/609538e1407de884f6c9e4d)

[https://github.com/hac425xxx/qemu-fuzzing/commit/7bc0e0aa35363c18fcf5b89d]=
(https://github.com/hac425xxx/qemu-fuzzing/commit/7bc0e0aa35363c18fcf5b89d)

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s


--_000_SY4PR01MB8581F06E9DF1FC1CB79F6E45BAB09SY4PR01MB8581ausp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi everyone, when I tried to ru=
n a exeception demo in netduino2, it can't exit from the exeception, in whi=
ch after executing the assembly instruction `br lr`, it can't return back t=
o the normal execution. This is the
 content after I executed `qemu-system-arm -M netduino2 -kernel demo.elf -d=
 int` in terminal:</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">```shell</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Loaded reset SP 0x0 PC 0x0 from=
 vector table</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Loaded reset SP 0x20001000 PC 0=
x12b from vector table</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Taking exception 5 [IRQ] on CPU=
 0</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...taking pending nonsecure exc=
eption 53</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...loading from element 53 of n=
on-secure vector table at 0xd4</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...loaded new PC 0x1c1</span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Taking exception 8 [QEMU v7M ex=
ception exit] on CPU 0</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Exception return: magic PC ffff=
fff9 previous exception 53</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...tailchaining to pending exce=
ption</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...taking pending nonsecure exc=
eption 53</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...loading from element 53 of n=
on-secure vector table at 0xd4</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...loaded new PC 0x1c1</span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Taking exception 8 [QEMU v7M ex=
ception exit] on CPU 0</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Exception return: magic PC ffff=
fff9 previous exception 53</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...tailchaining to pending exce=
ption</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...taking pending nonsecure exc=
eption 53</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...loading from element 53 of n=
on-secure vector table at 0xd4</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">...loaded new PC 0x1c1</span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">```</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I wrote the demo based on those=
 two commits</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[https://github.com/hac425xxx/q=
emu-fuzzing/commit/609538e1407de884f6c9e4d](https://github.com/hac425xxx/qe=
mu-fuzzing/commit/609538e1407de884f6c9e4d)</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[https://github.com/hac425xxx/q=
emu-fuzzing/commit/7bc0e0aa35363c18fcf5b89d](https://github.com/hac425xxx/q=
emu-fuzzing/commit/7bc0e0aa35363c18fcf5b89d)</span><span lang=3D"EN-US" sty=
le=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sent from <a href=3D"https://go=
.microsoft.com/fwlink/?LinkId=3D550986">
Mail</a> for Windows</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:SimSun"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_SY4PR01MB8581F06E9DF1FC1CB79F6E45BAB09SY4PR01MB8581ausp_--
