Received: by 10.223.197.9 with SMTP id q9csp8337997wrf;
        Fri, 20 Oct 2017 14:51:52 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RL1OIK/kfkkWKliqABFyEhQL4lhEeKTpoAzdgIRUDhU9JzQwSB7zewdmZHKxyy8UQO9Pod
X-Received: by 10.55.105.130 with SMTP id e124mr8731629qkc.314.1508536312863;
        Fri, 20 Oct 2017 14:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508536312; cv=none;
        d=google.com; s=arc-20160816;
        b=fhdbTHZSOhypD2y9ize6QgR7yHdvGI0nI+JYm9duzAi92oHIPtKAgIRCVU5zrGZOPv
         bygvfOgXwFrnqpIvOz6Fkosw42vlys5iuQstMxLc2fQzQZNiaB+EuA2UHwFgSGD+x6cP
         HRBpVN+nFCBQZ56t5BKzE6ZJuI3apBOgoNppgeWsplzqCEPYSKwqnRNhMGN5Qk1at618
         YePOCRzypPp+oPlNjcwHzic0W/YzfljcQLPvtR4fpMxYt7LcFFOF3XYn+XhiRkBe1JhH
         aYsCz1qCAAUCXYlySmKvjBA1Eife0kj1Iz504/kBtD7cXlXUQKTzn/qvfTrg4lTxWWtV
         wGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :spamdiagnosticmetadata:spamdiagnosticoutput:mime-version:message-id
         :date:to:dkim-signature:arc-authentication-results;
        bh=5E/l7QjUto0Y2tZo9T0qcMb18D7+ckd8Dk6soN9FySI=;
        b=BNB55Q25/984xJw5Z0CvNnIMWq4mRQR9Lbi1/WQdOSNNcF/F60b3lLoihGQjij7BU1
         bCO58q+HJAMzh4OL0Skt2icgk9/26QHr/WCEdPT8IQOzfMx/7dGw6CfwYRaGAL1idkAB
         FfeTg+rSYVt9T9tmpCJvBMtKwdoBDzasaRVNPPiz+XV38Po1U8ftGKeLmWgnIdKea2pW
         Woy6g4VVbUqvOyqdxBg+/en4muL6JHaomT07e2nw+05akPjJNtOMUCvOrAlliE/cOmkV
         Fh1kRZS0k3lXEWi0e55nybK7nycVP3HuEKJqGyrVp+A+yJH7QCP7k2xgMmT+09ZY/9QI
         F/CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=d5Jl1OE+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k25si1149578qkl.100.2017.10.20.14.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Oct 2017 14:51:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@microsoft.com header.s=selector1 header.b=d5Jl1OE+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5fCo-00058c-Gh
	for alex.bennee@linaro.org; Fri, 20 Oct 2017 17:51:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e5fBC-0004Ba-Hh
	for qemu-devel@nongnu.org; Fri, 20 Oct 2017 17:50:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1e5fBA-0003HU-SV
	for qemu-devel@nongnu.org; Fri, 20 Oct 2017 17:50:10 -0400
Received: from mail-dm3nam03on0128.outbound.protection.outlook.com
	([104.47.41.128]:54615
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Andrew.Baumann@microsoft.com>)
	id 1e5fB4-0003CV-Qk; Fri, 20 Oct 2017 17:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=5E/l7QjUto0Y2tZo9T0qcMb18D7+ckd8Dk6soN9FySI=;
	b=d5Jl1OE+55OgRGyRF6SJyBkTRhPNliRVbKXU4otms1Uc3Rmd1SeQRNmT2GtiGazEDpCxOVocCcejYUQGae3W3RC94qkhduLArHCGpXxAdRLF5FkzCBuSN6rNUjag4rHPc1rKsqOqah0anQXyvtMBrcFb7r/vJXzFOm1g7LlKQwM=
