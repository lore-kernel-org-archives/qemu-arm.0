Received: by 10.223.197.9 with SMTP id q9csp1409130wrf;
        Fri, 6 Oct 2017 01:42:18 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBtKfXZ/0wSlcF1Bzu+yHz2Umb0N961n4VoNnL8Yci7Z460kyBMTKV0ys+dUCd/z9Xvvven
X-Received: by 10.237.32.228 with SMTP id 91mr1892597qtb.277.1507279338312;
        Fri, 06 Oct 2017 01:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507279338; cv=none;
        d=google.com; s=arc-20160816;
        b=mIOcVytXqzFnHXPwpnjCAjQAk2B7HxrHCH8P/QtBpcBd4b73S+DFnQLee/5hkmu1ON
         8C6I8xCCMTkeI1LLkFbSyE4xE+J0Yfpv2YUBHy9A8kfJAKElgBd3oEpNhqhpVK39RwoR
         vD0X0pvBozG3ahAwo3BhCRRkxQRmdDkQZLMYeUXKB/VocV83xC/GaFmAWK91hWGc3KVG
         ORw/chMVfSCzkrZF3WwNXEKlOSTIQfGBbr/QRjjBoI6uElKtTUenNJb8w6SzFM04w6RT
         5+4rJXMnnVF7Y4Xc5SfVf/1oiaNd9vekmNUR4yFtrG3n2wXZWipMrg9MJbNf1x2yu8Pf
         LCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=tStmtM5vtth1yYtfWy/G9ORLsbqafQ7+1Z1NuK/QpsE=;
        b=v7xz0/z5i1ikM9+X7jS/d4LV2SrvnGvxHSUFPFeTk9aaj8k9UbWPyvnm6fe0QrzwUW
         KSDux7KlEMmqGTiKKHUlkbAplp+DmM8+nSVAMgqXic6Ac17kIwla9uukhS2T7l87/MsD
         POhDaw9ss8t38TWEHOuM0NEAsBN8oCv+3gcDyADWxtftp8HRXbxYdRpQE7Lafk6ZnW4u
         FvJmNAxrjYN0ihKoRjV/aFdzkvFKi9+eHbYSb8eFON4ICKDOSU4acyskl1zt1Rr1q0wn
         pbQzvp88PIwDQtrYyA+/3qBt/VBJ+mZob2b5jMCOA5p6VP1rFDsPvVFbSfgRs6mOVQE0
         Byhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=Ax+OD+kK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6si890975qkf.56.2017.10.06.01.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 01:42:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=Ax+OD+kK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0OD3-0002Ht-Ql
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 04:42:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Linu.Cherian@cavium.com>) id 1e0OCu-0002G8-Bb
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 04:42:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Linu.Cherian@cavium.com>) id 1e0OCq-0004QZ-CN
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 04:42:08 -0400
Received: from mail-sn1nam01on0056.outbound.protection.outlook.com
	([104.47.32.56]:47952
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Linu.Cherian@cavium.com>)
	id 1e0OCp-0004Pe-S1; Fri, 06 Oct 2017 04:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tStmtM5vtth1yYtfWy/G9ORLsbqafQ7+1Z1NuK/QpsE=;
	b=Ax+OD+kKg7vmVEp98z4XpB3qp8oVHrJYTJJl3kX6/pRt/GDNTvroiPyNzNgdiWD37vNoh8fG2CNPLLVUttkbSZRrrXXxdecY8U1cfghHTgcQtCT+8RR9LjR9a0zEWxmekNlWTSXerw9LdlkJnCot4Iy99HQ2rU4icz1FkmDxxWs=
