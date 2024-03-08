Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1858858ejb;
        Fri, 8 Mar 2024 06:56:10 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWrODPjc8aT+GYILZoPh5kDBbhzJWgxeWluL9/muBkqLIBfguQsUyeQQXRpTzC+gFVLgZRNcIrcrf22fh+lrWEURoLFNteV
X-Google-Smtp-Source: AGHT+IGdOm51QLwJ1sMLMuwVFlBpHSA7JYnJ2GdWVW8mtIu8qY/pQHe+Uijnfol7nyamtxSjv1kp
X-Received: by 2002:a05:620a:1253:b0:788:25f9:32e4 with SMTP id a19-20020a05620a125300b0078825f932e4mr707969qkl.27.1709909769761;
        Fri, 08 Mar 2024 06:56:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1709909769; cv=pass;
        d=google.com; s=arc-20160816;
        b=D1iBiFEVZrXHb9MOeBqPWGrHGwOQG/byEOOZOyBN5cEMpGUK4VyLn+ZqZI8EPwZgWc
         QM0WR2fIOuP3ffybZ0Gv9YfE5aABiwy6nyig1OT0/6SiSFp6aeHvxfX4iJ0eMcLNPqFd
         X717ZRJ32T2BShgla7GGjbkzaSlJxmRX04XRG1g4z8ol9aW3+kAO9gwCXew9VfzLm3Zl
         t/Tr5t6NnoPKIXK3cPIPSYCoouyrTeCmuNGvSb+SQyZcDjqIb0dj6U7OxbOlOa0olM2y
         JvmF3Cvpyqo7+bU9RLMzlomnX3pZmWlU/Z4phBWO5HWSy/zakf7zNcRJO4DtsL6fSXGE
         iAsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=L6jPjvICss2nu2OOr0jTZqDxMSs/CffHBHwj5BFthpw=;
        fh=cXfPzVeEfqtrWPBd2kb3Qo6ynz8sMCnuT2a86y+CvXk=;
        b=oRz6W0N4vS9XHoCtcOs9HORYEMVZqlA4EB7WYi7wTT0vBaY6fTHwmX+iYxdrLqMmY5
         ulxvSPlQvbIhfSXFpNAkzgUICzVI23YpzkXnZEkBhkOxZMun6FNRkfCdKTnJfaFt4Bwa
         c85HKkRroONWPXpYL5U9FeQTcfZmVpkZjXz3lfI1980rKTMvM7rHLnl2A4Ea6WgYqces
         zw+3gQHQ86zXTFeTuIxtX/EgNfsJrbjgqBbClWziGqTQ+M5u7k+CssX0auzYk/sm+ZiK
         fBLMOHa3ndXRtbgxsLx4NDsgqWcbaJWSUpPAZslHTsZeFg0BgEgSIafAgiG/4PvuiSzv
         shNQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=hxcGNEg9;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1-20020a05620a148100b00787e1927634si6649144qkj.502.2024.03.08.06.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 06:56:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=hxcGNEg9;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ribdc-0002sh-3f; Fri, 08 Mar 2024 09:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankita@nvidia.com>)
 id 1ribdV-0002qD-BM; Fri, 08 Mar 2024 09:55:50 -0500
