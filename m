Received: by 10.25.85.209 with SMTP id j200csp1094713lfb;
        Mon, 13 Jun 2016 02:10:28 -0700 (PDT)
X-Received: by 10.55.105.130 with SMTP id e124mr13041440qkc.16.1465809028263;
        Mon, 13 Jun 2016 02:10:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f63si1496707qhd.29.2016.06.13.02.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCNt5-0004Xd-Km
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:10:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCNsS-0003yB-V1
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCNsM-0003K7-Op
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:09:47 -0400
Received: from mail-by2on0072.outbound.protection.outlook.com
	([207.46.100.72]:20712
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>)
	id 1bCNsM-0003Jt-69; Mon, 13 Jun 2016 05:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ywRPhP9RqmDFF8fHEjutyE8N6/grHaJPeCPwxqc0RlQ=;
	b=OxvJg0zG7sN+DE21ztbHi8Z+TQfUQEoWo3B9peAVKiRUSJ/n1axt07/mISNUlww2VoQteaDNhj6cJ23vHNZSbmDG++x6v1HKPsNbwo0m+l6b0kpAxoMyDpMmRE4HloOUQBjD/BfeJeQagRfObCKRsOCq48mSyJ/wEOffCZrHSIA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Vijaya.Kumar@cavium.com; 
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.511.8; Mon, 13 Jun 2016 09:09:37 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>, 
	<quintela@redhat.com>
