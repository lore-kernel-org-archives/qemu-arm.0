Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D547D1170A
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 16:11:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQSy2-0007Y9-Fa; Tue, 02 Dec 2025 11:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vQSw6-0004wc-8Q
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 11:09:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vQSw3-00006c-Pa
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 11:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764691742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7+Ad1DQku/KL3b7bCdX4+uTWQCvm0tEszy834Ayws4=;
 b=IVx8cYxKOmOe5GXguHj3oiJc9Ats5Yk+2HGqv0u9sNA67dcmoF9fiQRtK4si/Bvxv1yDuX
 NQzHpDCphCLMGjJnxOOt2tAHtoT8e0SzKz+BZQ43teXFrRSPorefybonGUXiE4nZZXqgbt
 WoH9nV6Nhm68jyXHFxOHOVGTnTO3Edg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-lh_p7Y-qOaqtaZDP2JBzAg-1; Tue, 02 Dec 2025 11:09:00 -0500
X-MC-Unique: lh_p7Y-qOaqtaZDP2JBzAg-1
X-Mimecast-MFC-AGG-ID: lh_p7Y-qOaqtaZDP2JBzAg_1764691740
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4775d8428e8so47215485e9.0
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 08:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764691740; x=1765296540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U7+Ad1DQku/KL3b7bCdX4+uTWQCvm0tEszy834Ayws4=;
 b=OU2oQo/R2bSfr84HAZFVAUzeMcCMbAbsmJyoCdts3KefRv0HZhIVITRwrsjuZVRnPh
 PgOvoaSqhRNDFigtXkeT6UWESqBRpfP5G3hANpIChhhYxwKn2Qc2gbeYUrVUhTEFdki5
 O7kFhxKcd+IqsXhf9Z2P4MuhSEpijjlGYT2zcM7Rh+s0G9d5F/CXnCPQa8opgknh/09X
 vzBW2x3P3WAgAKODZfSnpxgEqsSaAOZ0846iS5DNWrd0Lp2og8A7e6D4ViiKMOXhuEpU
 YsdwK/3IX8Ej0rv2HaS9Pg/9P3nMjlYZG2duqFRW6y1ldra3D8kAPwBGLslRrEVTsHmF
 0Osg==
X-Gm-Message-State: AOJu0Yw6Poqkrh9UDNP74Geqd43omG3DVleOw0yP/ZMBZHstXMvQlytr
 7RGbH2NnC4I0Qi/sn4VAKVTcyJaZlOEEylo4e3NfKtfTiTrU3HjMYpVwvDbsZSK6l5ZiyaOH/eL
 tvLV+r53gmLvEK/uEeibxYKAzJaS4OE1IDP0mSAIt3RFmQKz9Jsu4sQ==
X-Gm-Gg: ASbGncuCn95WUgXqoZ40F0ANr6z5ZdENLYgnAu6+BZQs1KSOMpth0bQJWn/SwztUbbA
 hMhXFH/R0L4TlHyJVgYmmRIhqnei49mIRLfvmDwwloxNarRrge5dzHpFE5wJmi5E6P5JM8txs85
 LiGMArUq91gyQVcrxKQfs/XU0wXvEYcPJHes1wcpLhbE6QZ8py7cbIi9PfZ2AMBuOlZYvmagyrD
 +1CHKLq83MAqCmc8927g/fB2VcxxMlCkYkDTdTVQE3O2Z9VUnTN3A9hPYUy/4bFlBH098M0WUsM
 ILbgyoayR2uG7I+agwpCECf6Bv1WjAkHrp0yuVp+Tzp1nanxFV7bzm6haxzamBL4hJimJkyM9Ba
 jXmSW1RSL2PHW1XEdnpn2diqRQa95xPe60+qqhX+L5X5b3zYtDKErLwNITj0j0zAJFqet3gDg
X-Received: by 2002:a05:600c:1c8a:b0:477:5af7:6fa with SMTP id
 5b1f17b1804b1-477c01ff636mr474350605e9.32.1764691739642; 
 Tue, 02 Dec 2025 08:08:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCJcOKBkToQRQqCimSXYNAuCA53uuEuTDBUZ/jgsC1gwfTGJxcvlPlmY/zYIMOG9XF+jmUlA==
X-Received: by 2002:a05:600c:1c8a:b0:477:5af7:6fa with SMTP id
 5b1f17b1804b1-477c01ff636mr474350245e9.32.1764691739282; 
 Tue, 02 Dec 2025 08:08:59 -0800 (PST)
Received: from rh.redhat.com
 (p200300f6af35a800883b071bf1f3e4b6.dip0.t-ipconnect.de.
 [2003:f6:af35:a800:883b:71b:f1f3:e4b6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1caa767dsm34300899f8f.38.2025.12.02.08.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 08:08:58 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v4 1/2] target/arm/kvm: add constants for new PSCI versions
Date: Tue,  2 Dec 2025 17:08:52 +0100
Message-ID: <20251202160853.22560-2-sebott@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202160853.22560-1-sebott@redhat.com>
References: <20251202160853.22560-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5zsa2nUvStAtHX3rswsOFDLHV4jxMEfpj4I0Nfg8yto_1764691740
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add constants for PSCI version 1_2 and 1_3.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/kvm-consts.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 54ae5da7ce..9fba3e886d 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -97,6 +97,8 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
 #define QEMU_PSCI_VERSION_0_2                     0x00002
 #define QEMU_PSCI_VERSION_1_0                     0x10000
 #define QEMU_PSCI_VERSION_1_1                     0x10001
+#define QEMU_PSCI_VERSION_1_2                     0x10002
+#define QEMU_PSCI_VERSION_1_3                     0x10003
 
 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
 /* We don't bother to check every possible version value */
-- 
2.42.0


