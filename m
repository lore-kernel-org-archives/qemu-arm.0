Received: by 10.103.124.15 with SMTP id x15csp1786745vsc;
        Tue, 23 May 2017 04:28:48 -0700 (PDT)
X-Received: by 10.176.85.81 with SMTP id u17mr10906979uaa.148.1495538928599;
        Tue, 23 May 2017 04:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495538928; cv=none;
        d=google.com; s=arc-20160816;
        b=ClW3mCCA6K+OCpGvRkQxLO5ZRWC2oGkGpcLeT2FDePvVlgIe3u3iXFawvdWbgSm/su
         0pklX6T/lk8eE6/+XKN6q/Huy3c66ZRpeVVOFiC2rLEmV0fK7Lq9VPgD/o1jJGuj1xcy
         Iq6kx31fjoAUonJFTCLDmAfOCGFrjgsq2fVs2IhSooi2LUQpBwfH4cm6FlMz3qdpsl2a
         7H+YuaArSoIXIarDVOIle/2eLzC4VeNLRCdie5r3U6iYPz29NZxwb7twQh0HUgT5aDdM
         fh23VbRBFwaXgAcmPZR+o0UP6L4jx87IMbUaYsCTGeutIDGjv1aX+UPqtrEDQHlsCWy/
         wpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:spamdiagnosticmetadata
         :spamdiagnosticoutput:mime-version:references:in-reply-to:message-id
         :date:to:from:arc-authentication-results;
        bh=TmwdedaJ3MdUBnyVz+4Goq0jv58UgcWdX4hJjzQYoCI=;
        b=qlUdc00E0ci5L9tcjC9rQXERCEgoFYgLcpcSF2V7ciGT8foAFop4EsP8T04Sa4SXap
         eKRfYSMOrLYF2KXDJsJbclJuR67R4ftT5qmoG0m/LjDdjVR504kodZgo4tWEF6zjRDmG
         up05NSEY8NWWDapMT9+/fkq5vgfMuncse+OutsTf6rCzvZKQsFIKPAW52IIgGcg4pbIT
         UQ/hLfxPEkoVoxTTLOL4zLYT/1bHAqf/UMZbac6kjGFHgpeOR4m5BwJPHn0s7m6QWzM3
         4b8c7drgIDVYCKqqm4+qU0P/Adg3gK/HooyGC9xLItLzUmQgFI9qM1hPSUPHwMN09TbC
         zuPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j184si7022012vkd.21.2017.05.23.04.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 04:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:47810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dD7zc-0004IG-2J
	for alex.bennee@linaro.org; Tue, 23 May 2017 07:28:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dD7kT-0007DC-DJ
	for qemu-arm@nongnu.org; Tue, 23 May 2017 07:13:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dD7kO-0002c9-LJ
	for qemu-arm@nongnu.org; Tue, 23 May 2017 07:13:09 -0400
