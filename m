Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4910955lfb;
        Mon, 30 Nov 2020 00:53:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBmORrSO+xFJ9r0fmbxooEuXsun1ppTFiNuUXhniecDuPsl2gNd2W3bAC6FwQuNG9K5OEv
X-Received: by 2002:a25:7711:: with SMTP id s17mr27248458ybc.283.1606726380164;
        Mon, 30 Nov 2020 00:53:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606726380; cv=pass;
        d=google.com; s=arc-20160816;
        b=uTPmfh7tEOSCslUC0qer91pVQBKgxWMCAfS98i/kk7xN1WKkApI7xQNBxBfJh1lUI2
         ZDka/OBphuXOMz1mPYCmjBc9fE0ZIEOVXv/LI4a7885kySrxpma0a42RCJFNEv2rWck6
         1Fvos51d5BQuj0f8Tbb9+KTl/Cf5QFpxrs4GGbjr0rRsAcB1Bm9pJvBcKlubSv/43kb8
         Hm5QU+BmDVy9xSYNu75M7PmcDedDoGPmTXxnUsl6MoxZ0DwgqSsaz3zmzWMyShkPBPJ/
         PLD5GFsPfaqdOuCXA2mKVN6Xf8dE1m8ZsZiYaZYfDgPe43FfIUh6nNfV4o0jyFo+2QTr
         8BwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature;
        bh=uhsB+HP5qFOyGhkurmoIx0dbHAt9Nnws7dExR/R6xl4=;
        b=AP0gJFgwwvD6IMkTpy/VeIrAMvFGBTfD6OLqpKBrXwmnHYDdAGJXSI9Cri9SuTkDkJ
         lDbI1Sz1PDjkua3zuhfbVpP3PWI/DV6R6sJqCQ4RQzdBuGeDsjYLMGAu5S6KkkC9Q1ou
         KGhPgBDJMOOFWyddqRIiEKgXws/ra+t3jlI303QuSMHKHBO1yqWP8yLoLafrkMQBS67m
         dY2E5IuB8MURoJ51zatzI7l8MnSsEB/mepRjWuZqX/us2YJYlnS4QsaiqlkLwWmdci4q
         RdufzjaPE9bN8SvzVYiJZjh2fo5fGWvTeVxIDO8hgb5TTdBbxbq+RhnM0Kb2m+usTthl
         DlQw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=SyqUlU2F;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d196si16669294ybc.7.2020.11.30.00.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 00:53:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector2-NXP1-onmicrosoft-com header.b=SyqUlU2F;
       arc=pass (i=1 spf=pass spfdomain=oss.nxp.com dkim=pass dkdomain=oss.nxp.com dmarc=pass fromdomain=oss.nxp.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjevb-0000fC-J9
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 03:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peng.fan@oss.nxp.com>)
 id 1kjevT-0000e6-Ex
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 03:52:51 -0500
Received: from mail-eopbgr60082.outbound.protection.outlook.com
 ([40.107.6.82]:6214 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peng.fan@oss.nxp.com>)
 id 1kjevP-0005Jh-Ko
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 03:52:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyaZxgWWsl4FPf37BH6D/VjX1/Ln/LtLvdssajOoluK0tLwBDOVWkhRYutRAjQf9igipp6A6OniA7G+cmI3JfGZZaKG3bIQxC3AkiHR2L7i13LsXQSbES4aNdoNstQy0ObJz8JpALPONDLDbKeEPCNVxRD+96Dued+cX1Mr14FR5E5bCgjxHu8sOkd9TJAneDZYJAQ2BvA1/Tv1h9wVSmaPHnZ+YGYVbEr3Tas+MfeEvPjZvPvUkkLV/D29pSP8RaJEz2qptnrMI8vUjdmC8ll4tlncdI+Z5gIjWQsBat3bggjt8O8a3WGH64Lzm9T+PcSc89KCp/6fvRCkspjgKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhsB+HP5qFOyGhkurmoIx0dbHAt9Nnws7dExR/R6xl4=;
 b=Lu+rSy7HWm2XfQI9UaaZpluegU1axtYPefZfd/MoQRuIJb8917HAhxAJqE7XAAKMeArsGD/Q5IJzqxSGYkT1KM8Cl2GFp/Gou2tpy1RKqahrsGkaqguRJRJ7gWTwwEXBnx85T4jFgIfdweZ9QU/BAbxecXBHZs4oiclHsirfHjeaZKuMyoDiU/ex+ocvcnoq9csMjUVQHp35mp9M8HPu+Xq2JZE9tz5MRGBl35yPAVj772KvTo/HEyvrKg5rSdvfII73KojXmyGFTsZnnbrfXfH0+UuPsPFviAqlbJDxG3nHfTGjSgI8hJYyj3PjmacZY73tyxCcEogxP9vwuO/GNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhsB+HP5qFOyGhkurmoIx0dbHAt9Nnws7dExR/R6xl4=;
 b=SyqUlU2FaX7jrJWy7YwhjEHbbzYfCOhSzXzf2LfFEMIH9BDo5uswtrpxicQMvl1ixthxIQvJoajj11SiFLbVA7/p8nt9q5zqBxBU1oEcPx32LT8+stmmuLGGYaPXMKj+RjylJ/8ZDat0/SvQbglWkJ1YIRr+f1qChuzONlU6RiU=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4089.eurprd04.prod.outlook.com (2603:10a6:5:1b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 08:37:40 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 08:37:40 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: cortex-a55 support
Thread-Topic: cortex-a55 support
Thread-Index: AdbG853LKtygIRl8SkGrOuK9v1Vxzg==
Date: Mon, 30 Nov 2020 08:37:40 +0000
Message-ID: <DB6PR0402MB2760BC8DDC21C1FE1E0C568888F50@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41f71006-81cb-4695-932b-08d8950b32f8
x-ms-traffictypediagnostic: DB7PR04MB4089:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <DB7PR04MB408913C4ABA4DAB45F543C22C9F50@DB7PR04MB4089.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FmPWHwAYEBWE/klEgptjK2vaxMiaKMWp6HH3yqx44G3FiOfAVGl11SkwLoZd8pJwi4Pueo/+XOHL3GY/cx/iJef6SpAEey4adVAeeb04uvz8IZIatBGVnWVWDKBWySl+WqpHh1r6QI2HTa1bVXpVnsTxS2XaSRihqBOwQgMtc7Pr4etti88/DE3nHMELNpd8HU1Qz9mDIRJE3dkmdc3eFtI9F213pi0IHoPCung8jmyB/xzfmnpITyyKdzNg9iAGVbwioIrAAVud8OdYyMMkGkSAiw5gBbzGeEtF3VaTZIalbrjGgGcyNxFLyiKYiBdP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(8676002)(86362001)(478600001)(7696005)(66476007)(52536014)(186003)(8936002)(5660300002)(558084003)(33656002)(66446008)(66556008)(6506007)(64756008)(71200400001)(55016002)(66946007)(9686003)(76116006)(316002)(2906002)(26005)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ACRYvJR5rI4gQPgb2QWxmWcLQUrNuU0rI3RUOvs2IJdkQSRHGIEMLQLu1Yut?=
 =?us-ascii?Q?h0XHonM5Iff81gxC0x2OurdLdQ+TiQW9lTB9+GKbC3S9D7I70qaTa5Ya7hP9?=
 =?us-ascii?Q?eMkyN3AxApqJUwAKjPl/RcauSNMjkq6mhIujlZQ7+jygekjN/YGqkVhWsJlY?=
 =?us-ascii?Q?VHhif891wFDLQTeisutEeD1RbqRPM4IsjI7PJOEkp18SGhAAK+LUROMa4Z96?=
 =?us-ascii?Q?Q0Ciq+63lqcdHLwMj1lxp6P74SShR/m7DK7b5YB9S9G4sT8XkSuUpQOQq642?=
 =?us-ascii?Q?5P62VJkVvguySfFJO7ShQOoyI68IU1nDOhyx2aLwIzJzuf9GBEENF33PGPqT?=
 =?us-ascii?Q?Nh7ao5zHLcyU563wTi8GsfcVl4eouBNomxFjdCqERwUeOYa5MfoKBo9D7TjT?=
 =?us-ascii?Q?9cIVk+tnnPm2JTxcbAiyvbnc0FZGoeB+AOSQx/0Dg/2ZIz5p9GkzPY1CfOvY?=
 =?us-ascii?Q?mjV1uAXzj9Y9/yLGieKJUADlAUyqU6xBASC3x4WkxMon05yC7ALoUljm5SVF?=
 =?us-ascii?Q?iejLYsSbqTRpzYL3OjpQDDlq9IIQzMhaXTzaUEn99UYPar4m55qddS8Qehx1?=
 =?us-ascii?Q?PJM9xtPLANBhXOROzS4Duf+V2PDCshyRW6F9WAMcPoPBtzSmsDrYMqk0rLaw?=
 =?us-ascii?Q?TRQyFmkVVFuZLfcp3QFEPreIk58oBC89nQAFDKBauTLjk9NSUwpyLSM2CMzL?=
 =?us-ascii?Q?obTIm/FyS7vFCoB2EaPVwk61+ppKEvLcW2Hi1bpX8kLOcemOvQGQbd8oVxLS?=
 =?us-ascii?Q?/JblsPX+uhtP0WYlIwaBqhezkKhMWfDslrYz69Q5PJ5l520DAwcBV3k3LKku?=
 =?us-ascii?Q?XdkxP/ICcoQuR8SzxBAYXhFgZVQ6NWfD4xQLK8ON3J4Il5XIATaD20Pq2SV8?=
 =?us-ascii?Q?7G8ytaWdGXGsgMLEy4chkxY4HWci+iKLCEw1FGrqiTZC9IZBWyK4KP60+o2e?=
 =?us-ascii?Q?QF1jGz5KjjrF6i2dsf8HD0Aks/HWRfDg344qj2CmkG4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f71006-81cb-4695-932b-08d8950b32f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 08:37:40.3926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aL4UtU6oHGM13PdheGazpOe5ItY/gcQSWAKgBnZWx8sGJaiCU6kFQKaf7FOhTRfZ8bCP95NDoDb9CFq7NucQXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4089
Received-SPF: pass client-ip=40.107.6.82; envelope-from=peng.fan@oss.nxp.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Nox0/gUJpBiz

Hi,

I am thinking to add cortex-a55 support to qemu target/arm/cpu64.c,
Is this the right way, or I should use cpu max?

I am not using KVM, just for SoC software emulation.

Thanks,
Peng.
