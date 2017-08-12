Received: by 10.25.221.202 with SMTP id w71csp2029777lfi;
        Sat, 12 Aug 2017 04:43:33 -0700 (PDT)
X-Received: by 10.55.183.197 with SMTP id h188mr24267556qkf.206.1502538213136;
        Sat, 12 Aug 2017 04:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502538213; cv=none;
        d=google.com; s=arc-20160816;
        b=NPTWRxeFICCo83lXnTiDuRQYPHmTotL/f2RiAJMZOSvTR2hqViu5x+kXb8aEUbocVE
         00X4QN8oJSgH+ZquIrDOeb6+73Yf0vYMxFl/elXvqVUNkNMRHrbk8L5QSEYcN2t8kY6N
         jisOIUvlWF6h2sNc68hILlS/OMXKnQMKk64NYvtrb5RNjjfwLprho2oWatqpJL8QCNum
         VWz4h3059zR6m42w0x8TIZ4UGEbGyrMYYrslWPD4u8ar4WeD8WPOiZDju/wUcz8nwrj9
         MIDNZgyH4CuXs9OR0UZ5JfzEatFABrAxVWq/z8ldZDQdj5bp8HFBFFHMkeMx3pI2VCeC
         tE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=owQ0+GnmVoQgoyYNlZeh4mt/L4YuLxsonjqI+m/nBdw=;
        b=utJbO25mg9gWOv/OravBz9uGYvzUo2Bx3yfPWx4bFE9b+WZRkIEsT8UOAYvUJ7QVQP
         1vEhVbvxQEFg71yHztFFU5bUuZm0gr0zzAOZUre/WL/4AxLvjmnmdf4BjhTvKk2jH/Bl
         nqm59y7fvyt8Kcds3uEwn+EvK3UMiNrEnDchMhx9DWHf0yEnCL/X9nPZNsJXAj/qcboK
         JpXx7MXEOL1RheHC8qkVLosWb+PB6E6E/QP/qHZbAdQXhxU/LwbVn/63vcN/qR9dgkH7
         XqOLxImBSxxTih8mWnxbIJMO+np4524VLPJgxIZSBq8bIgQgM/jROa/a9nvA1fgeDsfG
         VxaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=ZY/PfRvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f125si2556113qkc.481.2017.08.12.04.43.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 04:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=ZY/PfRvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgUpG-0001UV-Gc
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 07:43:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1dgUp9-0001Tu-Bz
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 07:43:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgari@xilinx.com>) id 1dgUp5-0004It-CN
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 07:43:23 -0400
Received: from mail-dm3nam03on0064.outbound.protection.outlook.com
	([104.47.41.64]:22112
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <edgari@xilinx.com>)
	id 1dgUp5-0004IT-3c; Sat, 12 Aug 2017 07:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=owQ0+GnmVoQgoyYNlZeh4mt/L4YuLxsonjqI+m/nBdw=;
	b=ZY/PfRvYcWzpLcqdcAwaQSI5nAGGxL7Vj82o4PAtAviLR3qw+oRbD8oZQRmCXTALG1SNJrQJoK3JOahUL/ix1/XeQx9XoIO9UV0gJTItKsgi4LnaLInqZngSyqVejzAWPXr1ilZodebtuDNskve4ti3gYoNlmyieOVgbPixC3m0=
