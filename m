Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1151933ejb;
        Thu, 7 Mar 2024 05:49:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVhEhIbj6m6FJTPdzDUce4TuwqCsE1mTQFc6hNNUgIPIIUbjn1mgF/RWyWyXdzZR+SGcogiTkiZsrIdz4+FWTamfrYrhJcz
X-Google-Smtp-Source: AGHT+IE+JlEF3URZaeGVAv99HAeiUbvTsT0HZCNTHVKlLS24/Sw7aMoCZb2c2gw3EzYGpT1qH5F2
X-Received: by 2002:a05:6358:e49d:b0:17b:edd2:c785 with SMTP id by29-20020a056358e49d00b0017bedd2c785mr8307605rwb.11.1709819391194;
        Thu, 07 Mar 2024 05:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709819391; cv=none;
        d=google.com; s=arc-20160816;
        b=dGgar03XjIGx+KISCDkzpha08/bOAHN3vM1eBU1TRjZWX8OdPepAD1oQjjohzQqbTL
         ofY5wQ7J1RFmM1r8OME6hGGYchAIxa5txv7zpmL6cJcxucD+0w8WLsraR76SCOvy3R/t
         m3iG1PMEByvVRcEhh2DD6McDp1E4Zov1b0VY8rm9AsqnzJZySQ02VBWPq+yEPubgzqmx
         U1PHTTrmXOmvm5b3HOgaUJMlwSOi6NEhIem4qi1YwOMx6JfRmWk9POHl1UpXYahXyhQ1
         vwa4SO6C1vuF5kRod8L0VnkU8yrUgkHkxf39fXzhHDWdbXJ73iuwaXJ/Q6CSLkQa4yyP
         ymVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mEN4q9jJ+qzM8VxqRYFb6XiPswpU0UkMhMmZLMHWIEU=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=GsUqIYRizBH6vqstSaCSPY9tfo9qph1OmhmPKyXn0NMtf0vl3omfRQJeRtipD5NWfh
         /wmoBr+8/qlQ2ZBqLcaKWaBeVKmHjWC5mkx9AxU5aHoAIHxLqo6Ul6T95PXBsR+5XbJw
         iscBK5oQXczv58B1yVDOwLVGB5LsR/9FcJlRV+L6Rb2zhrS3iKCX+xLCU6FPfDtj2E6C
         ssc1UraJRc3Ud0zT5d4ghWkrDK+IwhrCra0WpEoQ4NRIKRkRa5A6iaZqyDGzigNuSTSA
         wO9Tk26ICudFO46363d8EWVSEp+EVK54ZsK0E0n4uR9zIMB1CEnV2EEsaSpTyvwksHtF
         NqIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PX53UqST;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pb15-20020a05620a838f00b0078843ca30ecsi2532821qkn.419.2024.03.07.05.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 05:49:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PX53UqST;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1riE7H-0006mw-M0; Thu, 07 Mar 2024 08:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE4h-0005CJ-TT
 for qemu-devel@nongnu.org; Thu, 07 Mar 2024 08:46:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE4G-0007NJ-Pw
 for qemu-devel@nongnu.org; Thu, 07 Mar 2024 08:46:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709819135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEN4q9jJ+qzM8VxqRYFb6XiPswpU0UkMhMmZLMHWIEU=;
 b=PX53UqSTwlV4Qd0v3GFv0Xg4F+GBpcMl7WS979d0eBrybsT3Z4A/WQGNbwH8cqfRfyDA68
 bVivWwajwg8l1YtqJ83w1ZY9spvQP5ay0ljevJD3SrwV+OCbeVgk33qOAbeEwFLlT6Ke+z
 UPCIqgjLwAKph7LGr304W713cDCrKIA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-cpNTy1V1OpSHpW5y8PXs0g-1; Thu, 07 Mar 2024 08:45:32 -0500
X-MC-Unique: cpNTy1V1OpSHpW5y8PXs0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E352181B20F;
 Thu,  7 Mar 2024 13:45:27 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56D2517AAC;
 Thu,  7 Mar 2024 13:45:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v8 9/9] qemu-options.hx: Document the virtio-iommu-pci aw-bits
 option
Date: Thu,  7 Mar 2024 14:43:10 +0100
Message-ID: <20240307134445.92296-10-eric.auger@redhat.com>
In-Reply-To: <20240307134445.92296-1-eric.auger@redhat.com>
References: <20240307134445.92296-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: AYcpIsp3wHdc

Document the new aw-bits option.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v7 -> v8:
- remove "it defaults"
- removed Cedric's R-b

v4 -> v5
- tweek the aw-bits option description according to Cédric's
  suggestion
---
 qemu-options.hx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 379792a215..9d49ce9460 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1180,6 +1180,9 @@ SRST
         This decides the default granule to be be exposed by the
         virtio-iommu. If host, the granule matches the host page size.
 
+    ``aw-bits=val`` (val between 32 and 64, default depends on machine)
+        This decides the address width of the IOVA address space.
+
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.41.0

