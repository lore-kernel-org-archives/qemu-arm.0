Received: by 10.223.172.38 with SMTP id v35csp6579198wrc;
        Mon, 11 Sep 2017 23:15:18 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBdibVKffzl1/AZy5f/zl0Co2p9ct1PmRufPjtGeSEV4JKxkKCC6O2v//BtRxayOVmeMbuE
X-Received: by 10.55.12.16 with SMTP id 16mr17382324qkm.213.1505196918233;
        Mon, 11 Sep 2017 23:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505196918; cv=none;
        d=google.com; s=arc-20160816;
        b=PV2XGPIkaBsaxc+IZToBS8yI0gRkeQdiuIIrN5THmxpH4UKP295fNQUJWJ/icxCfSs
         8fsJNiQ/W3EAH6C9a5k5qpHHc75q5cflcTt1Na+DId1xmD8jtKalSZi9MNfncD2CR4yP
         j1HeaW3ErwqyjWMIv121bTzBotZN4sa6odnsm1pf++6AsWA1Y7XizpMqfp4z6O0qUSlT
         intsRn8FKGscdUwf0O2aGVBsmq0EEqK8cUo15B1KKMjQ3VnEYRogIs8/hEMzNNEWH5AU
         zn9WCgbLwLz4WzvJwpRln0FIBI/Vrb+xmV+dG2Ev5WuGMNtc1J7jx0KO/rSZ2HaO1W5d
         LkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:user-agent:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date:dkim-signature
         :arc-authentication-results;
        bh=0eDOgTxsuYRnGMDIPPzve83M07w7fM3gs/wnm2aH3PI=;
        b=cRw9HXNuA3ojJ6F6QhRaNU1nqzoMy+JcW6I/9/rNHQoHW+DsmOqghEW47dA0M2nt4j
         sE2qB8iAQgLXCdtz6o8j+bTAgJAwdw8SIahOoUVXOXN5+4UZ6t+YRLRWd5eSdwsI2wyR
         teAYtBcBh65U0Cex3lnnTMFkKbdb5/D85WIVXeA5biTuNvfKoLrzWJk23Giums0irjHh
         3Fs8cSNpctfREBTVHIFhhO2Jjpi7cH9IAOvQMTYyqaq3Dif/p1dNRhTYS3Qmx3tD1YmI
         8bmI6hMC1nBvLOKtQcaBoETwtSGiyPsZ6RDIh3rmwQGB9UzzMi2ssSUR8P5znVn8PN6v
         7Prg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=Y15Kyvr6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3si1172068qtd.385.2017.09.11.23.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 23:15:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com header.s=selector1-cavium-com header.b=Y15Kyvr6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dreTb-0005ik-Ou
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 02:15:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Linu.Cherian@cavium.com>) id 1dreTS-0005fn-AT
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 02:15:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Linu.Cherian@cavium.com>) id 1dreTM-0000Gj-C5
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 02:15:06 -0400
Received: from mail-by2nam01on0081.outbound.protection.outlook.com
	([104.47.34.81]:31008
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Linu.Cherian@cavium.com>)
	id 1dreTL-0000GR-ME; Tue, 12 Sep 2017 02:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0eDOgTxsuYRnGMDIPPzve83M07w7fM3gs/wnm2aH3PI=;
	b=Y15Kyvr6a1wpwn4IGD9GP+XKNJOvF+F5kWnv8iz0YR1vUwEpLEa80XF4HPkq9deQU2GQ/msos47jzey+5vHb8eMLm6GUNsBx3iM9LQykFd9OLWyBd2pCpaLlPeWXWfiu3LRKNWnS1cUTipBX77mpH+JtW7Kqu1arLOOsfl0HCm0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Linu.Cherian@cavium.com; 
Received: from localhost (111.93.218.67) by
	BN6PR07MB3602.namprd07.prod.outlook.com (10.161.153.157) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.35.12; Tue, 12 Sep 2017 06:14:47 +0000
