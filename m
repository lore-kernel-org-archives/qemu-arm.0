Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5249051njc;
        Fri, 22 Nov 2024 01:13:22 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUw7a/FImbX100+LqGqHmACOVZei6iuLpUtPYXlIf4leJSFGeXfLLgnw31bepfoEIUFk2LkeJZ3+HsGDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF7UxOi90N1k48QxJ/ODhutlu5I+pYGtmZz9KAMTS5qHEL5Ge1+Zsm9MAOdLwtTObpMBwKm
X-Received: by 2002:a05:6a00:9a3:b0:71e:6ef2:6c11 with SMTP id d2e1a72fcca58-724df5eed58mr2866591b3a.9.1732266802134;
        Fri, 22 Nov 2024 01:13:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732266802; cv=pass;
        d=google.com; s=arc-20240605;
        b=W4CuUWa8mgleVVC0m2jpSAMup+N7+WCww/oqDLdUoGQb1YOP09XN+qWBIbLlzlt2In
         mR5HRVzopIWLI0q3sYMRItUR2jdtg+4Ls3JYgkNwr35b+jeKbXAPpw1yCGhv5UDq9GEo
         PGPoDyMj2G5BU7X6zjU4rkjJaS2TAKSuSQuaWRdLaMw7CZ8OtXGFhfjRbl+PVvVo/Fws
         kK6dnwY+GKAyiRMVUO6Q7iorZt3qizU/KH17hCs+Ft4wZOs1RYOptK1bi4ucg5P5rdkp
         jzcPOoN+8dKkF9n6THoSIr4sQr3UzmkgC/SQW9nknait9VY2jad++X5uksUZGfb5y3PY
         MRbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=n9x5aQzj+IvDsFYx1y1zEKyOO12WDlToovYdk4vtUIk=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=Dp+SyX5z0lwDreFrEpRrM9I3c/+OGoNv5y5YSa8kCIl2+U+67zOTG/yIKNwT4NiI6N
         MuO7Wvk22Wq9N3GEPC3sijIR78q0OfdfVU+rgPr/uhEpZ5P+ZumTZJkEQ/HFeckUuicF
         UxW9HanKOk2JVxuVmWFA69wPXCOwRVDtctmTO4NiycjsJQnTR0t40CarTXISSESRFqLM
         wBmsFzCcv/P9ecSm9I16GF9ggLl/54Lyi2EMHOPoRy84ydp5UqtBGzE2LKQ2VwZpSd47
         yucf8qRYZGLIS2u+mBhgv3rZlFbJx6uGr82eCzXsGJqLwkV/H6c2YMAY5qoO+WUNHcKB
         QRow==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Xgim6UF4;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417984-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417984-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-417984-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-724de4db6d5si1746867b3a.11.2024.11.22.01.13.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:22 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-417984-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Xgim6UF4;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417984-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417984-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19874B22C8A
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9471DE88E;
	Fri, 22 Nov 2024 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xgim6UF4"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E5518A951
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266709; cv=none; b=igZN2Jv+We9UEHx9T396ma7M+Jv/SXV2TaHdoOug3sPzP5LYg0RjQSUV2L/0V7nC+YrnVSlXnXjwV0a8YOFJl0zbIjJfk8Uvi+5QS64YtLY+Goe4Gc71n1o37ee4RNo7gJT/JuLYvHxXDCx2I0jOiXYZ80/tlBOnudk7N2OoCr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266709; c=relaxed/simple;
	bh=80tymdZsA4gV0nz/70yruPzz2rfWPx4O9L07JwfBNsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l865q8oI1jbnJz9h+VPQBbnrfN7xHS5O+Tl3x4b+9qzFE8Kqmh5FsCLsKDUvZTOM/0tzz0RV+2musdgGqbi4ABp76EWL9EdktKK2WO1nyCaYTsk/cwj9RRHM/KtAbndhD/9/hbGvCrNK5xGv9mJU7UKMborjPisUX2znyHHToXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xgim6UF4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3EAC4CED7;
	Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732266708;
	bh=80tymdZsA4gV0nz/70yruPzz2rfWPx4O9L07JwfBNsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xgim6UF4N0aFf5qEPKNhNevuAd2AV+b5ufeY1q311b+8FuojhUkU9e6pcFx23nJBl
	 4DoBCZ6MrFh+rhuCejs781gBaWAncJqYs4ie1/SAhEaqlwztO2ipiejzTj8ZcIBjfS
	 7aBg+pVmJVEDiZgJkzxm0EbBI8SQEPaWVMnxXMqVpINBMXSjXkudsbKZzmJLR6MWxe
	 tw5ZgAFbDWVByq/YgbI1DeJEkGgAe07C31X08jBYSHhGhxHBgcIGLM9olf/QolSW/w
	 Sad9VfIgSQsRzOaDtwBDy56NQFuk2I2TmqOwn3qSO4YiefPYTjirj4bNC7z1DIQOC8
	 5NnMIwYsXjIsQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tEPhX-00000006l3k-0JEe;
	Fri, 22 Nov 2024 10:11:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 05/15] acpi/ghes: Fix acpi_ghes_record_errors() argument
Date: Fri, 22 Nov 2024 10:11:22 +0100
Message-ID: <fcb73712586b5b465252fd6c1f5fa5fdb2b40d7d.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: v2Hc7M8dj+k+

Align the header file with the actual implementation of
this function, as the first argument is source ID and not
notification type.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

Changes from v8:
- Non-rename/cleanup changes merged altogether;
- source ID is now more generic, defined per guest target.
  That should make easier to add support for 86.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/hw/acpi/ghes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 20016c226d1f..50e3a25ea384 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -73,7 +73,7 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
-int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
+int acpi_ghes_record_errors(uint8_t source_id, uint64_t error_physical_addr);
 
 /**
  * acpi_ghes_present: Report whether ACPI GHES table is present
-- 
2.47.0