Received: from localhost (111.93.218.67) by
	DM5PR07MB3611.namprd07.prod.outlook.com (10.164.153.161) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Fri, 6 Oct 2017 08:41:53 +0000
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 Oct 2017 14:11:29 +0530
Date: Fri, 6 Oct 2017 14:11:29 +0530
From: Linu Cherian <linu.cherian@cavium.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20171006084129.GA9318@virtx40>
References: <9700cf30-65ed-9c55-c1b9-14bb8deb669f@redhat.com>
	<20170927092147.GA32183@virtx40>
	<0af599c0-f859-f90c-c999-bc4a0a678768@redhat.com>
	<20171004114910.GA6932@virtx40>
	<79234c56-c524-5359-de8a-f266b19821eb@redhat.com>
	<9d173ea5-75a6-c684-7f8d-e2ec1d3eddff@redhat.com>
	<1017080b-aa5f-4a1f-9905-e65f22717cd1@redhat.com>
	<b740e8b7-5859-fd6a-1f1e-480aef6ef4f0@redhat.com>
	<AM5PR0401MB254548523AC95D0A2A8A92E69A710@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<807c8076-af7b-da24-66d5-2c823dc1da34@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <807c8076-af7b-da24-66d5-2c823dc1da34@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: BMXPR01CA0046.INDPRD01.PROD.OUTLOOK.COM (10.174.214.32) To
	DM5PR07MB3611.namprd07.prod.outlook.com (10.164.153.161)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95d39076-0fed-4ed8-12fb-08d50c961b3f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:DM5PR07MB3611; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3611;
	3:4sJeMkr4uVp/rbhrQ5q6XXaeETkFHmZhGQlyOe9P1CT34KyxAzH5mwrI9z9c9LgUygwQlg8ZnjR4BbtHlwP3DyMWsBmQ+JaFCK5JkderABHWSkEdVBubSfZ1hA92B0300ThNHXzEyJoLl8kn9CEq1xg3VvM3z7nk9/8uF/XGG7MSjHD5np50Hvja2aIVzrXTQYGKgXGWcthRy36FlsZQXbb2nyUf1sNgGzEriBH+KOML2xoqX+s/zVpcQuXAJhrC;
	25:hkwUGd/qoTml2gm9H/4R9zx19nnZbTKo6UAshnk/snR8FadPWn/Cs4EGMr2lX5pza3F1CFBeKBFRoo9T3pxZcFPPJMK63ZC62KX7a40xr1LePUQmFYMk5EnvUZArOalUn85HQXoWiNXTWdMOq+AfSV1H5HtYOxqZSNSKppks2m81fa1QHsD3SY04IkAIDqB39EBpDG77ZWKiU46wA37WmbhxTIjXCVvqr8mP2qhD+lrv933KapCWydfdQHwmkNEC5/H0gF3UQxyeac+jH6F7gyn8Wz7en83uxLzhgE5ydY6SIYfxF6+hHfJtOTtJ9z/XgyZw2k1N0eF9Lw2OV2488g==;
	31:xx5/VjiTIpUwmgwBwHyRz6WjGi23iFwYUbEllrqSeYdclM3jAXS8xKnydE1emB0OnH61TWVZ6bT5z0UVXFacaQLcB7Qoz8Smc4xa5792LilUgSTBuZ7p4+3M29GLbpvU0b9A1zhaX87WyMHGH4xNM9VN1UOnyOpIxDxB1hvVOci4M9pndRAglm8vJ3665jlb/NgmGifU8srePdiXqQqV+aNZ14IRil0/JMNZWh8+KgU=
