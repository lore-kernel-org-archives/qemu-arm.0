Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp431519ejb;
        Thu, 15 Feb 2024 00:44:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlSNXtj8twW7LmlaqRfCtzwrEnZmSrlT8+EorYkS/YUPtO0xnkSvve9Re7lRYtIVAVhwlqYsW9gcPXdY248RyEf0wPElWg
X-Google-Smtp-Source: AGHT+IGulvf60LCjcA6t0VXIFfc7FWPOvynXAkQ3VnXKc6t0111FtcRligSVa8yUu48OHOtNPWVx
X-Received: by 2002:ad4:5e86:0:b0:68f:9:ee5a with SMTP id jl6-20020ad45e86000000b0068f0009ee5amr1751507qvb.30.1707986646274;
        Thu, 15 Feb 2024 00:44:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707986646; cv=none;
        d=google.com; s=arc-20160816;
        b=zlDwDLVQgwqQnwfCHDExeLfv/BTQX3F+nBGmA8+SerjKkptehkbrBxY7G7aSzauW85
         ez9gQLRTlyrrmUWLBubv8U/dUFcuZ1QuGvmPQl9tgLReTEzMCLemRmqrWsgz7IvHMK/x
         CfKUXigLgnlb3nSsfpav2TalXj53E9AMWkvLoMn4PVwrl4hpTbxkUKm5H8WY9iM+oB2w
         b8t1KR8JLCKMNPA6YlLd7xGY0etoSam13VE4taHb1Z5JM3eaaGsk3HAMywifQFmrBVcK
         ZXdbTWPqP+D6+8pxASejvtMS+T73im6Z2b6VkIqBhqUpRmS5ye0tbe9z1hz8dA/65+S1
         s+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qTDP635O3rFuA54PetQfruYqv8ZMSnd1Lx/gmGu1pDA=;
        fh=dsHfM+Mw8oDNXgO0Kstu1+xrcf1CHu/m35bC60t/K20=;
        b=CzDxX9bBSeZhwm2H0SgCiLWmXeeXmgywtvRvgWBqG5sb/uimzj5jLC2rTxZPdEaNG/
         2BoSV22exD/KghI28EYRsQ2s2vfSuMDD10jKnGkozgtahd3WeoT+Sl9gZV7B14//gBOT
         RcHHroC6j4GAAIb3yNL8VIbkm1WX7nLHHY4VUPOLv3e/elDaxAjXr+yKpcvi2+5MQKgP
         0p+Gd+fxWqYL6+4i/I3lOinF3RhqXvnnDYaBqOsYzC34GjiNZd5wmxh4C7sogzJ2pkQW
         EUpI5CE+D5j3EgpdsycXR+D07RC4nGl15rA8ljf8BeT7ALMhqH1pW7P0gpkpzcWtUWKa
         bE1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MffuVIcD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a05621420cd00b0068d148b4a64si944827qve.419.2024.02.15.00.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 00:44:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MffuVIcD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1raXLN-00018v-4s; Thu, 15 Feb 2024 03:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1raXLI-00018C-CV
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 03:43:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1raXLG-0001F2-Rs
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 03:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707986618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTDP635O3rFuA54PetQfruYqv8ZMSnd1Lx/gmGu1pDA=;
 b=MffuVIcDrAMk6qTojnRbQd7JxW/gCeBvjHRfobuUNzRnTFa4uhoUjOclMm0BDHqpSZDZcj
 LUFQdwAMJu9RJLyTYNiz9OXCEXHSyCd8pM9iL0dVBkhgaU0XXW5YXJ9CTDuGpxE2YEwmh+
 MdftxT7+FCugLIarYD80NmQVf+Z2O6I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-D3YyCsPsPXWCsgE6BrzbxQ-1; Thu, 15 Feb 2024 03:43:36 -0500
X-MC-Unique: D3YyCsPsPXWCsgE6BrzbxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 182D785CBA3;
 Thu, 15 Feb 2024 08:43:36 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24D75AC0F;
 Thu, 15 Feb 2024 08:43:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v5 4/4] qemu-options.hx: Add an entry for virtio-iommu-pci and
 document aw-bits
Date: Thu, 15 Feb 2024 09:42:14 +0100
Message-ID: <20240215084315.863897-5-eric.auger@redhat.com>
In-Reply-To: <20240215084315.863897-1-eric.auger@redhat.com>
References: <20240215084315.863897-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.531,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: l8IemQAZPxu8

We are missing an entry for the virtio-iommu-pci device. Add the
information on which machine it is currently supported and document
the new aw-bits option.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5
- tweek the aw-bits option description according to Cédric's
  suggestion
---
 qemu-options.hx | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8547254dbf..a98bc7bd60 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1172,6 +1172,14 @@ SRST
     Please also refer to the wiki page for general scenarios of VT-d
     emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
 
+``-device virtio-iommu-pci[,option=...]``
+    This is only supported by ``-machine q35`` and ``-machine virt``.
+    It supports below options:
+
+    ``aw-bits=val`` (val between 32 and 64, default depends on machine)
+        This decides the address width of IOVA address space. It defaults
+        to 39 bits on q35 machines and 48 bits on ARM virt machines.
+
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.41.0

