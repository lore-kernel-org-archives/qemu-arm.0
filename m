Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp949516njb;
        Mon, 26 Aug 2024 00:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWTYWnQff3cvzaKE3ky6ZUWdjdlTx/hi8kh4mKRrhtWv/o7UQyJwrFYK3/MjE0nDfxkZ7CeYliU+dc8Uw==@linaro.org
X-Google-Smtp-Source: AGHT+IHrx8JUMdjyp7f8cWXo7sxG+T6XMv/PXja3aZgkQA48X8VHU39RfSvYM5bJzMpFchkbTnzF
X-Received: by 2002:a05:620a:4052:b0:7a6:6b97:4da2 with SMTP id af79cd13be357-7a67d3fdc92mr2274342185a.11.1724655891816;
        Mon, 26 Aug 2024 00:04:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1724655891; cv=pass;
        d=google.com; s=arc-20160816;
        b=odatx5H9lU3z8EIqDvMAXJGmDlvmaXMYgvJ18R1A0Ds0N7W/3u2w3SxlE3wN4Ke9tR
         0OViVL7SoPXVALHSEA//e7OWT17/SFWK+VmJqjQcZFz++minotuhBJRdL4kgV+CEJRPk
         zbX900OLxf09fdQLxH5u9Kln25lMs51E8xYu6p7YMKGvwO26U98hYNY1GzHislGFP99Q
         PioQhXmXAgzl/P6DtV40PkmAY04LYplBsrVpzZe3vzlV4244fJ82IDUk3Pfkhv1BnD94
         FMkpcVczwoLLBMEUqULAAXdaI3cneDWz3w/pARRk1djqt70skR/ALFUBoiAnZNYw8Tje
         Tw0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from;
        bh=PamldVx/NzHOUj/US4VKgAo+rBCvB/CG41kWWAztQrQ=;
        fh=OhhDyosO++8kJ5pj/gx18JH1E/ywoDMa0eNhDO6JoSs=;
        b=cwLD4zZntpouU4k7k6IblaX6BNIOPt5Zk5XTRSbja34eXEKeLj+saydy6dEqYM1g4/
         SdcQPiBpW2Y4V0u1vIX7fezLREwIAz17cJfiSqIipwbtifMOPbn/KHh4NR6RUSmU0G5/
         mq1/jv4rKXfTLZ7v+ES9gS3cRTPBIWfe18mK8V44hS2QAF+VhRu1WMjW28BCkuJaHa3u
         ZCK9Cwb6AmCYDg107wGopg272hBkl93QWUIoM9M+LTsTBXcclieB+/DTrd6Nd0z16Cq3
         FvYlL6T52NcKq3AputSMRa51GbrOCtgbwkVGiyKDiOjxMoVLeKfbNtEXe84WsMwshK1Y
         09aQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=starfivetech.com dkim=pass dkdomain=starfivetech.com dmarc=pass fromdomain=starfivetech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f3cf73csi993790685a.286.2024.08.26.00.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2024 00:04:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=starfivetech.com dkim=pass dkdomain=starfivetech.com dmarc=pass fromdomain=starfivetech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1siTm8-0005aW-G7; Mon, 26 Aug 2024 03:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1siTm7-0005Zd-6g; Mon, 26 Aug 2024 03:04:27 -0400
