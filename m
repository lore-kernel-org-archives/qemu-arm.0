Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2147798njc;
        Mon, 22 Jul 2024 14:21:43 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVKNdoaYLs/V76nWNrKsatJmVCe/VKgcKy2wp8K/9tLfoLxl/nVbBfiKMKWV0O1qMmbyZcfLweGTJ/IUfPkwx53Gd8mmQa6
X-Google-Smtp-Source: AGHT+IEnEpaw0F8XHaBvLUih2cNV8NjGKOaZ14r++0pJe1KjUXNtBxKUeyMuaiuOtE+AwWk6LMf1
X-Received: by 2002:a05:620a:1a2a:b0:79f:c9e:6269 with SMTP id af79cd13be357-7a1a134edecmr1181919585a.37.1721683303631;
        Mon, 22 Jul 2024 14:21:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721683303; cv=pass;
        d=google.com; s=arc-20160816;
        b=OQZuFnxvcnOJzuPseRqsNvKRbDEe85WuauhihAkdj5vQBVi9wCRCNAK37BfS71EYo1
         Lkoj9zZt+ET1reYhS3YiICnjrYRn0h1dV/Pk24jOC+f1vXnDCmKl0KHgh2BD37nROwXq
         ADG+IWw046Je0ui4tHMf0kXZpDh627shT4VSkpnPb/lzTZvA6A0vk9A9MM8Lg2KchKmB
         Lj+P2+sJmNrd66d3wFnjusGso4+wTHEypNFUZJixfC2e+X70Kze0i7ecSil3JkPvC6rD
         7DPVvo0plA39EUiCVy3DxAeH0La1jMJp3Hjf1JhZSrhjsCU3PCTl32al4Yj2RvmSdlPC
         ge7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:stx-hosted-ironport-oubound
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:stx-internal-mailhost:dkim-signature:dkim-signature;
        bh=A179VPXGLTzv702eJVCmkatbkViD6f5vOzPZVbEPaJw=;
        fh=05o7vBlqC97vBQuCK2H/b3eVBEhZXkR1o36jA+exk68=;
        b=KaywbIMqrHIyzT0+83xBU5yQG468dQdKFKDSFH2QZFcn4MpaPIGQc6Mm87utZf2fVU
         HE6+UCXw/QFU8/6IYeZwjfGBnjNPQv01p+26y9PfsBDui6WhbTPVX8lH74PL1fcfxUpo
         jpbPNf5K5GsWQ9K6D2rM/CS89wGaz52K+y1Bofd6Iq+WOIyqLj0l04t1UT0IJ+sdc6sr
         NeDeSm64CGnzxiEejbrog8NLJtO8q403cyCl8Kkn2+xoL6r5PXKiKyIIoOKOIX7QU5bu
         Qot1gK9U2V9OMKK6laeRPdDHHEA68qsxbc2xN/vWcbRVFhH9FA8QkxF/DQ588EpO0H0m
         jgdw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@seagate.com header.s=stxiport header.b=AmmVcsYp;
       dkim=pass header.i=@seagate.com header.s=selector1 header.b=hxpbaKE5;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=seagate.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a198f97a22si852874285a.146.2024.07.22.14.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@seagate.com header.s=stxiport header.b=AmmVcsYp;
       dkim=pass header.i=@seagate.com header.s=selector1 header.b=hxpbaKE5;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=seagate.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW0T2-0001Pm-Sd; Mon, 22 Jul 2024 17:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.zeise@seagate.com>)
 id 1sVzTb-0001IW-9x; Mon, 22 Jul 2024 16:17:43 -0400
Received: from esa.hc4959-67.iphmx.com ([139.138.35.140])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alejandro.zeise@seagate.com>)
 id 1sVzTZ-0004GF-3q; Mon, 22 Jul 2024 16:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
 t=1721679461; x=1753215461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JeWcHfxuB9tMvRhIB4zLWCe87SUjBozSUW8p3S0abTo=;
 b=AmmVcsYpHR330kiZFeQLMDyCB/HCBz6f9EHqaClFudfjHwdZQ1xydkLg
 jQcKnjtVsy18KYcoBXYFvwO2N1R1f+GcKO+SEFqjdq2b9AaGrgGy1l/U7
 TvzZy4Sxo3wQrpPGswiBiMwN26fP1SdYL44tEvC3jdd6AA7yGWJEp/e6c Y=;
