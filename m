Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1204255ejx;
        Mon, 11 Sep 2023 01:49:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUplmMUzjkrr+uf8sPk5BEhR2YlgE1JfXZyWv583ANKFfiCwDjTUjUPu6USA74UaSRBKno
X-Received: by 2002:a0c:aa46:0:b0:64f:72cc:4bdc with SMTP id e6-20020a0caa46000000b0064f72cc4bdcmr6745733qvb.27.1694422190554;
        Mon, 11 Sep 2023 01:49:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1694422190; cv=pass;
        d=google.com; s=arc-20160816;
        b=YDtCVoH7/H0ZmcqSK2HDwSUhLm5mNoxkONinyfUZYtLWoaPa9Vzd5jlmxTrCPURDIi
         /OP0biziZ/X2YwXKTM6d/opU0XGssU0Xg/2XGxI1wupmjLru4ofgvldEdbJDGQDKTSMf
         S9puLpzn77KQ/UILiNkixGFHRpDzwL6ke3UadGjC9+2+Hd/KuI9lSy3fFmT2OOBc544F
         X/RBOMFSL/3jmSYOzyhai7Q3en/+T35ULUJF3XQaRiCUaiYIVqG4/LIySgmK3i4Sq/uw
         rhD9vAhBWpB4fCT1cUC0A/4y0Y79uBqWmoIcxei6CEb/PyspZ2dbzziUNXNQTCmt+nQT
         1H0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:msip_labels
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=ncG56xeep4MBYh98H3R/z8r/+JMvAT8Z+Mj/dLzNRHw=;
        fh=6DuJomeI0s4RH+lcj9jEa+qEhL1bYX790hXPboLOuak=;
        b=ua9fQJ4Ikw2zwiBkouHLCaO23Ch/bTMeBIoZtrNm8MUFbvkZP1iTllKnsGYpiHm2KK
         cATCSD5333vARQxJR0aQ876OMUaBQ4FmY3BJl0GI16WMJhJYiBknTickKS9e0EIBVbcc
         exlCysBiI/UmVTkiNr+KcJn1+FJy3Tnnyeq4qiS9fyriUWt+j54aco6AO42JDIwP9Amr
         D7CPJbXWJZHtHwYZ22szn53gR2SxgN8ViK0RD/hCDfwzQt0u9lvESUuRk0dNBGhXJmhQ
         pDc8w15UMXhxhR1TDKonOVw+D88Z09ha/Ur4Z4WBYGrpVRXoivot5H2RCUTCdYD9P2vg
         Wb9Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@partner.jaguarlandrover.com header.s=selector1 header.b=AWDD3PAc;
       arc=pass (i=1 spf=pass spfdomain=partner.jaguarlandrover.com dkim=pass dkdomain=partner.jaguarlandrover.com dmarc=pass fromdomain=partner.jaguarlandrover.com);
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=jaguarlandrover.com
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a0ce252000000b006474060106dsi4443786qvl.272.2023.09.11.01.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 01:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@partner.jaguarlandrover.com header.s=selector1 header.b=AWDD3PAc;
       arc=pass (i=1 spf=pass spfdomain=partner.jaguarlandrover.com dkim=pass dkdomain=partner.jaguarlandrover.com dmarc=pass fromdomain=partner.jaguarlandrover.com);
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=jaguarlandrover.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces@nongnu.org>)
	id 1qfcbe-0008An-9z; Mon, 11 Sep 2023 04:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vrajago2@partner.jaguarlandrover.com>)
 id 1qfcbc-00082k-Ao; Mon, 11 Sep 2023 04:49:16 -0400
