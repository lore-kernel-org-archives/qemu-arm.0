Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp556971wrq;
        Wed, 20 Jun 2018 02:52:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIL2fhjJ0hQ7ugywqasvYSuUTSh1rD1Cmj7tLyC5Ktxc9pkVt+ta249tXS7z4tfP/gUxUVY
X-Received: by 2002:a37:7386:: with SMTP id o128-v6mr16603432qkc.356.1529488349776;
        Wed, 20 Jun 2018 02:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529488349; cv=none;
        d=google.com; s=arc-20160816;
        b=rmAW1v3T+fd1hv3l1R4ZzRgCO5Ml8UUMuWJNg21mctUqK6HNaQP1cDQ2CKm3JWz8+d
         1HrfFjkQF8Dv16JVCsxV4Yb/WntN27+tNlH/dm32omSf53WZ9rnlf+JtpM19X3zaEPmC
         3Tc2I5CapnJukzkq1qEM/ABF9xeZslAvlvM7cnAiBXdnsn1ckgwDpVK19tXMvtgQa9Y3
         NRt/aIorKjsF6tuFEXr+piJNSKolXOetyTb9trx+NC4CN8xwUS3EKEvHlde2VObH+pUm
         0QibSU3RruZSTjdNqiaVNJO9FMogyHF0kNZ9g5cROW2oMucHK6eceTs2WNIUnrQ/SZq7
         Y5yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=ZOoaNvHyYN91t6oyHuoYARxDAC485fSzSaj6yeCwO+c=;
        b=qO4FqHr/l8w5PVxLgTrZcT2KVqake5TtuK/tyMawpA8tPEHbJn2fyU5r7wg4KZS/Ql
         /KPvlGFLThZzVvSjNSDeIaWNSnpIn2QlWl4DyzH3kbqD2qy4GEELSh3jhBXWAOthXD7q
         o8UMMakVlEw77tSi70H82BsRWuH3UjjTGCKDFcNUu0VZGyrCtCnrMTIP2voEdYz2Hc6q
         rVJVmk7KwH7WEjpjpKOs/sGsaMzNekA0B61hDbkYcOl0XMovw+igkgfglUet/o5AUwA4
         /csxtFoH9adgAINtbNgwUF3XgoMIpTevbocrKTJFlPqn5xqWsqmTlWo6bTB5gT3id+DH
         noow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=buOSuW1v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l35-v6si1797496qve.23.2018.06.20.02.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 02:52:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=buOSuW1v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVZmv-0007zA-9N
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 05:52:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fVZky-0007AY-IB
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 05:50:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fVZkx-0000K4-On
	for qemu-devel@nongnu.org; Wed, 20 Jun 2018 05:50:28 -0400