X-CSE-ConnectionGUID: ZDBGZgquTdmtls7NGN0PZA==
X-CSE-MsgGUID: 9Nn+jfbmRdqmfyCDXQ5wKQ==
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc4959-67.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 13:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTvAIuSvwDrHtEaXNj+QhylVFaMcD6j8OPmWNJXQUZ7DL35y2NYJegfQ5exwtZchRNG4S14r8I0gqH/UAgLGP7L/WYybY7nMV04KdliXSV7bF+Ebn32XRFDYy2Uux2PWy1hSgrYJIfC+wj9vHikH0893XxNvRF8jgWoNTIIOAMWlqFU9Hj5wZZmgt9SDfmZ8j1QydUFEHSkHZSl3c9/BQYrUDE0ecaeRslfsL52LwNqtGH/nygob3k5FgTIvaGteTbHLpdwkJRWxX7JZsS5fl4+n22QoeDJd7bSVMo9CDoLrX2eOOMwNYfhxFyA8gK++sad5/oAyfQlvyqJ/XzUfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A179VPXGLTzv702eJVCmkatbkViD6f5vOzPZVbEPaJw=;
 b=Uh9mCjaGXqr18gU8Or6MEmOxRa+9qaPpmzQKOSZguRV7VJEeJiPYsEkEFiLQtlJwtS+S+G57GEwNwT935tpaNAX78lW8oIUPl46hYc81hwRH/T5qvbo2tE6q/FpOiWprL8TUbY7N4kkU1ZyoGFAAMYnDkYVBIkzL8izpUSsESJYy/enT/COZvOAvCjVtzP/iOM34MS463TOb2Vk260pFm50Yrrv1RSf0D4ZY20TsZRszL62KbgonWTDYic/lm18DYDkeOXHpccNENbwaVOwF3AxZjYJuTddqbezOF3CrmMMvxMhyh1XUvnjHYILvgOSJRniQcqvCpECydaCfWHdDZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 192.55.16.50) smtp.rcpttodomain=nongnu.org smtp.mailfrom=seagate.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=seagate.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A179VPXGLTzv702eJVCmkatbkViD6f5vOzPZVbEPaJw=;
 b=hxpbaKE5o4fP8gEjC1T6BO54p9xqysP6mqFMmFClU+rX1Rz3EenN/x6qboIAZtN4/9h20glWDmBjtJXmsmHLxhUGvsnOTSBmIGoFX+cLMJ00mH1G1ymi69yLKLRxEXxvodIHMz5M5P199X12GTL5tP1HCmwEWoDQtM2RbqPdYRk=
Received: from SJ0PR13CA0170.namprd13.prod.outlook.com (2603:10b6:a03:2c7::25)
 by DM4PR20MB5653.namprd20.prod.outlook.com (2603:10b6:8:10e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Mon, 22 Jul
 2024 20:17:33 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::83) by SJ0PR13CA0170.outlook.office365.com
 (2603:10b6:a03:2c7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Mon, 22 Jul 2024 20:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 192.55.16.50)
 smtp.mailfrom=seagate.com;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=seagate.com;
Received: from sgspzesaa001.seagate.com (192.55.16.50) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Mon, 22 Jul 2024 20:17:32 +0000
X-CSE-ConnectionGUID: YjR65jPQToe0hrMffFfACg==
X-CSE-MsgGUID: KzAIiQKnQ2uwhYq1wkiB4g==
Received: from sgspiesaa002.seagate.com ([10.4.144.53])
 by sgspzesaa001.seagate.com with ESMTP; 22 Jul 2024 13:10:32 -0700
X-CSE-ConnectionGUID: sMnYaiqGSPa5zU2kpgylxA==
X-CSE-MsgGUID: wHzYaPfnRCCfDQSG6rjOQQ==
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; d="scan'208";a="121301623"
STX-Internal-Mailhost: TRUE
Received: from unknown (HELO cortana..) ([10.4.50.11])
 by sgspiesaa002.seagate.com with ESMTP; 22 Jul 2024 13:17:26 -0700
From: Alejandro Zeise <alejandro.zeise@seagate.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alejandro.zeise@seagate.com, clg@kaod.org,
 peter.maydell@linaro.org, berrange@redhat.com