Received: by localhost (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 11:44:21 +0530
Date: Tue, 12 Sep 2017 11:44:21 +0530
From: Linu Cherian <linu.cherian@cavium.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20170912061421.GA23102@virtx40>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-6-git-send-email-eric.auger@redhat.com>
	<20170908105214.GA16412@virtx40>
	<f569ace6-d8e8-b1db-6acc-0309c5b21960@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f569ace6-d8e8-b1db-6acc-0309c5b21960@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: PN1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (10.174.144.18) To
	BN6PR07MB3602.namprd07.prod.outlook.com (10.161.153.157)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25f057a3-fe40-430d-7cbe-08d4f9a5951a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BN6PR07MB3602; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3602;
	3:xofgyi9u/tmP2wxpC5WPWPg4mpntrK1WAHxD8zw3PnrI+x+P0yT2dxwVgwfCOJsvfbpcOdCvih3plnF0+PFWRXkxSzKRc5DWbCgiix1tMYm8kiYUAgP/BAFceItPaTmQePGT2QhsbDg4+h1Pf+xrkJaEY8mINnmjnPSZo+rMnd0dZ9XWce3g/6piIT3KL3uKiK9az7DRJBPWUk4Wq5fKn0tFmuTQfAzz6/ko5JiHb5lx5I16M7d+CkZXsRZ34jQP;
	25:8gkxaFRfUWS1nyfOMRNHr0f913LmNaG0TC9daQkEm5Ca5mTU6cqcp4BpgnjysHFJQ5NL6GIjTHxW3h0mHNIhkQ70DvIpbl9F0dv1ufSkt9BNetNK7TW8DB5aMg8A+vrZdQhdP4U7fPmUo2CXlpvbAHSy32SvoK7NpczeGnU6JZoNIoLaL7cJKyo5lfRRnkIt4m/MDDrTNJfIPbFlimyOCwF2IrWJanC1IkedyUJXBBCIgrbII7F40cM8pSP8vl4EcfqA8Oeo5EpXpfsHkka2dZn0SGO3VDlyTOGHrTpNoork/naBvxx+fkL2C1bCDaQV98GHp9CpgqaDImOGXJDcew==;
	31:2wEJ72SD+kln0JaFWqrEyo44LncvkrWs+1bnoJjI2hM/VCGhzLzGNqJoRP1zEY6c8His0fylBwHsVOC2Xr8rg9RbzNHMqCvTYy6TEsDeFLYQcyd5QUYbGBqpxccvuMvdBEUj1Ceot533B5zomRACNCqEt0DZ+5NTHMpqCxF8uxj/CLlzvGDaatJRTKwYSBmnCg6pvGHmXbPnUl1b1T54hya/mNq3Cv98qTrartB17BY=
X-MS-TrafficTypeDiagnostic: BN6PR07MB3602:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3602;
	20:rpvYPL3N6TW2wwVTU2YCDyFWX+KicBcWD6DpCgbaqkKgXexg1eLNbNpFsqAKsKOgXBTyTt3E/ZiWIFmy2PdVKZGNUcj9Zv9Wub5n1SWUaA9sMxbAVSx4rMU1crwzM+8K5Piw84IOL6I1qMizmeKm9+8BPmQ9DOTZzv1M5yAvXq0KSbryGPhM4ACGx2p6hd58IREbpzCfjfVn05APvMinfZLj1oUu+6L4lHplB2+XGylezkEkO+/SN+hPiRuPhzDLzCtthNqApRX9UolUEoB0wE7wAd7s5ayz7A8imqpRxQIpeC55ImC5LU0Mm+T2BGuy+rD5ziHnhvvZL6rK2YuTGKODDqoK21d21J0GGwfA5/igN1lV0NtpnDn5kShr1ekW2rDqWnX3XS4W94zxUpUzQKw5sqYlYsNnfcKOQCfVQd2b6LxPYXxgp7XTNTNxZ1IZ1r99k86slwNGST8HNSuPGAEFgWFOmXD3QlheTVah5RpGjeCdkHCdcRctVBW+FdkI;
	4:X81k3KYowZNmPrDs61WzLh5I1+VJlYES/B45zMiK+V+rUzfEJ5bjr8/z35LgYGRGcxfNj7l36mXAJ1dUTx8f3GSahgXdJUdSSAULLp9e9vy8M8AHQTHn15k1qeUvnpWrXIt+8H9S0Bp8nVUkTWD9ZCTUBdtFyfMMXAWd0emWZR8kwXZ+THMfO3uSJSQT7TegNPQxDl5H7vDKJwfjgIAk4XVD8aaej8EEt7k+0NbGY4KVU5fbK9MmO8a4oixz0LSstr7wHmZ1vYbmUDYrCZsW4IKIbnGLQ6FpdRQeRJTTUvXljE8FnCmKY9Ox0PsgW5njMyR96YHaKcen1wsUlLcpTg==
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(22074186197030);
X-Microsoft-Antispam-PRVS: <BN6PR07MB3602EB928B71F3F07B02D511FA690@BN6PR07MB3602.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123562025)(20161123558100)(20161123555025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR07MB3602; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR07MB3602; 
X-Forefront-PRVS: 042857DBB5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6069001)(6009001)(199003)(189002)(24454002)(6306002)(23726003)(93886005)(6116002)(3846002)(66066001)(4326008)(305945005)(68736007)(33716001)(53936002)(478600001)(1076002)(9686003)(8656003)(7416002)(7736002)(105586002)(316002)(53546010)(42186005)(72206003)(122856001)(83506001)(8936002)(86362001)(97736004)(106356001)(101416001)(6916009)(2950100002)(8676002)(5660300001)(39060400002)(110136004)(6246003)(47776003)(50466002)(4001350100001)(189998001)(229853002)(2906002)(33656002)(76176999)(81166006)(81156014)(50986999)(54356999)(18370500001)(2004002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR07MB3602; H:localhost; FPR:;
	SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR07MB3602;
	23:a54EltgSNDGmwpAM71mRZ7B/KZ6Nxytn9ejFm1AOo?=
	=?us-ascii?Q?NzGixYob5Rn7m/1/5A9GbUlsLC89G8ZeJYhWGnx6sFazajKaL9eBB1hF8/VP?=
	=?us-ascii?Q?q7srATq6hjy0+i/XwltRjWZsT2fPYFbCuZJaoTJUguIeG72kImWIvYX1N2p3?=
	=?us-ascii?Q?QD0lXjlBN9YuF1jAZG8wzpo8THvi1igqNWlBtLg+Y9+BkbI0C851Noh7SNTG?=
	=?us-ascii?Q?6Jw7UamAofW5QvOzcjSl1bEI2K+uJObgPIYgEalFB6xacf+N9jt0LT9UrkLB?=
	=?us-ascii?Q?Mxcqz6/wAwH4mNxJtXC3kxuHn00ViAKmfe0irkgyjnVSnEnNdb479ynXJc79?=
	=?us-ascii?Q?W6NYnxiXYHovDV7bELrqjU55//ZqEbl745nPZ2nZUtCymBIHs3nqBkKqnb9U?=
	=?us-ascii?Q?uIXAZ8UsSIKfOvp8a/SYM+qAGv4H0VqAWecQp2inlht+UrnYCMWJWPFimFW3?=
	=?us-ascii?Q?sLuNlNV/gxtMUQc1MZRccSlixDJBm+UYqydUwZbrhEFI/uhlPas0O0FGUVvV?=
	=?us-ascii?Q?oRoALH92NoSs4c+nOTQUkEOwGYbY+3F4CprHFPU9ozSBQvYd+rsoopKWAaBO?=
	=?us-ascii?Q?eJbPOMQ8h9hJhU6DyF4KHcgrE/LDZCJ4zSHGggRwgqn4pMiFVAa6Lehc9bjN?=
	=?us-ascii?Q?KJEKVwS/jswfUI4ZF2LbNpGcMf0xKi9LmOzGdnU+IfnKXfM9zyShVOi6XvkP?=
	=?us-ascii?Q?tvibkL95jRqXf1+C6iBZbsEIlXGGCpq5mEZ8Ub7Uxhr0Yq/02Kn7Z4Pfe0rI?=
	=?us-ascii?Q?tn/tnO4QLyFgPynr3LlfbnyQvc18E6r54RKqRXxV1zPBfFHreDcWsN4JtVYr?=
	=?us-ascii?Q?7tvDPOKDklEUg18SOt2r6skeeZLGKgwla//tywY+flCJShETL5APNlQ7oVjm?=
	=?us-ascii?Q?A5NQAZRQS5gnFEg/S2NM8mp1z1qIf1VSycCpTl2AA0Zdv0HTB7cgSq7uVknT?=
	=?us-ascii?Q?JiQYbD8FSzJ+i3mSjsoyWD7JMiOnFerGRD7T3f5N0/61MhTj1fji4N4mchhf?=
	=?us-ascii?Q?AZDa5lRS35lyQEj4tgWehJ2PtHAqb1B+ygSvBd+BlINop4UwCkYMHv9kyAQn?=
	=?us-ascii?Q?f62vH97rX1/TpX5dEidieItQKJNjWxHDwnH5DO28ukBm9vzjR/617aQ7/Mjl?=
	=?us-ascii?Q?KZNrzvLthH7qOizT/vANUUFobxSE6UBpjCs/KcQ8stkhE3mKC2woqXUjDu31?=
	=?us-ascii?Q?j31OhMIy2qM8TbOD1T5Wb1qZHEaza176SujI4EqiR+U9+1kCQrn9xF9JelG8?=
	=?us-ascii?Q?KTqExb5mLX5WuddTdOicbspg7q1SC6iHdscn06AfJp99aFDtWfsVgMHfc+Qt?=
	=?us-ascii?B?QT09?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR07MB3602;
	6:nijFNGKSCsQlRcoeJPMCrGShRxKRtmavrLpF//QHXkOjQfRAgXdwDx53RWptikaPl4A9FX2BSCsDnFTa3VKhlHD68qGmJX6QEHS94keGZGAxjOQiXBv0Ui1Y6NQ198N+e7XgCdXFMl3hBjpOg631UTKgWBVo897Iw84qDceoxJWB7mVr7yzZpw9mDSVyTM+9OlE4p7KMVcF3b33w0uLFgSEqA8Qd9Zho3Nym/BHa1vjjO+Q/nHBnF3yc4MEB4ovx2tWWfw/QfIe8v27vuA52+DzL34MARJImkwh+SY3dYP3ZwFOh3E61fXutXqKJ/eVY12pSAyupO6LXnZwkz/5gYg==;
	5:36RyteLl8NSAcbp69YzwbIoTsdFOcV1CYE5n5ppsx08QGMFkR6Z1L+6BgW2SmOYe3ZyuIyMifxfFIM4nWnvZKB3NMJlXVAfo9ad5kAFcrJljyVOIHcK511hRXEYq6tWByKLDXdkK/RI/SceoB7jvEw==;
	24:W37Ng0O60E5ldb4GCr2HolGeyofjiMkUIQWX6UMZzL7rNZXVUmpnrT6U2T6GTHU+ID8HZu9I138+mabsCLDDmuS+O9s03J9nkwHkhfpBZBA=;
	7:VpsWC6TE2choWbBG3ohk5xS1Q3zGXAEsh9xifl7HwM0cFx++xGtMjNhGftctk4hO+mOy7n/Q5ghuOaMdHGS8VI/3eNdA794d46sVcDNPOalmPlXdO2SHAKXbL+FIWX82xb68S7OgevUFmv+AR/Qfh3rQmeyvUD5zBc3br/Ie8uL5Vz8XYbcJqYKm86NRY5coj4lsDi3egmyHlFTn67oyrmFNJnfNARk6qJp0wbXNBGk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cavium.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2017 06:14:47.5355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR07MB3602
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.81
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 05/20] hw/arm/smmuv3: Skeleton
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, mst@redhat.com, will.deacon@arm.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	prem.mallappa@gmail.com, robin.murphy@arm.com,
	Linu Cherian <linuc.decode@gmail.com>, eric.auger.pro@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nnCev7z2KC69

