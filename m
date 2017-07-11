Received: by 10.25.44.15 with SMTP id s15csp4624988lfs;
        Tue, 11 Jul 2017 03:25:31 -0700 (PDT)
X-Received: by 10.107.154.12 with SMTP id c12mr7534859ioe.228.1499768731014;
        Tue, 11 Jul 2017 03:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499768731; cv=none;
        d=google.com; s=arc-20160816;
        b=oVCChesGqweGN2E4GA+NB5VRRfH6FejaAwsmPdTnqDvtMbvbT/6zg9G+yXGL25COJK
         MVGskGvx+6iHRl7T6+tLLNRhYBaA16JN+76zk2UrHKwbx42/B9lEB+NIWGuTV7ZpyfOm
         ug7pg7JaA+ULbrkUbHq8dR0xH7BYXRzMX7FTsS6Eml81T6uVjlmHjjxzWq7EJygqLCXA
         y936OVKVoQwSJgcpirP4q2GLV0tRVB0OHcmrQoRnzL/XJFXLs1gtgL9SQ83siYLXwBa/
         4Dn5szE8GWRMu+4jTP7KIOrf9Jlu4nxHVMVNi5x0dGR/L+6JzBa8AJbiw3MZFhrjzwEL
         KnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=spamdiagnosticmetadata:spamdiagnosticoutput:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:arc-authentication-results;
        bh=XOnlyzNwZfZMWtHuYHnfjv3yBqyBTbK3RUIE/03UJ0g=;
        b=KOLFqWnK88+yoZWqo7VjNLcIN5ttFt0I1H1jx2BU9Arv5qRrSkZCjE6t4DYs5awHs0
         1yg+zs5T2OWo3rJw4b0+Hm089499WyOAiSyKKuTckS1UUeC2dVjODj2BUSQfPGLMf5/Y
         hkG/SZmPIBBA8Do0J973cszz0MCjQV5ekmN57D+vPIk8ZdVMI5sCU/ihWRiR46ZOkaDG
         1CldPDPXK4o1w9rumrwobqBZMVVVt88SBh906QJ7/vWbwmAZxq+UPrfgp3WW4IFzgajT
         RLPT3L006eCGwCNPkYoT8786qwHvjFp/gsxrzRkbxcm6eGk2himSUvVvIlxxbn6A6I3N
         lgGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.b=pSHRxNhJ;
       spf=pass (google.com: domain of edgari@xilinx.com designates 104.47.37.82 as permitted sender) smtp.mailfrom=edgari@xilinx.com
Return-Path: <edgari@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02on0082.outbound.protection.outlook.com. [104.47.37.82])
        by mx.google.com with ESMTPS id p97si12173946ioi.54.2017.07.11.03.25.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 03:25:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgari@xilinx.com designates 104.47.37.82 as permitted sender) client-ip=104.47.37.82;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.b=pSHRxNhJ;
       spf=pass (google.com: domain of edgari@xilinx.com designates 104.47.37.82 as permitted sender) smtp.mailfrom=edgari@xilinx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XOnlyzNwZfZMWtHuYHnfjv3yBqyBTbK3RUIE/03UJ0g=;
 b=pSHRxNhJVee22UYoo7x94YJeZ0Q5oj0b51RhtBkU2DYbNg2ipGZBQ4SRGijk0ecyynsJkj3BM7gKQiBtWfT3oXrsvV2Ep6wEDRxJzcTPku/LPdO+KloBKKiu1SOtZ+QGB4NtIiwYe0SDiQfWFpDQEturpoG9aAD6pnU6A18DMd8=
Received: from BY2PR02CA0101.namprd02.prod.outlook.com (10.163.44.155) by
 BN6PR02MB2724.namprd02.prod.outlook.com (10.175.95.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1240.13; Tue, 11 Jul 2017 10:25:29 +0000
Received: from SN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::208) by BY2PR02CA0101.outlook.office365.com
 (2a01:111:e400:5261::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1240.13 via
 Frontend Transport; Tue, 11 Jul 2017 10:25:28 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 SN1NAM02FT007.mail.protection.outlook.com (10.152.72.88) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1220.9
 via Frontend Transport; Tue, 11 Jul 2017 10:25:28 +0000
Return-Path: edgar.iglesias@xilinx.com
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:44360 helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dUsMB-00057s-RE; Tue, 11 Jul 2017 03:25:27 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dUsMB-0006iU-O3; Tue, 11 Jul 2017 03:25:27 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id v6BAPR8V013785;
	Tue, 11 Jul 2017 03:25:27 -0700
Received: from [172.19.118.242] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dUsMA-0006hM-25; Tue, 11 Jul 2017 03:25:27 -0700
Date: Tue, 11 Jul 2017 12:25:21 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, QEMU Developers
	<qemu-devel@nongnu.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 2/2] target-arm: Extend PAR format determination
