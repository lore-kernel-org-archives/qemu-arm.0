Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1960398njb;
        Sun, 2 Mar 2025 00:22:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1B31bHL7QIZoSP1v2r5Io5QUkIMTYAZ9I+TLBDE+ehjO4blgSnKQiVhNMQ2O3RVl7y6hZYjyJbAOW7A==@linaro.org
X-Google-Smtp-Source: AGHT+IES2D6WTJM9gl2LcxYK0hMjZHe6uxlhqrhGlSsV6l9Db9h5JhkBANCU8D9W3GDpIdRpZfv6
X-Received: by 2002:a05:6214:20aa:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6e8a0d95f32mr151127686d6.38.1740903768940;
        Sun, 02 Mar 2025 00:22:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740903768; cv=none;
        d=google.com; s=arc-20240605;
        b=gt1ZTrHU7/uv2zV3rV9qBJK4Ykbz58X/7rpK0agnt7j5L7/5aSdIEQgklwRh6uP7N/
         FCRHTk7CE5UTOEpB+9zPMwkB5gawxICJZC/+G+vD9wJd3liSTZJIG1EtIzQ4Lqr7azXQ
         5uatur9Bi3lbQ/JmXrEyxanDiAmj+4PhMHyFw3UQ7TbrprYVEXlDGsA7inU5lq1u8Y1f
         ucP9qlFmJ2saL7lO0Lp0oR1EpX1cgjBV28lBJu0b8UTo5z4BjJ0wECkccaAUFux+weNk
         dVRTT5S3jmRHCVDHAOq7SD4eAWMeYcJh/9SmBeHbFcZYlNErWjT7fO4q1bXfEuPI87Cq
         NXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=suKDqr8iP2bfgTwKgM43SphGAz8Hd6m/7/O6Vx6n7PU=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=JtFlVXRAubRHOyvdAfddLCb2BV9MGru7J9v4lqk/WCORZwe1jRlID+BvhD2NpQKSn0
         3q8a9hNyBpHbvpqVj1YGp/y+QaZaeO3i13GytNOJPvw/DVKbrhP0NqSCLXU/g7MWY2Vd
         +T0Np7MR16wWED8L6s/jV2qULBO2XYjYiAv9HFA+Yj7k5fE7vPskUFHuK65P/sWG8Oy9
         8gTRWM4sk5dLABeQ10mcyQJOvyMdi7sAGcledZZ9hPi/yqipRRXc5BUiK1RT4QVDtyyC
         lTyM+OrFlT9iANjv2GJ8fpuJZaL2lK0vru3j6iX0/+VravjX+Aa+vfphV0A5Wzik9uv6
         AV2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mtXGPFJ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3b5341e8fsi55856685a.360.2025.03.02.00.22.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Mar 2025 00:22:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=mtXGPFJ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1toeaz-00063P-MX; Sun, 02 Mar 2025 03:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1toean-0005dO-L0; Sun, 02 Mar 2025 03:22:33 -0500
Received: from tor.source.kernel.org ([172.105.4.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1toeaj-0005gH-Vl; Sun, 02 Mar 2025 03:22:33 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1EBD6611CF;
 Sun,  2 Mar 2025 08:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215C5C4AF10;
 Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740903737;
 bh=WNgUSU0OrqFnvTXh8PzzTv6ghTQeysRMH1deXYrrJ9Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mtXGPFJ9nB5fOvdDm8k2a5HGVzMy0xq0J6Rf03+7XEQPe8SRDth2SfgjXg/uGal+x
 hD8NfCxo9pyEDIH2doqP8evFGxpvNFOOok3xHYKfqgQ/WMMBzCbZesddR5iFcs76ld
 yZWGMMdEaWoqg19OKENrwW2FWQ7O84MgLEcYfiqvtkvepKFJjnzDdaGDx1a6vOzzmz
 NhsuBSY16Y/ZWjiXFxWC+GZstt66mMSzubKyDlluvQUKQQK6/fyejww8YQhpIzVWfn
 VW86Z81s4MYyyfTrkSPjmUws2EMH0PQ0pfQrLuBUyzc896JmbKn0UCGyyNdSnMJMQw
 IBw1+rH7Dn8pQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1toeaU-000000043S8-34gI; Sun, 02 Mar 2025 09:22:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 10/19] acpi/generic_event_device: Update GHES migration to
 cover hest addr
Date: Sun,  2 Mar 2025 09:21:57 +0100
Message-ID: <ff687a06540f148e60a480441ae50a29cbda867f.1740903110.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740903110.git.mchehab+huawei@kernel.org>
References: <cover.1740903110.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=172.105.4.254;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iAy9IDiVp1Ws

The GHES migration logic should now support HEST table location too.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index c85d97ca3776..5346cae573b7 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -386,6 +386,34 @@ static const VMStateDescription vmstate_ghes_state = {
     }
 };
 
+static const VMStateDescription vmstate_hest = {
+    .name = "acpi-hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(hest_addr_le, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static bool hest_needed(void *opaque)
+{
+    AcpiGedState *s = opaque;
+    return s->ghes_state.hest_addr_le;
+}
+
+static const VMStateDescription vmstate_hest_state = {
+    .name = "acpi-ged/hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = hest_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
+                       vmstate_hest, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_acpi_ged = {
     .name = "acpi-ged",
     .version_id = 1,
@@ -398,6 +426,7 @@ static const VMStateDescription vmstate_acpi_ged = {
         &vmstate_memhp_state,
         &vmstate_cpuhp_state,
         &vmstate_ghes_state,
+        &vmstate_hest_state,
         NULL
     }
 };
-- 
2.48.1

