Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp397042ejb;
        Thu, 13 Jun 2024 08:37:20 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXqchg8O5O37qhRFCgPOEvuXHItahBTHtWQBzfK3PHNSm0IMn6JBlasvFusDlIQIem6ctFx4C8qzhqH+yGw5Qcu6yhaO2TD
X-Google-Smtp-Source: AGHT+IFFuGOxu/9oPmTw5H2QMhgMaufltGWFnCgSZNPi9wCSC9QgJe5KpyoKRgdqajp0NWvOcT+D
X-Received: by 2002:ac8:5904:0:b0:43a:88a2:ac90 with SMTP id d75a77b69052e-4415abf3443mr49996831cf.34.1718293039799;
        Thu, 13 Jun 2024 08:37:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1718293039; cv=pass;
        d=google.com; s=arc-20160816;
        b=rriHGqQbT+LA3ehHRdPE0esdn/MghaGf0AiV8MYtbXoHsam1OYvgNElbQXOCe+CxvO
         8sKKw/N37Y2sbhFSHCyFvdnX966Iqx7+AuBvSFlDuGBpprlInUm5tn9Q+wpfFqjOCIE5
         4ZE1QOhslK5OWo1ZR9C9ngkaaViMJZPSiGlBRXU2sgu/c7JcL4po4ZFh0A3NJrDF3eXF
         SpDOCpyDxf2VTuAQSodYuSM0T5SMn9lpALUc5UvNyCKHhCeccSyJI1xJ0U5J7HP4wW/S
         5LMCI3CCascY2SWcSn28HN2AxW7cAUkatdDIbAXwsZ82SltvOprYOgZuLIXf98/hSlIg
         S7mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=sx+87Euc8K6Ro+2KOhGWrVzLRMbpMKS5YOVkOwn9+Jw=;
        fh=LqL0MeKR05BYRXDYDe/G+OCbmQbay5ogiXyqdwRBFmQ=;
        b=SnBP/xBd1oJ9To8MfZYnE4u8ijlzm9QrffULU51ynjzFgQwESfKlpmj11hWmX3aZd9
         7jqqkcbGYKUnQK/RyKShrMdr5WG6a53ObZz13+BpX56SKakob3SpHuE28boBDYttNKoP
         F2l02X6Q7v7If8Crqwu19JoEZZcA4iUa6X1Dvfd/6OkJ0rkTF36neFpRjrLNhIoqkR3n
         sGmhWGWpZ7SBrh2BVRv5iAiMck2zCAOZJHLQ8AGuM5WJvBXoJwHfEmySo35b2uwJzZhP
         Z3Rfq3PZXkies4c3Yr8OKJmuJYOnvf/8tXBhH+2iFb4wbpdcHsPe8UtK+bgTnyPi+ATo
         +khw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=qWM4Ul2r;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2fdfa0bsi15886771cf.521.2024.06.13.08.37.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2024 08:37:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=qWM4Ul2r;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHmVb-0000cc-FB; Thu, 13 Jun 2024 11:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sai.pavan.boddu@amd.com>)
 id 1sHmVa-0000bn-Dd; Thu, 13 Jun 2024 11:37:02 -0400
