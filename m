Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp1581211ejb;
        Sun, 19 Nov 2023 05:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1RQwgcvQUVXqGY5R88a+Hq4BwWoyVt7vD+tgazZ6djIaRWAsx7yktNBkGPF7MDx45xUji
X-Received: by 2002:a05:622a:1a1c:b0:417:b7c7:5a2b with SMTP id f28-20020a05622a1a1c00b00417b7c75a2bmr6828083qtb.37.1700398995425;
        Sun, 19 Nov 2023 05:03:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700398995; cv=pass;
        d=google.com; s=arc-20160816;
        b=FCROpXrI2Z/my2LV5XEaWRE4u0fOFIgBkBEqUH5X0HyFCPRqYD5Kus51RtKKhX+a2p
         i6kGUA8ndsBZPzMGRY4Rr9/mNGwyGcnBRTJfkVeLgXtPqmtrY9/YiQsiG4ytJdjso3ak
         +ineB63Ye0Z5+Lym8GkdQSYro1NKI57OOjZZKXStm/Mcu9q4oczxpqf5+wQyHbUvZY+V
         aOT+ys1+ozQEfqqz26a7aMP+aYPzxnKZNTskAOX10ceAOQW2fWfZ68Z1SauGCjqW6jh7
         6j3wttQ3M69KKoZfH1aO7gt+VShA0ESxwPHEGQW4XGfzLIkTxAUvjWAziWRC5qnEAIBT
         LIXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=duUDQnY66DsNvyGH43IH4W8haYyMsDcyyXxxk9X1ivw=;
        fh=QuMBvl7k6nIp7+Vaasb1ZwEBxjvdReWA3HcvIChG86w=;
        b=bNNhngtt2gfvm6k/ccVrWcxGwK0gSU03DC4L/G/AHmsMPOn4nj772EVTpYJq+nI9OD
         acZO4/U8+S+pgg/+RIGmHXv/rXo2pXxiZcv0eRuabIrp6WUdqfKRFbWi6TYD+p4BJM//
         /nMKcsPKda6zYIIPWWFoS7K59/AgbsPdMscVlf/MNn3t5AHfVI9lesZ890rwULfKGxLK
         fERkSQWf/FejVZV7+wHF65cvvNvJw4W+8spFNeRE1iZS9TagtO2RQjRCsFsPfH2cjbbN
         3ntdm0Rp4PCERIvPzxglO/2/idW/cglEA/ugTkZDHgTkFiPgNgvW0ElTYd/XqE56XRwp
         1V9Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=RsOgS5F1;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19-20020ac87e93000000b00421f70251e2si5545183qtj.804.2023.11.19.05.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Nov 2023 05:03:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@Nvidia.com header.s=selector2 header.b=RsOgS5F1;
       arc=pass (i=1 spf=pass spfdomain=nvidia.com dmarc=pass fromdomain=nvidia.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=nvidia.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r4hRK-00063f-Hs; Sun, 19 Nov 2023 08:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankita@nvidia.com>)
 id 1r4hR1-0005w7-JV; Sun, 19 Nov 2023 08:02:06 -0500
