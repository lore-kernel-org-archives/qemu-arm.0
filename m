Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3134855ejm;
        Mon, 24 Apr 2023 16:43:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350a/FO1ov0zddihOjh3YA/D3Td104ARaEfCJ2pXbT4Ot13fHysiJdMF/fa24A6Mz4faV8h6n
X-Received: by 2002:a05:6214:3014:b0:5ef:59d1:8d13 with SMTP id ke20-20020a056214301400b005ef59d18d13mr28093645qvb.8.1682379824776;
        Mon, 24 Apr 2023 16:43:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1682379824; cv=pass;
        d=google.com; s=arc-20160816;
        b=X1tcyKsS28tWqaSmorrJwiG9Kdb97buDeraqCEMu7ZmxFYKeE8XZx5lSDPUyytFrRo
         3DPh3AvLJYaWPMucB2mRh17rfYc4Dybhqwds7+uh3jwNnzWrL/QxO9UWHd/k8l9Hbzid
         mZuyj5n08yw54kHHnCfLBsmC2kjV3MZGtpSrOvL9TupjGU02IPUw0UbVHdyr4POFRQZ/
         8GSqP25nYZy5D8l5D9x5FjvrW87f/BSQzFlsm/gcatfj6AkNa0Exq4+kxUFgA4q0690k
         Ipmq4q/WKkCCeb+AgubCMSMlrMefjcVb6XMbhcmfK6H7S3y0+zueVB9mNjeOES6bW2Kt
         Pebw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:dkim-signature;
        bh=himnEKovGOfPoGKz5YIiCnN5oz0WKvAawUXP9ludGvE=;
        b=bmb0vEk/bC6DtcxGZrtzVjR/1gWDXg1fk74jaP/mddonbeQNIirnVJqe6CDrwrS94y
         dg2jsmBNfBbFmbal4lWWAqa7ipGHw/3PIOHUpQa7fB4fvtLphbpC5qDHqxH1+uwUQo+g
         ewo/H44M6oMNwzGl7LiWUrtUCfwmiU+GW6LMsOVSspuvdD2WD9y2NfZS9v6t4xQU4yo4
         pL/XfxGQejxyrrBeYR7Y9F0mLJ2w1EFbaANSxidZDbYnXla68JKaa1YqUsr5VwZdSdcb
         +dsyx6xGDt8sJoiYVyWfhfQ7sZnvvihEu9HzQILl7Dh5mJAz+Wy63H6hKGDV6lwFI/lk
         MSnQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=bn9ROvvD;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr11-20020a0562142a8b00b005ef46ceb19asi5148934qvb.393.2023.04.24.16.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 16:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=bn9ROvvD;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pr5q7-0001Nb-HF; Mon, 24 Apr 2023 19:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1pr5q6-0001NH-3D; Mon, 24 Apr 2023 19:43:22 -0400
Received: from mail-co1nam11on2062f.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::62f]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1pr5q2-0000yz-Ro; Mon, 24 Apr 2023 19:43:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mv1+PesxtF3l6NAul6RUecbZcorO+kBe/oFWYrEY2hVUaGjmvwOkDCnB05+pm8lzNQs6E/s0JWKwf2vP+0u2aE6Mxi868aJAp/mKqHqBglOJkv9NXvMsEsdvorxG11pkYggCk6kgFd76RWn9wBpot3UquI2Zr42OEvtFZojK+xRle/nSNaL+LMj1v+4iaTVMQlQo1AB2BTgGYk5YYN3ah+/AqiBX8JKtlvHvMKhWm69+ViijqHyOP3Uqjudd/sbvIe5t37jPcLpuruidqUu2ys4un/54kYylUynX5tpRlPvM+nOc3GhT1kMtgyYMFWRmE7iRNww9RFZPRDcB/5OSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=himnEKovGOfPoGKz5YIiCnN5oz0WKvAawUXP9ludGvE=;
 b=k39lxgiwo0ZPArwzG1j43eauIJ4tQh214sGn0G6w6499WsvUB3/EX2JYQpP52uZA7lQNMJV1A2Ep4txOoce7M2so2fkdZ39MAxgnQfwDxVWVruN19K6ZkRWPL8q4iBDlWoab2fHLhgpZJDRDm9uYKmqhEqzMl6WfSRQ2fcB/WE1S1XWyYG3jrLcFr1j0I1zHDn97PdWd6i8Z8e2IPKlmLHT4Bmyo5SDTHznk2K1pVmdcSpDklaEMw5S/54hiKAXF0EwllefEiC8E3da9lPOUgLTVVQ8Gy9Wm50po7N0K31otbXEDXIRqDqVoq86g4IpuYKNuILE/MoMT8/LPoy7Mug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=himnEKovGOfPoGKz5YIiCnN5oz0WKvAawUXP9ludGvE=;
 b=bn9ROvvDMdFi7yZmdbSQIHhCpLHJmPXu2WRjRdsZ5AREfjUphIIvdRgoomj6W/sYLSrLVh+Q1eODfCjemUvOnjitMFEEhnckllnCqldD3doyeuRUtb/KJtMVyKhzlJmxYBs/WBAy/T9ihKYYnVUzyPCOO7RrrovHxnUqG6pmAQAysI7i7kNkOigQLwPd8Ch8tedRU6/x+gx5vbYAF0p3PuAxjv/lJto3MHk7Vqcm/nNW832FU6cil6ne8H42nU+naoemCRFckMyr6z5f1rc/SuXwZzctq0XgLEpNe2bfNPlE0YYj0TavQBoWp7tRNu+Q7oMlZric3T51wCoD6+uQTg==
