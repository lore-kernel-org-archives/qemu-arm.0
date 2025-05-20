Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304033njc;
        Mon, 19 May 2025 23:42:11 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUKN7+4ZotbsxHSVGTRLm0SHXo62JPGgkgML10ilZ2tP0ai4UwcAYZgE13DyYZUdMDfLIwIq66zJhaZmg==@linaro.org
X-Google-Smtp-Source: AGHT+IHK0+vEmawcR+qGVhfvIlED9M94Y2wVNXjYdOA1xs0olowIRsz3x4jmG9BLL39m/YaVAmSA
X-Received: by 2002:a17:903:178e:b0:223:3b76:4e22 with SMTP id d9443c01a7336-231d43d54e3mr179058055ad.6.1747723331441;
        Mon, 19 May 2025 23:42:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747723331; cv=pass;
        d=google.com; s=arc-20240605;
        b=BsOi9mDI1cmFs2UOU9kBfSQatoe9q1d/iL9Ks541B5VNcFaAvmBwkQ50k8mLt1sXih
         3ffZcCro+DeQY2SjcHABYXYuTEP8+DeZh7G2dUWA327r/RNgBF6l7C6k1PwHz+QEboOe
         7YVoWAtLKW1LnVYfzRlSC8CBBUlwgbw+kePDRIhWD9dujAnyIRD9KDUUCPrcGH45wWSH
         +cw9PPdAZLnuAdIL74HreG91A73W31LDpXq+1GzB3q0As10CMDZcSCiBeV9Ww6OLJWfY
         NBYH4rR72LKZdJ4GQnfMsD2yjxRFJwfvYYh3tte4KfcfRAfSqnWi/QlzcsdGvy10Un9c
         IGYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=4qxGklo/JtayfWexug5mhPqTKDFRg9klTXYdFFJRXGs=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=Bx5R2Jg8WZadxcAec5H+AUyhVJSpu8BDAk7ab6HcH8Mcnkl3FiIQ2tciuaMyakM3/F
         UbZXF0NBtCoeXTQc469pHHmPa0016q3C/NXNTBBob9n65gYTmo6bmKzN/f9ByMBGEKfu
         bDwuUW09rbMVxkk6r2WZEQGl3mjlQrtGFOZ3zyMhVToL7mAIxVIp21LKk922H54ocaG5
         ZuHdOmorKUN27hBJ2z9wfIGK25QeGbeJnBN5bNChcFl0eYDzPeKu84g/emplBMPvk5Zk
         004oA3PyLei0kUGhl0TiqP4HyCcisauLR0ZjpmqDgLe+Gcd9mfffFtaj2MFVu7deUQ/C
         QmEA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=VBuYz06M;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655007-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655007-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-655007-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-231d4ee0843si115551675ad.581.2025.05.19.23.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:42:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-655007-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=VBuYz06M;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655007-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655007-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47FCC3B4980
	for <alex.bennee@linaro.org>; Tue, 20 May 2025 06:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901E525D1F9;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBuYz06M"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E83225CC75
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=YMjlFlRLDUCoFTRuIg9ajyh/aPvNc2HLOD+JVbLTso2gUl7AEE5OzkSBasAsIkajLeJSq64HIx1LTkxN9FaiVtIrETvFgk9qMxFTxPlJBI80m4S+0ZkP/RYMMJ4zMRbqa/uJTDj1sN6wd/jxzT3zNZQOvaLOqhwREUPEFMA/Izw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=Ru70Z0gfk7r/ztNDvEUpiGKGD5w8V2rasl2zsjCvPA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ps37YaZX+QrhNkzbxhUk28CHwUSM6jytjJ7tedkKkGWaT30wqVaFJRR5S9As1neGBjvlwdp5j+25KJfL/j3yVD4ceiA/+8b8M+L3dClUl9zbsoM4E9Msj6sOErrA7u1nHJfsKjUdQwAF3nKDwxAFQZbKwDKxPBkl8LBszePdAYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBuYz06M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3228C4CEE9;
	Tue, 20 May 2025 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723315;
	bh=Ru70Z0gfk7r/ztNDvEUpiGKGD5w8V2rasl2zsjCvPA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VBuYz06MRfh9VZgXTy6TtG/VN96a0tEFAkJyi3giyKjMIIfXe79Uy6URatuzkSpsX
	 f+7Es9GWeQxVkCUTt8B+tQ1xg+staHWIIOXP+/GAdi+VTyVueDiSuC1QgSuA8nLfY7
	 dgQrcTZHixh1kYlehURs6Szy+YbEsPcQdDisiWYUzKLClDEnoeXCKriDenBbVEkrZT
	 ZCpLKHPd0TDicgukrrjsL0InEUumhMrAo+/PZ5Srl+b5wSIHSzf/qBdruwEEuRJ/Vg
	 xZKe+MDi5ATv0csVs2bKBhMgpaBVRdZdr01hqj4N/Cvl6mxQURCCqR9B9K+G/+r6Si
	 u3b1ecWMiFgiQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfh-00000005qtg-3yev;
	Tue, 20 May 2025 08:41:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 11/20] acpi/generic_event_device: Update GHES migration to cover hest addr
Date: Tue, 20 May 2025 08:41:30 +0200
Message-ID: <5cfb087459104f5661ead08748c9712f2dfa1ef4.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: VCCURhsRQ324

The GHES migration logic should now support HEST table location too.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 7a62f8d5bca1..d292f61b4e41 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -386,6 +386,34 @@ static const VMStateDescription vmstate_ghes_state = {
     }
 };
 
+static const VMStateDescription vmstate_hest = {
+    .name = "acpi-hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(hest_addr_le, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static bool hest_needed(void *opaque)
+{
+    AcpiGedState *s = opaque;
+    return s->ghes_state.hest_addr_le;
+}
+
+static const VMStateDescription vmstate_hest_state = {
+    .name = "acpi-ged/hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = hest_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
+                       vmstate_hest, AcpiGhesState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_acpi_ged = {
     .name = "acpi-ged",
     .version_id = 1,
@@ -398,6 +426,7 @@ static const VMStateDescription vmstate_acpi_ged = {
         &vmstate_memhp_state,
         &vmstate_cpuhp_state,
         &vmstate_ghes_state,
+        &vmstate_hest_state,
         NULL
     }
 };
-- 
2.49.0