Received: from localhost.localdomain (2001:4898:80e8:6::7b8) by
	MWHPR21MB0157.namprd21.prod.outlook.com (10.173.52.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.156.5; Fri, 20 Oct 2017 21:49:58 +0000
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Oct 2017 14:49:18 -0700
Message-Id: <20171020214918.18944-1-Andrew.Baumann@microsoft.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2001:4898:80e8:6::7b8]
X-ClientProxiedBy: BN6PR11CA0041.namprd11.prod.outlook.com (10.173.25.27) To
	MWHPR21MB0157.namprd21.prod.outlook.com (10.173.52.15)
X-MS-Office365-Filtering-Correlation-Id: 01cc57bb-ef99-4c66-ea5c-08d518048267
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(4627075)(201703031133081)(201702281549075)(2017052603229);
	SRVR:MWHPR21MB0157; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR21MB0157;
	3:Kcn9eJbz/0ZsMFKMlz6+AHzPS9A566e1qWHu4bQzpz9Bp33sqZpGX21QHau90QCUv74PfSvjB1RuqLRkr/yjnNhmCh0zGUGJvvDCCYG5NOFk6mHNsSdZNqozwJQ/58dUu6JunnGNnHgqZJJ/BugQBwr9/qoOWwTQT3n4O09ROnJZ04cwF7PZ2mI/rM3TVndLc7/tnEzngze7eU4CiuuK9D/Fl9Sp9XOdOeE4rqPgpTWsB4HnVggofi7Sld+wIOV0;
	25:vCDRyhqBGJWBNt4Yp2masTky0yc0o4kF3z9OcI2E4DyDIy7PXLXB7tISwhABFneOQvf45hPIWJfdalgBuJlbCw0FA6impLPjsDC7xdvbh26Z1hggwHSsmfJD3rntdAq+5gu6ulqizoPWJuLOs6c12QgyDSaxiFmfOsKyF+f0/H/VallyaOPtG8p3hEDncP8XPAxX2Cm1nK0o4RWMvL12Vfv9iOGOQd/swFa+zfX70Bw1+VjpJ1x+ylDmiR6KkQDiwwgP3hteZ69fa2RQWpqUD8jagot7zdSVTHbc/YR+RFbcdRFY17FvoX05kQ3tU8gbKTz5wY+aqKidr+CRt2F+hA==;
	31:Ab2jHsfmRqLt8EoYUNazxlGZPi3xlAhhhTZ/MRVk7dZntkO/OwYcLdzC1DKg5V4tG9nmwfDGkfXq/kDW2InGE+3Yw7k95qlsg6VTfnzGt/7W7r+/5oHmVRWTaYVvaka7q49/yBCyJoo6Y7gp0pvJoUnmDHIYpYzxlZUY87ilAtNYQdy2vUo0bchDDdyYR5aff7Wrfow5recWaIB5Qr1c74H8swpbRmOp277OHw35Z10=
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR21MB0157:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR21MB0157;
	20:V704sWt7wVZJJOgPKKqQZp71TkKzx9cr6ECjhEt/v84rD1b17/JHNRQje5l1xIqCwZvgDJHzYovUyufjQQ7MeYFVg7ntCblMdb6AYdylJjiTqyaJZZ6vG9MPD4+Tpqvow0ov9e25w740+Cle+MW3lutl17fo8aaX3Uf2edah2qjTsSbHLgKckSgVkRJGam4kDRx9WmVK9MvpM9uyq/UTMvdHmyffzLnn2sapfZTKg2IDZTyp/Rosgg/c15KIqjxs78iDXtzmv4uSCeX9pOqXbA5tpNd4BXlPNJ9dvuzcMmXZY4BHGy4aRYnmQD1ciEZL57VxckvrcAempgV5YpRhuf800v5WsTRCcaFt8ec5/PJoYphP2xDkDqig4Eqgl8GCtT3kFCe+whFPNIhw3FyD0FgL7irjMNU5bhyvrzxfMC6H/nVG5R+0u9yWTL2LYKOfHh3q8BIk2hlc/FPd3xy2o32JQa2n3KuwilSIn9TcP4NXcr3I71LKHxc8VEhui+Cy;
	4:hNiDZJ9YA66iwM52ODr1v8H50eE7QEQ0lsZ2Fz/IN1HhtCkk8HomtmRdHw+ihVkcyta6V1gyC/en2d/BZYjvnQmybtQiTc4AFU5RnDebMiLIATQjJCZDul3xSYazUR0x8VMrl+P/9BUMZ59hB5Cd8SzM5RlezzDbJL+0xpB8JG+rDdb7vBKw7K8f21sbiHQ+5y6swtK/zCLowFF/kJaQDvHHIoy4Swb5hwhNa8Oer+f+j8A9FOJsjNVBPxqFYUk+q15dHxTd2XSgcXDyOLGJKxekCrlToCUQqU+jdOSHCW7xJFQde2vBT8ebxLrjZtBRQzb0EFebwE95Hw2T7loj6Q==
