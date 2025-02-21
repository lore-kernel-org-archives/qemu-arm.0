Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp327287njc;
        Fri, 21 Feb 2025 06:35:43 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWFQl06JL3VFWzLj61PUlf+NedEKt4znabNWcgxU0PuKL6DCwYTZpltfvDM3IWjvpG4XuJbaoPU4bZzZg==@linaro.org
X-Google-Smtp-Source: AGHT+IH069VqdSf9h3mWoSITUfdOITM9UInYXzGBz14GpRJUCCj8G6+Tz9EdtpVFe64JF1nr+fs6
X-Received: by 2002:a05:622a:152:b0:460:aa51:8411 with SMTP id d75a77b69052e-472228e54bemr29893981cf.24.1740148542786;
        Fri, 21 Feb 2025 06:35:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740148542; cv=pass;
        d=google.com; s=arc-20240605;
        b=XWON1HlQvIr40+vQiN9pgHG7lpaQkU4/1rMr097OWRAKqdyzqr6d0Zzogst66oqZxV
         OM8YuOuxmttyCq1I1f0PwRh/RyVyn8aooOVc76iudxV7OdcHaajgw1sdKq0ywk53wzHl
         dYOWN1OM0CEwWUV3+gd/0HQfGQoYCx4+Boz7QU0z8Hiy28A5rnCGZc8PGpDPNFMkoaV/
         yfA18JzvQ6JrDfYWWSIhhsTEFmQ7muRmAMI6LQ5s5hRbRhb/uxPUap3X0n9xEh6E+bX0
         pvVi0H/wkH0S3aVHj61waILk2yhrz3EJ4IVHgF6c/Ag61J8ULGCUgmLFx8wmnYU3AH2U
         NU/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=i5WuX+nX3IFTc7+r+jrgxFNLDZ/rv24Dgcg7Ru/wpEg=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=UFAnuqv3cmtH+pzQQUBnlHCAjq2VYYPoxCfN5/m0IoHY70qG3QkR/yb9EwlIuL2TzA
         6QbaGk5lILxagNdnfRTM69T1wnQ/fs/cYbWWuxtRGf3WozKUu1BqliPaXAB7OHiZw61c
         TUdrCK+9Kepdvihj7ZY1EAxN3mpbYaJd2SFLXQ6e9AdSijVGnPbFCfm3pKYOudR7H3bm
         FbdsiiJVRSuVpAOa1R0xBUd40SkpRnZXD1HjaAqtaNihzeFx/uuRDo2pEpo55S38WNuv
         jwIbVJDO0sLho/PJ2GZR+7WvrWmNF1mk2vMryrpSKDfaesI9xU0cxaQ07K8DQVe6OzaM
         gWuw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ifIvxEfL;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525915-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525915-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-525915-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-471eca69004si100129881cf.651.2025.02.21.06.35.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:35:42 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-525915-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ifIvxEfL;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525915-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525915-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C76A0173DC5
	for <alex.bennee@linaro.org>; Fri, 21 Feb 2025 14:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D3920FAB4;
	Fri, 21 Feb 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifIvxEfL"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011387080D
	for <linux-kernel@vger.kernel.org>; Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148536; cv=none; b=MbSiI7sj8a9QkbAxs7GZxuauCDt3GJH4QBLuUZg0yWSXOBav15oDCr85ysF0edS06JSaTxw4YBS3vBsV1TwuVnVoFp5E3MnxFQtPuyYxHvk7cwF9Uw22eXb3xD+X+zg2npbSTcP+33Z4LnQ/qz5L8PhbqXRhv4QA70nDwwkahK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148536; c=relaxed/simple;
	bh=ZghINpclHLdwPAQFtSkbNEiY9+NlXye4CKMUjN2PB+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlFIx0XVTwwiu9hyNB16hoiE44Epto9O2pkKAWv8w4qcUsn81Sg2CoF0qInrhF3raq4ID3YHRR+bssJHGGiR8udldgzmkkgSuvvhQFlwGQxR3OGo2Y2/tObgs9lIEPv72QzzFGjcRDfEKSmuQe+dNnpMNWqxMIDDuD3x+rphVY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifIvxEfL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A100C4CEE7;
	Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740148535;
	bh=ZghINpclHLdwPAQFtSkbNEiY9+NlXye4CKMUjN2PB+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ifIvxEfLfgKOrrNg3SNfe0ytLuVpPsY1RoLtujzOU0aZ7T7MbJ0QQI6G0JwH3O/NN
	 JKkuGU2f9wLTcEih90g8/CQEUYxoLhGgLc8jNI1zK41Mtc4fKLrIpWeK9nL0LvbNHc
	 MVMS27o/YXfWlkaZb9Wnu4bgsyxBhy720f0khk+4Dr00ETsd5lltqrChutX95dbCzY
	 tLDbuh97DM/UI0Bx1ZnyQQQzfPPht0UGUb8dKsMhSuso0hg4axnxWIQ/UuQ5HZcaDN
	 pKiJ/BvXmfOFyM9JaNcudpQosbmNi1IwJlTSHqtOs0221qpSt1yC350U+g5Ksy0dwS
	 W2ATs+QJfkz6Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tlU7m-00000002jDr-2uzI;
	Fri, 21 Feb 2025 15:35:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/14] acpi/ghes: add a notifier to notify when error data is ready
Date: Fri, 21 Feb 2025 15:35:14 +0100
Message-ID: <a6d308aec49c3ad9a5d00baa34ff327eca70eb7f.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740148260.git.mchehab+huawei@kernel.org>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: zPqDW4K8LqK5

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4a4ea8f4be90..f2d1cc7369f4 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -514,6 +514,9 @@ static void get_ghes_source_offsets(uint16_t source_id,
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -570,7 +573,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
 
-    return;
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
 int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 51c6b6b33327..219aa7ab4fe0 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -24,6 +24,9 @@
 
 #include "hw/acpi/bios-linker-loader.h"
 #include "qapi/error.h"
+#include "qemu/notify.h"
+
+extern NotifierList acpi_generic_error_notifiers;
 
 /*
  * Values for Hardware Error Notification Type field
-- 
2.48.1

