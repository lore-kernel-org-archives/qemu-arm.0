Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp60702ejb;
        Tue, 5 Dec 2023 02:08:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2rUhEOSzpCBumMzLIE2fcxGrgx4JqKzV+pTZ9tj53umNitGcX7ROTCixGxd6Q5ayCI4mi
X-Received: by 2002:a05:622a:1ca:b0:425:4043:5f13 with SMTP id t10-20020a05622a01ca00b0042540435f13mr1383379qtw.81.1701770922054;
        Tue, 05 Dec 2023 02:08:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701770922; cv=pass;
        d=google.com; s=arc-20160816;
        b=b/T6V1IaCBmbRXBR/Zb7YVJF0HrF4h5ncOpOQJsuQdf9HEJ8PC4/gfFixDOBEQo+AK
         UEL5oVPXjEZwoYSL3SrW1W9XvosLNmph+Eaf5jzANQCZZ9dXGym1IBpKYt/H0OtT2s3+
         XmrnCpP2vLb8BqDk2zlm1WlDUhh0zMpgvtghO8h3G/D1voZC+yZ66abtXVdr7cHia+Gg
         YTCGjt8BaGIBAaeMIp6hhQjtrLFLV4bXTFXcv/kQ6LSH1pDLhOcRvw0XBFrcCnF/Rhk4
         lxlUMK2PSGfWIPnLjHAXPr0zZ4+jGKynhIf6/bWD7ewrzwI5vEU4CvAl5qEDYmrJYkju
         bRqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NNv14aJ0REm80Nw3ApfkRpR/D9RBQt469d3vbMvf6Mg=;
        fh=ZA9aJobNwvCsDIwC4jJ9MrZu+AKWwyzjuJBQaAdFiwU=;
        b=X4VlzFI+LSStgzRnOXFMEI5uqmfAr9MSmDsY9Dfffz5QSunYxcIRK8g7eJAcMTsh3y
         hNrlh6E/KsdVaJb+8RZ6lxIBZ8mHzuQkObo5v046R0iPCP1VY/dOPspBH0bRKoqii1CF
         SRHrkdshHeERE5O35/tl0c8lcXpHz1l9ujW6BtV+iMgmWNLZztSQo88BXWJTsF1cTIEw
         L86gUYq+3bUE0cO29oHk/MQ3MRX7gHs9tdVnq5HLjHZ6nX/A3PlGVFIiH+FdDZ4r+hSO
         QHuO0qzRWPTtYE1HRh9YXNvtxQEf1kw1KkverbVKSA+GFmLgakY80C6Hg+oFZODH3U+j
         uLkw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=jEC8eVfM;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020ac8064b000000b0042393a3bd3fsi10766783qth.275.2023.12.05.02.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Dec 2023 02:08:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=jEC8eVfM;
       arc=pass (i=1 spf=pass spfdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rASLo-00050H-Cp; Tue, 05 Dec 2023 05:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sai.pavan.boddu@amd.com>)
 id 1rASLj-0004ze-2o; Tue, 05 Dec 2023 05:08:19 -0500
Received: from mail-co1nam11on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::60b]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sai.pavan.boddu@amd.com>)
 id 1rASLh-0001a9-7Q; Tue, 05 Dec 2023 05:08:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GsHI6mToySkXds4I132mG9eMOv/EVqeS4rZMjOVCs31/hFtualfrzcA4gcXvFgupZtfVSA/+D6i5esEFWZHM8vyURP8/QhZd+HuGqIYx2CexEX8TF0dhFblJUv4J/q0VOjSZAQPHr9K0er9w5mtwBYTA7iZk5NMiIfJ10iIjszrmwYN3mjBaOq/ntpWWOojMDlj2CJqL5IoW68r9DPNYWn7ChLKyG8jTF3T+3GvI/a8KLJ3FWu13JrToLQFyLU1DpXetyjgwQJ99YqgOqgdkowwm8Tbgx2ohcufBspjCadGYeyIj/cwEwH12WSEkjdbB0bWc9uhGh7wWuBT05tVU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNv14aJ0REm80Nw3ApfkRpR/D9RBQt469d3vbMvf6Mg=;
 b=Wyhj2VLrJV10ZcVr1Il76v7OyqqmDXpUMe2p6ev3PcUUWfJedUWVwzlln/2n+QgCcUrVr5jDXruOOHWkzMWGbZOW/5Ki00XYeljzq+Ck8MNtqvjM17xtDxneAMW0NhCh8xaZ7eXsDvrZv2QK6Nc+tIojrjR3Q/wnX5fbPbFDFizY1OQbniR2hxTDk1IK9LuCyclHhPJ0IvpKVza/AErXQHQ0jjR5IFU5LrG5rz443UnAUXLihUmPWAQYHCnz4+o/4D1T0jnmHQRz/sFxfd+LcrNfhJPyyCBMD+no4HeFRFuJUqNMbTbsCB0ytJFSaTu8LB5WjDU87HrTRnjOV+Ls7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNv14aJ0REm80Nw3ApfkRpR/D9RBQt469d3vbMvf6Mg=;
 b=jEC8eVfMM4INYM+WhzNZb3vFLRVKowCholkid1zvi4xX0NiO6okLFmsmj4tqgsNrn1iTVczHgTY0j3+nbIfdVWKZPi9pwtjqk4JlbLHQYPbrNZ2MCpM3J2yy0mrI890JY/1F7fptVHMUgIZmBQB+UCKfJCvdg/EnGNu5WUhMZno=
