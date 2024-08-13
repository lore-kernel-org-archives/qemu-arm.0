Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp300569njf;
        Tue, 13 Aug 2024 16:24:25 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVupZaUfNoY6b4VkUKEeOR/om3C0GVKM23TzwdRgu3EyG1K0KqvMxEgtQO/QMf3HHf0N9Zpjk9CaeTMyKzQwL9WM2F7jhgq
X-Google-Smtp-Source: AGHT+IGjxpxMvjnh+qXAwN0938HG212IxN9NcL2amawovezYz+qggccy3BTDKTuYaC/FE8h4SquH
X-Received: by 2002:a17:907:c7e6:b0:a77:c6c4:2bb7 with SMTP id a640c23a62f3a-a8366c0e5a7mr61210566b.1.1723591465010;
        Tue, 13 Aug 2024 16:24:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723591464; cv=pass;
        d=google.com; s=arc-20160816;
        b=hOEwdbbjZr/8Z0Xg6sau2sIgIXgy8VwOx8so/bSnS81oDGgRrABFmzmx+PvCIgYIDh
         v4w0l0upgexmvfJufR4Y60TyqdFaSExG+0/PMnzk7UIwvoFmT96PtexhB/r31W0h7OXV
         FaDycFDyR74ablEUjPMqsXKx5rA+GRiPZrbcsg7z5CLMfWKjNd1t8YPV9GA01a8tFfre
         wUFwGW8pyfx47mZldrXK9yYglgi7QLrccj8cm5Xs6E3oJH0L91FDHIowQZ/Aymjdc1V1
         egRGBwELz32ZxA5Db/qK7xzeUMc5YFcMzxKEYe1LEHmDtJf1eIxDUg/xdZte1VyRwbbx
         8gew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=1PLgStfD5KZhTUU/wO03qgb/rj5o9KgigZ0pOlDR3lo=;
        fh=/A1Jk9ewZ81/NwMlhJJbmsFJMBNnZp0hdN4unxYVqf0=;
        b=qv3YJ2CrFhuej0LphycJ1ePnYkamFAFUrYMTxQ7ylkx14ISPguboimeW2M83mSnl5n
         Yrgi8cZYwDFSx8IdlwUNNh1Lts1rLQj89JpkMFb3Crh9sRZCAZU9A+mjtgH1LQtHUSrC
         BkDFDHelmYPgAqSaSx1sBlz9ihi+YcKkxPxD5AUciNxi5Rf5GHKFdSUxTM1iCCsyq2oV
         Ibu5p5D4sBRRgOzI68k+wHpBt9HDDPgLAoqsbAvYdvcSWaFvCUunm7WcR5JvQijjj0lU
         NYlaZcg/LdIVthaTdDf/Nh7UxwrzCFIR53AKo8Bdhwa8fgniFI1DPmGfJk5Tk4sRD5Sb
         DpOA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nTK5MBEC;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285618-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285618-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-285618-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a80f3f50fdesi148646466b.152.2024.08.13.16.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 16:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-285618-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nTK5MBEC;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-285618-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-285618-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95AC31F25AC6
	for <alex.bennee@linaro.org>; Tue, 13 Aug 2024 23:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07871AC435;
	Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTK5MBEC"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DCA1ABEDC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723591451; cv=none; b=CwnJEUgjWru1tT3B+iaVgZV13AdsomNHVLKoMzyjVRizS4sAGd0CoyJ/cfomMOnwIxFAG6dHPK8PqZjn6cA32lAd+K7EsABjKJAqzbMRl/QGyB7i+NfivvXJbA4HLhcLoBneDW1KpdeJbGTyZTrJd0Xp+vFwilD7nkPPy9FuL8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723591451; c=relaxed/simple;
	bh=7SZ1So9xfJQq48rQZfysiQEF2+M+2VHIMENgBvOnmBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jk9g5VsXHMRQ2tqvcx2tntJfSLfF7MFauQp1mLnXQzTampHafDiPME2jDzWQ0uhzmjXiOal5uC9KjB2WJs8HV8LXPs0Yqrxx41dqjg4JURVIgT0IeAHO5baw7QsEcOU0b4DukoK3uzPzandPpFHBxNCF2NIdatiXzleHsyvk+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTK5MBEC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3F3C4AF10;
	Tue, 13 Aug 2024 23:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723591451;
	bh=7SZ1So9xfJQq48rQZfysiQEF2+M+2VHIMENgBvOnmBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTK5MBECnzDZzBeugqMxgAZwqQ9opBQO48aKxxt9N3UW1YlqSqehUfKqEZ5x/OqUU
	 B+t51h7DztOunj02fc4+x4Ywxa1GzdjB7xmbLXCLa8SZViuF/GG1rcYBY+WUemSUo9
	 Ug9vyoixyBuNIHcqsPf6oYvDdglRmuzj9VYWTZ+VB9EYLCKa0+ma44n5q2ekG6hBqE
	 72dE1W7Jj9rzBRsgSaawGBtPTXnpbYSsgtm8Ewj2dpVU+GCSuNu6ZiudJ51pkIHFzp
	 PrfhpV5pYsOlBwED1jWw7jzBbko1BUVREF0bTjSgXLz9WtrEtddd2/mwTspYSFix15
	 FYMNStd6VIINQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1se0s5-00000002asU-1mFo;
	Wed, 14 Aug 2024 01:24:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v7 06/10] acpi/ghes: add support for generic error injection via QAPI