Received: from mail-dm6nam11on20618.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::618]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ankita@nvidia.com>)
 id 1r4hQx-0006gH-AU; Sun, 19 Nov 2023 08:01:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0tWtA3nzb2RhTG15LjJMhnSvNwUYpkNaQ9I5yt+6lgNWt01226cPoj6o5xUzbiCeA0VGxPgKeeIwPSDQWvLQFdH9WHNRHHAilckoJSvCWaWfKqq3Xc9sG6JMbBXuZ3Rj4mMOJJL6vR0viuAyLX747icaJY690mhbg2NrekySuWKd89KsrFA5RRCWXTHsTMS8BHpH8VZYsYiD+OAtBwk8YJEPq2Te0ZM3IOW+Nb2DQcn1OFjq7kp61u01icvoKeRwkwZmyWACPt5fy4O7h3XOrJROk3b+Lwlsv6ZtIlClAB/o2tFZkpH9mnqOEwcYhyCAqHalinjchZaz2K8hVzJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duUDQnY66DsNvyGH43IH4W8haYyMsDcyyXxxk9X1ivw=;
 b=X34rbBYteP1OcaycT1GqkV5Zu+/vKqmGvtdAeyJQL9Td+cAo/VpRjwAE8PwxA/xnhUXpIRJupAiZpLAneQKXvPdo6AmT1Izn9ayMsd/UYrF8ap3ZaypfpeYr4x2GHSS0gf6Jqpko1pqwHqGgKjkLbQNcYxFniv2NCWOOc+CLIylxJAnANwgs97eNWviK6qeRvf/Dl5xdCJqr/8Xb/TvNoi9opP5y3daonbv8K60qNgjhohyjfD8bcmv4XrzGeuHLe12tMZCes9ztQxXPbm7Pr/AO5MJxxEI3CDyrpiOdBLEwuKYU1ti/f94uqx2VkewvwxEYty4y5Zqh3shiIs43PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duUDQnY66DsNvyGH43IH4W8haYyMsDcyyXxxk9X1ivw=;
 b=RsOgS5F1V4X9RcccGEcB2T+GWw+yKeY+idE616w/p8i6MWFnLQ8PT/ZZ8br/QIl/d3qsK9rOkStJ8mS9z2GjjaekylIwh2f1NU0d0eTJNoIMjkdYQURqTFESxMnhQ6O94O86x7ysnV+aG2RP6iXMugAyC29H9vRaZcRN/VUQ7yu2QAMdi3NppOG4bn8/PHnDaceamTDnNhtNSoYnFUbIFGu9U0IMbcv8fj4HwkkBgXCzXdmGbqvs/Mf/BRyGQI33Ad9Su17fPYCM7UXnBTkk5zLYngBhNLE4Kl0JajDdnq99Ra49xboeFFypsxM2sFR8fdp6WbR5hrf1Bn8ZvG8ktg==
