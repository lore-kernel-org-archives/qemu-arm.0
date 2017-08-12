Received: by 10.25.221.202 with SMTP id w71csp2025599lfi;
        Sat, 12 Aug 2017 04:38:55 -0700 (PDT)
X-Received: by 10.200.48.170 with SMTP id v39mr24283105qta.114.1502537935033;
        Sat, 12 Aug 2017 04:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502537935; cv=none;
        d=google.com; s=arc-20160816;
        b=S+/YL5PgeuH0EDRAR2VBsy0haKwekIWAZQ5BwB1nDIS/aeAh6pD8UtKCkjmvX7nT8z
         tYwkrzmzeBZeEx7KCdJkw4igG7gMd2S/NgsrNWJrfQAQh4zR5fmOVf11CezTkrB7jGVb
         kPOLaLENIA16TSJpCttGfUPJXfbnudb98HoHh5j6G/egMmjnrpd96Q0dSEThwqKSbb6V
         deeTNGHfANzv/H/sxTUklo03kEmP0jJkVQ0mAfbgN0NaXCkbj3nqRuu+1uTk1IWTwVcj
         6NqWGhcRb3zI0j71yh3eRlO8/37rJvUTA+GlqMEj4IxCI+Op843xvvyR2W0+3rYqR/cn
         ayeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=WbLZGU+v0KIECz/U4rPJUko8dRWPmYK2FZSRnNhyAJU=;
        b=XVqXAnmgsZ0kuLoOtUQv/dJBBdb/WAPdF9o8P4WSJ9jt+0wWNiv8P/BlyIZU86+qqY
         JLI7ubrB0Atd5CX/HnOqLisUE6mm2Y6zu6DNYFuamThoTYjYPegFVXgWQLDoN7esjYGs
         pdt/cBAyDC231nqTRm/nI0GjVJbAjf5zM9weLkNB42jZBzjTUOfysdZlfKxdBO1b6Piu
         41Ngg6F/fLGeKFWcl3YB+kybql+KJzqZJjIng7NIPxC3zUUT07WTGrkgmfzWhImeL28/
         LHaN4bv5npIvrhRFfx+f6ude6e0nr8aBzl3KBUmScgU7CKPGkf47y3tXpdJ8evWScbSj
         nJdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=stJwkDmq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c70si2555125qkj.133.2017.08.12.04.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 04:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=stJwkDmq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgUkm-0006Oy-4G
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 07:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1dgUkd-0006MJ-JU
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 07:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1dgUkZ-00024C-J5
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 07:38:43 -0400
Received: from mail-co1nam03on0076.outbound.protection.outlook.com
	([104.47.40.76]:53170
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1dgUkZ-00023O-87; Sat, 12 Aug 2017 07:38:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=WbLZGU+v0KIECz/U4rPJUko8dRWPmYK2FZSRnNhyAJU=;
	b=stJwkDmqw4vUO4UnBK0K8zs0Xg0T7bLpqCwvYzV8zWkk0eMu2s6Q9DcfgwV3FrDtPU+G2Cb43LlszSecbgixETIMctqF/u7F79KUFr7Ukt1rzSn13hvfijBbYNmFuMmE+5Tk32qbNvFlRuJWcxaKCJDdvwiMIWI+OZVQUagmU/A=
Received: from CY1PR0201CA0034.namprd02.prod.outlook.com (10.163.30.172) by
	CY4PR02MB2248.namprd02.prod.outlook.com (10.169.181.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1341.17; Sat, 12 Aug 2017 11:38:36 +0000
Received: from SN1NAM02FT011.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by CY1PR0201CA0034.outlook.office365.com
	(2a01:111:e400:58b9::44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Sat, 12 Aug 2017 11:38:36 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT011.mail.protection.outlook.com (10.152.72.82) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Sat, 12 Aug 2017 11:38:35 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUkU-0003hq-Vq; Sat, 12 Aug 2017 04:38:34 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUkU-0002C2-RM; Sat, 12 Aug 2017 04:38:34 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7CBcRle017663; Sat, 12 Aug 2017 04:38:27 -0700
Received: from [172.19.116.66] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUkN-0002Bp-6g; Sat, 12 Aug 2017 04:38:27 -0700
Date: Sat, 12 Aug 2017 13:38:26 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20170812113826.GX12347@toto>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
	<e554047d3a8376721ab5b33dbe8e4162f2b14475.1502488636.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e554047d3a8376721ab5b33dbe8e4162f2b14475.1502488636.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23252.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(24454002)(199003)(54356999)(33716001)(76176999)(81166006)(5660300001)(2906002)(6862004)(81156014)(50986999)(63266004)(8676002)(77096006)(4326008)(33656002)(50466002)(626005)(8936002)(39060400002)(46406003)(305945005)(47776003)(36386004)(9786002)(23726003)(356003)(1076002)(15650500001)(106466001)(189998001)(478600001)(83506001)(54906002)(97756001)(229853002)(6636002)(4001350100001)(110136004)(6246003)(2950100002)(9686003)(18370500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2248; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT011;
	1:zq5X6Ugjo6oL59l9CGUULVgEg7Z36tA9e7NfnPFJictppmqyDfQq7B8/UdFjhryLa8eeb3xDwBDazUm6bY01LDWcMa5ENdcSVL0ejUHFPdyQ/3e8tLp31j42y49cTNtu9kF4aZKwp2R9LdGCctbu9/us5AGzCVE8jkA5D5sKS52ndax9NY8YhR3yEaGBoycWR+qmVgK2het1Zi1ONYsR1UHzWJK7q/nYospyGKxGehI2fb/HHMEhit9INM1I3JbwXLzCRhFnwc5pUuE3jWK0nQA3Hhcl9MF1we27UEf/0IbZ+pcU+Z2gqrBNx6UqI+XGQOsqGYBajC49ycuqooNckrDD80xmwKz+L+D8LjUzU4xL4gESiGlcgs1By0kO1ta+3MK2XKpgHmHSl/wa8XylmBCXiNW6hrUZtE+FkJLcJehm+oXy7ltvvzdkQ2b++ZbBz2jdcdoMysEbr39uIY44Dh5ISmMdrCpx4+oUqhN5M3WEhE/Off00pcK8dfpdSf4TNNghEokUnbMUEsgpHyp0QMdphjzuf9S7BtYkyXSZdGENcL3jXn/HgUdVWFCm8RVnZhQ81qWJ+Nk9cOQGG6ilTwLXyuUoPiE9OxCYF/RGJCNvysCYaKi36X53/gcGns8ylqDMTJeBkEZHOyFMRUtRXKlrmsNSzThsVIgcvUsONhR0p9zSl2X+vFzndVlhRVjiVsybgH2PoaA1chJc7JQqLF0eNqS0uvtE0PD1G4a3AeAZDfT395yOneq2YyqzDZvcGccuF/41CH6dob5sWIUz2Wf+idw14WCanK+LoYzKVOz4/hpo/Uo4yMxbTjS6MgbqJV1FmgWmmsHSuaCAQFh5Qg==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7d09399-0e92-4ccd-27ef-08d4e176ab18
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CY4PR02MB2248; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2248;
	3:NmjDSMSzNvTK38Dbs/P2IOGr6ZdqIeoC0N+lt8opnwzCBcnOhE679rzeKX1hKfgIe5VLwYxGXLTfCWsttotUIqZ8Zp6Hy6kASCInn0PEEIhh7fThNha4pGfpSrBbgRG0WLAsVQas7SS66A7dctoeiUNCRaEt5wb2u9IXbB3e8Rc5baJ93uVCB0Gxo+na6SzgQkH5R33q8b8tQ4uaNkRImxSMl+H49vxdR0Y5tGAd3EqVH5bWQ44ETpcEyck2WUZJxLOk8Ni97tyGPXYnERQF9UAaAg8t3cxj9leaIiaphNGtdMtx7tpQpBBose/9LBHHEBT8zVo8WHuF/zlXHwNy5VugA2Dty3wZoynQXHnBg1o=;
	25:OpSa+URQxLjjgHGX/S4SjMsA9tOgkXAtTkbHc4YrexF7LphFGiUndaA4wlBUppI71QgfUdUhygqhzpYtUfasZKHgFrWaSV7RwibcEk1fJ10UeKd1Q/09Bp2wLETEB8g5ZanRjwpHWFha/dYMwGfOe4hfphpBuXrei00vRvryCElc7gpbRbrWObpYOAejmg6AXzfuiz3/paV3rgZk3w1RJMM1lftTDRstuSYSHUquX+UgbByUNB7aruhtxZNEkCKFYGzinpbonx+rMZCWy51cdarRH8W9Nt109G3yc2X0EH/9LAI4kP7ez3cdy/EAL2RnjQ9/F1GOcI29YzbgJDSqIA==
X-MS-TrafficTypeDiagnostic: CY4PR02MB2248:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2248;
	31:yZvnHqzc9jGEe4hO/P+yA8ZH0OcIuPimlWB1yZyzSuU577xQDxV9j1MsDvkHyNF0OwbUD/gK7gckr/2U2//gb6JDyRaytSRV/GU8xJsOwX/rcQ+qdfAB+C9yHsW4GMTEHmvyb1+ovwACwI/pNPDrAy7WXfnBG0HNntv2/Lj5abeQY5x7mfN0VwwdzJXLv+1UgYp6YJSwUH9jeBqD5XGyd2+eCn3BtDNXTG5kD//bUrQ=;
	20:t06vVipnXNbRTPQgctQ3d4HCAxxZgDmA05HNWzV8ALkWhijIMHT6H+kb12TKE5anTUBQeoHOGMxrTlVTKtbR2axWs4o3LbyDfTPLfG4ZMXQE3X0fm2URaNwEokqBhYZ6ABBijZ6mQTIiWXvzZZRObhvG3xJAkTpRakwEmBfOJkBL2P7P+us7bJ3J2ATJdPgzZHUnh+ufa2qhnrksWrcKaARGW5lX8dPHPu/aAYlcPVkiSlzJRzW8BEU7uRM47MoUrH6TWPUbappyUmCc9d334b1Fi/Rd+KJMveNyd5pCqYLP4kFIVEpvn1b6UUjDcPoTTCDNj7muWgAmtP4OT4CqLoOKZYgnNOEix+1zgE8F39GeDWTpZITKIv7L7gOphAiCkcRyndU2opS6tD8s1PmmiGhzQiDsm7xg98NrktM8B/bl218vGnbAxi+UjgSn+QQ2FuDuSbKeYnC/YA8HLbFFvQNYzKXw6SLx/odE0hMCQwkfw+0d7tv0imQ1JxA8u1hC
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY4PR02MB2248C48869CEC599B4097E0BAB8E0@CY4PR02MB2248.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(13016025)(5005006)(13018025)(8121501046)(100000703101)(100105400095)(93006095)(93004095)(10201501046)(3002001)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123564025)(20161123555025)(20161123562025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB2248; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB2248; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2248;
	4:8HA4mCWkrV6SnJAloLeW65MdZq2GtRzG9UUr0osxtpf07FVFZAM84P3BR9tVOQaKck4HLqU49HDx3AFhI+ENtXyieB1ZKcUPGtpNn+78jKekJjzIuKu3u3sBkkV1KoQGFSafR2bsxkTisbnA4bmkVh+66zr4neI8Hia99fKVt52cf+SjbVnwbfz0PSowrFgOaKnCgVo7P4vovOm7STld7THJTZeVRShXLrLhaip+XCAZcptk12iBqdpexe4xwpltK5s02tCtJiNskT4xpwQKszlkVBLLWsADnbtftnFONFo=
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2248;
	23:2vwkIVWjBZHF+PpANv7DylyhcMw5kcvVsUx8BpO42?=
	=?us-ascii?Q?WSi5vHbI8uKhjBsm5uk44SFehUjavfQVAiInt3srK4wQgV7fh0pmItA+ZoLf?=
	=?us-ascii?Q?jXazTzB5oK+gUie3urC9ca0H8IEdSKWgic5YHkLJhlvz2R7/sMtwUJtxdE3u?=
	=?us-ascii?Q?IDNi1lRgWlwbpKdHK7dGZWwCTdFiX5/SlTGHPFaylZUKkpiuaCA2mxYsFonF?=
	=?us-ascii?Q?AdSx8rUiIz4EpB3OBPPLZOiA5zEL8epRkAJzlpDQ9PSAdGaUqw11w6iDzkY6?=
	=?us-ascii?Q?2V+h4I6PmoADn+tri1SXNbel/okEymFSmcQ0NCVLgEasjZVQQAItUyCcT8Ta?=
	=?us-ascii?Q?sAK748YP7ZI5e9dc/e8XmXyORJyzPMvnk+DMa7t1bJJouBhbXiatVjzj0jXV?=
	=?us-ascii?Q?nbmvcFYSNzpbTLuj7H5bMRHH1ypfAiDETGzFV4kZfOu5HE73ki7nU/h/183x?=
	=?us-ascii?Q?fRHPHTkRsYT/O0rS5SOclNzlDIqPJ/NaBxmtyFRGAxJAURn8KdxHBcFVomlA?=
	=?us-ascii?Q?ja5HquWxoCbYASmjwfhAgdGM7u46hRBk8EPUB0NuFU+pENXOiX86j0//Coar?=
	=?us-ascii?Q?oE0Xj7Ba+lbV7fMZ/4aioWCOIcGUj9EQKRmIacVAxfDDwJncroso1JPHhvBb?=
	=?us-ascii?Q?qJpQt7k9dXmE101aPdLTGQ8YYRVGGoWhd0WutKtYxGChlFo5wPVdc1aFTGDU?=
	=?us-ascii?Q?7eCakeD/KY+L+OsCzd12MTOaa/wTy7WXA1qLvSo3iVC/LK4u2baQ5/poKiQz?=
	=?us-ascii?Q?AvteMK7UilT6YALOVu3V25H5TvHJ2+cnPNnq393qBmoLT/nk/X0BKRs3DBVr?=
	=?us-ascii?Q?/+zSKwUecDqUpL4TSBSLLdTqw+N3LBGqGq9ydfREtgOlMrXScnF1VEfOuQFH?=
	=?us-ascii?Q?5Zd9FgnjStzeJe+v7YFmb+TV2famG0YWi+RVsEHaCNTwILtUzyewX5NaVPfz?=
	=?us-ascii?Q?r5Tt142J7U6UFLmnPWk8tRVnlcOwn0UmeoorDYj/oUUfxH1KYxC3rHfKHHx/?=
	=?us-ascii?Q?Ef5YEohffvZipWQC12vjQXYXWLJRzBDG3nlJfvbtfs9MKOiZRQm/UYIWSVfq?=
	=?us-ascii?Q?nyLs+oV3f/MORm/x2FIJYlX1wv8LiwYSoM1Z7TTFR2wLGJOTdN+60ITuAGA+?=
	=?us-ascii?Q?SyClryO4w0ihUQoT3lAIio2Yo1yrLgCAiLHFBKsj86wIwAWQFuqNZdPxGn6V?=
	=?us-ascii?Q?b3UA8HYgtR4el4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2248;
	6:yH/41RB09IfyPME75M90uGCpd7hSDCxti5wTMO+xYlTUi61h0AAJsEJWThhheXSo8y1I4OUf+8Mi40QHy1KjCFH7vOd15nSHLuydFP1yUFWni2TWSK2iXtw8u2eXwlSE9KkCSRQXkBM2cIGirq87k310TnoLPkCxz/ifBWhnOcwh+G4fscpMHxT11P8gJZ07/a7G4/MruuBuIX3jp1KtOWLsjokOIf8WJAyJVmIYrgF5pG3OUG2ulIMhlmn6A7Sstdf3yvej2AiFMosUqg4X6x00UB8J316QhRYBGZ+dJA2LtMwwhgt+hDSg3a3WLhWBqeEHN7BitMjrU4p/4mkafw==;
	5:XIFHZpEbztqPNvIv/JYzOEnqaN2mAdq7V5csUZUaU26ALBz5HjDA/hjCp7hZtst66LrsG/QfyGisT5QwWRAWrPUzOjNoJVz4TaCB0gle35ZVr30Etz2I9NOppopG+jl7O/ssWD4GLUnjxutt9Gfviw==;
	24:Aw/R/ZWA3mg+WN9n51Gn9yjDyEJN1bGungDxOjcFun9m9gqUOIzwASvT0E+5aXThu2K8ihQKkaRec4IWKrmi3Tpe4Euqu9OgnAh0zSOnZI8=;
	7:pAotD70isUqQGl3jxjfwibR3p5W1dCtjdNsUj7Hv9TcfjPvwPpTLwV6p+XscLTrwjJb38GDEUDXNzKauvNJxUvGHiNnOVGvuDGZ7ieMeS8kKQKKnaG0yDozoEw3U6QZViD1vwLRjd3l7dFjSr0HpH5oLGWzW1fgQ9FROnNlu3iHnkqJPwSVZqeCmVSnCpdcyDeZFhX8kZjsPKAyLMN73eX8fkjlr90obsANJ9jnWTWo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2017 11:38:35.6616 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2248
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.76
Subject: Re: [Qemu-arm] [PATCH v1 1/3] target/arm: Update the memops for
 exclusive load
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bGm3Xk9XSP54

On Fri, Aug 11, 2017 at 03:17:36PM -0700, Alistair Francis wrote:
> Acording to the ARM ARM exclusive loads require the same allignment as
> exclusive stores. Let's update the memops used for the load to match
> that of the store. This adds the alignment requirement to the memops.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
> 
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 58ed4c6d05..245175e2f1 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1854,7 +1854,7 @@ static void gen_load_exclusive(DisasContext *s, int rt, int rt2,
>                                 TCGv_i64 addr, int size, bool is_pair)
>  {
>      TCGv_i64 tmp = tcg_temp_new_i64();
> -    TCGMemOp memop = s->be_data + size;
> +    TCGMemOp memop = size | MO_ALIGN | s->be_data;
>  
>      g_assert(size <= 3);
>      tcg_gen_qemu_ld_i64(tmp, addr, get_mem_index(s), memop);
> -- 
> 2.11.0
> 
