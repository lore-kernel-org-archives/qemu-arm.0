Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2038548lfg;
        Mon, 23 Aug 2021 09:57:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJdAgIa73ZfjWYWKP7WBWKnpBAY3+KMibRSRm/8QLu+qdNxvo8BI1iWQz9PPxmyZDoMBhJ
X-Received: by 2002:a6b:8b54:: with SMTP id n81mr26566622iod.5.1629737835029;
        Mon, 23 Aug 2021 09:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629737835; cv=none;
        d=google.com; s=arc-20160816;
        b=kJBwa78DRWNQZ35mCV+Y0PyL1b23IIyySj11oc5wrzLu9etDQHHAm1OpFF2yThTmq9
         +ZpPuIZh/cNQQavtMHeYHZIcNBa+XkKKW35EnpizH4tgfU64BWX6DobZPQtsNmRn7b74
         E6X7hP7tC23yqFpnKZflowOvqbDvD6ApBhxVJWTAgwbLc/PKuG85S27tDhm2vSMO/zGr
         4GxXep3bOOuG8xornY9BAV4IsFC1vVXjm5BPru6udkoAvuZn6ZvMiCOQtJWX+0YRr7EO
         UkzN0oAwVcZ58VNsV1fDz195wOzitH4PqTq6Ei3Rodu3KhPAiEmIhD/8qeZ4wE+pBh6B
         N+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HKpjD30wqc1vCj0eTxqs6392PPziUtsLt1ojowv2C3g=;
        b=EV+ucORSMZiWF1QYMw+no/M5X4NTllrZyVBim4EfQtxvc6aEqpT9vX9cbIuaX1ofNj
         d7rZ58yXm5b2aJpsnThiF6mD+zYquixEA4zojdwDDFLostvrcFH57x0CiLV/qEjAwX+C
         ubVWcASjhhT0+p9LtOBl9x5cGmE/93nEEn/x2E3/7OGyxS4ZJIzv7qPdGHNwm/suUjHS
         KwtvXPqkIY4Qp7PeePVahjotqMK4sdzsg2VDuG8bCGeeQ0ZKWJNygtANkz4HV/wYKA8T
         IbP7H0yY2/0tYOpMCOTUb6AT/psRE+EbxpkTRu/0WvMQGCTdK/cjblgp8AtxVPgiRipd
         Hy2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GKUdl4z0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si14340719jae.1.2021.08.23.09.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 09:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GKUdl4z0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIDG6-00056x-Bt
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 12:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1d-00008o-Vz
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1c-0007Ni-0O
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKpjD30wqc1vCj0eTxqs6392PPziUtsLt1ojowv2C3g=;
 b=GKUdl4z0yCZGQVyIe/3X7RsO1vmJ5KE+yOvjvLy1JaWrviLTziI3qBowdSyy5B9xYpQ1LN
 mI/Py2L2tC7tzeHXo6vNR1jFh0QEctlr4dUecai92Hvqoz1REnxxQxzwDtF4LCI9joSlyl
 5KEr5St1kMJXaCsbnXcK7joy1pwPpcM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-kEHksOJqM7ioCAeboqKLbw-1; Mon, 23 Aug 2021 12:42:14 -0400
X-MC-Unique: kEHksOJqM7ioCAeboqKLbw-1
Received: by mail-wm1-f71.google.com with SMTP id
 201-20020a1c01d2000000b002e72ba822dcso4376615wmb.6
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 09:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HKpjD30wqc1vCj0eTxqs6392PPziUtsLt1ojowv2C3g=;
 b=JK+fSGKPGzutvXflBLMGHevILGvJwJbn2jtebJku4+A5W8Kr57tizOY1Vz1CSUCNoX
 sXS7dfsw9/dKGxJJ0mjYLJ8A3mv2ctY8kbT0fDcg3vd0J9K9JxixOMLh+rXSQe3/JBOl
 fhL84eFWnGb5zjGKz9ureBzKQzM0W8+4bNF9UFjmUw5EmbqW/idNlHHD0qBp32bcwf7h
 OfXKFELRLqAeHmj97QdtDwkg6xgEyR9OnX0+qYLX3GgBhndBXCEtbd/IJ4f9LFUc+2Zo
 ocgqipuMiID3DcgE48uGidDsb8+7++IlNkDrens932Jca6aLwxAcOB/k5zvnapeZ0OCn
 4CCA==
X-Gm-Message-State: AOAM533W9lhppWYnuObtlGBRghjifUJAlHrJwafsQZp4tzyg3/7T3zFe
 wFXwxLo9evVWgpW5mNwV2ZISGpl3Z4nxnkEuLt6jPFofxhLtKN1lBd4YiWhhs6Q5o5eJ7BQwsEf
 lgp5GpxXs/+cP
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr16748192wma.19.1629736932985; 
 Mon, 23 Aug 2021 09:42:12 -0700 (PDT)
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr16748178wma.19.1629736932861; 
 Mon, 23 Aug 2021 09:42:12 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 r1sm15831189wrt.24.2021.08.23.09.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:42:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm field
Date: Mon, 23 Aug 2021 18:41:55 +0200
Message-Id: <20210823164157.751807-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BcQOo/mLyvR6

Add the 'direct_access' bit to the memory attributes to restrict
bus master access to ROM/RAM.
Have read/write accessors return MEMTX_BUS_ERROR if an access is
restricted and the region is not ROM/RAM ('direct').
Add corresponding trace events.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memattrs.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 95f2d20d55b..7a94ee75a88 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -14,6 +14,13 @@
 #ifndef MEMATTRS_H
 #define MEMATTRS_H
 
+/* Permission to restrict bus memory accesses. See MemTxAttrs::bus_perm */
+enum {
+    MEMTXPERM_UNSPECIFIED   = 0,
+    MEMTXPERM_UNRESTRICTED  = 1,
+    MEMTXPERM_RAM_DEVICE    = 2,
+};
+
 /* Every memory transaction has associated with it a set of
  * attributes. Some of these are generic (such as the ID of
  * the bus master); some are specific to a particular kind of
@@ -35,6 +42,19 @@ typedef struct MemTxAttrs {
     unsigned int secure:1;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
+    /*
+     * Bus memory access permission.
+     *
+     * Some devices (such DMA) might be restricted to only access
+     * some type of device, such RAM devices. By default memory
+     * accesses are unspecified (MEMTXPERM_UNSPECIFIED), but could be
+     * unrestricted (MEMTXPERM_UNRESTRICTED, similar to an allow list)
+     * or restricted to a type of devices (similar to a deny list).
+     * Currently only RAM devices can be restricted (MEMTXPERM_RAM_DEVICE).
+     *
+     * Memory accesses to restricted addresses return MEMTX_BUS_ERROR.
+     */
+    unsigned int bus_perm:2;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
@@ -66,6 +86,7 @@ typedef struct MemTxAttrs {
 #define MEMTX_OK 0
 #define MEMTX_ERROR             (1U << 0) /* device returned an error */
 #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
+#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */
 typedef uint32_t MemTxResult;
 
 #endif
-- 
2.31.1