Received: from CYXPR02CA0014.namprd02.prod.outlook.com (2603:10b6:930:cf::20)
 by DS7PR12MB8230.namprd12.prod.outlook.com (2603:10b6:8:ed::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.26; Sun, 19 Nov 2023 13:01:50 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:930:cf:cafe::db) by CYXPR02CA0014.outlook.office365.com
 (2603:10b6:930:cf::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26 via Frontend
 Transport; Sun, 19 Nov 2023 13:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Sun, 19 Nov 2023 13:01:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sun, 19 Nov
 2023 05:01:38 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sun, 19 Nov
 2023 05:01:37 -0800
Received: from sgarnayak-dt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41 via Frontend
 Transport; Sun, 19 Nov 2023 05:01:30 -0800
From: <ankita@nvidia.com>
To: <ankita@nvidia.com>, <jgg@nvidia.com>, <alex.williamson@redhat.com>,
 <clg@redhat.com>, <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
 <ani@anisinha.ca>, <berrange@redhat.com>, <eduardo@habkost.net>,
 <imammedo@redhat.com>, <mst@redhat.com>, <eblake@redhat.com>,
 <armbru@redhat.com>, <david@redhat.com>, <gshan@redhat.com>,
 <Jonathan.Cameron@huawei.com>
CC: <aniketa@nvidia.com>, <cjia@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <vsethi@nvidia.com>, <acurrid@nvidia.com>,
 <dnigam@nvidia.com>, <udhoke@nvidia.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: [PATCH v4 2/2] hw/acpi: Implement the SRAT GI affinity structure
Date: Sun, 19 Nov 2023 18:31:11 +0530
Message-ID: <20231119130111.761-3-ankita@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231119130111.761-1-ankita@nvidia.com>
References: <20231119130111.761-1-ankita@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DS7PR12MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6dad11-53a8-4b82-8f57-08dbe8ffb1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E0nL3OflOVVFtteR5LAe2ri+CE6wt1OC+gp/DVUKX+wM9TLtC/313jAdpZs8vwJV8t7bA466d+taMRZ/s7Hy5rn89b/8ihQ3H9bsWCPu1PLzCWaNB++D71qsbten3CvbHxoySGCaqMln+V4j6c0XwyNEiqXjO3JJKInoAwY0/J/a1zNQTriVgAgcFGjwhAjOJ6Av4FwM05StYpFMycR70HnFVNfp++O+T/t456+/XrqA3qcUMRDEz+5IEjkXFWjn4PE2ue0fLdSuhaMGUhqe4miyKeKunMsZPmdB82+J3o6fuL1tlqkCAhjB4jGNL0qSf2uBH46UaJEEwmn24In5sy94boV5DWYBlNglfUXQ0FS9HOac0VjDrZXbtv/K74eGyTTFYZ2ZB0R28BGiKxD9ZnDhAnijbwErkty9u1bJkfqXR78OuRSgYRrf7Bove3nqk6xQv90VYKpC3h87OKPsUSGSJdBvuyRrjMeIOvn+JCCvNzJP3kV7H/0E8SsF2l4pLR5zkzzKeWmnYP6isxhKesGCMLW5gxL4JNomH3sdCVGX/9N9M+Rnqy/FD47SiDolnRuGYM74FSZT/7EGUMNIeiKA27qMIkt0YXQVpCZKp1fBcF4+KkCh6Q5fVnLnlyCO45DzvCzecaOGS9HxPY7RN78+enM+YTDElMmqiv8bxYJyLUdleYb1uz6Zn4GZ439zAi1lthLmVUcK73k1ZESJ4tAipb6WzB5ejeWZOsEEzJJBpaDBZcrheornNOj+vGYlHVE9ekKLxF4JJmP9uKpeBw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(82310400011)(1800799012)(451199024)(64100799003)(186009)(46966006)(36840700001)(40470700004)(2876002)(5660300002)(7416002)(2906002)(316002)(4326008)(8676002)(8936002)(41300700001)(70206006)(54906003)(70586007)(110136005)(26005)(6666004)(478600001)(1076003)(7696005)(40480700001)(2616005)(36756003)(336012)(426003)(86362001)(82740400003)(921008)(40460700003)(47076005)(7636003)(356005)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2023 13:01:49.9584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6dad11-53a8-4b82-8f57-08dbe8ffb1d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8230
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::618;
 envelope-from=ankita@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VEVii8qjHfcY

From: Ankit Agrawal <ankita@nvidia.com>

ACPI spec provides a scheme to associate "Generic Initiators" [1]
(e.g. heterogeneous processors and accelerators, GPUs, and I/O devices with
integrated compute or DMA engines GPUs) with Proximity Domains. This is
achieved using Generic Initiator Affinity Structure in SRAT. During bootup,
Linux kernel parse the ACPI SRAT to determine the PXM ids and create a NUMA
node for each unique PXM ID encountered. Qemu currently do not implement
these structures while building SRAT.

Add GI structures while building VM ACPI SRAT. The association between
devices and nodes are stored using acpi-generic-initiator object. Lookup
presence of all such objects and use them to build these structures.

The structure needs a PCI device handle [2] that consists of the device BDF.
The vfio-pci device corresponding to the acpi-generic-initiator object is
located to determine the BDF.

[1] ACPI Spec 6.3, Section 5.2.16.6
[2] ACPI Spec 6.3, Table 5.80

Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
---
 hw/acpi/acpi-generic-initiator.c         | 100 +++++++++++++++++++++++
 hw/arm/virt-acpi-build.c                 |   3 +
 include/hw/acpi/acpi-generic-initiator.h |  26 ++++++
 3 files changed, 129 insertions(+)

diff --git a/hw/acpi/acpi-generic-initiator.c b/hw/acpi/acpi-generic-initiator.c
index 5ea51cb81e..a9222438ec 100644
--- a/hw/acpi/acpi-generic-initiator.c
+++ b/hw/acpi/acpi-generic-initiator.c
@@ -16,6 +16,7 @@
 #include "hw/pci/pci_device.h"
 #include "sysemu/numa.h"
 #include "hw/acpi/acpi-generic-initiator.h"
+#include "qemu/error-report.h"
 
 OBJECT_DEFINE_TYPE_WITH_INTERFACES(AcpiGenericInitiator, acpi_generic_initiator,
                    ACPI_GENERIC_INITIATOR, OBJECT,
@@ -82,3 +83,102 @@ static void acpi_generic_initiator_class_init(ObjectClass *oc, void *data)
         acpi_generic_initiator_set_host_nodes,
         NULL, NULL);
 }
