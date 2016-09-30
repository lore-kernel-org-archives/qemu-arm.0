Received: by 10.80.163.71 with SMTP id 65csp474949edn;
        Fri, 30 Sep 2016 16:17:04 -0700 (PDT)
X-Received: by 10.55.108.6 with SMTP id h6mr9177763qkc.289.1475277424865;
        Fri, 30 Sep 2016 16:17:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x8si13739095qka.115.2016.09.30.16.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Sep 2016 16:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bq73A-0007E9-9q
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 19:17:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1bq736-00076x-JT
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 19:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1bq733-00059V-9O
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 19:17:00 -0400
Received: from mail-co1nam03on0056.outbound.protection.outlook.com
	([104.47.40.56]:63540
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1bq732-00058T-PS; Fri, 30 Sep 2016 19:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=cduZbgRU7IWS3tLDK5SCeoV8MZcP6GTSLSkBF9Ua4qU=;
	b=cPEIc3fiIhqlZgrLuPWTOtWW5CNRP9vEUqLXUqLDYN8UyyY1qwxVBl2tbvxg5H62rSvyZr4ireh7fHwARIXcRZ/AuTAUZK54IU9RD2rLzce3QzM+CNWIMJmbA0+G/RE2QA8acZ++ZPivS6D61d28sLqVNEqfE2N2wm4EdgwHXyk=
Received: from BLUPR0201CA0036.namprd02.prod.outlook.com (10.163.116.46) by
	DM2PR02MB271.namprd02.prod.outlook.com (10.141.55.150) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.639.5; Fri, 30 Sep 2016 21:42:43 +0000
Received: from BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by BLUPR0201CA0036.outlook.office365.com
	(2a01:111:e400:52e7::46) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.639.5 via
	Frontend Transport; Fri, 30 Sep 2016 21:42:37 +0000
Authentication-Results: spf=pass (sender IP is 62.221.5.235)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	62.221.5.235 as permitted sender) receiver=protection.outlook.com;
	client-ip=62.221.5.235; helo=xir-pvapsmtpgw01;
Received: from xir-pvapsmtpgw01 (62.221.5.235) by
	BL2NAM02FT027.mail.protection.outlook.com (10.152.77.160) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Fri, 30 Sep 2016 21:42:36 +0000
Received: from xir-smtp1 ([172.21.6.17] helo=xir-smtp1.xilinx.com)
	by xir-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1bq5Zk-0000j2-20; Fri, 30 Sep 2016 22:42:36 +0100
Received: from [127.0.0.1] (helo=xir-smtp-dlp2.xilinx.com)
	by xir-smtp1.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1bq5Zk-0000av-0l; Fri, 30 Sep 2016 22:42:36 +0100
Received: from xir-pvapsmtp01 (xir-smtp1.xilinx.com [172.21.6.17])
	by xir-smtp-dlp2.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u8ULgRB3023602; Fri, 30 Sep 2016 21:42:27 GMT
Received: from [172.21.103.25] (helo=XIR-PVEXCAS01.xlnx.xilinx.com)
	by xir-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgari@xilinx.com>)
	id 1bq5Zj-0000am-56; Fri, 30 Sep 2016 22:42:35 +0100
Received: from XIR-PVEXMBX01.xlnx.xilinx.com ([fe80::b50d:8846:1b82:a425]) by
	XIR-PVEXCAS01.xlnx.xilinx.com ([::1]) with mapi id 14.03.0248.002;
	Fri, 30 Sep 2016 22:42:34 +0100
From: Edgar Iglesias <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>, "Edgar E. Iglesias"
	<edgar.iglesias@gmail.com>
Thread-Topic: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix decoding of
	iss_sf in disas_ld_lit
