Received: by 10.223.183.22 with SMTP id l22csp2646133wre;
        Thu, 17 Aug 2017 14:07:05 -0700 (PDT)
X-Received: by 10.55.145.6 with SMTP id t6mr9709046qkd.101.1503004025531;
        Thu, 17 Aug 2017 14:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503004025; cv=none;
        d=google.com; s=arc-20160816;
        b=Utyawi0XoDEf+TVjvOBY1ZMF8YZ7Y+pJfgTqG7ysUFXWm8sYIK6udwJmHSpmAcmImk
         5Jef3egdklSgPAzFIMZMpgNCsh2dLRjjEZOU20SA05d8/u21IW+YLpjVLqfv0RXznbv3
         AxeFrePfPcP+4T6vQXDoWNVzgpu0TLdqT4Tl6YFkW4j1Z8z+SGVbLMUmQhTpP8kbKKi+
         fMRuRHdtADDryUa7I/29nQ+OxCdVClLQzKi4ts7LbdkHu1NFL73hh9cSMmbUp/1JXGfS
         zdn2wUqg250hKi9uiYwwKFjOzyfh77yi0/DVGw70Fu9c/rIbKfrwxLcEdjMzBznxWvRA
         X7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=JZyyBPClhAQppuzj/UfrtPTtEtiq2+IAJeP6o09cS3E=;
        b=BwEJ2KLA1BZzzGCMzX+X0uoxYZQQ8OgOVISEUiCvRRFs0Y0FPup4nvXIYfuoIxtC+S
         CsFhmYG2/W+0wROqBLQe8IGRzY3ogOx63OUOSb593oXOYzRttzMXgh37IC1dgtuGVcBQ
         L2/UbSudLtk/PNUljwL1GBRrll1ckWvWob97rvHkM5Fb6pMGTrh5vxRexEpCfdccMW8Z
         g4UQXr0jKXgCPdWqQsPH0fvcA9KH4MnQ5xDpV3raBUa/O+7zUQLP4C1FnOfUmk93WQJx
         Phcpbln8SqK7S7qyETqJS2IEy7DAMrN356SnWWW2QV+FMmpci1ESm/ZUGgins9LEdBSb
         HA+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=nVRWAw54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u65si3562962qtd.436.2017.08.17.14.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 14:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=nVRWAw54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48621 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diS0N-00018z-3S
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 17:07:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Linu.Cherian@cavium.com>) id 1diNZv-0005HM-06
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 12:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Linu.Cherian@cavium.com>) id 1diNZr-00035P-Pf
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 12:23:26 -0400
Received: from mail-co1nam03on0067.outbound.protection.outlook.com
	([104.47.40.67]:15008
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Linu.Cherian@cavium.com>)
	id 1diNZr-00035A-7X; Thu, 17 Aug 2017 12:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JZyyBPClhAQppuzj/UfrtPTtEtiq2+IAJeP6o09cS3E=;
	b=nVRWAw54yBd8/FKz5cF3a7WDvU0vipPOEuyD3UVnbNO2BIJY8cxI/utlaVlPOwnfO1KXKwYraV7vC9HccLeh0gIaiRntlFaECQoF2lE5wxOUFU/Y87muxjTEZ1HrjeNRxWhnsLbHQarnAjPn2gcdbEkI+GIjT6BjRvBZjpNEbm8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Linu.Cherian@cavium.com; 
Received: from localhost (111.93.218.67) by
	DM5PR07MB3609.namprd07.prod.outlook.com (10.164.153.159) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1341.21; Thu, 17 Aug 2017 16:23:14 +0000
Received: by localhost (sSMTP sendmail emulation);
	Thu, 17 Aug 2017 21:52:53 +0530
