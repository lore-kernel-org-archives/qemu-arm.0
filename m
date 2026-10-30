Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA47606A31D
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ly3/Ftny
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMnhz-0002Dk-VM; Fri, 30 Oct 2026 10:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1xMnhx-0002DG-Je
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:35:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1xMnhw-0004nA-5g
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793370951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9HoDy1Tx6gNEjwMWbZHwxdCtdDapQQ7mAdhRiFhnG8=;
 b=Ly3/FtnyKM69nIX9d6EpjSyJKA7tiM8wt6oAXc3lQY3bngyX8+AwaCsxSpaSeh34CJJS+9
 Q9srB6NyL0lgW4PR9t1kN3R5kNaS2t5XIK24Pk/R3DC++VM52aYgckIplK5Qv2WTHQNmgw
 oRn5JlFxiHr3BOBeR2ypBtRNbFNu4QY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-hBihgVI1NVuBYfi5oa0USg-1; Fri, 30 Oct 2026 10:34:46 -0400
X-MC-Unique: hBihgVI1NVuBYfi5oa0USg-1
X-Mimecast-MFC-AGG-ID: hBihgVI1NVuBYfi5oa0USg_1793370885
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48e0c896d05so664117f8f.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 07:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793370885; x=1793975685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=y9HoDy1Tx6gNEjwMWbZHwxdCtdDapQQ7mAdhRiFhnG8=;
 b=opReL3RDdmoyWgkIfSEjeml2y6L+8ihq+uqX6Jt/3mJbF3UIbtdmdR5yZDTHLtarE+
 VEMZleloMzaRaGd3DfJlgQ/51g0AtVE1TvdxnJ5HZXK7/bagiUBdxPGNTUO/Np7GnpMt
 LFE54zvOxwyZ1uLQ2+M8qkXhfcyYmT9YDZSF7QPjLnD+9Ip3CqFSOVaK1sMfADlanCzX
 6RO56gHwH2r8M+1p06/6RrlxBrutnr98vxm8HI8jwEobf1n9fqPnPS+VLkAI9+KMvNRL
 ddodR0UdHvPlOYWx1ajIMokN8wn5yEBINbH+j1CSw2VQ4LiOGL8R3PaaIWvOezi0EovP
 dl5Q==
X-Gm-Message-State: AFq9FYIs4fErqltAu78tWhUsEtUH7AJah8pwJxap7/UQ0cku89uKnCFF
 UhiVa6s6AzsDiNlNTaACqgX2OC+aWdiurrCEOTBW9LPjMymFYnXhIAtAQeQOY//l8XAy4J57qXg
 9P7hZjawwhlt8V0/fAdEmEz//7ysHiKr83JtMwn+9EfL1pP7l1zhCauQXFIpYWQ==
X-Gm-Gg: AYBFou0xo2IZCdegzPfelL2/5p9hy1TGrJpfBWCiAjItdyGEW6ZOmZttX4z+2Kggd9a
 aAFra0EGHHos31t9PCOipbgEUsJw/5YIatQ92MJY14S14yr/g5+c1dFYxVqi6r0p/oBEe+bQvKH
 aL/t2zq6kYov5D64x2WOQjhXkmswu/RFc+a7BzlcBwd8eD9gy63hLynvLLU95gb0wpSGb6THqx4
 JJESF8E1081dZiiuibLvqTvbftPYXmGBEBmiHg/dr4XrVCY03bA4MjK2GuFMQQq8FdJs34xJwoA
 S653zSqoP1r/6xXsMZeyNXen9M0GThbjY3GYsDfF5xzxDTT5nETKsd2+Qd0INEVxQFux3y1Pb2h
 adz6xrkNU967XQWqQJUKjK7W2IPlFVDtRZnVQmC1Okc9h8/fSwlpjehfVZVpLAfqv2L1Rb9K42w
 pUPAX2D34s2OHAGi0yQQbUJ4N3KZQYSAr118B9sWwlUWd48r/I
X-Received: by 2002:a05:6000:4914:b0:48c:69b3:610f with SMTP id
 ffacd0b85a97d-48e6e5008b4mr6301873f8f.26.1793370884701; 
 Fri, 30 Oct 2026 07:34:44 -0700 (PDT)
X-Received: by 2002:a05:6000:4914:b0:48c:69b3:610f with SMTP id
 ffacd0b85a97d-48e6e5008b4mr6301815f8f.26.1793370884360; 
 Fri, 30 Oct 2026 07:34:44 -0700 (PDT)
Received: from seott-rh.redhat.corp
 (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de.
 [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71bae25dsm3102924f8f.59.2026.10.30.07.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 07:34:44 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
Subject: [PATCH 2/2] target/arm/cpu64: Define cpreg migration tolerance for
 PMMIR_EL1
Date: Fri, 30 Oct 2026 15:34:32 +0100
Message-ID: <20261030143435.57230-3-sebott@redhat.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030143435.57230-1-sebott@redhat.com>
References: <20261030143435.57230-1-sebott@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A4n8i6516RFp04FHJsq3bS8_jOU29Wmi1WIlybnHf2U_1793370885
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PMMIR_EL1 is exposed from Linux v7.3 onwards. Backward migration
to an older kernel would fail without cpreg migration tolerance
definition for this register.

Since qemu does not set KVM_ARM_VCPU_PMU_V3_STRICT the guest will
RAZ this register for both the old and new kernel.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 target/arm/cpu64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 96aeb6c7a0..1547ad1cd3 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -787,6 +787,14 @@ static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
     arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 3),
                                      0, 0, ToleranceNotOnBothEnds);
 
+    /*
+     * PMMIR_EL1 was unconditionally exposed for linux 7.3 with commit
+     * 453f6ff04b8d ("KVM: arm64: Expose PMMIR_EL1.SLOTS under strict
+     * PMUv3 UAPI"). Tolerate backward migration to an older kernel.
+     */
+    arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 9, 14, 6),
+                                     0, 0, ToleranceNotOnBothEnds);
+
     /*
      * KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
      * from v6.15 onwards. Backward migration from a >= v6.15 to an older
-- 
2.56.0