Message-ID: <20170711102521.GB25504@toto>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
 <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com>
 <20170711100334.GA25504@toto>
 <CAFEAcA_XTrkAN1ATpp6DLZqGh4aL1gECzQGyubJmoGjtw_pPbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_XTrkAN1ATpp6DLZqGh4aL1gECzQGyubJmoGjtw_pPbA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23188.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report:
	CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(6009001)(39860400002)(39850400002)(39400400002)(39450400003)(39840400002)(39410400002)(2980300002)(438002)(24454002)(189002)(199003)(9170700003)(93886004)(63266004)(50466002)(47776003)(46406003)(6916009)(2906002)(57986006)(106466001)(23726003)(2950100002)(33656002)(97756001)(6666003)(76506005)(189998001)(1076002)(478600001)(50986999)(5660300001)(356003)(83506001)(53546010)(54356999)(8936002)(4326008)(76176999)(81166006)(626005)(110136004)(6246003)(38730400002)(9786002)(54906002)(9686003)(39060400002)(305945005)(229853002)(33716001)(8676002)(77096006)(4001350100001)(18370500001)(107986001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR02MB2724;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;MLV:ovrnspm;PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;MX:1;A:1;LANG:en;
X-Microsoft-Exchange-Diagnostics: 1;SN1NAM02FT007;1:uOPcnAXjdxjqYWPo0z+X0gwH9UjG41ztu/Z6CUVJAoIS+Ytq81MeI0K5ByEBNCi/np+2oP2IhbLeXV5aD4sdPtieGF7K0JvPHXVwyus50Bk+V40nQXvqjCtx5a8SoYDPkwh5gmRQmOMkYwsZwobsHKBFtHePD6himB213c0PkWiIvaVFPs2qPL+oMxFbCX+PC1eJEY03vdwv7kEmC23Wf07IXo5UKreN8IgzheL2g2Duq3K2d61EMmAZp6nbl0mPrmpilDPGTbnJoi8z92+HvevnkOy0LahEOJGCnS3j5ZyJf5Ff8KBf1OVB987Vy5NA5/BiVFPT4Ea8yjSci4AvLEkSRvKR23U1ZrRCMM9QSn4gKxskEBd524KfnUrzu3Ctk2BolNz65e6+IwxAiZTKGLPGm+wJhGgEoFNi0STzn3Xw8pAGBIA9/+2yjmuaYGngMZ2XTb+gsKsk/Bu4LthGoAIrkskWgFqZ1nLe891gfmHusBDN2Hjr/xZytBlvHIOic1yekraxz0l6+dZ5ipmhc3z1umYHIVlO7CGKTYQ/zRKY365ue0A+j1+ZD6kj4ZPwr4cx/1h658SVoZm9QsRtrCb6VMuC+FPvtzUAAmvIrc7Z1AcR7TrNetTq4+XZ6SHj6gYMxY1NLxjqEyLwzSmr8mX9elwWUQUjhWoAUjs6SuM8ajcq2oap2Zt6umjW1oQSQ70Hvpkr4/Ahz7jJJdqZKEExDBduCaTNiiiaCUJZ4yih5x5z7qMPx4dzwJ51gaBEraSNW0XrB69CLexQYANKt2kWoNRDLPQDnPThYDgnEJyVelwCkE0M18YXko32V2eti40GKAzTF7mRq5wmtmoo3iT7SWqnx62gJ2vNHoFApWbc2chZ5j/HCzOE92otKL6NC8rFlLNmHr4kI6sX44qfGQ==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68c877d0-cbb6-4fc6-396f-08d4c8472702
X-Microsoft-Antispam:
	UriScan:;BCL:0;PCL:0;RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(8251501002)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);SRVR:BN6PR02MB2724;
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;BN6PR02MB2724;3:dZSs37INm70+xNMAOcZakGo0YtvPRqh9lVD8hRvL2d?=
 =?us-ascii?Q?xAS1I+IzlfeA5JCgv6+MoMo0zb8n0PvGCMvSvlbIyfRXYwwxH26xze+WJCK1?=
 =?us-ascii?Q?W3Wg1+V42wCiHq/R5wiTr5bNVGDlIIXftADBJFTZtRlIRV3gMPyNQr92QJCC?=
 =?us-ascii?Q?QY0gt/XNGQkbyKilXoT/8l33bs55bIjhT8Oa8kiAKtNDz4hPW4vzNEKZr2u9?=
 =?us-ascii?Q?PCBOMxCOnocVukLKn7eBhBF/Mx/lARlkO9Aqn3mM6TFGIbKjxPbAVd++Noz5?=
 =?us-ascii?Q?ii7ag2caqRmsCZHM9Wwaap+/IAgHnsTPZt0PeCGsLJ2lH1RbOiGp7ZZpPJC9?=
 =?us-ascii?Q?9Dh4ftGDH8c2Uew7a6dxF6FNnbDwYK8U6NJSDAVSK6TtPnmMBhaTMT+wHgzP?=
 =?us-ascii?Q?1VKwAmDkdg1zm/JX4WWVWt9fra6v6xFk+md25SO0MAviG7BIMlwRydHjCuO7?=
 =?us-ascii?Q?PRH38vIjrYHZVUnwPpf30/bvvfndX9a3WCScdAI3gmL3kWn5U7E+cW62rloU?=
 =?us-ascii?Q?LtJB9AYMu6tozOgrwvWeBkDWo1ujBm2z1b3sGIBcCUjtizXEpHg6lXgvy1Er?=
 =?us-ascii?Q?0BEdy1zX6agYm5b/KHMgB8fc8EoFG191xYPS4pHHY116bAr7VQBQC1Jsw/zz?=
 =?us-ascii?Q?5OSD9vdal8dowCBQ11V2NmWk0W+C7RR6wZjTIb5taB/xaeBX+yW+kHNECTH3?=
 =?us-ascii?Q?2BrgP0Rq8CAT9CQ7ZuHaVioaY5yrlEmbmeiRYHIM0ZqpP8RRoQWUksME9QkG?=
 =?us-ascii?Q?jHEbr9MLQZGblSjkobd4MZyFjbUuROn0EqQuaresRQyhiBOKdQzpolbBw/mO?=
 =?us-ascii?Q?LYhC+emrgjaMCFUgw1PBV3uNkh0uEFMm+33RUKYak23NhnP+KWnVeelVVFMd?=
 =?us-ascii?Q?xKJwJwF3+evdIhmc5Cg3Xi8Ok1vrdu2diJQ8ASxBU2cZxA6J84n6ktyQC564?=
 =?us-ascii?Q?/EbR/WsQt+Hm420uxSg8qzdC2FRW5OVCj2eC5Ymg=3D=3D?=