Date: Thu, 17 Aug 2017 21:52:53 +0530
From: Linu Cherian <linu.cherian@cavium.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20170817162253.GA6192@virtx40>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
	<20170817112627.GA5417@virtx40>
	<da30de94-118d-b81e-f163-b60f71894415@arm.com>
	<20c68b9d-380d-1fbc-0fae-a5af44c2cdb2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20c68b9d-380d-1fbc-0fae-a5af44c2cdb2@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: BM1PR01CA0093.INDPRD01.PROD.OUTLOOK.COM (10.174.208.161) To
	DM5PR07MB3609.namprd07.prod.outlook.com (10.164.153.159)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bad8b00a-80bf-4941-8ee9-08d4e58c45b0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DM5PR07MB3609; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3609;
	3:K+1/PhSUDXj/rka4mOV2woQxGLVTgq6iJTLIkHWD9y8oPL/TDUXnxOcfq/i5V4tWE4cnpcZINgDEfvYdxzH0SOoCKHWmy28RvWq0/UR0tD7ARxn/1ftGxe7/B7i2uBNEoF3u48xIQ1jcr8OtqzEQIOClw1ORbOZUPmc0778SR9VVyX+HBNrlGxDqpGDwMybs7+uXa0Y7YNbCNdjF03Fx+CiqDjI8oIRjdhfrlM0YojyDX+zJoiPQJ/5hNCjV2e5F;
	25:z2HacY522KX+Xt4aWm56riqQtXXHRC6yC2a/gKAZWIfz1jWnPr1F89hdTA57P7H/G5M9AB+NQacL9ICHuA9PQhQ2JJlTFq7DB+5PC4E3yiJ9ZW+1pekQFuxzg5Ij20Xt6wXogH/uEhvoTnFfT8jHdgERzk0CESvA/W5IY/sXTg9wfK5UhEN2CRrNfZN+kgjYgR+doDDnNMockNI2GbDTzyfOkekjNK9BIWOdYU99XYr3UZSvIrMjYAsOxUnt6bgPZ4mHJjUlz7ffRogkVCzdHyaILExv1S2IPjXsnGDV4n17rk8ERlPkpuptJhKMvm20F1BZRYi3hLx9yyvSoODxyg==;
	31:tg6pwlbuF7KnE937wtmD8EUExTZ7XT6Hf2zyCfG0Dc2fYdfci/wUzmOGoaJUe2/NVMdBSGuugWme1wWx0Qutbj5gMLuRyO3svQ5BUiBgKitFvHDkq1e3LAdxrjxf9sFlA6TxMfXYVgrupVrAsN2bpKy+u3kit21Ctn0MjKeLvmpva6vRoaQfDOXGOcEI8KUfjoRQ2ZI4knmOdZUDGiGDVH0hmQIvRSjK1IvZAv+hzFg=