On Fri Sep 08, 2017 at 05:18:19PM +0200, Auger Eric wrote:
> Hi Linu,
> 
> On 08/09/2017 12:52, Linu Cherian wrote:
> > Hi Eric,
> > 
> > On Fri Sep 01, 2017 at 07:21:08PM +0200, Eric Auger wrote:
> >> From: Prem Mallappa <prem.mallappa@broadcom.com>
> >>
> >> This patch implements a skeleton for the smmuv3 device.
> >> Datatypes and register definitions are introduced. The MMIO
> >> region, the interrupts and the queue are initialized (PRI is
> >> not supported).
> >>
> >> Only the MMIO read operation is implemented here.
> >>
> >> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >> v6 -> v7:
> >> - split into several patches
> >>
> >> v5 -> v6:
> >> - Use IOMMUMemoryregion
> >> - regs become uint32_t and fix 64b MMIO access (.impl)
> >> - trace_smmuv3_write/read_mmio take the size param
> >>
> >> v4 -> v5:
> >> - change smmuv3_translate proto (IOMMUAccessFlags flag)
> >> - has_stagex replaced by is_ste_stagex
> >> - smmu_cfg_populate removed
> >> - added smmuv3_decode_config and reworked error management
> >> - remwork the naming of IOMMU mrs
> >> - fix SMMU_CMDQ_CONS offset
> >>
> >> v3 -> v4
> >> - smmu_irq_update
> >> - fix hash key allocation
> >> - set smmu_iommu_ops
> >> - set SMMU_REG_CR0,
> >> - smmuv3_translate: ret.perm not set in bypass mode
> >> - use trace events
> >> - renamed STM2U64 into L1STD_L2PTR and STMSPAN into L1STD_SPAN
> >> - rework smmu_find_ste
> >> - fix tg2granule in TT0/0b10 corresponds to 16kB
> >>
> >> v2 -> v3:
> >> - move creation of include/hw/arm/smmuv3.h to this patch to fix compil issue
> >> - compilation allowed
> >> - fix sbus allocation in smmu_init_pci_iommu
> >> - restructure code into headers
> >> - misc cleanups
> >> ---
> >>  hw/arm/Makefile.objs     |   2 +-
> >>  hw/arm/smmuv3-internal.h | 201 +++++++++++++++++++++++++++++++++++++++
> >>  hw/arm/smmuv3.c          | 239 +++++++++++++++++++++++++++++++++++++++++++++++
> >>  hw/arm/trace-events      |   3 +
> >>  include/hw/arm/smmuv3.h  |  79 ++++++++++++++++
> >>  5 files changed, 523 insertions(+), 1 deletion(-)
> >>  create mode 100644 hw/arm/smmuv3-internal.h
> >>  create mode 100644 hw/arm/smmuv3.c
> >>  create mode 100644 include/hw/arm/smmuv3.h
> >>
> >> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> >> index 5b2d38d..a7c808b 100644
> >> --- a/hw/arm/Makefile.objs
> >> +++ b/hw/arm/Makefile.objs
> >> @@ -19,4 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
> >>  obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
> >>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
> >>  obj-$(CONFIG_MPS2) += mps2.o
> >> -obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o
> >> +obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
> >> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> >> new file mode 100644
> >> index 0000000..488acc8
> >> --- /dev/null
> >> +++ b/hw/arm/smmuv3-internal.h
> >> @@ -0,0 +1,201 @@
> >> +/*
> >> + * ARM SMMUv3 support - Internal API
> >> + *
> >> + * Copyright (C) 2014-2016 Broadcom Corporation
> >> + * Copyright (c) 2017 Red Hat, Inc.
> >> + * Written by Prem Mallappa, Eric Auger
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License as published by
> >> + * the Free Software Foundation, either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public License along
> >> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> >> + */
> >> +
> >> +#ifndef HW_ARM_SMMU_V3_INTERNAL_H
> >> +#define HW_ARM_SMMU_V3_INTERNAL_H
> >> +
> >> +#include "trace.h"
> >> +#include "qemu/error-report.h"
> >> +#include "hw/arm/smmu-common.h"
> >> +
> >> +/*****************************
> >> + * MMIO Register
> >> + *****************************/
> >> +enum {
> >> +    SMMU_REG_IDR0            = 0x0,
> >> +
> >> +/* IDR0 Field Values and supported features */
> >> +
> >> +#define SMMU_IDR0_S2P      1  /* stage 2 */
> >> +#define SMMU_IDR0_S1P      1  /* stage 1 */
> >> +#define SMMU_IDR0_TTF      2  /* Aarch64 only - not Aarch32 (LPAE) */
> >> +#define SMMU_IDR0_COHACC   1  /* IO coherent access */
> >> +#define SMMU_IDR0_HTTU     2  /* Access and Dirty flag update */
> >> +#define SMMU_IDR0_HYP      0  /* Hypervisor Stage 1 contexts */
> >> +#define SMMU_IDR0_ATS      0  /* PCIe RC ATS */
> >> +#define SMMU_IDR0_ASID16   1  /* 16-bit ASID */
> >> +#define SMMU_IDR0_PRI      0  /* Page Request Interface */
> >> +#define SMMU_IDR0_VMID16   0  /* 16-bit VMID */
> >> +#define SMMU_IDR0_CD2L     0  /* 2-level Context Descriptor table */
> >> +#define SMMU_IDR0_STALL    1  /* Stalling fault model */
> >> +#define SMMU_IDR0_TERM     1  /* Termination model behaviour */
> >> +#define SMMU_IDR0_STLEVEL  1  /* Multi-level Stream Table */
> >> +
> >> +#define SMMU_IDR0_S2P_SHIFT      0
> >> +#define SMMU_IDR0_S1P_SHIFT      1
> >> +#define SMMU_IDR0_TTF_SHIFT      2
> >> +#define SMMU_IDR0_COHACC_SHIFT   4
> >> +#define SMMU_IDR0_HTTU_SHIFT     6
> >> +#define SMMU_IDR0_HYP_SHIFT      9
> >> +#define SMMU_IDR0_ATS_SHIFT      10
> >> +#define SMMU_IDR0_ASID16_SHIFT   12
> >> +#define SMMU_IDR0_PRI_SHIFT      16
> >> +#define SMMU_IDR0_VMID16_SHIFT   18
> >> +#define SMMU_IDR0_CD2L_SHIFT     19
> >> +#define SMMU_IDR0_STALL_SHIFT    24
> >> +#define SMMU_IDR0_TERM_SHIFT     26
> >> +#define SMMU_IDR0_STLEVEL_SHIFT  27
> >> +
> >> +    SMMU_REG_IDR1            = 0x4,
> >> +#define SMMU_IDR1_SIDSIZE 16
> >> +    SMMU_REG_IDR2            = 0x8,
> >> +    SMMU_REG_IDR3            = 0xc,
> >> +    SMMU_REG_IDR4            = 0x10,
> >> +    SMMU_REG_IDR5            = 0x14,
> >> +#define SMMU_IDR5_GRAN_SHIFT 4
> >> +#define SMMU_IDR5_GRAN       0b101 /* GRAN4K, GRAN64K */
> >> +#define SMMU_IDR5_OAS        4     /* 44 bits */
> >> +    SMMU_REG_IIDR            = 0x1c,
> >> +    SMMU_REG_CR0             = 0x20,
> >> +
> >> +#define SMMU_CR0_SMMU_ENABLE (1 << 0)
> >> +#define SMMU_CR0_PRIQ_ENABLE (1 << 1)
> >> +#define SMMU_CR0_EVTQ_ENABLE (1 << 2)
> >> +#define SMMU_CR0_CMDQ_ENABLE (1 << 3)
> >> +#define SMMU_CR0_ATS_CHECK   (1 << 4)
> >> +
> >> +    SMMU_REG_CR0_ACK         = 0x24,
> >> +    SMMU_REG_CR1             = 0x28,
> >> +    SMMU_REG_CR2             = 0x2c,
> >> +
> >> +    SMMU_REG_STATUSR         = 0x40,
> >> +
> >> +    SMMU_REG_IRQ_CTRL        = 0x50,
> >> +    SMMU_REG_IRQ_CTRL_ACK    = 0x54,
> >> +
> >> +#define SMMU_IRQ_CTRL_GERROR_EN (1 << 0)
> >> +#define SMMU_IRQ_CTRL_EVENT_EN  (1 << 1)
> >> +#define SMMU_IRQ_CTRL_PRI_EN    (1 << 2)
> >> +
> >> +    SMMU_REG_GERROR          = 0x60,
> >> +
> >> +#define SMMU_GERROR_CMDQ           (1 << 0)
> >> +#define SMMU_GERROR_EVENTQ_ABT     (1 << 2)
> >> +#define SMMU_GERROR_PRIQ_ABT       (1 << 3)
> >> +#define SMMU_GERROR_MSI_CMDQ_ABT   (1 << 4)
> >> +#define SMMU_GERROR_MSI_EVENTQ_ABT (1 << 5)
> >> +#define SMMU_GERROR_MSI_PRIQ_ABT   (1 << 6)
> >> +#define SMMU_GERROR_MSI_GERROR_ABT (1 << 7)
> >> +#define SMMU_GERROR_SFM_ERR        (1 << 8)
> >> +
> >> +    SMMU_REG_GERRORN         = 0x64,
> >> +    SMMU_REG_GERROR_IRQ_CFG0 = 0x68,
> >> +    SMMU_REG_GERROR_IRQ_CFG1 = 0x70,
> >> +    SMMU_REG_GERROR_IRQ_CFG2 = 0x74,
> >> +
> >> +    /* SMMU_BASE_RA Applies to STRTAB_BASE, CMDQ_BASE and EVTQ_BASE */
> >> +#define SMMU_BASE_RA        (1ULL << 62)
> >> +    SMMU_REG_STRTAB_BASE     = 0x80,
> >> +    SMMU_REG_STRTAB_BASE_CFG = 0x88,
> >> +
> >> +    SMMU_REG_CMDQ_BASE       = 0x90,
> >> +    SMMU_REG_CMDQ_PROD       = 0x98,
> >> +    SMMU_REG_CMDQ_CONS       = 0x9c,
> >> +    /* CMD Consumer (CONS) */
> >> +#define SMMU_CMD_CONS_ERR_SHIFT        24
> >> +#define SMMU_CMD_CONS_ERR_BITS         7
> >> +
> >> +    SMMU_REG_EVTQ_BASE       = 0xa0,
> >> +    SMMU_REG_EVTQ_PROD       = 0xa8,
> >> +    SMMU_REG_EVTQ_CONS       = 0xac,
> >> +    SMMU_REG_EVTQ_IRQ_CFG0   = 0xb0,
> >> +    SMMU_REG_EVTQ_IRQ_CFG1   = 0xb8,
> >> +    SMMU_REG_EVTQ_IRQ_CFG2   = 0xbc,
> >> +
> >> +    SMMU_REG_PRIQ_BASE       = 0xc0,
> >> +    SMMU_REG_PRIQ_PROD       = 0xc8,
> >> +    SMMU_REG_PRIQ_CONS       = 0xcc,
> >> +    SMMU_REG_PRIQ_IRQ_CFG0   = 0xd0,
> >> +    SMMU_REG_PRIQ_IRQ_CFG1   = 0xd8,
> >> +    SMMU_REG_PRIQ_IRQ_CFG2   = 0xdc,
> >> +
> >> +    SMMU_ID_REGS_OFFSET      = 0xfd0,
> >> +
> >> +    /* Secure registers are not used for now */
> >> +    SMMU_SECURE_OFFSET       = 0x8000,
> >> +};
> >> +
> >> +/**********************
> >> + * Data Structures
> >> + **********************/
> >> +
> >> +struct __smmu_data2 {
> >> +    uint32_t word[2];
> >> +};
> >> +
> >> +struct __smmu_data8 {
> >> +    uint32_t word[8];
> >> +};
> >> +
> >> +struct __smmu_data16 {
> >> +    uint32_t word[16];
> >> +};
> >> +
> >> +struct __smmu_data4 {
> >> +    uint32_t word[4];
> >> +};
> >> +
> >> +typedef struct __smmu_data4  Cmd; /* Command Entry */
> >> +typedef struct __smmu_data8  Evt; /* Event Entry */
> >> +
> >> +/*****************************
> >> + *  Register Access Primitives
> >> + *****************************/
> >> +
> >> +static inline void smmu_write32_reg(SMMUV3State *s, uint32_t addr, uint32_t val)
> >> +{
> >> +    s->regs[addr >> 2] = val;
> >> +}
> >> +
> >> +static inline void smmu_write64_reg(SMMUV3State *s, uint32_t addr, uint64_t val)
> >> +{
> >> +    addr >>= 2;
> >> +    s->regs[addr] = extract64(val, 0, 32);
> >> +    s->regs[addr + 1] = extract64(val, 32, 32);
> >> +}
> >> +
> >> +static inline uint32_t smmu_read32_reg(SMMUV3State *s, uint32_t addr)
> >> +{
> >> +    return s->regs[addr >> 2];
> >> +}
> >> +
> >> +static inline uint64_t smmu_read64_reg(SMMUV3State *s, uint32_t addr)
> >> +{
> >> +    addr >>= 2;
> >> +    return s->regs[addr] | ((uint64_t)(s->regs[addr + 1]) << 32);
> >> +}
> >> +
> >> +static inline int smmu_enabled(SMMUV3State *s)
> >> +{
> >> +    return smmu_read32_reg(s, SMMU_REG_CR0) & SMMU_CR0_SMMU_ENABLE;
> >> +}
> >> +
> >> +#endif
> >> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> >> new file mode 100644
> >> index 0000000..0a7cd1c
> >> --- /dev/null
> >> +++ b/hw/arm/smmuv3.c
> >> @@ -0,0 +1,239 @@
> >> +/*
> >> + * Copyright (C) 2014-2016 Broadcom Corporation
> >> + * Copyright (c) 2017 Red Hat, Inc.
> >> + * Written by Prem Mallappa, Eric Auger
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License as published by
> >> + * the Free Software Foundation, either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public License along
> >> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> >> + */
> >> +
> >> +#include "qemu/osdep.h"
> >> +#include "hw/boards.h"
> >> +#include "sysemu/sysemu.h"
> >> +#include "hw/sysbus.h"
> >> +#include "hw/pci/pci.h"
> >> +#include "exec/address-spaces.h"
> >> +#include "trace.h"
> >> +#include "qemu/error-report.h"
> >> +
> >> +#include "hw/arm/smmuv3.h"
> >> +#include "smmuv3-internal.h"
> >> +
> >> +static void smmuv3_init_regs(SMMUV3State *s)
> >> +{
> >> +    uint32_t data =
> >> +        SMMU_IDR0_STLEVEL << SMMU_IDR0_STLEVEL_SHIFT |
> >> +        SMMU_IDR0_TERM    << SMMU_IDR0_TERM_SHIFT    |
> >> +        SMMU_IDR0_STALL   << SMMU_IDR0_STALL_SHIFT   |
> >> +        SMMU_IDR0_VMID16  << SMMU_IDR0_VMID16_SHIFT  |
> >> +        SMMU_IDR0_PRI     << SMMU_IDR0_PRI_SHIFT     |
> >> +        SMMU_IDR0_ASID16  << SMMU_IDR0_ASID16_SHIFT  |
> >> +        SMMU_IDR0_ATS     << SMMU_IDR0_ATS_SHIFT     |
> >> +        SMMU_IDR0_HYP     << SMMU_IDR0_HYP_SHIFT     |
> >> +        SMMU_IDR0_HTTU    << SMMU_IDR0_HTTU_SHIFT    |
> >> +        SMMU_IDR0_COHACC  << SMMU_IDR0_COHACC_SHIFT  |
> >> +        SMMU_IDR0_TTF     << SMMU_IDR0_TTF_SHIFT     |
> >> +        SMMU_IDR0_S1P     << SMMU_IDR0_S1P_SHIFT     |
> >> +        SMMU_IDR0_S2P     << SMMU_IDR0_S2P_SHIFT;
> >> +
> >> +    smmu_write32_reg(s, SMMU_REG_IDR0, data);
> >> +
> >> +#define SMMU_QUEUE_SIZE_LOG2  19
> >> +    data =
> >> +        1 << 27 |                    /* Attr Types override */
> >> +        SMMU_QUEUE_SIZE_LOG2 << 21 | /* Cmd Q size */
> >> +        SMMU_QUEUE_SIZE_LOG2 << 16 | /* Event Q size */
> >> +        SMMU_QUEUE_SIZE_LOG2 << 11 | /* PRI Q size */
> >> +        0  << 6 |                    /* SSID not supported */
> >> +        SMMU_IDR1_SIDSIZE;
> >> +
> >> +    smmu_write32_reg(s, SMMU_REG_IDR1, data);
> >> +
> >> +    s->sid_size = SMMU_IDR1_SIDSIZE;
> >> +
> >> +    data = SMMU_IDR5_GRAN << SMMU_IDR5_GRAN_SHIFT | SMMU_IDR5_OAS;
> > 
> > For VFIO case, should we not set the granule size based on underlying 
> > pagesize bitmap derived from VFIO_IOMMU_GET_INFO. Else if guest kernel
> > is build with 4k page size and the host kernel is 64k we would start
> > getting map errors. 
> 
> yes at the moment this is not implemented (1st target of the series is
> virtio/vhost).
> 
> On Intel if I understand correctly the minimum requested is 4K, 2MB.
> 1GB is optional. I understand the emulated model does not expose 1GB
> (FL1GP = 0).
> 
> On ARM nothing is mandatory although 4K and 64K minimal granules are
> "strongly recommended", leading to the following additional sizes.
> 
>         if (reg & IDR5_GRAN64K)
>                 smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
>         if (reg & IDR5_GRAN16K)
>                 smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
>         if (reg & IDR5_GRAN4K)
>                 smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> 
> Maybe we can override the ID5 values using the vfio_memory_listener. I
> will try to prototype this idea.

Ok. Thanks.


> 
> Thanks
> 
> Eric
> 
> 
> > 
> > 
> > 
> >> +
> >> +    smmu_write32_reg(s, SMMU_REG_IDR5, data);
> >> +}
> >> +
> >> +static void smmuv3_init_queues(SMMUV3State *s)
> >> +{
> >> +    s->cmdq.prod = 0;
> >> +    s->cmdq.cons = 0;
> >> +    s->cmdq.wrap.prod = 0;
> >> +    s->cmdq.wrap.cons = 0;
> >> +
> >> +    s->evtq.prod = 0;
> >> +    s->evtq.cons = 0;
> >> +    s->evtq.wrap.prod = 0;
> >> +    s->evtq.wrap.cons = 0;
> >> +
> >> +    s->cmdq.entries = SMMU_QUEUE_SIZE_LOG2;
> >> +    s->cmdq.ent_size = sizeof(Cmd);
> >> +    s->evtq.entries = SMMU_QUEUE_SIZE_LOG2;
> >> +    s->evtq.ent_size = sizeof(Evt);
> >> +}
> >> +
> >> +static void smmuv3_init(SMMUV3State *s)
> >> +{
> >> +    smmuv3_init_regs(s);
> >> +    smmuv3_init_queues(s);
> >> +}
> >> +
> >> +static inline void smmu_update_base_reg(SMMUV3State *s, uint64_t *base,
> >> +                                        uint64_t val)
> >> +{
> >> +    *base = val & ~(SMMU_BASE_RA | 0x3fULL);
> >> +}
> >> +
> >> +static void smmu_write_mmio_fixup(SMMUV3State *s, hwaddr *addr)
> >> +{
> >> +    switch (*addr) {
> >> +    case 0x100a8: case 0x100ac:         /* Aliasing => page0 registers */
> >> +    case 0x100c8: case 0x100cc:
> >> +        *addr ^= (hwaddr)0x10000;
> >> +    }
> >> +}
> >> +
> >> +static void smmu_write_mmio(void *opaque, hwaddr addr,
> >> +                            uint64_t val, unsigned size)
> >> +{
> >> +}
> >> +
> >> +static uint64_t smmu_read_mmio(void *opaque, hwaddr addr, unsigned size)
> >> +{
> >> +    SMMUState *sys = opaque;
> >> +    SMMUV3State *s = SMMU_V3_DEV(sys);
> >> +    uint64_t val;
> >> +
> >> +    smmu_write_mmio_fixup(s, &addr);
> >> +
> >> +    /* Primecell/Corelink ID registers */
> >> +    switch (addr) {
> >> +    case 0xFF0 ... 0xFFC:
> >> +    case 0xFDC ... 0xFE4:
> >> +        val = 0;
> >> +        error_report("addr:0x%"PRIx64" val:0x%"PRIx64, addr, val);
> >> +        break;
> >> +    case SMMU_REG_STRTAB_BASE ... SMMU_REG_CMDQ_BASE:
> >> +    case SMMU_REG_EVTQ_BASE:
> >> +    case SMMU_REG_PRIQ_BASE ... SMMU_REG_PRIQ_IRQ_CFG1:
> >> +        val = smmu_read64_reg(s, addr);
> >> +        break;
> >> +    default:
> >> +        val = (uint64_t)smmu_read32_reg(s, addr);
> >> +        break;
> >> +    }
> >> +
> >> +    trace_smmuv3_read_mmio(addr, val, size);
> >> +    return val;
> >> +}
> >> +
> >> +static const MemoryRegionOps smmu_mem_ops = {
> >> +    .read = smmu_read_mmio,
> >> +    .write = smmu_write_mmio,
> >> +    .endianness = DEVICE_LITTLE_ENDIAN,
> >> +    .valid = {
> >> +        .min_access_size = 4,
> >> +        .max_access_size = 8,
> >> +    },
> >> +    .impl = {
> >> +        .min_access_size = 4,
> >> +        .max_access_size = 8,
> >> +    },
> >> +};
> >> +
> >> +static void smmu_init_irq(SMMUV3State *s, SysBusDevice *dev)
> >> +{
> >> +    int i;
> >> +
> >> +    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
> >> +        sysbus_init_irq(dev, &s->irq[i]);
> >> +    }
> >> +}
> >> +
> >> +static void smmu_reset(DeviceState *dev)
> >> +{
> >> +    SMMUV3State *s = SMMU_V3_DEV(dev);
> >> +    smmuv3_init(s);
> >> +}
> >> +
> >> +static void smmu_realize(DeviceState *d, Error **errp)
> >> +{
> >> +    SMMUState *sys = SMMU_SYS_DEV(d);
> >> +    SMMUV3State *s = SMMU_V3_DEV(sys);
> >> +    SysBusDevice *dev = SYS_BUS_DEVICE(d);
> >> +
> >> +    memory_region_init_io(&sys->iomem, OBJECT(s),
> >> +                          &smmu_mem_ops, sys, TYPE_SMMU_V3_DEV, 0x20000);
> >> +
> >> +    sys->mrtypename = g_strdup(TYPE_SMMUV3_IOMMU_MEMORY_REGION);
> >> +
> >> +    sysbus_init_mmio(dev, &sys->iomem);
> >> +
> >> +    smmu_init_irq(s, dev);
> >> +}
> >> +
> >> +static const VMStateDescription vmstate_smmuv3 = {
> >> +    .name = "smmuv3",
> >> +    .version_id = 1,
> >> +    .minimum_version_id = 1,
> >> +    .fields = (VMStateField[]) {
> >> +        VMSTATE_UINT32_ARRAY(regs, SMMUV3State, SMMU_NREGS),
> >> +        VMSTATE_END_OF_LIST(),
> >> +    },
> >> +};
> >> +
> >> +static void smmuv3_instance_init(Object *obj)
> >> +{
> >> +    /* Nothing much to do here as of now */
> >> +}
> >> +
> >> +static void smmuv3_class_init(ObjectClass *klass, void *data)
> >> +{
> >> +    DeviceClass *dc = DEVICE_CLASS(klass);
> >> +
> >> +    dc->reset   = smmu_reset;
> >> +    dc->vmsd    = &vmstate_smmuv3;
> >> +    dc->realize = smmu_realize;
> >> +}
> >> +
> >> +static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
> >> +                                                  void *data)
> >> +{
> >> +}
> >> +
> >> +static const TypeInfo smmuv3_type_info = {
> >> +    .name          = TYPE_SMMU_V3_DEV,
> >> +    .parent        = TYPE_SMMU_DEV_BASE,
> >> +    .instance_size = sizeof(SMMUV3State),
> >> +    .instance_init = smmuv3_instance_init,
> >> +    .class_data    = NULL,
> >> +    .class_size    = sizeof(SMMUV3Class),
> >> +    .class_init    = smmuv3_class_init,
> >> +};
> >> +
> >> +static const TypeInfo smmuv3_iommu_memory_region_info = {
> >> +    .parent = TYPE_IOMMU_MEMORY_REGION,
> >> +    .name = TYPE_SMMUV3_IOMMU_MEMORY_REGION,
> >> +    .class_init = smmuv3_iommu_memory_region_class_init,
> >> +};
> >> +
> >> +static void smmuv3_register_types(void)
> >> +{
> >> +    type_register(&smmuv3_type_info);
> >> +    type_register(&smmuv3_iommu_memory_region_info);
> >> +}
> >> +
> >> +type_init(smmuv3_register_types)
> >> +
> >> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> >> index c67cd39..8affbf7 100644
> >> --- a/hw/arm/trace-events
> >> +++ b/hw/arm/trace-events
> >> @@ -14,3 +14,6 @@ smmu_page_walk_level_block_pte(int stage, int level, uint64_t baseaddr, uint64_t
> >>  smmu_page_walk_level_table_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d, level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" next table address = 0x%"PRIx64
> >>  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
> >>  smmu_set_translated_address(hwaddr iova, hwaddr pa) "iova = 0x%"PRIx64" -> pa = 0x%"PRIx64
> >> +
> >> +#hw/arm/smmuv3.c
> >> +smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
> >> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> >> new file mode 100644
> >> index 0000000..0c8973d
> >> --- /dev/null
> >> +++ b/include/hw/arm/smmuv3.h
> >> @@ -0,0 +1,79 @@
> >> +/*
> >> + * Copyright (C) 2014-2016 Broadcom Corporation
> >> + * Copyright (c) 2017 Red Hat, Inc.
> >> + * Written by Prem Mallappa, Eric Auger
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License as published by
> >> + * the Free Software Foundation, either version 2 of the License, or
> >> + * (at your option) any later version.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public License along
> >> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> >> + */
> >> +
> >> +#ifndef HW_ARM_SMMUV3_H
> >> +#define HW_ARM_SMMUV3_H
> >> +
> >> +#include "hw/arm/smmu-common.h"
> >> +
> >> +#define TYPE_SMMUV3_IOMMU_MEMORY_REGION "smmuv3-iommu-memory-region"
> >> +
> >> +#define SMMU_NREGS            0x200
> >> +
> >> +typedef struct SMMUQueue {
> >> +     hwaddr base;
> >> +     uint32_t prod;
> >> +     uint32_t cons;
> >> +     union {
> >> +          struct {
> >> +               uint8_t prod:1;
> >> +               uint8_t cons:1;
> >> +          };
> >> +          uint8_t unused;
> >> +     } wrap;
> >> +
> >> +     uint16_t entries;           /* Number of entries */
> >> +     uint8_t  ent_size;          /* Size of entry in bytes */
> >> +     uint8_t  shift;             /* Size in log2 */
> >> +} SMMUQueue;
> >> +
> >> +typedef struct SMMUV3State {
> >> +    SMMUState     smmu_state;
> >> +
> >> +    /* Local cache of most-frequently used registers */
> >> +#define SMMU_FEATURE_2LVL_STE (1 << 0)
> >> +    uint32_t     features;
> >> +    uint16_t     sid_size;
> >> +    uint16_t     sid_split;
> >> +    uint64_t     strtab_base;
> >> +
> >> +    uint32_t    regs[SMMU_NREGS];
> >> +
> >> +    qemu_irq     irq[4];
> >> +    SMMUQueue    cmdq, evtq;
> >> +
> >> +} SMMUV3State;
> >> +
> >> +typedef enum {
> >> +    SMMU_IRQ_EVTQ,
> >> +    SMMU_IRQ_PRIQ,
> >> +    SMMU_IRQ_CMD_SYNC,
> >> +    SMMU_IRQ_GERROR,
> >> +} SMMUIrq;
> >> +
> >> +typedef struct {
> >> +    SMMUBaseClass smmu_base_class;
> >> +} SMMUV3Class;
> >> +
> >> +#define TYPE_SMMU_V3_DEV   "smmuv3"
> >> +#define SMMU_V3_DEV(obj) OBJECT_CHECK(SMMUV3State, (obj), TYPE_SMMU_V3_DEV)
> >> +#define SMMU_V3_DEVICE_GET_CLASS(obj)                              \
> >> +    OBJECT_GET_CLASS(SMMUBaseClass, (obj), TYPE_SMMU_V3_DEV)
> >> +
> >> +#endif
> >> -- 
> >> 2.5.5
> >>
> >>
> > 

-- 
Linu cherian