X-Exchange-Antispam-Report-Test: UriScan:(89211679590171)(192374486261705);
X-Microsoft-Antispam-PRVS: <MWHPR21MB015781656FDCD2DDFE477BA49E430@MWHPR21MB0157.namprd21.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(61425038)(6040450)(2401047)(5005006)(8121501046)(3231020)(3002001)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(6055026)(61426038)(61427038)(6041248)(20161123562025)(20161123558100)(20161123555025)(20161123560025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR21MB0157; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR21MB0157; 
X-Forefront-PRVS: 0466CA5A45
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6069001)(346002)(376002)(39860400002)(47760400005)(57704003)(199003)(189002)(10290500003)(8676002)(86362001)(86612001)(81166006)(81156014)(6116002)(478600001)(25786009)(68736007)(5003940100001)(105586002)(106356001)(8936002)(1076002)(72206003)(47776003)(2906002)(5660300001)(50466002)(101416001)(189998001)(6486002)(316002)(97736004)(48376002)(6666003)(6506006)(22452003)(10090500001)(36756003)(107886003)(50226002)(4326008)(7736002)(53936002)(6512007)(305945005)(6916009)(16586007)(50986999)(22906009)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0157;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR21MB0157;
	23:7NEs/FlogL6T9eU2VRpQ/ZfYuevuVb0FsxgXVq4jQ?=
	=?us-ascii?Q?B26RxobKocCV1RD859FA1snZh5HYs5+0e15gcWgjJbKzepGvJY+/trabQb++?=
	=?us-ascii?Q?xy7vrqcze0/M1xskkV2YQUFjL7/fKIXnw3ALPKWT5ajdI2n1ExK99rqthTni?=
	=?us-ascii?Q?swJ8mFrYHcbFV930qVd/9D4iG7qVEAw05912IxJWF6/cu0tTNbK1ehxi2e0u?=
	=?us-ascii?Q?p9wYG3VSLxNv3GJkT1wnkDxgdzcIS1RXUUeV2JpJi4mHGQ3I6XQAzqhHnAo8?=
	=?us-ascii?Q?7Mg9Fr7aTLEOsjsPVxcDRMs9ppZ+iHzbTEhU5Id+/TJ2zEXyfSGHITmVMK4E?=
	=?us-ascii?Q?CORApy63DXdceBAZEZvLbrPRZRPIaxN9Sbc6Iov9PQ8+gFrMUYgkivKDeN+C?=
	=?us-ascii?Q?xmvfjsSFXSHrqdlhwOreBr1t/ODHbHWS+8MoTRSa5QznzRNqX5M6k7ocz4mS?=
	=?us-ascii?Q?xeHmBaLYCkhKKpVAWg51sV2H5r6bM4VEcXItKRbmN/Hc5eeacL0kZ7ZkGY3s?=
	=?us-ascii?Q?4AVQbe+vhJSwX5hbVlmtoaOvpuT02q/1BR6QyXpHFg/kxbeHP9sKFtQ1uqt7?=
	=?us-ascii?Q?KkNUdJiTVpAuAW3vLYGd7q2WUEXBbuBTDHMNo/nUtcJ/SFKMlTJsR5gv75p/?=
	=?us-ascii?Q?T6fr7rBwP78B7YqwfE8wTImGBlty+LfluLWlIHLXmgEFTzDoThk7+13TqpVx?=
	=?us-ascii?Q?3lHxeyZPNdB94pUmaHbfnZTW1jAUlKGeeHgLEnnpU2MMLoSjN63TVuMu5iwh?=
	=?us-ascii?Q?dCPPGWvutS/5MbZzyDmW6bJ0rdf4Cbx20F4oBmvwz4+1MqS0oPRRTtVjS4wY?=
	=?us-ascii?Q?fh6jGuZqATfQilJCBK3DbXDJFKTkFCHSKhQhjqMtjD5z8ImSpCfDHxOiLosq?=
	=?us-ascii?Q?GuX8DbqW23uEMc2vghCC5HNjFkSWf1WhUmaY48u0AZCKUqMd2I2usBxI0jrK?=
	=?us-ascii?Q?JWXf4DULD0RL7SsbzLIM25aVzMfZCoygpDr+u8VkhoXydSmASC7oy2XZvbIZ?=
	=?us-ascii?Q?n6WJqF0eNY22F+3yUNzCFAv0dy2L1sCHIAXTkcfOYkI5EicrJvzx2gW5yfLn?=
	=?us-ascii?Q?yemJvpSJVLWXI6sPMxG52abw4OsC0B8c6a7LrBaxYKSdEn5SVSyv3t6m8Vta?=
	=?us-ascii?Q?GUVDVPmrldV+80M9+hTTi9UUzd7vo+vNWzIjuIjVGEj9QGPJk2AQ8s7SMOxS?=
	=?us-ascii?Q?KXiEmF7IqazRHOajsfcYJ033rFmUPECB5buyMnBnaosBPXspSjxtqroZg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR21MB0157;
	6:jBJQYQcxz3AacHgjPj+8y9VetQo7z53SR3WaRU6eQrqMA7A/hs8DPDul0EZs1T9oj6p0RZFsOT9xPZcAnEDmXTdoQzYNOfkpRMQyLtF5ZL0js/Zgf/ArbUV3AyIQGhi0nt6+yQRvIrMGeS1/5uRMtRbL8clMdfyYyy2cvuhZmvW1LJVSQb7jSzQ0wkG7WSl3w4sOdM+akD6RUvNnCGUTD56R9dqPKYRIAZP4OpIDzD0rzR+McoX6GFUKpEbtOIOpjSp06ThdT7ZTjnjgCs91+i4j78hTSNWSCjGDvvPNa7ABnf6HV5u3YCIf/z3ph1N2tE0DH6M3c/YaikKDG+vO2g==;
	5:FqXAms+cqt5YDaKKS8rSeGwBi+LInv/0pc9ZF+Nzv/cyx3cqLpK1AcN6/SlBSC602/y+npaYQ1A6ZnU3u36TT3v7tAMNXZ8i7WYBqzaFYXHs66+oDLB5cDo/VmTZtb8dBqnL4gjwXJIPmvXZXlNavw==;
	24:jWHiiYc+2RUXru9ZsUTY4qWwQVvRgmhc+p6NtLtHQjmZogbTLg0Wn104SkGcA3bhM+0Wy4k9VSYGaTNIqcip7P8GMe2TYWT6mG+AZGPSHR4=;
	7:z1msS8JDa10hRYmxO9Ev2AQ4hEfa76yZb7+DNJKFJfXgzy265m1KbNDUpSKHZhSjmXp771lRJatUlvl40zEPxNaV10LwWO2uhrTUeiwjSChbBp5bFNMzKDMRT8B0Ikw07smAue8STn/+hsMgdxYFe5Z1ZlNuNrJvG3ghYU8Ttqf2hxJLGINkNFGGAThBZj7Lj23o3AbWTR+bHQtSEsKC4yoAmtwtqzA7a2LszvLwe4I=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2017 21:49:58.0569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cc57bb-ef99-4c66-ea5c-08d518048267
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0157
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.41.128
Subject: [Qemu-devel] [PATCH v2] arm: implement cache/shareability attribute
 bits for PAR registers
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
From: Andrew Baumann via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NX/p9QtMF/2I

