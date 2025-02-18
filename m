Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp884084njb;
        Tue, 18 Feb 2025 10:29:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6bZzZhL8GJD6fgaRdgYbilgwCk+Gw0Toqq6SR/bDweR8M7PM+xpM308DA5WFwOaTQ983LTbY1cUz6wg==@linaro.org
X-Google-Smtp-Source: AGHT+IHOPg76Ml3U+uoMmCH/3xQcEr5WOtQBOJkL+kHImEeGTMwmdMRggJhvRmSAK4nZYLXke3pG
X-Received: by 2002:ac8:5892:0:b0:471:cdae:ac44 with SMTP id d75a77b69052e-471dbe978a2mr235990151cf.47.1739903359038;
        Tue, 18 Feb 2025 10:29:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739903359; cv=none;
        d=google.com; s=arc-20240605;
        b=goSAEbLaMadFLKE6ZqaeURJdlDKbHCloIE46MMK6T7hzKRIDScQN5h36AEQI4hsxpM
         0rt0XIqiljMBvS8gQuMh4ZMOz39Bjlzkx+G8y01mS2qUPFNGYEvkYogU7vYP3HuwqCHx
         VBYNkqkUq/v46VTRuNNsAx5oBb4D7jnFfKMv6JH56gbLrWbB0mkvE0KvAhmGbldOYdjA
         ChuTJt5JrjlHsu/LyybTaG7lyMK9MbEv9oGxRlED81pCfc78rtZD5Bf+MdhHjgWCCMg6
         JPpvkdOxcl6yfs7KuMoPE4cesaeoIO5rzEKYLSR8vh8Le8gq1m2FdoJSyGruhAmkxMxw
         HQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Hzy1s/cX5PZBqXxEFMKtvC50muZSUNBgdHX/8kzCoeU=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=LPabxoc2ijNHfDPzQqfnQZMu41ClTfrQlaSiKRhmGcHYtZBSrv3uaCQZeUpo2EgGTS
         A0XjLn6HZFanw4tRCR9rAMs1ubrUMY2Ig9WINQVsoPUkBj+mOkPmvzbOL2tUHFpOLGVv
         lCsenFAdy44+o6GFaJwrUX9UNan/lmMaYMF1a94K9duI6smjAsSyBDcHCwZ0PBZmSxh5
         bCyYOQ9d47pymHgv+6fGkV37DHvvkZLrKpUeYv8kRp73MiJ1RdleP+NsvKtF2bQqzGWm
         kJYLI5kSbnqt0mnoVdiibOgTuKofSokXyEPXhdZMK8kXhYxGPBE/7niEeyaMDniQkgoc
         fBPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dzeJ1c4C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f4766a2csi38204211cf.19.2025.02.18.10.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 10:29:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dzeJ1c4C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tkSKw-0006di-PM; Tue, 18 Feb 2025 13:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkSKX-0006Rj-Pi
 for qemu-devel@nongnu.org; Tue, 18 Feb 2025 13:28:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkSKW-0008UT-8c
 for qemu-devel@nongnu.org; Tue, 18 Feb 2025 13:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739903303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hzy1s/cX5PZBqXxEFMKtvC50muZSUNBgdHX/8kzCoeU=;
 b=dzeJ1c4CzzCLF2c2FSS+GlD11enZlhMMLLmFHglard2v5S7XXn7SP+OmpxbxqF6ApMzXOV
 VJD8L2ngZFk8R4YZE+Rhg9kg18iEwwTB/PEpCPmmiTTgyuTkMessUSL0ZfiICzMmM5cpo7
 aguhTncgXqSHyRDBJvOtTy5uFhD0ppw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-uHDJB473NCyVaaENyFn6Eg-1; Tue,
 18 Feb 2025 13:28:18 -0500
X-MC-Unique: uHDJB473NCyVaaENyFn6Eg-1
X-Mimecast-MFC-AGG-ID: uHDJB473NCyVaaENyFn6Eg_1739903295
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2A48019373D9; Tue, 18 Feb 2025 18:28:15 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.254])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F1F4A180035F; Tue, 18 Feb 2025 18:28:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH v3 5/5] docs/devel/reset: Document reset expectations for DMA
 and IOMMU
Date: Tue, 18 Feb 2025 19:25:35 +0100
Message-ID: <20250218182737.76722-6-eric.auger@redhat.com>
In-Reply-To: <20250218182737.76722-1-eric.auger@redhat.com>
References: <20250218182737.76722-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: K4//o1EdsZVt

To avoid any translation faults, the IOMMUs are expected to be
reset after the devices they protect. Document that we expect
DMA requests to be stopped during the 'enter' or 'hold' phase
while IOMMUs should be reset during the 'exit' phase.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 docs/devel/reset.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/devel/reset.rst b/docs/devel/reset.rst
index adefd59ef9..0b8b2fa5f4 100644
--- a/docs/devel/reset.rst
+++ b/docs/devel/reset.rst
@@ -143,6 +143,11 @@ The *exit* phase is executed only when the last reset operation ends. Therefore
 the object does not need to care how many of reset controllers it has and how
 many of them have started a reset.
 
+DMA capable devices are expected to cancel all outstanding DMA operations
+during either 'enter' or 'hold' phases. IOMMUs are expected to reset during
+the 'exit' phase and this sequencing makes sure no outstanding DMA request
+will fault.
+
 
 Handling reset in a resettable object
 -------------------------------------
-- 
2.47.1

