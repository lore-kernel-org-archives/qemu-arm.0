Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp134717njb;
        Fri, 23 Aug 2024 04:04:37 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX9B8Tm1oKdeTpKTv2htqauqrWyQo3l2zfYhFEdec91nozBdJfV4eptM/zKorR0p2JSZX5nFhMMH/SseA==@linaro.org
X-Google-Smtp-Source: AGHT+IFSJxYFvmqvB/dOO0ju51/nHM4NJtqIjZkzTl46G8WDCySJ/Xs45/Mfhq9KpI4UnOl/IkLV
X-Received: by 2002:a05:622a:22a0:b0:453:5e0e:980c with SMTP id d75a77b69052e-455095e4040mr19098291cf.1.1724411077176;
        Fri, 23 Aug 2024 04:04:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1724411077; cv=pass;
        d=google.com; s=arc-20160816;
        b=B8CKlKeK2Q8KeBiTB8pvntENLMN8KmimBjEl4QvjuyNGO4XP1xHWUyOVaSj+A09l8x
         8q/kqIrkBwboPni24grW6pJivNSPaaaChKiN5k1feyL67wwbR7QWmuZ8G8+hfqNZn+7e
         i4/FnNkx2RegvC166A8wKrylCKGztjit18FZEF9q4jSLGm9WuqpiN918gtCcuscmGXSN
         valOYGnSHlJVFJrPMSY0Z3K8nRjAplO6dsEkpYShU0u5/rnjukXdwEkjfc8G33HgqN6E
         rmnK68bLUUe435nWvh7YbgAbWFHR0Htn85cJ25L6HW+NVJmpo+7701qvyARJgZCcEHAr
         JZiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from;
        bh=FzxH5X+32xRrw4I4+OLF9DJdKtLOWNhJB41gb/C45Gc=;
        fh=BPqx+tT0l4/T42nLjlbaMbNPkbDvuI5V4MIQ4GAZFPU=;
        b=zur+43HQgnciOPmfE+vMraISUUaW4/EAQISs8x7tKP9kRBNb9uxnHffal1c7X/UF7Z
         Ytmcczec/AWGf/VBAdcvGUQycaD17xT4duJvIP0xxh8DXhO66CpzTc/kwaAVPv55CmKp
         VqY/F/o8bjc5vI3GWQQqCmiytgJ4gGpWMs4I43rZHi7kQiWNE2W+wvm7uHNUKY7toCc9
         OGO+1y5D1K3cnLfpsgQNZzNkbzZRiD7pJSkGyAuVQlWN519cHMYwFB9mIHFWRlBWK++h
         Snxzr5f/D8ZEvn9NVmVwS6vlNpACXYZz//cJbJHJFV+bbrram8jM46tJW7723j4gsYKN
         TTUg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=starfivetech.com dkim=pass dkdomain=starfivetech.com dmarc=pass fromdomain=starfivetech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe1dd76asi36415181cf.397.2024.08.23.04.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2024 04:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=starfivetech.com dkim=pass dkdomain=starfivetech.com dmarc=pass fromdomain=starfivetech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shS5T-0001ac-St; Fri, 23 Aug 2024 07:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1shS5S-0001Z4-Tc; Fri, 23 Aug 2024 07:04:10 -0400