Date: Mon, 13 Jun 2016 14:38:33 +0530
Message-ID: <1465808915-4887-3-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: MAXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (10.164.147.22) To
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27)
X-MS-Office365-Filtering-Correlation-Id: 2578cf8b-d7d9-410c-4954-08d3936a7379
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	2:+XayJ4R9WUCRr1Zq7RofuBscM5kMDUskzyVUwTND+siO3HnZf3huq7eGI39rfzsQlsvWPtFeIqIc2FTY+7CnHMe5obUbfgUUdmdxRgYVQOShYCv1pz8yddWYmINTjAV7p7M3UVzfvXOt5Zw1qZiKNBxHTQ7p9JoQM6OcwS7bOJW0Vk65PyDJnt/ll0QdKxfS;
	3:BQq/+yui24+0TbTlnbAUjKWr/YDTm0H2AwGdqrJUpuvLgHbPY6uAGpmwdTOs1QmqH81VwD/Hysohs/Fe9go8NkwdrR5ZQG1pAKJxTejuRwGKanNdNr1rLKMBbiXuJAYj
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0701MB1689;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	25:+Q9oH2/adBroKnyY1Q6twmYHuRfYXjfEatkD0odsnyGr7MP5dZpYhwYcgUwErxqBRtLy0Nyx8Z9bxCmIPjPcteJqBWbNH2yT9rR3WzGM1ABsVHdA7pr32niDuiA+2UzMUc22ZaFCMGl5YA8wIy0OeZlAW2DFYKcRUX3lW8TTd2xl0B6nZEedtyiEJvQ58BWxfzJwsJuuc1zrzpg6mjsoWTS/5JXQXifCk4N0GM8mpFyl8BftlQokmZCXK5ynjrNlKusDsCiHbTiOFTGCbFghuNIpyhodDTOfCBkacAWJzGEL1qW7jSTzuR7X6mYwdCBRzxhTgbhKkJgOV04cDYok0r06HPLL686V8Sqpf22cX+hiklbUJo7JC2xHwY8Aoy6zmMlkhNmwWF+c48s7m7umMCSbmVNbw6fQmoQA7r5zAf6FR4qJzvVfTH73mphzHzgUPUzBPlw1MaYsZ/2LFNZOxJY4spNWPwMBsdPTizoxX3ML60Fb3AgUM9MZl+b44/C9lLXJhbYuB46ujT3hY0Uy6l37i0dXycIkm452P5dGgGjd0JJDJ6YZEyDADg7EHTXCpzBm7AjAtLceD1JO4C4oXetOz5ltFHIhbTe4pp+s3dhWDMcBVyKvr089MtKtCJja0Bg5Q9+QoQy2kLxlypO7fgoo+Hdcu8IUPHObFfwmKcpVqrX6Eh/5aEpaeuuvirz7FKKzXy8p8r3PZfIPNXsI454eDkpuDIYJgGH0J6+936o=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	20:mYJyzDM1vdJoEEZpRpgSpEIiXvrA3OCBIS3ZWUJ65TnCAD7eVY3CqG6XP9rEMcMsN2tqGv14oW9eQu0nb1iOrWdtAHZmYnRB9EYwiKyFIf8IFvOU22dsdFephkWvWT5w9TVQt3Ltwg9tA25NbjzzDE4Pz0S8WG2XEk2QXjuB7lMbZV/Z+klJkFtcgJs+rRMN6Aka4hbdOdk9tHFG8f3WtSgN3VWQCSmp/sEatQvxjDsn4lODK8TeWQq4xG96TjIfG0Bj5l1oW13DiKRzmfq9jva9WXm2GJYQtpJC0ac4cr7hvcBvBsUGwqkAzDQXhDANV45G24fgTPzRSO4BPKwkkpsfm4x0wPIz9Ao0MNS7wb+M7B1CnAfXDUBnZIiaA8O2TnukJaWASmtLbm0/wE8BVafJtt1CIAEu96L8fObtP4lV5WA2REWs0X7JKg16BHAAOJM4JrLRty0p3cg4sLIb0+e29UyTQNfy9fcT++pX/Gx46zttqfVc6ZjHO1qus5QrgrQSOqAJEuDKK1H8FDjh+qtoWh+yhJGzp2agGi9cX3DXMH92bBEUNP2G+FjahKlGQvluzbDvKN4lzK1c8v1uLvTvp1fSbeOv/OqOnR5ot9E=
X-Microsoft-Antispam-PRVS: <BY1PR0701MB1689C1E39FD46D95EE5F457EF2530@BY1PR0701MB1689.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BY1PR0701MB1689; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0701MB1689; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	4:bOeZPONRSnXJPjYgGy6rnNu3rAVbSbinjIT9GGKXL1kBztK5DpsKNDWFhVWQ6N3HX/egF4WmI9vX+haPXRZn+H/3Q2Elx6DDCVR7j3QiubWJG0kwlkGd3fo41fKiVMu0tLGDKlW+KHxEt+lfC7ZH8NcUQ6CPTx3aAZkL8r5RgGOPMsIn7huaKF5/hp1tOrqoL1FrtMFvD6APk+VWueT2jC26hB6yHYooh08KQvSo0h0JdSsMf/itTlJFKUZXu92cTtjBc2UFSTicslA1ry10kVtjIazLALE6HDS+epyZ1ISoVtrFw92D4OUmHNlmprx+l5CmZ8BtI65NhR9NqdNZePwVkKMEsLtBth7DwS1Vp3iQm+9rYCxuW/xOPGxJ8s1S
X-Forefront-PRVS: 0972DEC1D9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(47776003)(66066001)(5008740100001)(33646002)(8676002)(4326007)(48376002)(81166006)(50466002)(106356001)(107886002)(81156014)(105586002)(5003940100001)(229853001)(5001770100001)(97736004)(189998001)(2950100001)(2906002)(101416001)(36756003)(5004730100002)(50986999)(50226002)(42186005)(68736007)(2876002)(53416004)(586003)(86152002)(6116002)(3846002)(69596002)(77096005)(5009440100003)(4001430100002)(19580405001)(2201001)(76176999)(19580395003)(92566002)(7099028)(2101003)(217873001)(4720700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1689;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0701MB1689;
	23:iH26KcPAK29I/Qlfxp3gD0i+fVAXqyGt186QX2D?=
	=?us-ascii?Q?OHrUPJtK4+iBKhtWYXlgV33nvrdV2Xr4q29BzAZqf8tFRb/VrEXMgG/zg4P1?=
	=?us-ascii?Q?1C7YhJGbXEv7Db+MPLMPYUgKV0OXh+kmSdvzf8N4wxs3WymI5cZSbTf2lI/N?=
	=?us-ascii?Q?tdRkuPo0JjyeIdydmkvlDyvFWMJZnbw3kLO4dIm28fgYUtrBI4nWzeWSHfye?=
	=?us-ascii?Q?wdTtJPsTbbNrwvHYLBvHaJEk1ylcJFRFKVvL7Q6wNjnHsdWK2LsDsN75ThE9?=
	=?us-ascii?Q?qGJMs7cRwDRfQpylqjHCjmXl9TvwALuVVDACNiqxy28WRdRInqW+0GHfJaFN?=
	=?us-ascii?Q?u3JVEkE23L2K56VOM+SpdGjOwRNzuIlukDKxGPsNaXHMxjWYsnpDqaln4R9q?=
	=?us-ascii?Q?cZ3v2zlaoEMZ3/H9TBRQ4wM2T20KCtLhPaRMQPq6bZFrkmlCtDIr+b4t4zq4?=
	=?us-ascii?Q?I+bQZkV2iUyEPgzTZadZf5iZkjhvNLq/FZWEnQVYXCCbf8xvLVG7EtgQyws/?=
	=?us-ascii?Q?RohdhcR64ch1Cc1HWrNMBD5OwHFIKMxZnqLnUDF6qJiDOTRFrxBDxmesS80G?=
	=?us-ascii?Q?lSmbk41fbGUy0bJjPQ+jrun3DcfIULoq4bWzQzAjzkRbV+RO3c7PDWnNyCjg?=
	=?us-ascii?Q?1yBF8cMsCEUkC4pa9jlimMfYYspcKfxkgnaHmQFgb5SeLYZHymG2F4k+l6lV?=
	=?us-ascii?Q?iw1LIlEcUfX+x5MvLouTFYis78OhGZJ4n4UbhSkzff1pwx0Odp5e3K62esif?=
	=?us-ascii?Q?6fw0KBIXbaE4iAU9t7Z8jZvykAhEHis+00B28sKmkTUOSSS6bltLdEK+X4bC?=
	=?us-ascii?Q?En5GEby/1CXCSaNIVq9EElQ0lzNJnDbqsaaIAMgGjabB60YQ76Xq3my0zhAJ?=
	=?us-ascii?Q?VMjJ+cWEBk7Spi1UozvpL8PGlSVFamRzDWwmYz2GrTxifZV8XJZyyojfptAA?=
	=?us-ascii?Q?5HNQL0SppoyWWRUzPsUx3FnRpC7g0x8oqrkLg/yxhf7qdhQ5OTBDLdyPx3kW?=
	=?us-ascii?Q?B/WmWRri1+3K+soE6EOSVogu+rMDWStw744mK7qC0JBfppKeUH4ypuoS7hG6?=
	=?us-ascii?Q?UuMe+uZnQEaWc1wSSzToP3vYTHNrDsi7Btn494J8nus//5vlMP8VqXOqm0/M?=
	=?us-ascii?Q?jyMbsP7W8J1Z3E0uCaHWrNeEcXnI3pKcgRIeEaDQhEzWaq4eNV4Z8nTIe8sf?=
	=?us-ascii?Q?S9tjkdJHbsQ0VzjxtVo0/t/4i/hBqHNCCn5l4QHiO4HGAfAS3EUC5gs3xSsb?=
	=?us-ascii?Q?KasZ49wLwQknoAmzaQWGNBw+BSQ1s0gfn6lnhgOJFI6wGW+2cilO+PKUOmBr?=
	=?us-ascii?Q?zxz+lFsxuAxO1vwek9aVw8Nw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	5:OWCSCEep9TJ2zl49X370AkzSav2vGnCupCZ8eom14PX/9DEVAXVodacr+uWNLVI1BmnHnjxrdwUGy1qeiHMAm/2BTAYfCkxl6v754jD9vuTFPR0r+SOp4sx2BjSBuMQKcky6wudd3iN4eFLB6cR9/Q==;
	24:LASR3sqWF+I38b1Z5EXrX6ydMDSaQbZ3xgiB6t0Kd99mwXZOtkEnrHIyIiB9eSU5eLtmbjvSjdLL7u08BWcXV1czuniPOD8WMe2NJEFaffo=;
	7:/9yw8MPf9iUMVlXqKPM1HQKQWzLD40hiJtgEGIkFEUlwQztMKSNeWQKPwxxMdLMH5aXHkRjh3i1FVu+SkbcTW2J1gSDxH09fj8hze75ZvJ95i1kOKqLx3q8A9TgonCa+QaqEUlry8dzULI4BCEEEmV7LcnaJoXMUGRwoBMaNt5TMHN2hUEgD+i+h1uS+0tpTy6qjHpXvl54075rcetBEUR+bzGwJhTxgFW3F3FDv5HM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2016 09:09:37.4476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1689
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.72
Subject: [Qemu-arm] [RFC PATCH v1 2/4] exec.c: Remove static allocation of
 sub_section of sub_page
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
Cc: Prasun.Kapoor@caviumnetworks.com, Vijaya Kumar K <vijayak@cavium.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VD5e7vwI+Zbu

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

Allocate sub_section dynamically. Remove dependency
on TARGET_PAGE_SIZE to make run-time page size detection
for arm platforms.

Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
---
 exec.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index a9d465b..e803a41 100644
--- a/exec.c
+++ b/exec.c
@@ -154,7 +154,7 @@ typedef struct subpage_t {
     MemoryRegion iomem;
     AddressSpace *as;
     hwaddr base;
-    uint16_t sub_section[TARGET_PAGE_SIZE];
+    uint16_t *sub_section;
 } subpage_t;
 
 #define PHYS_SECTION_UNASSIGNED 0
@@ -1151,6 +1151,7 @@ static void phys_section_destroy(MemoryRegion *mr)
     if (have_sub_page) {
         subpage_t *subpage = container_of(mr, subpage_t, iomem);
         object_unref(OBJECT(&subpage->iomem));
+        g_free(subpage->sub_section);
         g_free(subpage);
     }
 }
@@ -2272,7 +2273,7 @@ static subpage_t *subpage_init(AddressSpace *as, hwaddr base)
     subpage_t *mmio;
 
     mmio = g_malloc0(sizeof(subpage_t));
-
+    mmio->sub_section = g_malloc0(TARGET_PAGE_SIZE * sizeof(uint16_t));
     mmio->as = as;
     mmio->base = base;
     memory_region_init_io(&mmio->iomem, NULL, &subpage_ops, mmio,
-- 
1.7.9.5

