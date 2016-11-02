Received: by 10.80.166.35 with SMTP id d32csp225193edc;
        Wed, 2 Nov 2016 09:47:15 -0700 (PDT)
X-Received: by 10.159.40.135 with SMTP id d7mr2652394uad.98.1478105235615;
        Wed, 02 Nov 2016 09:47:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g22si987973uaa.119.2016.11.02.09.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Nov 2016 09:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1yh0-000256-9O
	for alex.bennee@linaro.org; Wed, 02 Nov 2016 12:47:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c1ycn-0007QV-0p
	for qemu-devel@nongnu.org; Wed, 02 Nov 2016 12:42:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1c1yci-0003ni-UN
	for qemu-devel@nongnu.org; Wed, 02 Nov 2016 12:42:53 -0400
Received: from mail-sn1nam01on0050.outbound.protection.outlook.com
	([104.47.32.50]:60557
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>) id 1c1yci-0003nP-LM
	for qemu-devel@nongnu.org; Wed, 02 Nov 2016 12:42:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=UDMmRIv2zZBoMEoFp8HjQ5qdS49KTk93Mk+43Lvs2ao=;
	b=LJlStaJZNRixkp6uv3WlmoE+ohBZUAUmXGBbIdfcc0DJ/1N6tdG4JpO4loRftSF0RgZBN3alysjpVIBaDcm4db3n3c5+duJ0OiKQlak8KrFMEz0pQkNt4OkOmdEMXf/VKGXVEw/7tMQgXk7WO9dEASS2L3NdAQZssdWpgBOqRYE=