Thread-Index: AQHSGwQsEAaI/APX5EaQsmUGPwJNHqCRx+CAgAAB34CAAHErAIAAViiF
Date: Fri, 30 Sep 2016 21:42:33 +0000
Message-ID: <ooog2kweegxy6dqxygrpngkt.1475271750691@email.android.com>
References: <1475230780-8669-1-git-send-email-edgar.iglesias@gmail.com>
	<4496a78f-e527-fae4-0bc5-a9f1c0d5c997@redhat.com>
	<20160930104909.GD9606@toto>,
	<CAFEAcA_6VUj5VDNTiRz1-hST=-AQD+tOneMy1-x7qYjt68YLFQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_6VUj5VDNTiRz1-hST=-AQD+tOneMy1-x7qYjt68YLFQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: multipart/alternative;
	boundary="_000_ooog2kweegxy6dqxygrpngkt1475271750691emailandroidcom_"
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22608.003
X-TM-AS-User-Approved-Sender: Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:62.221.5.235; IPV:NLI; CTRY:GB; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(24454002)(189002)(13464003)(5001770100001)(76176999)(54356999)(19625215002)(5660300001)(81166006)(8936002)(8676002)(86362001)(2950100002)(626004)(63266004)(95246002)(7846002)(356003)(5890100001)(189998001)(81156014)(92566002)(4326007)(106466001)(5250100002)(2906002)(106116001)(512954002)(16236675004)(50986999)(93886004)(63666004)(19580395003)(19580405001)(260700001)(586003)(84326002)(11100500001)(9686002)(102836003)(4546004)(2900100001)(87936001)(9886003)(33646002)(51650200001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB271; H:xir-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-62-221-5-235.ipspace.xilinx.com; A:1;
	MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT027;
	1:FLngNxMfi7JySSh/7QwyD44uAv1hLJWo++J1O9zC6kHCzjibKSeT+6SjUC9WEPu/R8mrkQdDF/ZY3xj2kdeT2bjJ/fIDGr4tJEOdbLHntdrW+HoJQa5DNbWKbN3lWYSD1zoHYE9VMRtcUCOMAADuqU0IgIJqJAn1vR2YIQGin/I3unNC3CNJMQSSY2ZlSLwg9iVYdWVpmtq0mGiEC4u4+Yw6prjBiVtBX/PCF1+hSol2Ikgdz+nVvpzdiGspLm/671sLWVtuml4GQrLQdOxu5OSaUhfhLXaE/eZFOVcUXT7itM6hHXEz71EnMJypUBSS/NuyeRbdUHKSrOkIgfn5BYEaMkgjCjTAu5VUUrH2PHYz2VVO/Rwp8FcQ/xqFtjn5Cp/LBYnZKfC44LNOORUg5UcIk+umaqPkIlYyzFJkoSWd0Gt5jzVVECOC5/I8pfDL4H/fp6NDrbHICRAmIxVcTTTaSmHmV49eRmjraVHvP57LWqWREcfA8DSWu2rzpDAQ3oeVb6ukIE5suZo70iGUHCCOwJ/KO437KIXq6+PoRN074uiei250peQR2BpDmvtkvl4hDIfKBqc7PnD5QhrzPHqpy8r7iKxNV4nxUsmhAwk=
X-MS-Office365-Filtering-Correlation-Id: 6e74b2b6-0532-48f4-fde1-08d3e97ab1fe
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB271;
	2:Fnt9FN7d8QBGMDGwGZ/JP+iGDa8uCNW9xxK1zAr40QlMIGSfRHVNRtlOVUGGIPv7tSGjWJGHkiY8kwb2IOHMnt+fO9UcPi3VCgFPNL8atiWaCjmipDgvF7ZWMYl2wpl4OpbnCtA5yq49hSTuoCVdzbMwxRDpmgfFnTG5mHNwiUPZhg3otcUoZB7dD9Y2efSG;
	3:SrFatp6v8nQVBtHPVJs6TmtplNn/sxMcrfxrfnD5kT1nWfSZRGrmD5JoNZEiBGA9+LCYEmJIj85nsBADL3gtw9yiKeItxRduqdBnBbJ2lIzwehlGz1tUE3Gtc6gvbTLBeBYkxS4nY/ITRZieGoN5J3zfTtmTcuOM8JGwRQP+PMbVeaptqlLIk0YFQuP6tpPOYsxbzd+er4v9+nuAiHIVHTAmILMps6tbIyY2LXebKPaok2sximFGEkk3aC8wVQpvXXAGdguyyi7DbGMg4pP+CA==;
	25:nagJ0Y7YYvjhtCJbUfT9eKujSm/Q88UQeoHSl48VIXrkwXsHuHRLQwcIW7SJyDhKRFukCLMEPGI3CURD0qVtCbb/k7TYnZ6Py8BYynZPkbqI6OKRNMPQnD27r1TmFMLSL26v9SKWmMvZtEgm4yC7HtyXQaKVeYd3xMFzmczVvYbsPEuxV4+BIxr9O2oMY2balu9ppbysDCnWTkKsho7Id2igwujnkILzcc+9mlVvgWULt0kI3nskbRGTu6nASr8i4x5FFp+M2vhweDaqq63zfZY6Ka6EnYCefJ+bKv6VNZ41zFzhQxBuYTLHbvIGkPMfqrbMqtoGSHrPe6gP5v6Y9TdvL9liBXIdACHXJNUBltaoZqfNcPSXEGI+iZZzIWLCyflS4ebInNxi03FV0tTMcYKZfovxUhFHtfHAqegMTI8=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:DM2PR02MB271; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB271;
	31:y0zRPjhmU7+b9o3Zk0sIGy9GuZKz3P1wJTpXhtSNt2Bu4rA/4vS3uBAii+qxYcpLz5n266Cn+u5YXkLojdApje750jtu0TAXDpqGgoTQk89slI/UL74WT1n7CWFpIc4Yr7Ufv7vx1E7MWRwMXlNM4ZzUXVC0gFEQhqUjyrRENuslEjiO8i/o3YH1vc1vPUzSIV0roiiIKtATvxDRDJdIfduXbVqnR4KZfnOzK5Y/zG0=;
	20:enn8KCLgUOJFp9IQi3ZHCz0//NAjDsNfrwZVJnCQda/xNvdsPF++eFbw20dK52X2eRi839VRfxKRqlqk5d1dckYRbpElT9x0hrn/ZxOHM9ogPK3QKc1j94c+qVv4M4e+pZELb7WLdlwxTNzjqI+klb5AWw2GBvLwIDoUC0oHM0CY7UvzwyZyOR4IOvONguF/3An7HG/AFiHfCeBXZTFn6t3lY0qg17SDJo7nLgrJyHUo8uNzdMQh05mLT0AdAhEBKE2ULM4ceyHIeJNZX4iO7Bfq/bxzplixteRww8AFpR3Qg/jp1f26KtQM7IWCIPeVi7Pb3GeNI/FaPiP44QXT+i1akWx/M1Kd/Dbl7eDNJp+hexncFYDgX08LKB+lWEGeUn0W2JVvHPhQQ8qEEo69SC+0u6qmnHWvOQNQTKDGCQKvvU3DyZ9Jgd+5uPnYwkDX/zsFBp0ZZ+0UwrZKsnjCW/0n4FG/IB48wP3KmfGCf5raV4fgbOW9SpZkC2loBSAU
X-Microsoft-Antispam-PRVS: <DM2PR02MB27186EA47A5E12CDDA77A1BE3C10@DM2PR02MB271.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(13015025)(13017025)(13023025)(13018025)(13024025)(3002001)(10201501046)(6055026);
	SRVR:DM2PR02MB271; BCL:0; PCL:0; RULEID:; SRVR:DM2PR02MB271; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB271;
	4:UfKB1wjWThVEDS4grnirRq6U3rcqTi8DXkPRhlhc1s4ZdflnHkqFlIsif7WwPJXsXixZo9QKl5yT8oqq/RmqeCBckb1xpEu7DM1TENKljl7IYaZLBTHpGeOLOA6/z9/QXHFkwC+2K3X73AG5ujCJE7e7V7UbJZInyIzgCoqVgEAWIsl9UunpI0fP+M9ZiwtFeEvARowdbmkY8lhyBlLLRjGKyc48+FQeviFMpNiWN1ANIgFzyryso+NcNS2i/Gwo7POo4YVT7QXOnO4tqqP6L0lp2yYdCRVm3aEtFl4PmSIw1ZHZgJz1Wvjhupw5L3yNpaPXNvzzWqsc2qesK0tbaHlKGsB9kOS9XCQt9AuTU5AcY9iqCdV+dtr/kTg6Pmqw9DUYgEETrA9J2h5bhptEXjwPFEH/SOXM4KbgPvg2ixNdDrJx5DIiIhxKgnaQgqNtaMxaLAnQ5TPIQI58p2WLxj8DM6mMi/umv3OgkhjcUnVG+FIgbHHcn3Yl3SmfSsmhhPUZiy3AIppNiHhT2KYqC4Xzme/0f/eO7dJGI/BX3dhZ8hsTc/vrA+XWfIDpRN0a5PW4KokMcXFWTxrgW5NrLg==
X-Forefront-PRVS: 008184426E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB271;
	23:Sl4uJ0aiocTN2DZTWb9TRfBd1ml4dQSPoX6Nq/JHUL?=
	=?us-ascii?Q?4Ke8p4cZLXPXALi23hmwei4dd1s3sgx5gcwRzzmHTOFCWjJW3eqLJ7dGh3nL?=
	=?us-ascii?Q?uXYvCBs6zEvo8o/UtAe8TuHRrI54PonUc0RzDVqddE3XUfId59qJQ6TPI+8y?=
	=?us-ascii?Q?xPaXdvkqO/cuK0GPgnhLn6963AVOV89lyKkdYT6+g/aRnW9LfIc78Rna+BWv?=
	=?us-ascii?Q?CVq0XbweuXl5iroULp/0gWSHX4jqSu2xoysOJYrU/RUF+lz0qVGHEZROhohO?=
	=?us-ascii?Q?M6mtvnNciCywAjcnV/fTJtWoOqIsEIzU+AHO8Q/aUP1rbiclgW7qnJbwab6D?=
	=?us-ascii?Q?yODEuwFYZs6L0JBj7u2KVjJA7QV+btlQziaaqi1SDSw/q16GtBGTZwkAo0/t?=
	=?us-ascii?Q?2yB+uPv8mh7/vClU9BdVFV8N7akkKrIAJ/fs3Ooogi2SPfFzMFlRh4vCTMty?=
	=?us-ascii?Q?eDPXnm69nfqztP2ywD3WhZwY8yUXWYT9PormmSDeBkcJVthgg6XyHKe8H7Gi?=
	=?us-ascii?Q?E/J+Gqf3RqsKznpYXNSR+VQaV13yq3VAU4CTSHw/QkAv/1F7ja3FQrrZHjIX?=
	=?us-ascii?Q?CQZqrqjM/GBGcOd6KY1VlzfPd7Lwfpu6a/lBhbeQBHzecymZL9/hbruACSvV?=
	=?us-ascii?Q?2pfxjyWFIj96DkPLVrtzxfjjygXYVOje31MSvehlrQuAdlPOfwO5wR6cbWRN?=
	=?us-ascii?Q?iIasCGsDHYXHo8BqXGbo3rekTSK1P13LQ0qhWIQ2Z45NM70IU4JK7jRG0oON?=
	=?us-ascii?Q?Re2Cx4zQX+PGmK9XIOJAF/1Ew2nT9Kz3TjUXZjF8bfRksWnVHBi25xmfgSKB?=
	=?us-ascii?Q?YQufBhnYvu3jJrKfrF42lA58yvkuHCu/6ZVPKBG04mulJZs/IoUi5vSApNVg?=
	=?us-ascii?Q?+SYBKHBi0V4JVewayV2MOoaHnKap3/evnf3d1OeyDnb0iobVLocdlEQqROsf?=
	=?us-ascii?Q?cm7TV5SU+RtkMEqASWOK0SI88JTlIzdVAIXtqoEsZFeR+mcd1t3xzrMHG5YU?=
	=?us-ascii?Q?/ROUfI4H69YXG/kkltM1RG/vChTgP9cikniqfEa9X9tnQIxS3EGqq/YkWAEQ?=
	=?us-ascii?Q?khFBejZNphNBfE8mcT4QYI96Q0SJRoD4ZwJUFaxBZ5QOl7ztkNk/7qc0vGrL?=
	=?us-ascii?Q?V9nBo6ZyoloxyHzasRa0X3f9W5tybvF/2DfwowGzGDMN5XFeAGsb+9Jdr4lP?=
	=?us-ascii?Q?2t4TkoxRiwzV2AXY43B2nAHynC0QxowWse/bP3LvOEpAfYWSz2KjuQGg+jAV?=
	=?us-ascii?Q?BuIXY7q49DiVFh1PgWRw0XFI57FMpWHpTn7/4k?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB271;
	6:7FUKeLVLj2e6mZxAxz2u3GdiP3kLii6HCtN0XumZuAWN2CsJq9+P6Vg7Y1qi8k2U9QHsMpd3qlsJHfpbl4/hn1sMTp+05ChM6MeRqSn/+jy7SBCNgkeMzAOfG+TP24xvL+sKiVr8+oh43ItQkjWyMbED2UNrkwPqo2QjZ9Lh88eufh5Sc70Ytr6Gz6w08VJvywQgnwqFrjoFNICb7nnM/QHEcwU4W+CQXMy8MGCn+KJLNQbsvDKOxqBqsEJ/gOaEJMuUh8CnFrjeBU6A0jHmCFYMoeLOc9nbMUWsQmRx5Hx87Z710Lph1JxvUi93NAIPVsKaGeGCCst6FUFACiSMEw==;
	5:HRHjfvh9IoDSGZZXE/IwdoRJxR14dVpr39TnhlpsdZQPK78iJyiDTWqE1n1m7jnQSZrI6e0hcoHjeQ7DyNMcyTDvLBlK8TBioPjndH33wKaQcNyL9ALXfU1yGWYoLVibp6ILJ46RZbKqXm+huN8oRw==;
	24:c9iNKHsyo2iNoTneF+tnTn4gPCmra4Ap5q3DQT0ixX/LSNIKj4GEWGHSn9ld7tmBw3qxyzigSxVU54iEGsPugoBfXiKA9aa2AmWxnWcGWq4=;
	7:BzwpIKKlab4y9cY7GG83gVUABQrSkotIosTQPrB0/O2kK3Qx9g88jCSyeKrCCr6zmPMrkyz0oDZbCO4VVcjOeRIrtoR030Oy8k09egbE/aP8cku+9469BI4hrxfIDy2iLWL/xsAtiYfCkv0j9znIVZzHQDgRUw0MDT1XncthqvwnrxmYj4NM3a0VWTSyJGCeenSGZdnVCl9IP1uS3/wG2eB4qTRCbOX0JEQRkTXsZGZcCImgcSo4zDFpVRGvAgruDV6J6QyMudC1j4nvTLLetgqTnlvRnbSzozeLAvJTJpeXrpssyTb0xcKvfujsydT5
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2016 21:42:36.7494 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[62.221.5.235];
	Helo=[xir-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB271
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.56
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix
 decoding of iss_sf in disas_ld_lit
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eu0p1ukazd4z

--_000_ooog2kweegxy6dqxygrpngkt1475271750691emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Peter, feel free to change the syntax to whatever you feel is best.

Cheers,

Edgar

---

Sent from my phone

-------- Original Message --------

Subject: Re: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fix decoding of i=
ss_sf in disas_ld_lit

From: Peter Maydell <peter.maydell@linaro.org>

Date: 30 Sep 2016, 19:34

To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>

On 30 September 2016 at 03:49, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Fri, Sep 30, 2016 at 12:42:27PM +0200, Thomas Huth wrote:
>> On 30.09.2016 12:19, Edgar E. Iglesias wrote:
>> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>> >
>> > Fix the decoding of iss_sf in disas_ld_lit.
>> > The SF (Sixty-Four) field in the ISS (Instruction Specific Syndrome)
>> > is a bit that specifies the width of the register that the
>> > instruction loads to.
>> >
>> > If cleared it specifies 32 bits.
>> > If set it specifies 64 bits.
>> >
>> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> > ---
>> >  target-arm/translate-a64.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
>> > index ddf52f5..eae25c3 100644
>> > --- a/target-arm/translate-a64.c
>> > +++ b/target-arm/translate-a64.c
>> > @@ -2025,7 +2025,7 @@ static void disas_ld_lit(DisasContext *s, uint32=
_t insn)
>> >          do_fp_ld(s, rt, tcg_addr, size);
>> >      } else {
>> >          /* Only unsigned 32bit loads target 32bit registers.  */
>> > -        bool iss_sf =3D opc =3D=3D 0 ? 32 : 64;
>> > +        bool iss_sf =3D opc =3D=3D 0 ? false : true;
>>
>> You could simplify that to:
>>
>>       bool iss_sf =3D !(opc =3D=3D 0);
>
> I don't really see how that is simpler/clearer.
>
> I considered:
> bool iss_sf =3D opc !=3D 0;
>
> but felt the expanded one was clearer in particular as a patch for review=
.

I would probably personally have written it without the ?:, but
I don't think it's significant enough to bother respinning.

thanks
-- PMM


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.


--_000_ooog2kweegxy6dqxygrpngkt1475271750691emailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<p dir=3D"ltr">Peter, feel free to change the syntax to whatever you feel i=
s best. </p>
<p dir=3D"ltr">Cheers, </p>
<p dir=3D"ltr">Edgar </p>
<p dir=3D"ltr">---</p>
<p dir=3D"ltr">Sent from my phone</p>
<p dir=3D"ltr">-------- Original Message --------</p>
<p dir=3D"ltr">Subject: Re: [Qemu-devel] [PATCH v1 1/1] target-arm: A64: Fi=
x decoding of iss_sf in disas_ld_lit</p>
<p dir=3D"ltr">From: Peter Maydell &lt;peter.maydell@linaro.org&gt;</p>
<p dir=3D"ltr">Date: 30 Sep 2016, 19:34</p>
<p dir=3D"ltr">To: &quot;Edgar E. Iglesias&quot; &lt;edgar.iglesias@gmail.c=
om&gt;</p>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On 30 September 2016 at 03:49, Edgar E. Iglesias<b=
r>
&lt;edgar.iglesias@gmail.com&gt; wrote:<br>
&gt; On Fri, Sep 30, 2016 at 12:42:27PM &#43;0200, Thomas Huth wrote:<br>
&gt;&gt; On 30.09.2016 12:19, Edgar E. Iglesias wrote:<br>
&gt;&gt; &gt; From: &quot;Edgar E. Iglesias&quot; &lt;edgar.iglesias@xilinx=
.com&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Fix the decoding of iss_sf in disas_ld_lit.<br>
&gt;&gt; &gt; The SF (Sixty-Four) field in the ISS (Instruction Specific Sy=
ndrome)<br>
&gt;&gt; &gt; is a bit that specifies the width of the register that the<br=
>
&gt;&gt; &gt; instruction loads to.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If cleared it specifies 32 bits.<br>
&gt;&gt; &gt; If set it specifies 64 bits.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Edgar E. Iglesias &lt;edgar.iglesias@xilinx.co=
m&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&nbsp; target-arm/translate-a64.c | 2 &#43;-<br>
&gt;&gt; &gt;&nbsp; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/target-arm/translate-a64.c b/target-arm/translat=
e-a64.c<br>
&gt;&gt; &gt; index ddf52f5..eae25c3 100644<br>
&gt;&gt; &gt; --- a/target-arm/translate-a64.c<br>
&gt;&gt; &gt; &#43;&#43;&#43; b/target-arm/translate-a64.c<br>
&gt;&gt; &gt; @@ -2025,7 &#43;2025,7 @@ static void disas_ld_lit(DisasConte=
xt *s, uint32_t insn)<br>
&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_fp_l=
d(s, rt, tcg_addr, size);<br>
&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Only=
 unsigned 32bit loads target 32bit registers.&nbsp; */<br>
&gt;&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool iss_sf =3D o=
pc =3D=3D 0 ? 32 : 64;<br>
&gt;&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool iss_sf =
=3D opc =3D=3D 0 ? false : true;<br>
&gt;&gt;<br>
&gt;&gt; You could simplify that to:<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool iss_sf =3D !(opc =3D=3D 0=
);<br>
&gt;<br>
&gt; I don't really see how that is simpler/clearer.<br>
&gt;<br>
&gt; I considered:<br>
&gt; bool iss_sf =3D opc !=3D 0;<br>
&gt;<br>
&gt; but felt the expanded one was clearer in particular as a patch for rev=
iew.<br>
<br>
I would probably personally have written it without the ?:, but<br>
I don't think it's significant enough to bother respinning.<br>
<br>
thanks<br>
-- PMM<br>
</div>
</span></font><br>
<br>
This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy,
 or forward this email message or any attachments. Delete this email messag=
e and any attachments immediately.
<br>
<br>
</body>
</html>

--_000_ooog2kweegxy6dqxygrpngkt1475271750691emailandroidcom_--