Received: from mail-sn1nam01on0040.outbound.protection.outlook.com
	([104.47.32.40]:47968
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dD7kO-0002Zh-Aw; Tue, 23 May 2017 07:13:04 -0400
Received: from DM5PR03CA0044.namprd03.prod.outlook.com (10.174.189.161) by
	BN1PR03MB172.namprd03.prod.outlook.com (10.255.200.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 11:13:02 +0000
Received: from BL2FFO11FD046.protection.gbl (2a01:111:f400:7c09::156) by
	DM5PR03CA0044.outlook.office365.com (2603:10b6:4:3b::33) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9 via Frontend Transport; Tue, 23 May 2017 11:13:01 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD046.mail.protection.outlook.com (10.173.161.208) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Tue, 23 May 2017 11:13:00 +0000
Received: from fsr-fed2364-102.ea.freescale.net
	(fsr-fed2364-102.ea.freescale.net [10.171.73.3])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id v4NBCnX8030520;
	Tue, 23 May 2017 04:12:57 -0700
From: Diana Craciun <diana.craciun@nxp.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 May 2017 14:12:44 +0300
Message-ID: <1495537965-4187-2-git-send-email-diana.craciun@nxp.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400115810238475;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(6029001)(336005)(39400400002)(39410400002)(39450400003)(39380400002)(39850400002)(39860400002)(39840400002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(85426001)(50226002)(4326008)(7416002)(38730400002)(76176999)(5660300001)(50466002)(48376002)(33646002)(6916009)(2906002)(50986999)(498600001)(2950100002)(106466001)(6666003)(86362001)(105606002)(110136004)(8936002)(2351001)(5003940100001)(104016004)(47776003)(77096006)(305945005)(54906002)(189998001)(53936002)(8656002)(36756003)(8676002)(356003)(81166006)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB172;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD046;
	1:z10ENdzKYNw3ufxU8DXUIMLs1vhRd9F3PvDF1xVBz9r4BxWGa88mTDy1aRqnEqwRTKSLVuJ18th/rx7n6QPoidnyrI6c3M4SLQZQQPO+0TQUYgMijvfegLbkoJc3Tc+muM2dkLygzVugZqg3xj5Zf4JF7hGRDGcz025AGoUAbABgRjlIihfPwQ44DwwVyqiJmnXMLTTa60+1aFkSWAiE2sbBDsKziQNMIS21r0n/4DDFcIvr6xdlmpB5OvkaJNCxtVi20f33AAkn4xd9OCUZnNkOwYXw73mTCbLaqfIkNB30yYzwCjEVTZgde0j8bKnKNXnP4pvBYlv1SZOS6bHCmdeGXmVf2biO5Ez3Xz/ziN1kDpCG6myXkb0jFAWz+FHT6QQW0A1cqIjSdeH60Pbjfjbfu7FcdTWc9nfOwaYfCflEEgwB/Nryb6eRsEiK0wYRplaU9A/wQeEyCQErLSyvWh7Jv0RTW4Hz2HwP7p0H/z9RjhaEvYdIDMBXGknFJtsXLxzm0l6WBVct5n41DWOAu/UE267BwYUCTFu0R7+uadlnvo5xQNj2j3OElpot2y0bQg7JM8d0OpuepTvinBYhrLGQPFhl2Uh8hRDENeKeR41zuMR/KIfQTYdAu+2nKH6/NcJLSHFrnnUs5pLh3m0POF6+XIbNXhh5NPonoskaij0oI79KHEpwnyH51ERkXsJkFvXZS3CXe9nioyunc+ZgyFfjCr4nqzF4I3PLsjj/gaw=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PR03MB172:
X-MS-Office365-Filtering-Correlation-Id: 22cdf93a-5b1c-4f65-1eae-08d4a1ccacc5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BN1PR03MB172; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB172;
	3:LOkDq3a3qfQk2lAG3OffyHTxk9gTg3AbN+ue567rpQgy9OtPGn2peXSL+85a8E/MDBCyc1dXabcF92YMpAsfPMSBJV8/tKBxvR4Tih7Tk4fxrLIGHWcJ2xgBpZNj+3SJ7XU0yrkVQILdQpw2HBrvlHOxIf5OVKlI/jVinTlAlGCVkN5+R06W0TmNClx5FFDmMbpQnrYQMguVkUNGB1/detW3SOrfYiDZVYHOlN494BC/Utrn2vwBeseSXWgiS7Z6cbphYPHDpipUQU9WUJGgyloIAHKJmEUa1HaqBBIaLmdq4Q7swTgW8wcyYucGSKvIIOChG6seLjGjVwUgzVXkBI7Hiv2BZjeIHxMZHeHVtW4S4rV4cc7PFk7BdzLW3vW22KzdAU/ILosVBm5LpUT3N/3oHS+IJMQY8WvYPZqQDvkvXc0bLx5S0g28rMg3HjAE;
	25:H5q4XfdeuLPxCh+xh/awuGZwUNNOYg7KjtxWXE+CpZopH2P/+yAqYcZ0zVWroYzVCK2mY+1X+UTWTGlbR4UnSZFNszRp60Ye8QzWWWTnsEhCpdbf8LH28xthRLk6zSFge7YpZg7PWJPaWKOP6XEnsoGoG1GFKBYWaauXXaHaiVCrBp8PPfIJC90pZb5TKYRpR4JlMFOQEDz7XfzWWa/wykbFOzPrWjb+sezjRREJLhEV7gYwhGaB6p6jSHBMFI/q36dsXBSfBTU9cN5YIYm8eM8qggnuAZRmrzQb+7BMcA0ExdGcBfiw1xoFElws9P+6ukuWVLU0do9d/fyPvEtxR07SjA/hXpUWJgv/Tl1Ib0/3xfRX0PaXjhEuWnwWjd0yXsWXQBkoDilp2np0jD54hKhRRzneWwAcLYfbQhg4tUv2tINMe9CGTkuCHX17qlIBgxXGjEU0a+vpO1akujCOFIwMF9FEJRP3npLYDfkTRfM=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB172;
	31:9oeVehIHAmUxSDLe8ZvsUTcz28ZdjIsf/2VKKeiqHDaVeS/CIJN+BreNOXL6tMtHIn3O71y+ntVvaJ/7IQrtNiLNqHGzkGN9O41Dg8yxtJmTSdtE2qBzR0//9rbhPRfK94EX0DEy+TbDOGz7ZExwZQ6ZsmvuTPICDR281/s5DHup6+HeaxITzRilhc9aeWLjZHBtj1kNV1HJmRTt+2wC5MLQl1MeGUpotkCPqxI+teLFtZD/VA2NUPE3cZEmEzAR/82+Pwv9HwyIyHc/hhEsuw==
X-Microsoft-Antispam-PRVS: <BN1PR03MB172896D936FBA565D6D1A12FFF90@BN1PR03MB172.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(8121501046)(13024025)(13015025)(13018025)(13023025)(13017025)(5005006)(10201501046)(93006095)(93001095)(3002001)(6055026)(6096035)(20161123565025)(20161123561025)(20161123559100)(20161123563025)(201703131430075)(201703131441075)(201703131448075)(201703131433075)(201703161259150)(20161123556025);
	SRVR:BN1PR03MB172; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN1PR03MB172; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB172;
	4:SJjZqF2IRcZbMJnxTRJPiPtTI8Ps/xrP8b9A94ISK+p?=
	=?us-ascii?Q?sQRbyeUB/hJdSO+YxfNqG6O0Tl2kdbw8nnJu35Sft87B4CRYRHsCxEsGKn1R?=
	=?us-ascii?Q?QZ/nNwcqb0yIRa9oqY95y5BG4R6S2mtX4Ee0zJ52mmQI6htp8a87qIz75qd3?=
	=?us-ascii?Q?AF9q4WNbOEyZYUtiQAP1KLMEA4YpqPjQt1949Sr8ufbuZOuIce+jQE1Irj6L?=
	=?us-ascii?Q?Z6lg7cuOzcn1PZAUSZHYHkvAcy9EzQ3+NKg5/x4/YZSche6rckm1+hXT583T?=
	=?us-ascii?Q?JaQ27E8T2ufwtk8FYF4bi9QlOVFNrw9ygyVNhEhVUKBnH+nnqoIdX7WIVODU?=
	=?us-ascii?Q?+cvey1wSPXqluOEzzNbeSdj4WeHji7SM9luf7Pcv7VattsvmV9kE7d8wvPgy?=
	=?us-ascii?Q?5cRVU8cKPD1qIiCrvVrIf16Bo1yULVs8Vqth4wwkFqbxlbVAfawGRRfx1jtG?=
	=?us-ascii?Q?LyFWnlLF+fz07tjEUBzcqmBjIYOd3AYxJwmnDOH6zRBQpoYzaM6sUUzgnNa9?=
	=?us-ascii?Q?Uk1ewOUAEimHytLdMsR/ozkheWYrb3z8TSC6QrdTtJSdfebGeLmSoGI0ulTt?=
	=?us-ascii?Q?g/Ijsa/nOnQrNddfaTX2au7mrNXmZiAszY7pWVYbffhInjdP0uOOOKd8rTXo?=
	=?us-ascii?Q?/ZAjni9f/WGiZx4E6gy9Qxf5t7a6trZBE6jFh7d0Xu2Kdru1eVrfuxY1NVhW?=
	=?us-ascii?Q?CyHvg00mgRbpGsW4E3IkRZRYVkULnxjumSsnlCXd/cUVPnq/KSVpi90minLJ?=
	=?us-ascii?Q?SYsxvXODjs/GgNfhdcvJgESu6ZswofNzSK86NhlZJe4bxBOu6eNCWLzaHaWU?=
	=?us-ascii?Q?sFh4A/0AmfYa8/zHEyvzfFtmKJMr7KnA5I0+lx9OS6MNyNERBN4OlsxJnSaK?=
	=?us-ascii?Q?iW7P2Scn94KTKkGqmfOHT76YvY72qlsyks6q+da9bFn1EdfSlDkQjGxA7rsQ?=
	=?us-ascii?Q?1jPit8u6vZJA7CrHt6XaBADFwB7QOxfthe+c87Q=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB172;
	23:s0Ads/pw53u7Pk1BF6pnqsmYu6mOiL1fq4TCHnNmaO?=
	=?us-ascii?Q?ogDjoYhnvAtbmWZkSdvJSey+XVQdiqIYGcvAsFjFbi+Z6VQqU9tVxXY8kAW2?=
	=?us-ascii?Q?bmHke+0Q8aAKeWL+Pi9H9V6T8YaKHlFoeTKIiBAG3D5f6+iDk1DVkcKK92Le?=
	=?us-ascii?Q?0tyW57mrNxQT2rxUp+HLvvdqbSY1Xf5c2gWHSCrcL4dKLhK3zMN1QKDNofva?=
	=?us-ascii?Q?sVz3yF5eUeu6gZpqJmHRyBwb3m5W/keuB7/4jWVarDvyYSqqUG8ElS9UG/hB?=
	=?us-ascii?Q?whXyRDyoVE5e7npSRrTM3AYWK2sgR4MIX3tkTJaazOL1yZ5GIpjZ37MNNPyH?=
	=?us-ascii?Q?Uuc7k/b5cG76zhwuRvF+aMaudnwabDIz86s7Fzvh741P11miNXN0v+pPJArm?=
	=?us-ascii?Q?oPgQk5IZpbcO2Ze88u5DyhaPzswxg1JmhmvmyVkx/PHW8DVoAl3xASCb0fxV?=
	=?us-ascii?Q?HhibhyKroz0ERr1MGJNpFXuoP4dfCpE/5IJpaAseObevr0hkCAT5tZbphsfC?=
	=?us-ascii?Q?ftMeIXMdvxD4Bdn4VuO2SMySIFp/7jDxHV++g0QWK2nTjsjClap5B3bcGlZq?=
	=?us-ascii?Q?dFOephlFsKmC6v0Ig5W/fLOsu685ISidPT35hS3Q/yYYe4ECf+haTUtI5uda?=
	=?us-ascii?Q?gvORpk2PfuDy4jfk6VMFANodNVmn9lErBfEc9KvEX1tWkqjY9PNptPSLIM/a?=
	=?us-ascii?Q?tA5f/usGC7P3kBoBgF3lr6GPFUCgrhbypIAOwfPCZyVvfKy3vBx1jsJKzxCK?=
	=?us-ascii?Q?vZ4CRJmKSPGS6wBRxHnf/XzSViMEreqzxJAVRGLFrEl7BQMrJN/+gw5SMaCD?=
	=?us-ascii?Q?DHQ3Mw9fQvtL13a0nXLEJn4kk3gNGzlhikR7S1orp0wD53JubXRH+xmB3s4i?=
	=?us-ascii?Q?rr296FfgQjUsPpVc7RmscFH0llF0LSsgHKW+IGnLe7G8MK+mEFDwMyik44eX?=
	=?us-ascii?Q?btDE3TQJk30WiN0wMVWZCqN+0ORMZ1g96NT0VWmGnzuKweyyoD1kdDdZ+cBb?=
	=?us-ascii?Q?TnhJJzE/Vo5M6C67VrHPJ+BpqF1RXHl+OCEKr5w6O01wifQmtfBLE8f7KVoz?=
	=?us-ascii?Q?4Kqc9CifYFYn5b3G9Tcsk4Dl7CBF6Xlj7QGX+huQuigB/q3YpJC++bmvHZap?=
	=?us-ascii?Q?3w/P3us02HHVHMmNtuklGGNakZFp8sGno3rgFnbosICpCKLJgasO25fpKgB5?=
	=?us-ascii?Q?gAdjUdK8kEcGecAItubsZquOnn33iVX757S7MLqK+CTOt+429Po7BiEXvSAp?=
	=?us-ascii?Q?bzcUzfOy4EBL0Xq5YA7hEEvmxeKR4UlngsdYcjbhOa1dmC0n0my+4Z9c+u8+?=
	=?us-ascii?Q?HnVZYZ9Y/RxoxOtyeR8AM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB172;
	6:BCQVSDbCjzIzKToDOug9Y2Hr4h0a/SOTNnnzeN/i3dbZil6iSrFq7JvTKkfWm6pUlpppj6sRV67cbIJKSak9u8fJoioZzibBLPrqqg4GzLFnuZQIpmjCyY5zUmHClfqYYrI7N1h5Qpy2QkCMZY8IDBCHbWDGxdfFbRMNTDqkLm8j86yLWLiiLGyXMlUAEgOUHXPjRJtNQwGokd16vEY6K4duAkfUnyd146ZgSdvEHkA9y/l/sRdy9wfZ80kfa2YctZzi4cal2OSe1fwYWhcqt2KZi1tseGw+uF2AwewE9219rt5O/5N0+OlLv46v9K634oIb8+M3n+SbjisYOU0NfgxbQnB1wFBt5GN2RmazA1D7sWHl8+MJ6qHFF2knIb2W9xOCrN4W5ma6HYCZLQXBNipC+lWUDm4TINGIxjLnjvNu6ipK+eayQeLxJePtANDsybB9FE2Y8N4BilO5AJYhQNnwpEL79UEXKzlZvyaG2xeIOoc7B9ZBWCyA1qVSG1IFR5pTK75jAENf2rkNR47/7Q==;
	5:2khPRLCjGdRVrGjsVMKEnqFMPDZoOqkswTk9nEwGNZ9wmyKjZKRh9tALKpGoSJK2ktRFb9ETq7i7vWMKBS7MGy3he4wYsOUee2Rg3PLRP4CIWfFKAbtEuWb6SsZrn1gyaJ2DmRZo4BBZcxrTkTG4KUGcLp/5AHSQQEHg2T6MPD2onZK1T0oO/v1VJlzss5Sr;
	24:83WuZrQe3lXY5+tr4yAknCL+S+q5yzG1fUDTXo8Itqg4lDLH/Q6hFUndqsxbNG0/76EskDkAuiaJwIlpdJ647DVkBrOkxlZUGNqyFaEa8Uw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB172;
	7:bOO51LM5GQPcbP3RaEY1vd1Em6IjxTF9E0hfqhkNRAlaXv/De7TPRvCXKJ89EJChhM0TnGEENunjxrzqQ90Vx8n6Ywaawr56ccIbQ0bSXC85dVUTOb+cGVPEyaFVFzto9t6F4W5CLdkndgNQVPRn3n2QP4K+fmhGYmItkZovqIDTdfpa+79p78Rq1j9iEs2jmIoOOY9QH/zumjNUnK5qu9ibvGSbLI4v8ZMFC9hAuquKL/l2HdvXGzYnLKuUA4lNcyvNKcJADAduuUAVzq7/DX3LJk5IYEtILRI0zjVYbG8Lh2VWZKm2Oyn+VnVXWa7GXEHfn4L2BarwzjCgGS14kA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 11:13:00.7898 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR03MB172
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.40
Subject: [Qemu-arm] [PATCH v2 1/2] Increased the size of requester_id field
 from MemTxAttrs
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
Cc: mst@redhat.com, Diana Craciun <diana.craciun@nxp.com>,
	eric.auger@redhat.com, mike.caraman@nxp.com, qemu-arm@nongnu.org,
	marcel@redhat.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, laurentiu.tudor@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Ts4jDpS0oJy

The PCI requester ID field is 16 bits. The requester_id field
from MemTxAttrs is used for MSIs to specify the device ID for
the platforms where this device ID is needed (e.g virt machine + GICv3
ITS). However, if more entities that uses MSIs in the system are used,
16 bit is no longer enough to represent the device ID. Increased the size
of this field to 24 bits in order to accomodate 256 entities.
Also the name requester_id does no longer reflect the content, so
the name was changed to stream_id.

Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
---
 hw/i386/amd_iommu.c                    | 2 +-
 hw/i386/intel_iommu.c                  | 2 +-
 hw/intc/arm_gicv3_its_common.c         | 2 +-
 hw/intc/arm_gicv3_its_kvm.c            | 2 +-
 hw/pci/msi.c                           | 2 +-
 include/exec/memattrs.h                | 4 ++--
 include/hw/intc/arm_gicv3_its_common.h | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index f86a40a..b61bdd5 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -145,7 +145,7 @@ static void amdvi_generate_msi_interrupt(AMDVIState *s)
 {
     MSIMessage msg = {};
     MemTxAttrs attrs = {
-        .requester_id = pci_requester_id(&s->pci.dev)
+        .stream_id = pci_requester_id(&s->pci.dev)
     };
 
     if (msi_enabled(&s->pci.dev)) {
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 02f047c..9cdcc62 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -2597,7 +2597,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, hwaddr addr,
 
     if (!attrs.unspecified) {
         /* We have explicit Source ID */
-        sid = attrs.requester_id;
+        sid = attrs.stream_id;
     }
 
     ret = vtd_interrupt_remap_msi(opaque, &from, &to, sid);
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 9d67c5c..efdb1b3 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -66,7 +66,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
     if (offset == 0x0040 && ((size == 2) || (size == 4))) {
         GICv3ITSState *s = ARM_GICV3_ITS_COMMON(opaque);
         GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
-        int ret = c->send_msi(s, le64_to_cpu(value), attrs.requester_id);
+        int ret = c->send_msi(s, le64_to_cpu(value), attrs.stream_id);
 
         if (ret <= 0) {
             qemu_log_mask(LOG_GUEST_ERROR,
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index bd4f3aa..9006907 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -29,7 +29,7 @@
 #define TYPE_KVM_ARM_ITS "arm-its-kvm"
 #define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
 
-static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
+static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint32_t devid)
 {
     struct kvm_msi msi;
 
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index a87b227..7925851 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
     MemTxAttrs attrs = {};
 
-    attrs.requester_id = pci_requester_id(dev);
+    attrs.stream_id = pci_requester_id(dev);
     address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
                          attrs, NULL);
 }
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index e601061..b13e1b8 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -35,8 +35,8 @@ typedef struct MemTxAttrs {
     unsigned int secure:1;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
-    /* Requester ID (for MSI for example) */
-    unsigned int requester_id:16;
+    /* Stream ID (for MSI for example) */
+    unsigned int stream_id:24;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
index 1ba1894..6140fc6 100644
--- a/include/hw/intc/arm_gicv3_its_common.h
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -68,7 +68,7 @@ struct GICv3ITSCommonClass {
     SysBusDeviceClass parent_class;
     /*< public >*/
 
-    int (*send_msi)(GICv3ITSState *s, uint32_t data, uint16_t devid);
+    int (*send_msi)(GICv3ITSState *s, uint32_t data, uint32_t devid);
     void (*pre_save)(GICv3ITSState *s);
     void (*post_load)(GICv3ITSState *s);
 };
-- 
2.5.5