Received: from mail-bn1nam02on20600.outbound.protection.outlook.com
 ([2a01:111:f403:2407::600]
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankita@nvidia.com>)
 id 1ribdS-0005Fm-6a; Fri, 08 Mar 2024 09:55:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeWz1dftGm3QQpR50JVl1M0IGOhfBf/Es1q/xIBs4YG1XPE15N38oVFufFz4419kiQgj/Ex17/eyIwPqNWv7E90afDo86sT4eI4Y10VAKptk+rB562hJptubnf7tF+u9uhDIj+AignyNmiUOnChOFPypabRGvPkcYt0Y+a+sl3PwNum+lqmcvK5N7aKOG97X9z3l9/Ooxs4C6KTidJnHfdlIL0PJg26znVPWr3KfC7xBs7zu8QbM9ChXCYkC69cwx3OK+6CRYcilDsSQjddLwUhagIGh2a5LX+4uvtF2VMWDklpnKF32v+gOE5NAlKQwG8hJk3+718oVVNDeOQgRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6jPjvICss2nu2OOr0jTZqDxMSs/CffHBHwj5BFthpw=;
 b=Sv75lOhnUYdxdol3UfHVmzzW888HFpNdJjqfIvyuOyDi/SjGcHIVZaW7iRPSn5S9O55wEANdOkI1iYUErEOsjUfU5p+k5KfnzIUbcUQQKeOcvhVK09+BQNdghD0bSFfA5wcYgcaF+7MBM/wrAYXD2KBZWkjXpfwO+DIucSgFQD6m3GKZROgvS8lMHo43GtvXKeS+wnSfpgpM1TVEFhO0+p3KqPqWDQuUoFDXDAdJ8t6GIr8TTIT8fzuU9Z6u9q803sfUv+DsxPQAWW/gwS4b/EKZNW2b6yozS6IR02QRH0cYc9BIpboY0grQL/jQVu0+rMOXUnGzlrTaKNaUjdHTKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6jPjvICss2nu2OOr0jTZqDxMSs/CffHBHwj5BFthpw=;
 b=hxcGNEg9HCZ5QD1Oig02snYtc/csfG9ZRvYLcMPMsPEJLSHhzM7Kc8CTdmFmHVHVSoH61XuDzIwNqRAk3M4CCQSIunrKhnM5CWw1GqGG+2HNWNrCBsWD/6D4+wODRkBL5ASEFGbFs4NwXJ/vDblJu6CxNOHjqTQ/pe1ofJ4NGVURanez73Q+nysAdyipJ84wWOQCXZfkFWEh9c7LO2aMq+kcdKjDLQ3Fx1mqZyipzlk7SkbqQi9aZ/9WEpqzU9v/lmbJ2I6ykebyUkZIWy4YOd9Woul4EDAwPty3jvihDut2A5NfZOfjFYa6TPCvoKcl7r8+Szb/J9/A5V5yEMcoOg==
Received: from MW4PR03CA0292.namprd03.prod.outlook.com (2603:10b6:303:b5::27)
 by MN2PR12MB4238.namprd12.prod.outlook.com (2603:10b6:208:199::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 14:55:38 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:303:b5:cafe::94) by MW4PR03CA0292.outlook.office365.com
 (2603:10b6:303:b5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31 via Frontend
 Transport; Fri, 8 Mar 2024 14:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 14:55:36 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 8 Mar 2024
 06:55:26 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Fri, 8 Mar 2024 06:55:26 -0800
Received: from host-10-63-191-31.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12 via Frontend
 Transport; Fri, 8 Mar 2024 06:55:25 -0800
From: <ankita@nvidia.com>
To: <ankita@nvidia.com>, <jgg@nvidia.com>, <marcel.apfelbaum@gmail.com>,
 <philmd@linaro.org>, <wangyanan55@huawei.com>, <alex.williamson@redhat.com>,
 <pbonzini@redhat.com>, <clg@redhat.com>, <shannon.zhaosl@gmail.com>,
 <peter.maydell@linaro.org>, <ani@anisinha.ca>, <berrange@redhat.com>,
 <eduardo@habkost.net>, <imammedo@redhat.com>, <mst@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <david@redhat.com>,
 <gshan@redhat.com>, <Jonathan.Cameron@huawei.com>
CC: <aniketa@nvidia.com>, <cjia@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <vsethi@nvidia.com>, <acurrid@nvidia.com>,
 <mochs@nvidia.com>, <dnigam@nvidia.com>, <udhoke@nvidia.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v9 0/3] acpi: report NUMA nodes for device memory using GI