+
+static int acpi_generic_initiator_list(Object *obj, void *opaque)
+{
+    GSList **list = opaque;
+
+    if (object_dynamic_cast(obj, TYPE_ACPI_GENERIC_INITIATOR)) {
+        *list = g_slist_append(*list, ACPI_GENERIC_INITIATOR(obj));
+    }
+
+    object_child_foreach(obj, acpi_generic_initiator_list, opaque);
+    return 0;
+}
+
+/*
+ * Identify Generic Initiator objects and link them into the list which is
+ * returned to the caller.
+ *
+ * Note: it is the caller's responsibility to free the list to avoid
+ * memory leak.
+ */
+static GSList *acpi_generic_initiator_get_list(void)
+{
+    GSList *list = NULL;
+
+    object_child_foreach(object_get_root(), acpi_generic_initiator_list, &list);
+    return list;
+}
+
+/*
+ * ACPI 6.3:
+ * Table 5-78 Generic Initiator Affinity Structure
+ */
+static
+void build_srat_generic_pci_initiator_affinity(GArray *table_data, int node,
+                                               PCIDeviceHandle *handle)
+{
+    uint8_t index;
+
+    build_append_int_noprefix(table_data, 5, 1);  /* Type */
+    build_append_int_noprefix(table_data, 32, 1); /* Length */
+    build_append_int_noprefix(table_data, 0, 1);  /* Reserved */
+    build_append_int_noprefix(table_data, 1, 1);  /* Device Handle Type: PCI */
+    build_append_int_noprefix(table_data, node, 4);  /* Proximity Domain */
+
+    /* Device Handle - PCI */
+    build_append_int_noprefix(table_data, handle->segment, 2);
+    build_append_int_noprefix(table_data, handle->bdf, 2);
+    for (index = 0; index < 12; index++) {
+        build_append_int_noprefix(table_data, 0, 1);
+    }
+
+    build_append_int_noprefix(table_data, GEN_AFFINITY_ENABLED, 4); /* Flags */
+    build_append_int_noprefix(table_data, 0, 4);     /* Reserved */
+}
+
+void build_srat_generic_pci_initiator(GArray *table_data)
+{
+    GSList *gi_list, *list = acpi_generic_initiator_get_list();
+    AcpiGenericInitiator *gi;
+
+    for (gi_list = list; gi_list; gi_list = gi_list->next) {
+        Object *o;
+        uint16List *l;
+        PCIDevice *pci_dev;
+        bool node_specified = false;
+
+        gi = gi_list->data;
+
+        /* User fails to provide a device. */
+        g_assert(gi->device);
+
+        o = object_resolve_path_type(gi->device, TYPE_PCI_DEVICE, NULL);
+        if (!o) {
+            error_printf("Specified device must be a PCI device.\n");
+            g_assert(o);
+        }
+        pci_dev = PCI_DEVICE(o);
+
+        for (l = gi->nodelist; l; l = l->next) {
+            PCIDeviceHandle dev_handle;
+            dev_handle.segment = 0;
+            dev_handle.bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)),
+                                                       pci_dev->devfn);
+            build_srat_generic_pci_initiator_affinity(table_data,
+                                                      l->value, &dev_handle);
+            node_specified = true;
+        }
+
+        if (!node_specified) {
+            error_report("Generic Initiator device 0:%x:%x.%x has no associated"
+                         " NUMA node.", pci_bus_num(pci_get_bus(pci_dev)),
+                         PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn));
+            error_printf("Specify NUMA node with -nodelist option.\n");
+            g_assert(node_specified);
+        }
+    }
+
+    g_slist_free(list);
+}
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8bc35a483c..00d77327e0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -58,6 +58,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/viot.h"
+#include "hw/acpi/acpi-generic-initiator.h"
 
 #define ARM_SPI_BASE 32
 
@@ -558,6 +559,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
     }
 
+    build_srat_generic_pci_initiator(table_data);
+
     if (ms->nvdimms_state->is_enabled) {
         nvdimm_build_srat(table_data);
     }
diff --git a/include/hw/acpi/acpi-generic-initiator.h b/include/hw/acpi/acpi-generic-initiator.h
index db3ed02c80..6fdaf887cd 100644
--- a/include/hw/acpi/acpi-generic-initiator.h
+++ b/include/hw/acpi/acpi-generic-initiator.h
@@ -27,4 +27,30 @@ typedef struct AcpiGenericInitiatorClass {
         ObjectClass parent_class;
 } AcpiGenericInitiatorClass;
 
+/*
+ * ACPI 6.3:
+ * Table 5-81 Flags – Generic Initiator Affinity Structure
+ */
+typedef enum {
+    GEN_AFFINITY_ENABLED = (1 << 0), /*
+                                      * If clear, the OSPM ignores the contents
+                                      * of the Generic Initiator/Port Affinity
+                                      * Structure. This allows system firmware
+                                      * to populate the SRAT with a static
+                                      * number of structures, but only enable
+                                      * them as necessary.
+                                      */
+} GenericAffinityFlags;
+
+/*
+ * ACPI 6.3:
+ * Table 5-80 Device Handle - PCI
+ */
+typedef struct PCIDeviceHandle {
+    uint16_t segment;
+    uint16_t bdf;
+} PCIDeviceHandle;
+
+void build_srat_generic_pci_initiator(GArray *table_data);
+
 #endif
-- 
2.34.1

