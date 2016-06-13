Received: by 10.25.85.209 with SMTP id j200csp1152371lfb;
        Mon, 13 Jun 2016 04:41:43 -0700 (PDT)
X-Received: by 10.55.46.197 with SMTP id u188mr8325568qkh.84.1465818103600;
        Mon, 13 Jun 2016 04:41:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d28si14013851qte.30.2016.06.13.04.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:41:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCQFT-00029X-1Z
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:41:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCQFN-00026y-83
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 07:41:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCQFJ-000558-1g
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 07:41:36 -0400
Received: from mail-bn1on0062.outbound.protection.outlook.com
	([157.56.110.62]:60000
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>)
	id 1bCQFI-00054m-Mq; Mon, 13 Jun 2016 07:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+wmeIuHsQK+kbHIvzuUU42Pg4T+7gmbLNu/NfQB1pzU=;
	b=NIHINNlymkZZRWxzi8Fu2CBLq3hIB/+JMm4JhDMCIw6tUIddHwb3jvddt6rPMy8W+9CvLz/MK4cdbG0mNh8xbXWuWBTuUx4Uk16O2jrKKp9lDyNHC1y+a9yOFOGTTVNcty2Wi4ryU41dD05z172ZsoDTDXvCyz6Pk1XExgWgzfc=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Vijaya.Kumar@cavium.com; 
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.511.8; Mon, 13 Jun 2016 09:09:21 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>, 
	<quintela@redhat.com>