X-MS-TrafficTypeDiagnostic: BN6PR02MB2724:
X-Microsoft-Exchange-Diagnostics:
	1;BN6PR02MB2724;25:GPRTqSmwckoGTlFbGDosthIhqWvzG3e88f+w3L9PmZ2APA0gExPzg2CsegkpHhxkMWI8lSQu8LF52XL8omB0NIMLyeNhc+Kn7v9GZB/faoutUe/xDI78xyhEc3xvD0nyp/oyGrW0oFP6pV8rhaccejz/Npy8cZ+9aprybNdEsjkw5ThvQsS0AcAmh5ZN5juP3WoS0uVhUeASz2Py6/dkxmtRWHjHqTMoa1I68Q4R+ESTML6ooFxajHMdzTpg3BdeKT7rcdePQI+gZfQ0sU88LtWhLJ/vgcbtoEzndpui3P+vx+qbWalTwJR/xvf3RYOb7o8jtzQVuRt4VsJxNcSDou11HDYFJCAJ8NmN02k5lI9XCi0kDOBpXyKtil2oKLBM7ae5KPfXbqqIq6PzCkpA0CQn2TjZeI4N7cc9k7Rx1PINYLHimxLHVMCsqeLpQsIarhAvP1vO8ypic8Any42sBmOwJJJiU77Yk2g2e8Bz20ZK1IZ1MtVQUA/utrtrvEPwPHkTOtITfV+svp2oF2XnLZ5Z6A5ylg+NyvldBlQCngwvk3jNYRyc2UYqgOrvoHpRudwFK/6K6C1R2oMFJQ1agWaHdoca7d7x7k/UkZiQzeMlyZ4Ww63SdqkrL/BZ70I1MGT58kFkX7m3cn23X9iqSNSzsmDcjNaeorV4xpk2L0NJskqrC9D32+cTBkiiEOYx6KVg9o1bJFoynLPU1Fu6/OwuSxq2rcBpdSysSJlwuw6mpqTX8bSLPn2XGMaGNydTl4H753T+zzl9PNqK0ERHxAnIN0VqJY+0SBjVOx2RZMwFnQyR4b8pLXGEs2oVmepWmYFMX7Pid56g/8gMKQeW1LHDRyeeTLPNYxrKi+gHxSJsk2XQjTrgsSiet1rKl8eLm74TsxGbqwwAKtnwSiZ9xADmBsgHd+sGbwvgbtsdYzM=