Received: from MWHPR0201CA0023.namprd02.prod.outlook.com
	(2603:10b6:301:74::36) by DM2PR0201MB1053.namprd02.prod.outlook.com
	(2a01:111:e400:5021::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1320.16;
	Sat, 12 Aug 2017 11:42:57 +0000
Received: from BL2NAM02FT035.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by MWHPR0201CA0023.outlook.office365.com
	(2603:10b6:301:74::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1341.17 via
	Frontend Transport; Sat, 12 Aug 2017 11:42:57 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT035.mail.protection.outlook.com (10.152.77.157) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1304.16
	via Frontend Transport; Sat, 12 Aug 2017 11:42:56 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:36004
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUoh-0003OC-N1; Sat, 12 Aug 2017 04:42:55 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUoh-0002jY-Jf; Sat, 12 Aug 2017 04:42:55 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v7CBgjLL023602; Sat, 12 Aug 2017 04:42:45 -0700
Received: from [172.19.116.66] (helo=xsjedgari31.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1dgUoW-0002iA-Rs; Sat, 12 Aug 2017 04:42:45 -0700
Date: Sat, 12 Aug 2017 13:42:43 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170812114243.GZ12347@toto>
References: <cover.1502488636.git.alistair.francis@xilinx.com>
	<CAFEAcA_GsfrueJQYbL6dzNBnLwMWHd3fv24CMRczuf_TxYo6NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_GsfrueJQYbL6dzNBnLwMWHd3fv24CMRczuf_TxYo6NQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23252.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(2980300002)(438002)(189002)(199003)(24454002)(4326008)(6916009)(2950100002)(9786002)(8936002)(33656002)(33716001)(5660300001)(478600001)(54906002)(626005)(4001350100001)(2906002)(1076002)(23726003)(46406003)(9686003)(83506001)(97756001)(36386004)(356003)(106466001)(53546010)(305945005)(63266004)(77096006)(110136004)(54356999)(50986999)(76176999)(8676002)(81156014)(81166006)(189998001)(39060400002)(6246003)(229853002)(50466002)(47776003)(18370500001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0201MB1053;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT035;
	1:9pViN8lxFYX25sQbEEsXM3oJ3AGVEfnsoB99+XZ6XRPuZaMf4r3AmLNySgucArVquTHPu5tjxXDFv8VcfzVFRAPamrERywpniilmujG7OI/9nK9k+gnksDS8pXU42oD/FgW/nwBpqrxJLEAtFhd8K2F9ImZLVHGsetDe5clShRTiAuIlXlMRcZ04dDk6T2lJEdWHYLzcf+Rx70oc/aOyex371ZJ/GTAWRPeTNOfRwjRCuFSQa0AERjnradCxqZauGh5IL4UArxcovT+sovH0T0wp6Knscukwgq/Wznix6ya+GWg2y72Gt7L0D7xLE6uqOLagfPOXBSpBJ5umcYdzekjS+elbNUk6sWqURy/cQ1CjztkrTBs6fjh8a5lfhQGCwIfJJ6KdZ/nz+NhvmeiofkG6MVAVXjFiVnV2cufr+mnwUKuXooKNekAHIMrdoj9Tk2Y1y7yOsSeszN12GNYn+mlOI52c71MGO6lAZqlfk5W2xqULhlhGUnCwOVRyWfjXi+qR0vPmicaDM7zU+xwSQY6y3pJfHUybJPn0mGXxr6oGeUbf7Hp+4kaNhTFwdczvYjLsEbVFvfIo1iDAuapaKX9I422dG1MeKAcShkoOP+k4I+AtsxbfkK8I13CgZpn5hAIiQTmGMDtvD28QPNfbFYyCVzPr6KsRyZIShEFxTbAHgcU0QlnBQ5hACRk4GB5Pb+FuWFHufdeRYrrCnzOUaB+720lHEdMB0JO88A1VGgr5cAM7X9J0GvMDJt5vmdeDztpj6afTw7a+jR32h8nUxmBMu0IasQZfG2W9MJ3df/mzQVPCMVagPzfbYkIcXIBz3am67yH75MERtVxxWmtADA==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3f01c26-4089-4bbe-b8e4-08d4e177469c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(8251501002)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM2PR0201MB1053; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB1053;
	3:yHSjeK+xJtnjtMFNKDoXn4zS9EsNXHgLV86qM2uWXdEcJqM4cFnPk7y1TA6UaFepG/3xJl5TrqDQEgce65W2NWjy+7CyYkYf9NIp5Yc/06f5cT1CFvOfXa1vBM3ZxqnUFqGsCODSZnP0ECp9jZZOXw9O8JMQko+S2B0nRBXpmgBMWHN1l40ELp1C9EzDSiPDenmf3UP50bO2+Sd3DIfTUW3YJ1vjd/L5J1V9o1tgj2IPReKgPydjUI9fY46zxx2SEWVl+rx67WHdYnU1aX5n2f4+/9C1/y4p8MOlTJgktojOEyrNjt3cbht+M6A2FVKNfRR7FosFsbQufdI+RJpkUDIGagFZIJfHYlT1IKAcpzk=;
	25:nA1OmJkzBaY/HT7TzwFDzxuRc8LiJ85ffHcYqgAfcLZMCKgYaFweC9O0KEns1s+Olk0rUMlm1qUKoJsFUYi6guG+7keSV58HTHjUD5YMMPARzk41WuO3HWkLxJ23gkM0SvGjq8hv3uyUesMvt8Oxm3+MaezFUoP4bLZShjh/MkVXGXr7tMkeCUS1wp1JuJYHI8IGcPjuUsBlO1S1zVyTckCeDfFr6e4FmwCwGhVok8I61g5HXzeM50dj014NucpbYBmIlgMJStkoZ9CVwV/0tnDb28yKzYPLueXxreZ3PS3JKrwxRIrn0gm6kF87Dl6ngkOM72QsN5kEknB4p1CNQ935t1LkQfNmnkH/v0wljho=
X-MS-TrafficTypeDiagnostic: DM2PR0201MB1053:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB1053;
	31:96ui6xKReYRJEJRCvi/HbXnnR+ZxGfLg55uhs37qZx10FNCSF9KltS4r7kk2aDAghH0VApCc/JN41GanuPsOh8yck6LFvN/K3Jcg3G4if/Vrs2FTWyV3CAWV43as0Ie+OxxxveYDRFSvPzJoa2NFc21a1Pj8oS2ol9vk83pOFoFo37F/aU2uG/lD32T0rASsEYHA9qRNtWCEv8JgmhRSimYA4jG27wYC/XDPcT3ryjE=;
	20:T85cUnlgE+TQ38RwocnUj6lQAN9jje3EWmrTwPQe/aVrs8IR0IqsOvLeCEs/qpfu78YbIn2/ZCbiFeylSoK/UAkOkqM/5qMuaJx6POV4PVUlxyufNr+YzlWiuT4ByIVXELbRl2IHF9vfCQObRAI6XkG5YwCAYlthhD99jwO3eW7DklUetEKUBDhK0zVsnH3iJLWHTob1B4tKQBDid0foHg3/BUagyLdHKEOFP7IJsIjsK7vFv06EpGuNLsynybm3IPcgWnTiL/k3BMqsNrJHmnyRR7LpkadXtCXVbFzyICGcDCITqHgSznz6f/QAWYIUwdXjomrfHOyk7+gq0TU02xjwezAIPc2WvycQDODjUnKjpJDfgO722Tale4IoYP/9LDsA6j+w1TMMIykKaJNfaAo5i/QYM71osIlOnn2XZoiwMnEEZD0bJhtiQgClcjdm81CK9M5FYBQorZJfNW8Z3ehnc7+4QGRtODbKmFXe8XvqsEMLUV7Yp43+H+WXhEuH
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <DM2PR0201MB10536CA8262DCEB690BE2DAFAB8E0@DM2PR0201MB1053.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(13016025)(13018025)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR0201MB1053; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR0201MB1053; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB1053;
	4:wq3t3usi8Be+qrTiF6S1+SxeWjAiGijD3nD4CCX6Y9DA/oipUnTygg4IemRXvbLz95WOjfWj8A7XfG116YSIENzbsyku7yFiAyjgw+h2LVSSux+xg5SQKgZybRFH3UL1++OTQlsBR1Q+C803GLTuranEi88A71XZbiuIHrYL1ZirrugN4gARTJfhmRYjXjdkR5zlib9rGjLb6mb5nBUHSP87UDfnWImcl4g1HifB/2OTBlgi4GZwjG4nFqHus7XPmmPe6UHaturv05HAlGWcgUU/hWFdzvmC9JBQ7Nlpcro=
X-Forefront-PRVS: 039735BC4E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0201MB1053;
	23:W2W+qhb/AKqDto/sMN/wrzP6qnhhzzV1EGDMMgn?=
	=?us-ascii?Q?EtOk0lrLQ4SQIYYq83y3Q+h/g2Xo5Bt4OqQMWnsF3lzL5DSEgwudsgOi2/kk?=
	=?us-ascii?Q?7zVusrOhTxdUP4i4ejinorXPNpCnmxOPFvBDcSHyvDbtecnn62GuKjAIQReM?=
	=?us-ascii?Q?JDd+blSmoYtrRZdeNM0DAo7B9/pvAGdpKldP+VJkH6urAXodSHYG7iwHS3rB?=
	=?us-ascii?Q?RFG2eAX3YP3SVnTKmcI5oN5LhYuaJC3sUuZuHiCdCp0WLOi6habYjYmOpvEi?=
	=?us-ascii?Q?+5wbMM8rKa+K1BF0Z44q65S3COdiTsE+KNzZy6oxXYETVpSQDUFd/6i9EjKv?=
	=?us-ascii?Q?ltnGMVy4v01YQGywGJjd41Ce/1Ou9/zXhAfrl+RkWKFRTJrtUqhDpDoUpEdq?=
	=?us-ascii?Q?nrSBwnns1douM23P8ykybyzZ0r1idk19Mov639twNPzFFuedyaNggEB/k9J1?=
	=?us-ascii?Q?xuZJidVkBPwgUzvtJm9zigreBvpab4HblD961I3l/VmDlSwjJPQ4uHzDvVyU?=
	=?us-ascii?Q?rUdKKNxGjyTxX59GpIdtZNNI/RIaQISbKsDbcgpuRyXRYqVdakjBSQJ4Al7/?=
	=?us-ascii?Q?gwXIA93QN78e/Jg51qk/jnhmm6uAEGtYTajNGsjui/rXklK2FR09Sd+FSSWT?=
	=?us-ascii?Q?DlJzchfhgDn2BVt5dbcH64lWqfYZhNTkzzQAJHyq0OYAArnZcz/6xNMfsi1a?=
	=?us-ascii?Q?mb9HM/IRcNGHRaItc/vKJMraYB7hQOsRNn9nh9dT4aor+wThaG1d85TuychJ?=
	=?us-ascii?Q?e+lzo0GSE835tE7aBGhKyNsMAgsdVbnTpsIWS9cQCD2375YjL943ZHubePx3?=
	=?us-ascii?Q?RIe65pr6OBS9OqTY9/Ni4uzHHuRksxwBFAmQGOurjKYQkXee/5BwGu0O3Gei?=
	=?us-ascii?Q?Jo97fSUqr7MlbGdYi2XYcmnRrUJT/iJ5y5MFwBdUd3Ng4wh5t2PPP1LgYBAB?=
	=?us-ascii?Q?i/+FJtHNGD0YUzBEy5uAcGlSMaO7ZO/H4jhs4VGJpdrN784hgw2V57o619cF?=
	=?us-ascii?Q?NUyP6BTeOnZu/Xr/JcPMYH4WZG/jWfKaX1Z41f3ksCGCDPCgpniNQP7uxJEY?=
	=?us-ascii?Q?k2cBtyIVhOzhpnbQwo8olSiPwPfKNVvqZDn6pf7kkI4Jq7yoHtThg9yanD62?=
	=?us-ascii?Q?idh6vd/x1T2JBJDk48KG1SYS96yJSqNRHv8s4EVy4iiIyRN8ts5T4D9jTNyp?=
	=?us-ascii?Q?9tjoWPEIPr9iRteE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0201MB1053;
	6:zAr4c3HXtJFeiFqE1qC6AYOkVh6mpCUe3eV50kb+V5p+izgPoYx/ctNyG6LFm8H/M38eAIQzQjhpObLzeiO09Uo+9/J0OMcFEytzyj3lohLTO9gniQxXMfekdyLAw3BSlR20DWYf1kRGDueoadS7YbsA5Z431uPQoV7HE/pGs7Nb3b9j06f4BP2wwME0frTgkb+ge37HFb7U++75N5g7WV7kkWqemGm90Ah1yt4dR6qsAOOCMkUObaWXbdzkwPmLHm9Z/XrJs8IIDWCDKbxgz7vfHzL570XiLwDKtaFXFbc3U4gKRtLJ8cu6dyLbP3NAQa2v6DtBQm7tKZbgUpjbAw==;
	5:t+gJGp5V2UB3qiaGsGscAAz5DNi07yQcikTxM9fXLxv0A0qjbSnH+BIx4gizDWCFiKU/g0d41qQcLJDaygfo8Td/8nWM5TQeXvdKwU/mGzt4AlNQ7kfR9qulrBWhvgImjcoTMztUzT0H1kY3OjSrFw==;
	24:hCyyxOiqKz88w4CYfIavGvsJenkgf91U9N/ZMLYrG7KdgwxaRYVFlAbHArSp0sRGzKY5xzVYy5jdsarURWB5cwWO/4t8rCd9LtIergk2LLY=;
	7:NdCH2abG7zOsRSAleNgZkJfk9pwoA7a04/NvrCqV9b1eZoaYsvg0/UcQCAHUn4agR04JskyT21zELa853tfsdEdFCylk2sYYgnwpch9OOlwhrYUKOGeIhveFt6JVInyRcmdNwZMmwq3acaNGpMTL+J6uYvmvKzyL0mp2+KgBr6jioZZKYKe5mCPfdh+4wEQedh++xgKuFn+UnqlzANx/IqBOex7b4MzuA1JAodF5LW8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2017 11:42:56.6241 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0201MB1053
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.64
Subject: Re: [Qemu-arm] [PATCH v1 0/3] Fixup exclusive store logic
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wK4PA1qNJK05

On Sat, Aug 12, 2017 at 11:24:30AM +0100, Peter Maydell wrote:
> On 11 August 2017 at 23:17, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
> > I found some issues with the way exclusive store was working. This patch
> > series seems to fix the test cases that were failing for me.
> >
> > The first patch is just a simple adjustment.
> >
> > The third patch fixes the main bug I was seeing.
> >
> > The second patch is left over from the RFC that seems like it is still a
> > good idea.
> >
> > Changes from RFC:
> >  - Rewrite the third patch to correctly fix the issue.
> >
> > Alistair Francis (3):
> >   target/arm: Update the memops for exclusive load
> >   tcg/tcg-op: Expose the tcg_gen_ext_i* functions
> >   target/arm: Correct exclusive store cmpxchg memop mask
> >
> >  target/arm/translate-a64.c | 4 ++--
> >  tcg/tcg-op.c               | 4 ++--
> >  tcg/tcg-op.h               | 2 ++
> >  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> Is this series (or at least patches 1 and 3) worth putting
> into 2.10 ?


I would vote for including it...

Cheers,
Edgar