Subject: [PATCH 0/2] hw/misc/aspeed_hace: Fix SG Accumulative Hash Calculations
Date: Mon, 22 Jul 2024 20:15:22 +0000
Message-Id: <20240722201524.822730-1-alejandro.zeise@seagate.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|DM4PR20MB5653:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4a737e55-1a02-4bbd-c72d-08dcaa8b51dc
STX-Hosted-IronPort-Oubound: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SDjvZCTd1+RKDrNAO1gOAI1UKEGYMRjYVeFDDsM9XgNxzHIopaqgFz2WmS6w?=
 =?us-ascii?Q?1PLVpw7S1Bh7vKoSV0equ4Kd1QtvNw8hMsYF7btvXUvk7IUFxWLy9L4rtyno?=
 =?us-ascii?Q?32R8tYHVwCwMHZzFNhY32qmdSjvqyzdc6Y8WlWCdTvnY0SbOIzUfpv6cuopG?=
 =?us-ascii?Q?JkybfRxnxy+FY49/33bmFgNP8XIyXwPTztcoKWXQPVSTr6vB5hBepPGDPbHz?=
 =?us-ascii?Q?yvKmmDvppsFNYa47p63yf3+WjnxdtHHBx7ka5qGL3kUfYxAGyHKhjlEmym2I?=
 =?us-ascii?Q?PDTps5GCWRcW1CpW8DFStanDChizmv0N5R7eCkdhoBi9BDOAZ60JnmrgX3vg?=
 =?us-ascii?Q?zNxwsdQyONh+do1CG1Swp0WGa0SoiMaJF24zuNKHk2stscjxY4TUBs49+c+c?=
 =?us-ascii?Q?1CRmo7e5vveamjtxemIavyVoSuA9Hf3El6Q7c2pIi3bfCH9Lgp3t9L87czOH?=
 =?us-ascii?Q?v+QtIqBtp4TTgmz7zXo82cx6c8HbqMypdx3CcAQWv2RjsMq9visxmvdrajqi?=
 =?us-ascii?Q?To6CneL5Xxs6mN4/yM8L6XEPEqJBeT5UOyNblldqvyetijcD2NPcS9rEDoWZ?=
 =?us-ascii?Q?orggKy0rXorM1gtRXgVmf3oDV2NLFq4KuJZZcQFVrKbmC+BPk7tSYvpXujY9?=
 =?us-ascii?Q?YGCp68TQ77sZrfnYbCtaW/SkTJA5UnfUk77LI8VI3+kvLUrjy1y27wOd7Gtg?=
 =?us-ascii?Q?7fp8oYSvbCFhf2O7zAWWhWFE7BynKcblMDDgJ4XVpRxb8ngdzZ4mH7fvi2V7?=
 =?us-ascii?Q?VppaRIVVBt5pYQRVuoUopCOZsvFh7bgZF+tdhMaKYwKmS6txkv8SpEpeDev1?=
 =?us-ascii?Q?Y3zHZ702zfviezKD/MX8W/ZiNTHn8CAOO7RYBSdNouJGMlCws7Wg0CWPtNoV?=
 =?us-ascii?Q?XlOs+6PMbNCgAbyrwpFBemxXZ99+AUIBQ4Y0qhpleHpbk8V3/5JynIxOUTMZ?=
 =?us-ascii?Q?JQzZL0ukK+xwZwW9UpjRAK35SJxI3+tXxUjuwZw/+ZxGu6bC1ZgI5hhGUxPd?=
 =?us-ascii?Q?aH3hZR/+VtQDWO3I7nmqw3f0nWx83S79rJuIVAnVla9UkLYXQ7p/UELp6ypM?=
 =?us-ascii?Q?MqQlErCp9wpVUN1wfn2U+ZqkHaGJXJuo7Xr9bIDx86OI7G587dhCJQrBQdtJ?=
 =?us-ascii?Q?iF02F/CZ2+AqrdYOGdd24Yxa4GabT6tp3sfAqp4/8QzRSFjp3P4T1PeDteGA?=
 =?us-ascii?Q?515gehWmV+iG8JRkH6VCRN8ilqOYtl3ap1/SUB65MTVsCqz4GgmABfGRiFs1?=
 =?us-ascii?Q?VdzIMPIYKyb9fhmHWC17JdyIeLNjh5GxguGtN/Jis4NLZu4iLWBFxPiMN9Bf?=
 =?us-ascii?Q?0J3LghvoKuqbK2OmGrdJrLtVSXcd10DnBcO9mNVzLqnHBFpk3fd5gI6zm6no?=
 =?us-ascii?Q?tDwo1BlV61xTYbB+4OZvEKumN5fmny53JMctGk9LidU2ZAC+TB1bYisSD316?=
 =?us-ascii?Q?uVMBStf7UNcB8swYSUFBXNWJfVEHBPwE?=
