Received: by 2002:a05:7022:6282:b0:8f:43c:4b5e with SMTP id e2csp1297001dle;
        Sun, 27 Oct 2024 18:59:06 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWLmI48//kDsxaMNqy1qA9sfyhy9SWm7ll273VVKmMP7J2/9/CK/b7npoW0u6rvcj6oEbwirUNoeBXvFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHlo21V7hqLMU+fPJtpJXL8NWxOGVJexwXvDfKxyURP/eutHIzRFsrDlaEX5EOdmN7cdHvM
X-Received: by 2002:a05:6214:3103:b0:6cb:f2d9:80c2 with SMTP id 6a1803df08f44-6d185860f81mr110510546d6.52.1730080746517;
        Sun, 27 Oct 2024 18:59:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1730080746; cv=pass;
        d=google.com; s=arc-20240605;
        b=BvGkWAaE/N0EpKEJibydfW1juTYdNPaXZdbygHj98pkp63TaWtifaOr0Giq9bQ2vrF
         vUk7fj6LOZQ2keqF0FxcZJwOBs079krZhYC4Ce4t9l88F1J21SMY4sG5t03lvGTUQyIE
         Zq26wT/fkCntajwgFMzZKp5OyrgxUP+ju4DLh5O49nPCg2Y4BFhyQVvAK/veS3U4Tzmj
         tnK6w1icIBR402Ij8Op/9c5HxXUIAwMLGXZci20/MWwGQ1MCDughk/sbsr4l0JWnvba9
         XP4un2anz+79EhWpKwSxa38+VWM0dk6sT/sGsWL8gXimyEPxMPvIvAqBRwFrb9UgrJbc
         vlBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from;
        bh=Nc19MmBYw6Vx2TYDeNGr+OaoONIwYD2PizJpxZnmVMQ=;
        fh=uf0XvGG3Kcf7B+FVAL559gqBT1eJPX6RS/VDAzwQdLQ=;
        b=Ez1wGblmjFuYs4cFF/Hsow2Z/J0ezWv5PKH3yDT83NmQKhJwlz0AGA7b+vEBwo/G6k
         V4Nz28jRRuRDBnyr+Y7tFP/n+UtlrJrCK9BQswEHDOuSPtcumMnFPjRrlGeHQ19STqZ4
         QVU9i8Uvrcfqn92zIK5Jba/H5Yd8FKhipWB41wPX6rcPphTHhe06ZKUCiGJGT/VPr5/3
         dU5PBtQGYo3I9BzJwEi2Th4gZgimNGy0QWtqvJ5YiiJfcJzsnfk1LQWFB4FGpGKFlBpk
         FSr2PU0u0TMGAWb7d9IwKrB9tYjt39cwm8uSZqV2UF+NZwxpgMqC+kLSEzoFBdrjc9Bh
         ib9A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=starfivetech.com dkim=pass dkdomain=starfivetech.com dmarc=pass fromdomain=starfivetech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a11d0esi74581086d6.275.2024.10.27.18.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Oct 2024 18:59:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=starfivetech.com dkim=pass dkdomain=starfivetech.com dmarc=pass fromdomain=starfivetech.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5F1N-0002jr-Hv; Sun, 27 Oct 2024 21:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1t5F1M-0002jB-Dr; Sun, 27 Oct 2024 21:58:16 -0400
Received: from mail-bjschn02on20701.outbound.protection.partner.outlook.cn
 ([2406:e500:4440:2::701]
 helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1t5F1K-0007Ma-Qo; Sun, 27 Oct 2024 21:58:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjZUvgdiksopPZUHEMx3W5WgxRhczgp95xmCFkHbOgWW6I+b3ebbgfWvS+U+fXShiCXPDSYBPHs5hm72OHdHK16VmB1QpuADLvMbMKpKIuUBdMOaAc7h7cz/0vtJVGIeIXRwghTWqr/mpHNHV+fkN9kyJtbVdlJ2NZd/mmWqujTNEvl526cll72bLyKrOyzcgzTju9NhRaNB78NHMKiwd1vbiZFq2vzfbsDyIR2zDYLxK6InJ0omCs/cwR3Mzm7jWiozyo0dmnaAv89H1phWwwZPiIklBbd+HuDP993kEf+iAR285gtpuB8rrxaXsviWXRn5RbRFzMvoGUFRgYS2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nc19MmBYw6Vx2TYDeNGr+OaoONIwYD2PizJpxZnmVMQ=;
 b=C1GPpvtlflJLN7pspzlk1NeUamm7AmmkshpKZ1ZcHeRpC+XFuRdUmz0/XdKiAmzqC22OBUeIeRAGnTIFTN8SgUmJ10YJ7qbqZHl9jlHbvtdGOJfUj8Md37lOVYIL1Z6vnJnINioWWjlzeaTaYjqbHLbfLJD/wXCln01rl3aEiew+4ew0M35FENEZbDtkA2Ejz6phLyHaZughvm1lTuYA7RV3FcQUQ3foVKQYkMwHzf0SPLo4VGyOQd1exRsCWiriSzxUGOeXupAUPNCa6unTGRgCLVbA3HjS5790n9xV6Es35s6wlw2qQhZygqGy8qNGzkM7RNT1Hh7ZeZzWKW606g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::10) by NT0PR01MB1263.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.34; Mon, 28 Oct
 2024 01:58:10 +0000
