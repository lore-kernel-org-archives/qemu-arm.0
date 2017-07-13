Received: by 10.25.44.15 with SMTP id s15csp1774052lfs;
        Wed, 12 Jul 2017 23:43:00 -0700 (PDT)
X-Received: by 10.237.49.41 with SMTP id 38mr3077342qtg.244.1499928180040;
        Wed, 12 Jul 2017 23:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499928180; cv=none;
        d=google.com; s=arc-20160816;
        b=K/AMnR3cVUvusKamk/2ArHxUA1DtLxHgzX7JY9ko9o5+M+A5Wu3mC5ey7UVvWv8L6z
         csbbEhGTxV/exXX4vWSp6TjXwOFa7ywgyteKUYTJt91J93vvEjRn5zuzCVigCrOu9r1m
         Wg+6uZ+fQJm54CY577lXhtlMRGuAHqova2QiYAyB/Q/KOkd+v77GXL/QmGLzPGgsLwEr
         kKS5+b+fgeBjBR2MQRXTGS939YTlEIxI5n44nr5FzFCiiKUWiPYq9lUxqIPyb6lXKGLf
         Ost/CffswnLBRKe8lFC3a5covlV45hnoicO3hcOZHQ7X1MiNtdW/YqBzS1pcSBzsM4DV
         92Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=0ksp9/aq6hLYORc9kxO5mGAuPFTW4qLYP8Wv+OWESl4=;
        b=HEDdgialraP+R7gxu/jg6N4NUgdD4mW3PRLLJ2qOgZbI8nYEtSkrTxzM+btxl/u/Oz
         Kx5vl66Ru2A8LEGhDvVgogVpEIkDro7KkN6Czm6qZq25qQPFVCnxyB4gS83i9f7McjsM
         37wn0rdQ3nSz1ecxe0bKCDuI69ioPuPw+E5KBwRfQ2cHrnTP5YAgpmfGpaKJESkeGv6v
         KPFfTJYJzBOJpshKjl2833Vnf902iVFgNBdCX7Y0X78Vv0tMLyLNnKhFRAuJc3X8OSvw
         BPsnkk0hn3Wib6cTSCLTCIoxYggjZU+evfets1iUXdyiiQZDiXD5b/1ZLrzEImD28gJ6
         ecIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s4si4395546qki.253.2017.07.12.23.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Jul 2017 23:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:57469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVXpx-0001xo-0h
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 02:42:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVXoP-0001LM-Az
	for qemu-devel@nongnu.org; Thu, 13 Jul 2017 02:41:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Bharat.Bhushan@nxp.com>) id 1dVXoK-0004pX-F0
	for qemu-devel@nongnu.org; Thu, 13 Jul 2017 02:41:21 -0400
Received: from mail-co1nam03on0047.outbound.protection.outlook.com
	([104.47.40.47]:15230
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Bharat.Bhushan@nxp.com>)
	id 1dVXoK-0004nU-1I; Thu, 13 Jul 2017 02:41:16 -0400