Received: from mail-vi1eur05on20706.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::706]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vrajago2@partner.jaguarlandrover.com>)
 id 1qfcbZ-0002gC-PB; Mon, 11 Sep 2023 04:49:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WO1W8AA7MScv9To/7hN6z4/5THuG766BzqNlR9M/9ZRwn5ddQs+71FORDHQAYpWTgXMu3YeHuvEHN1GKDEGqpi3xJmmmVm2TF81jyVJ5jco9KvJsC39g+pHlJMotWzUPpXBMx8l+VEoRbrn1IUtiSUWvg6ngwjBwSVJ52U/G8+B+AoX9SKvBXJRq/CY5utMbc72ZWCe+1R7ZCD3tMVRMVjzRrVc2HweiQuy/zmJ5Bjsyxo+Ho1Gpsp4DYje+z1bg/ADDbAB37U1OCWIbA2DUyUumy7CCuCGn+9SAs9j2Vc2K8WzfjvvsUKQfmiHvT4ldHvOTe7xTh2ufebaIzhdxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncG56xeep4MBYh98H3R/z8r/+JMvAT8Z+Mj/dLzNRHw=;
 b=cKWUnhtsc53EZcnJVe+CqMYLaB1YlRe7wEiYBpe2cpqXys3oLh7hB5S/5SnwfOfWm5vZH6FKxSEdJ9IQ+XXT/pp0Pmn5f2xZoy8oRfeSca8ljv8hL3u3dJa6bGpxkUPHyF7u3tKB9r7NYR2OPxdFAdytih57yEZxBYe4PcGWg4Bhn5HBGXjgpzvphnEZ2jVp2Hs8FGhoDsoA44+ew6FlLd+J//L5Jm9oSXefPJbBdWVa2TA6HZKH60mkcq2GtvlEWQ7YWbZANnbcL+/wJsF29CBhqSHKwEbqkWmqvtdsl8cEQsJdxEXj/DZ0l7b7la8su0CCWEgqkejjg3wUjN1MUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=partner.jaguarlandrover.com; dmarc=pass action=none
 header.from=partner.jaguarlandrover.com; dkim=pass
 header.d=partner.jaguarlandrover.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=partner.jaguarlandrover.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncG56xeep4MBYh98H3R/z8r/+JMvAT8Z+Mj/dLzNRHw=;
 b=AWDD3PAckzXY/jYuFglO1CZZLm5iM5qgMAibRSS1EMiBittqXYDI8nNeQjhkDlo4KGunYKwyvpEcO/Nvi1HQzNJC+L39+lGQgykSenv6Ci1Ly7RGBsRfoxlCGTnHqOuOcdGUhyeeK+IMK0ZA/OAjNn0lwId5owmhQL2nUV20yf0=