On a successful address translation instruction, PAR is supposed to
contain cacheability and shareability attributes determined by the
translation. We previously returned 0 for these bits (in line with the
general strategy of ignoring caches and memory attributes), but some
guest OSes may depend on them.

This patch collects the attribute bits in the page-table walk, and
updates PAR with the correct attributes for all LPAE
translations. Short descriptor formats still return 0 for these bits,
as in the prior implementation, but now log an unimplemented message.

Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
---
v2:
 * return attrs via out parameter from get_phys_addr, rather than MemTxAttrs
 * move MAIR lookup/index inline, since it turned out to be simple
 * implement attributes for stage 2 translations
 * combine attributes from stages 1 and 2 when required

Attributes for short PTE formats remain unimplemented; there's a LOG_UNIMP for
this case, but it's likely to be noisy for guests that trigger it -- do we need
a one-shot mechanism for the log statement?

Cheers,
Andrew

 target/arm/helper.c | 153 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 139 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 96113fe989..60cdc7ce1f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -19,17 +19,23 @@
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 #ifndef CONFIG_USER_ONLY
+/* Cacheability and shareability attributes for a memory access */
+typedef struct ARMCacheAttrs {
+    unsigned int attrs:8; /* as in the MAIR register encoding */
+    unsigned int shareability:2; /* as in the SH field of the VMSAv8-64 PTEs */
+} ARMCacheAttrs;
+
 static bool get_phys_addr(CPUARMState *env, target_ulong address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                           target_ulong *page_size, uint32_t *fsr,
-                          ARMMMUFaultInfo *fi);
+                          ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
 
 static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
