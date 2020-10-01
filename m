Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp249183lfq;
        Wed, 30 Sep 2020 23:21:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRGSkr5dgkpi7br/RJKBVKh+Tm7+dN4yKeLtyCHIEiDdnjG+tkFzckbhpO4HXSjyGhZruG
X-Received: by 2002:a25:8389:: with SMTP id t9mr9011059ybk.471.1601533309829;
        Wed, 30 Sep 2020 23:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601533309; cv=none;
        d=google.com; s=arc-20160816;
        b=r3whkrG6clsVUHRjWNRM8qbstt13SxauOjzTcO82lN5R03kZrIItcrnbHDquvJHCC7
         /knT2Ljqn7enoH7in2HFBNVM5GtfrbVbE/OvajyZlhPfxRBmvp+PxQ8x4eaRwRWHV+w+
         tjhKkNCr4cx5JRlw0kRAWrDk9zzfiAmehjH453ePfkCsr5wE44cNOCh1CPT+PxVAZijk
         NNcq/Yw9Kl4dh9eBJ3Bkk8RsTvDOBs0ubJcQptXrJuum1JLpliGOn5FR/gYVOikG9IZB
         QzuPvSZHgKBhjJBt7gBNkbPu4yWEOa/gEJTH+HkUkqIQDel3o6D51zUnQd4aY5Uiw3vG
         EWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qozuzyWIIUkD3H8iW/Pdp1MSaWMoH53JCt3b3Tc2H3E=;
        b=FPMHjeYTSVbYKzSTzlixeBWaPt3beIEdz1U1pIftlz7apx5Cr5lW97GC2iUc85Va01
         cFqac3/yKV+JUrhl77tOnz+khqkYIkG9VC9tnki5mrS8AA1o4hwvksJSUAfEURG7vjtv
         zKiVVt9r97oRpGLnq8o9FI6Q+fcA3pMX5FlAwzjarFRM5BPvaU8+2BlVFoiJWzvt7z+D
         IDcixdF2rdLXGxUL4O+Sh5WeAhwDYc0QnlTX+a2fl+0fLKHbSy0BU1haPnI0mIeciOem
         0wGSk3miSA37HFrQGhyPo9d5H+qh+fr1BbifM2Sfw0UOc1JxEGIGDpC+624yCm0MU8Ez
         K3Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZENHq90j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c184si3745555ybf.140.2020.09.30.23.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 23:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZENHq90j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNryP-0001VC-7U
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 02:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruP-0004Um-R6
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 02:17:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kNruN-0003ss-Kd
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 02:17:41 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601533059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qozuzyWIIUkD3H8iW/Pdp1MSaWMoH53JCt3b3Tc2H3E=;
 b=ZENHq90jr4p3Gub/DYi3GxP+jbiIrgSlsk082gyQT8Q9t6Tn7qsyBdhw15kjq+mwZvN36u
 /Kq+Okp4KqByws79zndctaTMet+Usg31TTW7BnuB7AuGo4XKzp2KkVD1E2Vry0GAE2VdP+
 8ydVL94gN+sGi6WmNcv/I2uvQ56IMuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-EF1c7_qEP0mNeAv4hqsqaA-1; Thu, 01 Oct 2020 02:17:37 -0400
X-MC-Unique: EF1c7_qEP0mNeAv4hqsqaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EA0680EF9B;
 Thu,  1 Oct 2020 06:17:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A328E55797;
 Thu,  1 Oct 2020 06:17:34 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 5/6] tests/qtest: Restore aarch64 arm-cpu-features test
Date: Thu,  1 Oct 2020 08:17:17 +0200
Message-Id: <20201001061718.101915-6-drjones@redhat.com>
In-Reply-To: <20201001061718.101915-1-drjones@redhat.com>
References: <20201001061718.101915-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 00:27:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WQB5GwpUKdw6

arm-cpu-features got dropped from the AArch64 tests during the meson
conversion shuffle.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 tests/qtest/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 874b5be62be2..db169a53b530 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -146,7 +146,8 @@ qtests_aarch64 = \
   (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
-  ['numa-test',
+  ['arm-cpu-features',
+   'numa-test',
    'boot-serial-test',
    'migration-test']
 
-- 
2.26.2

