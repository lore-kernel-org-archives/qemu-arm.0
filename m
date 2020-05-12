Received: by 2002:a05:6214:92e:0:0:0:0 with SMTP id dk14csp227281qvb;
        Tue, 12 May 2020 08:21:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypIETFI876ggL2Vlx08QO0CX8iyt3TYKPJRqZAMic7kIj5MA/uSYiat5ayqCMGPYf9MIiJM+
X-Received: by 2002:ac8:7249:: with SMTP id l9mr17983401qtp.224.1589296884703;
        Tue, 12 May 2020 08:21:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589296884; cv=pass;
        d=google.com; s=arc-20160816;
        b=S0GzXFydarSrvNXe7CUmeMe55Y/Ez36/TYHX+PjkbURYc1xjWPOi6lBfndRMzRPLOj
         6gIYnmGIIPh4DqdZ0jMyZqHvGil8/VJ7oS/h/uMXqWpAHE5ZDwBL/8PxOyQt55ENhzhq
         pQy/t+cLnvefia5FLbgtYyniFjtTdfq83BkavWEPZe8XSXUBDgc1YXGptI0MdeXihsy+
         gEX2lLB8oIv1NlSpstPbvWQ1fX5B/rijpWF5g7rQV1zx9urr0dQy8NNo7Lm+g80vvbTH
         FC0o0dYsIHwHTZwlJ6fp9ncve0Lh6M2Ux4bZtZCXGXGpzqQHNbp6qQB2t1oP0U7J4xR/
         KZ9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=2Qcy7AiWaJQ7exUrLABRFOuplr1PsD3dmHV85EhUpWo=;
        b=ClTS/i6ID/QP9G/uGp/0mT/PTe3i7KOymeLgq4EqhBpOj2GIy8YaPG3zgNX37/Jnp5
         Rt3VOa+CcGx2g4GH8h+2P8O/ZxL10GjBncBoNE9JZO+1SyTaCS1xKojwf/r6qCdJkdwl
         0ucITUACrMOqZQUrVQqYV0+yxBZjXCuVJRSuhmZoQt3Ur6rXDFdMxPTLO/T0kX8Tp/Zy
         hayJaHqLOuW0QFcSHF2uC7Da0yEFdiFm1MrEATM/xWJxwOJc272CXb9zfeSvo1h33z3a
         TzPa9ukkJzAhtz9oF/yHBcmczZPmtulm9Unsck/9hmz+a7VYX5/JHpJSVD5U6DBZHbPD
         LRwQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b="VCx0H/Vj";
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25si7747831qvb.215.2020.05.12.08.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 08:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b="VCx0H/Vj";
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYWii-0000av-7t
	for alex.bennee@linaro.org; Tue, 12 May 2020 11:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jYWSW-0001RZ-Cv; Tue, 12 May 2020 11:04:40 -0400
