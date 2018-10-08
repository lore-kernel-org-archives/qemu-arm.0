Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3975326wrt;
        Mon, 8 Oct 2018 15:26:16 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62+ULSfBfbIOsA0J84KjJlFQssLAVRnKD7aY98uz59RE5s2ElhB/02kZ7rWQJFFliplc1bo
X-Received: by 2002:ad4:504b:: with SMTP id m11-v6mr8906868qvq.36.1539037576483;
        Mon, 08 Oct 2018 15:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539037576; cv=none;
        d=google.com; s=arc-20160816;
        b=MTa8pQBnXO4K2eKxWlnvx7SFcYB0EeJ8qzJSH/IfCmIrxGLvX8jNhFmlAK3S3oUWQH
         buHoz8y/Cvjbm63zeLZUgjogzC/jsi8jRIrZwdKIULL4pxxQ8r4JM7LOuzLnEAbphNsM
         ViHOL7Zb+bhbczqaoujQoEJWuB93xNKDrIQUBydc99L5VJwPC1LUbOvYrAEJ1yFB1De+
         krdPB+AR4ZiBHNpZTYC3BTHZGPKNgHpy7+UN/UjoJcTptJ8avOOsbJSQH8xreA6rYbwp
         K082va2ujWf8dJ5XMA7JLvFKEr/ZTnFp17mg32NUPbhxprdzF4ovKFJEF0UvZzvsKUUC
         04lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature;
        bh=5HVAuKkrG9wCb56TVgE0DvWZz/wQbB1r+dIvcbd6D3k=;
        b=AifaKZ05so+BqdxFFQ04zfZdROagVkOPLov65k+pHalUP/9ndrk3W1LBEPrbSiKpby
         EiyiuUyxil76sfopzZ5HkhnWkInNJgVopS7dM+b58iSZThIrGIqfSdA3THnAGzmkzIBO
         hFNT+rNCS3lpmLL4nJUCHM/rWizd3jEj4JckrGSjX0KhmUPcPLXXtzzAbZ2gDGgVpJCt
         toxGgC1NhfTb7AidVpm1OPEG0HHFQywWLiA6sDcloQFM2T4BCmXsODoSjMABkWwqdH5U
         9DSKIPv+hz8Ipm0mysTLgirHaeRnTKavwzFoQF7CzEiVTmy0mbEJwayyxVQ53ZGsVenG
         +3eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=DGFWYT+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v190-v6si7785947qki.373.2018.10.08.15.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 15:26:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=DGFWYT+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9dyi-0007h3-0C
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 18:26:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9dyY-0007gw-9M
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 18:26:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1g9dyT-0003EL-AI
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 18:26:06 -0400
Received: from mail-dm3nam03on0080.outbound.protection.outlook.com
	([104.47.41.80]:19182
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1g9dyS-0003E6-Vu; Mon, 08 Oct 2018 18:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5HVAuKkrG9wCb56TVgE0DvWZz/wQbB1r+dIvcbd6D3k=;
	b=DGFWYT+Gq81Eq6oryFMBS1yue4kDYHvW3LWMOhAOpqacvK37WlJwy23tlHaKH8dVAI4aOINZtkZJwP0J+sae/fFISx9Yo0eatC4cx9gfwx9ZA0fsVn0K9HVFEvOjNUPBs3Aw25D9lhJZB2GXDP5k/+7MJKNlDirKN9f18DlLkTE=
Received: from BYAPR02CA0071.namprd02.prod.outlook.com (2603:10b6:a03:54::48)
	by BYAPR02MB5223.namprd02.prod.outlook.com (2603:10b6:a03:68::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1207.18;
	Mon, 8 Oct 2018 22:25:57 +0000
Received: from SN1NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by BYAPR02CA0071.outlook.office365.com
	(2603:10b6:a03:54::48) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1207.21 via
	Frontend Transport; Mon, 8 Oct 2018 22:25:57 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
	header.d=none;kernel.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT059.mail.protection.outlook.com (10.152.72.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1228.17
	via Frontend Transport; Mon, 8 Oct 2018 22:25:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9dyK-0007YR-G0; Mon, 08 Oct 2018 15:25:52 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9dyF-0000jl-Bb; Mon, 08 Oct 2018 15:25:47 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w98MPh0E032150; Mon, 8 Oct 2018 15:25:43 -0700
Received: from [10.23.117.222] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1g9dyA-0000jG-Lf; Mon, 08 Oct 2018 15:25:43 -0700
Date: Tue, 9 Oct 2018 00:25:41 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181008222541.GJ4229@toto>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-12-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA8xARoCTPMWs_XA06gRgzZL+RGS8XwwKNmS45b9C7mmzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8xARoCTPMWs_XA06gRgzZL+RGS8XwwKNmS45b9C7mmzA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39850400004)(396003)(346002)(136003)(376002)(2980300002)(438002)(189003)(199004)(6916009)(186003)(5660300001)(229853002)(36386004)(478600001)(33716001)(46406003)(316002)(486006)(58126008)(336012)(77096007)(53546011)(126002)(476003)(16586007)(446003)(426003)(11346002)(47776003)(63266004)(4326008)(76176011)(97756001)(39060400002)(54906003)(14444005)(1076002)(23726003)(9686003)(9786002)(106002)(8936002)(356003)(50466002)(33656002)(305945005)(2906002)(6246003)(26005)(8676002)(81156014)(81166006)(106466001)(107886003)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5223; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT059;
	1:cLjDiuIDc7jpRyn/L+4twMztfgWFxIOsk0IBnWwIs27K+JY1zGdGziistJT950TQnuftKhBgZcGyz5u6Dx4yGvnvIUHfqwp4E5br5D4WnnRHeiJDzYzCVpvuGeJ5F9+f
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a404e42-58fa-4d5f-c01a-08d62d6d0440
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB5223; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5223;
	3:jKnpI9l59vnrkP1KZdgoISC+rM16gDV9AKuzYVRDNmpyDQxU5bYSBhYwBFe/v3HTd48DqbgtdyR4NVxrvF9pvtUM7gjZmoAm1MT05Qtm3vyN18IwuFsAl0+zuQfqMxZ/8S37Bidpllxb2tQ9kftZuzKWCjkGxzGyRdqufYSynwKLuCKoNjiJv0qg0hEIo7u7td4Mxf1jq/qo2U6Vd1VFqZLx0w5ocWehjHr8ZLkMO+v+kHJCib3upetxi29UeV88r5Cgk2xymfxh1e6FbEVAzSS6J4QK2fT5GAx02Khv+wzfGGpyzoyIN59WIS0MdeLfa7BXkhtMWkQvJQYNzyiEEI3DYIIb+cLP3uWMkVmvA68=;
	25:tJ9gGklWBycoYYE62aX3eUD4eGpUhGh33DuUb7gMUCXQenS74rzIQI0iuGrFWEtn1QyjiYvNNUaYnRUu8aMX+LdGmCMGcP9Gm9okAf2iZJ2ASF8XQVN4ItHkXb+3bsCWh8PP3dJG+Z2Fjp3G6AkNT0Q3i/Aqvefh4QTx1nwFOTkrGiA1sy59G3gGgx2tPBC3Dm7ZlwhE0ANQhTCBCWsCrpGO+h+MbjwAPt7X0ShqugEFAVGzceHMIrchr1Ao/6lcy1Y+P8SNZi/1Ki5Grjj4eBbla47sd5USOBZ1e85FR/OngSvfceGMlBxGJkd24dEKOX1KzkmYAfzzTfXD7rzJMQ==
X-MS-TrafficTypeDiagnostic: BYAPR02MB5223:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5223;
	31:UUjTEnm4wLLsLsp5MT5xmCZQtEJ1m6CxHHykAfdpJ6PQpItDJwUiezpLhZaDbLV4sCURrXTbMbveabFIBLs9B0jyOVp+p0eHud3c4ANnnydEjos0rpns3KalsmAaKBPqXRV78nOC38GtvsV+BzzTSXJb774GD1LwhGSUtbSHyS+RthHu/hG4bhTM9cYvU/o9Fj4XpiWoo51K4FQHJkBFY8Mjfy7+Fj8NE+X1FI3Mo6c=;
	20:1wJRurzd9Z8qLhhGry1hxjJo4SN37vNO9SMsaKKmpsIYTu+oIafwtNVw6L5PgtxDzSueiMXD3GpzeBDdILZ2MCHueOlpQhBDoI5FX6lIHdoF3drBnpBVc/zFgDSnab9Zw/hb7Gg+bKEWO4/h9NzYhm23Q7H8upeHcXBW90fz6HuWBtwlWb8WpGbsKN7imClVH5sZlyyoeLN2T5Zh9HDmmEi+6HuzqY9H1vBVD8Np97ADhwTUy1PFTcXTC+BINHl4PGyU0UUD2hx9cmrNdqAWG1sEhJpcK76+h7/mOlG4KdyFROu8IyaYTC5j89JJZCx2Sd7fd7aO8bmxHcrazp6zJdlnK8V8VCLqtAp2MasGgAmaW8sDvq7ltdA7qnKdOJnyDp0Nr27hSNlVXwsDveXKOXSB35kMD1OAXkrJv/epyLF4ROCfnCoFoJabLOkEt3e7w59gpJNC6ypIh+0YlL5t06mB/9bo8cVOky/0YksNhFkCLHGCMYp1dUrVc2pZ65py
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB522317A8106E358E8358B6EBABE60@BYAPR02MB5223.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231355)(944501410)(52105095)(93006095)(93004095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
	SRVR:BYAPR02MB5223; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB5223; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5223;
	4:km7uYm3BuN6VECBQtqbWuYTYsA61Y83EHaBQRJNH+FtHqnqsnmpbpAvDy/6Hmq3uUs9EtyQ0EAoJS3KGO5c8NcsYu1pyt7OnR9lM/yIVBzV+EYymqPPYVlNIMQl38S6VjIUOSRPtdurpP+YJtXh2pGNRlUORvi93b2jxPxGHaz+9YVF3URBtKJ9pTayzbj5p9ASSP8LGl5aNddtgTEOHG0z57JQBUPvG8Iy+OLTCfYjD5+WuORGYR+s3af0dxpb9svwwTe4d6h6sjjO7QCYRP1a6N/LDCwK02+ZHA8wskNmgKNyHI4v1jV/yoVeFaROjKBDAVh3pA+oemF+39ugmocJx9Gs8KcumJWgxrQDChNU=
X-Forefront-PRVS: 081904387B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB5223;
	23:95CaMtxTkY8GKWqcsqnedurLrT7CGOLfWmoCAfahn?=
	=?us-ascii?Q?M0393Wy4wli1kiHS/F05JkGTgKnNPbl8rx5VHOq3aYSzuHUuKN1dMLKLavRm?=
	=?us-ascii?Q?06xIgVquXk7N6Y+OL6PztYsU1vXisz84IwdsFoFXYu/m9KuL50OHaMwR6dJM?=
	=?us-ascii?Q?K4wLyNBuhYP92IcODJpHas1dFSGvdQVF14Kv9MOFJNi1U/FoasFWC6rnXfqi?=
	=?us-ascii?Q?cSjJcWc6bGKSMqTN71agLKbSQe6wejha1vC3cMww8PfSAlAzk7L7RAt15FCm?=
	=?us-ascii?Q?W7LyHtqs6BP7AH3jp2U+q7u2xwUyRqrWQg7JeYvZpe8G7DEgqLjDHw7ndeJK?=
	=?us-ascii?Q?cl31wBgEG431fSMlYEwwAvy06m2eBl/YR+liqF8FQP5jJJnHLFsG9xFtUP25?=
	=?us-ascii?Q?LzyLz+3HsZKY2mC9YuecEOIxN6h/B6gHv2TeTNzLEAZYyw4MGhOLkaiH58L7?=
	=?us-ascii?Q?IZQPJn/Xh/yZ2m1a7h5hTkpjWZAsBGrBTwOSxRDZwRrn+HPfF0Aua+5hsPPq?=
	=?us-ascii?Q?yJKTexZ7HCSGHxkwAI0Jhkg6eNwCwgBLjW8RbUMt3cQoRuYzQtE+cEr+du2w?=
	=?us-ascii?Q?DzJoM51aQ+on20ahVENj7dbZJ3Xo64ktB1LjeoQCy7b7UlyPKUaWuqAQTbPh?=
	=?us-ascii?Q?9Jx9n5ACq/KFPG2/6N+U5BOxI77tD0i/mUeIfDncxayVRxHxE+Z7oNY1miMb?=
	=?us-ascii?Q?+14hadrCcuaFNM99K18KSCPiNoHgAfaCWbI1dh16xKphKj0X4oyWhZwWmQSk?=
	=?us-ascii?Q?xjTnAuBoGZG6VYJyrvt9VX+NGFuGpHziyfSJYTrPNdASmcnwcu6KMJFQX7ih?=
	=?us-ascii?Q?SIgWfxVw6KPhxZItUYjguwbOa9HT4oivNRs15eXYcbdOaJqmzWgaIGGCRNvr?=
	=?us-ascii?Q?USTsu6JshkghYYLvrVIZ4K1xSzymbT0ifUMw408uswgkQ/Zf1rCZ3KcHhjwR?=
	=?us-ascii?Q?cAWpNVzU61VTkmYp6q6GDGjbFCalpWAr2eO2EspB5FeM0A2zt/mCEVuVKqoO?=
	=?us-ascii?Q?oi9yNdpZ0dM2AXQZqhkmfzbZoY7KZP7qKyN/L17tO1wisTlRDOVNIUHTfD/e?=
	=?us-ascii?Q?VkzTwIfskrnuiQEO5YZyaqoCCtmF353xNofva9I5DcSj8nzKWkshRgcwpQXT?=
	=?us-ascii?Q?XBa8y0BcOMSHI+tBMVEbc62y46sI1wQnmIITkkqVHeB0WwA7YJ+Q0RLSPHAu?=
	=?us-ascii?Q?2cOTfwxLRQSV5B7pl2uwNmgsAiW7Fs/hbWjs1cWg5cCQgboGIqoiC20iaUn9?=
	=?us-ascii?Q?HB+xJ/LE5QiEnPUhgwtT2sZFj+8PMr1U+NrLqdmV+vfhj3QFNt2rTlTqiMru?=
	=?us-ascii?B?Zz09?=
X-Microsoft-Antispam-Message-Info: Un6TXdx/fgQyEOS+M/Uol9Tb/OwShE/3TJy0Q29yvOA4ILdMKID+BmI2eHGGr/k0pjX/w+x7EYeuccqNW5KWSl9D2EwFh78/A5q2A5i4X67d21QnTKzlUOp0rG+M3bb2+qdozeCmA4AZWQtbiK2H+zF/GTWDiraBSvu/MPEN2OTVqpEGS3xE4jXGyDHSkC0bzbCjExs8mOjB45wyFcvX78B9KVXGZQ641xkNkiTukGKAlwS3rxKhOGSuCiYwesu410ShasmR+KzUJxCK3eEf1tmLrJ3YCRuzpx6H4quSHuOpYNHVdQdL3fcPu3u5gMXda9ov+ceiuzZZRK/iBlYRy2qfxowaa25H88DduPH1ewM=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5223;
	6:axQj70HyAOFv5LM2VdFAtdpSkcSCqqwphVujRd/f6FNXiKpQddiuoLQGDH1qZCODJQ7MbPPqpOpORabwcF1YGnWz71Q4rGr85ZnEOCpTs39evYTIxq9GXAanadBk5YlXGmRP3GXDXzZWtGwhObI0jYEigXLQ8br9L5FNeukJLRX0VC8XDJmEdluJ6ReB11skct7Tjn3gIHbdd+YDzjr5S3UveKJPUhqTt9vYnyytf9TAK1b/DUuNdyWXVmj899M+KTn7+wUzALDkMFnEuzCGkzlUismZWiFidZy1kk66nOizt2rLlVtUu5LNAuEFfvs2vr6YeVyyTnvUa9f+QjMVdEQBcHo8T7A88VB+LDmSg2Xdpr1hcRE0Rdj/T4UGFbUfoep75yxb3BtrLy03K61A6LVyKVvORteXJck0y69++JNK3vRRG9kTmNxUXcQISV/7RM6wOyOq+hcMNNH8EdxqdQ==;
	5:/z9JPnawUciilSnotaiKK3Btjv3xTZQXWcNXtODBIVW47CDaDBV65vEpvPihhUKx2Z1L4eMDjvBcDaBkZ7FtRlOmFp7AD1HnxK1BNnXFLZp+4WuQWfF1tVVzv6ad/y+bjFYAuGs9imDWEJ7mcczfiRL38CSbAU06RIH55aq2HIc=;
	7:3w8aGgRW82+cncwbS6S/cu7iC3SCoyVh3HMecO+VYl8enwyG+FvpAOpzrhylJEN4c8iHTCoYzI0uvJOTlAxDJ64z648GQAdFNKtm5Bz8DFhEAxA2DFszgLRCWejFF1xejDkrZYQtWJMR9VhfADvWs4J2cwJ6aLUzYgjEEaemzCQv3EUT18Fb28qqS5261xq/2F+FVh49OMk1PcpZBZeBBFCV5so3mu/8ObNbLoWf2Z3pJXRUyX5jn3xAD3cmRzk1
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2018 22:25:53.2103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a404e42-58fa-4d5f-c01a-08d62d6d0440
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5223
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.80
Subject: Re: [Qemu-arm] [PATCH v1 11/12] hw/arm: versal: Add a model of
 Xilinx Versal SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vyuHAobDanBr

On Mon, Oct 08, 2018 at 02:19:09PM +0100, Peter Maydell wrote:
> On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add a model of Xilinx Versal SoC.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  default-configs/aarch64-softmmu.mak |   1 +
> >  hw/arm/Makefile.objs                |   1 +
> >  hw/arm/xlnx-versal.c                | 339 ++++++++++++++++++++++++++++++++++++
> >  include/hw/arm/xlnx-versal.h        | 122 +++++++++++++
> >  4 files changed, 463 insertions(+)
> >  create mode 100644 hw/arm/xlnx-versal.c
> >  create mode 100644 include/hw/arm/xlnx-versal.h
> >
> 
> 
> > +#define XLNX_VERSAL_ACPU_TYPE "cortex-a72" "-" TYPE_ARM_CPU
> 
> ARM_CPU_TYPE_NAME("cortex-a72") is preferable to hand-assembling
> the type name like this.

Fixed for v2.


> 
> > +#define GEM_REVISION        0x40070106
> > +
> 
> > +    for (i = 0; i < nr_apu_cpus; i++) {
> > +        DeviceState *cpudev = DEVICE(s->fpd.apu.cpu[i]);
> > +        int ppibase = XLNX_VERSAL_NR_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
> > +        qemu_irq maint_irq;
> > +        int ti;
> > +        /* Mapping from the output timer irq lines from the CPU to the
> > +         * GIC PPI inputs we use for the virt board.
> > +         */
> 
> This isn't the virt board :-) -- cut-n-pasted comment ?

Fixed for v2.


> 
> > +        const int timer_irq[] = {
> > +            [GTIMER_PHYS] = VERSAL_TIMER_NS_EL1_IRQ,
> > +            [GTIMER_VIRT] = VERSAL_TIMER_VIRT_IRQ,
> > +            [GTIMER_HYP]  = VERSAL_TIMER_NS_EL2_IRQ,
> > +            [GTIMER_SEC]  = VERSAL_TIMER_S_EL1_IRQ,
> > +        };
> > +
> > +        for (ti = 0; ti < ARRAY_SIZE(timer_irq); ti++) {
> > +            qdev_connect_gpio_out(cpudev, ti,
> > +                                  qdev_get_gpio_in(gicdev,
> > +                                                   ppibase + timer_irq[ti]));
> > +        }
> > +        maint_irq = qdev_get_gpio_in(gicdev,
> > +                                        ppibase + VERSAL_GIC_MAINT_IRQ);
> > +        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
> > +                                    0, maint_irq);
> > +        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> > +        sysbus_connect_irq(gicbusdev, i + nr_apu_cpus,
> > +                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> > +        sysbus_connect_irq(gicbusdev, i + 2 * nr_apu_cpus,
> > +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> > +        sysbus_connect_irq(gicbusdev, i + 3 * nr_apu_cpus,
> > +                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> > +    }
> > +
> > +    for (i = 0; i < XLNX_VERSAL_NR_IRQS; i++) {
> > +        pic[i] = qdev_get_gpio_in(gicdev, i);
> > +    }
> 
> > +/* This takes the board allocated linear DDR memory and creates aliases
> > + * for each split DDR range/apperture on the Versal address map.
> 
> "aperture"

Fixed


> 
> 
> 
> > +static void versal_realize(DeviceState *dev, Error **errp)
> > +{
> > +    Versal *s = XLNX_VERSAL(dev);
> > +    qemu_irq pic[XLNX_VERSAL_NR_IRQS];
> > +
> > +    versal_create_apu_cpus(s, errp);
> > +    versal_create_apu_gic(s, pic, errp);
> > +    versal_create_uarts(s, pic);
> > +    versal_create_gems(s, pic);
> > +    versal_map_ddr(s);
> > +    versal_unimp(s);
> > +
> > +    /* Create the OCM.  */
> > +    memory_region_init_ram(&s->lpd.mr_ocm, OBJECT(s), "ocm",
> > +                           MM_OCM_SIZE, &error_fatal);
> 
> What's an OCM? Is it really memory, or is this a stub for something?


I've changed the comment to spell out that it's an On Chip Memory.


> 
> > +
> > +    memory_region_add_subregion_overlap(&s->mr_ps, MM_OCM, &s->lpd.mr_ocm, 0);
> > +    memory_region_add_subregion_overlap(&s->fpd.apu.mr, 0, &s->mr_ps, 0);
> > +}
> > +
> > +static void versal_init(Object *obj)
> > +{
> > +    Versal *s = XLNX_VERSAL(obj);
> > +
> > +    memory_region_init(&s->fpd.apu.mr, obj, "mr-apu", UINT64_MAX);
> > +    memory_region_init(&s->mr_ps, obj, "mr-ps-switch", UINT64_MAX);
> > +}
> > +
> > +static const VMStateDescription versal_vmstate = {
> > +    .name = "xlnx-ve",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +        /* FIXME.  */
> 
> Stray FIXME comment -- I think the answer may be "the
> SoC object has no state of its own so needs neither a
> vmsd nor a reset method" ? (If so and if you drop them,
> do put a comment in the class init about why they're not
> provided. Some day we may have a mechanism for a device
> to explicitly say "I need no vmstate" so we can assert if
> none is provided.)

Thanks, I'll do that.


> 
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static Property versal_properties[] = {
> > +    DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
> > +                     MemoryRegion *),
> > +    DEFINE_PROP_UINT32("psci-conduit", Versal, cfg.psci_conduit, 0),
> > +    DEFINE_PROP_END_OF_LIST()
> > +};
> > +
> > +static void versal_reset(DeviceState *dev)
> > +{
> > +}
> > +
> > +static void versal_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    dc->realize = versal_realize;
> > +    dc->vmsd = &versal_vmstate;
> > +    dc->props = versal_properties;
> > +    dc->reset = versal_reset;
> > +}
> 
> Looks good otherwise.


Thanks,
Edgar