Received: from mail-dm3nam02on20600.outbound.protection.outlook.com
 ([2a01:111:f403:2405::600]
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sai.pavan.boddu@amd.com>)
 id 1sHmVW-0001yR-93; Thu, 13 Jun 2024 11:37:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XubbGdUKZ9TLxjTn35PbA9Je0a0MwCtMqHpr02ICO4DnFOgTEdYFOZaNP/oJTi1H7smrbfX/bSj+qc0E3BCUDMOoIi4qhhBPsscxxcE+QnL3NtqUk0p4crBDDfwTTTCTZ9Csa1Yp55vp4PV8i7BC13B8vYUxqB0JSH7akYjV40yaSOtYO5AHE6Y+kMNtvj14WjxgJfqGlUTqCw+B4Nps1xG+ias8PZzx0GINVqejjd6MldM1AjkwKnmVoGIvbDxVyIf7IlYzdMtCDVvk4jFrMdGyy+SON19nLlMj92FHubXDjllbYpTKPZpEH0I90x1kRx1gI1f8+n/FyvV3ukXOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sx+87Euc8K6Ro+2KOhGWrVzLRMbpMKS5YOVkOwn9+Jw=;
 b=hhqRwSAtAfUfmMjl5nyGmvrAz7QUH6MfQBCMMuli5mAM6GFinEJ59RadvteT6a6U9rs4u3FJp2HylMRd29XkOkWadUw0baRBbJE2d/O7OKk5SYTr7qkRDJLdmGxtYGzoZiR8e4H06ThQgj1jaJJLskA835CLic56MS+aKsKMEZYrnM+IlTduBVoWX82wPegKPn27/czb4W+JhXI/wPkhY6ICnzLBW9FnVZ7S29EdK/M/xitjUBH1b9Wcxfx4qoG9dsGRMAbAfEfqS9uKJYS96C+vRDJBrtV1XkNSgmdWwmUT0nLZxc5O1ckRKhXuo0XZKUSipm7gC2WywGzLroWKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sx+87Euc8K6Ro+2KOhGWrVzLRMbpMKS5YOVkOwn9+Jw=;
 b=qWM4Ul2rTpFLQs5skG6ljkXQAOsgAPOeJhZFSwTnJLMwX3ygjLqKEpjYc2kFAjTUPQ0v3vXtLqFIM8LO/Nk7zt4NCRD8UKygyFD93U1ax8W7O7JMXbh2vZYxyMibZKKgaeAEFx0U1kEX58T5Frac+oQ3PUjuZZTGiDKZwdcP3G8=
