Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1452577ejb;
        Mon, 4 Sep 2023 09:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzcjDiq+QiMJ/us/VSoS19L0ThoBziIugo7zSlOywRrUQC2DlxML/EXEMHUSyj03sPqL7G
X-Received: by 2002:a05:6358:3389:b0:130:faea:a81f with SMTP id i9-20020a056358338900b00130faeaa81fmr4624707rwd.28.1693844947861;
        Mon, 04 Sep 2023 09:29:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1693844947; cv=pass;
        d=google.com; s=arc-20160816;
        b=YcH0ERCmMXFQVPLpJPM0L0qJ2gSLUOmvg3wgzN4bSWsGVP+zKRsUcHsDE6RvDY6nNp
         V2XA1ZbiyCdycALLW+FxKOq0aqkMU2/+B/EaGipGvshcnrfVp/7V3BlzThB6bz91N0gh
         C5fSTOILR4vGnBJ0C2uesv5lDYlO0OQGTesdet92OKU/Msh/V4p5MIn9wC81rPUN7TEw
         M8yWbcaewr6IllQ0sVvKNHOPqAOs/864OsIN9UQoEBOE4SdQFTSHe/hmYkpmP5JJpLg7
         dXpmymUVCVOKPpltt8jkshCswdTnEE5LE9YmVlcKOmcU5UAxgJ56kg4dh8752cEU/lu8
         ihVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:msip_labels
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=odZm86Ou6PJ9Kbit1PZmTIZDoayntvcBWsDfAHJ9ObA=;
        fh=6DuJomeI0s4RH+lcj9jEa+qEhL1bYX790hXPboLOuak=;
        b=n0NHaJwoMWuQF91SK8cyjBzIFwUgobOZNJ/wl2JwWdymraCUqt78SF6w4u5JPdNq8Y
         A+39HFytMZiIgcTjgv8GBOOxCPec7gnwxbxSERQel8C7tCg2MfcyxBzH3S9JKcOWcrnv
         KniRZ+/7eBOLBiTx/Vz9/Chzx1lIy/T6TD3dveQNSyQ793slcsFHLRECuCdKbttgYaux
         IAlTjpR7Z9klk5PVaNgJ+XRChnTyQoJWf0uISbL42TSTHLkUTImfkpIjXmASpnFnRIYe
         Fgd7gIL56rIdPJaFdaVcI5xvV8xh2r8+p0YHdCW5Y4BcIGel7eNy2VcGh9hvAhhVXflu
         dcUg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@partner.jaguarlandrover.com header.s=selector1 header.b=npOxfwfH;
       arc=pass (i=1 spf=pass spfdomain=partner.jaguarlandrover.com dkim=pass dkdomain=partner.jaguarlandrover.com dmarc=pass fromdomain=partner.jaguarlandrover.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=jaguarlandrover.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a0cf1d0000000b0064f572b3e29si6527862qvl.417.2023.09.04.09.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@partner.jaguarlandrover.com header.s=selector1 header.b=npOxfwfH;
       arc=pass (i=1 spf=pass spfdomain=partner.jaguarlandrover.com dkim=pass dkdomain=partner.jaguarlandrover.com dmarc=pass fromdomain=partner.jaguarlandrover.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=jaguarlandrover.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCRX-0002Hf-Rs; Mon, 04 Sep 2023 12:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vrajago2@partner.jaguarlandrover.com>)
 id 1qd64r-0007Xs-1I; Mon, 04 Sep 2023 05:41:01 -0400
Received: from mail-vi1eur05on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::70d]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vrajago2@partner.jaguarlandrover.com>)
 id 1qd64o-0002vT-2b; Mon, 04 Sep 2023 05:41:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ims7XsIf7C1Lq7ZscWoPwJkDGSOVnQadYk4Y2Wikp/3/TC3/808VVAgTvdhAQP2xQQosSZZC8D2EKisJIzooiMr8lyz7JHjcMGGHGsC0j7mXQxObBTFne8qwsFVugx+Jp7ivFS5/tqoHiDss4Pj0YqusHV+FDX/9zx5PtBg1wPjejzvtg6yOeDH9+xmu8gIvdk4XFaH3lur37z3BjVLVtLBvl5jFUN9yIYacBpAAtJ7elbmUeD1E0BoSHlKXBTsIFrjIPfu0Kbu+DLfCCJecNVh17ZDdVmhGaG9b04ap0w/ynR7rOhR0xB/15jKVcXcs2ANwAkPNfQmoG9FVEyzY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odZm86Ou6PJ9Kbit1PZmTIZDoayntvcBWsDfAHJ9ObA=;
 b=CvWBvGMLnNjyCCgfAjKVTDAuE7t4/zCV3iV1KslnH/w7yAUdpjlNFpPnUtH66i81eJjHgzxmgO886q5Pf+bkFaElwkF6RQysIfkR05JzaUKBSJpd9PQE8neHaltak+veaaJxgQ5ut4r+JVj3E7ZmKDowZ+0ZoMRbZctnkCtBr5MXWkecnjMEIaxtJswIEzOQWvj55RhTAPjziMJI7znlswbiyVTUAHWZ159t+pGjkAY/2cw3mL+uhvKOK/pxQc9wPCrASaaqymQcCr/jyouo16EXRKWUv4UksyRMn5KSgiaAl1v0Ao6Tt6lsZ8TA5zwsH5Q55nGUOyyYNTinc6NDbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=partner.jaguarlandrover.com; dmarc=pass action=none
 header.from=partner.jaguarlandrover.com; dkim=pass
 header.d=partner.jaguarlandrover.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=partner.jaguarlandrover.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odZm86Ou6PJ9Kbit1PZmTIZDoayntvcBWsDfAHJ9ObA=;
 b=npOxfwfH4mXHZYDyTYNsm/I9spLCWnJkSvoCOnrzxxA3z9yRexf6nu6B7JZV35+R52cbShM+rVh/J5kJPD/PygGn9U/XuFOLEiCLroxO2biSXz3y71rJ009fm81UrzWn9BiHq4ZAi0tIXDXit80op4xYB3ZqX+tLeUvujeyLceg=