Received: from DM6PR02CA0152.namprd02.prod.outlook.com (2603:10b6:5:332::19)
 by SA1PR12MB6800.namprd12.prod.outlook.com (2603:10b6:806:25c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 10:08:09 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:5:332:cafe::42) by DM6PR02CA0152.outlook.office365.com
 (2603:10b6:5:332::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Tue, 5 Dec 2023 10:08:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 10:08:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 5 Dec
 2023 04:08:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 5 Dec
 2023 02:08:06 -0800
Received: from xhdvaralaxm41.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Tue, 5 Dec 2023 04:08:04 -0600
From: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, <saipavanboddu@gmail.com>
Subject: [PATCH 0/1] versal-ospi fix
Date: Tue, 5 Dec 2023 15:38:01 +0530
Message-ID: <20231205100802.2705561-1-sai.pavan.boddu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|SA1PR12MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 1023b386-a694-495b-3659-08dbf57a1521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eWaYW3SbtkYgXN2fuD8LrPu30NsemRayeLlhfc8yfJYvmWEjHCSzGoCe3P+8Un23wbJ80eZ/EF/fTUM+0tb0VtH8qiVZN0yWleiG/z4cg4/sbX7EPLVF2uEqOwa6c5kqXaL1QhLfIfoaRaf5jWd/LQFpIQLg8ls1NasEj4vuhTmYL3EtIJZhTifqvKTbGi0SWjRjKahZE+LOzSgAAkcSF/or27Gwupn/FU7z1tAYDMq6e6RpgfRvlajdT+o0UunCAriowhtLM/QrquRugq9pU9/SJ5uX6ClKkHMFdTipTXKpYqYKPGjik9bLgKxPuLguvuq8/ZpxX+INUW4jUu9a5XL8upYkiJjnYPiRxH6gVR+z8xGKPlVT8I0h02YmMOlCwCr2Kbbfegx4umrxvEpgVwFQplgyY9AXChQ1q3Sj3kVJZVWFuOzBqcntLTTI49dyaqIkkij7FwlsU1p8XAoW1IybCyGjO2HjUtRrGHNfr3T4C3YZyamc3CiQd1f5E7Fy83ytvgIpNyn+gBnwQm5LZS1uT4+r26JTyqQ6s/1IrmSb0osbwiRy8a67+jUv7h8D5v9LKQHsMBzHiqMX9yiwroiAibNmm9pHsjnmkTU+P9QMqzwfHcW3SKVMl7Tz2f62vnyqjEgYPusO4yTXAbIvGOC9JLb2xBoT9RRo9bna8D4qEsIKtCUiA/W1zmlMbfWy54Torlmy1WePedJmrNJ5QASlIbtcKsu1RvB60hRKhTDKXtupTZC3fjoJkNy/20f8u+Kg9NRikE0kECrdNH4Wkw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(1800799012)(82310400011)(451199024)(186009)(64100799003)(36840700001)(40470700004)(46966006)(40480700001)(478600001)(8936002)(2616005)(81166007)(6666004)(26005)(1076003)(47076005)(336012)(426003)(54906003)(4326008)(8676002)(70206006)(70586007)(6916009)(316002)(83380400001)(82740400003)(40460700003)(36756003)(558084003)(356005)(103116003)(2906002)(5660300002)(36860700001)(86362001)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 10:08:09.1433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1023b386-a694-495b-3659-08dbf57a1521
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6800
Received-SPF: softfail client-ip=2a01:111:f400:7eab::60b;
 envelope-from=sai.pavan.boddu@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) AC_FROM_MANY_DOTS=2.499, BAYES_00=-1.9,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
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
X-TUID: KkS/ap6uUs8D

Disable reentrancy on iomem_dac memory-region.

Sai Pavan Boddu (1):
  xlnx-versal-ospi: disable reentrancy detection for iomem_dac

 hw/ssi/xlnx-versal-ospi.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.25.1