Received: from BLUPR02CA040.namprd02.prod.outlook.com (10.160.23.158) by
	SN1PR02MB2014.namprd02.prod.outlook.com (10.165.227.28) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.679.12; Wed, 2 Nov 2016 16:42:46 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::205) by BLUPR02CA040.outlook.office365.com
	(2a01:111:e400:8ad::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.693.12 via
	Frontend Transport; Wed, 2 Nov 2016 16:42:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Wed, 2 Nov 2016 16:42:44 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:35595
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1ycd-0007uY-47; Wed, 02 Nov 2016 09:42:43 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1ycd-00037U-0M; Wed, 02 Nov 2016 09:42:43 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uA2GgZ0r027264; Wed, 2 Nov 2016 09:42:35 -0700
Received: from [172.19.74.182] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1c1ycV-00035w-Ih; Wed, 02 Nov 2016 09:42:35 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Wed, 2 Nov 2016 09:41:08 -0700
Message-ID: <cover.1477599721.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22674.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(189002)(199003)(81166006)(50986999)(81156014)(92566002)(5003940100001)(77096005)(7846002)(36756003)(9786002)(2201001)(48376002)(586003)(33646002)(6666003)(5660300001)(50466002)(11100500001)(47776003)(5001770100001)(50226002)(356003)(626004)(19580395003)(36386004)(8676002)(87936001)(8936002)(189998001)(63266004)(305945005)(4326007)(2906002)(229853001)(106466001)(41533002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB2014; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT023;
	1:OVoTs9yV0tmAER8x95TjJQ41Jc1aMsRbJttrHNtS3d8W4OsBQ4cUQAXVn2MtqJ1q16BpBVRWRoxs34pfxPxYwQLSl7XZF2Db6hJ/U1HeEivK4iTZqYJO/zaL7nUF5IzAx4QsBaX7FhSbbxFFReI80TSUbRQQ2PxTT07YOP+9XA+L01uNiDpifItsVtDAso9opQU5lQDiZFFjoYflAm7EvZWcp9qokYzfkkz8rIM4nwDwDFZ+63/h6zvRyN6f1VLSZset4irIw3nMG8DNEqwWB8BUvyGW9AYR+nQDdQOlWUTMKOkHU7kuh07q38PHtADSU5i4z+LG4Tmxzgk797yeFL8MpQ/uOxvh/HrONr90ik/Nz9qngkoHUy8V7Bp7u1tYHcSoUc4LZLRLMcwGj7/xBj0WKLenpkcL3d4hRdU+CBYuLMF2MHGcQh/gE/KGh6wDfcv5yy37sEUuVx40SDevNPClp0UJt3SF0MENgMRK6mhTKQ7NhmE28mJ4xWFQfYX0i6nyK9bn4vaQc7CfZ2umW23drUZfuTImuwao5rhxsD99LnE/b05dxF138MN2KYC/HxeOHX0ugI+KrL94YQzY2pm9oxZ8kzv0KAmuIJRyfeU=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e44540ee-5eef-4a24-557b-08d4033f45f6
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2014;
	2:hrsGa5SdV+H6ZgzIUnET0LD3kRu5CHQqRtJhHSxiySFZEBjH5OrYiXm/k4LwCSnpfrqG/HWTbRpBUd246w9gwkt0hlrSOXeVicHHDY/phdg4914al2CmYz4UqNEPTU5AF4roPYf3pxm6rD72bbKl7Svi4QepzekvGa+C47ialZ1UXJPG7/s1J9uq2lAny9HNPb9UR9oKCPNLpkexoBn/pA==;
	3:jKH4NH79Qf1hOsnIB4i6Tjl1kZDsO72nvO2f6p7oXu5clG9JECbSx3XKBmwzjsL/6N/Avpgy3hm3GHPcsLnxsCXUmrHjXqPtqwErX+UztKU91q24VO6gIFa5nj5WhU4WavrHr0oeMvsUpa+ahCWwfDmQ7wp68NxL9pKk9iZ41JJgiYvNCvs+YSmEgmVYVkUV42vRcfsvwx+UD0cm/6aRlUu7+f1E9+JLpqp2SxV2ulLsK//x+3ggbvLciHz/oT2oVLi51B3frG67bF5DIHupCWe+2Es1aP6XGvSeHcc/gNI=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1PR02MB2014; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2014;
	25:AS+KKjWt3pjgpQe4irGla5g6PgGMoD+8orEHKicNDimVCf7J98jIyMGyWBxi4Bpy4jh2HmtEUUSKiCaRHprvM9rCz7QMSTUXY8aW+HdCfwgnff582kE5uxBjFAkjKZ2Dr4hTyrj8SwTusz8ex3fk9h0PC3EiuFz4BP5y66HOwPlkJr39zSo8K35RYMU4InxLgtw7+CP33gcJ85PHGhbT1gZAB55rhPaGTeLTKRCx6Y0sWF9mqOzgzS1giww8S3Ei8FelPJyxJHahWQSzY4kfsxaD1FFsrfYOhHvjxV59wb3pMqBGoYqy4dOXf0GgZRrg38Qx+zMjAiWrGKqo2BvoXplVFU0nRCiwIh/PwgoHb19Zs8r9yAlo0v2GLCWYX6Bhb6D+uynisxYTurCHWL9+YpPhBm3o80RwA5QzdgHBSPMU/0PyjobLutvuWz4wDN6N7bgLdNAIW1PmisCeku8yP4pjRu3JaEKvVlWbDTNp7PWaR/PoTNPQPw1vUjXMQaltV1wHeKdCDeJaxEu4Cv6VNkjIXyplvDtWTVfAPMn9icxjS7ZTEls/QfqUbUVqhQTqRgSFsY2wZhkNjQTtdqEBeBQQitFirkj0+OTDuXEcTiKAaIMs5XdTE/adSyxPOFuOrcyRtTEwXvdMk6lCXxSx9i5Hf7Pcy3ft+3ZdT7xmfEv8cafvcD1zSzx9vJM3ng0G/DRYyLjgZ3DuOVsAkaPYn0ZGflWuC2KYEDnp+KWghzZaEuaKtCbGcymkxY5OEEkbkKjUe+SsiEgVADBhrS4sAHpjz+R8ve1C3Y3Qd+8SUd5ZicyU6FgN2yRcXioRNJFm
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2014;
	31:cpVkZ8PiwYoRj9in61j0btLyoGUMrDibXc6TFi2bPQqdIqcSqs+oARoJGPp1XDAzxAdtW99B6Gzns+upkboLbePY7EUe9kTrYXwjaQu5VIsm2RnOYGJaPBWDWV8Do/72Izb+NxoUa8pFqFOCJQkj6qAG/VYOC+Jfh6nQGcyhPAVBekB/HrTHQGpGofZ6GX6VqAejx73mKmwxtsIf4RKzk8nlHHvYxlNfXK/WZsM23YkVB0ehC1sJ3INF3L+b/oj5;
	20:wc0l32HRxg3C4qx6V3GlISaIt/SR2TuFEElNHKXCKnGevVd5yrRhvXuoxfv9ollG7FiojVhewCpCgtbALA0y2UVlWvVZ41jsBUzVAMR5RjCVOpDbbtDVv1V29vVV4L+PWSV5Ste7cH+bWoFfWAcivvaO2YKqqUz/8vDcI+kbNa2NCNgZzm6zcj7XXhEsQ+t6l5niY5KdthKxIAGRWHcsPi8UXok9LgyYAUGEO/D7P2kOOVJ/u5eD98Jc8b4HLQrMGCAFZe9PSjxGlZhlCGN+PG0fRakPCEldMpKaEnpiE38RekSasAVOY8CFbg0sZZ8lnC2xG9HT6c2zFSkDMQw6LmwCLpjfIbj/bAOD//dpv8GzacfxGRywtMj/BywlgJs04zC7O0bOGUi5zpWTYXxrnsJZrhr5NvA4nPApmUt8t/7yEI5uySlZNdjnZESqZKWU1lXAyYvs2TzukFY35Y87syaHPR/ia4FuS0c6B/j2xdhiqOpgrklnaCrNm/uUQSci
X-Microsoft-Antispam-PRVS: <SN1PR02MB2014048D44EA5FE3E43C1F05DCA00@SN1PR02MB2014.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13017025)(13015025)(13018025)(13023025)(13024025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:SN1PR02MB2014; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB2014; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2014;
	4:3brrXaZDDOqK0DOk4WRbYMMKj8H9ReiRWve6QsqjMY1MaAavnSQbBlvIcdaiCmxgeyDboE0NPmvdRQMVDxhglNVwvW2UTddGEjzK4puIOCknC5xwIqlp5X3RmrvxxwQDc6ZBHjhlCDrcEApFw62PkLeZpUomhS3u9FWKqow94TD983CanN5bMDJOKeJrgUGN/vveYoKyFVz8hXn7bCnCTK8A+Few3Y/QcLWQE7knMwWvB21jjYvn5gWp153l2FSe51eIRMHWfH9fVCOhgxORbrJL3ZyWfI3rAWQIcMVZq4od+klWwG/cOocwWi9Qn/Xdsw6z3mM56eYbNdiFx9NreijKCxV+ghNKXYqInsxPe4+71P7suxSNMV6VpRdJQiyB9zjISjDrcrjyXf2Oz6pHeYdPs2ZFTXj7DM8jXLksebI1RA90eDEW/Sv0vFpLIDmUtJ224xGyRPW5vGFACPqDMUJjYhh9Se/ZBbVWR4x8Dt3czxA3r5DQ968FLkX8VOJUsf3mAP6n/20p4sWTAaPYeQfTnUoORZjW9lwRBwTlss8urUJzfNrUUNEqlfOLvKW/
X-Forefront-PRVS: 0114FF88F6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB2014;
	23:jyuw4UXBRPG/8O8nQV6svq/daRwWK+rcyEo5919Qo?=
	=?us-ascii?Q?3P5LfVBftJnmPPu56BZ8r9N6YJubQQL8zzrx2iHGPrYLwqgO2VCF8bU1OOq/?=
	=?us-ascii?Q?NPeagQZWdFDyQJXLrhDofSmTk4LM5ylanjv1cAEleKOQmibL3k3S0JamhGpo?=
	=?us-ascii?Q?cwQTXYvW74T5gIXEgjUaY6NKBo7mPfRxfXjejjp7+QfLIoW8dpxQaDtJlt10?=
	=?us-ascii?Q?D0gPiPFy764yHXytKTT7kMI4EEwOQrMizO5AeVLgdbSlbrubl2Aq0/iPuqHD?=
	=?us-ascii?Q?56/8l/Sr+9rjbkqLswWGQdKke6ZgmH+8Rprg7lWEEo6ozdh31Oat0nr4Vg+8?=
	=?us-ascii?Q?HGiwbn0L8v4LhVaKHks64ZvU5RMb1EVob6SIELxJneFObhaJ5oXu+fplmp6F?=
	=?us-ascii?Q?jTOuujfdta8I6Dtc0BWDlWnWcBKivd01iQ3XCj5q8bsjX422YdkozrHypxD+?=
	=?us-ascii?Q?d4fSKyGQM6r3CF/qMPLj+taeeHUrENiw13iCGceJd74VhQAi9HiHXNQF/iVS?=
	=?us-ascii?Q?2VQTEYqk9tiFIMnOElywZza+JT8swZhSCtO13KlRQykTGZauonmw6uiq5D3t?=
	=?us-ascii?Q?6ehRF5oCCEwe6QM/03Smpc+qGXgzpj0qwNGihuN5Jlo2hKve9UBPCucYlkkE?=
	=?us-ascii?Q?Qby0BBw3UaZIrCc0KGd6PwL8ab4ZX3kkb3LMU/VDVgCtDNIX8w1Q7l1TyTVS?=
	=?us-ascii?Q?q2pjaIYT3K/IVcNrQkEVcUybiVAuN7yBF5zsSLJzRBQ/h30Bpgcy4ECjRgp+?=
	=?us-ascii?Q?q59peAkx6Wr7+MAyEC19BkPTFvQFXIjs0kZU95xxPAKwOZHR81+CHw8IMCO8?=
	=?us-ascii?Q?p4r0xYk9I9GmHaEwqj7DssDHJrKoTJGuJf8OBT9KsnREE3KJBMjDoZjfgpZM?=
	=?us-ascii?Q?RROZGaYgnRwwX07aFLd4L2pMT4FMWM/hMDl0WNn4o1/cW5hAJ0Voe28KMImG?=
	=?us-ascii?Q?3MXs5he4XXtkK18uaIGQDklQ8AAXpYMdxH+0T2oHoNh0/ghmN50PC9OivKow?=
	=?us-ascii?Q?tpxkd1f4LhCvXeRiiCydFFSw0jkjAaBP3h0p/+MTlBPfruJNtK2JPjUoZSVf?=
	=?us-ascii?Q?O3L3Zk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2014;
	6:l7AtSeJpklqxVuRx9ou+OxybO7FKYtqR6iQTZPHTMVAUprK88hCUUDjTzbWfnEbkUh2q6oM15MpOPx50a/JLMPrJbUyYSpSQLnok59JVwGG6az6hhQSey9R8MzypgIFcXZvDOOsBwQjisTJ7etOZa+1R+9H0lUrcLYyD4BUglyijJKVB6pFxfN4DcIdh97iX+pu1bhFmggG+91Uh+azJQosemem0YLsrgFjYAm64WnCcjfGB0yXLNWVT1onmAoxnU0CXZ3A/eOvWYQkWo+fff4ZS2jGCkUoAOu8T55PZTGVfs7f2UDhqx1xWWdy/cC4y93H/jarhkqOj1oOJHipN+KuXc8iIkn6jcp5TiJVTJX0=;
	5:KS7Yiwc8uO+9Uvhqv3EBxL5R5fA64ZiKrZdOkHqMYKJt0PhEnlv91JiEIvORILj1aLdG/z96yE+8YGHaiVD/TycsphsH4G+yI3VxqAK7bE27J6hmclUALHU3K3TNTaEkf/emoP9zEKUZBxdC6KcQlw==;
	24:49q0ifm2e1wUOxdAgyNo2wMCsylHYqtJ2cEFo5UjLD8uwcJ15PfFhRtWkviseG3NC/jaXWARWrpXThC96aXb2cu6bXQoeY8H0eMLJgmxc50=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2014;
	7:BdUADzcYR02sbKNrbMSPIVNgD8YL+Zc1OHUOIb3YK/b44ybFhUvsPrxo3GnAzoMBf7LE+C9WCgaeF2xzlNTKymEARdJh0VtrBJpm6IN2hnEexON6UukBYpahazgAREF2pJcuwqIZRE/i+CsFkKuqpYM8trZ7Tg7LpTbe0eeRzgl1mQCv+s+39jV97le3ngxIblp1AiLJuau4cBpeNemOnX9ARcQZqfmFCJeEopM0x7+fjqyfYkitDO+Zid+9bEqAqfPehXQmTrxnVHSniQoZbqBTrKXE7TsZaTdwp1qAYYOvB9MRpFWbfLmVI0e6B5lD5TpBxlOQmTaP7NrovfNowgSTQ702+q++8TBVFJOTbeM=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2016 16:42:44.2207 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB2014
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.50
Subject: [Qemu-devel] [PATCH v1 0/2]  Add the generic ARM timer
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
Cc: alistair23@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZkSAV3rqgRuW

These two patches and and connect the Generic ARM Timer. This includes
support for dropping insecure writes.

Alistair Francis (2):
  arm_generic_timer: Add the ARM Generic Timer
  xlnx-zynqmp: Connect the ARM Generic Timer

 hw/arm/xlnx-zynqmp.c                 |  13 +++
 hw/timer/Makefile.objs               |   1 +
 hw/timer/arm_generic_timer.c         | 216 +++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h         |   2 +
 include/hw/timer/arm_generic_timer.h |  60 ++++++++++
 5 files changed, 292 insertions(+)
 create mode 100644 hw/timer/arm_generic_timer.c
 create mode 100644 include/hw/timer/arm_generic_timer.h

-- 
2.7.4