X-MS-TrafficTypeDiagnostic: DM5PR07MB3609:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3609;
	20:qYwFhGygS/qfcfFG+cce29Yl6OtD15oo6LXwL3OCa/aVep4LThuJXhedef5b6I8CG32WAc5XptEzM41e33opn1fNxTvNYlo2bVK+z8ZZfJG/k8biQkHNXrAoyD/nIQd5r1ZwtMlfsQYDKsCc9VsU51TsuZ9LSo0z8i57PEsQiWOwmb93oLn7SLpAlvYaAzydYm3IVwbCPlRVTT6pajFqKDCQAAfSBv9wWH6oXaRVuYCsRuzqkKJgsx4mjhVhGE5XqmsbzNp3mffsM/V5zQkokh6IrsqDMgiAt0XrBHvWyAyaTQwM6S03/CdyHwPuffMQQ/hrMKP/nQe5BkopcwYz2Ir6MRAk8wzr1kpPQgSeOTbCyj/ZODnOgotGjvpou/ew7z6sxw7kYtfrl6dU67MMjbCP3Pva4b/6sl+sdESZYYeqF1u98pHZj3cP1/kGv5fOx+mnOpQ9almuLmTcD4xbX3bZ6fn3xWnjjxWQe1Gh5L34JZY86H00qDdwKqRd5V66;
	4:KnE2b6aDSN0BzxjwT/QE04bxshTWQEN7xMpa6Bxhk0VEfy+w2t5hcB2VZVxzh1WAO8ZxaDxtjK0zxjkbEHuDFxqH+7k2JnhG3lLYlC3uIlP+FTUE0HnA7nlq1KehVMrWf1PoF0DoTfNsov1tbCaURe9+V+2C43BKnEC3JVbFKS6s1bvq0ja1axl2abymxVBgWf3FAMGP7vi9CF7XTzC/lE3LAR95FEyQ/s0rF+TGjCc9wrt2jbLU02imMztajyUSY3l/CkgSgxtz0nlr3YSfrvDv4B7sfuIjxWVn9x/wIvM=
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Microsoft-Antispam-PRVS: <DM5PR07MB36090FE1C4F98D2565B1BD43FA830@DM5PR07MB3609.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR07MB3609; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR07MB3609; 
X-Forefront-PRVS: 0402872DA1
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(7370300001)(6069001)(6009001)(24454002)(189002)(199003)(72206003)(54356999)(83506001)(966005)(110136004)(101416001)(76176999)(33656002)(50986999)(7416002)(4326008)(53936002)(53546010)(6246003)(6306002)(54906002)(9686003)(106356001)(105586002)(42186005)(8656003)(6116002)(305945005)(3846002)(1076002)(7736002)(23726003)(8676002)(7350300001)(86362001)(81166006)(68736007)(81156014)(66066001)(2906002)(47776003)(33716001)(2950100002)(97736004)(478600001)(4001350100001)(189998001)(6916009)(122856001)(50466002)(93886005)(229853002)(5660300001)(18370500001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR07MB3609; H:localhost; FPR:;
	SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR07MB3609;
	23:/E8ULQ7u9/P2itu6rMCPtv8LhybZTggbrrcJoFIue?=
	=?us-ascii?Q?9TFVKgewQLIzFGkQUEbzf9YqTetlS7Xu9MiMnvPmuScDJugU47E9V5AtLMiC?=
	=?us-ascii?Q?9mIEPSpLX4Zyx8+E36DsGK6HAK8cO/Es1Bl1NnrydLbgybbCpJdgveipW9VF?=
	=?us-ascii?Q?qZjlxt0qarOfYBRse94uvEYbReU38l97PmAzo2eMgz8Dy4ba+oPDjTsWgvsD?=
	=?us-ascii?Q?ZtDPHKvdgg9gdqkFxm8N9KN49IwxIf+acyVMrab/kP0lLFgKS9EWQSz9COir?=
	=?us-ascii?Q?bPASpYeH3eoGPyBUGb039p2N8u0LjuWosBL1vBZA0a7vGyrkn8jui8MiIG+5?=
	=?us-ascii?Q?WedhwTt86Ke2UTXYovXSjEnWK/nWDEfog+yhUI08LugGfBy79pZ7uxq1nYD6?=
	=?us-ascii?Q?Z9nNhQVPTg3c20AP0D6y2nSBj5/nWIIRMO1nSHj3PDgSOpnPaYE16FHkSFGX?=
	=?us-ascii?Q?L2PKcsZAk4ESkGilkJ8RWNYP5GVo90pvQWjpNynEoglytSJkhU+YDkgFdhm6?=
	=?us-ascii?Q?Ir6p4ljPEohDjGOEkBdKuNUj5jIL6DZJI7W+tWdGbjUEfD4A0IrZ07UfNAEx?=
	=?us-ascii?Q?7NR+tk9VJ9/JT12H/GKfhM3sh2muLzRVL5BkN7bWPsEa3MDrMXgqIyUdMNNh?=
	=?us-ascii?Q?YPitN70BPw3WFM1VR5/9UrCqKqku6KurHTDrmGJEND+hIaWsxiC8QoNJNe9c?=
	=?us-ascii?Q?2CO9gJDXoXIZOTjTrGFfQPTct9YgRaCcwQlCakB9ilU3G5Y4lOdnueHFeyII?=
	=?us-ascii?Q?iLQxs49SFLsoxHuO/YNutDc1g2shL2yZWPwK+AHlB1/3REmoyNDjFJlxN3VX?=
	=?us-ascii?Q?0ke0CMSLAG92FAltDeidMOFHJ7W1pD9/GndZFiQZIMweMqrTlXWjro3Z/mFe?=
	=?us-ascii?Q?I6Dl43xLLwILZdbVMZwk/+FDrXzVENTXIpQCuZCe8w+KlC1s/2f4onomRxCt?=
	=?us-ascii?Q?Dm697wYegD/oheO76sTrYHU8m75LdPt8KNZHrcmOKYWj2Jyn8P31heziHywR?=
	=?us-ascii?Q?fgmAJI2bEUI7M48iIWNeIZwtHAcqQ0M4bJpkQcXISfgyIxRxj4t4TEVGh5m9?=
	=?us-ascii?Q?h1DqLjJjmIeZ+wIsFzgX9+gEfJfLsOh/urje+uaqHQLWnc/K+xD+BLxs9dwU?=
	=?us-ascii?Q?HbKL9TMaKxykVg0pG7q7I1h83raRbngiychFRXUQxJMFHGpzc5n+WBBacm3I?=
	=?us-ascii?Q?UC5+NVIMopJ0jPtkJDVgoP+wxnWdRefQbQAR6RqevnJkmzLyX8KlCh0U8X0t?=
	=?us-ascii?Q?nEaxBkwXh5KLydo+BXUFXFlO7HvWsZsygglPVV904H0vdbSAE+9LWcGDqAfa?=
	=?us-ascii?Q?tUo1w+odZjuhCzEuN+2S+8BXJG3A0vgzRpiOWNLisLk?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR07MB3609;
	6:Aw9j9gBO/G/KDm1MtC7lmpJHX7eCcE+7+Unl6tCv2c9mjjWH/ewN8beBmk2vC2+3unrb4sOqxoU+gPo4hFNaII4+jmMTzzH6uI3xH9Nov5ww2YIn1PPyJFqdNtwdxGTCHI5hAeNI4kedgUw9gTob9Ev3RhdExymgYZVmOCealOZxLoDt8xnLwhk/mc+UcumfS0VqE3viTf/FNPwAin0xVsFY5OZjcyyJ89HMHLkxwXCVv5RvD9GRL0o8Sv1uwF/RFEBx/LEZbggY9odjMyPlaz5nK/+3uyjv+0qL/daYfMeXhTHhR+rVMbRfOjrnhLtklNgxNwRHJPu1eQTzg3QObg==;
	5:i+5ufRi1IGNBNmdMJ2INRRFAjqpFDWZ8hXqfsZOAXGj2Fl5eeC1Z1cYsUphrXRynqSAp+jrKZvTh5keGK5oz0l/Qe63+kIAF6BYV+ZAVkUt/fLEGSAmFSKt/gpOhPNJIwUUkVqci3x837j+3mYSrDA==;
	24:4W6IT2ASxqEA38DgH4UXqFYp9INBk1x931EzOZjbBoiHq4dw3GiVjWdc/cMCrE+5dBclkWvlrLdBttv2rU5CnNP5j7P0wHLLBgHoQnAICZc=;
	7:UtUv9gH5dptTJyg1Tg+z37qnSSVUzbAfc7tYMbyOHfgidZLVNo7wh84926dgXY5+9O+SRgaPUH917h4+Kj1zPDxvvj+ad7H3+SL02ySU5t8Ll03o+pzHwANJKAiaH31GS7hcxTQs4FrU5H98UhevbWT5kIX903V3oP3Z9B4od6o8oaL9u2JRO5N+fByWTo6yhTWTdSKOs4mRbsL5peb8uTVuK/SP2uMqZWgArmU7Qkk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2017 16:23:14.2097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB3609
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.67
X-Mailman-Approved-At: Thu, 17 Aug 2017 17:06:53 -0400
Subject: Re: [Qemu-arm] [Qemu-devel]  [RFC v3 0/8] VIRTIO-IOMMU device
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	tn@semihalf.com, will.deacon@arm.com, kevin.tian@intel.com,
	peterx@redhat.com, qemu-devel@nongnu.org, marc.zyngier@arm.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	Linu Cherian <linuc.decode@gmail.com>, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9GVxpavN6tXt

On Thu Aug 17, 2017 at 05:26:53PM +0200, Auger Eric wrote:
> Hi Linu, Jean,
> 
> On 17/08/2017 15:39, Jean-Philippe Brucker wrote:
> > Hi Linu,
> > 
> > On 17/08/17 12:26, Linu Cherian wrote:
> >> Hi Eric,
> >>
> >> On Tue Aug 01, 2017 at 11:33:06AM +0200, Eric Auger wrote:
> >>> This series implements the virtio-iommu device.
> >>>
> >>> This v3 mostly is a rebase on top of v2.10-rc0 that uses
> >>> IOMMUMmeoryRegion plus some small fixes.
> >>>
> >>> This is a proof of concept based on the virtio-iommu specification
> >>> written by Jean-Philippe Brucker [1].
> >>>
> >>> The device gets instantiated using the "-device virtio-iommu-device"
> >>> option. It currently works with ARM virt machine only, as the machine
> >>> must handle the dt binding between the virtio-mmio "iommu" node and
> >>> the PCI host bridge node.
> >>>
> >>> ACPI booting is not yet supported.
> >>>
> >>> Best Regards
> >>>
> >>> Eric
> >>>
> >>> This series can be found at:
> >>> https://github.com/eauger/qemu/tree/v2.10.0-rc0-virtio-iommu-rfcv3
> >>>
> >>> References:
> >>> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
> >>> [2] [RFC PATCH linux] iommu: Add virtio-iommu driver
> >>> [3] [RFC PATCH kvmtool 00/15] Add virtio-iommu
> >>>
> >>> Testing:
> >>> - >= 4.12 guest kernel + virtio-iommu driver [2]
> >>> - guest using a virtio-net-pci device:
> >>>   ,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on
> >>
> >> Was trying to test this out and facing issues.
> >> Guest and Host Kernel - git://linux-arm.org/linux-jpb.git, Branch virtio-iommu/v0.4
> >> Qemu - As mentioned above.
> > 
> > Could you try branch virtio-iommu/v0.1? It contains the UAPI headers
> > compatible with this RFC.
> Thank you Jean. Yes the QEMU virtio-iommu device is based on the first
> user API written in [2]. I plan to rebase on v0.4 in short delay. Jean
> can I rebase on virtio-iommu/v0.4 or shall I wait a bit more?
> 
> Thanks

Yes, virtio-iommu/v0.1 works for me. Thanks.

> 
> Eric
> > 
> > Thanks,
> > Jean
> > 

-- 
Linu cherian