-                               ARMMMUFaultInfo *fi);
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs);
 
 /* Security attributes for an address, as returned by v8m_security_lookup. */
 typedef struct V8M_SAttributes {
@@ -2159,9 +2165,10 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     uint64_t par64;
     MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
+    ARMCacheAttrs cacheattrs = {};
 
-    ret = get_phys_addr(env, value, access_type, mmu_idx,
-                        &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
+    ret = get_phys_addr(env, value, access_type, mmu_idx, &phys_addr, &attrs,
+                        &prot, &page_size, &fsr, &fi, &cacheattrs);
     if (extended_addresses_enabled(env)) {
         /* fsr is a DFSR/IFSR value for the long descriptor
          * translation table format, but with WnR always clear.
@@ -2173,7 +2180,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
             if (!attrs.secure) {
                 par64 |= (1 << 9); /* NS */
             }
-            /* We don't set the ATTR or SH fields in the PAR. */
+            par64 |= (uint64_t)cacheattrs.attrs << 56; /* ATTR */
+            par64 |= cacheattrs.shareability << 7; /* SH */
         } else {
             par64 |= 1; /* F */
             par64 |= (fsr & 0x3f) << 1; /* FS */
@@ -2189,6 +2197,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
          */
         if (!ret) {
             /* We do not set any attribute bits in the PAR */
+            qemu_log_mask(LOG_UNIMP, "ats_write: cache/shareability attributes"
+                          " for short PTEs not implemented in PAR\n");
             if (page_size == (1 << 24)
                 && arm_feature(env, ARM_FEATURE_V7)) {
                 par64 = (phys_addr & 0xff000000) | (1 << 1);
@@ -6925,7 +6935,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
         return false;
     }
     if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx,
-                      &physaddr, &attrs, &prot, &page_size, &fsr, &fi)) {
+                      &physaddr, &attrs, &prot, &page_size, &fsr, &fi, NULL)) {
         /* the MPU lookup failed */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
@@ -8207,7 +8217,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, 0, ARMMMUIdx_S2NS, &s2pa,
-                                 &txattrs, &s2prot, &s2size, fsr, fi);
+                                 &txattrs, &s2prot, &s2size, fsr, fi, NULL);
         if (ret) {
             fi->s2addr = addr;
             fi->stage2 = true;
@@ -8612,7 +8622,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                hwaddr *phys_ptr, MemTxAttrs *txattrs, int *prot,
                                target_ulong *page_size_ptr, uint32_t *fsr,
-                               ARMMMUFaultInfo *fi)
+                               ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
     CPUState *cs = CPU(cpu);
