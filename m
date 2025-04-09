Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7769231njd;
        Wed, 9 Apr 2025 07:44:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2d3iWpF5IJnfh9VKfjmgJLisZIz+fKrHx5GuiI8LvYSSFVt2kY+VbMCN708DixIk29LiLvWD+KOH9/w==@linaro.org
X-Google-Smtp-Source: AGHT+IFhG2VwdnA5brCRPR3OqLoiplqf0jsoioVi5jYCQPyaVO2PGE6GP7+0isjQhqLissfLqo1D
X-Received: by 2002:a05:6902:a04:b0:e6d:ecbb:e515 with SMTP id 3f1490d57ef6-e702f089cbfmr4622542276.32.1744209888311;
        Wed, 09 Apr 2025 07:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744209888; cv=none;
        d=google.com; s=arc-20240605;
        b=BKZ/kRIizP6EAQanyaTpPrj5u4hOlDd5lCZMSD3t4D/sIt9PexDEkKKWXKVT85b6Uc
         nl7xl6M68NAIjy/8a33U8L9mLcMC/pvG0B45LHXodYBHantQA6KvIShX9bV66LK3H3Ya
         VF0wO0xkWiB3mTA9CdoXh+lrx/8ZSn7kJarPgnRk+a2fjcPzAzRHsfZ28cgNPxJG3K4l
         0zrepstoXrALTu/vpb0rskhVtLjYnnDVr/NSTETtk0ia5tb2gibm/EPS96EBIQiR1t/N
         bOL8B1e74eYg2sPKdJbp/mHG6zAftSwzu+AKbrmTHmm09VMkoMyRwAJu4Be9uah8wDAP
         F2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ekskBF5GBKj4mH3h42hATvRtDb2eBG485Gn9iKgB1aU=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=KquZs8J8wbFc2XEISIOVk+nTJfmY13lqRRhWjauanWq9fVYq4rdARUeVjCongDeXUG
         h3Lnkd8c+hBsYu8FQX+VUo8xrxPR8E/GEeXCaHpir+iCbWlaBmWWSUWOl7T4G/qsL5FU
         esYgyDfWETEuiCf9Pzrb2Yxo8eCP/EvXRso1vnoQHL8Qnq+IUzLR2CLz082+C52vkaos
         3ICa0Bk8TVCPm8QCzfRp8NPmWETTdEHeESFYBni/BL152TMPVmUWiFafFzpssro7HN7X
         bQ2rB6+lJmUaEq0V+g/ZSlP1RtUc3ZzPCpeRaw7GuqPrMMQVmQOoNIZbS2SKSszIuTVk
         g6Bw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NQe09ng+;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e70327c0126si1729309276.280.2025.04.09.07.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NQe09ng+;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744209887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekskBF5GBKj4mH3h42hATvRtDb2eBG485Gn9iKgB1aU=;
	b=NQe09ng+1SF6JkKFmUK0rb8bvzjW9Pye6KMH//a0Ji1ALk6M8XVzOpy5d13vydvbp7AuCn
	HXbIweA6Ep659UYEVU/piGmYC8LGOYnW8gf7V05UlYGGxaC46/TQ3zqGuK7pdp65Llk5rO
	uFoswhqf1ZUYTlYyJI/MHaAcbSj3+Hg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-4iq_yQ7dNQSgag1WJprv9Q-1; Wed,
 09 Apr 2025 10:44:43 -0400
X-MC-Unique: 4iq_yQ7dNQSgag1WJprv9Q-1
X-Mimecast-MFC-AGG-ID: 4iq_yQ7dNQSgag1WJprv9Q_1744209881
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56CE619560B1;
	Wed,  9 Apr 2025 14:44:41 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.45.227.4])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C10B11828A83;
	Wed,  9 Apr 2025 14:44:35 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	agraf@csgraf.de
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH for-10.1 v5 13/13] arm/cpu: switch to a generated cpu-sysregs.h.inc
Date: Wed,  9 Apr 2025 16:43:04 +0200
Message-ID: <20250409144304.912325-14-cohuck@redhat.com>
In-Reply-To: <20250409144304.912325-1-cohuck@redhat.com>
References: <20250409144304.912325-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: TDQAunILBEgN

Generated against Linux 6.14-rc1.

Reviewed-by: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h.inc | 43 +++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index 6c9f9981cc5d..02aae133eb67 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -1,18 +1,8 @@
-DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
-DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
-DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
-DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
-DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
-DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
-DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
-DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
-DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
-DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
-DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
-DEF(ID_AA64MMFR3_EL1, 3, 0, 0, 7, 3)
+
 DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
 DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
 DEF(ID_DFR0_EL1, 3, 0, 0, 1, 2)
+DEF(ID_AFR0_EL1, 3, 0, 0, 1, 3)
 DEF(ID_MMFR0_EL1, 3, 0, 0, 1, 4)
 DEF(ID_MMFR1_EL1, 3, 0, 0, 1, 5)
 DEF(ID_MMFR2_EL1, 3, 0, 0, 1, 6)
@@ -23,13 +13,40 @@ DEF(ID_ISAR2_EL1, 3, 0, 0, 2, 2)
 DEF(ID_ISAR3_EL1, 3, 0, 0, 2, 3)
 DEF(ID_ISAR4_EL1, 3, 0, 0, 2, 4)
 DEF(ID_ISAR5_EL1, 3, 0, 0, 2, 5)
-DEF(ID_MMFR4_EL1, 3, 0, 0, 2, 6)
 DEF(ID_ISAR6_EL1, 3, 0, 0, 2, 7)
+DEF(ID_MMFR4_EL1, 3, 0, 0, 2, 6)
 DEF(MVFR0_EL1, 3, 0, 0, 3, 0)
 DEF(MVFR1_EL1, 3, 0, 0, 3, 1)
 DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
 DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
 DEF(ID_DFR1_EL1, 3, 0, 0, 3, 5)
 DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
+DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
+DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
+DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
 DEF(ID_AA64ZFR0_EL1, 3, 0, 0, 4, 4)
+DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
+DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
+DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
+DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
+DEF(ID_AA64DFR2_EL1, 3, 0, 0, 5, 2)
+DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
+DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
+DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
+DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
+DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
+DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)
+DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
+DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
+DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
+DEF(ID_AA64MMFR3_EL1, 3, 0, 0, 7, 3)
+DEF(ID_AA64MMFR4_EL1, 3, 0, 0, 7, 4)
+DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)
+DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
+DEF(CCSIDR2_EL1, 3, 1, 0, 0, 2)
+DEF(GMID_EL1, 3, 1, 0, 0, 4)
+DEF(SMIDR_EL1, 3, 1, 0, 0, 6)
+DEF(CSSELR_EL1, 3, 2, 0, 0, 0)
 DEF(CTR_EL0, 3, 3, 0, 0, 1)
+DEF(DCZID_EL0, 3, 3, 0, 0, 7)
+
-- 
2.48.1