Received: from mail-sh0chn02on20731.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::731]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1siTm4-0003oI-9i; Mon, 26 Aug 2024 03:04:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V59iTzxC9P8b3fJqnRU54Hcgl5A4dFylYebLU0AhJl2YkPXn0SuhrPXzAK94Nph2LwqvK1fgSIwGgqEdInacubz9GW3UcG2clJtVjXabPULrrzMk1SvTRxIwDh+7T36bNRdOvb2hm7nNFOgIqPijrnpt0DpLHKONCRg9saF5XeDmC5G8S+HChcR8iaOszF1HhuRizNy3rTAnCvWHquTpkGqHmpwIYaQ/Ge7oc0ZF4WivLYE+WkB+LWFaVBtzdhnLBJdU0ss3DPBxVg22/KecEKhN5bZEsPdJSf5RQow4l9LNKe4QY2gUdUJczg5+dxSCo+sUcRcp1/JrgMb6Veu/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PamldVx/NzHOUj/US4VKgAo+rBCvB/CG41kWWAztQrQ=;
 b=I63V+7xL+DhCQhos400ANWvEwmrN97xAVQiYad5VGA+EqSi9RkqpL+W6KgDmtPCn3Ek4Rf1igr+YhjesUb8sfPD56osQQs6OshofaHLvx88GzcsokioeTMQHyzEKiTt2633hKe+HMkpW5B0k+TvKhakXZYOEJvJ9OkJmz7kPPc7LGRjnMFSo0buSjZENnreuYMPxkoaI4s7UG3iHpWCxBtHxj9zNhOulFQ/tar57B8vcadRxiwZYmmOlOmpfP6hplWq/hpB95mUcQ1UZa3aCS0qylcyuAq8+VvBM9a4dgMsVxCzIqzv8lz1HcsKbnqqqZt3KjRTwGgpwujdeT9ggkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::10) by NT0PR01MB1327.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:10::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Mon, 26 Aug
 2024 07:04:11 +0000
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 ([fe80::affa:7fe4:57c8:11ce]) by
 NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn ([fe80::affa:7fe4:57c8:11ce%5])
 with mapi id 15.20.7897.021; Mon, 26 Aug 2024 07:04:11 +0000
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Sunil V L <sunilvl@ventanamicro.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "anisinha@redhat.com" <anisinha@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>, "liwei1518@gmail.com"
 <liwei1518@gmail.com>, "dbarboza@ventanamicro.com"
 <dbarboza@ventanamicro.com>, "zhiwei_liu@linux.alibaba.com"
 <zhiwei_liu@linux.alibaba.com>
Subject: RE: [PATCH RESEND v4 0/3] Upgrade ACPI SPCR table to support SPCR
 table revision 4 format
Thread-Topic: [PATCH RESEND v4 0/3] Upgrade ACPI SPCR table to support SPCR
 table revision 4 format
Thread-Index: AQHa9VATullMknu1c0mBI+U6CpILCLI05waAgAQ50qA=
Date: Mon, 26 Aug 2024 07:04:11 +0000
Message-ID: <NT0PR01MB1278D6E5A7CD617D9783C7259C8B2@NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn>
References: <20240823113142.161727-1-jeeheng.sia@starfivetech.com>
 <ZsicubCBw2YAjq9c@sunil-laptop>