@@ -8929,6 +8939,28 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
          */
         txattrs->secure = false;
     }
+
+    if (cacheattrs != NULL) {
+        if (mmu_idx == ARMMMUIdx_S2NS) {
+            /* Translate from the 4-bit stage 2 representation of
+             * memory attributes (without cache-allocation hints) to
+             * the 8-bit representation of the stage 1 MAIR registers
+             * (which includes allocation hints).
+             */
+            uint8_t memattr = extract32(attrs, 0, 4);
+            cacheattrs->attrs = (extract32(memattr, 2, 2) << 4)
+                              | (extract32(memattr, 0, 2) << 2);
+            cacheattrs->shareability = extract32(attrs, 4, 2);
+        } else {
+            /* Index into MAIR registers for cache attributes */
+            uint8_t attrindx = extract32(attrs, 0, 3);
+            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+            assert(attrindx <= 7);
+            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
+            cacheattrs->shareability = extract32(attrs, 6, 2);
+        }
+    }
+
     *phys_ptr = descaddr;
     *page_size_ptr = page_size;
     return false;
@@ -9490,6 +9522,89 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     return false;
 }
 
+/* Combine either inner or outer cacheability attributes for normal
+ * memory, according to table D4-42 of ARM DDI 0487B.b (the ARMv8 ARM).
+ *
+ * NB: only stage 1 includes allocation hints (RW bits), leading to
+ * some asymmetry.
+ */
+static uint8_t combine_cacheattr_nibble(uint8_t s1, uint8_t s2)
+{
+    if (s1 == 4 || s2 == 4) {
+        /* non-cacheable has precedence */
+        return 4;
+    } else if (extract32(s1, 2, 2) == 0 || extract32(s1, 2, 2) == 2) {
+        /* stage 1 write-through takes precedence */
+        return s1;
+    } else if (extract32(s2, 2, 2) == 2) {
+        /* stage 2 write-through takes precedence */
+        return s2;
+    } else { /* write-back */
+        return s1;
+    }
+}
+
+/* Combine S1 and S2 cacheability/shareability attributes, per D4.5.4
+ *
+ * @s1:      Attributes from stage 1 walk
+ * @s2:      Attributes from stage 2 walk
+ */
+static ARMCacheAttrs combine_cacheattrs(ARMCacheAttrs s1, ARMCacheAttrs s2)
+{
+    uint8_t s1lo = extract32(s1.attrs, 0, 4), s2lo = extract32(s2.attrs, 0, 4);
+    uint8_t s1hi = extract32(s1.attrs, 4, 4), s2hi = extract32(s2.attrs, 4, 4);
+    ARMCacheAttrs ret;
+
+    /* Combine shareability attributes (table D4-43) */
+    if (s1.shareability == 2 || s2.shareability == 2) {
+        /* if either are outer-shareable, the result is outer-shareable */
+        ret.shareability = 2;
+    } else if (s1.shareability == 3 || s2.shareability == 3) {
+        /* if either are inner-shareable, the result is inner-shareable */
+        ret.shareability = 3;
+    } else {
+        /* both non-shareable */
+        ret.shareability = 0;
+    }
+
+    /* Combine memory type and cacheability attributes */
+    if (s1hi == 0 || s2hi == 0) {
+        /* Device has precedence over normal */
+        if (s1lo == 0 || s2lo == 0) {
+            /* nGnRnE has precedence over anything */
+            ret.attrs = 0;
+        } else if (s1lo == 4 || s2lo == 4) {
+            /* non-Reordering has precedence over Reordering */
+            ret.attrs = 4;  /* nGnRE */
+        } else if (s1lo == 8 || s2lo == 8) {
+            /* non-Gathering has precedence over Gathering */
+            ret.attrs = 8;  /* nGRE */
+        } else {
+            ret.attrs = 0xc; /* GRE */
+        }
+
+        /* Any location for which the resultant memory type is any
+         * type of Device memory is always treated as Outer Shareable.
+         */
+        ret.shareability = 2;
+    } else { /* Normal memory */
+        /* Outer/inner cacheability combine independently */
+        ret.attrs = combine_cacheattr_nibble(s1hi, s2hi) << 4
+                  | combine_cacheattr_nibble(s1lo, s2lo);
+
+        if (ret.attrs == 0x44) {
+            /* Any location for which the resultant memory type is Normal
+             * Inner Non-cacheable, Outer Non-cacheable is always treated
+             * as Outer Shareable.
+             */
+            ret.shareability = 2;
+        }
+    }
+
+    return ret;
+}
+
+
 /* get_phys_addr - get the physical address for this virtual address
  *
  * Find the physical address corresponding to the given virtual address,
@@ -9514,12 +9629,14 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
  * @prot: set to the permissions for the page containing phys_ptr
  * @page_size: set to the size of the page containing phys_ptr
  * @fsr: set to the DFSR/IFSR value on failure
+ * @fi: set to fault info if the translation fails
+ * @cacheattrs: (if non-NULL) set to the cacheability/shareability attributes
  */
 static bool get_phys_addr(CPUARMState *env, target_ulong address,
                           MMUAccessType access_type, ARMMMUIdx mmu_idx,
                           hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                           target_ulong *page_size, uint32_t *fsr,
-                          ARMMMUFaultInfo *fi)
+                          ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
         /* Call ourselves recursively to do the stage 1 and then stage 2
@@ -9529,10 +9646,11 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
             hwaddr ipa;
             int s2_prot;
             int ret;
+            ARMCacheAttrs cacheattrs2 = {};
 
             ret = get_phys_addr(env, address, access_type,
                                 stage_1_mmu_idx(mmu_idx), &ipa, attrs,
-                                prot, page_size, fsr, fi);
+                                prot, page_size, fsr, fi, cacheattrs);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_S2NS)) {
@@ -9543,10 +9661,17 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
             /* S1 is done. Now do S2 translation.  */
             ret = get_phys_addr_lpae(env, ipa, access_type, ARMMMUIdx_S2NS,
                                      phys_ptr, attrs, &s2_prot,
-                                     page_size, fsr, fi);
+                                     page_size, fsr, fi,
+                                     cacheattrs != NULL ? &cacheattrs2 : NULL);
             fi->s2addr = ipa;
             /* Combine the S1 and S2 perms.  */
             *prot &= s2_prot;
