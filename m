Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1378457njb;
        Sat, 7 Dec 2024 00:57:46 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWDWlVEnrtltmEv7FQtRukpP2liDP6ilGjbfqS1CUmQ8R15oHOfRwJjVEDGKa78Rwdg8VqcO3aQ8uMOZA==@linaro.org
X-Google-Smtp-Source: AGHT+IE3VVcNYPbYVAQrkiAmM7J7uY8vP4VznfzXrvgs6xggS2YfSZlyOep5e7F8v3O3JVZgYgE1
X-Received: by 2002:a17:90b:1fc7:b0:2ee:d96a:5831 with SMTP id 98e67ed59e1d1-2ef6ab104admr9853457a91.30.1733561866587;
        Sat, 07 Dec 2024 00:57:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733561866; cv=pass;
        d=google.com; s=arc-20240605;
        b=FZlDXr/KB7FYqNBS7w9CBqQ9ZguSOkMR5feRLkpxt9UIvPCDz3nPYOwZkOazfmMXkU
         hdn1+8/5WtT4rt0IYikgvuKqWIFAkqIUJb8XBA5aPpY01rleqXzZ/sMrlnw7icAf3g30
         gZMlVKDuRX8+/PMsmCdClkPRCGJnEFjfaKf4BcygMqBsZ+xtExLIPQGS+Wq4eIn7mXgC
         lcZoZpVQ0vz8YrfH5NokW4yuD2x7BBQvB12Un5YXY8dr6CagkqFLp7E7B5mUw24JbiHN
         yZMxpo5WTYo/o/KmGophw6FkY4mGQ/aGvjJQdhnpDxS5enbrIvWKMcKwfr+4VwGt85Ve
         BkvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=njN0mQtiwNhoeXILTLsJquYkjIFqajhmhvFXoetcr2c=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=WmilC5sdFqS+54WSjpk/EPdLSKtbhM5rm7YTCnVvYujRoQk83ETuKLrzwyIHm0n+4w
         Ilm2Bnkqu5dc7JGZ1noChtEe4YYal8yIMyUpQs5wqITw9M6E6+a7Q+BWfpVPXYL2tA3J
         mEJPWKkH0gvDRaQYIvHYOELU+SeYoMVvZb7Iey53BHRljPD6xFCThAI3EPcHp6dbItC2
         itV7NYd7QkKM++91y7xOAE9SL72Qgn/oqR9+ykZfreH/Ud6aaQhAhCvJZuoTu7m6j7tm
         /FWHwOFeXOr7o/pzpChVYkeER7wTnDwBoihn6quJRPdT8FM8qW/Ixefvws0jBmPIxf/F
         dFGw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rpLnRI25;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435960-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435960-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435960-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ef4602812asi6049110a91.166.2024.12.07.00.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 00:57:46 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435960-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=rpLnRI25;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435960-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435960-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2744F282E2F
	for <alex.bennee@linaro.org>; Sat,  7 Dec 2024 08:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E7914B96E;
	Sat,  7 Dec 2024 08:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rpLnRI25"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A86C13AD26
	for <linux-kernel@vger.kernel.org>; Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733561805; cv=none; b=GP19O789SkSV5HLjNs5qXCM2r/PfhasqogZa1LG5DbeKzV4vgCvVFnTsjRtU1Xxm5mXGHe3hO28Xjl1Bcweum/MJjLMI5YCckuzjjVh6wcOEpqHCIU838n9vKX8wSk4Kh3+b8ktGEIEXUHluOO8CgkLy7G/eyFDo/wHEfNF+SKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733561805; c=relaxed/simple;
	bh=EZFsmHMf3WbcMSlyh1u3n8d24jrZ2fM6gqwzFgnZ1EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSFiyaQ2hazLaPu+O4IF8ILSvuOOJ7/SrPE0QjsifAEXcsh8US+xZcq7654iuGMYjgq+u/ncuLbi2qTjfF3HBdTnDDjwWt4m8OBkvqYF3t2UkD0qsFh59OtYbBamFqvh5HnIwOY7IqmqlD9QvTzPdkkVO5BN3T/qSU28fSYBENU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rpLnRI25; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A47C4CEE4;
	Sat,  7 Dec 2024 08:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733561805;
	bh=EZFsmHMf3WbcMSlyh1u3n8d24jrZ2fM6gqwzFgnZ1EY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rpLnRI25kA9ADhu+bFHvSFWkiT7w7hmKX79NpYztvJg+YBM3XlCI9XCSimB97irAT
	 XvH1KQHgP9WDE/GUYSrnkO8gY3kCfO869uxmKKS5v6sVyWPZy3zXO3DX4ckzcKM9PQ
	 z4BbQsQJFzhuP5SbLyJJQTMlCK2A/jAC0p2Jnq1l55uSWiG4ecKBa16wXwCZ+W9kg2
	 DRdRyT7nQVCZvsRVbXf4vrC85UJYzbhCIsEWfbLt+PcC6FTzs9xAAwKZcMdenxyGIT
	 D2ilLYJzM+6OjuhhCHsipKdDs11twZbb1SXe5DDc8nPw8PQ1Wfx9d1Fcn5MUcStQZH
	 7q3Ff1Dun8ANA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJqcF-00000005j5C-0rbc;
	Sat, 07 Dec 2024 09:56:43 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 11/16] acpi/ghes: don't crash QEMU if ghes GED is not found
Date: Sat,  7 Dec 2024 09:54:17 +0100
Message-ID: <070b31b912eae803a47ab070f1ca747bd1e69e95.1733561462.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733561462.git.mchehab+huawei@kernel.org>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: PFikJtOXIwIG

Make error handling within ghes_record_cper_errors() consistent,
i.e. instead abort just print a error in case ghes GED is not found.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 414a4a1ee00e..2df5ddf68a13 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -371,7 +371,10 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
-    g_assert(acpi_ged_state);
+    if (!acpi_ged_state) {
+        error_setg(errp, "Can't find ACPI_GED object");
+        return;
+    }
     ags = &acpi_ged_state->ghes_state;
 
     start_addr = le64_to_cpu(ags->ghes_addr_le);
-- 
2.47.1