Date: Fri, 8 Mar 2024 14:55:22 +0000
Message-ID: <20240308145525.10886-1-ankita@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|MN2PR12MB4238:EE_
X-MS-Office365-Filtering-Correlation-Id: 22902e43-27e6-4d21-2a4e-08dc3f7fd024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kp3GR7QR1y205mXYBegu8fBOahokLm845RAZaM+YlU3yRhI2STC/yWHoz9m0aevB58yaBZWrkzVMRo1TWlePTFjm4tOl9Q4ec/8qobgRZBEJG1UMRHfQbSP8m4Xsc1t9uyqoIH99BBAjMdjFyuhn1IaTYKM+GwHqzZJ8InRBVy5oml5iuPEskWcRDYoSKokMiRXBoeHdDJ8WFe193sgBmuCNrhIgfqoBsjF7XdUDHovW1ocxE8Fb66216gQ+nLNbTJWSCYtFmJRtyYS7CdyFCaKubsg+wCQaPepU7bRWokK2pozXPBgWR0gXoMGipAOd8v+IbfwEeNPBLUeyba6Ht8m10EP0Tno8qH8fDGhkDDhXAEyy/ISZEh8slBM6ditULI0jRJFMCOXZEWfyj0a3WTwd5wMHUvmocRlKbE1rW7NGIjHIBHifQKkcXTuQHW6knfBXxzk2XUWUHqJYGk4qlZOfuaml0KcS08FNc8yfX+cLmS7U9fWMi6Kw7g1yem7BealR2NoBq9AXdMmZNR63+QTb2cYRKYjkIqi08ooK52yqVotIabSzRxs41exS09hkbbK38y93DHXJVhxxNFjUsAhV/ew45AATD5XSHkYJxk2VNBZSxAkoD7pXGdth1XmzUM0Dn4WNUbewvwMJP9OXVM/OxO2LeIhOphw4+ZZMRb2IBGc3iexQV4Sn8zzwJwc4ssEQygIMGHlHfTdvcaXjDigK0ZcQHtb4Y+yH68I1o4e+IhmdKwCs7KJB9JRqrUHljBjhBTQ+K+3YSJ0KApbw8ZKwEGOUn2b64JufKRuPq5I=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(7416005)(82310400014)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 14:55:36.4414 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22902e43-27e6-4d21-2a4e-08dc3f7fd024
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4238
Received-SPF: softfail client-ip=2a01:111:f403:2407::600;
 envelope-from=ankita@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.572,
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
X-TUID: WWweVSdu/Evn

From: Ankit Agrawal <ankita@nvidia.com>

There are upcoming devices which allow CPU to cache coherently access
their memory. It is sensible to expose such memory as NUMA nodes separate
from the sysmem node to the OS. The ACPI spec provides a scheme in SRAT
called Generic Initiator Affinity Structure [1] to allow an association
between a Proximity Domain (PXM) and a Generic Initiator (GI) (e.g.
heterogeneous processors and accelerators, GPUs, and I/O devices with
integrated compute or DMA engines).

While a single node per device may cover several use cases, it is however
insufficient for a full utilization of the NVIDIA GPUs MIG
(Mult-Instance GPUs) [2] feature. The feature allows partitioning of the
GPU device resources (including device memory) into several (upto 8)
isolated instances. Each of the partitioned memory requires a dedicated NUMA
node to operate. The partitions are not fixed and they can be created/deleted
at runtime.

Linux OS does not provide a means to dynamically create/destroy NUMA nodes
and such feature implementation is expected to be non-trivial. The nodes
that OS discovers at the boot time while parsing SRAT remains fixed. So we
utilize the GI Affinity structures that allows association between nodes
and devices. Multiple GI structures per device/BDF is possible, allowing
creation of multiple nodes in the VM by exposing unique PXM in each of these
structures.

Implement the mechanism to build the GI affinity structures as Qemu currently
does not. Introduce a new acpi-generic-initiator object to allow host admin
link a device with an associated NUMA node. Qemu maintains this association
and use this object to build the requisite GI Affinity Structure.

When multiple NUMA nodes are associated with a device, it is required to
create those many number of acpi-generic-initiator objects, each representing
a unique device:node association.

Following is one of a decoded GI affinity structure in VM ACPI SRAT.
[0C8h 0200   1]                Subtable Type : 05 [Generic Initiator Affinity]
[0C9h 0201   1]                       Length : 20

[0CAh 0202   1]                    Reserved1 : 00
[0CBh 0203   1]           Device Handle Type : 01
[0CCh 0204   4]             Proximity Domain : 00000007
[0D0h 0208  16]                Device Handle : 00 00 20 00 00 00 00 00 00 00 00
00 00 00 00 00
[0E0h 0224   4]        Flags (decoded below) : 00000001
                                     Enabled : 1
[0E4h 0228   4]                    Reserved2 : 00000000

[0E8h 0232   1]                Subtable Type : 05 [Generic Initiator Affinity]
[0E9h 0233   1]                       Length : 20

On Grace Hopper systems, an admin will create a range of 8 nodes and associate
them with the device using the acpi-generic-initiator object. While a
configuration of less than 8 nodes per device is allowed, such configuration
will prevent utilization of the feature to the fullest. This setting is
applicable to all the Grace+Hopper systems. The following is an example of
the Qemu command line arguments to create 8 nodes and link them to the device
'dev0':

