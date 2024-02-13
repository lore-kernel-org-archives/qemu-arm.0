Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp312000eje;
        Tue, 13 Feb 2024 10:30:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXe36zxzqbtyiMOUKg/H0rri567OTZ4CW3QVdyS95/9PcqZ0Yt4RZF/3RDKOAjPEkJYa7xQimutWefCLzMghard9h6DSUGK
X-Google-Smtp-Source: AGHT+IGV3Uq1HKlHNKGCTx/Q6U+cG+RD2OvbRWDkY9+Mhw/G7G+Tx8VF+4s3MbU28y4zXPYEWjIx
X-Received: by 2002:a1f:ea04:0:b0:4c0:2d9c:820a with SMTP id i4-20020a1fea04000000b004c02d9c820amr423370vkh.14.1707849056128;
        Tue, 13 Feb 2024 10:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707849056; cv=none;
        d=google.com; s=arc-20160816;
        b=FrZZLaZf78dw0eazn0k/d2uGP0cS7bTNL9VXGfaOU3Tmk4ORzEeJmkenO1csgEKsEa
         rwZXe4tHOb/7monJZMj5loICngJ5oX/DcSv50bJeNtzBKVS1AJRY4r8ekpLl753N3eBN
         KAaCTFQHGoNsYsC3CDfa2EcIZ5CQRDZDMq54x/jXct5tRlweBPKWLOGKXxX3MRnglSrU
         g0/CdWW7/GA80tLrOtz0/Pnm6D99fd3ttu/0Ufx3H2o+tu3B4V0mwuC4SQC9L8kTcUBS
         etosiiBSnjVg4LoHugTg2GRaP+ZW1+UQJisHDGn7DupMvMsZWmhzYfWj62INst4UwN0K
         YFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QIDmTnaAUiishdIiFaeP/BW6AbE5AkNMCdkImrTN2v0=;
        fh=EEz6/Zhy3dYObkhtaLVvImXgqxkMobD/v62GnSK3+QA=;
        b=Ba1YjR3pP0l9hqIRUnrmUjvcFcd15xAdTg++z1BOVmadAvGwmSpUNO7ZGAHXYURv9L
         KgimZpfAw5mhtRx1RTtWOLK2aYeUSHKEmluKzrsuFdELxAzST+k2E1qSvVyTPzxjhzTa
         vCl1/wT1URJOKeVPG0+69DxSmZ+fcgQz3JflZexjWqjUsVePJvYPzxhg5FM93yTh6IRC
         dyIorg4MnEU8+LvEyugXAMieme8DlM5YuexGt9POp7mrW7TChUJaC4iFnAa/OrY7l8+5
         YVz+jGtr+74KeVVVgxdVpqhkuKfaVmnbNS2Or0l+LAlFkFolU01W5iErc7vUagDmlO5V
         Rh9g==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dUoHHXEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCWtHiAyPkfjJi5sRrwg5Z5ZlI0LK07T+VK9OYK3c/DbpFzhCl+ujtyDMpdvIeP3cMomSu8z6SybhU1Fn8s6x2qwrM3JO9Hh
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a056122048800b004c03039551esi1086125vkn.323.2024.02.13.10.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 10:30:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dUoHHXEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZxXc-0006gb-KK; Tue, 13 Feb 2024 13:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZxXb-0006gR-Il
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 13:29:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZxXZ-0001uG-W8
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 13:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707848997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIDmTnaAUiishdIiFaeP/BW6AbE5AkNMCdkImrTN2v0=;
 b=dUoHHXECHaFnupY6xqPvWHG9ARA0nB1V97rs8RizGTzNm2wG3OwzNr590l1m/O9vCf0biZ
 ywSMPsUZ9KcypWKmusXCRPRwKmOyFMEkJHT0hOULl3U2jxeu5SmOsdudkt2d7n92I6jYY8
 q6xy8H/JVeF9Wm3JoEy7FyW7BaR8HRg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-UNU4iw8WN_albE_ioc9_5g-1; Tue, 13 Feb 2024 13:29:56 -0500
X-MC-Unique: UNU4iw8WN_albE_ioc9_5g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6A1C863061;
 Tue, 13 Feb 2024 18:29:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B648F40D1B60;
 Tue, 13 Feb 2024 18:29:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, mst@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v4 4/4] qemu-options.hx: Add an entry for virtio-iommu-pci and
 document aw-bits
Date: Tue, 13 Feb 2024 19:28:31 +0100
Message-ID: <20240213182933.825268-5-eric.auger@redhat.com>
In-Reply-To: <20240213182933.825268-1-eric.auger@redhat.com>
References: <20240213182933.825268-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.504,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: JtaIVvoSOA7v

We are missing an entry for the virtio-iommu-pci device. Add the
information on which machine it is currently supported and document
the new aw-bits option.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 qemu-options.hx | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8547254dbf..6a8c970640 100644
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
+        This decides the address width of IOVA address space. With
+        q35 it defaults to 39 bits. On arm virt it defaults to 48 bits.
+
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.41.0