Received: from MWHPR03CA0027.namprd03.prod.outlook.com (10.174.173.144) by
	BY2PR0301MB0599.namprd03.prod.outlook.com (10.160.125.21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1261.13; Thu, 13 Jul 2017 06:41:10 +0000
Received: from BL2FFO11OLC006.protection.gbl (2a01:111:f400:7c09::107) by
	MWHPR03CA0027.outlook.office365.com (2603:10b6:301:3b::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.13 via
	Frontend Transport; Thu, 13 Jul 2017 06:41:10 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11OLC006.mail.protection.outlook.com (10.173.160.95) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1240.9 via Frontend Transport; Thu, 13 Jul 2017 06:41:09 +0000
Received: from localhost.localdomain.ap.freescale.net ([10.232.14.21])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v6D6f2F4013081;
	Wed, 12 Jul 2017 23:41:03 -0700
From: Bharat Bhushan <Bharat.Bhushan@nxp.com>
To: <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <alex.williamson@redhat.com>,
	<mst@redhat.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Thu, 13 Jul 2017 12:08:40 +0530
Message-ID: <1499927922-32303-1-git-send-email-Bharat.Bhushan@nxp.com>
X-Mailer: git-send-email 1.9.3
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131444016701559030;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39400400002)(39850400002)(39380400002)(39410400002)(39450400003)(39840400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(68736007)(36756003)(48376002)(356003)(50226002)(8936002)(81166006)(38730400002)(6666003)(85426001)(4326008)(189998001)(8656002)(626005)(50466002)(8676002)(498600001)(72206003)(77096006)(6306002)(54906002)(53936002)(47776003)(5660300001)(305945005)(2906002)(5003940100001)(7416002)(561944003)(86362001)(39060400002)(106466001)(2201001)(104016004)(105606002)(50986999)(2101003)(217873001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0301MB0599;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2FFO11OLC006;
	1:IWKaGUqzXq4WrklAY5A7wxNWamm3mta8x2f6GkfQr?=
	=?us-ascii?Q?U0/SX6nNqKDA8I44tF3dnGeHGBjfS4jKZxGvoy8s+cGrPGQ2z+vX/NdVe5Rh?=
	=?us-ascii?Q?oZaJywRtjExrqRk1hOo5Hu9PCi20Xn35rt1ojvpBdjfnmZY2uu6NIabO3uAt?=
	=?us-ascii?Q?UyZnBADLxiEXIyE/H+N8VW1OSfa66hQuN0eD0HQTdI11jpEEVjoQVkN9ERRx?=
	=?us-ascii?Q?bGPQUikLP78GLeJ8vT04UmKvoybdHPoizZD/YAxL1dEXe8zvDpMaCuzgt99F?=
	=?us-ascii?Q?1oxSDlkqh2W3ycHPDn6D66Olako0maEq7gSyzPycxJXgbhQxVodtrzK2QiCA?=
	=?us-ascii?Q?Lm3UCiXXaYX4b3jUrjPv35Bd8vQ4RltnJWSMCbqPtJjdHpxTKYZoMvGhaGhC?=
	=?us-ascii?Q?hpfMzKPi8CRGvqeOWluHsZnMJ43Nkx9WdR75lb2w6GlwsnhaAN+pB9zLZ54I?=
	=?us-ascii?Q?gO+E8xFEt5Fk2Y9jSuGlWFdLTiqbk5PQOyJbDff/rb6vj3TNLRcMyAk12DjQ?=
	=?us-ascii?Q?Tsn2TWF94MD/mC1KVPV6I6pDklcmEJuU/r5XWhZUApDYh6ORAmCxsTFuGATW?=
	=?us-ascii?Q?kEx3ugLmQVxVzrwBjRh75sWJUXDmWtz/7mzCGdIHjKGT9QuTSxnzW4z3dK+u?=
	=?us-ascii?Q?KcMx1bGGIMrMuMD1FEg/woBIUHo/X7hDi9K3wjySeJ+uh5pqmKpokkCg55OC?=
	=?us-ascii?Q?LXDqwbdD74O19BUIymXefTCW9qwFwrc/MWod0YoSw9V42arpFbvdbaXQkOCN?=
	=?us-ascii?Q?zDExpulZKOoigwVCLeHP3JD4W/HM7jWvGrFJQr1Ti/r1y9mRTk+QTUoo0e97?=
	=?us-ascii?Q?ItfIMxB4CZYyfUEj8b3wzdsSuskfuFkRoykBKITpNIU/O6PY6x7qdGqBDYlk?=
	=?us-ascii?Q?LfM5WBhd2pd9MW6FlD0CIXJ0oqPoLko+/+78KKQT82xddYaKocWNNBjngavP?=
	=?us-ascii?Q?MpSID1NRprFyKMWzuzfORvithVYWXn29OAzAdss18q7AZ/V6QhxGL7jYoNEZ?=
	=?us-ascii?Q?HDquk4MxAV5AK6V6XYQHBw5NvopdvEtptRmsaiNypzf3rKnd3OQ9Awl01TUY?=
	=?us-ascii?Q?I2fB1JGyDMLpaRahoBIjKS4FJO0?=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7ea70b4-cea3-4db4-c61e-08d4c9ba25bc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(2017052603031)(201703131430075)(201703131517081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:BY2PR0301MB0599; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	3:QxyPPhtYNHLlracWt5kXgEHXn5lNOefZxbAuv/m5ldidli/zz4YVWS8YXRtPKiX8A4QIKaVSHr5mGPXEmdJOcHQVeRtJ5ofNMeFPWHkXH2uVKR7Gc/Pbf4ubegehrp4rMG/dQf73oBgsH+mejKXSFv4WQLUEUaL1SJBofjNGuw8DCRjHlMlD++l8Tu0UaNExbR0VqjPQIGv7gz150i/Do+SwB7KDqK2/4UbvJth6h/cV9TRhe83iUQdCpfDWGFOaeJ+Z5rHv/Maq6KcK2xiGXvmiWXh8ZeayFf1ZLCB7B8PyifluY605uOr0QMRr/dQvCbdEbhF8sjdYr+oHtl6LOIYOJGF2oNJ0PpzDZbhqtjz2r7xz0LG6PHcFaq3ZUCRnTmXsrB55TQbVehkWyCUHl+3Nn46lQt15ywRWtjD2ad9V0R9YZy67vZe9cjJNeC2bQPEytao/7k3VliWA1qTfho5AaqRTR11TvXGs/NDnLlU28dugg3tB7vi96LEYYuL07aDeJGvfvhNvciMhD+NRzXYE4gf1wR8h8iD9FJ8nczeCdoYd/H21YnVczUvDTqnpwJon3cxoRFGeb8pc57L2nydtGgNnscuX5cYSzRYcmdYZS4SOzDie/hRk7LDD34n66lIARQdXo/duYXykiWxSEeu9xJf5Xq2VEFtF8stWuuolrjJy/MYa7SW+jeBZAOlagt4QYpivI/3iFmhrR3/iB49CC2TBYH5ZvlgByq+WUlg/8MmDxIpJry2yBmZehTx0Ml7tZLt3uodSJWDlz7tLtk0xkG7omtIjTNUCnXLN6CpYuKl19PRH1GcwKApOl1fQwtEKyCCKw6or3UqZjx9eFQ3yzDF8+oaH43OYfvdzPaA=
X-MS-TrafficTypeDiagnostic: BY2PR0301MB0599:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	25:nMZVbtlle6ht1Q3l9NqUyKQFIXXdr6/q0V5uINQZWCwPZS0fQzWe2FhbHe6+QqyvQ0FTEIPROHdbidlZnbAtQnjTfI1UIlyPEQU2NjEgV9uom+b5iO+FSFtjPjVwkJh3dWHk3yX3johk3oQKhaBICBmP/vksZTSoYQIfcfDmvJ6cbYLdMBD/uGbqOApT5Udoir9Xq1UTA+jJVcOK/KDq22mzTB5D7Rfwx9+ZXLU/P3ED3Cq19E0Zg/XH/Fy0s75SfxptITL/oJiF/7y4eh0xAfA2rGm8Sa5YQ6OMiJoDszB5aZ3Fs2biumyEEkD+9WLhp9zjQdVcMUVgzhja8eX7VuIpHnmDhoVkV+kTKIVauhpuG4AIdeIEk60+odrzPFOLuoktx7Zc0I7W9GoiI4HzY6S5iqmk2jCnf6E9n3KOH4iDE7rv56wQNDP/hHCuyL/0XfzllHyoR0aDBy3GHIS0E2r4Zalpm9WJKFnyDD11zfqV2q6WK079pHunlDqRBDuorU+eEyZf46ChrtlQPROy0/+sYuwosO0HU0wU6Y50wJ2Mux86mvk1VF5MB4Iix5KXM+lLCwYovhRYYocxlhL9PXrn39bPR77T6QKuTE6F+B810zXocPmcouIyiNSqEL8gBmr0GzwCuETGQ4zFWdC0oAQw03vmo3nZXXNn+jZIXfj61aZKgvpZ0jykqvIDrukkhr9V7YgkhAaGassSatN3VN+4KUc7AYustgjfPB1sStoa5H8VkrzbMyGVdjTqxvc/hnGVYw7WoTqKj4ocUgXxeCq6BMhBm8kSKi4Q2/1plvFbf7k3TO/xQFPXrNFwZ0aTMtkItV9X7JbfbueZqu+pPgRrxidMlGA4fmeGXmuFQQHEUFfupkCZ9R+FPb/ZfaBdIoZIZzDPTJ3rEIYqhljDPTUs1heuGV74UQ/q8CBfT/0=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	31:cl70gsU3AjtLhLwE8lOOWhGJRBXO7YNKxfa0e8Fo3eedIBHPC6yfLH7LvmA8OR5nOV8/75PZjj+aY7QEg662MJjE4CzvwE3LzlZ3e1rqdc2jwKB5Z57heXOkr9Tqtwjw36L1PO+IOoeHpT1HjgeiC1rIAqQCtmP/6uwA3R4h9MXwr8kDRZsvNd/tmMKw72aoHYPrepCxWYvqidPUhndbuWYTXQfMu+p3hIrE+2CuZIAS5kaVwWKZ2WHUBizNhlo6wVUqN40HGi8kgo98WO0LGWhOGNGqurP+vCAauLEMZAEvihj4LASoohSd8wWW1O9MHAzgH/lwQFXcxqemcKdA+fvuxTZcIH6ZyGpcnR0sxJ6uhQliDubIq6T183rr1qjVefaRFH/0klUGTMIqQAlwWRO/oN2zOiKjcO8R302FK9wLpvj7SWLao+eiYgzdcaowt3RJqUm2fSHHSqt9wXU3BZ/zGV9xqPDNjvodBGPz6MSqKPa/hsb30LTuDEE9dCyqXTxrQR4P1PZtH/8ETORC+wV0+aEo+buOcgII9b3hgi9rWqy/oBnnnwE/FMT1KOb+wL50L/kAfbsUGTPv8qZdMqNxnoXVoPunAA06SZt7N1/P21Wmw0BEQQBRHLOyKAU/gG3Ig1QSIzEOgYT/Gbau89zmbn/T2DVVOqdMIZxZyGkuumwYTFMYOclpqeI1dJrtAi/0AVsLLc5+K6C04opXyQ==
X-Exchange-Antispam-Report-Test: UriScan:(226959686518644)(22074186197030)(236129657087228); 
X-Microsoft-Antispam-PRVS: <BY2PR0301MB05995C3C282C48EF75956E139AAC0@BY2PR0301MB0599.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6095135)(601004)(2401047)(13018025)(2017060910075)(5005006)(13016025)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6055026)(6096035)(20161123563025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123559100)(20161123565025)(20161123561025)(20161123556025)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BY2PR0301MB0599; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(400006)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BY2PR0301MB0599; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB0599;
	4:3W5JrhCnpvBS3nsSkDnE6CuenbBCuqbAfdKidsAT?=
	=?us-ascii?Q?0xmBn/ZhTnlYSfh+vaK22wF841VjgXSfCrkTeag/8x2sXvjlNBxS4+8qdylz?=
	=?us-ascii?Q?PpSdlkLpXF3SwzIao2MQ5Ag5BU5D9k9M7cpRkMahNOdx4RJwEC4r5ohSNJj4?=
	=?us-ascii?Q?fA3A/eKKCQqEQ997zaZ6QMC8PHRG/xzTT4YzureWSLKRx7c1hKx67CXxuP3S?=
	=?us-ascii?Q?wL3+r8PkMbuw6kni4n1kSkexekJYpZ/rKKmKM4ySFHuAJSPpilPEkA+SZ/9n?=
	=?us-ascii?Q?ruo9iuzDB3uBJq8bIsB8PxXzXiZOviNMG4byq0ZMIU8xm5wLqHCsH8iHCa2g?=
	=?us-ascii?Q?xujhTARGICTAp+aXpIliZxmEsxo5OzG/mkSKs+w4bNVrPIhULGkEl3zQrl7G?=
	=?us-ascii?Q?iF+wqMEXePqjqgREY80hqg7AawVnho3nXyDWs2lp2roewKoKHvOeEGiAqj7K?=
	=?us-ascii?Q?QPJEOkQ99F43ycw4HF0kafI8+miaUfjcQClQf0MRi9EHe5tzGpVQ6ePq3pHr?=
	=?us-ascii?Q?5tXqdvLJsfR5GOtz+9/DkNNgdLyZvibQMmhQDmddxwtwVYtJ3gTJEG82uZBy?=
	=?us-ascii?Q?A/cN/326YUU+6HDYX1dWPAkNSRzfbG0FZkvbrhcCjU756j0ZsAx9aeuADbo4?=
	=?us-ascii?Q?esxVByIqbcRsna+Dq1eWzQ4uutMZdQdIzn3QhxD9Hqznq8goCx87laKpT30B?=
	=?us-ascii?Q?BK5w1kF7Illb6oVBYY4/6irjHp0xbUkO/G6jvMZswmsLlMDUYiG48m7Xq4km?=
	=?us-ascii?Q?fwYnQ9yEdVz6DFtOvk2CpG4U/8KIz3CQfuYFHeJ8AL0RdvmMQUcD9mnXJvlt?=
	=?us-ascii?Q?xyo7lUnNlgwP/LJfpzsSYrgjakq1k6FYF55CTiK9tNlJr/9poBM+sCkbekPI?=
	=?us-ascii?Q?QXgUucJvbD3Y+DVCjl1j3xt+1MTe83tANz0+i6fZytgnARfIl3geTXBE8QuU?=
	=?us-ascii?Q?8qXDtwvNrSBZbSV+qEryIoDtvuH80CfEVncifL4mRAAbgRUvoFAzQ4fqglUd?=
	=?us-ascii?Q?LnpbYQrD1YOew9hT3M+LU2OY3Js4wqq1L7wxX1fDQ414u/J8WpaY3VGXOvFu?=
	=?us-ascii?Q?tcKvtLVoIursYKYyjTvWcyXEx1fUJ8b/3L364Mv6d9eRCcCcZ5bYM1Cd8PDu?=
	=?us-ascii?Q?F5l8duwymmghqIjJUf82ucQ+nGZxTvC9mqoVphoTl3MxiDppOCtws+RwT9u8?=
	=?us-ascii?Q?2u+VIDcqQZwxrLEhtsDYQqpJ41bffbUbq2oYn0CndPA3WXaPkUBH5qwxuyYF?=
	=?us-ascii?Q?rBjABsmD1bcDVt7KSs+w6FaP3wu7q2jD05LXFIEQe0id8DS+F86aKLFs0wbT?=
	=?us-ascii?Q?VRBTOgBwxxextAmBxOVq+QbdJMl6IZZ/veCKdnTjfPr4iHecusNe/Ib49gkK?=
	=?us-ascii?Q?DMCtaw=3D=3D?=
X-Forefront-PRVS: 0367A50BB1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB0599;
	23:8V57glkn7H993khDVHSFjo6W+Xaa205H8S3jAeh?=
	=?us-ascii?Q?DwqsAQ6+TMZ1J6ob3rFmrFgz/N7KUHZ3NqxJxyp22ka57f0ZTEQWsm1X0D2n?=
	=?us-ascii?Q?AGwJeRjOgGRnEIRHC65LLv7F5TuSC3ZAA+mOw8/FRPm32fxCudrVxY/JPJQ4?=
	=?us-ascii?Q?YLoMmYHmdLRyoAHgUaFQ+qH2D5+LiA617FGzskG13Ho2Jb1N7TTXG95Io5Uv?=
	=?us-ascii?Q?x2USHfpVdIKNoK+hYnrBSRxG5MCw6icBAt0ScX3yFsrMGdv+vjmQ/kl6jLiM?=
	=?us-ascii?Q?OiR5xXr6t/NAT0GVqnf0aSl9tGsk68zkgSGkNlCSqQKKiIFGayI2c03kcXsv?=
	=?us-ascii?Q?Dw9ORF8c7ZsguiEJZIGvHo6+h/kr4PlYGa8L0xtZlJF0pA5CM4Y/XCr2LHXy?=
	=?us-ascii?Q?3zKbZrTTSkSDq9iUWLzq47EH6CwancD/JgTRPay+jVvJ257I5u2aL8begXb8?=
	=?us-ascii?Q?EyzlsUFrShudr76A0HmcX43CUlbg67M1mRhmKqGO6vNBOKpzVu/Hq3kQfJkc?=
	=?us-ascii?Q?qJyBu+u58waNqoFil/XYcyxAOU1QgWK/Nd1NK6DT9mBPkGpk7Rk05c1sKE6e?=
	=?us-ascii?Q?VUjIZdw7IrszrmJGL14fhlFotRSuBwHDEmFziW7KR6eYp12eCGF10Vfq7KJU?=
	=?us-ascii?Q?tXM50qNy2VLf8uvc4S9zit1H3XaZlQuH1Yax+HP/hVCebuFIc6/rb+Bb9+hC?=
	=?us-ascii?Q?eELDdkRP+jI9SQDqTMpTMLuPPZEoYSLjoDhdFKLYbhgxq1ogQ7Lebb5xRGIn?=
	=?us-ascii?Q?g66hCp8QggEZn/36T1Nq9eZXCB2V8h/sWZlwdO9PCruohrCQNA66YM0m3gx5?=
	=?us-ascii?Q?25qfVhDffR7wKW7i+yN21/YdMx+LvNPZrzaX8F0Aitl0rRELvRYbKxXYk7Mq?=
	=?us-ascii?Q?FrLnw6zjk2FZAMIervPxCXk6vriAfEipqQQ2Pw8hdHKIzF9OvpAtNBe7l4ff?=
	=?us-ascii?Q?p5yW1jnR3142/eKMEY2Jq9WQf6h3Wa/q8mlnwSSUgQbUYc/eyn6XJxCo50+3?=
	=?us-ascii?Q?BykbgS1igWgZsVRqvE3X6SHRKflc7UW+51E4tSqS1mzXQoFmWxpz6qXsd09q?=
	=?us-ascii?Q?CwxOgbquuuA1wmcBw2B8t4CiVL4BLT4Nb0s6nZ9zepsynwwbP542iflPmEBj?=
	=?us-ascii?Q?V8RMJBX0ddJNqEsNB/ujkwtmTMXIjmgCuxuj1J+JjbgxAaq1ygSGW5FOMtfz?=
	=?us-ascii?Q?EdEe6XgyCaaIrDcWrVoLFV7c1OzOZ5GfSLqMQf4Slpv4huPdNcHJmPY1RRQr?=
	=?us-ascii?Q?ZB5Sbpz9xFDeOCGIGUwmHyyya7Zdp332M4dO7uKMZspIJytddMdoiu314AHp?=
	=?us-ascii?Q?XOKyAW2+iXWQ58NA+9iHHPf4=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR0301MB0599;
	6:RlHQt4pspSqhz97c9D1eVbO5EdLRe5OZjdEOqXi0?=
	=?us-ascii?Q?Gd+A3PpUQuO4WsuL+Z47iwFD+ajJNknhczCamd/NfD8vDPckkgA6D+Efjw+t?=
	=?us-ascii?Q?KRYGfFjos71fLzx7+lyZ2i1Lvqy6YCnoc/OxgDEtPi4htVjqFBQQ85IZxUu7?=
	=?us-ascii?Q?9JerJ5gDg4juRGCYQ0NnbFLS44eurHXuDU6f6Hr+uQs6P/s11h5ijXPmEz+M?=
	=?us-ascii?Q?bmGnaCq6vT/gKoegI5dHwa51M2wsjhX98TeJop46oRMSrytzxtaOGxdZgsE6?=
	=?us-ascii?Q?3cy9LdlA8LdFTi3lde9cUHx8Qb2IQml50WFfb1FY+eBe0KqLf9lTO4ze9oK1?=
	=?us-ascii?Q?V8Ae43dFgI4xhGlJRxPqclbkJl+G51Mu6jeJWHH/RDRDRFoWv79GGno+j2hB?=
	=?us-ascii?Q?eDyRKxFPqppWOkKmV5VSKeUANklMLhp5iut5QgACE/Gl0Ow7M6vz6ekOp4rO?=
	=?us-ascii?Q?bq7JILmdDfk1J8dz0XJgQhVozmH6iefRUWXEhQCNqfpoFEuCB/Yucq/b+7Su?=
	=?us-ascii?Q?+iNQAkFd+hcrfA1zNkHXASVNJO0qjLp0ckBTGGD2keUjIC94SmJI0M5rsNtr?=
	=?us-ascii?Q?WBFt+H+ihMarxNqe/j+oQazNr/TzX7o2s4gHfvergCQwY55Q2LkzV0GEzrje?=
	=?us-ascii?Q?t+hTCWicDC2IaB8Fs3SGFb5oQSfeZbqST6F6Wig3nno8k8UGGka/BOv0z+7M?=
	=?us-ascii?Q?rEzJ3rt9Mw3XfybNv3XlQn8kRsfZUJci9o6SVtih9jHNIGXPSWBkPWXzrPCB?=
	=?us-ascii?Q?6XmhkxRJATXOeVxSqNZZ5Wvo+CgXf+fKBlDfAYZjJbBKsfZvLTe9fHT4gc+a?=
	=?us-ascii?Q?9ioTIE6F6IxmnFNzmHm76VyeGd6Tv1L9x12wEsuJlE+nuEyetHXl2CH3ORQ5?=
	=?us-ascii?Q?cu5RKM5rIUYwq4HUyCfzwAZlj+ogCPzRCKmbWHBP42TCOWEdLufdwcg8T2O+?=
	=?us-ascii?Q?U42tjiiDqhOJy+JARdbhVCxvQNodilpebo0KDBoQG7XDxi0sFQ9AsMaDQOBu?=
	=?us-ascii?Q?DAk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	5:noFAcUGjQVDh5gQpAj8lXgZoevq9jge7Gw+Ajd2+TuwppjuW+2wS0nFQ7N3hTax7t8JClNHWgnbKDgPa8Y1WJZthYbuYfV7ux647URzL/p4eymKtipAmCAUpaQdUTtnJBpXhdI/5dvSK8eGsrPKPxwroVvFJIIcq9qFsWmt5l1yHsDbNxtoY9vguk5j/Feqy8olSCfzQvkPfFZ3iJoygxHfexojMkw+kiMaKm97fUOLu5B5U7LPzTxM70LL+4cc8uNf3ZpZMB7c3tIZRxys3gw2JaHBegoJAHtOo3J2Dhz+wt2tzKG2neKEAqUfcSFCgpLbEJiUvceE6BYStpdhGyivlgXe/A/Ypgy9NGRya0y0qeF2iLDCfKbLindJA5JtMI6to0JZbrDH9l+KhRIgFpRp/wapX1R88U8cNFQ7O12PJ9T4Mr3+A31JMYofFueFjIqm2fitkmF2/97dw3QKG4nFT+tXGjZH1r9S/n/QzMwKv3G2barrrBLu7694tcmLywXiUfmnv8u2Cjsr6hxPHCg==;
	24:hCWQtxNnMguGcqIOJ2eX90CHr7QggC2WkGXghYCcN+lzg3EX62+CyNpSr1KXGUeEvchFMneI160ugVJN57H2ha5oCuULwZZ9t60dCKUBZcI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0301MB0599;
	7:PNcHj6U8rl6bi7fNw7yof7p9bibPfqzBb/OuX+MvMUFZE2d6L84vHKl/CHlJ4pRxaGa+KtvKh+LxVJjvF64F4LBfh0ryKDBaLgPvDgajAoh/tasxx+sRKh0fHEMnqXEywjgCSrDmiCgHF0kwGvjw0Vn4N9tR1HdZNcF3CXJDZjISDyWkJKxZDwYwFlJbXRQpHuJFneehcXYoezzcVNDjigvlFqYKs89z4w21uugjNNBsR+7YM+KxhyuUcYNW74Qp5zxJv7V0ZzeqjNptkwc5jjCCQf1QhcqqBRg9a+FvEodki7/g/LoE5iOBUW+ZsK1yXRf0QW0H+LobJyO+BfsWmxa9+qIhz1t53jHKP7FUXx7ywGn6HslRp2D94RqPW/q7TewCK0hQv8irEjDTfFKhz/oWARjG1LnxpQSGm1lIvf/ZEMVF03RdmQuieR97VjbR9wghEVn0Cj2Yttkyj04352vBjbaOJlcz7iJSFgMLBD84/ZBo9n4y6WuSaHendAPr1PogM4Jllyf40OS31g3Qml6MNA2lJyP2qRoyqb+lqY7Z1b9cglQX5djXSA3yTMf2FdS2W73XtK2476k5GR14ZkH98G5D/VR1AJ7g9yNZ+ih6ge+BVBuJWQ7xgwiJYQA6CyvPJV2goIuq4uFNBwNktr3q8/KNtSO6WGLwTGKKrIKF0628pU5R+3VrBxtpC9v3zVQAN29G3T4iqx4UukN9zj+UHsOockr5ZoIDVX97fknxwpWplvfmjlYTLW555aV/8vXl9ftGvHAT6zkR0wYE1WC85cqyRVn8e8Detpf94xI=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2017 06:41:09.7971 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB0599
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.47
Subject: [Qemu-devel] [RFC PATCH 0/2] VFIO integration
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
Cc: wei@redhat.com, kevin.tian@intel.com,
	Bharat Bhushan <Bharat.Bhushan@nxp.com>, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aSNEB229C67m

This patch series allows PCI pass-through using
virtio-iommu.

This series is based on:
 - virtio-iommu specification written by Jean-Philippe Brucker
   [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,

 - virtio-iommu driver by Jean-Philippe Brucker
   [RFC PATCH linux] iommu: Add virtio-iommu driver

 - virtio-iommu device emulation by Eric Augur.
   [RFC v2 0/8] VIRTIO-IOMMU device 

PCI device pass-through and virtio-net-pci is tested
with these chages using dma-ops

This patch series does not implement RESV_MEM changes proposal by
Jean-Philippe "https://lists.gnu.org/archive/html/qemu-devel/2017-07/msg01796.html"

Bharat Bhushan (2):
  target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
  virtio-iommu: vfio integration with virtio-iommu

 hw/virtio/virtio-iommu.c         | 127 +++++++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |   6 ++
 target/arm/kvm.c                 |  21 +++++++
 3 files changed, 154 insertions(+)

-- 
1.9.3