Received: from HE1PR04MB3004.eurprd04.prod.outlook.com (2603:10a6:7:1f::22) by
 DBBPR04MB7563.eurprd04.prod.outlook.com (2603:10a6:10:206::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.35; Mon, 11 Sep 2023 08:49:08 +0000
Received: from HE1PR04MB3004.eurprd04.prod.outlook.com
 ([fe80::b01d:5242:d569:d306]) by HE1PR04MB3004.eurprd04.prod.outlook.com
 ([fe80::b01d:5242:d569:d306%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 08:49:08 +0000
From: Vishwa Rajagopal <vrajago2@partner.jaguarlandrover.com>
To: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: Re: QEMU Virtualization 
Thread-Topic: QEMU Virtualization 
Thread-Index: AQHZ3xLZTzZ0qAKib0KeFzauEkj/67AKaY9QgArx5vw=
Date: Mon, 11 Sep 2023 08:49:08 +0000
Message-ID: <HE1PR04MB300474DBAFCFCEEF2ECEEF42D0F2A@HE1PR04MB3004.eurprd04.prod.outlook.com>
References: <HE1PR04MB300468172D98345307CA728BD0E9A@HE1PR04MB3004.eurprd04.prod.outlook.com>
 <HE1PR04MB3004E3AA92C6EE841D4A14F3D0E9A@HE1PR04MB3004.eurprd04.prod.outlook.com>
In-Reply-To: <HE1PR04MB3004E3AA92C6EE841D4A14F3D0E9A@HE1PR04MB3004.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none; dmarc=none action=none header.from=partner.jaguarlandrover.com; 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR04MB3004:EE_|DBBPR04MB7563:EE_
x-ms-office365-filtering-correlation-id: 86b9daa0-ccd4-4247-4b51-08dbb2a3f62c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AOmeTkmIcjCZmhuqHijkBc3UwnZ88WYUpCsLFClzmv52BEKfR8IvNvO65IBXcqHWW3kEpMl7yhlSpOGRaAOfMe5/vOMNkYeekaNJZwKyObT9xkcIHpMg+a4bkkJY0Qr0WDfIuIltAwBlGXuHeEcK3OU03/AcGjaxdKSRWHa6UNjBn9ZpZg2TUmgzMDwMlY9ZQJbjtQOqwzDIp06/xAfQFhGxggeZY4LfSM4ktkWm/vq09R2ipCuy/hSb0uulB12x07YlHNExaJM+EN5RkfgH+YSZyhVi//nnyMRYv3TzhnIGdpF4uS5avYjTwOxYA6nT8y/cZ1HqeCh8atEg2sx1umdULIEQs0UoqatocUYroQ6QscSLvXiTWGutYjESNCLRvYfU20EMecb9h/7rxC451nXWN5RO54jMFfF9TMDEHulvjF7t7AOjFCuKZHcoOGvVqXTsxAqyogAp2zMIcIMFgiyDJSgqsy3MYWtkGco/PladXG5yhrsFaXjJmBS0njjma7bqlWE8ohrVMgc8xqLsEFzxC+MQsOiJNhflM0sOPjjNSaY2VLxmpfSj5M9HJRY13kLyIRMOFMHSylLaQ3AYp3ERAmPCsAKuKnBx645IxQdV1Ywsgv0lz35x2JFZvCJ3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR04MB3004.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(186009)(451199024)(1800799009)(110136005)(91956017)(3480700007)(4743002)(26005)(86362001)(4744005)(2906002)(83380400001)(7696005)(9686003)(53546011)(55016003)(71200400001)(6506007)(33656002)(38070700005)(38100700002)(122000001)(478600001)(5660300002)(7116003)(450100002)(8936002)(8676002)(19627405001)(316002)(66556008)(66476007)(66446008)(76116006)(66946007)(64756008)(52536014)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EM9qCOM+9pvqg4ICCu775O4GUf8tJsBoLqC0LuRaN1V+jxES8CPcQ4GtZgWV?=
 =?us-ascii?Q?4AlvstsI2GhludC1kbyFBSynIZvW0LuOzYWGmh0OzB/QKmPLbRwMEXwymVYA?=
 =?us-ascii?Q?BeP/ZyHq6HuL+YEaG397rkRA6FtSPA/9/9Dory/Q2ik78YbEpqTimydY8Ywu?=
 =?us-ascii?Q?AJWMv/sXEAGTcs5+CKB/f9qRQnuWlhK1cBuCEKk1pNVKXvQmi7LMDWW9WBTE?=
 =?us-ascii?Q?JgMXhyVsHdR0OEdQZtTu9HiAV8JBpDZXe8xEZoe9Wez4oQjx50bhZCwkIWCE?=
 =?us-ascii?Q?Wy8kvTXggMnivYR6WD+cn6fHyXKadOA1yhSQLCvf9d2h1ebUVTx2s/fVmZuu?=
 =?us-ascii?Q?Dmm036T5tX+t5Clfr1ZULxAVHPPFEUIO0D4GIFCezti3tc3vIoITu54l7rB6?=
 =?us-ascii?Q?sdmsuAEaC50yEukree5vAYnKElIV63X2pPR9AkMM9CCS9ob1dtyciAKC63OS?=
 =?us-ascii?Q?1pifXEJx3WNxiG8g1QzP4wMedBbrAliu0cfmYZgL7ZQGCE0qSF8p4pLB/Chw?=
 =?us-ascii?Q?CFne0JwzxVCdAF5NvkBhiprlQ65jOVz+eOp01QitaDUwxzsfLQ5qeFy/0vSH?=
 =?us-ascii?Q?BdHinzParn1roZ48p8Pk2SfpfcAW6kvl30DLo4amMN5c7vr/QdRe4jNPcwF/?=
 =?us-ascii?Q?7AQfUxR2/GyPfcuRsDiWOx4JXn9hcV5t9psL8VtrC8igD6pnlz/EeBgAvQ7p?=
 =?us-ascii?Q?mWDQjseEIW5t327C50VlUTJFHELYaSXXW12LnMybGQjfO1emTmZZW6F2Kab9?=
 =?us-ascii?Q?AyWHU2N4cSJsEdcoSqpRs6T83X0ox6JhjDcWtOhr6hQ2gSLcfvAr+CMKSm/r?=
 =?us-ascii?Q?Q/iSTNRmkv0Bat0TrBSuEZzOCe20hGt6sJK3qmAfxyBMA22/aoqEiRgJf3Jm?=
 =?us-ascii?Q?10u11oBAVwohEeAdw7fA+5GbeXmAT9XZkIzavH6NVw1CAwUITt3dBmgIpkD7?=
 =?us-ascii?Q?3NmJ+oOo5tz4BjWA2w000ccoLUXvVYg4WxaisHBphiaud8khd/f6s+6QOoQ5?=
 =?us-ascii?Q?lQAQU11VMbD7fZoBRIRNw3eqNawm5nj3o6xYuyZ4cLDvcHbkOixxB2Nv184r?=
 =?us-ascii?Q?hOOsRlAmdwvrIzQ06/fjwxZKWhoRq3hPd+vX/KVVveVlLVe9IyPAZNeyZqYe?=
 =?us-ascii?Q?AXYcteqLy2GlJorX9+r9+ouY2piC2tl6WwiE+vmBUxLSSrp60sTVWgCqmyhe?=
 =?us-ascii?Q?1EN81k/2clIR23BblwLHTcXNVyFGHvHcCETaGpNWruinEe4ETWXWru3plTlI?=
 =?us-ascii?Q?rajP1GtgB5c0AvmDGefoT/i3/WoYLTp9CN3yiQtEQ3NFoyKiOftBVkw/c6de?=
 =?us-ascii?Q?DdvJSyfqHpGrZXh9dbaxYw4zvLjQbObPHExug37+igQ/j+GBuue42iIaLMj7?=
 =?us-ascii?Q?3hcMwyCmbRMSMX2SUu3RQD61OC55o69yxn6jBRMzR1iH7OgDJs9qmudeTo51?=
 =?us-ascii?Q?IZeOmGdSTYIg3YocTAE3wviGhM6DAq1BixxGv8uKeGskTpbzAHMxKfWdIDug?=
 =?us-ascii?Q?0oHMp7I35+rfyLs6HuGqnF++rB1XwzL1p/WanDrwAe4DtjfDOTo80wqqf++1?=
 =?us-ascii?Q?m29oCNr8Q+8mkl6wLGDpwDCCudviI513veYiQhQN?=
Content-Type: multipart/alternative;
 boundary="_000_HE1PR04MB300474DBAFCFCEEF2ECEEF42D0F2AHE1PR04MB3004eurp_"
MIME-Version: 1.0
X-OriginatorOrg: partner.jaguarlandrover.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR04MB3004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b9daa0-ccd4-4247-4b51-08dbb2a3f62c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2023 08:49:08.2139 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c087f80-1e07-4f72-9e41-d7d9748d0f4c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9MP3AYIB+3ARsnYFmaV2UJDX1EhPciZda8gPOcV6/3Qd3Tq6ufiNspEfPtsnic9Y3DeDUVMWRbZmZOlslESJDcor7Rt/KjbJqMgD1y2DbFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7563
Received-SPF: pass client-ip=2a01:111:f400:7d00::706;
 envelope-from=vrajago2@partner.jaguarlandrover.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +CXvYwAPuLh4

--_000_HE1PR04MB300474DBAFCFCEEF2ECEEF42D0F2AHE1PR04MB3004eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

GR!!
________________________________
From: Vishwa Rajagopal <vrajago2@partner.jaguarlandrover.com>
Sent: 04 September 2023 15:10
To: qemu-discuss@nongnu.org <qemu-discuss@nongnu.org>; qemu-arm@nongnu.org =
<qemu-arm@nongnu.org>
Subject: Re: QEMU Virtualization


________________________________
From: Vishwa Rajagopal
Sent: 04 September 2023 15:07
To: qemu-discuss@nongnu.org <qemu-discuss@nongnu.org>
Subject: QEMU Virtualization

Hi,

We have quick question on virtualization. we need to emulate Samsung exynos=
 v9  board using qemu. could you please confirm possibility and procedure d=
ocs.

Thanks
-Vishwa R

--_000_HE1PR04MB300474DBAFCFCEEF2ECEEF42D0F2AHE1PR04MB3004eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
GR!!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Vishwa Rajagopal &lt;=
vrajago2@partner.jaguarlandrover.com&gt;<br>
<b>Sent:</b> 04 September 2023 15:10<br>
<b>To:</b> qemu-discuss@nongnu.org &lt;qemu-discuss@nongnu.org&gt;; qemu-ar=
m@nongnu.org &lt;qemu-arm@nongnu.org&gt;<br>
<b>Subject:</b> Re: QEMU Virtualization </font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Vishwa Rajagopal<br=
>
<b>Sent:</b> 04 September 2023 15:07<br>
<b>To:</b> qemu-discuss@nongnu.org &lt;qemu-discuss@nongnu.org&gt;<br>
<b>Subject:</b> QEMU Virtualization </font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_x_elementToProof" style=3D"font-family:Aptos,Aptos_Embedded=
Font,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; colo=
r:rgb(0,0,0)">
Hi,</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Aptos,Aptos_Embedded=
Font,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; colo=
r:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Aptos,Aptos_Embedded=
Font,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; colo=
r:rgb(0,0,0)">
We have quick question on virtualization. we need to emulate Samsung exynos=
 v9&nbsp; board using qemu. could you please confirm possibility and proced=
ure docs.</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Aptos,Aptos_Embedded=
Font,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; colo=
r:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Aptos,Aptos_Embedded=
Font,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; colo=
r:rgb(0,0,0)">
Thanks</div>
<div class=3D"x_x_elementToProof" style=3D"font-family:Aptos,Aptos_Embedded=
Font,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; colo=
r:rgb(0,0,0)">
-Vishwa R</div>
</div>
</div>
</body>
</html>

--_000_HE1PR04MB300474DBAFCFCEEF2ECEEF42D0F2AHE1PR04MB3004eurp_--
