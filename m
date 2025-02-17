Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp38737njb;
        Mon, 17 Feb 2025 05:39:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHEFW16GhKwVIkKXP9ocKKUXvli0lOdPBn8FzuQ7L/Fi5AJOtC7jtgvHIYNVWk3LvjHKlhhx0TmYik1g==@linaro.org
X-Google-Smtp-Source: AGHT+IEEA4liUQYOMsPhOMMEgql7WOcW85tPkUCuH/2zQoxcjmMirKS4tWvyb+qb+y8CQjpf20Fv
X-Received: by 2002:a05:6214:1c4a:b0:6e6:6713:3ea8 with SMTP id 6a1803df08f44-6e66cccc3aemr154130206d6.23.1739799561688;
        Mon, 17 Feb 2025 05:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739799561; cv=none;
        d=google.com; s=arc-20240605;
        b=R5pUhctWBp9Fg2tirw2+24YV4o1KjD98OnQuE2CmxmFeph41BFyN1fLf/MbtLUGXc6
         ulgIalJqtdMFtZTgYplMPupd11t1E+Ow/3uSVfnV/2HPoNi1RPydkgWuWejvcE5VPo63
         8PuZTVYmPjng7S3M/yXnuQYZvwDeDIWP/D/T2/vtsAo0ZmnvjPQtkpm2t3iq/z7QmZKM
         hfqFfESXgMikRgiiNWLOX3VOvJRvvHBLEsKvjLVeB8bqXLD9aO8vwnWXUzgG8v0Bhm5/
         2Ht7ArR3kZfe8XWSLGpfkS1H6bGF9TnYXUbxBQDqoiBV3MfNBIdfAbux7EEyLjI5cbN1
         Zujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o6Q3/4kBd6uZrg2PFq/lKlbRT35bb/VWc43lgrQZIFQ=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=YUR5fjXouv2wA+XfQF9nXnS47pJxm0UNGLSikY8WbM2tTcLZoe+/qxBOObihDitF7x
         JqTCDmguR82aKpVoz2IOoCO+t/lOZmIaR16ymHuw5r7yi54VUzyce72iv2aLMFj83Owc
         Gt8KTwnT0bQ2GbrjOcaC9LZgFyAWVbFb3aSG6nqxLDjpSstVtQMZTVDNUn38/TBBxVLs
         lB+Qr+gekYMzTqB90vh11pwoJwkTOpI/5qNh2Hp4AJVBq2z2Y4tApI3pxLdXEgaVTZd1
         WsHrfwLurOcBe76fc5hPwRfBruUMPb8NeCTLlsh5PXoI7THnGY5svh1C0lz/WHHynnYf
         sSDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RJHcJGuZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e66d7a0167si51143006d6.323.2025.02.17.05.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 05:39:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RJHcJGuZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tk1Kl-0007pl-PA; Mon, 17 Feb 2025 08:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tk1KW-0007hR-O8
 for qemu-devel@nongnu.org; Mon, 17 Feb 2025 08:38:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tk1KR-0002Cl-0g
 for qemu-devel@nongnu.org; Mon, 17 Feb 2025 08:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739799509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6Q3/4kBd6uZrg2PFq/lKlbRT35bb/VWc43lgrQZIFQ=;
 b=RJHcJGuZ9IXOcyKovyYJE8vAP7aynADK9DAWtPXFoiIxiJAI6Qd2dAiz2CbhZLW8TYUHkc
 Z/ly/rlcgwOPmviJHRvojTq6caZtNChT3dJNUo7IkSFVb9MKzQinEb9aBFwGtOv6wu4wtD
 mh2FZxhdczypEmOd5R2+UyDOlhrJVrE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-Js9VRgwuP9O8vKGh1-C53w-1; Mon,
 17 Feb 2025 08:38:23 -0500
X-MC-Unique: Js9VRgwuP9O8vKGh1-C53w-1
X-Mimecast-MFC-AGG-ID: Js9VRgwuP9O8vKGh1-C53w_1739799502
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BD90B19783B5; Mon, 17 Feb 2025 13:38:22 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.254])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B16C41800360; Mon, 17 Feb 2025 13:38:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH v2 5/5] docs/devel/reset: Document reset expectations for DMA
 and IOMMU
Date: Mon, 17 Feb 2025 14:36:49 +0100
Message-ID: <20250217133746.6801-6-eric.auger@redhat.com>
In-Reply-To: <20250217133746.6801-1-eric.auger@redhat.com>
References: <20250217133746.6801-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: LrSjQCzAvJgu

To avoid any translation faults, the IOMMUs are expected to be
reset after the devices they protect. Document that we expect
DMA requests to be stopped during the 'enter' or 'hold' phase
while IOMMUs should be reset during the 'exit' phase.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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