X-MS-TrafficTypeDiagnostic: DM5PR07MB3611:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Linu.Cherian@cavium.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3611;
	20:ctru0TzMzsT77sqFl6xc34UueMFrdsFjYljHbPCNSarbTniU1TNdYvmS+iwNo9/H8wzAAYLMZn1STkUCSeYvgl6gcHqvIe9Jr9URL536T7WUgTS6WPHZDtOMe/FKOq+8ZU07gmTnt5nqxrPiUNcTEhcojyT/gJG/T10G/OXF9kTQvXRlu1Pgmy2iD8pmzLPTJ2mMuex+SDwQqga4Sw/sHnq6qXLjBGVL6zaf8fvsUqIjmg1SSMOK47O4a4pWzbSUT0x63sGqJP+YOTQENSTf9ach4rrrjBDuZBp+TnkDzSp8HKs4YI0WY5jSqJPaW6pLrOGKDm4ZuExnf3vv7nzIG5z+Aqi5/gVZdmRB0DVKBKDe0992/iVOPbzuKUuP7gbB5Z33ffrYTOv3abKyL/Tt8zJA8nCrRz1UMGRAAx2/T/HBaHTGYvNH9vqIfkF+pCozaoMNb4oNNnY7EG33MQiJQW5JUdQllQDST/1udmDRDvpdrQUPiywkXpM1vEZpBOMe;
	4:hmZJZeh5jwvW8P38b+SBaw1t/NVSMX2IE9pRSErLJJTwVXIe4EGKwJob6J0T8XIgwjiyjVEHZn8JcH5TM+njfwEX/Q3xz2BWBrjLWxlrzstUiBSd3fwnMvjwCPbWNVm8m345bWKTyzmv9dStEKsxWhFfdkYL7JJmtop0R+hW/uZzmI4gVmsOj2M5ud14jEsIHXUVfPbmBez8HE03mv+mwQlrUgRr4Y2TeVuwJlDcEAdZpIWBeNnekvtX2+EESw0C
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <DM5PR07MB361169FAFC58928B2605B922FA710@DM5PR07MB3611.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(6041248)(20161123555025)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR07MB3611; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR07MB3611; 
X-Forefront-PRVS: 0452022BE1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(6069001)(376002)(346002)(189002)(199003)(24454002)(105586002)(54356999)(83506001)(106356001)(54906003)(76176999)(6116002)(305945005)(97736004)(68736007)(23726003)(7736002)(3846002)(7416002)(2906002)(53546010)(122856001)(478600001)(86362001)(33656002)(316002)(16586007)(4326008)(9686003)(8676002)(72206003)(33716001)(81166006)(5660300001)(8656003)(53936002)(2950100002)(229853002)(81156014)(6246003)(93886005)(42186006)(50986999)(58126008)(101416001)(50466002)(8936002)(39060400002)(6916009)(189998001)(47776003)(66066001)(1076002)(18370500001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB3611; H:localhost; FPR:;
	SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR07MB3611;
	23:3MyfiQUZqPBqDINZ8wTSQs40Nq1QCFkvi/P6fXMxh?=
	=?us-ascii?Q?6tK+j6wJtshD/EI71XBEbYNzjl++H5G1smVHuGvxGRwTfuo3EYV0t8Ode4FH?=
	=?us-ascii?Q?kwU1VYllgINS/I6/GMeSw3xU/XjD6S0660mmmFBmo/BETQLM8C3rZjfDesDU?=
	=?us-ascii?Q?xg6hissBxfqlhOO4F9rjKmaejZ6iuth8IRG8iieMsznW1FYVxdcPVe/QIC9r?=
	=?us-ascii?Q?T2MTadYIs8a1OniA+mHRVUacSzks3eUHQPiCFAXgxGvJOmv5yvUjneP8v+yK?=
	=?us-ascii?Q?9WguBsgO5rRugWxaM6RaK/WMHlfiNXkf5MVbTjls93wRVOH0x/GN3UHej5J7?=
	=?us-ascii?Q?g1suBuZMdtV59nllHYZh8lqAJEUSa0VG4krze4Tukg+/QybSTDU92YrLGjfi?=
	=?us-ascii?Q?8EehMnQnX2WzhNwZLwfCREaMrL+8Nq/KNkFny1HfCXfvRqGfMd4dNIK2C7+W?=
	=?us-ascii?Q?ZPx2+wmoYT6GxHKAa7Z8C0tT6DPt7jzO+qOjOZQcGD4g6OpDxM90a+3WA/+W?=
	=?us-ascii?Q?coShnWEvPoQkytmzttdnuJrucqxTqqyZk1sUJlkPrj2ULK/N7aR0CzGRz6yl?=
	=?us-ascii?Q?7vx77zVyzf9HCf+koTQ1+j1rrBk/Eh96TOIDMgLjD1JFVxDnKHBjHBpIDwUG?=
	=?us-ascii?Q?LNEYsO2tLH+U6xGSO4iG9xkqz3W8UINjuSbqYbHXSWSZDEgCKT/JEfBzdFPt?=
	=?us-ascii?Q?Y1V3X8u8UOw/4rcKy6xP8egLd4mSFXOUPKpm6d5+Qu/2ftBCj0ddYawj81tY?=
	=?us-ascii?Q?gGARTox80/rOFUFKIo4SjCz4vtTUAAOXeRBs6kZ9jzvXz5CU7jprUrVQ4v96?=
	=?us-ascii?Q?IpCRkoJVyCXN+ZerrQTl/p+pRhLJNwE8xKc6/1gnGTXuzcmr4E83VuvFM/sk?=
	=?us-ascii?Q?ib1fPTgWcPZEdckiyfv7m4lsdnHoD1o06W+DyrPga499690IESZjz2pP/v+t?=
	=?us-ascii?Q?1LyTGKmkmgsQfAmIBdu74eQ0PCZaIgCFFpMJPsCoqHQCeT+C57qDPjJsrKJs?=
	=?us-ascii?Q?mpywVhYkxnJZ8kZuMycnkHQMrau4EH59jNIqUQKBIVGr8lc+tNQAgwrimP0Q?=
	=?us-ascii?Q?AOA0VJupFUcgmhZbiNwJamyqIelC6NHBGW2N3v0dUPzUy9j5Qjm7XPoezMTH?=
	=?us-ascii?Q?Gvc7PZ3zA6CCKkzD9RZaF5SQgvnasGzR/LbEof2zIFWx44BmPLr2hsFFJ/DC?=
	=?us-ascii?Q?HqA3XRbRkaaRpfGEtLhcamnDU6hoL6acDw1srLzBmqaXa1NgYUh1GSYh6+I+?=
	=?us-ascii?Q?/eqkyTfA1ThwYBp19/NE/sHsMP9L18PaqeO04ZgolLXhBkh+pDjFrCxJuGLJ?=
	=?us-ascii?B?UT09?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3611;
	6:ync3iK8m4wqRM6iNTj3+fZwWWuMlp9AzV23U+uRzt1B6I/gh9mRRZxqe/R7gDLtBS3rLrjwFXxHvYbnZul714xw+dUs4WfG5H5xXb6DBo0nXE/wxA5p4I79S6YFKq7Ya26meCWQghVh7hl29Bv0p1W2zArnRi0bGqh6zfS1/qFDfqIyOvfowNhTE4EhoXchBHXag+JBLjEh1/soIoY4UMApPlxxpMIGsAKYSmmYA6kc97nHO3AvgGrzsRy16cANRcth1ex9PDZZsU0Qc0FU7ov3ITJbNg+S8FXHAQz7bpKC1yEAy/fk6ElHguw8ISR/6gXFhIk9Te/3Uog0IC2ya7Q==;
	5:rNXYMja6RrwGzQ3kaVUMEMhFx+1zSq1xodoBuvSsK4axTkKbIrxn0iu7bsJ2gPRzSb9nzr5+itUMmCJ6sIdor549VZuPjg100JrXm6zIaNKXc+49tJz/P/GMibFCDZOmybISg87edORSu5o/h0SCNQ==;
	24:aeQnrYPr1x89hb81/lb8OKheTg8hd/gXGPZPr9J3TAnEYH375Z4aLSJcBFCNEMMLs4UrU1cHD+htliOJ0Y/MmZ3HXXTgmO5HEnqLOtoRBDI=;
	7:9K24c6b60faRXgf3s/+yOB1/1nH+LwzgzHIFe6olmfwRnnAYvgHXU5N7VlawQUhHrq5BbjeXp3Sgx5aaJ/lIVezoEa8Q9EQW3Kt5UZ2VxJ3BW+KNS7ePyMLd28Xx/40ImxQ9OSCS0+5G9BS1nTLnEPjJBFp5XfKFWwJ7XnpcWOidtOQMjwD6FYwUiuObGskOmxMqp9EHRf0N4GKNkOA5v6XliYn+jepMtQlZ488HVLM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2017 08:41:53.4603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3611
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.56
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/5] virtio-iommu: VFIO
 integration
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	Linu Cherian <linuc.decode@gmail.com>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZwqCZQucl9fW

