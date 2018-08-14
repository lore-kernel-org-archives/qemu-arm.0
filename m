Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4173942wru;
        Tue, 14 Aug 2018 07:59:02 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzQqXaJ7bCJSNGG6iAMXcF6v7FDiwShr0ESdE8JP0PsHJwQBU7Tc/hxliAK9dgIlp+8UPoI
X-Received: by 2002:ae9:f449:: with SMTP id z9-v6mr20868818qkl.410.1534258742229;
        Tue, 14 Aug 2018 07:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534258742; cv=none;
        d=google.com; s=arc-20160816;
        b=NHbNbzm6YJVVNf5aTbjapgjv/aB0MU68pO4ZNpK/HLL1e9SVobH20b1ULHEgTS84I+
         1oobvOUvI98jo0Sf1H92cUCOei2DPYoePIGSFBKxVxYiqNbULw6J5H34z1Jbt9jX7MBw
         L2tDUv+VjXtH/Qe/Dr6SDfvrzmzhT5Hnqa4gEvD1rlDVpiEFLuDzBTiuspUggMDXPQ1E
         YJiC3rIaIKAKLUt3igsNjvnK085MfBaC4Yawq7p8hIn481QjeIc04R7AIEKsob8FZQYo
         S+lBMte5jI8NdqUqH9tMqEAH/5CLks5QUiiyrTjyRWa/p11j+QBxOyccesie2oEDWV/C
         dGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=CgRgv+yUvCrdtP6SHc1sVYLa/NXQ8uIda/Fe1K98Urc=;
        b=diLMsVL2gdafZuA4RYL5h7mD9CJt+uvNV3AUFju0gOSWDshm84gx6R0ZdaatB/5HKh
         +Tu2vTDZuGRMgGUQRD/XSJinz5gI+g6GfQeF6UQfIeuB4lC6WtGgNNbWykIMdwBpb7mt
         9kjlq/saKVyhKXxczzQrLcGdH5IW9ukxOvisZLt0ZNgF6N5XcJxFGjRY0132TG5+OQQd
         HHv9fDfKZsoArbVmNuUAIAzUz48z9Q1c9/ulVL+N+znAqVPOeqyMF+70cN0ixQEJwrI4
         7MV3m2TUDMvjjyinU1lobO5EVHH2DTkMMcZjvV+xycT8BtCizvTBDTaTde2fTnyjOUu9
         3a+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=J4jPNWj+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33-v6si5293170qkz.366.2018.08.14.07.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 07:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=J4jPNWj+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpamj-0003PR-K4
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 10:59:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpamB-0003Lb-4q
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 10:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1fpam6-0001oN-6i
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 10:58:27 -0400
Received: from mail-by2nam03on0082.outbound.protection.outlook.com
	([104.47.42.82]:40800
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1fpam5-0001o2-QR; Tue, 14 Aug 2018 10:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CgRgv+yUvCrdtP6SHc1sVYLa/NXQ8uIda/Fe1K98Urc=;
	b=J4jPNWj+RGa95j5FHEV5dGyuMUWM1J7OnQRBMiTaFULcoOaTxxFbjULZV4IlyWsP8ezeQ1nvAHd/DmAN5YNr7wvI8ejA+/PwEtWO69g3vh2a8VumsVEz4f+l7cPV6VrjUS1Y0+2vOqCD6//pa6zowFKGtMiru7its71j0sJXjO4=
Received: from CY4PR02CA0025.namprd02.prod.outlook.com (2603:10b6:903:117::11)
	by CY4PR0201MB3505.namprd02.prod.outlook.com (2603:10b6:910:95::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1017.18;
	Tue, 14 Aug 2018 14:58:19 +0000
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by CY4PR02CA0025.outlook.office365.com
	(2603:10b6:903:117::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.22 via
	Frontend Transport; Tue, 14 Aug 2018 14:58:19 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Tue, 14 Aug 2018 14:58:18 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpam2-0003HK-0u; Tue, 14 Aug 2018 07:58:18 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpalw-00048e-QZ; Tue, 14 Aug 2018 07:58:12 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w7EEw1Cr018587; Tue, 14 Aug 2018 07:58:02 -0700
Received: from [10.23.118.101] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1fpall-000475-85; Tue, 14 Aug 2018 07:58:01 -0700
Date: Tue, 14 Aug 2018 16:57:50 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180814145750.n5wvgvfulyfavb3h@toto>
References: <20180814124254.5229-1-peter.maydell@linaro.org>
	<20180814124254.5229-7-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180814124254.5229-7-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(7916004)(39860400002)(376002)(346002)(136003)(396003)(2980300002)(438002)(189003)(199004)(81156014)(97756001)(106002)(77096007)(76176011)(81166006)(63266004)(9786002)(2906002)(8936002)(26005)(186003)(5660300001)(6666003)(126002)(486006)(446003)(106466001)(6346003)(47776003)(476003)(58126008)(336012)(50466002)(11346002)(9686003)(316002)(8676002)(54906003)(426003)(16586007)(6916009)(305945005)(356003)(46406003)(229853002)(478600001)(33716001)(4326008)(107886003)(6246003)(36386004)(14444005)(1076002)(23726003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0201MB3505;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT035;
	1:FwR/gSGA4qzHYA5FB1djt5JVzFgJ5pcIiMkuwhY29OsRBpcH2KdRp5E/O4KZiz5/JNclT+oPhjZljJvQnjvGOZZU8NFhPcnwNtqiY31KpEbyCR+7CE2IaO9v/ozBrxtZ
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bca27763-2b1b-448d-a06f-08d601f65f01
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:CY4PR0201MB3505; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3505;
	3:v7sCIs0Xdey4CYT/dFn/N0/rLiRj2OVtBFooYnIzGP1JtU2awjHaD9wzI1Wt7NFivqmpZg1bzjw+aNY0J7P8CBb2bo+RGebDgH0nathJTgNfcU/nO5ztfecyTydf5Ew+jrodQFhblv+VGEP4Ng3GMZJyzCy+/0gyq4eEjrjndGYzFUsVDa5XkNtCi9JIdr/4TqQ1YqbDcgC18JCbl7Npzs+DubX0BfMLiyf7eSMs4ppDAX6MIGYN8+7Q1zqXZEQgQtkoihVspJWBsMxwVziI1M3YdLvY/YDNFBnab13/CqzMfuhlNTeFREzub6OlH1v2R6CMNclIzG4L9YnVTs3O8RvY3EwY7JgJgQZ4/yBnChI=;
	25:Sm865Hm55ODVRdy9DISfPtu4e29E10g2fm7p553ED6Fc//Xg3/jCI1+Rn56qwSMiKtc3nxsIkSx0s/ygaTKMfufQXiB+FRkmc4MkP214q7zh951h0pOCdnIcKGEOiM9HbRBDOywDWhi9a71YwQPYHFcINM6RxExCQLNPSE2lBruFGYHl+LhbRcCaFEh03a8aRO6vpYkpL67SAezhKFH4jZ3qX3HLF2aIX663rJWSUo12dC9qk2/gTFcH+FGRBF+HDnuoGGSpipxFeJBXZJPd5j+o7UrsAL9rolUoZnvoPch+bx4jdT5G55MoXnm3kShJzMOOuvSfjciNFb5V2H2VyA==
X-MS-TrafficTypeDiagnostic: CY4PR0201MB3505:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3505;
	31:lYbHm8MFy69EC3i23IqoloLvqwcIPNCxiZB4AzDhnR3wfNmmMCIk4+qmhDYNIpiohfcuS/HrDESawzm1Ys/GFO16FUGk2y6audEz+CUX3zeoJ8xUuYt29iyEohDuPLPrEKlygoK3Ws5YzzwyGN0MnW0jpoT8cq6lZiN0mN79N02JU3Ifn7up4ohkCkoUBbtk/BFubMhKC82aeEC3VYCuinJ0IXnDwAB9i0IA309GRGY=;
	20:XbYSULoflo0dfLQLaDzf5kPPFkYzyd+uPJ+QnpunwjjPl+oq7UoNB43wY3ohdQwtYUMs9Xkmf88ENrilySoGbFCKO3bBiHMOKQafh5Kp7Wqg1azgIcnrBwiLWQYOJDyDCcBPfR+emwnLl2ik8YXkgwku56YFkvSBV21e2V5odjBecKNAL8e7S4ZnM5GaIAHCGONCNoG+gk8aNs8NaGNnMvK5Mi1mVznzIamYDCeuEGU2h40RqLMeYaVK1JvLR+KvhRTBEzxmC9HSpS/SiWcOVfsZvrgwAtFT4UMbMi/YER+oLhwVEIhT44pZ8jR2CdPVpLMtS7IE4yVGIKiXZmqNo5Po4QCkF0rMM9K78AyMMVYxAKDXhZCo6sg6fR818kf4eMXyiO7I26lacYSTREvsuJSXZAvLRJYWEmgYceSd2Ehsj6lLArsupmhilHj2jANvU2TOBErpKSbyw/6oYewDs8/uRdnmU2BoCuHiWdGZ0FDgYSUJxKJzNxHEaYQNvhwk
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <CY4PR0201MB350550F8DE11D20DA9C607A8AB380@CY4PR0201MB3505.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR0201MB3505; BCL:0; PCL:0; RULEID:;
	SRVR:CY4PR0201MB3505; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3505;
	4:ZJ0R0P/9/Jj/m7LMbX3xDKmr34cxrnzVNUDzB6nirV2QHzYSM3Y0bfTQfgRM9YkluOyLdHTyqd3+W3MimhHj+Sm1BV34VYyfCiQ2xkQrx+dvUFrm4hjXVxj/VOUYfbJiTcFsIuZZymxJ1OH+mtRW7S0gsaTH9YeY1jp+kcgHiVoUUAmVo0KiRrPka9w95rNMdfMI/Q5j/FDhlPswdJxt+hM6uSItvRXDcuS4TIcoj7cwX6hlIBo3fTLW7IfHR+5TpZjRLfZJTDxCN2W/aeQ+gJyBgHn8tgY+PFKVoFprzfxTOpq09PsyREcGcclLUj1l
X-Forefront-PRVS: 0764C4A8CD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0201MB3505;
	23:yN1f4TyvtGdAUb/iGbaXFdw5K4jR3V0mqK+K2xn?=
	=?us-ascii?Q?tFi9Ty4xtnfh5Y/Ar15gpGn4UD2tqnQo3tqN1CdfFG0PG6aDHSNz5+IarYlf?=
	=?us-ascii?Q?RsMLqhV+rIxFzVY7KmpeUMrJSBUjPHb2ecPm+L0j66ujk7gVshlFrUqigOmo?=
	=?us-ascii?Q?XRmvxddT7JmfnzDIFfDX8EfVDHqvuAuroRoi+SLPMJeTzrGsLwivlisCcTLN?=
	=?us-ascii?Q?DYhdc7iCYCucDWHYfmGHlVcLu+Pd4ZfeLIsD+hctkHclM94mwlIybEkKlzGd?=
	=?us-ascii?Q?I/aKrZG8OXWCEk+Rq96OahAcAtcSVKa9vudRcJI7O3490/+W3XA1HwAk7GUJ?=
	=?us-ascii?Q?jaHGfEteVzmmiZSiYnRbaeKRcIb/mkmBie0pPyJG2q12XbA5QQPrU2ioB4lg?=
	=?us-ascii?Q?9WNBeRa6GISnCKjwaQ9+Nb1j7iSmzE2MVWr8uIrPEUIPUbNGJNH4IDYiwcs2?=
	=?us-ascii?Q?rfnhsHuI5bmiPetRZyu/Q6SrHqHv7m/9vhYtibhwV8n7W+FVDZjAHOv/3vtF?=
	=?us-ascii?Q?v+oUwCqiLkQgRaJ8MGyNgrBX/OafdAC/vB9BBZPI83fUE6cjJoVGTvwCUhrm?=
	=?us-ascii?Q?BzYadnwKU0nKyhfHmQHmjoTH5TUcFcX0Aj+7KCbo2T5yMGQia+lE4k10Eld7?=
	=?us-ascii?Q?Qd3W/L3IfxbfcysVXnmlJqzj0TvxU3fmfMapE5cJirndxLZI4hL+k0NdOrI4?=
	=?us-ascii?Q?jRCJdvlDxAb6Ol2q/90TM5jczH3iSplwXrCafUfP9JwXsb1jAsvhuFYvuFTg?=
	=?us-ascii?Q?kSiw8RLCRrzhXPWqLWkdSxlO7f1fWHnvXig/xV+TfB7+IQKb5sO5C1tWd+Q4?=
	=?us-ascii?Q?MkY/u3ggCHpy26v3e3p0yJUI58Z32a5IXJuH7WrmH2xVq8qJAsJfR/731Dir?=
	=?us-ascii?Q?Vv21hWEiqZMwTPhYn6bCH31Fykl0/mQeOBbtKydqi9SaaL9FHNeA7LvKDWTv?=
	=?us-ascii?Q?vdBUrGpycgM+19y4FDJrR4Svx4USas5y/MPlShnnrAznf7zWbahkgiuKqZz4?=
	=?us-ascii?Q?YKBwQUga4B8uYDZVAt2KeY1gyICebAIiIGH7af8jbxiheIsi+TaEgxlsaNmG?=
	=?us-ascii?Q?JmEglakeLDPYIkuJi0vMxyFk0uCCqE0jEA/htI4XkH9ci0aimMYfLfgH5MV8?=
	=?us-ascii?Q?DR4CZhOeZING/aGrsE3RWOLHxcw/U1wjL5JjQnY20I4ZbtchLew8wj9CGwwb?=
	=?us-ascii?Q?lFIZo/AjZPWbzyjEOprMjOmzrCv9Z3bImfDyCfcLT5dciVLFi9bxraY7LTw?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Antispam-Message-Info: TTGaovBkVujGjOEMfN88l0VpsOAaaNlA9Z8JsQI7IB43FfrXXSXPwdiug8Z00elJTGQVkqeWbDgdx9cAGdjL8+yw7fHK/mn+2fR4ePBUc2ASRgZwSB7UvrsQkz4JpzMNnAuc3JGvrKoPfXsEX7+jLiWANtYHbvzOljT/ZArBZq0fUuwFM3cEfX21kQpJ1lIN5dwj91tQRiAjIbSpv32qXvz3d2vBUr8VOUQIKXrACyzU3H19b8+XxuvqLE5RvX8kF0iBtK2ErQWPDsSWTRuu7c0SJqmwQJbkxOGX6WFsXNzT09kbdchsx4ueyt/86JIcVKd8a2R0zzIi4jRahBz2eDgwy69uSO305fFk+ae42P8=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0201MB3505;
	6:zOnJkyr4eHpnM2JeR0wdez+w71/7vivCBAgtCs9hWH0qmWqUBsr/hUvViwV6MjWKPWqRA1FQOe+7qbgO78ODol095CkMhCbMiHjtg5tyTVxlbiJwouFJ5V96sjveV+UKEaz26aGqEO7rEfaJTG5Kb31ujHBaaXFEoQYlwDg9kHXzC7rXoUTs2gWY+/Uu0WW1U6dgKbSztAWCmSGcvdijGGYrM78Z1C1WoJefDEA2GIXPjUwA2Uqgi3Z9KctlpjPWIr2vxJ22nfaaqmeGkpFhO+/gfPbbK5+ZJniN+9xcrF7YeSVEeZ1fOgjEn4UqooXx97yibcfGFmoeuzqZIrl00Bj7b4iIUKvcf4q8kQfcZrLCFkxfPOkvN26r/1UW42jfgftdvBlrDpDxRZbC48CECQ7VJANqaTHw75p4raF8fv8Dit6tn/vfUzV+EHpfWZD5GbnZlogSeOw3Mi3o+kYIZA==;
	5:zxxz+CkKDdezIPIJBXab1uRbgGl/saqoT5ZpWpEzoeyCuO513rv61ViRzZAHNEtKn3E7uv+CK/OVtXAx1uSBLVN0ErPt0xAPcXPOt/oaHkGkPaubWlOfOEfzKRFffyA/Q1lEA1rmdK+m+uDu46Y4ERdbMkbcJFEs8x/Wcs94Erw=;
	7:PBX5pdq08YBRKVPh6B2dx4Bpavdpr0fiedwQs4LDN+bUirU+HtMtAhpniaAepENbkXHDhh4hhTHYdemePGWTCN9CIx1lCGhLEOywfAfzs0EllNf8XWADK8hcszpDuvEmKtr+5q7c8hoIda8ys4pjKpnTcxqrn0NHEUmYhiNXhRbB9aCeP4HMzt8cpiAXKy6PppJ4ouz5SYEkZnnWvpyF1vm89o7aCmJV/Ny+ROfN0EsUP7Yc5lQDVzuYeMq0+s5p
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2018 14:58:18.4684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca27763-2b1b-448d-a06f-08d601f65f01
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0201MB3505
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.82
Subject: Re: [Qemu-devel] [PATCH 06/10] target/arm: Implement AArch32 Hyp
 FARs
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
Cc: edgari@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3m/IBtrpdH7I

On Tue, Aug 14, 2018 at 01:42:50PM +0100, Peter Maydell wrote:
> The AArch32 virtualization extensions support these fault address
> registers:
>  * HDFAR: aliased with AArch64 FAR_EL2[31:0] and AArch32 DFAR(S)
>  * HIFAR: aliased with AArch64 FAR_EL2[63:32] and AArch32 IFAR(S)
> 
> Implement the accessors for these. This fixes in passing a bug
> where we weren't implementing the "RES0 from EL3 if EL2 not
> implemented" behaviour for AArch64 FAR_EL2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 9701e413859..d6e98e9d606 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3847,6 +3847,13 @@ static const ARMCPRegInfo el3_no_el2_cp_reginfo[] = {
>      { .name = "HSTR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 3,
>        .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "FAR_EL2", .state = ARM_CP_STATE_BOTH,
> +      .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 0,
> +      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "HIFAR", .state = ARM_CP_STATE_AA32,
> +      .type = ARM_CP_CONST,
> +      .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 2,
> +      .access = PL2_RW, .resetvalue = 0 },
>      REGINFO_SENTINEL
>  };
>  
> @@ -3922,9 +3929,14 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>      { .name = "ESR_EL2", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.esr_el[2]) },
> -    { .name = "FAR_EL2", .state = ARM_CP_STATE_AA64,
> +    { .name = "FAR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 0,
>        .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.far_el[2]) },
> +    { .name = "HIFAR", .state = ARM_CP_STATE_AA32,
> +      .type = ARM_CP_ALIAS,
> +      .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 2,
> +      .access = PL2_RW,
> +      .fieldoffset = offsetofhigh32(CPUARMState, cp15.far_el[2]) },
>      { .name = "SPSR_EL2", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_ALIAS,
>        .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 0, .opc2 = 0,
> -- 
> 2.18.0
> 