Received: from SA9P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::15)
 by SA1PR12MB6678.namprd12.prod.outlook.com (2603:10b6:806:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 15:36:50 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:25:cafe::59) by SA9P221CA0010.outlook.office365.com
 (2603:10b6:806:25::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Thu, 13 Jun 2024 15:36:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 15:36:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 10:36:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Jun
 2024 10:36:47 -0500
Received: from xhdsaipava41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 13 Jun 2024 10:36:46 -0500
From: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: "'Edgar E . Iglesias'" <edgar.iglesias@gmail.com>, Alistair Francis
 <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>,
 <francisco.iglesias@amd.com>
Subject: [PATCH 0/2] Add boot-mode property for zynq
Date: Thu, 13 Jun 2024 21:06:36 +0530
Message-ID: <20240613153638.3858853-1-sai.pavan.boddu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: sai.pavan.boddu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|SA1PR12MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c17267-c426-459f-00ed-08dc8bbea455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|36860700008|82310400021|1800799019|376009; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uaCRBjtD8mygvHSPm3JmV2JRSedWK4qNK91WRAaNXN4RfsVZVaDnlQGlPI+h?=
 =?us-ascii?Q?CxWIgjRAjvJ0KCVxBGI79pIB2dXiPn+e5TAav95tltcmV3Mf39zHB9ul1l9a?=
 =?us-ascii?Q?NNE004m0B1s5cXNRR51dcVssKliBmoZzSdsdiHPJpVIlfs7fQJeGP1cr0BJN?=
 =?us-ascii?Q?2OMsXb/055vqvhAOtIJAGjJjnG0jC2h4SLt3Cs9RQNJ6ADmKWLf5cJpEV6UL?=
 =?us-ascii?Q?7OC6FjZRmUE1aEUrjeSs6Uz99uPn5dpoWdvEwDNpJjCsE92M1eak6ULD1ZeT?=
 =?us-ascii?Q?wJ5AeXx6bxB+UYE4hlo/yqxsaEsK4IlkMsTLffFklv1fFpDnWEoqvSSAo2dz?=
 =?us-ascii?Q?vlCyyk5yJoNDImjP8wlU44t4+zewiHw8vOemygG1oZz52y2F6QqUPOpNxc+k?=
 =?us-ascii?Q?vgC8Y0kg0HS7pNDQ5ZIUz4tPDGe6VKrKb/r+8knlKlvbpFsNMHlxSVvbMVuX?=
 =?us-ascii?Q?oF9jHyFP7no/kDTKD/WzxArsLJYV3r0Qsv2MBkrMJ3cXEoJgd6+ClUSUumXP?=
 =?us-ascii?Q?UgeAAcreOEAj2/P2aGjf44abd43PS2MBRv+miSilL4VTqbL9nihTF55QAyVA?=
 =?us-ascii?Q?GG5EZWnyxGmJHVmyok+Ia6vUcupeCC6gMNiW5df/wlxN0cLmhcVUspojsLWH?=
 =?us-ascii?Q?suhgJHq8Ek1+md76LKcC+GoeXMiJ7BUQPdVRkuxLClxxSZR4wGAP0W6DcAVe?=
 =?us-ascii?Q?R33IwJ3tUCkV8n8ivDV6P+vuRq6BtNRS/sjPtga2HQZ50vJuDQwvY1uYmPbB?=
 =?us-ascii?Q?THEA14ISvnDW8zYdD/lyy7eaMKgGJhWl3NkLo7SaqLCAjOD5gg+WP+S8QnAf?=
 =?us-ascii?Q?lOI1DsiTIH3XvPUZ06Sf3peMcn8Xyffrwxyco8+j51BHqYD5jfwMkGVWH2DH?=
 =?us-ascii?Q?rDFxQ4BnrATc4H6f95D/nhqgn1w8NFegrkAhQuLo3EtA7oCOtUOUoWgXbckE?=
 =?us-ascii?Q?+crXyzk2V7R+ZFIdOmJhiF4JqS0mvXgQ+y3QxRva91vjS6obi8Sg8TQvm714?=
 =?us-ascii?Q?PyIIIdCyrlG8kgDTgOhdHX6Xg0h7vSVsB0/CCaOgS4WTWqSDpscZJR2K15+z?=
 =?us-ascii?Q?nS9V7EcPMQgFOBcAmiGb4qRzAaACkjdeCDPcJ4NYhLr/RYR5Ld2P9m9XpsIL?=
 =?us-ascii?Q?1puBr5kRHO1M7sT65tkqMgIrG2pN50VBqNsod6BXmKvIQ6A2eau9PZN5XvKv?=
 =?us-ascii?Q?Sor5ohSorcDEXiqhf/4kJeDXsXyM7xuEpkI0+AhtGhl9qa/afptWCbCk9Twr?=
 =?us-ascii?Q?LAyvkzt3T0BFwUz/BKK1YIg7OuFkj3CLLQe0BwFonhrPosUZcvaucihF4Q6u?=
 =?us-ascii?Q?zjPkFVPm12UxMntQwjQQqtbeGl9Gv5s4aLK5U4gPG3LdWSVFzYv8N84B7eFy?=
 =?us-ascii?Q?E3oEHUNAWlqv3V1nLZ3uTAEya/uUkvgycUomiBNfi1pTQFxmyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230035)(36860700008)(82310400021)(1800799019)(376009); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 15:36:49.4349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c17267-c426-459f-00ed-08dc8bbea455
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6678
Received-SPF: permerror client-ip=2a01:111:f403:2405::600;
 envelope-from=sai.pavan.boddu@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) AC_FROM_MANY_DOTS=2.499, BAYES_00=-1.9,
 DKIMWL_WL_HIGH=-0.145, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: LjVvvMfaNjCj

Add a way to update the boot-mode via machine properties.

Sai Pavan Boddu (2):
  hw/misc/zynq_slcr: Add BootMode property
  hw/arm/xilinx_zynq: Add boot-mode property

 hw/arm/xilinx_zynq.c | 22 ++++++++++++++++++++++
 hw/misc/zynq_slcr.c  | 11 ++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

-- 
2.34.1