X-Microsoft-Exchange-Diagnostics:
	1;BN6PR02MB2724;31:eKqBXnP0DZUXoJ3GMnH1gR//GA9f7ZBw/slottkjdOVtKioaLEFI2gMHbj/mnyXVsuaLQO5POx/+OomQtfkGzr6SDose/dJB8Ui+/5/K5OWubMR+yJRjxuEzp4lvOXpegZlm79QSsCNlLP1O4T7kMCjzLV5IPAM02h3BYm037k5v5F+LTyHITABvA1zbPf04eHL6oMfWylZqgIlD5t33f15Cno9rje6NqpSjoeV9D1VFYiJBqlAXO2Mp+byUaO3PXalcPb2N3pjwUmNBajcbRJrFbJx7rk1KlspHRbLPZDCLQG/n8F9AeGpd2FgmjHUlqxoTK4g/JV1yGpCWaqyihW54UsnZjCJnyfEfvWTUzeSbmY8mduAkRiQb3D6FjKexVXFivib2ZmusUR0ugOOpc1eZa/9Z+hlONFrtHmfuJotEBEKg8W+oBbXGssc8ifH5ce/5zhjcoKyGyqbzwPCwbI4ccAIjC/7ejkY+q/F8Zw18enkWUBCmmRfbFWblAqdfXGC4IDVR2dc8L/MREHGZTRj0repbx55ESiqyKQUXuhuyJmzOWBzQ5i7eOSf7niaL2apN1Xj9uxQBwGu9yX7VW39n6ZFbdDQrPR43k4VtDfMLVQPS8gojSUeVhBIVAELYP+7wXCAGY+DUw3fb0Jv6yyZnS0r3ULbkk5eHfRmIhH36FNonhfZd8NqFBz1V1VpGL5lQHQYEBWOzYofEhzg5xpXGGxjeINvMEfQpm3GJn/Y=
X-Microsoft-Exchange-Diagnostics:
	1;BN6PR02MB2724;20:trYCdZGh2nT3UAs8kjlwA5pddCFwB811Jkx1gTb3lSO3o9xFDvGZGUh7ztZESakwtSERCAMYYXnLOI3CaSGR3LCzL3vR/qFQlnY3Yj6RFtC1KRMf92uotmXsPdfshRV78OsYFb1Pwmu90MV4w6Cdtflno14BN/NHSw30XO5hTdnOzc5M6+7cQHZ14si0MrUIB9jK8qiKeGuEgXNbwbFfvq3nUImEV9N3Uv9+cHoormryDMcwMCNDrNOt/vmIv9LQYtFYA7KiXIYn4YLPL40N1GSb2pmske/Zf14PdG67pdtILab6buGkL/pxtcL13s3BFJP8qS5bsUGfDPuvBeA3nsr+A1lNTHwDQYmKLCbGSbmZZil3FUrkM8kNa3TItjGs/ffOf53ruInlV1leDmj/lml/IsnvGLwCT8S9ueYhvrk4BJIemw70gAZO8nDCLNVg6gUeG+NGXTiN0NPkm06p1M2MAydXRlOoJvIYl8qKQoBL3BS/ZwjdfLeL2oBtXv4z