Received: from NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 ([fe80::affa:7fe4:57c8:11ce]) by
 NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn ([fe80::affa:7fe4:57c8:11ce%6])
 with mapi id 15.20.8069.031; Mon, 28 Oct 2024 01:58:10 +0000
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, jeeheng.sia@starfivetech.com,
 shannon.zhaosl@gmail.com, sunilvl@ventanamicro.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, maobibo@loongson.cn
Subject: [PATCH v6 1/3] qtest: allow SPCR acpi table changes
Date: Sun, 27 Oct 2024 18:57:42 -0700
Message-ID: <20241028015744.624943-2-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028015744.624943-1-jeeheng.sia@starfivetech.com>
References: <20241028015744.624943-1-jeeheng.sia@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0024.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::8) To NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:12::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1278:EE_|NT0PR01MB1263:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc88187-db58-4503-ec1b-08dcf6f3f927
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|366016|41320700013|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: o4iG6wQMkiAYjNjprd3cjepT3gz74JP58qvlfnphscWFcTUmhOW7F03Z3dQ161kR3LJVi8mdoe+RHBDV0hKKnz982kHIshgaCK06LOE7mSU/PL/mpq3lIw0SPCdEir3mKk3q/h/9QqASYNRbL+rz49WO9TNgWQ2KtOgUufBcEMlJ0bmv3BKKTrJP5yaQAZika+3vNpDpqqsstSJCZgJ3Mktbl4pzWQaL0YE4PBwBlqQN0Uc6SOAY6/j1QooVsLRJmGCrdSqOEIFMZW1oet64gsQZPtCoDxmIlS3dG22QACkPFfAmw5BpqT4WNLAU3VQkzkOy3Hg1aBmJbH3xLFZyUTyAZiV2YDi+LlvLOAMPsLTiXM0XK+DueleEJP0qQRyRWSrjY5z+oM2CaAIOVOBCHBvHw87Cpxdcb5/kIZyqQB9ZMzRDkgh+wRVCxPNt45DqLiGxuY3LF5QAKCSpomJEMUa/7oUgIENhhb2NIt3WApwgcFuCS+4nk+r9P7R5cJ6rLE4aoKwhAZ1RmukOh8J3HfYUq7alTLcu5hiqBPAkAUrX7zzD9Uil3RNGvp1PoJD2QjvSvjmnS8Hys3QAflDzfvsk+4hiKGpj1+d+7ml1W6dZoBzXn4PzgzERCMPiNEKl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(366016)(41320700013)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uGAwT9KEubI9jxz9FiH8uEQvC7DbppGX0KPOw8lvAglk8LJD8iM3exyd/6X3?=
 =?us-ascii?Q?nEDOWKu8D2GWdNQ2/MKH3sPvlkxQ+ZAJbKbBKpwZauz+pv7CbK+BUOo5/mBV?=
 =?us-ascii?Q?0D37HyZJjhSTOJklj1Dyue9KsAaQgR6Vii8RoOZau1wD6jt9ONea0OMjidXr?=
 =?us-ascii?Q?uHecflzP/+kbokP26+cL7oBL8voSzbFX7nDZzbnW+YhMPXjd7Z1n7OztJL9R?=
 =?us-ascii?Q?M3Mnw8yKHhk6M8NHjg/50o1pqG4hdwcG5I400VnMBzsikn79j03ffMfyzlf2?=
 =?us-ascii?Q?dAwcx4OaTyEngupQeNU3ADnYkT0cfkmHFwV0IW/M0XQpFsSEpd7Goaa1+ui5?=
 =?us-ascii?Q?LlhWZX5mEZifiYij/uO7dwlR04CDNZ+b7lBsJIJJ+hjhymg8RJKAeWje2yC5?=
 =?us-ascii?Q?Nm09BukEr8rEr/ZCYsi8kFhuLaSEE1ExFOcGXLsfDUOnr6iLUKymQj75XzdA?=
 =?us-ascii?Q?cKYI+tLInVc10KwD35tntqWN4LsrbWthpZwpWXfu+KYJHZRSIfgtJ7TMpK7v?=
 =?us-ascii?Q?WbpkBzw9OnAwuB45qm6XQAYzVoMGSHLWiUZor51zfb5nYhm4itgvppMnGyZb?=
 =?us-ascii?Q?nQS7Q9O9RMgckMIU8rugLO8SLFQktOk1Hi+isHM2BlHX0dihe5aRugeUqdoT?=
 =?us-ascii?Q?Mb7eE8WeVLrfqirHxZvZ8HVgSt4jBqB6DPnIgP0L4Sw/gBhM/WnjcM/6QH1c?=
 =?us-ascii?Q?j3jyrZpWe8RH1H6zCfHVNGtOQJ1sRi8xDEtstBnwbw0nXpgnj/Opy/ywnDKT?=
 =?us-ascii?Q?+Uyppt0NPRLo9NApjrSzjvACDjkzcY6opC/UmuL8GzVYtjkrCvsCXLJt4CbD?=
 =?us-ascii?Q?24DDXy3NL9nHyEFGmMhSjIMBIK8psKZTB8LpF0BiRv/zHLL8rrDfG36w/UPF?=
 =?us-ascii?Q?3rrLbKVgmr6ERltFTthkfipChx0N8QNpolfIEy21eBeAtO0J0LcNZeh6og9d?=
 =?us-ascii?Q?KJ2mN4hI60MWyXsS1bL4Egesrne92HwGGmuXUYUVoIXoEdLQsnoUD/XD1MNZ?=
 =?us-ascii?Q?P/kvoBLhBjzrndbKgeSQDr8BPwb7UETPevtQmR6rbKmIcHiphxWU4EVaWaw0?=
 =?us-ascii?Q?TwRa1MZiHlhd/AeOFA614ccUMkLBLQfLNGAGzzfQJWHT3+U5iCGFcXutf4Nl?=
 =?us-ascii?Q?6fC25gVp9YhHjojjw2sizAJk6Q2C9buOy0SOWqPEAXyH7KOnajEUgBrg7EXU?=
 =?us-ascii?Q?tmcGaUBAWTO2wL+4C8GBTz9ejrTD8qhQaeJJYo7WeP5tfK2OmzK5DSHoskjN?=
 =?us-ascii?Q?XtU48VM4UssyV9dEUabbgj72WxVtfEIvxoGzrnsa3VgN7WTB/PKUur3BYIfW?=
 =?us-ascii?Q?dIy+eSHTJGGWjycJZ6hyp6b60NOX5bLTL6QFjozpGirxyLLmjXfSm99L9Hlu?=
 =?us-ascii?Q?Rix8yULmR8mwLtsPiUvfSLDqosCdiWnnj+5HgaN6EcTrqnZKhgsywYsh/CeW?=
 =?us-ascii?Q?VsmnbNTjVTjUgdGuom7jJCqconXDOh4H8Z/UTOBwbW4g2YiJrgItsi0ngx/G?=
 =?us-ascii?Q?fdffoA38CvdxzARbpyIwiaIada6YOt05RQy/Inl4QxnkWkD2jmnxjrqgkVOi?=
 =?us-ascii?Q?2PnmFxTbggwtwuz0jL6cOFirKuasmkDI5JA6gHpqaJWY2E3L6X9AsluNxxFT?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc88187-db58-4503-ec1b-08dcf6f3f927
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1278.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 01:58:09.9541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hdxy9iKmqrH25DuxkdyvLAr8rwa7AYJojabN3IqcpOJxdA9ellShpSjE5z+jaJZxagoBa4j/3+rbgwMpOIS4BCUm1rkRSIyjMcznwWYa6zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1263
Received-SPF: pass client-ip=2406:e500:4440:2::701;
 envelope-from=jeeheng.sia@starfivetech.com;
 helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AAvxwT/L5cf3

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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
2.43.0