Received: from mail-bn7nam10on2059.outbound.protection.outlook.com
 ([40.107.92.59]:31002 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jYWST-0002dm-9k; Tue, 12 May 2020 11:04:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IX1kFMVaD3MZHktgTVN9xul1rldtjdbHVIxQFyoLEIfxkt15nYZ+7+e54Fb4fu04O9sei5o6vKTABysu5KlNEqAhh1myPfrKgm3ktvMbcktNBrJidO1G0uPvB9My84c6NUOHGrCQQn+dhE8op8rGg1aTzZfcT2emi6/ISPfK+GeXgeYLVEVFxmtHjdjy6rBxL9F8haU5+sWjB9iCMkmcXFR43Ta1opbIyADGqHMUd4wHLe2yO+d4iJIyYmSy8nKQ1mxKI7alk+5x0RQbGs63dsKtBcWfOgzDR2OCsRa7BvftWx1u63Zv3D1lu/VpgarEAPwAPxlyIIgdMnpMqzUpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qcy7AiWaJQ7exUrLABRFOuplr1PsD3dmHV85EhUpWo=;
 b=XdqjgVoj+7cCiNdIDek+na/yjhc9pDdmWzPOBnPECTX2dkYcZHex0S1NZ0fx2FRqxkoe/cMF3Qhod+JGZjwuuR5Qdn4PZJ8Kr+G1rD0qXoEVAIXQpZKlrqy0YzdS3x0aurP/yTUuXyhT6FV3ojVr8EOQPgm6kXInNmzdyj7jNzcbNj7eF3d32FLpC63idpC2YDkMCxAOdUS9prH6Tm1fUeVeV8KilA3ltKwdQT447ddFti5QRHLjVzajQ6dpAco7iffuoFqHcXKkBxORM/V5nn772H/+NUBUjTB1faHLYxTe5aUsglQeubf4SY65DAdakq8FQv613kDDL2fSarZvoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Qcy7AiWaJQ7exUrLABRFOuplr1PsD3dmHV85EhUpWo=;
 b=VCx0H/Vj4lMKPEWGSHLXlHWbuAGc+1LbgMyNSYm5941NFMh8QJ0ovWH9oLYZR1B310rrPY+k3my3WKlGG+W8RkQ8ABz41KogsW3ERcY77MVwv1oE7uaUcK91p3tWOpGjodnk3b3xlUzeTyanuV49L1pmCgFJpozDSYmRtHaEFUk=
Received: from MN2PR17CA0026.namprd17.prod.outlook.com (2603:10b6:208:15e::39)
 by DM6PR02MB4924.namprd02.prod.outlook.com (2603:10b6:5:11::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 15:04:34 +0000
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:15e:cafe::45) by MN2PR17CA0026.outlook.office365.com
 (2603:10b6:208:15e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Tue, 12 May 2020 15:04:34 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Tue, 12 May 2020 15:04:33
 +0000
Received: from [149.199.38.66] (port=48760 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jYWS8-00045K-US; Tue, 12 May 2020 08:04:16 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jYWSP-0003nx-8d; Tue, 12 May 2020 08:04:33 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1jYWSO-0003nl-O4; Tue, 12 May 2020 08:04:32 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 2A79613C0168; Tue, 12 May 2020 20:26:29 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Tong Ho <tong.ho@xilinx.com>, Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH v5 02/12] net: cadence_gem: Fix the queue address update
 during wrap around
Date: Tue, 12 May 2020 20:24:44 +0530
Message-Id: <1589295294-26466-3-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589295294-26466-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1589295294-26466-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(396003)(376002)(136003)(346002)(39860400002)(46966005)(33430700001)(5660300002)(186003)(26005)(81166007)(33440700001)(36756003)(356005)(8676002)(8936002)(82310400002)(336012)(6266002)(2906002)(4326008)(426003)(110136005)(316002)(70586007)(2616005)(47076004)(42186006)(6666004)(82740400003)(478600001)(70206006);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b14a9691-8e13-4d3f-ea30-08d7f685c7a9
X-MS-TrafficTypeDiagnostic: DM6PR02MB4924:
X-Microsoft-Antispam-PRVS: <DM6PR02MB492468D3976183795EE4F630CABE0@DM6PR02MB4924.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-Forefront-PRVS: 0401647B7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cUibS7q+soCcggdeW7Ft+boP5ZFH2mgKHMGmsMdpcd1Q3q5hw98vl6at/3pxDx7csQxau+GVCA9yeYf/rb6oqF7SGUmJ0Yip9SSiH9PpUWeDeYVGZ6bc9tZgJaw2VNtwxIrI0Gt+22MdFAvq5qWTs2rE4OS5UHCAY50YbODCRzvD8xdDuRLEzGs2M7PG/LwDn69uMW+fV4aOS7USiqIjpiaaa7NPuKhC/5k9cW854JsF01vBfLM8t4zTyRyS6LQFZvKJI1ZwpWdQfAZwyENr2rOsAXsbX41K/wn/gj3UBGwIe99GSfJtSZ62PXYl2MDFznEy+xhV8gx8B4FpgZmVwes/nzZIQScndF7fn/+vFS7nMAkPg4GFO73N2VdjVFviWd9pChVmHbb3nuPzKd30dIcA/AaHYeJ2E3bRPm7j3XoCmX/Kf3Fs4GJ6oK2YzlTjcJLOV0yh/9heeubwLOD2H7ruvcSluxunx2j7oYhcsLFHJxyu84Imwtu+caPDFuB2LzzxHjC8rCuC5IYZ3M6tSJkL+otUEY09sAJxPdBEUezQunR6BpXG/83XQrOrF+g2mpU8v8WPxrbwLF5eA7UMQ==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2020 15:04:33.6959 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b14a9691-8e13-4d3f-ea30-08d7f685c7a9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4924
Received-SPF: pass client-ip=40.107.92.59; envelope-from=saipava@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 11:04:35
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Fh8HP1kpvb1

During wrap around and reset, queues are pointing to initial base
address of queue 0, irrespective of what queue we are dealing with.
Fix it by assigning proper base address every time.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 5476c62..c3536ce 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -845,6 +845,35 @@ static int get_queue_from_screen(CadenceGEMState *s, uint8_t *rxbuf_ptr,
     return 0;
 }
 
+static uint32_t gem_get_queue_base_addr(CadenceGEMState *s, bool tx, int q)
+{
+    uint32_t base_addr = 0;
+
+    switch (q) {
+    case 0:
+        base_addr = s->regs[tx ? GEM_TXQBASE : GEM_RXQBASE];
+        break;
+    case 1 ... (MAX_PRIORITY_QUEUES - 1):
+        base_addr = s->regs[(tx ? GEM_TRANSMIT_Q1_PTR :
+                                 GEM_RECEIVE_Q1_PTR) + q - 1];
+        break;
+    default:
+        g_assert_not_reached();
+    };
+
+    return base_addr;
+}
+
+static inline uint32_t gem_get_tx_queue_base_addr(CadenceGEMState *s, int q)
+{
+    return gem_get_queue_base_addr(s, true, q);
+}
+
+static inline uint32_t gem_get_rx_queue_base_addr(CadenceGEMState *s, int q)
+{
+    return gem_get_queue_base_addr(s, false, q);
+}
+
 static hwaddr gem_get_desc_addr(CadenceGEMState *s, bool tx, int q)
 {
     hwaddr desc_addr = 0;
@@ -1043,7 +1072,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         /* Next descriptor */
         if (rx_desc_get_wrap(s->rx_desc[q])) {
             DB_PRINT("wrapping RX descriptor list\n");
-            s->rx_desc_addr[q] = s->regs[GEM_RXQBASE];
+            s->rx_desc_addr[q] = gem_get_rx_queue_base_addr(s, q);
         } else {
             DB_PRINT("incrementing RX descriptor list\n");
             s->rx_desc_addr[q] += 4 * gem_get_desc_len(s, true);
@@ -1199,7 +1228,7 @@ static void gem_transmit(CadenceGEMState *s)
                                     sizeof(desc_first));
                 /* Advance the hardware current descriptor past this packet */
                 if (tx_desc_get_wrap(desc)) {
-                    s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
+                    s->tx_desc_addr[q] = gem_get_tx_queue_base_addr(s, q);
                 } else {
                     s->tx_desc_addr[q] = packet_desc_addr +
                                          4 * gem_get_desc_len(s, false);
@@ -1251,7 +1280,7 @@ static void gem_transmit(CadenceGEMState *s)
                 } else {
                     packet_desc_addr = 0;
                 }
-                packet_desc_addr |= s->regs[GEM_TXQBASE];
+                packet_desc_addr |= gem_get_tx_queue_base_addr(s, q);
             } else {
                 packet_desc_addr += 4 * gem_get_desc_len(s, false);
             }
@@ -1457,7 +1486,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         if (!(val & GEM_NWCTRL_TXENA)) {
             /* Reset to start of Q when transmit disabled. */
             for (i = 0; i < s->num_priority_queues; i++) {
-                s->tx_desc_addr[i] = s->regs[GEM_TXQBASE];
+                s->tx_desc_addr[i] = gem_get_tx_queue_base_addr(s, i);
             }
         }
         if (gem_can_receive(qemu_get_queue(s->nic))) {
-- 
2.7.4