Received: from BN9PR03CA0676.namprd03.prod.outlook.com (2603:10b6:408:10e::21)
 by DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 23:43:09 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::1f) by BN9PR03CA0676.outlook.office365.com
 (2603:10b6:408:10e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 23:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.20 via Frontend Transport; Mon, 24 Apr 2023 23:43:09 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 24 Apr 2023
 16:42:57 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 24 Apr 2023 16:42:57 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37 via Frontend
 Transport; Mon, 24 Apr 2023 16:42:56 -0700
Date: Mon, 24 Apr 2023 16:42:55 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <eric.auger@redhat.com>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <jgg@nvidia.com>, <yi.l.liu@intel.com>, <kevin.tian@intel.com>
Subject: Multiple vIOMMU instance support in QEMU?
Message-ID: <ZEcT/7erkhHDaNvD@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT018:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e57340-9773-4af3-b908-08db451da92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sl8QCcEoHQ2zxsQJ85CcENOqS765kC9AGgW89I+cHnAkGkld3eBBqt7j7bdGO0Rx4PnQjywDsAymLyUj2l0ruq3CGWHQyqcYR5jkEnCmDbOcfca83MZGs0rwhzZmF4pq9YY9gke8IKWcW8ZrfYPEYunOvmLj7O1jPhMhtnkupxX8EDcqHpvzArKrgepwtRMAFRs8VkrNt/hh9W12GA6p8uOKCEeNY/XmcaWzL1EJwqEkRHTZ5WjWAJ2kXSYxCLCadfBl5x2PurfGLFDPCUGtacKslfM5wFMORuF1tBTOlEO13icaeNhyUEhPBdwYflmUAHgtSEXUlOc8G8ps508t9T1mF+Q6qXf/yyb3HKiNgeUqKP6ImbKqE7pf33S/TQuR21k3u7oJYNv9hixHqmWnwm5449R86iw3eUUgfQxa3DDBJWsKh7IfErcBbcFkft4UxmiomlenSkHHx7KbSGGVUktkfsuaVIB3MTdGJyk8NxRUhsvgwHry5HR2NIa77In0suFJc/N8VW1iG22LzEOKu8QANzoGm/x9Ft6RNS3aq/EmjG3VRHzUfWomCfYlFaSltsz9sS8RYSinFHotvXc1GjOqTR+haA2RLzquc8xINS5zJlYgZCsFkaP6MMZdgZ5x59PWvIj0Mc/AHKqdjNQVb+z+gG7fAnDbh9+YONtYSIOnKQRAV08LUd4kt/A3RBx+VpAQher/yg46m70CnLPzPVxmjvJqnWuvt/lyOzFUROE=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(36840700001)(40470700004)(9686003)(26005)(40480700001)(55016003)(426003)(336012)(34020700004)(36860700001)(47076005)(33716001)(186003)(40460700003)(356005)(7636003)(82740400003)(70206006)(478600001)(86362001)(70586007)(8676002)(8936002)(54906003)(110136005)(5660300002)(41300700001)(2906002)(82310400005)(4326008)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 23:43:09.5830 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e57340-9773-4af3-b908-08db451da92c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086
Received-SPF: softfail client-ip=2a01:111:f400:7eab::62f;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: e3k0Mw3JcVRj

Hi all,

(Please feel free to include related folks into this thread.)

In light of an ongoing nested-IOMMU support effort via IOMMUFD, we
would likely have a need of a multi-vIOMMU support in QEMU, or more
specificly a multi-vSMMU support for an underlying HW that has multi
physical SMMUs. This would be used in the following use cases.
 1) Multiple physical SMMUs with different feature bits so that one
    vSMMU enabling a nesting configuration cannot reflect properly.
 2) NVIDIA Grace CPU has a VCMDQ HW extension for SMMU CMDQ. Every
    VCMDQ HW has an MMIO region (CONS and PROD indexes) that should
    be exposed to a VM, so that a hypervisor can avoid trappings by
    using this HW accelerator for performance. However, one single
    vSMMU cannot mmap multiple MMIO regions from multiple pSMMUs.
 3) With the latest iommufd design, a single vIOMMU model shares the
    same stage-2 HW pagetable across all physical SMMUs with a shared
    VMID. Then a stage-1 pagetable invalidation (for one device) at
    the vSMMU would have to be broadcasted to all the SMMU instances,
    which would hurt the overall performance.

I previously discussed with Eric this topic in a private email. Eric
felt the difficulty of implementing this in the current QEMU system,
as it would touch different subsystems like IORT and platform device,
since the passthrough devices would be attached to different vIOMMUs.

Yet, given the situations above, it's likely the best by duplicating
the vIOMMU instance corresponding to the number of the physical SMMU
instances.

So, I am sending this email to collect opinions on this and see what
would be a potential TODO list if we decide to go on this path.

Thanks
Nicolin