X-Microsoft-Antispam-PRVS:
	<BN6PR02MB2724A15E93C8A697E800943EABAE0@BN6PR02MB2724.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test:
	UriScan:(236129657087228)(48057245064654)(192813158149592)(148574349560750)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test:
	BCL:0;PCL:0;RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(2017060910075)(13018025)(13016025)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93004095)(6055026)(6041248)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);SRVR:BN6PR02MB2724;BCL:0;PCL:0;RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);SRVR:BN6PR02MB2724;
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;BN6PR02MB2724;4:Z1MPaT8k5lF5V29IyoOLNkXeXL97qVz5OpIBDwVW9q?=
 =?us-ascii?Q?deOOWlcyILa/YD1pRK4MaSozqpgeut5g2TKuJwqQ6AfmuL6zqn1vyPqaS74I?=
 =?us-ascii?Q?1qkkKlllrpcZpAxw5IZ/Cnsvyoms3hEPSe7hC3IhEM59IiIydXcCU+o9dGzA?=
 =?us-ascii?Q?8ISrSV+SoiZpb9yerEmp5Jos6oDKhRmaKKHHH28VeyOjhn/wdPYQJ7G5C6Ue?=
 =?us-ascii?Q?dOU8JlPSayw6TRXtpm0rJ/bXZ01+JeYk0qLcLf89WbcGMHjIULjbHIy5iwa0?=
 =?us-ascii?Q?0g/AyZ/JaT1vGJqn2lGil78ZPr+Lh+chkwslf+uztYfwsm5yVRIakvYffrpL?=
 =?us-ascii?Q?ZEW3kIeQIvxE8kxG8A8H4L8xOFgQ8KSkzc5xwrQxKgmLKA1S2/D2w1zN4jHF?=
 =?us-ascii?Q?gFad6xyQZgZjICZLA83atHMxB5BzrZoeLzATAVtBYUBj/DwtZ0uD54pj7Bb6?=
 =?us-ascii?Q?PVhiDwsYA7t6CcBHOsQgMwwUx4I542Bu+NurtQywzduKedHnrtYEshaO+1A0?=
 =?us-ascii?Q?i8K45j2GyzlgUYLCyedUTEVV/3bR/XZkfOz94dFelAA4yc3q8srHc94ogQwC?=
 =?us-ascii?Q?HHBvrCXAQ18KzglMTwsYUynKkvQTiU76DF/w3EG8KTXtMRBV+hhMmVX1hhea?=
 =?us-ascii?Q?lyeHb0CLE4wQp8BWHs7bMcORDPTysudvYGucnIlHu25z2QejC66WGiI88r2x?=
 =?us-ascii?Q?MWj/pEX+JvEmOwzomFfB70TakCfWqS+3fgay7QSKl8UTYh140Sp/pu/92m+Q?=
 =?us-ascii?Q?N347Z0ETbRGE6NtmLz4QVmhFnKtbVlEvUbXhBrCGMccgtvh73F9c2jNGB/3i?=
 =?us-ascii?Q?DubuqgRGSpQ2WKh4/tify2I7ya12H4o03dYkpa4F34YGz/LmZ5T72J731mYA?=
 =?us-ascii?Q?DqYUatjXNt8PomaiVpWCxiDJ3UiCQMKzgeq63m3xiL3CaLGc+n8Ht1m6sBR3?=
 =?us-ascii?Q?hhx31w6r0sLhRMB9u7w3iemRPbWj3HdM5DH9wxPsm5dgoU5lXeJfnk5sIjr+?=
 =?us-ascii?Q?5J2bABLv6gvK4PvnoZOyzrIQdYp0L8eYgz40xXcl3/IGqzfKn2Jm9fwPFEZN?=
 =?us-ascii?Q?aqyGo1bso7FslUjrkl0iu5FgH/Rj/M2Mpn+t/2CslXyXl3h3rikUEeHy2SrK?=
 =?us-ascii?Q?c1Cidz2MTvcL0q/OUqm2cDs23lSnXMnCY9j9LtoAx+JUq99EgW/WnMVFHC2r?=
 =?us-ascii?Q?wKhFSc1aBJjNyNwLD9H49wiVomcCP5Iayh3yxLIrAYqEuCpnY8EXdrZ1iMNW?=
 =?us-ascii?Q?PCIEC0WQdZylm2Mrzrq37Cu+eWP5RJBiudqPpyF5KQPJvujPjNXWC3te8hCn?=
 =?us-ascii?Q?+3Hh76DDFZtaIhQjNkUWYFwHmUrE+HPbum9JePD4GU1XwwHJtmrQi02RphxK?=
 =?us-ascii?Q?ltYMssRoxv9uuqZgoyCeAPjEiMt1w6Unnqqu2Rlpvoei+/5iZiJw1uOF802/?=
 =?us-ascii?Q?9QpL4Sxw=3D=3D?=
