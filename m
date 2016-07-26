Received: by 10.25.21.156 with SMTP id 28csp1433552lfv;
        Mon, 25 Jul 2016 17:27:49 -0700 (PDT)
X-Received: by 10.55.153.70 with SMTP id b67mr26570465qke.190.1469492868641;
        Mon, 25 Jul 2016 17:27:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p22si19427899qki.36.2016.07.25.17.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 17:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRqDs-0007jU-2Q
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 20:27:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRqDn-0007jN-FB
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bRqDj-00006G-2P
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 20:27:42 -0400
Received: from mail-sn1nam02on0082.outbound.protection.outlook.com
	([104.47.36.82]:41551
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRqDi-00006B-RZ; Mon, 25 Jul 2016 20:27:39 -0400
Received: from SN1NAM02FT018.eop-nam02.prod.protection.outlook.com
	(10.152.72.51) by SN1NAM02HT096.eop-nam02.prod.protection.outlook.com
	(10.152.73.74) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Tue, 26 Jul 2016 00:13:05 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT018.mail.protection.outlook.com (10.152.72.122) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Tue, 26 Jul 2016 00:13:05 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:32942
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzc-0002Cn-I1; Mon, 25 Jul 2016 17:13:04 -0700
Received: from [127.0.0.1] (port=38229 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzc-0000n5-Ef; Mon, 25 Jul 2016 17:13:04 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6Q06Jld028695; Mon, 25 Jul 2016 17:06:20 -0700
Received: from [172.19.74.182] (port=59992 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bRpzb-0000n2-PJ; Mon, 25 Jul 2016 17:13:03 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 25 Jul 2016 17:12:35 -0700
Message-ID: <f8afbfa59d0a36ccad80863da8198b92f0beb5e0.1469491920.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469491920.git.alistair.francis@xilinx.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22472.005
X-TM-AS-Result: No--5.572-7.0-31-10
X-imss-scan-details: No--5.572-7.0-31-10
X-TMASE-MatchedRID: ZF1pLboQoELFvZkHJO4cD1VN8laWo90M6SXuwUgGH0hYYjdv4zyROx4u
	a24ul9odkKaVbA4S4D3c8+FPg1rJdhLmJd2F/yFu4pdq9sdj8LVYN1akkye0qFmc19Us2m2y/BL
	THkvHKMtLbMLc3nVqMuZG+4fcCFvZe4t+BIGa1PR05zsoB1UKTov8pidhVYOUmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1+y21Qho7kEn/s5lbYbm2BHLDX1KbEEztyxUCp0+nITLbP2vs+/AhQQ==
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(19580405001)(4326007)(105606002)(19580395003)(71366001)(77096005)(2906002)(2950100001)(87936001)(586003)(7846002)(85426001)(305945005)(11100500001)(36756003)(92566002)(7696003)(5003600100003)(356003)(50986999)(47776003)(76176999)(106466001)(50226002)(5003940100001)(64026002)(5001770100001)(81166006)(81156014)(8676002)(50466002)(189998001)(229853001)(48376002)(33646002)(118296001)(86362001)(8936002)(9786002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT096; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT018;
	1:1O0sz7pBd9ScMVyL22qyMASRnoKTQ8EXgPHKbE3vy1fbHbGXxjsxuv0zl97M+V1psPJ19r9VUMz8vuZrhc+qoVen5HGmqy2IiqV4Jd1RORbSg7fiCi5QySUNMS4uVWKLUSFQd8VIXfWOAefpxMQPYEA4zSWXTfUPXA1X0T+3GW2lXQjNrpaU52z12wLB+epCFRm7wdrhNrAu4SgPu3Do5yr4SbDGApmaU0XNqyvvq3CM65kshQgFNKVbqJTVCCn4IpWoUU6ZH0NhCeduTtMew+jiWlRUi6PmxOlXIonyyzonFPflnoWs0wrga3JRmjQ4ssit/eFknK6iBOmLYY6KJHPpZLp1gq57XXIlZiE+xKK3UONhNSpgKxB6e63IdqC5LgI3oErX2KbC1kPeGzSfkA1n5q/sVuKr17gm5S5NlfnHSSV8QBhr31DLn8twGY0nv7PmaWEGZKQ9s1DQH0zr2p4pgIrVR2b7zYHTHx9M7Noq1IDYgLzyI6thP+yCw75KteJCvaJ+3zBlh1Rzs2/CAiJK/kZxzvxUP17jU0EXjgD7GlsMOq95ZTP3r9ua+MvQ87fB/JXfVnjcwrkZXFucC43Fk+qCZN8GMJOu8GXt/Yw=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e847cc81-0d5a-4401-ee85-08d3b4e99d90
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT096;
	2:dlbSjNz/MkqrezrKlfdx+UO+3u7cAV+SX04eRnVb1KwmetLb0gjAYGPvsXri4D3luVfKdeYUS19s1HvWn9gymi/D6BG4WhVB8CUwga83XaQYMqz+5nI4FbuhRIGyh3IMqNWtFjXFoTL9PgXCLEUHy9RSXdzD2MiLFodVZZwTDaXxzcM2oEIooxgpbVKo+Kps;
	3:6ESGO3I43Yl5cTpZ6oIyjOc6ZCGADcJkF/7q/T6bXA2s1KjrzdrwFPuv3B6z810gdkyLTdXFWVrHGm6u3olhksWqokMwMv4nZGCT/kt5MJXIvL4KtY5QC3FCm8cLVCFSkvaBZ4atZ8uGdRaTPM9qaI+dEwmZAS+P/G0Y5Za38JzndPbcwxK82KM+2opDbnWoPq4CiLmjpiDrzyA6Hc9XrrRXCsuykiTmvtndupP5w7g=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT096;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT096;
	25:gLYcMQ9nvfATjhpryujcfKvFAcZDMfIQKvOxm7W/2A9AHwQVFms939JgiMjQSOX29Cuk6Pk2lSfaeUE7/X44rVb28CBMqtHfv01+OS1hOGVvqVF3OJF6vjzZa+Wxa+IqGWQ9aZFhREVMQP1dNftusCufB0LKJ5Ke5fcYE5MblNWiHtBB9IezF0M7p2Kd+65OCNLItigbHmcS9u7j6Ln0u6m4p0PBBhuqQKMZ5IniTYBwO1byftbj6y+nkQ8rFtdd+PVLkCbqq55AVlJ9xxeeO4F4/q8ODuJyg+awxUuNr+gQKjT8eg+EIre6QEhGKX3TmyiDcfke4y1k5yjRIUN7gM2/wXYdapHwEEpJrgTp6UWAAgtTLnCoMYtVI002RK0XFrJOQKWAa7PX5QRGAYvTGcw2Id6WIonA6qry0IaLlpojeV6kMdKx92Aots9nXhJEP5ck/rKPayTk9ZlIvEHrbuLHXv5zOLVJ+1OiWi1RKdq9BJ0Yd7wm7q4ynybxfRVKL0jYXVw0LmdjfxPQs1GrYikFfnsZBYu8LAMVQRFOMVCdDHpKr5b3cI/a66PC35uqOXySRY1/bLcX8VAcak8uOysrZO1Val4eGNwvslPEVK+6ffxXmSWSq+A9hjgbxoZu+qdUa5BAqSkS44Ursynt+JrTQdBbzlLqfFVmi6B0ZXz3sW/o1m4f3Jna+qvl8tE9+r5ZBoKOJ/vAkD+DoKtCRMUr2fj5vyA05XAq47N9sxPqv1r7/VnAU4M3ZU6UdSHCo4BeTuDtkNCAwPeV3QhcO1QD8Qh9qNOYStjzbLFtmXE=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT096;
	31:b/afijwO2Kbd53YDB4Dgi9OoznsZjJbPoN7G03rHIbpBZsqNu3/J0vjblIAwi0/GNCmQ3HFPnL43iFOgESrtvfn4VCYv0NUS0x38O+PKF65mi+Qr+7jCj6VfuHxL0zR7r7fZXsvtzmJ8Wm+uFlTwCGJ2sJDKlRLYkPfIxBozo4FvXQG7RTkPCxv8yjMiCLhiV6Y0yQu4gEoKAx/FW8BHSg==;
	20:CIUEFX0pbLsDDri3f/+FgzJCLXIqaX2Q+WWiTkF2ewp7O2u8WXYUEam+YhokN7wM00rQITkHHYzCeVXpdIklwp/dbOU/ge7BeCin773FG2rKtBiRhJLpGwmMoOhd5hyEGGBTVdBGmMQ9kWx5xPYZiPTZ0p01UjFLItFALnt4+9D8JiHvY3n1NsP97EuNvgY8DDi+NIEkeVXd7+D1+Iq7G8f6zGilnBCc+eK6/9U5s8x9mw9vdTYibD3iNehd4++0ZgrQFo2OzgStvuw20Z4L8beXWcwefeJJqaX1wIu9yeEFwrsrVFBwyBaVDisxCIiF46f29z+vJYZ68oIuUY4crnVyrSYiRZ6lev+96ic/gxPSxLA/tBp0tK2D7i4lYBDiIsBZwpJ406xR/kBA7FWu3MVWaqlhbThGUFhcSnNpfQViXpn03lodlUOPiyIe5NXXPRkwL/t3qDmuY0lRLy8y+SoaUyYZOqy6K4jYkwjBcrLuVKfNBzi+d/X4zGBskkx7
X-Microsoft-Antispam-PRVS: <e1d01f6e415b48738207d5a99c52924c@SN1NAM02HT096.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(13024025)(13018025)(13023025)(13017025)(13015025)(5005006)(3002001)(10201501046)(6055026);
	SRVR:SN1NAM02HT096; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT096; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT096;
	4:U0zNvXFib3S/isHQQdJ6UgvATtQV5QvifVOu9zGAQkjsbHcvPWr77j3c9X23OvaFwWMTWevXGS9BCxYiiytC/yleYh9KnynC30JwXnwUZphaenw5o8+5dwy7AcStJgsZAM58NzXV2VMVn/zZOqOm8gULXo+O2bMtYYC1L3aJBBs51HMS7FUgLGHB3tf3XCrH9sOs2yx0Hj3DQYlaXATAbIVODbKySo/pZDSfc9JPi3VabcL7BtpaSsrsn8ZKQTmEkv4tf6fc32W9KwpXhp6Z3fJ8vqClokjf93n26gmpWEKKVUJsj7bhTmNA6Xom1I+eOEHwBFY9tspV/BFBc9Mxf7fi1Xh1Sm2JUZth79PJOJ9A9z1TBwCzLtf8PO7Bu3pUpn5RE8mw1MNMaLJ6sJM6P3HDm+wCkBXNOGte0EiMBLLeiKvE0cPO4ifurXCennadF1CWfTIMax0vQahyh7gbEWjOWiD2Lg512I12hKQdhzK1vY15+DLPpqk/Ut11Bh2kNhm+R2lEMxWawj4j+EiMyg==
X-Forefront-PRVS: 00159D1518
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1NAM02HT096;
	23:nAbrLXB2zLEZRMcWyoynYTzvsSCPd5OTcqssQg5z8?=
	=?us-ascii?Q?3ZRK/qkL0545T/uN/MfApjL2+bA/3jhDM1cHRGcRo/1f9x2mO5m4vm0fQHBS?=
	=?us-ascii?Q?UhR3oLLdRKfyOvfsGS6FuSIPFhsZX/fluxBss/US3PX0gJggRF0vhuOCJ9kw?=
	=?us-ascii?Q?dUO2Hfi/0PzWtlsKdppn4uri7FLqVfQwjj7T/m2XsxBHiBN0yTOfzM+qZhuz?=
	=?us-ascii?Q?xra/JpkgrbQcACgB7tHD7qy/Jec3gJZnJWZZJVV5WInIqQgBiRfgakd3Vz/x?=
	=?us-ascii?Q?cpwGdo15H5rukV8wJqY/OfTrb4nlfeK8zJDfQzR5VFYFPjjna2wAgzHNXOEQ?=
	=?us-ascii?Q?gNepYa09SzvY1CeYQYKCw7l0bBbu9mmITZL1RSvKFtfxshfx6bCE2Wq+AZLO?=
	=?us-ascii?Q?B/mXHcCa/4pIVrDbGWwq3a+I96s2UhJwEbXgNJ5mThXP+YgHFAaaU4OqX/ie?=
	=?us-ascii?Q?o378t1qxYbJzNMTx2ltg/cJBT+6hHg0hQH8D0oWwaUVfQ7wLKeVdDG5DJpjh?=
	=?us-ascii?Q?A+T000MKh5uu8cSm/KgFogHflB3MPt7hO5E3zQhr0rSWUEo2E2i0MCLyZIUp?=
	=?us-ascii?Q?AfMkxwzJBVrXgyXcnH2Vshvk1lhjiVVFBUZYE5tvcE8D70og/VwUeQGD3122?=
	=?us-ascii?Q?F4ao6+U74gK3F1i/XxA9xAoxBvN7KCXvdPeIiLlFlIzbAfEx1y2fNyTh0nu5?=
	=?us-ascii?Q?vJYaLCB9eTF572SobFAUwyoBzIUtSs2hkCp9aL9/mom1UqQpR7lEY5IGzflW?=
	=?us-ascii?Q?d6Ai+Fud/Yky3v3RkpG14ou9xQbyrYUXafRNObj1W7ymlIQ/FrrgUsDTHl3z?=
	=?us-ascii?Q?n+DU+ICMTF+hfS08v4FLsVj/d3EIfRvxMeasFEGn0Xnt0NL2pxSUnhcib2VA?=
	=?us-ascii?Q?9DlOODbFxEUOnyFQpXRsTwvQpbEaK0H5J8+tuMu/nuXOs+cJjjR6gkHd99rJ?=
	=?us-ascii?Q?KCZdgcnnnpp6dV6E52U+eoPxrzbdISh9BWtVYdTAVKN9OhRFTguuxl7o8LDY?=
	=?us-ascii?Q?NmOd3bjjHSleQPSvk1OE+1Us3IHY/tMB0QfOiYkHej9tUyTJMFCdd4n9LKvU?=
	=?us-ascii?Q?oGceaOCxU/m4HnicsoS4XiliETa+jdzsJPNrg/pcajkg7sc5mFbOUiWPF6H1?=
	=?us-ascii?Q?uEHeH3ibk3Ms6cyE8a0vRPAY+WhGM8/4nLIEq8nOCv2cDwiHGxgstXUV60Kh?=
	=?us-ascii?Q?W1R1NGnH65jsm3oDGYbihuT/MvRmhR5qkL6?=
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT096;
	6:Om/y9PhgsJ426pe79SJp+OyECTllVMEFiF8mkaMCTwF79Z9lMb7w2TK6zjCohWQn7FpTh1sq50XxhgQLew9I2CmKI3JElphqRQUwGO5YMZmHopJeFu6pH4jtncXBfYxVGACMglX/cu3l5onNY6thZFmW/IKz0eNGF2l3wqjEptKhMlxMIN1BCgc7sc4FMnmbdgg4VVfOSzPORrkj4ghkRIcdmsaX/vT536G7YLNLCVXxGspZM6UUOg8+eQ53WgkiYOa80COczy0wflFoCjuuIfkbDHELu9iLeHsqxmKfd8ouo+RmNo0xFsa1khEDL9nAxI+Gk1yi5gGdoyFKMEu6Og==;
	5:EDbHb6bWnJAI42uP7FYXuo42ic+XrhJE23XZIbbq0jfBZNoKl/8CnpR2+a4B7mXO/UK/0Q+I0cYsgjipyko7pajhdGhWOaFBdbaLXeNUEjkRXRMNztmOrp+ftXSwE4em8x47RvWBMJfSrkXQ7sd8jg==;
	24:z8BBdnR7W4taIc0pnykOPHWrPpf8Dl77kNlgD9m4NsEob9sLbgdGzgYLggfTWC/vRVOGZz3G4Bz0uuzFvrKcZVZIVYGujn55NeMH+NZiaPw=;
	7:0odFXfDCO5OVzHp02Osa1AxN9lx+r3uNIjssXnqrpm+c3Q+USnM34czMP+xCOgplVIqt4vOlBlPlnxienX6ZCCF1QTHuNbt1tSGCwcmV5mzxhZNknIu028BfIL7wYufNaxWXKaFkfX7erBBCjagC5WkIjVljFdiwmCVcm4KQHym2jH521zXjlSbo7oLWZ+GmSALKRsshVqgi6ddBWnLwencYnfIHKjvebH892SY/YpOYSipfml8sMcBdSyGT1j8U
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2016 00:13:05.0928 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT096
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.82
Subject: [Qemu-arm] [PATCH v2 1/6] cadence_gem: QOMify Cadence GEM
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U1XH/YblILs7

The sysbus_init_irq() call will eventually depend on a property so it needs to
be in the realize function.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
V2:
 - Update commit message

 hw/net/cadence_gem.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index db1b301..7adc2a8 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1214,24 +1214,30 @@ static NetClientInfo net_gem_info = {
     .link_status_changed = gem_set_link,
 };
 
-static int gem_init(SysBusDevice *sbd)
+static void gem_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev = DEVICE(sbd);
     CadenceGEMState *s = CADENCE_GEM(dev);
 
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    qemu_macaddr_default_if_unset(&s->conf.macaddr);
+
+    s->nic = qemu_new_nic(&net_gem_info, &s->conf,
+                          object_get_typename(OBJECT(dev)), dev->id, s);
+}
+
+static void gem_init(Object *obj)
+{
+    CadenceGEMState *s = CADENCE_GEM(obj);
+    DeviceState *dev = DEVICE(obj);
+
     DB_PRINT("\n");
 
     gem_init_register_masks(s);
     memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
                           "enet", sizeof(s->regs));
-    sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->irq);
-    qemu_macaddr_default_if_unset(&s->conf.macaddr);
-
-    s->nic = qemu_new_nic(&net_gem_info, &s->conf,
-            object_get_typename(OBJECT(dev)), dev->id, s);
 
-    return 0;
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 }
 
 static const VMStateDescription vmstate_cadence_gem = {
@@ -1257,9 +1263,8 @@ static Property gem_properties[] = {
 static void gem_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
 
-    sdc->init = gem_init;
+    dc->realize = gem_realize;
     dc->props = gem_properties;
     dc->vmsd = &vmstate_cadence_gem;
     dc->reset = gem_reset;
@@ -1269,6 +1274,7 @@ static const TypeInfo gem_info = {
     .name  = TYPE_CADENCE_GEM,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size  = sizeof(CadenceGEMState),
+    .instance_init = gem_init,
     .class_init = gem_class_init,
 };
 
-- 
2.7.4