+
+            /* Combine the S1 and S2 cache attributes, if needed */
+            if (!ret && cacheattrs != NULL) {
+                *cacheattrs = combine_cacheattrs(*cacheattrs, cacheattrs2);
+            }
+
             return ret;
         } else {
             /*
@@ -9617,7 +9742,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx, phys_ptr,
-                                  attrs, prot, page_size, fsr, fi);
+                                  attrs, prot, page_size, fsr, fi, cacheattrs);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx, phys_ptr,
                                 attrs, prot, page_size, fsr, fi);
@@ -9645,7 +9770,7 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
 
     ret = get_phys_addr(env, address, access_type,
                         core_to_arm_mmu_idx(env, mmu_idx), &phys_addr,
-                        &attrs, &prot, &page_size, fsr, fi);
+                        &attrs, &prot, &page_size, fsr, fi, NULL);
     if (!ret) {
         /* Map a single [sub]page.  */
         phys_addr &= TARGET_PAGE_MASK;
@@ -9674,7 +9799,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     *attrs = (MemTxAttrs) {};
 
     ret = get_phys_addr(env, addr, 0, mmu_idx, &phys_addr,
-                        attrs, &prot, &page_size, &fsr, &fi);
+                        attrs, &prot, &page_size, &fsr, &fi, NULL);
 
     if (ret) {
         return -1;
-- 
2.14.2

