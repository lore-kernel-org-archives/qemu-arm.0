Received: by 10.25.21.156 with SMTP id 28csp958695lfv;
        Thu, 28 Jul 2016 12:02:56 -0700 (PDT)
X-Received: by 10.55.155.22 with SMTP id d22mr46645425qke.103.1469732576777;
        Thu, 28 Jul 2016 12:02:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o43si8973664qta.89.2016.07.28.12.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 12:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSqa8-0003v3-6H
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 15:02:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYP-0002k7-Iu
	for qemu-devel@nongnu.org; Thu, 28 Jul 2016 15:01:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSqYM-0001wF-UI
	for qemu-devel@nongnu.org; Thu, 28 Jul 2016 15:01:08 -0400
Received: from mail-bl2nam02on0070.outbound.protection.outlook.com
	([104.47.38.70]:44096
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYF-0001t4-MD; Thu, 28 Jul 2016 15:00:59 -0400
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
	(10.152.76.59) by BL2NAM02HT165.eop-nam02.prod.protection.outlook.com
	(10.152.76.149) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Thu, 28 Jul 2016 19:00:57 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Thu, 28 Jul 2016 19:00:57 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:46891
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYC-0008JA-IG; Thu, 28 Jul 2016 12:00:56 -0700
Received: from [127.0.0.1] (port=52178 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYC-0007o5-Fn; Thu, 28 Jul 2016 12:00:56 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6SIsAC9008154; Thu, 28 Jul 2016 11:54:11 -0700
Received: from [172.19.74.182] (port=55028 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSqYB-0007o2-NN; Thu, 28 Jul 2016 12:00:55 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 28 Jul 2016 12:00:26 -0700
Message-ID: <73e69a8ad9fa2763e9f68f71eaf2469dd5744fcc.1469727764.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1469727764.git.alistair.francis@xilinx.com>
References: <cover.1469727764.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22478.005
X-TM-AS-Result: No--13.645-7.0-31-10
X-imss-scan-details: No--13.645-7.0-31-10
X-TMASE-MatchedRID: jVlrLlAunV73Zb7NlHCdGMnUT+eskUQP7h2RrsKOiu1cKZwALwMGs0Ge
	sM6GkoIPW9Qf37gKneG2hwqmyYJpCwyJM1t3sBlJlj0PT81HGiok9Lf/qe8xxzRCaZSKE/OsZnb
	bjcbalVQwfXkTrrUIE/h3DHRsQxlaEuYl3YX/IW5QiFNNqFvt1dvvjRlzNy/+aHYTYK/ridqmIl
	j92kc9fKr6e35LzInTA1HgyxDmh1hwV5bWNthnlOKXavbHY/C1SoCG4sefl8R2iqcE/RbrKIkuT
	XuMw1pd8tlGagkt1LXhgM7lrVqO2GTCzF7UO28x0Xw0ILvo/uUpWss5kPUFdLMDna8tQimpNZBt
	OMYbSa2XsNF5Bqt2x7nU2ozE5+XADHlMveoJOASQTsyupo9izYfsPVs/8Vw6tJvETkmCvxQ7xhQ
	NQMRsmU95K6QOISmn42Q73ENE9hUfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPBh8yCRkqTQ9j4DGV
	LceYZepnHjRNeqcWoo6a78jYF4EFYpyEJCU4h4
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(105606002)(64026002)(229853001)(4326007)(11100500001)(77096005)(36756003)(9786002)(2950100001)(92566002)(71366001)(8936002)(305945005)(81166006)(106466001)(7696003)(81156014)(7846002)(33646002)(5003940100001)(19580405001)(189998001)(118296001)(87936001)(47776003)(586003)(356003)(76176999)(19580395003)(8676002)(50986999)(50466002)(2906002)(85426001)(86362001)(50226002)(48376002)(5001770100001)(461764006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT165; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT016;
	1:b6XpvuV+9a8LIrLDoJf3XbdJjP2Lgs59iT3hkU/WkgJcFYV5B1e0H/K1BoKLf8KrmA8js/pJsDKSEX27sd9fh2qgjEds92Bt1FZ8NNG7hORoKWNIEBT9phgV8O8yYQELnOHZ76yxT2Lkg5+LneKriueZlDJjdrfVhW9MiAuyo7IGA9HOxNGUQqbiQ2NTzSBk2gOZp0UNM79GPlLY/RiH9VMJumyHSyMjMxyUtZItJMkUn9njcfH1bFHX3jEmKa0teLbCr1HBG/VcWVbDZzoZuYThjSCoCcrLmtCxK+chS2h7mifpQTgiZQFfQjiArV0CXKSjsHNwt5bOqfYafwKqqXRuctpFsJKobmtgOW43w1F6oFa+d12GlgTWpj8+JObk23pNOP/r7m6OsO/yB0OATZMii9yZbJB2rf8iXtEy0c5p3GNhiq4S/GN7JUU6JTgxktZquIWhCMBX/Ihp8hT42s17fwrLqmu1SXzPedsaVohrseGO2LPcqvj7YUENG70cd6zDdgVaAR4z2zXOIdL4ykOPTbh+LEB8Rg4La5woF5mNOxkCpg40l3a0/rJGbZ9XAcXr73zLowAdCtgw4UDkZRMxOKZtP2+OhjBta06EJ4o=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c910ff4b-eefd-4daa-0063-08d3b7198272
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT165;
	2:NNaJBygC3Gir1aXxYuC6Gq3tx0eCtEt2ltjViAnheXnvptG8Q6rmX7eUHLewvhtxncNqNsLXELjAmfiU1YWVyi+/QpFAdEkR29Y/XKLjKOC9967bxr+qaFzeFF6ECv9tDjKn58iLsSYZxhEWF4qZKlSCZMA3vYh9ns1Ta7OyjlCD3PQO++JHHQv0duUXbdOS;
	3:hsT232nErgXuSFbFQLvDzQ7tctcayOrcFcre4ECcr8o06BjWDN623VFok3EbcCOnwJhFU0RV2fGL9HsEpzFGieO12KXhF8Wm89qMCucNqQUX553UdzGKXe2NJ4gf2gohLdlcpgB6uAX49ySPnYExOW8THAOhISaWkqbgdhrQHgsgrJMQLv6x6aTqQ4Bq40+TAh2TbwQid3jrFk2WQz6HE1ppkS2vabV632DknjQKBUw=;
	25:WaG02S3lnQcChjfXsUgXZErP1fAoV92KKQGkSI+V+H1Bg+C1hI/wu0vuvDi49NAFcUEilgQyJrgZMFFPTeereBOguwgAQS0+QaDxPE6tS5pOy7pRDtLEfwjoZfakv9cBDl6WwJXTtfiuFgTrNzgKwWsCT7kA7lHNd5jS9TfkfaGreLcPNU9MGtApTU8OjLk+skCBnCaZZxefxWU3yT+sjwZp73r71Dw1iOBwCbSbaEed57YxGqyPv8KxB02XAAtQecZt+sK5nydcAsq2y+sH/a2RH0qlfmhrY44pdVt74aN8xVlEjb5cxl94eCvFcmKhosnRCKjrnWb2TrYeFfBI1W3/FSVgFUze36o45esZ6eVYXb0acN+wAQg6kjWf544QnHnTJRDcGOBGl+KC7fxZ+u9ua41avp9hkSgtvIqCMkQ=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2NAM02HT165;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT165;
	31:zo12VrUKvOpgsXtjmjhnm6JyON0LzvAhvNDdEi5v4sBIr2uPE+evII2+hsvsMI9r/6kxJCsBnbEN3REi9NSuv5caCTfScQz8USFDoDTuA2nASbY+P+klOP0BySUHamp4QjvGPh7kEbrFFxoFrfQmA0bFpXL7pf3cRFwwY/hIx8Hg7264ms5G6A9HE9PfplpfTWTlEI1TG2nv+e6MEYHxBYP+r2zLQuwbl1bvHWrzPWY=;
	20:QmmBGrBPfKbXvbsKpR9dBPFhDjzdlZk0JUSiseKwORC8hTcTVo5182S2U6WmSjSQefPC/ZTSBAOAA/nIMqXX1S9ChvAS100/AnM25LHsFSYw60I2Jegae0kD9xZrG2sygABvZA6M2bqv6mksrYUcXlLogAaFWpiFXxTiqpdDjlbeHUD9a3fpTrXYB3pRyFGZbvpppCPS1cJKxpokKwYGpa0lYU/yhk7MtnAdYpYKXl/cjG9oeBrFxOi8uVXg752IvRT9ZR0Ky3HYH60y8a33fqnD322dp08Ffp9rhWlQ4+gloL5GIGQAvpS8sxPN3x6yRgUuDU6RDXHVpEBnaFsOEFXJdaJV/ZI2q9gXI+vVFC8E5ER02lVpiHAPVpKdyRpQImIv24Vj3WcU7o5vdMOHdpZg5vGiOrEAqgFifYWBAxT1NlMGVbrYVSAKcJdOT3Is/rEJlm4MNq+k+oQN+d8AYVO0o91sWL7GS2gmexP1V2qeRxVo4RKyubFl13zm53Y8
X-Microsoft-Antispam-PRVS: <3fccbb86ac314941bb75263efcbd2efa@BL2NAM02HT165.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(8121501046)(13024025)(13023025)(13015025)(13017025)(13018025)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BL2NAM02HT165; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT165; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT165;
	4:ZDBd/mpODcu/AtM3gpugjGMnfp+PyZKHhpkFbz/6AdMVQE48prJzf6/jNOSOyNtvcmAfgis75J+WWJtGSoAxQM7I/TI6wqlY51bOubeP1GuILrR4ST5luIJNhSSZgqQvtXeE8+rYeUmeONwS6Orm/ywEOHZf5P2QMDFJ+xky44aPwl0l7a0vo12s3MSG0WwAxqLuTooLa5f+b5Tuf7JOFgE++ynC1gc49uPysSAbQr0EeuFsOM9AxVcE8pguO5Z09/ysvTBEjQF3+7gRt7CrhPXMcG4OFfKOi0pnU3NFcYITKnjAm/9PolXY+pvF+gjqJtoAWHVWYXVWgyB15VaTpOEPvRT0+nQm2ODOfPQQ74i5sXTzfhnAFXhbLbl/l2bIPD6JrVSAn5U10YhnD/8YzWh1RLxSSDMX4aHdg24MJ4WQoszEwGSmS7keed9nL1GeuU8eXflf6QXL4HeXMlLE+YmZk1iEobuOzSyu56fvqNRUvniEy/yj8hBbChNOMbEkhQ6tpQcmZyNPNIPYnafZfKrmRJqelk8Itx+cWGYH6ns=
X-Forefront-PRVS: 00179089FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2NAM02HT165;
	23:wboPpgbBjrOosCr7jkD89XgqDn4OoGEoeMlnmq7+v?=
	=?us-ascii?Q?elvWUF9e+lc595wDB7BT++38hzdV07xe6WAEmwvE/Z/4oaoszh6O52KPSN1N?=
	=?us-ascii?Q?4YMBrpBf/xjhH9ZQl62uzchQnqx/OFS+RmNaHZzciXc5iHELZmtAfApYf6bO?=
	=?us-ascii?Q?U8AGbhTS8XlIAOI6RjjZsfkY27fY4F2a3BrIc7fOEG3YiIk7bEaFJFNlc1U0?=
	=?us-ascii?Q?pz44JB+BYTYuT8+50JUnpT3zBHP+syNmLViAx43x/n4nGXIYklJACEkyaDKn?=
	=?us-ascii?Q?TnJnbd8YZDFiHvRB22E77sN5xaxg85txDFaQ2Djv4OmQ/RhB46ZGD+fMXJ+O?=
	=?us-ascii?Q?BetHdqVvzapov1Mel0bdtNcR7bB/SEfgZgNgL+hgODC8GxJHgf+a3Rb8h8iH?=
	=?us-ascii?Q?cVTIR/79CMMLV/yB8zgb6yUHqddWSoTcukG2Ae2OY4hiOVpN7Io9q41jkSfg?=
	=?us-ascii?Q?wszbBQarBfhbm2DLf9shi2M55vrl81DWZEAqupcPQRqdXY+OR60HkREHKhJG?=
	=?us-ascii?Q?Y4m5vhmZTgjivY8YSIavPfqq1P9oEjZUGWTKwB+UwPeo5a2B8o+tKxHRHUH9?=
	=?us-ascii?Q?emKpX5Ob2oY3IHwO2oIZgjYHscLSw6WHZo0SVPTI227AXwyaqyG6dMSkJ0KU?=
	=?us-ascii?Q?QpGrAtJyg25Mcrr/elNZWj7awXnUVcoYBowwCdclmVQiVSiWfz72g2Xep6E5?=
	=?us-ascii?Q?5/PwWbBxz1/MDsA20RwelbRU499lYSYm3AA4wuVWe/LQanhyFFPHGpx/AoDJ?=
	=?us-ascii?Q?wtROhd9oQLNK6eRlnAMekbDw8gmW5tjmQujSkJWEsJi5d42iMY+YVllbZ+Id?=
	=?us-ascii?Q?WSH+jTqdj/0zEnINoKkkNC6r5CGgBXnuKIFKFkrG28SW3aGCqmdUDPM3siG3?=
	=?us-ascii?Q?2l79QDUIovWr+IV10R33EqycEOfrvJ8bSHvQUgaDBtwIwiIPf0khM3bX18dW?=
	=?us-ascii?Q?DKIcCSZbhuxPY/ODsoIbDOdLjG2TgucVPvvCNE0YKWzWI/JwrOigYBkl5l7v?=
	=?us-ascii?Q?G6oJjbMZzNrmoxvskZg2DY/aObbseH9xdtyv9gRWFkBN88tBQH/4/2o9BKt8?=
	=?us-ascii?Q?SbPBr6r1umY1GPaX182+TlmpLqJJLPc7yJMUYJE0FHOCl8NlxN15r6fuSlbR?=
	=?us-ascii?Q?n8hCX8G9BHG8P4k3I/N9t3LC/IJxge+PyDHlw4wwdxnL62O2J7vAcRCB2/n0?=
	=?us-ascii?Q?bp769ZnibGCmsQylkKa8NEvxZJMWkQA9cmZ?=
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02HT165;
	6:fKshgmGr4XpWxLWnsb/erDYwCqkMgWbbeJpupA1pZi/dxiJ+m6J9ioswQXn6lUZxKeq27GeSFun6YdfB72B/1T6zxHVUjdVcDExi+5u70xjSAfXZWLxMj2XbRuSkPPh+DIosIoBdprZdhKVWjOOfI+2cs5qP10zxOdsktCA93Zt3f/r1isOcNJXMnBX9mMjojapN6OKOg69J+EBXXnPv35eh6tN140E9FwoWc2D63u4D9yNED/VMj6NyGErpOfOkQQSTPFJUP+cfCo84MjOmBZj4so5WyAmpBOZ1Uk1ioh2s7v52UO1xs0Bw3scAiAXYGrLY1iYWkf32Xaz0PiMwpQ==;
	5:exHGQejYQOnYv81LyD+DpKSfIZYtVE32VusOF35ifFiHZmALbZnrwQ+pbWuSt+iam73dcHdYVMyXU8vcuv9YXzbs7rIaFP0hlkVFovi85uzzyRgCjwPohv2Z8zjFiK/0m9NafOnOTdX39kkichdZfg==;
	24:fonQleuh7aTmX+uLWLVGcw+aVAApHEc2AQIK1KUfRE0Y2t4s9hREasovJfsTR8ZPe30mkz/2rVxYKDxoQtWGCUSjarRYx0Zm/RYUEirPu9A=;
	7:f9LUyNJrtEi9OyQNITERlXvceonK3uYs2w/Heypxpb6m4WRCrm7NmtO31daRZhZXyHte+KsPMz7CyL4GtElFHkQ6wSGQKrmTA1IQnOeYa1X1fSD/W+4lOylMc69ZmAwjuGipK0Y1IOSeu4Y5r/qho3ynDqhS9Jx26dIVyw1bKs65a0hMHYQKm6lIYYiiZ7LgAs7n4RVG1Jgr2Arr+g2+DY4QmbRJ4r9f1vqgXdMJ2paby8HVLDS9Q3g7Mhb2cTwC
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2016 19:00:57.6352 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT165
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.70
Subject: [Qemu-devel] [PATCH for-2.8 v4 3/6] cadence_gem: Add support for
 screening
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G+MlzXUKvJ4D

The Cadence GEM hardware allows incoming data to be 'screened' based on some
register values. Add support for these screens.

We also need to increase the max regs to avoid compilation failures. These new
registers are implemented in the next patch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
V3:
 - Add error checking
 - Fix up screening function
V2:
 - Initial commit

 hw/net/cadence_gem.c         | 171 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/net/cadence_gem.h |   6 +-
 2 files changed, 174 insertions(+), 3 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 08b3747..49a63a7 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -27,6 +27,7 @@
 
 #include "hw/net/cadence_gem.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "net/checksum.h"
 
 #ifdef CADENCE_GEM_ERR_DEBUG
@@ -142,6 +143,37 @@
 #define GEM_DESCONF6      (0x00000294/4)
 #define GEM_DESCONF7      (0x00000298/4)
 
+#define GEM_SCREENING_TYPE1_REGISTER_0  (0x00000500 / 4)
+
+#define GEM_ST1R_UDP_PORT_MATCH_ENABLE  (1 << 29)
+#define GEM_ST1R_DSTC_ENABLE            (1 << 28)
+#define GEM_ST1R_UDP_PORT_MATCH_SHIFT   (12)
+#define GEM_ST1R_UDP_PORT_MATCH_WIDTH   (27 - GEM_ST1R_UDP_PORT_MATCH_SHIFT + 1)
+#define GEM_ST1R_DSTC_MATCH_SHIFT       (4)
+#define GEM_ST1R_DSTC_MATCH_WIDTH       (11 - GEM_ST1R_DSTC_MATCH_SHIFT + 1)
+#define GEM_ST1R_QUEUE_SHIFT            (0)
+#define GEM_ST1R_QUEUE_WIDTH            (3 - GEM_ST1R_QUEUE_SHIFT + 1)
+
+#define GEM_SCREENING_TYPE2_REGISTER_0  (0x00000540 / 4)
+
+#define GEM_ST2R_COMPARE_A_ENABLE       (1 << 18)
+#define GEM_ST2R_COMPARE_A_SHIFT        (13)
+#define GEM_ST2R_COMPARE_WIDTH          (17 - GEM_ST2R_COMPARE_A_SHIFT + 1)
+#define GEM_ST2R_ETHERTYPE_ENABLE       (1 << 12)
+#define GEM_ST2R_ETHERTYPE_INDEX_SHIFT  (9)
+#define GEM_ST2R_ETHERTYPE_INDEX_WIDTH  (11 - GEM_ST2R_ETHERTYPE_INDEX_SHIFT \
+                                            + 1)
+#define GEM_ST2R_QUEUE_SHIFT            (0)
+#define GEM_ST2R_QUEUE_WIDTH            (3 - GEM_ST2R_QUEUE_SHIFT + 1)
+
+#define GEM_SCREENING_TYPE2_ETHERTYPE_REG_0     (0x000006e0 / 4)
+#define GEM_TYPE2_COMPARE_0_WORD_0              (0x00000700 / 4)
+
+#define GEM_T2CW1_COMPARE_OFFSET_SHIFT  (7)
+#define GEM_T2CW1_COMPARE_OFFSET_WIDTH  (8 - GEM_T2CW1_COMPARE_OFFSET_SHIFT + 1)
+#define GEM_T2CW1_OFFSET_VALUE_SHIFT    (0)
+#define GEM_T2CW1_OFFSET_VALUE_WIDTH    (6 - GEM_T2CW1_OFFSET_VALUE_SHIFT + 1)
+
 /*****************************************/
 #define GEM_NWCTRL_TXSTART     0x00000200 /* Transmit Enable */
 #define GEM_NWCTRL_TXENA       0x00000008 /* Transmit Enable */
@@ -602,6 +634,126 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
     return GEM_RX_REJECT;
 }
 
+/* Figure out which queue the received data should be sent to */
+static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
+                                 unsigned rxbufsize)
+{
+    uint32_t reg;
+    bool matched, mismatched;
+    int i, j;
+
+    for (i = 0; i < s->num_type1_screeners; i++) {
+        reg = s->regs[GEM_SCREENING_TYPE1_REGISTER_0 + i];
+        matched = false;
+        mismatched = false;
+
+        /* Screening is based on UDP Port */
+        if (reg & GEM_ST1R_UDP_PORT_MATCH_ENABLE) {
+            uint16_t udp_port = rxbuf_ptr[14 + 22] << 8 | rxbuf_ptr[14 + 23];
+            if (udp_port == extract32(reg, GEM_ST1R_UDP_PORT_MATCH_SHIFT,
+                                           GEM_ST1R_UDP_PORT_MATCH_WIDTH)) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        /* Screening is based on DS/TC */
+        if (reg & GEM_ST1R_DSTC_ENABLE) {
+            uint8_t dscp = rxbuf_ptr[14 + 1];
+            if (dscp == extract32(reg, GEM_ST1R_DSTC_MATCH_SHIFT,
+                                       GEM_ST1R_DSTC_MATCH_WIDTH)) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        if (matched && !mismatched) {
+            return extract32(reg, GEM_ST1R_QUEUE_SHIFT, GEM_ST1R_QUEUE_WIDTH);
+        }
+    }
+
+    for (i = 0; i < s->num_type2_screeners; i++) {
+        reg = s->regs[GEM_SCREENING_TYPE2_REGISTER_0 + i];
+        matched = false;
+        mismatched = false;
+
+        if (reg & GEM_ST2R_ETHERTYPE_ENABLE) {
+            uint16_t type = rxbuf_ptr[12] << 8 | rxbuf_ptr[13];
+            int et_idx = extract32(reg, GEM_ST2R_ETHERTYPE_INDEX_SHIFT,
+                                        GEM_ST2R_ETHERTYPE_INDEX_WIDTH);
+
+            if (et_idx > s->num_type2_screeners) {
+                qemu_log_mask(LOG_GUEST_ERROR, "Out of range ethertype "
+                              "register index: %d\n", et_idx);
+            }
+            if (type == s->regs[GEM_SCREENING_TYPE2_ETHERTYPE_REG_0 +
+                                et_idx]) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        /* Compare A, B, C */
+        for (j = 0; j < 3; j++) {
+            uint32_t cr0, cr1, mask;
+            uint16_t rx_cmp;
+            int offset;
+            int cr_idx = extract32(reg, GEM_ST2R_COMPARE_A_SHIFT + j * 6,
+                                        GEM_ST2R_COMPARE_WIDTH);
+
+            if (!(reg & (GEM_ST2R_COMPARE_A_ENABLE << (j * 6)))) {
+                continue;
+            }
+            if (cr_idx > s->num_type2_screeners) {
+                qemu_log_mask(LOG_GUEST_ERROR, "Out of range compare "
+                              "register index: %d\n", cr_idx);
+            }
+
+            cr0 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2];
+            cr1 = s->regs[GEM_TYPE2_COMPARE_0_WORD_0 + cr_idx * 2 + 1];
+            offset = extract32(cr1, GEM_T2CW1_OFFSET_VALUE_SHIFT,
+                                    GEM_T2CW1_OFFSET_VALUE_WIDTH);
+
+            switch (extract32(cr1, GEM_T2CW1_COMPARE_OFFSET_SHIFT,
+                                   GEM_T2CW1_COMPARE_OFFSET_WIDTH)) {
+            case 3: /* Skip UDP header */
+                qemu_log_mask(LOG_UNIMP, "TCP compare offsets"
+                              "unimplemented - assuming UDP\n");
+                offset += 8;
+                /* Fallthrough */
+            case 2: /* skip the IP header */
+                offset += 20;
+                /* Fallthrough */
+            case 1: /* Count from after the ethertype */
+                offset += 14;
+                break;
+            case 0:
+                /* Offset from start of frame */
+                break;
+            }
+
+            rx_cmp = rxbuf_ptr[offset] << 8 | rxbuf_ptr[offset];
+            mask = extract32(cr0, 0, 16);
+
+            if ((rx_cmp & mask) == (extract32(cr0, 16, 16) & mask)) {
+                matched = true;
+            } else {
+                mismatched = true;
+            }
+        }
+
+        if (matched && !mismatched) {
+            return extract32(reg, GEM_ST2R_QUEUE_SHIFT, GEM_ST2R_QUEUE_WIDTH);
+        }
+    }
+
+    /* We made it here, assume it's queue 0 */
+    return 0;
+}
+
 static void gem_get_rx_desc(CadenceGEMState *s)
 {
     DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
@@ -712,6 +864,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 
     DB_PRINT("config bufsize: %d packet size: %ld\n", rxbufsize, size);
 
+    /* Find which queue we are targetting */
+    q = get_queue_from_screen(s, rxbuf_ptr, rxbufsize);
+
     while (bytes_to_copy) {
         /* Do nothing if receive is not enabled. */
         if (!gem_can_receive(nc)) {
@@ -1228,6 +1383,14 @@ static void gem_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Invalid num-priority-queues value: %" PRIx8,
                    s->num_priority_queues);
         return;
+    } else if (s->num_type1_screeners > MAX_TYPE1_SCREENERS) {
+        error_setg(errp, "Invalid num-type1-screeners value: %" PRIx8,
+                   s->num_type1_screeners);
+        return;
+    } else if (s->num_type2_screeners > MAX_TYPE2_SCREENERS) {
+        error_setg(errp, "Invalid num-type2-screeners value: %" PRIx8,
+                   s->num_type2_screeners);
+        return;
     }
 
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
@@ -1254,8 +1417,8 @@ static void gem_init(Object *obj)
 
 static const VMStateDescription vmstate_cadence_gem = {
     .name = "cadence_gem",
-    .version_id = 3,
-    .minimum_version_id = 3,
+    .version_id = 4,
+    .minimum_version_id = 4,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
         VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
@@ -1273,6 +1436,10 @@ static Property gem_properties[] = {
     DEFINE_NIC_PROPERTIES(CadenceGEMState, conf),
     DEFINE_PROP_UINT8("num-priority-queues", CadenceGEMState,
                       num_priority_queues, 1),
+    DEFINE_PROP_UINT8("num-type1-screeners", CadenceGEMState,
+                      num_type1_screeners, 4),
+    DEFINE_PROP_UINT8("num-type2-screeners", CadenceGEMState,
+                      num_type2_screeners, 4),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 77e0582..c469ffe 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -30,9 +30,11 @@
 #include "net/net.h"
 #include "hw/sysbus.h"
 
-#define CADENCE_GEM_MAXREG        (0x00000640/4) /* Last valid GEM address */
+#define CADENCE_GEM_MAXREG        (0x00000800 / 4) /* Last valid GEM address */
 
 #define MAX_PRIORITY_QUEUES             8
+#define MAX_TYPE1_SCREENERS             16
+#define MAX_TYPE2_SCREENERS             16
 
 typedef struct CadenceGEMState {
     /*< private >*/
@@ -46,6 +48,8 @@ typedef struct CadenceGEMState {
 
     /* Static properties */
     uint8_t num_priority_queues;
+    uint8_t num_type1_screeners;
+    uint8_t num_type2_screeners;
 
     /* GEM registers backing store */
     uint32_t regs[CADENCE_GEM_MAXREG];
-- 
2.7.4