In-Reply-To: <ZsicubCBw2YAjq9c@sunil-laptop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1278:EE_|NT0PR01MB1327:EE_
x-ms-office365-filtering-correlation-id: 95b503dd-4f68-4837-26f1-08dcc59d49d0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|41320700013|7416014|38070700018; 
x-microsoft-antispam-message-info: 3EeC1FLXedRNcBWqIQSlrLb4lhXTwwdvpgO7IL3ojUbWotlBhEYnG3gMFIL3lNGH2+XHvbTlaeuHAeYCt0T0roC1BPRDdBUcRJHEPr2Z1dkhwsNxYvaI5cyVT8sPkQT8u95+WvlZ8vDOGfdMbOUH/xQDnb1CouXdJWZag5YMeTY7I8nuNnW0vsyKxbZF1RwjQlxPO79i5IaL5SfNT4qSLtxYgpzel1lYFoJX9UPFglfFMubAkTj1zzT3pqIYLp9eFpQpXqAcq9ZbshzDxz1l/01JYKTgENulMTV+XJML/cEEjqNeIJtlxSid52Eh/muHhsJw1nqeD5+iEY/Zsiji8pvwlAfL8gQadxtwQPRqwcaZfM4uxrHvcSH+dJ3JaUcfhTX4UQ4Fy+BIy9Pnw56DjRkqpG0Z7tEPqIOPEW0AXxGurPFCatFQHqdEBIS/VG0gT9Pb+XPEpPrbOMmbPmdMDvmVXgdgLIv1gSQub0vhIxCNsfp8Axy3gYqcW7CnuZFG0tzbjw1i5OqlNJa59UJYCilV+wtpb2itGc5dmvlCMn7UfK0qX8bRhtccMRUke1taK1oNXCb+DwAD7Ve07VTdMtNGDM56vTOCuibcy6T4s35UaF6cdhEJSVrOnX5GYMVO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(41320700013)(7416014)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jEMtbYhywOibiQ2PHHpVmLIpXfzUUXn3dr39i+LEiuTB8tCxQIy+nmIvzt2x?=
 =?us-ascii?Q?K/lVBhUBEt5/Y6r/BgBC1H35ETWhLjQi2iVe8XUGbDO11DdkA5GTgNaQWBQ3?=
 =?us-ascii?Q?pJtQXgFnzjZr/yH8HOW5e4+Wq4pataTooMX5AYdHWYXDV3BdorpFkOFyLi13?=
 =?us-ascii?Q?H9xaDWdN8osVOXry2jOUjKO+incqFgqJ0sd07IRa6ENpWDk3dTJv1lM3XAZC?=
 =?us-ascii?Q?HvSUWfOpaC+4sRYeoI9ngpvOMv5LB6HMLFTG0TmnDZOYad7l5FdXS81qhJrb?=
 =?us-ascii?Q?OnqGeEhok6PY1J/tJGFjuPDsKKxTe+v6WIYA33KbV6S7Pls4Eo40sTaO7jGs?=
 =?us-ascii?Q?Wn2kugLCJScFJBPCu2ggdhzjLKAvqJQ/p7jvcLFk0hQp/lTR/escwLTF14yU?=
 =?us-ascii?Q?9PUXPB6OIsqUzD8x+3R/zpTUdxT9fQwSL75ZWywdTeRXIq10ZmfeudvxJ9N4?=
 =?us-ascii?Q?GuBBpuapYjM+lXfog9TOYoIsZf4uS5RgmwGhNZq5yEV9C9Zcwa3D66ttd/r+?=
 =?us-ascii?Q?lXOf+AFQfr+o+DUTu1RZCeMT87PSIea3ZFA9RzM10n9On6yn0N6csSFRWHKw?=
 =?us-ascii?Q?rTfW00X6KMGP82b38S8RvgpyFxPBE9qgkYUSG/GSsWaklb/hBBiZq9zV2iWK?=
 =?us-ascii?Q?29seEprWYwyB//hny7mPmHUCfsxML5ClgYeZrQPPmGpYJBRXj7hBt28N2QK+?=
 =?us-ascii?Q?0r+vGdEgxr/cVjIG2dpf9W9l3rmacio9pLjnEdwGgKjDRgNShhuGGZUq+OKk?=
 =?us-ascii?Q?J3TzCiedcKdvsQ6t5taSgcGb3/CzP6NK+QNpSRh8xIOTVfXdokaC/g4jTi/y?=
 =?us-ascii?Q?oEAGcd+Z3gIbZ5w5wxPm6PtPgFmQVejqIMvfD+wct0uwqANv5+Tc11K6tSvt?=
 =?us-ascii?Q?/EGFG3BzrJZ1QmtA1fZXD0DG6CaFk/vcwmOHCIN4NtQd7LB5wLV08lTCEAFR?=
 =?us-ascii?Q?pXxPsICy/82RE452Fc9vvbySvUUI0yt0KH8RLEqu0GosyCpd6RUc8G3mYiaj?=
 =?us-ascii?Q?CwpcU4Ytb2v0mda4WHHIFvjhNgP0eJb3wS4T/ri9eJre08eZyTlHfjJ00x1c?=
 =?us-ascii?Q?Pc7y5zkMNvQjoG7vxjycNzztRilaN2rD1M4GBy6loAOn37+37PD2qiuAODvf?=
 =?us-ascii?Q?bZFNTsYWiIxAaZ+k5PFu10LoVSCeaI+TQdOZwapfcDfT0cN2SlJoU2xpnuDi?=
 =?us-ascii?Q?Nj7qzASDhMExNyeVnSPD5TxKvkfrWkVBNNAHqWfr+tT5GdDdbSQ783Pmlq9k?=
 =?us-ascii?Q?OUprV+8aoL5Rd4vBF97OSrWsiVPdsYAt6C+3eTslBsvbvw7keBp3F6QQDgRR?=
 =?us-ascii?Q?ofOeY8KaxY2JrPXthL+IBhjcay2CbUFk267TxVbxgwmnNF8TjXmSX6lQhr3L?=
 =?us-ascii?Q?X9Jn2XzdwcqqxWKJUbBx9nRyog86ilvjUwEq11NRrI7tzF4a3X+UsD21UJ21?=
 =?us-ascii?Q?qKWO9/fQ5i3hEB4a9rTH0hSR+VB6ODuKwdxBfyYv3V29YNJLulR1EbWCMh3W?=
 =?us-ascii?Q?vK3g5stdXWZINIql3cFhleVkesLJo0WcLV+Js+jmH9jPJBdjEhAKWmwmT02s?=
 =?us-ascii?Q?IL9GDkq1jG3KvHfGVK7nCZ5oA9Lwz4OWr7bCkHhcfGziS5LwlmufrUfPV5S2?=
 =?us-ascii?Q?Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b503dd-4f68-4837-26f1-08dcc59d49d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 07:04:11.8070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vw8fB9DosJFkvL6d1pnKaBAmRfPTJ5uy0E3Oo9jIBEa0yNCFgDUoE0W7dnfrLMl9BlCF2j8AX0l72scij4d1s8OL4wMVjTqOSkTI6kOhtjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1327
