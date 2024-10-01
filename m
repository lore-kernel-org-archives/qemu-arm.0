Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp65133dlb;
        Tue, 1 Oct 2024 00:05:33 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXrwnhcEpXbnBkR/J/wT+R08ZV1NVuwekVRxFs+6b8ifJ7BnymURlexnF0Dkw+iGot4079rWMZXwQhWww==@linaro.org
X-Google-Smtp-Source: AGHT+IG1MoomeYtS7QrLLjUPwaprikRVgYaeiPZ3Kd16rTrhEMWHyFGZv4h2ovfPFGmn7lEVNKjU
X-Received: by 2002:a05:622a:414:b0:458:320b:5160 with SMTP id d75a77b69052e-45c9f1fbcb8mr263196971cf.22.1727766333457;
        Tue, 01 Oct 2024 00:05:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766333; cv=pass;
        d=google.com; s=arc-20240605;
        b=aCMAXs0uFJekRdwht0htiaZeFHBqZ0HZWVooerUqGgtXPJaaJhUJ2QkzChjqP+zL6q
         M32Kcqgp6pnjjLsp8xZRyPnDyGGjmOJJPRDCOaYssAjv8xC9BDTVFA/zZQPuUvQx9l0Q
         zhmgCXiIsNXmVJwJyG4o2VT2bWXvYYjlwgYg5ZJoVhNRqbdh7K+i53FJXjr4zv8NS0MJ
         6vMv+9WlNSMpPAMOy5vMzm+Ne8Etv7RsE+7A1l4U/JB7cmtxQ5lHq2xmYTgDjht8tR3T
         GP9KBPwrN7sfG1ET2MyRcNlHp3aFqVlZgN2sn6tDI2KVAyhSO9xd9RKkOqUIvcy+PvXB
         Hdsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=EGPbTn63QETQnOhv99a25000keSQDIbtZ1fc3/LYKJ4=;
        fh=rzGDMRJFBBrjbOaW7dLpUOdm+9c++WP8RCbD+hTQXmk=;
        b=aUqeikgLAyBsDf2HqJapoozXEtNEn/cFphTzxW49ul6QEaJZPENOSnKDMD67zmuscn
         zMFXoTSILhPCS0Yst84htpnYB9ofnsgY2tfHR8uo1HqDCVtAhNBudFfpL+2C9ptBvkvv
         pTnbD+dmRIq0kVXx0aCB2q9LBer8R5YcqgDJaucL3pLHQ98+X5y0KbvZtaurPNHXA5bO
         tRqBUIkLHFVSvWBF+Ae4SUeUw6KKFmhNVO2zL0qTw4xjeS/buijysPfJPr2F4sJatNZm
         x4cSU8J/wMGkr8O7jcUVYit3yHcda+4DuK/wkLFFj+/JpR8bjnSlic+mdkB+6qYoIrWY
         We5w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LZVgVXFS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345356-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345356-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345356-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f290923si100064841cf.145.2024.10.01.00.05.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:05:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345356-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LZVgVXFS;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345356-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345356-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A0401C227CA
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8AF1BE24B;
	Tue,  1 Oct 2024 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZVgVXFS"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAB1BD009
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766251; cv=none; b=V0duq0MiVeLDHNhSJU+JPVY9mREyR5M7hfo7lb8pbGD1eCyb1XCaFONYf9rQGqADHUecKDeic9h+6bRJOos+2kXe0iaA6tEz1+caUajUlTY9xi+uROblgEYuOjZQHxwcmlbjTnjZ0n5pLokfoF3XrQK3uoMowLgfWAqdpWIY+ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766251; c=relaxed/simple;
	bh=oc7bFCfLChkAeF9cYYri8XUZmZvoO0wDOpJN/MoAvyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IE4cYJfTMR4S9xSn6Vaz39cC/yXXd/R06ak+Gntmv2b+l0xpcWWQo5S0eau7qgijXe7t1qEd2sQIunjq6Yj1Ms4ZZXTTvai1R3pMsE+6niXN5dVIe/uHua/PnV1Pigo5RqDtvzwDzHMSIQlie2OcncvzqXyXxqXVANsz/JxAeqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZVgVXFS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E82C4CED8;
	Tue,  1 Oct 2024 07:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766251;
	bh=oc7bFCfLChkAeF9cYYri8XUZmZvoO0wDOpJN/MoAvyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LZVgVXFScYeDWgv+/ebQa0TDe0a/AnOvdD9Re+vOIEZDbWz+yaL7KtGC0WDQzdEE1
	 5rrj48Bkv04psiIP5xGRuec1bh/VzhfmyeYNbJDmtGewjrkFm/fZIq1ks7Vgwq1UO4
	 pYg8+Fi2JL85APYTusX5hzDldz9SkQjdrhHEeeYnO4LddCyZmCH5f2ngTyu/Jt27ZD
	 6hGm5PXFvVDAbnVKKqAubb47o9zgD1UZk6iZptLd1iMjuKAdFu4Sv5XxOq1zBszLac
	 7vOss5B5gVL/UhzYA8Bhzm9jGAKgFhUCon36dAcAMt5WqEiTTIyYu3YQHRywApAw1g
	 44PG4upRTCb+Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V0g-21XW;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 05/15] acpi/ghes: Fix acpi_ghes_record_errors() argument
Date: Tue,  1 Oct 2024 09:03:42 +0200
Message-ID: <7c2862061ef4b358154414127f6cfd231310660e.1727766088.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: wv7LRsJjZMvP

Align the header file with the actual implementation of
this function, as the first argument is source ID and not
notification type.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

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
2.46.0