Received: from mail-cys01nam02on0608.outbound.protection.outlook.com
	([2a01:111:f400:fe45::608]:37712
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fVZkr-0000Fm-9I; Wed, 20 Jun 2018 05:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZOoaNvHyYN91t6oyHuoYARxDAC485fSzSaj6yeCwO+c=;
	b=buOSuW1vluAGujScWwg2tXt+H+s/MS2wASoyHq+lZEC3RFXbcKgOf/DxRJ8gBh7V/jGlskDIcR8NGanXGs/woPjRC8kHBOw3QKKhlKqhZ0X7GIX6ktbbmihjk9RiQ0Ug0AI2rWsHMMruAteH0gIftJ7oZ0yVSX3Gjy5QkAROiVU=
Received: from BN7PR02CA0023.namprd02.prod.outlook.com (2603:10b6:408:20::36)
	by SN1PR02MB2157.namprd02.prod.outlook.com (2a01:111:e400:7a48::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.863.19;
	Wed, 20 Jun 2018 09:50:18 +0000
Received: from CY1NAM02FT061.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by BN7PR02CA0023.outlook.office365.com
	(2603:10b6:408:20::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.863.16 via
	Frontend Transport; Wed, 20 Jun 2018 09:50:18 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; amsat.org; dkim=none (message not signed)
	header.d=none;amsat.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT061.mail.protection.outlook.com (10.152.75.30) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.884.17
	via Frontend Transport; Wed, 20 Jun 2018 09:50:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fVZkm-0006pX-Sz; Wed, 20 Jun 2018 02:50:16 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fVZkh-0007o2-EZ; Wed, 20 Jun 2018 02:50:11 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w5K9o5oW023953; Wed, 20 Jun 2018 02:50:05 -0700
Received: from [172.19.118.64] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fVZkX-0007VG-52; Wed, 20 Jun 2018 02:50:01 -0700
Date: Wed, 20 Jun 2018 11:50:00 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Message-ID: <20180620095000.mbhnrfmlnupzeig5@toto>
References: <20180529124707.3025-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180529124707.3025-1-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(346002)(39860400002)(39380400002)(376002)(396003)(2980300002)(438002)(54534003)(199004)(189003)(356003)(8936002)(47776003)(33716001)(446003)(5660300001)(50466002)(26005)(106466001)(478600001)(316002)(54906003)(58126008)(81156014)(16586007)(8676002)(81166006)(23726003)(106002)(63266004)(305945005)(76176011)(1076002)(229853002)(9686003)(6246003)(2906002)(36386004)(7416002)(336012)(4326008)(39060400002)(46406003)(126002)(77096007)(6916009)(59450400001)(486006)(97756001)(426003)(9786002)(11346002)(476003)(186003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB2157; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT061;
	1:qXO5UjeZMiPkLF0DkNFBe62z+BZ0btM6TnYvMEdUZ1aPm30yo5Uqcv46OLuTUrKtz+ZrsA58MfnLTuQTATXWUnz7nuaE5VPjMW+v/sycwKAJ3NM6Fy1T33HLq62rVQ+Z
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 728e002e-328a-42ec-ffe2-08d5d6933afa
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN1PR02MB2157; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2157;
	3:SgWTe1nPRVBZxMtLbB9F6OPeeBgcXC7U41tHH+NuUF/sRvKogo0AhOdcxjOTrS9/rAptkjCHGnnMoXiJsrocH3RIdtEx17ZLFwYgRQW3pOMeZaRWUw9j7k+l7+iQ0L5qhq1CyqXt75txJqL7RZutVsBkqM6XGi6XvPz7B3k+C4lhQ0UicmF2YQQ4OKTJNWY+3rrml6DD91e4eAPfHAodtEhiVLw7ZMIIUOrkPMyT0S8ij3QhrSo7UOuXGG1LfooDaCEqChhsiENyJ8jVutIVkGgV2hWtoR6nHv5w7blsaYWrvq10Y4n+//dW7REe+qzzlM4DxFYTopgkBbsSjbieRGwX6O8EUi/Ty6Ob9+VGaQ0=;
	25:Of2QZag7cb6MSeDHMgaMPlPVUS6Swzwp/NJxdSWCOy52aCFgOF/11Wo9vdfmHCXSP04pgoL4vn3s/cIOO/t5JSysWfFUEb8K/oH2Jx4j6OAM2R9NdDYDcWo7aUbEA3CQo6aMwIFL/qBmEX/VWggWflH7cJyHarjSNCR59+tyjYNRP700fqJqyypenL77Fu6DRKgYO18LTEOiXBcV3xAM4WyqeuGzGkNYd5FSRmUhnlNRk+loYif8D9a9xc4xgUDydwtnChjGcFWiCU4f2eCRH+xfJKQavztIwogHDN1+bJRGhD4Rfl/WZ5WB9rjFHBCXzBmwIkAMvBdq17CgKLw36Q==
X-MS-TrafficTypeDiagnostic: SN1PR02MB2157:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2157;
	31:MlmbWXz4A5UMOIx65423DX7lW6c9URhQREwGPg+ipxTHoRq3DPguoQVeIsUHnzLuNA2NZ/bD07LMO1tcybQLRoRZSeQwwSDCq/TTg8n7WwGRoaiGaPsEu1c8uqKcXwexc4eiNAojRD7NvtLGJ1df7RblRrwoAgUKDqHIG5qXhNaW7cqA6AylQ3QX0go/vsVcUMCTIEAHJ5gF3JSnPoGjALRQU7ZDZztBaQPOFm8M9gY=;
	20:Yxt4loi+ABrWMyuZKlQzfzrYE+6R09E7VsqRyWuG3nfJhgjOJlN0/kpXOHEy1FM3j8/XYv38gg6+r7Id3S0KfrIMKcOM3xJlAO58RofKnLBuQvYKuHBgbnD/vP5Moz+uSmVsnnHGAYaL229MnX+4t2+cxXhLNTgISTYpoPuu3nblB4jicLtZE6tsP/yhs/fS0XPv9loEU6Hp/TBPHNlPuyVw0f6F1ipzYtgqYLTR+/eiEI9VFLcia0nbm+JDQ174GiLOqUCCBbH236H6faJyJFmCmFGOtBIYzdJykzMOHOhyRCwRObZ83r6njVCSEzpqBKlYI6TCYDla4lcM9M0newhpBy1aUyK2VXuMo63EyZ6RgnmVzT6H1/z1GfV9vLxlyO6NpDjotXKglelEsI6HmBM8vHvYc6KdlnN1Fm8PF4L8YhAoihJiySzgEhOmRg/wTBOL4+Wv7b3bG3NJAtkn4TvWrQ34OBBrdq57q0K4SPFIT9jEzhrmJQOMw3Q5braq
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN1PR02MB2157D8C1AA99C0B9AC6C4B15AB770@SN1PR02MB2157.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:SN1PR02MB2157; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB2157; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2157;
	4:0LxDLFNRnNl9Ri6Rr/G1IdNXNDJ2txptFkbhY+eW/NKpciYuqPepv4OnNuFDZy5KoKdxppFvyO0le4h6lJad6N9ZEC4srIZpMClnPlWKpmY+ey6BMYI+bpRLdU+VyLYPh+qfUsxmbo0QtW21SE4R/PVZBtLhK0/wv+fmr3WffSR2nJ93x7Ysh4K4pVzKHf3eTH5Ouxvgf0uShAAYV1GXAORJUPhgqYdj6uvWjBs/6Xdagjd6aSVTRC4RhBud9FKMB9d0bloBachLrtb1O5DVSZEmd/v7U2x+OIvJO5iBIeh4aTOKHRj1q76vYDKaGviY
X-Forefront-PRVS: 070912876F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB2157;
	23:e/T9HS36Hk8pAYKCMQpsEFPivj8vFRdQ0YjRpob0v?=
	=?us-ascii?Q?e983vF9m7RW+fV4cfcWCgG4SdOtPZNSJIO6v3JHyD0F0ZI0d6imNVikk4MWK?=
	=?us-ascii?Q?NJHMxuQYLGnCc6GodDZUiDSje5QIjt0tqFP4T9ywJG7Zvgo4meeEfsRN1Dez?=
	=?us-ascii?Q?GLk/Uk2M1S3qCncdzOUlNl/F8Q2BuZlpHMtbiYJjs7jboYlMm4CZYJIV4GHf?=
	=?us-ascii?Q?uvUsRGBn5lWKCc2CIf7Y8AhdWXC3TR3rDRVQde+6s1Wi1LPMyfF9aw/YzXdw?=
	=?us-ascii?Q?UHYhoYoEWLCleTyBJ8fPHYk3d+dfIBY4yny4dFdKwG6oybJxXx2YjjyUPD1R?=
	=?us-ascii?Q?htZTDE1vXvw/XmaxMPxz/DE3G/84UBFdDZbhJwFmDNg5PZEHzcP1MEQyxdY8?=
	=?us-ascii?Q?gpcV73FaetLDvdy3hdxbyXRFqQFS3BWCfbilRpR9PCy/IHWauKKUluCQ3ECi?=
	=?us-ascii?Q?u9jX+jxPhxPgREFc5+e9XjrvB778mq3l2JcCvFdFcHOXeoCaRG2ZcxEnLwCg?=
	=?us-ascii?Q?BiybyoSMZ1DCHiua8IZzQnJTsmrs2a3Y4zYgCwd1+8t1308rlDgpHJ8UBaa9?=
	=?us-ascii?Q?XZpa91LfCER6eoc6B580YPRe62KhZcpOY7YVp6VFxyWM7RZfykcekScbEPj+?=
	=?us-ascii?Q?up8eYVgsAtRe9jZVZK7bUUCxBxJQtyVf0HDWgulYILX1BAKhJWzrDvOQ0L/n?=
	=?us-ascii?Q?rGfqZY+APnx0ahYaTDNIwtIxZRIsXHFgOBRgvkq96xfi+fyx/W2DgG3mSkST?=
	=?us-ascii?Q?ah3gKMCE8l457Uq7fU4tvs5mbLzLvh+IAQDcj9A48NqS+IJxTFegMs8wdwie?=
	=?us-ascii?Q?BwGx22FL7mR18xxDxOuQigMlQjafqymUN172DFj4AFtLPdb6ZBtIsUc8H3rP?=
	=?us-ascii?Q?Tk8cEqLY1BZNFcgjdBl9CtED5ldzvvJuMhW7iymrGzGFNom6ZvxFHTn8jLIq?=
	=?us-ascii?Q?Qpgg6xC3QK7FAr6gj5lTP4voAIhO2goasNKNDu2IFLyTzFZ0xuxOSPRlHu7v?=
	=?us-ascii?Q?2Q28QEAX0vRi6kOwRy88WuSIxeqX/QNvc7YFMJdjYbwJKR/xcGyLZQyE4f47?=
	=?us-ascii?Q?Y77oiu2LWLozsCSm+4Pz9AQGbiT7Ogyo29Ag11uO6LIK20yH7SKOcEk+dW8j?=
	=?us-ascii?Q?WBR6sVjY32IMaxhgEzzc66xRA6m5WIdkYY65RPPjJwfEW1j2yr7FfVI7mnVL?=
	=?us-ascii?Q?6Mim4tgprLRuK42Gc7eT5n6YJTu99VbQkLPOe+gbR0Er4KvdtaLdo2k/LJOn?=
	=?us-ascii?Q?mTUCQknSADPNQxI8vU=3D?=
X-Microsoft-Antispam-Message-Info: ApkrxMYgI0j5KpOW2TZ9wv/MkG6gYbp2IHQxZIeuLGB6EHocj3y5sprVVSclb/45tqr8Q0XHSmgi0q440rK4Wusm4LUpiuQoh/oFVKIolQKuOjLwpWrIIZqkRx6pFHUCS7Kp2nyovAdrzYfhypIxIZouVlMrm4GmHEQPWhv/rsSHE9LOjw5zEO5CduBgH7wVIhAd/yNTQrHFB880q/oHp4zdqTGWtwVYdBfp1gVtXJYwTLVr0E5Wl36IAULGDBGEhpRIlRl5swpE94qCpsXfDJC7/4BgZjC2ClRFn75jML4gCc7zT4mlVAi6mMyJqGYuLIkzWXFQM8GrUSOeDkwRhw==
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2157;
	6:3gqqWZL6373bPQQC+5d31VI1FSpDSyjCJEUStCT5Bhl2qRZ4kMC71hcsHSkmLBVaS42aAVryjlFQszJPF9piKCeYVN35yqQo0ibikgv33rX0gRw8UJlw3sRr5iiXpb7ImhAOgqNkbW2ykZi+QGZW+YGN8RDdS+Ha75E06yM6sINYQSLwuh8mNw0+sR9rx6Q1l09FOsYKb4G3fBGtLRrYrXXxvvAZa2cCMxTJgjsvLrsAf4GmxzeTJmElienmjN+vd1MFUlSi07KZI2fXLck3yWk5zqSPvzoRdG3x9wexxD4WbiwYDvR6JlSnUdn0GS2QEssiqCfg2bkGpCvNObY5tG+VQv8jvud2wibUCfIYk638QX/kRftajIYtKiV/v9FVMc6ui03XjBY6rQ0fPo8bUG8WrrxE/UQgeXNyjgjxGVfJKRYAjl7+BgUTWdQAtMjlXDbN2uDoULtSJ4Kjk0SjUg==;
	5:gDQJcy4UNJ+ofVruithT5JA3dCmv5D0XFKlVrTjsqBzQxa3pJnjAb4/wAgTmWiMziazDQHREqjWVRWYW7s55fGhPy/BqO57kblepWBExXfG06981TQ7WhTNGMCfGfrWFDI6FzBcZ/ARAaSPgBjliGeWaru6ocOBNUyRywx4OUZM=;
	24:i8J7GwMB22HggjTcH0aDNrfWGaTsermBoAamvL+7KJtCzawbDxHHndWRKF3RKMlyg5Of96BEQWFqUcqUh9mB57eMLVQcmn/71auaqgdVHJk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2157;
	7:rhrNCXhgTy01/sxbOX6melKmaYNgxf6xZuqDnxZQClj7PcDmpvYVibShYZVQG1wo+vdVLuK5CW3lY6yLO5PmVdfwciDYXnedrqpBXL4zHqJab42Xc/pOWqM0jbOxWMIrbRNplvwRUuwMSgXdm+oOAEIHe34amPGfYv1DlaNNTd5Wzz0UGJ5fKgDQmPVd2nQ+OZijub2WCnT8/P4c4gvVjuhQJXCGmD3clV6F2103v/rf58Hrh2CkdmnN/o/oWvs8
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2018 09:50:17.4763 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 728e002e-328a-42ec-ffe2-08d5d6933afa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB2157
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe45::608
Subject: Re: [Qemu-devel] [PATCH v2 0/2] xlnx-zynqmp: Change the Cortex-R5
 for Cortex-R5F
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sstabellini@kernel.org,
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, qemu-devel@nongnu.org, f4bug@amsat.org,
	frederic.konrad@adacore.com, qemu-arm@nongnu.org, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l5LlLO37BTaB

On Tue, May 29, 2018 at 02:47:05PM +0200, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> The ZynqMP actually has Cortex-R5Fs with the optional FPU enabled.

Hi Peter,

Any comments on this series?

Cheers,
Edgar


> 
> Cheers,
> Edgar
> 
> ChangeLog:
> 
> v1 -> v2:
> * Update ZCU102 description to mention R5Fs
> 
> Edgar E. Iglesias (2):
>   target-arm: Add the Cortex-R5F
>   xlnx-zynqmp: Swap Cortex-R5 for Cortex-R5F
> 
>  hw/arm/xlnx-zcu102.c | 2 +-
>  hw/arm/xlnx-zynqmp.c | 2 +-
>  target/arm/cpu.c     | 9 +++++++++
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> -- 
> 2.14.1
> 