Received: from HE1PR04MB3004.eurprd04.prod.outlook.com (2603:10a6:7:1f::22) by
 AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 09:40:53 +0000
Received: from HE1PR04MB3004.eurprd04.prod.outlook.com
 ([fe80::b01d:5242:d569:d306]) by HE1PR04MB3004.eurprd04.prod.outlook.com
 ([fe80::b01d:5242:d569:d306%5]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 09:40:53 +0000
From: Vishwa Rajagopal <vrajago2@partner.jaguarlandrover.com>
To: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: Re: QEMU Virtualization 
Thread-Topic: QEMU Virtualization 
Thread-Index: AQHZ3xLZTzZ0qAKib0KeFzauEkj/67AKaY9Q
Date: Mon, 4 Sep 2023 09:40:53 +0000
Message-ID: <HE1PR04MB3004E3AA92C6EE841D4A14F3D0E9A@HE1PR04MB3004.eurprd04.prod.outlook.com>
References: <HE1PR04MB300468172D98345307CA728BD0E9A@HE1PR04MB3004.eurprd04.prod.outlook.com>
In-Reply-To: <HE1PR04MB300468172D98345307CA728BD0E9A@HE1PR04MB3004.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none; dmarc=none action=none header.from=partner.jaguarlandrover.com; 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR04MB3004:EE_|AM0PR04MB6916:EE_
x-ms-office365-filtering-correlation-id: 9f516ebf-aa07-4ed5-688a-08dbad2b07e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: blSq02U8xwDId5VC0h4WfJrQ7S/StQ+k3ID4uDorPiSzvReA1O03W2CvIOvKp0irTXbjMbGguh/zGeC8woKRITE0dtpQvqDdjbMKA4MehhuhydEj7s2RYKn0Dm588MYMkoWa2kEPaTc70AeZmRSz8CIrGX0OXhcAE8xISUzGKCEY/sGJ1f3SvUhIVVx8kA5zPJsHyexE+7Bm6rjA7qUX9Ktxe0jTIzz1EraMUsOmPA85POHx+eeaKRoZBc+ajl3AXWPJSFnGzX3dCwMpeHHzdDssHMrAPF4hSvAKWCujH453tbATUV+n7Amcl+8jOu8ZP6UhKqq6ETG8Bw96+Q61lyo1py+nk/XX6FoTEMpgr4gCrzHcDmhUlzjKqRiGfWdzaQqKZrzQGYck0d1bWwaRkO7cUVPhihQY41r7NRwnJkrH6A1pwxrxwA5/z/Pve9LY1ELf8tPhN77+VpvuYK70amPmAkJBKzJMjX/KrLxykGY2LM4pO8xBu0RY6jCDDJ8M3HKLXrbn+McxFqurSe2YjaYJKyJ6J/32CZA/ryHnDHWXU9w2NXA4+ddWrPhvOdRONxfRrQ/i51sGRyrMkV2uGT/DFrNebRXZqLuagTjY094nsKRakD3FacKrb+tMMeJb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR04MB3004.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(396003)(346002)(39860400002)(186009)(1800799009)(451199024)(478600001)(71200400001)(53546011)(91956017)(110136005)(66946007)(76116006)(66556008)(66446008)(66476007)(26005)(4743002)(64756008)(6506007)(7696005)(2940100002)(9686003)(4744005)(2906002)(8676002)(450100002)(8936002)(316002)(41300700001)(7116003)(52536014)(5660300002)(86362001)(33656002)(122000001)(38070700005)(38100700002)(83380400001)(55016003)(3480700007)(19627405001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uGp2W6Hj/rmhaL5xJFRK8dUM9bke5liuqQhBTQE1VHrs+f5DfYUyWcRrmwD0?=
 =?us-ascii?Q?7topFXWMCyOJruAaNI7s5MMkI2PAHxwvlIWHY1nbBiU+cZiDNk+P7l7s3GIz?=
 =?us-ascii?Q?exvaXTYohxY803ZBJlRCe1j7vYEhu6huD0Cvjrn/OKVw+ZkpGUHgPdWVGly/?=
 =?us-ascii?Q?Y+lULcel4DGJP5pQOFoytKQ5gnuAgFuKS4suFenlIUUscWuYXL0Gfus8u+B4?=
 =?us-ascii?Q?n4cnCQ/p2Pce6znotPPv91SBrliVQ2gMAYa3a3h5z2q1AUYPVq9MSI8T0VJy?=
 =?us-ascii?Q?aCzlE/ixqD91hO+kiZz7zDkjrIs2JvGl4Flb0o+AxbiWDqKx1NGMRKfrvUKW?=
 =?us-ascii?Q?gbHxLGCmEV6pHOArqFP9xfVK7w6I5XFztrjjkrt5PKNOEaX+jioGXxXMx0VB?=
 =?us-ascii?Q?VpyXon9EYtDWMTY3LaS+l6J6W0tqpSzWPZvq7ICYIB37RNh1s2sQj+qRLDeY?=
 =?us-ascii?Q?+c2HadhiVF5c5nvM5mg2DTPzpqSABJzN+ipKEB9r9k/ji/l6wpT5pkDJHITU?=
 =?us-ascii?Q?PTs44T/k4SUvqtchsf3V4ZfPTtkBVoPuvcOuHHZyyEbtmeIeOo1Cvrk05R0J?=
 =?us-ascii?Q?3H39dS5XDlG/mc3vzT7ppQIVrPfPf9YhlcvcXbGw66oEnVqIugWrYEiS+GpU?=
 =?us-ascii?Q?mT/UN6WgE6xMA3OzymvshAOVIcUWmp4QP8ZM4ZiAhEx9TkwTjE9jAGNCUtk4?=
 =?us-ascii?Q?ijR/6F5Bw8jwdj6SmiEf8WMl3Eqauk8kTkckvJaVNvQ8UfRbE0Gl1B4CY0Lu?=
 =?us-ascii?Q?GTQNeKBMD4kCznd5bfMEjBC5rfSbNRum6OlPm4smk6mZt83EPzUDPX4ihx60?=
 =?us-ascii?Q?XfYDllUi0Ky4fER/gUniCp7EPTE7UhtMfupmVVppHki0KcCWvkJgBX1Xhicv?=
 =?us-ascii?Q?Ujbhw4efNtyRNvll5H5qd+MTkHyT7caQ1TxdevmzAjAMUqjIH8syEC0oKULs?=
 =?us-ascii?Q?IA64dD1s7ljQ0iv/cg722R989t8/5Rym5NoPsCPAEwLFZIAwV10POWcfeQyW?=
 =?us-ascii?Q?ABDODpc5OI2pLnteGFxRg8zWRmBC6C5U4TChvw0LQ5jHrkFJhJiQIZqzwd8i?=
 =?us-ascii?Q?LMW1M1N2ZSCuXey+YkTTuAdf+BcSnKgYV6ghBPcW1mPGgHJUYi6UZpJVojEq?=
 =?us-ascii?Q?NRq4TdEXrRGzuN2rschRzBL8PFpB4KXFWrHSlF6JwFzaZngXLqi0eIfBPeqe?=
 =?us-ascii?Q?N9q62G+kZuALmS4a3uKT0orTmPq6J4FGk9jECvfX+55BRNcly9UxpFONykFb?=
 =?us-ascii?Q?A2+Zhzfmvrque6bliUgTtWAkmdNHPKbhJZOhAKPuPDw0Ow8Skk7KS4EPQsxR?=
 =?us-ascii?Q?2+mj3iAc2o23gcSSyk0yVLwtVHoH420L6BS4ZR/N3fIlYq2qRUoppMRDT8EX?=
 =?us-ascii?Q?r2BlAvdvfSbltcuoho1/3IaALzzTzDtTCO8QxWj7pkXDHElBqp8jx3qevPR/?=
 =?us-ascii?Q?ZLsFS3uyeu5v+gMtNIOEC7CgXXDHgFz2jZVdvmFxgD80AczJnFhpL/ZilPiq?=
 =?us-ascii?Q?kdKUoJoZNUucrSnsKvLYgc3VBzRZKqEzH5Hq9dZM3GhydSt9712p5Hw6rFk6?=
 =?us-ascii?Q?MgQOKDb8ofCSHpMZ4oru2reFwoIzD/v1DcQwdAjpxz3pWKXyK3acy83z2se7?=
 =?us-ascii?Q?OQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_HE1PR04MB3004E3AA92C6EE841D4A14F3D0E9AHE1PR04MB3004eurp_"
MIME-Version: 1.0
X-OriginatorOrg: partner.jaguarlandrover.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR04MB3004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f516ebf-aa07-4ed5-688a-08dbad2b07e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 09:40:53.0351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c087f80-1e07-4f72-9e41-d7d9748d0f4c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JwWPEtLcDkoFkTsZUZziMbjEGOVrEdOtTuO9jZqlqiSUuYYICOaYduvvu31DsWSRK1w6jAAcimUaozpm/RhIZmeHqjjHVwaUm2M2iNFFWRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916
Received-SPF: pass client-ip=2a01:111:f400:7d00::70d;
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
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:28:47 -0400
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
X-TUID: zBGngkMP72xK

--_000_HE1PR04MB3004E3AA92C6EE841D4A14F3D0E9AHE1PR04MB3004eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


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

--_000_HE1PR04MB3004E3AA92C6EE841D4A14F3D0E9AHE1PR04MB3004eurp_
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
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Vishwa Rajagopal<br>
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
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Hi,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
We have quick question on virtualization. we need to emulate Samsung exynos=
 v9&nbsp; board using qemu. could you please confirm possibility and proced=
ure docs.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Thanks</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
-Vishwa R</div>
</div>
</body>
</html>

--_000_HE1PR04MB3004E3AA92C6EE841D4A14F3D0E9AHE1PR04MB3004eurp_--