Received-SPF: pass client-ip=2406:e500:4420:2::731;
 envelope-from=jeeheng.sia@starfivetech.com;
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
X-TUID: rhAmvsK8BDYP



> -----Original Message-----
> From: Sunil V L <sunilvl@ventanamicro.com>
> Sent: Friday, August 23, 2024 10:29 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; qemu-riscv@nongnu.org; ms=
t@redhat.com; imammedo@redhat.com;
> anisinha@redhat.com; peter.maydell@linaro.org; shannon.zhaosl@gmail.com; =
palmer@dabbelt.com; alistair.francis@wdc.com;
> bin.meng@windriver.com; liwei1518@gmail.com; dbarboza@ventanamicro.com; z=
hiwei_liu@linux.alibaba.com
> Subject: Re: [PATCH RESEND v4 0/3] Upgrade ACPI SPCR table to support SPC=
R table revision 4 format
>=20
> Hi Jee Heng,
> On Fri, Aug 23, 2024 at 04:31:39AM -0700, Sia Jee Heng wrote:
> > Update the SPCR table to accommodate the SPCR Table revision 4 [1].
> > The SPCR table has been modified to adhere to the revision 4 format [2]=
.
> >
> > Meanwhile, the virt SPCR golden reference file for RISC-V have been upd=
ated to
> > accommodate the SPCR Table revision 4.
> >
> > [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serport=
s/serial-port-console-redirection-table
> > [2]: https://github.com/acpica/acpica/pull/931
> >
> Just curious - whether this needs changes in linux side as well? Does
> current linux code work fine with version 4 of SPCR table on RISC-V?
The current Linux ACPI Table has not yet been updated to support SPCR v4.
However, Linux RISC-V will be able to use the information in the QEMU's
SPCR table to boot with behaviour similar to ARM.=20
>=20
> Thanks,
> Sunil