Received: from mail-sh0chn02on20726.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::726]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1shS5P-0003L3-HJ; Fri, 23 Aug 2024 07:04:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcurrHJKsVZg80WlVgV9ZobUUB8di3XvYdbvRvRFK7zgP5zgnJyPctKPIVZr6GU/lfqzUw4UNYupM4SC4oYD0VHOnsAOpKY5L/zooH727SMa+BOVQ62kWsJO8xlEBeBt1TI56NWW/0vNzouJy1rB+WpvQVo4GvhPPuWYfZ/U4nALCOa09F/W8XSoqDFxVZ0nAKDdk2NWWxOiciT5kbD2pdaU3o21lsJeBBWOfrSPsfBvzsZLw37JZWtivNUkmmmnZJdrPr0a2lJ1Nt63A4aRknBFnO2Piv70ZL7szXSDNyAIL7hicKUFn3JRqHhxUBssPra/4ocPSq0C/EjROophWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzxH5X+32xRrw4I4+OLF9DJdKtLOWNhJB41gb/C45Gc=;
 b=Tl2n0MDvuf4/Aq6hHYr6Oa8ol5QiVG8VqGGJF2I/CPjK/KilkbklxDhT/4CBTaw/FWUft/zCYTLvMeWdnPDeUH/zdc919+QIpBmSDB0dm/jNxquuY2edL1hOvmzLXBfU4ruBpGWYAk0ArfQmgacuVs0Y66QYO0p0S2ND4RFz6QC0U5Fpv3amsuIWrIcgvHLEMzij/AHvmtpmM6ChH+tgfzJAfS1KpTOcfegAd/TrtfS07ax9J9ZuVJlsNmQnoqngujpO9fy/rp70wGbhl5F5NoKDHWGDULY5yvzryDPO1oMUbO8DarXaNC4RzKOAhSe61KS3kY7fWOdOqN+qbMS46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::10) by NT0PR01MB1327.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:10::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Fri, 23 Aug
 2024 11:03:28 +0000
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 ([fe80::affa:7fe4:57c8:11ce]) by
 NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn ([fe80::affa:7fe4:57c8:11ce%5])
 with mapi id 15.20.7897.014; Fri, 23 Aug 2024 11:03:28 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, jeeheng.sia@starfivetech.com,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: [PATCH v4 1/3] qtest: allow SPCR acpi table changes