X-Forefront-PRVS: 0365C0E14B
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;BN6PR02MB2724;23:SuBl2qVcD4hWJ1oMToIjpp57CPyi7C6Jtv4IkihPb?=
 =?us-ascii?Q?D41jJFtEI/HRoFECQWae3rrieUh3iBBrETHRb1+IBX9GHQqsPhSFqQr2NpFP?=
 =?us-ascii?Q?38l3RiEP97Dg5ztrFvltdxRO5uMjjqw2UgfO3awURnhydjDk+qGjqWoVA5E4?=
 =?us-ascii?Q?T+Gx3hNbnHn6SRABPacNcNMoWhwX5iDH238CYN8VZIz7gLZ4q0w6hj5ibfKj?=
 =?us-ascii?Q?ZnACQiCZsb615QGoyez4JOfsJS/1hRoM+WWzYJz0cI/LdXHEkrBlqRL8QC+m?=
 =?us-ascii?Q?m/j3xpm+0BJXE+8JNwk24KQzydtcrUjrYLF14mrUFXWteX+QVbtGYQOcfJsB?=
 =?us-ascii?Q?VcJ0F1ZxpqiOaRO+Ag5sMyQeXDki71uXLT6fYi+PZ4V5LBxmsfz/+Z4c9XWw?=
 =?us-ascii?Q?sSXZmz347NxKvdoY6bCnWJlICYoMxoh7gzNB8ARXxSMBw8vRt8OjAkMZ1lZA?=
 =?us-ascii?Q?U3Xci9NYrGq24teg3Z0FqLVUN1kewYRvUT4x6D2rStPHzVCLIsKDggdw94Up?=
 =?us-ascii?Q?danePh3UmquKo03qYiis8rVfsRp1hwqzvtUp+PcM82i1RgOIrjTfhB5UmTx9?=
 =?us-ascii?Q?qELtJF3L12eJKM5bR1n+3bQGd3hDfFzNwq60nGUdqU9OGafqym6uO4msIhxf?=
 =?us-ascii?Q?eky84DdI0pA8bmybtq4NV01yk90IERRBkLNOQnw+NyTvVNzad7VYOaNEIkpU?=
 =?us-ascii?Q?DMzoGz02v1G95qnPuwvmcTGZ3RBW9AskbOlnKzEyvGtTuHrONTONKBLtxfl7?=
 =?us-ascii?Q?ccONgZGp3dq6A1kEb+gP+dWhMGiuk5CjP0jCe0OgxloSM4tgcOiJFNEZ0kZk?=
 =?us-ascii?Q?KRKD9rAmCdTPT9LSJ/8btzLU8kRhzlf3Q3goLO9GqHDeh4tsEkLoUMFD6mMz?=
 =?us-ascii?Q?L2p2wsdNBuniRfiIGoM5/Qaqvt+mKzsLASfwm8I5LtphZnte7aNZhbAargT5?=
 =?us-ascii?Q?rtOByLIxxKR9qnDtV9qQ98Iz9DfM8Ogt2+gk9lD32GKc2by0LYYxIb1jG/+T?=
 =?us-ascii?Q?yj8FIEPJQ5SziHUbbc+o+M8eOkQtYVTxm0EELPsH6b3KBorDPRTnazQ2rTWT?=
 =?us-ascii?Q?GLB+DVI+BmWhowB07Z36RhGmQhI0W6yYhRreMaCOuL0+XiOyccvo49c2FcVG?=
 =?us-ascii?Q?0KDx7R6o+DZkDyBjMxzkeZ1ypgkwD6BQmpK/bL4egPKLNSjjpGsTfK6R28qh?=
 =?us-ascii?Q?0IdfnvwcAjDcagvHmXGo1Xr/4EEfq8ZcYqJ1mmnKA8LZjfWmrMLYMZQrzNeV?=
 =?us-ascii?Q?ImaOUoZJzMbmCo//1qFWEMk3Djg8d6PgU7U1dY7+guSnawtHdTLM0dHBzVLt?=
 =?us-ascii?Q?jczUN/hSgmbQzKoajC2KkmS98LXWlinnfuhGbY2nB6LtjDKz+mYmg6/bMxUT?=
 =?us-ascii?Q?djPrKbd+tR6KwxAIyZ4ZNy4MCw=3D?=
