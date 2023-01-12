Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4791276ejc;
        Thu, 12 Jan 2023 05:49:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvAfwjn19QfyEbZPrrkQ8PKEutnNNyPtI6nO2xDcdJCNH9SeHA/C6BwuJb8TSNbHOk+4mc0
X-Received: by 2002:a05:622a:244e:b0:3a5:17f0:e718 with SMTP id bl14-20020a05622a244e00b003a517f0e718mr104557614qtb.14.1673531399716;
        Thu, 12 Jan 2023 05:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673531399; cv=none;
        d=google.com; s=arc-20160816;
        b=btSH9Rpp3uLUBUErazFLNsUM6jWgXAJjmMvEFBJHxf6Reu2Mwx+h/7GrNFuuTOAciV
         gbt+Uo+jbR3ChwYG8D6UN67DuNd2+YEMzweMuVh4tU4yV5Ne7qHxKD00cu+D+cNbqE5U
         97uMxCumeXTok7ablIq5NjEE2ob3xRcbCEK4+RJGSv64tA8dKGc1foTk8BCZ7tavOxQE
         xpmlJ8mkXKpYYRoJApu+xp4uV2RQZRSoi3H1tWhjzJrcaqRUwkHXxn/ySrk+bmq4bZoc
         XmJMlXBCvrZa//ehCk1CHmjIWo2ncexORb8LXzcxAhwM+hM6TqpUX8hR39+6Zaka7KL+
         DmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=L5Ma7NoWMjnQIWPm9s6/4puDT9z5FHFGeiaRUEE8C0E=;
        b=nyQ/+r1gCQDAlIc35JtlCnp3pKn2BaPcrUUq0KkK+gmM3m2QEPvPIUbO/BIMMbn6Y3
         H/MCCTK5fTa6wA3MAsHB6dbyEUnKaB+IAw43CgtWJeSNQX36iw+kr1NvwHTRuZZsS6GP
         +g85mbUBy6nUsNxODoiBYCePT4fEvzPEi10OjqtrYynkpYPLf1iEDUXdj1tudi2pu8b5
         qHoWiiMim8vuuyyrWKFrovNMsRN8EgzVH9is+ZR/qqJFmW93t7eAogbvlItZTGuLIPx6
         9nsKTcw8SY8gGWbpKSFqhGNUVZ92gpmP6LsbIhlFQ849lNbFt8ThR5WJd5mafauQjq4b
         1NPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b7Ws+BNH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cn12-20020a05622a248c00b003a7e66da981si10880418qtb.453.2023.01.12.05.49.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 05:49:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b7Ws+BNH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFxxb-0001Te-Ik; Thu, 12 Jan 2023 08:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxY-0001SF-8B
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 08:49:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxW-00035x-Kx
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 08:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=L5Ma7NoWMjnQIWPm9s6/4puDT9z5FHFGeiaRUEE8C0E=;
 b=b7Ws+BNHOY53QmvB0DTMRbob/xRpSwXdGbNUbMWvSdlg50biDSGFMOPWcl17IrvRR2gYYd
 EqvtskEUHNU9Wz6VX2kNpZABurjWlTekqBbgH0uBrRztNUc4LHhfHsN2X06ygLDQJUnq24
 b+/ywTJAK5WHBiI1J0YErT2TI11/G1A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-SZ2NblZVOpCk4JlM3vTYfg-1; Thu, 12 Jan 2023 08:49:32 -0500
X-MC-Unique: SZ2NblZVOpCk4JlM3vTYfg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97BCE85D061;
 Thu, 12 Jan 2023 13:49:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA05F40C2064;
 Thu, 12 Jan 2023 13:49:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH 0/7] Trivial: Mark some more files as target-independant 
Date: Thu, 12 Jan 2023 14:49:21 +0100
Message-Id: <20230112134928.1026006-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: t05ngDMjIgqr

Here's a collection of low-hanging fruits to mark some more files
as target-independent (so that they do not have to be compiled twice,
once for qemu-system-arm and once for qemu-system-aarch64).

Philippe's patches have been on the list before, but I slightly
modified some of them (like fixing typos in the subject etc.).
My patches are new.

Philippe Mathieu-Daudé (4):
  hw/display: Move omap_lcdc.c out of target-specific source set
  hw/intc: Move some files out of the target-specific source set
  hw/tpm: Move tpm_ppi.c out of target-specific source set
  hw/arm: Move various units to softmmu_ss[]

Thomas Huth (3):
  hw/cpu: Mark arm11 and realview mpcore as target-independent code
  hw/intc: Mark more interrupt-controller files as target independent
  hw/usb: Mark the XLNX_VERSAL-related files as target-independent

 hw/arm/meson.build     | 11 +++++++----
 hw/cpu/meson.build     |  4 ++--
 hw/display/meson.build |  2 +-
 hw/intc/meson.build    | 12 ++++++------
 hw/tpm/meson.build     |  4 ++--
 hw/usb/meson.build     |  4 ++--
 6 files changed, 20 insertions(+), 17 deletions(-)

-- 
2.31.1