-numa node,nodeid=2 -numa node,nodeid=3 -numa node,nodeid=4 \
-numa node,nodeid=5 -numa node,nodeid=6 -numa node,nodeid=7 \
-numa node,nodeid=8 -numa node,nodeid=9 \
-device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.0,addr=04.0,rombar=0,id=dev0 \
-object acpi-generic-initiator,id=gi0,pci-dev=dev0,node=2 \
-object acpi-generic-initiator,id=gi1,pci-dev=dev0,node=3 \
-object acpi-generic-initiator,id=gi2,pci-dev=dev0,node=4 \
-object acpi-generic-initiator,id=gi3,pci-dev=dev0,node=5 \
-object acpi-generic-initiator,id=gi4,pci-dev=dev0,node=6 \
-object acpi-generic-initiator,id=gi5,pci-dev=dev0,node=7 \
-object acpi-generic-initiator,id=gi6,pci-dev=dev0,node=8 \
-object acpi-generic-initiator,id=gi7,pci-dev=dev0,node=9 \

The performance benefits can be realized by providing the NUMA node distances
appropriately (through libvirt tags or Qemu params). The admin can get the
distance among nodes in hardware using `numactl -H`.

This series goes along with the recenty added vfio-pci variant driver [3].

Applied over v8.2.2
base commit: 11aa0b1ff115b86160c4d37e7c37e6a6b13b77ea

[1] ACPI Spec 6.3, Section 5.2.16.6
Link: https://www.nvidia.com/en-in/technologies/multi-instance-gpu [2]
Link: https://lore.kernel.org/all/20240220115055.23546-1-ankita@nvidia.com/ [3]

Link for v8:
Link: https://lore.kernel.org/all/20240306123317.4691-1-ankita@nvidia.com/

v8 -> v9
- Removed unused included headers based on Jonathan's suggestion.
- Collected Reviewed-by from Jonathan.
- Added acpi-generic-initiator support for i386
- Moved HMAT change from patch 1/2 to 2/3.
- Fixed nits.

v7 -> v8
- Replaced the code to collect the acpi-generic-initiator objects
  with the code to use recursive helper object_child_foreach_recursive
  based on suggestion from Jonathan Cameron.
- Added sanity check for the node id passed to the
  acpi-generic-initiator object.
- Added change to use GI as HMAT initiator as per Jonathan's suggestion.
- Fixed nits pointed by Marcus and Jonathan.
- Collected Marcus' Acked-by.
- Rebased to v8.2.2.

v6 -> v7
- Updated code and the commit message to make acpi-generic-initiator
  define a 1:1 relationship between device and node based on
  Jonathan Cameron's suggestion.
- Updated commit message to include the decoded GI entry in the SRAT.
- Rebased to v8.2.1.

v5 -> v6
- Updated commit message for the [1/2] and the cover letter.
- Updated the acpi-generic-initiator object comment description for
  clarity on the input host-nodes.
- Rebased to v8.2.0-rc4.

v4 -> v5
- Removed acpi-dev option until full support.
- The NUMA nodes are saved as bitmap instead of uint16List.
- Replaced asserts to exit calls.
- Addressed other miscellaneous comments.

v3 -> v4
- changed the ':' delimited way to a uint16 array to communicate the
nodes associated with the device.
- added asserts to handle invalid inputs.
- addressed other miscellaneous v3 comments.

v2 -> v3
- changed param to accept a ':' delimited list of NUMA nodes, instead
of a range.
- Removed nvidia-acpi-generic-initiator object.
- Addressed miscellaneous comments in v2.

v1 -> v2
- Removed dependency on sysfs to communicate the feature with variant module.
- Use GI Affinity SRAT structure instead of Memory Affinity.
- No DSDT entries needed to communicate the PXM for the device. SRAT GI
structure is used instead.
- New objects introduced to establish link between device and nodes.

Ankit Agrawal (3):
  qom: new object to associate device to NUMA node
  hw/acpi: Implement the SRAT GI affinity structure
  hw/i386/acpi-build: Add support for SRAT Generic Initiator structures

 hw/acpi/acpi_generic_initiator.c         | 148 +++++++++++++++++++++++
 hw/acpi/hmat.c                           |   2 +-
 hw/acpi/meson.build                      |   1 +
 hw/arm/virt-acpi-build.c                 |   3 +
 hw/core/numa.c                           |   3 +-
 hw/i386/acpi-build.c                     |   3 +
 include/hw/acpi/acpi_generic_initiator.h |  47 +++++++
 include/sysemu/numa.h                    |   1 +
 qapi/qom.json                            |  17 +++
 9 files changed, 223 insertions(+), 2 deletions(-)
 create mode 100644 hw/acpi/acpi_generic_initiator.c
 create mode 100644 include/hw/acpi/acpi_generic_initiator.h

-- 
2.34.1