X-Forefront-Antispam-Report: CIP:192.55.16.50; CTRY:SG; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:sgspzesaa001.seagate.com; PTR:InfoDomainNonexistent;
 CAT:NONE; SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: gkm/VK5QRRsVibpfwBR0NS/iGJ+B4rk2yOlSQ1AJ6cnk0K7cpI6rN0PS1SjOsH3q+fjyGFPCFQF6qgqaVz6+Z0LUGnxaOsJIq7nS92zvB5e0JhYC92NQfilGTQXTg4EMg8QhkqVU9GLklbwU0hPmGGCEsf8L/AWfXJsw3UOTXbW2srnrcY8u2DQP0AxKnAeWdynnvyzb7mmoCCuNjmhOAMDge5be3whebZzJ34LODdPynci/8/YzBcDB5ity0WySrXvUAdnZoP2cMKV8yGpsR8/ArbGXLEYIiMd/KCztH6ifvEoQ1JIerwQPvl17O+BB+YiMRkyXhLTQv0W1vb4b8PIolZYuDgLBtbZ/4nZ8sGpMOaw4P/zxUZOmvE0X/bdMTB5JTbMA8VEgUQtlVhAszKKnPTgsluoimpuun30qZ0ypZVFEVB+ll0O8FdT53bffHJp1jf0qYOMhYPLbMuB4pkIr5ccICb27sg5vgwQC4x/OSGM77vnYBiocSLlBJZzHn7/5pxxH2KDG6EbaHxDOKyJbbq9EBQjvI2WuCnc6u/aCeb9iJ4peGyEsXKv4CasavTnNsVStvnspsxsIRYomc9Nj8eYhYy72WHxihvs/0J0qQqhJ5sb1TrBkk87mQVZi
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 20:17:32.1148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a737e55-1a02-4bbd-c72d-08dcaa8b51dc
X-MS-Exchange-CrossTenant-Id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d466216a-c643-434a-9c2e-057448c17cbe; Ip=[192.55.16.50];
 Helo=[sgspzesaa001.seagate.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB5653
Received-SPF: pass client-ip=139.138.35.140;
 envelope-from=alejandro.zeise@seagate.com; helo=esa.hc4959-67.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.133,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Jul 2024 17:21:11 -0400
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
X-TUID: iyGczoYm6Zx8

The goal of this patch series is to fix accumulative hashing support in the 
Aspeed HACE module. The issue that stemmed this patch was a failure to boot an
OpenBMC image using the "ast2600-evb" machine. The U-boot
2019.04 loader failed to verify image hashes.

These incorrect image hashes given by the HACE to the U-boot guest are due to 
an oversight in the HACE module. Previously when operating in 
scatter-gather accumulative mode, the HACE would cache the address provided by 
the guest which contained the source data. However, there was no deep copy, 
so when HACE generated the digest upon the reception of the final accumulative chunk 
the digest was incorrect, as the addresses provided had their regions overwritten
by that time.

This fix consists of two main steps:
* Add an accumulative hashing function to the qcrypto library
* Modify the HACE module to use the accumulative hashing functions

All the crypto library backends (nettle, gnutls, etc.) support accumulative hashing,
so it was trivial to create wrappers for those functions.


Alejandro Zeise (2):
  crypto: add support for accumulative hashing
  hw/misc/aspeed_hace: Fix SG Accumulative hashing

 crypto/hash-gcrypt.c          | 105 ++++++++++++++++++++++++++++++++++
 crypto/hash-glib.c            |  89 ++++++++++++++++++++++++++++
 crypto/hash-gnutls.c          |  82 ++++++++++++++++++++++++++
 crypto/hash-nettle.c          |  93 ++++++++++++++++++++++++++++++
 crypto/hash.c                 |  42 ++++++++++++++
 crypto/hashpriv.h             |  11 ++++
 hw/misc/aspeed_hace.c         |  91 +++++++++++++++--------------
 include/crypto/hash.h         |  65 +++++++++++++++++++++
 include/hw/misc/aspeed_hace.h |   4 ++
 9 files changed, 538 insertions(+), 44 deletions(-)

-- 
2.34.1