X-Microsoft-Exchange-Diagnostics:
	=?us-ascii?Q?1;BN6PR02MB2724;6:OtWi01bwZlb4XlzGqqtUff0sSX1k1TsOGUa3X5awYt?=
 =?us-ascii?Q?Lsh7F7wGNcJXjmspeVJ5YeOw3QTw7P0l01bfSF0EwOK7vhdh0xZUfuPZakEd?=
 =?us-ascii?Q?47RHdlAGsrRxXtDy18KhMLo/6tXaIA0+1DK2W8z4AUgbzvC/eAc50ycbYAB6?=
 =?us-ascii?Q?Vttb/rjHzN4+leastGj9/8ephrxTrrzb1dTGsOD3ansplQBK0hqrnwybLx0I?=
 =?us-ascii?Q?rqbSyiUeVoWeIbbHw/HLMkDA2MQBFvISSFvs9+F2xVSkwvXl1oVDKY53f/yR?=
 =?us-ascii?Q?Z/HrlvRkAiytQ3/ep2O5nMB9jMTwYzRnJX5yklJFNa+XeWjQbtRKoIvT43Hb?=
 =?us-ascii?Q?TpNQldREbMlmd2yw1oqbxWrAY51sA1yJlL++D3l/PU1K+IhBT4Yk1d5qEQAw?=
 =?us-ascii?Q?bFijmUoE+sub7AXIUmqH5jgtOajR9A/B1xsMmf+/Qd2JtQ/i+FoWGaUnDTAv?=
 =?us-ascii?Q?OtuvMYdV7VmmUixlYX8bGX34VuvtzL8lUnh/z/GrR8gH/3ja8S2Czt8f1Byr?=
 =?us-ascii?Q?LL7HFVK34ISJb0N8FdNtoIW4qNnoLGMtwEa8abpwqLFUMBFpgs0ZvKdTOa7q?=
 =?us-ascii?Q?N9lX6+9lFWJcz/MuWxQZ/okPvHIXeHMqhvV4R7v1c8UmbS6XIPwfqPDTPI8W?=
 =?us-ascii?Q?dir5yfJ0O3wkxvb4+fhNlCcj/QlVGmd+471IP+udgMYDpPMtX9a86Q5OgHDc?=
 =?us-ascii?Q?at0mjLWpW/60hkI2oQGt62qeICpsvS2i8yiIWd+TIf0TnloLEdHrCNtqxXFP?=
 =?us-ascii?Q?MJ5+vTLxQuoKaexCWoLd6r6HBKzgJWGmRnzxD79o40423eK336+mqMvlLTel?=
 =?us-ascii?Q?+69x6kl4bGmVVjCyCuoAe1Nbe1uvUjdg2VySNdE9ouBh5j75aHATIulsFfZn?=
 =?us-ascii?Q?5qk44FM/v5xFYXPQ+Tera5o1SX+OJ0Khu1bRqWddndQ4B2LsQ9oQoAYWZipN?=
 =?us-ascii?Q?E7oKs9NFPjyvwSh21TjQt83Nf5xitjbOZ0nMwYoAQ78QxJB/kb04Q6vd5f2F?=
 =?us-ascii?Q?NTJhYAAH0aDgjB3ELTM69R?=
X-Microsoft-Exchange-Diagnostics:
	1;BN6PR02MB2724;5:PYnCblMAblKopwEEKW6Qzak9GxkknJGIep6cYdA9mdQNbCh6EqEEtZ5Y7pFWNwvjwGR6dpEfclVsDyywfQUwKXXUqOe1rH5ChB3a1xbTpDOSWYZ3l6R0SX4xl+gGV0hZ2/91K0I65srtj3yFYscLn4lfwOt4WEKMQo6Ms/39o9XFdsgOx87l2e1eN+3urOhsxr9IpmGCqSI9r+SyWOG4h6KA9TXsfAF1iwbyMU84jO0lgiCS8xNf7s+YNlqqiRHGkAWhAfIV3HOEQzJ1eCM0LI0bypYiwrFUynfnJvlsTgoKq1K6EnN2e3HHC/YWMUlBZOw5QQgscfisWrJKgNqiynC3QPLTZn20/0+j0o41ttDE3JbekWEgPYko9choLEEgb/kzRHcS5trHqwMdGy3mkt/fg0GyK/jGlbU3jh2sIjiHDYGED6Qhay47M/gl7CjAS415EyA5P+zCiqTNlJP55OVDftGHdjpQrQuIp3eQxbTQurh9ltDdLBVOmrBGxjw3;24:kccdz7KK68uc5QL/i0n4zv+ag0+RAErEs1sT4wISmlgs2zYtDsnQst5Mq0bvYvdB9g+47ZzrPfJsAss+qsliRLR+4BFxLEWS1/YnduUu21o=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics:
	1;BN6PR02MB2724;7:SpxKnnvD84nk2o8a4B2zY8pMkS7nGTI57FbB7OYpGG0sJdfVSWc2qwOo54GSRk0Z4UjcHmdl+SG1iDpc4qL4kPgxNcyPcqt7GhGfmtOc8dmO/ort1p91aPTxFonAbrUFgZGd9hVai2lXGAn+/YiKaUZ0Hga9GMvERAJZR6mNHfoORs0YVL7wNs3/Y6uoK6i86uUw7+MUKjk8Twh3XRP3lBWPcAzPJDVfR5P64jyXzLoYLPs8ih9B7wRhbZrsbWam/640BTmyRna7ZDpErdONq2/yugZT5orKgCd4YvVgvQ5fytBuUEwudBxS2pk1HCoTyaRETZTZFXR0kGH+6wkPtHjJM8Uwm5kzs/eSKjvq8/OldxUBMdrChqFh5eABbYOgoAmQZ5Apt0XH6Vs+WswCssC0H/uwACsNFqX7DWQoU05Jm856FhQIPjV7fQ3BiFzm8D1Mw+tIGL8MxWYc3sPlzH6LbbwSWFhOBKWCDttdjhPSAZHjX5tY/mIHr0Ivc3786UdW/wSxXGLQjgDBm+TB660Lqrwiw5HKGWOPu61exkdqQBxzmr7xQu3CmYK2mXVFAknKPfuV8k0aTvL+peAdyM8qyxr4s9/Bib7cNI6ApIF1mpv5peZTUxuyrio/ukdXxg/6C2ZHaTZVnXQHEhlEFgDlGf8JMFx284o5iKdXElb0tuGWFuGRE1TR1NNGWR6qJFSW0QCqSu/+eBakgLrz7X68n0H32wgrO7slaP25KObE3T2gKW5frlbU0lIDxqzGiYXW6+H5pifZXhoba8lbHrTWqEbduFzf20AHuzo/L7c=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2017 10:25:28.6116
 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2724