Date: Wed, 14 Aug 2024 01:23:28 +0200
Message-ID: <2104a34f6233dc4a220739348f1a21689fbd3354.1723591201.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1723591201.git.mchehab+huawei@kernel.org>
References: <cover.1723591201.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: K53uSzUxo/uH

Provide a generic interface for error injection via GHESv2.

This patch is co-authored:
    - original ghes logic to inject a simple ARM record by Shiju Jose;
    - generic logic to handle block addresses by Jonathan Cameron;
    - generic GHESv2 error inject by Mauro Carvalho Chehab;

Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 57 ++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/ghes_cper.c    |  2 +-
 include/hw/acpi/ghes.h |  3 +++
 3 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index f93499d7d647..2f6b50d57ed2 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -495,6 +495,63 @@ int acpi_ghes_record_errors(enum AcpiGhesNotifyType notify,
 NotifierList acpi_generic_error_notifiers =
     NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
 
+void ghes_record_cper_errors(uint8_t *cper, size_t len,
+                             enum AcpiGhesNotifyType notify, Error **errp)
+{
+    uint64_t cper_addr, read_ack_start_addr;
+    enum AcpiHestSourceId source;
+    AcpiGedState *acpi_ged_state;
+    AcpiGhesState *ags;
+    uint64_t read_ack;
+
+    if (ghes_notify_to_source_id(notify, &source)) {
+        error_setg(errp,
+                   "GHES: Invalid error block/ack address(es) for notify %d",
+                   notify);
+        return;
+    }
+
+    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+    g_assert(acpi_ged_state);
+    ags = &acpi_ged_state->ghes_state;
+
+    cper_addr = le64_to_cpu(ags->ghes_addr_le);
+    cper_addr += 2 * ACPI_HEST_SRC_ID_COUNT * sizeof(uint64_t);
+    cper_addr += source * ACPI_GHES_MAX_RAW_DATA_LENGTH;
+
+    read_ack_start_addr = le64_to_cpu(ags->hest_addr_le);
+    read_ack_start_addr += source * HEST_GHES_V2_TABLE_SIZE + HEST_ACK_OFFSET;
+
+    cpu_physical_memory_read(read_ack_start_addr,
+                             &read_ack, sizeof(uint64_t));
+
+    /* zero means OSPM does not acknowledge the error */
+    if (!read_ack) {
+        error_setg(errp,
+                   "Last CPER record was not acknowledged yet");
+        read_ack = 1;
+        cpu_physical_memory_write(read_ack_start_addr,
+                                  &read_ack, sizeof(uint64_t));
+        return;
+    }
+
+    read_ack = cpu_to_le64(0);
+    cpu_physical_memory_write(read_ack_start_addr,
+                              &read_ack, sizeof(uint64_t));
+
+    /* Build CPER record */
+
+    if (len > ACPI_GHES_MAX_RAW_DATA_LENGTH) {
+        error_setg(errp, "GHES CPER record is too big: %ld", len);
+    }
+
+    /* Write the generic error data entry into guest memory */
+    cpu_physical_memory_write(cper_addr, cper, len);
+
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
+}
+
 bool acpi_ghes_present(void)
 {
     AcpiGedState *acpi_ged_state;
diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
index 92ca84d738de..2328dbff7012 100644
--- a/hw/acpi/ghes_cper.c
+++ b/hw/acpi/ghes_cper.c
@@ -29,5 +29,5 @@ void qmp_ghes_cper(const char *qmp_cper,
         return;
     }
 
-    /* TODO: call a function at ghes */
+    ghes_record_cper_errors(cper, len, ACPI_GHES_NOTIFY_GPIO, errp);
 }
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 2524b5e64624..dacd82c6857e 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -74,6 +74,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
 int acpi_ghes_record_errors(enum AcpiGhesNotifyType notify,
                             uint64_t error_physical_addr);
 
+void ghes_record_cper_errors(uint8_t *cper, size_t len,
+                             enum AcpiGhesNotifyType notify,Error **errp);
+
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
  *
-- 
2.46.0

