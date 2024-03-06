Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp744163ejb;
        Wed, 6 Mar 2024 12:35:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV36L0OUeFtLy3ZxIlbm9cbHXlr+WmlQadijYaYLDutxz7KalqhMGS1DB2Q+gPp8bQIbehNnxmwdEmbKL2/2/P4HDp2tXtJ
X-Google-Smtp-Source: AGHT+IHJgaiGW4Ybh5xwjrGH4gwcCi27tbxu27LKD+y5eEXR0kjkHvoiKM6+FqUkZWKLm75bdz54
X-Received: by 2002:a05:620a:cc9:b0:787:e261:6067 with SMTP id b9-20020a05620a0cc900b00787e2616067mr4917909qkj.64.1709757349160;
        Wed, 06 Mar 2024 12:35:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709757349; cv=none;
        d=google.com; s=arc-20160816;
        b=mPkyLut3XvoV81chhp8kXhPiuxSgFdHXqz3SY39m4cDy9POHhig7M1Ri7UCuME/lKa
         54do9NEwuoABiZUwa6QW3ryLee+lEEG6SE9bu9/YQcfMf86oOLEv6SoDbUnAFEoVsjbs
         wUvAwrCmLn+Kpbpk3Rpx+8dX850aWFOnRGc88G0TX3l2E9FTe7a230/i+xAgJ8T3Az5u
         Fd00UKhDr71Bszm61b2KgzNHnS1Ts+EM8EpN7SeosHx36UwEjTpYb0ZPdQwwBmxZBHoR
         bgaQhfr758UAo2/LMFy9AOiuVS5Se3CdvJF/9I3Nt6G0n7CuATe2qiVkp04Na+Z2tVIB
         ZE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ds+IJz/k3bgm4Wib0Mb+o00Gd/ddoUQz4Q1KqkWK7dA=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=X/mRpOFxm8ZL1lXdE27jzwG+RCLJqMsgpwEPnHuVyfJ9oHIoQ5MvIHfU3iw2uy2fOa
         05R7mtLH3FyRT1cqzBXt0OjGrjIzeokIPO5VVJzBC/eOLDyzoiNAom80h02kDA3jVtj4
         jnkfjQX154xF4opPNYhguj/hXVopi78XkuYc+FtoXyGBj2TUzpWQkAR23gZEntZNCcPQ
         SOdkXvQVlh2VLcYTZURQ7jIC9cR55FvOtZFaHKNbgF3CArcEIt813Z+gvfAvz3yq6/Zm
         pS5okeQUI2W04DoHypEn7TZTTiz0JtjmzyTthV+DJM4y4Usaoc3m7UVsIXYzgeAO79lx
         ZR2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tb2Ahd8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt1-20020a05620a478100b0078819f8ce2csi11137258qkb.670.2024.03.06.12.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 12:35:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tb2Ahd8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhxyO-0004W6-Cm; Wed, 06 Mar 2024 15:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxxx-0004H9-7s
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:34:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhxxu-0001om-HF
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 15:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709757253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ds+IJz/k3bgm4Wib0Mb+o00Gd/ddoUQz4Q1KqkWK7dA=;
 b=Tb2Ahd8QjpYWdbGTv91GiSdvSCJW3Em2YAYA37/Y8tOOMA+NOtHzwui09o0XvhXR1FMclq
 zKXHvItDMPF2hQrHsB5n0l6nUSmit2rDVk1UxL+MJrrP6Fn/96Uh8RJeClEslBNg/tKzbj
 GUvIk86JNPvgaw8IXbGQP4JXDErhGMI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-BD0XHLjNPcCv3nuZ8iA90g-1; Wed,
 06 Mar 2024 15:34:10 -0500
X-MC-Unique: BD0XHLjNPcCv3nuZ8iA90g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0E942804809;
 Wed,  6 Mar 2024 20:34:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 802EA36FF;
 Wed,  6 Mar 2024 20:34:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v7 4/9] qemu-options.hx: Document the virtio-iommu-pci granule
 option
Date: Wed,  6 Mar 2024 21:32:43 +0100
Message-ID: <20240306203348.65776-5-eric.auger@redhat.com>
In-Reply-To: <20240306203348.65776-1-eric.auger@redhat.com>
References: <20240306203348.65776-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: f+bQyK9CaGsS

We are missing an entry for the virtio-iommu-pci device. Add the
information on which machine it is currently supported and document
the new granule option.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 qemu-options.hx | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 9a47385c15..757df3eac0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1172,6 +1172,14 @@ SRST
     Please also refer to the wiki page for general scenarios of VT-d
     emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
 
+``-device virtio-iommu-pci[,option=...]``
+    This is only supported by ``-machine q35`` and ``-machine virt``.
+    It supports below options:
+
+    ``granule=val`` (possible values are 4k, 8k, 16k, 64k and host; default: host)
+        This decides the default granule to be be exposed by the
+        virtio-iommu. If host, the granule matches the host page size.
+
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.41.0