X-TUID: 5NC7wBEFsuUi

On Tue, Jul 11, 2017 at 11:14:04AM +0100, Peter Maydell wrote:
> On 11 July 2017 at 11:03, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> > On Mon, Jul 10, 2017 at 04:11:29PM +0100, Peter Maydell wrote:
> >> So this kind of worries me, because what it's coded as is "determine
> >> whether architecturally we should be returning a 64-bit or 32-bit
> >> PAR format", but what the code below it uses the format64 flag for is
> >> "manipulate whatever PAR we got handed back by get_phys_addr()".
> >> So we have two separate bits of code that are both choosing
> >> 32 vs 64 bit PAR (the code in this patch, and the logic inside
> >> get_phys_addr()), and they have to come to the same conclusion
> >> or we'll silently mangle the PAR. It seems like it would be
> >> better to either have get_phys_addr() explicitly tell us what kind
> >> of format it is returning to us, or to have the caller tell it
> >> what kind of PAR it needs.
> >
> > Yes, I see your point and that's exactly what's happenning before the patch.
> > Some of these new checks are generic in the sense that they check for LPAE/64bitness
> > but others are I guess ATS specific for lack of a better term.
> > It feels a bit weird to put the ATS specific PAR format logic into get_phys_addr.
> >
> > The basic idea here is that we never downgrade to the 32bit format, we only uprgade.
> > The following line was meant to get the initial format I think you are requesting:
> > format64 = regime_using_lpae_format(env, mmu_idx);
> >
> > After that, we apply possible ATS specfic upgrades to 64bit PAR format if needed.
> >
> > For clarity, perhaps we could make get_phys_addr return this same initial format, and then
> > we can follow up with the ATS specific upgrades. E.g:
> >
> >     ret = get_phys_addr(env, value, access_type, mmu_idx,
> >                         &phys_addr, &attrs, &prot, &page_size, &fsr, &fi,
> >                         &format64);
> >
> >     /* Apply possible ATS/PAR 64bit upgrades if format64 is false.  */
> >     if (is_a64(env)) {
> >         format64 = true;
> >     } else if (arm_feature(env, ARM_FEATURE_LPAE)) {
> >         if (arm_feature(env, ARM_FEATURE_EL2)) {
> >             if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
> >                 format64 |= env->cp15.hcr_el2 & HCR_VM;
> >             } else {
> >                 format64 |= arm_current_el(env) == 2;
> >             }
> >         }
> >     }
> 
> This still has the same problem, doesn't it? If get_phys_addr()
> has given you back a short-descriptor format PAR then you cannot
> simply "upgrade" it to a long-descriptor format PAR -- the
> fault status codes are all different. I think the "short desc
> vs long desc" condition used to be simple but the various
> upgrades to get_phys_addr() to handle EL2 have made it much
> more complicated, and so we'll be much better off just handing
> get_phys_addr() a flag to say how we want the status reported,

OK, yes, the codes will be a problem.

Telling get_phys_addr() what formatsounds good then. Will have a look.

Thanks,
Edgar
