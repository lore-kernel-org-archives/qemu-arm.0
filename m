Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp64849dlb;
        Tue, 1 Oct 2024 00:04:51 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUNluVmkxuPqRg9/XmKlI612w4cq7+LeTC+XDvrLBrSRzGFTbkQ5UA/h0r7nbcNDGjeiIyqDo5oZWb53Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHFheyu3HNrNVvMyHPQyNkC2+kdkfTWTskPV5fyiZ3wlHZe4AQBD4j8KUuwXm+8uO2kmTOL
X-Received: by 2002:a05:6214:5a08:b0:6cb:2f11:6b9 with SMTP id 6a1803df08f44-6cb3b6385f3mr214485806d6.23.1727766290839;
        Tue, 01 Oct 2024 00:04:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766290; cv=pass;
        d=google.com; s=arc-20240605;
        b=DBwAlTR3UDvneKTrOqBNS0XeJIrvvcviy9EYrDGb+rqlWxEESSORxZyeCtJHSdirJ+
         BL0a5ExJbdh1wpwVM07p2ZUgaZdiZ0EtFyLTKOQIWm+rRyse3gSapnFVKfn8zHrvNYXf
         b4U69JYHSL4FhiVLQt9gk1g/nFzSQkYUln1cAiPL0DRlF3odwOuXitHMYIj3KXCUjep4
         KwU183y932/SXMFRyiON/5bHxtA80mpIUIKAl6Eo+jtg2XI6RTkw7Ssb78uuqJI40aHA
         wEr0l7oO6RYr4ML03t7XPdp62/vZUZNPyK+x9MS4Smk5lT75zXL7ILGpdHZZ0IvpyhIv
         Hpxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=fsccDvscfqMmDxfczOUE0wTF32SZRs8L4bXdTPrHzXk=;
        fh=KO78qTbleKaDpyUVR2s7NDQgUjL6ZJ9Q/0VZfkAcqlY=;
        b=V05u3zHXZ8Q2N5MAX64pcgDxRN4447m7DlQG1VypvwCMNFBSoYa7gGmmVa9k7SosH9
         Brr5NUW1DT0KCz0/TIvXUICxK1UCjdJz7XfCNw9+/+rDf1nvXq3bh3Uaomo19sLho2BS
         7rwsBMuG5k5L2Ru5n1MlNDdWaH4mUbtIquODljwbwuzZ7KkM3LdYITP1QPixaDhsuMj+
         //+0MBX49miiBSLUU7rFEBQWG8h2FV8uGhL/hC7dD0+BaPdl3kIhc0zDsa2V12Z+B2dl
         8qBdf8xMS0tEX3H4HQ7aQqV30POjj3aCrVtgb7HdBnF5ghh75s3IMzs/hKoqTKoecRme
         nryw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KF5f9aH4;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-27753-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-27753-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-27753-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b686372si111590556d6.322.2024.10.01.00.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-27753-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KF5f9aH4;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-27753-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-27753-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 785121C21A58
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AFF1BDA85;
	Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KF5f9aH4"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA4B1BD515;
	Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766252; cv=none; b=ErcDIFIqGj+CZYr+/I7qSa3jx6hLwf/0D3ACzF3r24VCxaFhxI0+ZvA+dy9TdUeZGQWxK/Xtx8sFjgfnECXTOzF3mSModF5gEfZo3Uw2tCejVJvtVHDhjU1g1ZkZhWIDY/90+VWRjivE9zWg8jTLsuOr/mzxrVNmP8AJpsdkNQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766252; c=relaxed/simple;
	bh=M6ZBH/kqF0I5mZJYxAtLu/jJCCwPXj3PnNDutmx6SRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2EXCIXJteiicEryPYtUIQ9cAVtyyfB5++lluj7KbjXtOfEed+w8Fvbs3MNjdBnUWfb2/LVOPJ3esr15PH49KE0IVYLAOPiF/bQrRCiOrEFYtdUzZ9vMhAAqrG89RqukC+AKd2t4BJtG86rWgBI8G8jxoiN37thZvNuZ3X9lw/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KF5f9aH4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CB1C4CED3;
	Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766252;
	bh=M6ZBH/kqF0I5mZJYxAtLu/jJCCwPXj3PnNDutmx6SRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KF5f9aH4x/x8ZFxJRpIU2jA5yp6UXpuMUBPPB9risIqFeWW4yhtVO4vr/PuovIbtu
	 uPkwK5MJ9/oZiUMAR7aKZkSWGnHNCeR76/8Q2RDd2sompVD4Ook2G1HSGQCAOVdqfW
	 VV3RAy2luPcRuMOhnwMjOkTis6lQsIMoU4m/ZJ6lb9/VaTIkKx7tYgHYeEaGarRYEP
	 6ii4CEwAZP+UKLno467xyTYpB0HJ7NJJkgR1sE89oWok/fJ0hR0bYtPKjbThSV/Sb+
	 38aCfFhoDnXw+FE7nTU1eqP39irxA7pZIfN/X+W33ASF3XHDL/lZI5RbJl8pCRkys5
	 V0Eul1Aqg8b3A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V15-363P;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] acpi/ghes: better name GHES memory error function
Date: Tue,  1 Oct 2024 09:03:48 +0200
Message-ID: <27549d393ac4194dc321305d12d557ba3bc976cf.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: KG44aof64LAj

The current function used to generate GHES data is specific for
memory errors. Give a better name for it, as we now have a generic
function as well.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes-stub.c    | 2 +-
 hw/acpi/ghes.c         | 2 +-
 include/hw/acpi/ghes.h | 5 +++--
 target/arm/kvm.c       | 3 ++-
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index 2b64cbd2819a..7cec1812dad9 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/ghes.h"
 
-int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
 {
     return -1;
 }
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 900f1571bc97..3af1cd16d4d7 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -454,7 +454,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     return;
 }
 
-int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
+int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
 {
     /* Memory Error Section Type */
     const uint8_t guid[] =
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 1b988ac1e2f2..051a9322141f 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -81,15 +81,16 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
+int acpi_ghes_memory_errors(uint16_t source_id,
+                            uint64_t error_physical_addr);
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp);
-int acpi_ghes_record_errors(uint16_t source_id, uint64_t error_physical_addr);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
  *
  * Returns: true if the system has an ACPI GHES table and it is
- * safe to call acpi_ghes_record_errors() to record a memory error.
+ * safe to call acpi_ghes_memory_errors() to record a memory error.
  */
 bool acpi_ghes_present(void);
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 849e2e21b304..63419b87e8c6 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2373,7 +2373,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
              */
             if (code == BUS_MCEERR_AR) {
                 kvm_cpu_synchronize_state(c);
-                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
+                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA,
+                                             paddr)) {
                     kvm_inject_arm_sea(c);
                 } else {
                     error_report("failed to record the error");
-- 
2.46.0

