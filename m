Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp29294ejb;
        Tue, 5 Mar 2024 10:08:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVP4GVB75qhZDhreslwxSKawDVgxNT2VTw+eA6bQwdDyLdDrm/WrBcCZoWRvV/DYMgYMk/j1/vAu0Y5eXjSSHP2P3YptnXb
X-Google-Smtp-Source: AGHT+IEOnz15K/prnzNs6DaWTXo+QXGubsM6buINT7KL4X2/vrCdqmCshfOmcLytzSsfEDRzzoVp
X-Received: by 2002:ac8:7d4b:0:b0:42e:b9ad:1249 with SMTP id h11-20020ac87d4b000000b0042eb9ad1249mr2925463qtb.66.1709662128257;
        Tue, 05 Mar 2024 10:08:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709662128; cv=none;
        d=google.com; s=arc-20160816;
        b=UiZGYQWI7lg3p6S8UycK8Zx+omAIdbB3gYjwEbmEXGPjXMjdsH/DEljSNya4cBhgrA
         i+wS5aKEXAPB7BC7FrmlhHXA6ivMWQiZ/AXiTsIAURu33snqlQX2Y+g19ZPGfKL3O9hr
         CQNi6yAYk+cSwQb0ufbErCG2IS4sR3+am5Tu/4AzAyHT4giMObfRciro2jLi7XY97LvJ
         TPVbnScTuisznZe/p3YfJxiMFe0eLrgHO6YKjFPPzvorAAFhor1sy2D/M+uIzP+Q1npS
         pSOr3JufAMBRA63+E5/n6CDt5ZH+WhXj1yt9/qUcsZrdDFkk4XwMHOA9N3fEeLI13D0o
         xYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ds+IJz/k3bgm4Wib0Mb+o00Gd/ddoUQz4Q1KqkWK7dA=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=FqS9uVS92lwLIht62EeeGynkYXSvNIfdB0n2s73a1di7GjiVI3JuZza8J8apLGUO/I
         dIqhY4lmc3/Cp55qPfDUeWXUW8RH/7IjQ1xyVVah+Fq1Y0MeVdxMmVnPiOBGnxRfGgJs
         ANQ8uzdfFsGRnz3v98kOmadfEA3XaR4UIkqsdI+IjzhoK+c2MmMEckGpA+XIeEdzI+zM
         AZa2gj3P1Z93O5VzB8hi6o3dUtvtmiso4BC/EvaXAY0A2WAfWqFECtQXgjafU0uz03e/
         U2715HmXuy44yT/BPCab2MWRwJQtfc7Ifk7iFs3dXe+2iGBrU01uxZjL/Le2pPY9QMlb
         xCnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U0T+uyp0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020a05622a104d00b0042ddadbb68esi12716512qte.705.2024.03.05.10.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 10:08:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U0T+uyp0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhZCt-0001ta-Qm; Tue, 05 Mar 2024 13:08:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZCr-0001st-Pf
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 13:08:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhZCq-0008Vm-6c
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 13:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709662079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ds+IJz/k3bgm4Wib0Mb+o00Gd/ddoUQz4Q1KqkWK7dA=;
 b=U0T+uyp0lYrlH7WVZDxrfOE6IROqO2ARl/24j3OSbU+TY+BTERJn48WwsEWZvWzZ/ENSN3
 nGWVxQ3giW/UVAs6qaSt/JPx8llxcnoZAVuBAhB945gZN+7rCA7oBp0IXEsogAvwTD+PGg
 0UOc06ePHZOEKXIWJLis91oOeXqv7UU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-chDRlE3kN12BLTkc-smLUQ-1; Tue, 05 Mar 2024 13:07:56 -0500
X-MC-Unique: chDRlE3kN12BLTkc-smLUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8B10800266;
 Tue,  5 Mar 2024 18:07:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40157C041F0;
 Tue,  5 Mar 2024 18:07:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v6 4/9] qemu-options.hx: Document the virtio-iommu-pci granule
 option
Date: Tue,  5 Mar 2024 19:06:22 +0100
Message-ID: <20240305180734.48515-5-eric.auger@redhat.com>
In-Reply-To: <20240305180734.48515-1-eric.auger@redhat.com>
References: <20240305180734.48515-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: byqpgL7YwoEo

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