Date: Mon, 13 Jun 2016 14:38:31 +0530
Message-ID: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: MAXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (10.164.147.22) To
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27)
X-MS-Office365-Filtering-Correlation-Id: 6d057f39-b725-454b-ee32-08d3936a69f2
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	2:nenRMlWBJ9V+am7ZdsYWrSiVOaOgMne3tf/e6DmI7O/Ns9gMtoUKJZgY6sfGXHkcaaXUcIamT572O18dFVmta1z2KLJ0RIGjR+J97hYIBwg8h+DypsS7pIXd0rl3XMYyJ259QF2lsErR5BFX3GHczvLfQTLQ+QxnbayMNYAG6QCPb1xd2k66sT/Z6MGOB6mA;
	3:BEdbgfFTRV11hhzTJWJOC+TlLNJkyun4bI7YLyFoVgR/rVkbgWJtcJxoLidHuBYWfpcfwiHZyaaliN3wI0QSKMFTKH3W8t0CTDnEyEDy2VioKsx2iF4S75YARkPdYLRF
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0701MB1689;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	25:dBThPqoxbqVyIRTlMc0RDYVpJ4oL7qq0KAbfAhPOnQg/uuMlDpju5MPyoUVrsaGoXnDZuShnpF525prH+G2vijt23rH9U8+xuCApm2BhHh5KGJgpgJ+Lp8pVGKmA6Kz9rynHJ2GkAjaF2mtfNJagdgcG/NHio3Ug9yI0sGGv8HTDBcucM8UKb6wP86jr3hrWkftEJs3BDDWeJG5fO70TZng73CScPt7aADIRMNyQhCD36RkSq54x9RyKMPto+dZFlmdY5y6fQkzc8e8CpWt9SFFJqc8l3wKwlA+fhagKAfKgxmOLgOjAeXjkbu6KtYVt4chOadJ+rD3Dr7lDFpJ7sNhq4X9728Oj/R7BkRGToK08vH9w100QdBt8tXCK4YdIpnc2VDv9oq36LL6RWqPYpf5LRqlUirYGZqp3ZAN8CYrObTbyb35WRLNxxbsJb1JSqyY4xzlpNx4Vmg3PcBWM1OU7918KJGTNVFoIatgTqtR9dT/j3nxtfH2VjxI89e3uI04ifNVe6w1/GYbTMEBMhi+Xou8FrPlqJPEY+VRwcQohu1lu4s0FOyt3oUVwfdmpcG5aJYWBTUfNO6GtR+0uh4pi7m6E4RIjwjL7ZiIE+sDDjnkPR1l51mMdGYLgnuhlPQhaCysV/jZ+Wi007+DkDR7d0ilWyB43/PXBSqeC6ngQByC9choVKBNOr/OXtPMSvlGLnOGdoTz0Z5zQB9zt7hA1u7rLpCtqficdT0eteGI=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	20:cEssJBGc8EMtNvePxfEzD2q55+7t4sEfTJzH9v7kSIz9XXLiC8tJzwU0CJvURMJs8o54yoKknyslc+Nv5Fvt1QKXrJnkpcmt7yG6CWXaYlp1Q/QsoIPPIP/M5GLVSICmCh6yMJHzYzpQEV2LWEwujcYa+h8zl5OiJtSvQTGldfekhlXEcXPx7KJEu1YkkLRMIeiRazCPyPo/JHH7Lfn/V4EoebQkyYB7tiHBkjZT/oSyGS0dvNzTXxaFRf1aaN3aezh8hO0xBZQXYKxfsOkpmZDX0tibTURlvIJG90anUxcuOL06Jw1wx7ZQs60fDlkcuIupI49Hr1lELPUsEbhEM/6dG7nsMv733ayrEBLz5zZykUaYmsLaIzR8Q3LkQB2HzWEQ+aoyYLiSpsPZknVMxTP9psAGYmttafCkAmnvBZrNZDBC0RDPEHH+B7B5G8QwrUm/ZnF34ypmzRBJ8VRqoLwlTfodFJOl8Nv3U8zEaC97Q979SENUOcukes8+B2yfQ9hw2Isr3ygP/bBeMLKhMmydgnko5uI1MGQfNbZtvR4fsSk12H1gWJHv9yqz12vLSN0YvSB34MhWdbARcBkUknvtFXGMF8NvmKwmFMSv+gs=
X-Microsoft-Antispam-PRVS: <BY1PR0701MB16893DE54C93D71314263E6EF2530@BY1PR0701MB1689.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BY1PR0701MB1689; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0701MB1689; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	4:ffRhvdJd+eRojfV1KsXsbcM/lX3NSvk6MySqkXIE1Yb8J3siXoH/eiTyaexmsY8EIczDCTZb1KfP0zFlbMMR5TTfqtXtUBGHBg3wV1sK469rSJHXFhivFoKdVsA5jHhnjabqynJ649cybWMkAncRtepjrIVZx413r1+1EgvEVzRnjno4dzTsZlLRXL41vLo7EoMFvncRKlrwq3OBVqmNW6Spz6rzUBu6/UNP8ZZlHa56WtzLsmUglqR+N+Ip+HZNdbrwPNIYsbuPQ3G45NtQgfv/ZwDIhAKEfcT6/nokzT66unRse6SrEHOZGdJAGYIgz1qKKaGA5DWZRV5dbXIfmJ2uSPTNqNyjHTzoZwlGb5Pt0AtnbpzjyjodJXOt2VOZ
X-Forefront-PRVS: 0972DEC1D9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(979002)(6009001)(7916002)(189002)(199003)(47776003)(66066001)(5008740100001)(33646002)(8676002)(4326007)(48376002)(81166006)(50466002)(106356001)(107886002)(81156014)(105586002)(5003940100001)(229853001)(5001770100001)(97736004)(189998001)(2906002)(101416001)(36756003)(5004730100002)(50986999)(50226002)(42186005)(68736007)(2876002)(53416004)(586003)(86152002)(6116002)(3846002)(69596002)(77096005)(5009440100003)(4001430100002)(19580405001)(2201001)(19580395003)(92566002)(7099028)(2101003)(217873001)(4720700001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1689;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0701MB1689;
	23:AiRam4z/yq+/FedUM4ZFt4RbtrFJlfDcDaCimIS?=
	=?us-ascii?Q?BM36ULo/HAmirHxINPsGwZbeTNYBkiseMQ8uQAbNiWtqcffSajns94Vm3MkR?=
	=?us-ascii?Q?XKC7QEBZ6uLM5HObzsrvkklUf4NqNj1nvyirB2P36wPSyOhBfq07MUx5ta7t?=
	=?us-ascii?Q?CA568CAjmU5fbnuqj08XY5tJvP1W9mqEO+gpBtEFjOzYT0TBJOf0rjx6RlFk?=
	=?us-ascii?Q?P8tKE5cDCY1TOzXosqKg99KXIA+PY2v7o4F/jh/Xz9Lqpyd4c8DO3O0MYCHa?=
	=?us-ascii?Q?KgsI49X7Abd4xJkiJd9ZnwZTEa1HtLOfwnUZjXtJ0Z6tI8L5ZA9/Pvp3tUYV?=
	=?us-ascii?Q?Y73uu0cu51wBLDdhGX7Zr1Oxy89pFwE52/h62YI8s0MrMJd5RU4FqtG6OCKm?=
	=?us-ascii?Q?A/yD31k3OL99L6ppSDDio+0SpCfyM5ACwAxarKL8OpcrSzKf+1mvbMuYXi+X?=
	=?us-ascii?Q?uRCIrzrNfHU491wyiOwymUWF713wp2YkhXfyqfh2nYGulmnfP2EG7BA6R/Pp?=
	=?us-ascii?Q?JeiVSNaiQbu3di4No4388vHta1Wcy2dsI6IAtl1tyu5VMnqELrUgRtXHvZB3?=
	=?us-ascii?Q?0t2O6Nx2gQxU5O3w99SGyncBZHQCqKhhixJRRwD84fr5+8sG9wYvjkNgixir?=
	=?us-ascii?Q?qReaolW/v0PRFB3eIoX9BJh1C1o0xe6uLGcifzlRidOfNcJ2scgkenimQZt3?=
	=?us-ascii?Q?Hx18QK0kiXbrDgZ9ri/oZKBEN0ms+/PK+jKt1z+DgrzhHF4tEFcExx79ahv8?=
	=?us-ascii?Q?1bvLQBAoX0Qzjs8F9blZLEmLIkXfw/qD8RpxA7lEeRMU1TKd9/QR3kNQ7OpN?=
	=?us-ascii?Q?5pCTTIHhJh7hYZLqzYFMMQ2bg/8bqD0y6H+I8LEKUKx+EHYCrhXLCzZLy7WH?=
	=?us-ascii?Q?/6Ebj5cqOzyEfsGNmkl8v10w4Gta8wTkm2B/QQQX34ENVLwGnNWLFYIBvj1m?=
	=?us-ascii?Q?jGSWw1ybBt4y6BOSi5HKCukQxIOePSAnQn+HQOw530AoLsL7AER6R4NeHVFa?=
	=?us-ascii?Q?yY+tYyh8EaDkHhKICa7tNwr7TFsDYFqOItDh2LFsDz5NJdLUI/Q2Jz4twNZC?=
	=?us-ascii?Q?7ig5ugf/+Pxf8+2ZyoxIBpb6XRqSvskYJfaz9ttfO9pE6021vtHUIbyOySq4?=
	=?us-ascii?Q?afT1Wl4tM4L6JeK46zm0FaDHHBKrWXo3dBbz4TS5TKswmJ04wfwJqYN2/Msz?=
	=?us-ascii?Q?LMlk2brNuhWqLmq9AkjqZDaDy7/kJSmJamFfI+E9AAv4EFf904xRlqelgrEW?=
	=?us-ascii?Q?XnZZzFJvYYPsWAfcHwvxDiiaI4AHl0LvDOL8RGLXs9LQei0Wmx10frnhDU3C?=
	=?us-ascii?Q?WTxcLBsUwzm9tYJrgKV2aZBztfePMKgovYYs5W2DU9DJxRUVgatI3Jt5IrYl?=
	=?us-ascii?Q?Ef7z6Qw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	5:u/0/DIuIlvzV2jqllzNtumgd0A9a9DZYyAsiK75jAZMkmISK0HUcZJIFZtDUjce5JC1Lp8y7isd/kjAwMXHFiHNPjinS4Gsg+f+ND3OT6F5ji/A2I+enRVLLWe5O0txrrZQVtVQS/IDqYyLD7gnSqA==;
	24:ijopfh2/D5VRQo+7tEDFlL5juu7z92+JfaBigrFBEVlolQoeIbwBtjG4j65l59BR+1DgF7P0i7Yo4xzfyvGnSVUSzs534kd/5iB6VUNc5l8=;
	7:Icxj9o8RUux2trTHwywegJkr20PvQySJ8sTME4zHWEgS0C/TeEm9PBXsdUpXFNdfv5yiIovQvsHpaqLaN9NRILeY4Dv+ynH8atuIk0RnGruZTbRv48yWrhCAQBG1s6FQkX21EWT44SbUGC/3gZDsHNhjtGyjgjxz3budaYaDO7RWKL6Rf0I/agcnd90zuFB29utQID2wbfvkZBzq1yhcm2MKtOg9JdlOhV9fMsP6mRI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2016 09:09:21.9407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1689
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.62
Subject: [Qemu-arm] [RFC PATCH v1 0/4] ARM/AARCH64: Runtime page size
 computation
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
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J0DO2vNkwGMB

From: Vijaya Kumar K <vijayak@cavium.com>

For AARCH64, minimum page size is 4K, for ARM32 bit platforms
minimum page size is 1K.
With this patch series, the page size is calculated at run-time
based on cpu model emulated.

Having higher/optimal page size, improves emulation and migration
performance.

Vijaya Kumar K (4):
  migration: Remove static allocation of xzblre cache buffer
  exec.c: Remove static allocation of sub_section of sub_page
  translate-all.c: Compute L1 page table properties at runtime
  target-arm: Compute page size based on ARM target cpu type

 exec.c                |    5 +++--
 hw/arm/virt.c         |   48 +++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h   |    1 +
 include/qemu-common.h |    1 +
 migration/ram.c       |    4 +++-
 target-arm/cpu.h      |   12 ++++++-----
 translate-all.c       |   57 ++++++++++++++++++++++++++++++-------------------
 vl.c                  |   10 +++++++++
 8 files changed, 108 insertions(+), 30 deletions(-)

-- 
1.7.9.5