Date: Fri, 23 Aug 2024 04:02:59 -0700
Message-Id: <20240823110301.161588-2-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823110301.161588-1-jeeheng.sia@starfivetech.com>
References: <20240823110301.161588-1-jeeheng.sia@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0021.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::33) To NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1278:EE_|NT0PR01MB1327:EE_
X-MS-Office365-Filtering-Correlation-Id: 060ed151-2d82-4024-b843-08dcc3633774
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|41320700013|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: T9JvSxLfYjj21v49US3zRwk/Cd2y/Wc5npM5cl7vWqT32HsEdhAlXKs+Xyh75//rZ07SL5PaGrrWg2Y9TlFh4KugMXLiNn/lIxiaDOoBd5QPm0f3SUmgzBihPxhYdOAW79tZ5qkLJxFx9Ou2yXBj1W8UaO1Igr67iSrsttiWBYzvjMLCM3ssJE9zUgq/ef89P30bZDYnmlRF6Yc3ijoBEY4AXPWw5MyBCtqKzHtMVJPzye/bBqoV88vv/DI00qjdiT/a6r13en7QOP4jfH58rXkZhq4K8Lb8aB8VvuEMYo6SENKsFwHoZA+yMmrtyw2btqQ9d70/sWepRgGiZs3mC0FAbQLZQ5j67mTrMFwXz3fEFlTjhki2slSFDkzuAh+HwQqe/fR+uxgnktLS/Bn341mTVTvKfr80Zd9PnuZ6sg4VO+4rIG1FFvf4Fl0rtaLUrx9aNQ+HNyyUDrl/dErH6NTMaItjBPh9PpNzSBZT5TElAPp1eAzysn9cQGclFccgEfg/VJnnAfE8bWn3Ow/g3bJXF09O1xxv/CgA7U4JFN5HeWlghnIJ81uhctrWBx1z+KnCbYjpiFeq06j0eYG3sW1EWnQCig+ylRBc2qOp1qPwCfTjnjW07SIhdpfMDj7A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(41320700013)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?osyS14/YZUOpyW5pz31VfG29tFfuS2+ivvKqgUl4AXzXhUX/gDdAg+q6ZNrU?=
 =?us-ascii?Q?vhE84j+uctOftFbsXQtMuFZv/8fj7jhtUdGdKxr26eCfB9hhIW5MZXFu3cqZ?=
 =?us-ascii?Q?1YcYIrPIFunz1hOBtGyB8KnYmv4RJFlci0erpNoNWQlnulHiWudzAGcvVHKg?=
 =?us-ascii?Q?wR/K92iPMV7MbboluQSRqHz3QqIsbFDj/9w7V6G6S7MXVfPUQiZ8BU+X7RE4?=
 =?us-ascii?Q?XSiCA3cDJrZciDHv81HxuWPSG+ECe3+/DmaO/qYs6QRq9u9Bx3hoQlJkUaQm?=
 =?us-ascii?Q?Mvzq8q99Ei5rUJCRghAtDTM1ibY4SrADvMqOBmerrjBWI2IWY3FARnvF6KOF?=
 =?us-ascii?Q?E2ite9FUeyQ8+oAFFwHOQy85IPVywOIg6AMRF8nEMNR9fnbLwZSAa4kN/XpN?=
 =?us-ascii?Q?1di+RswPIXa64xq4dOp2EP+7Nlhas9gxvnQjUeLw8jdehQlB3w/QANOPRh5M?=
 =?us-ascii?Q?itY8DuIVXWxdFei3+sKD5Je8YkanyHSlG37ZVt+uSj0tnwiqjHUD04V6ubb5?=
 =?us-ascii?Q?BThBZrSKigM5Nc/2wJLzxnLzdEkHlIl6iwkVp5CKpXfGI14Fi8i9KaIJHfOS?=
 =?us-ascii?Q?HHH8HrpFBHzclohgefvHPTh7tATqaT+lBTAh7g025QKscES1Z5ZHZYjI/bW4?=
 =?us-ascii?Q?XmIkCsn/yKdS48UENtW0lTRbziawma8DMKf9oEQxHG8x/edbBO/SzytPEzlc?=
 =?us-ascii?Q?dPSohUUmj4NBfkVm29+K5amIWTv8onrsizqwMU0mzieZ6Jel8gxTazM/dTFy?=
 =?us-ascii?Q?r4a2G9o2+q0Sg7wLR6jaQuc6aQWTXJkp0/WLP3jNrUIPRUgrjnTPDsRH9wqe?=
 =?us-ascii?Q?am4ws7o8oY8GB9+v8UBNN4nsCLWPsGkjuRPUf9lMblceqZE8ZF0bW8a+7ObQ?=
 =?us-ascii?Q?Iub95eMkJnPNx5Fq38+IfILg5C18zjPqA0KUg3rGEYOrr15mpS6nqNjB4Tp0?=
 =?us-ascii?Q?vP6NztxREfr9jjLHeH2dOOd/dyIp6Zc00bxdGuxaQ5GdCbNncDOPr/sgXu+T?=
 =?us-ascii?Q?/WpOHbbKvl31Nf3Ad64Sk1ZNtez3qhsqSVCwBfrhLnE7GESWHO+elRXgUUUS?=
 =?us-ascii?Q?nj6Hy1yjXW0ll5J27yUS+9TZFxgOs9L0IFE2/Ha5FAWjelluKP40Vw7z39Zq?=
 =?us-ascii?Q?TJujpztE0JQSPJUBZ9W1b/vVPIpMpbQDrWPBziRlSyHesZQwfadLrg7vrzTB?=
 =?us-ascii?Q?gzMYEt2RwNqijux6HArBCz7oBojF5VwFP1H0PlngfQcKXpevLW8KX4bNg8Cv?=
 =?us-ascii?Q?4AwkdG3NibvpQuv0lcrXjW5PwmDHf137tWL+ihGYYO1XCzr9Z8iG/iw1ihfb?=
 =?us-ascii?Q?n7M/yll9hX3qg4/IUaw7MdEqvHqVQ19QKQTCKwYirrMpiCVsSY5aOU2potiV?=
 =?us-ascii?Q?7GBpr1hkfFqp7DO+egIwcPYKfr7TgpTBYYX50gs2XvRaQJsfVTMwLvKCKJlm?=
 =?us-ascii?Q?2Kt96i9Pyr2COj4eoaaKfkb+RddZ4wbqJLg+5pypHOV2Cs5y+299Fqrc9uFr?=
 =?us-ascii?Q?tTHkXUuuJ1h9kF6boZaQyqSmWw4wlCZ1+d2tEYWC5+3/1tt+yCPAtB5LeNvE?=
 =?us-ascii?Q?v3DX4AtS6k9+q+cUdR4AninZhDPNiD1fR7eL4pJovp8xpD1ZlsK+c/sGbrZ2?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060ed151-2d82-4024-b843-08dcc3633774
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 11:03:28.1400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2KLEeIF9yQ9uwJLkKDCw+e0TIIblF+K6kXsm0oK1gYzDUhjIQlwaYRGINLlb5QHEdYKfOXcJMjv/nks2JjkTeKTKf2dzWdcmUp9pnXIhPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1327
Received-SPF: pass client-ip=2406:e500:4420:2::726;
 envelope-from=jeeheng.sia@starfivetech.com;
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9Py2vItJDdzX

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..aae973048a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/riscv64/virt/SPCR",
-- 
2.34.1