On Fri Oct 06, 2017 at 09:24:20AM +0200, Auger Eric wrote:
> Hi Bharat,
> 
> On 06/10/2017 05:46, Bharat Bhushan wrote:
> > 
> > 
> >>>> Thanks
> >>>>
> >>>> Eric
> >>>>>
> >>>>> However you should be allowed to map 1 sg element of 5 pages and
> >>>>> then notify the host about this event I think. Still looking at the code...
> >>>>>
> >>>>> I still can't reproduce the issue at the moment. What kind of device
> >>>>> are you assigning?
> >>>>>
> >>>>> Thanks
> >>>>>
> >>>>> Eric
> >>>>>>
> >>>>>> Atleast vfio_get_vaddr called from vfio_iommu_map_notify in Qemu
> >>>>>> expects the map size to be a power of 2.
> >>>
> >>> Actually I missed the most important here ;-)
> >>>>>>
> >>>>>>  if (len & iotlb->addr_mask) {
> >>> This check looks suspiscious to me. In our case the len is not
> >>> modified by the previous translation and it fails, I don't see why. It
> >>> should be valid to be able to notify 5 granules.
> >>
> >> So after discussion with Alex, looks the way we notify the host currently is
> >> wrong. we set the addr_mask to the mapping/unmapping size
> >> -1 whereas this should be a page mask instead (granule size or block size?).
> >> So if the guest maps 5 x 4kB pages we should send 5 notifications for each
> >> page and not a single one. It is unclear to me if we can notify with
> >> hugepage/block page size mask. Peter may confirm/infirm this. in vsmmuv3
> >> code I notify by granule or block size.
> >>
> >> Bharat, please can you add this to your TODO list?
> >>
> >> Linu, thanks a lot for the time you spent debugging this issue.
> >> Curiously on my side, it is really seldom hit but it is ...
> > 
> > Thanks Linu and Eric, I added this to my todo list.
> > While I am still not able to reproduce the issue.  I tried with e1000 and now try with ixgbe device. May I know which device can be used to reproduce this issue?
> 
> On my side I used an i350T2 device (igb) to reproduce the issue.

Myself used a Thunderx NIC which is an on chip PCI device.


-- 
Linu cherian
