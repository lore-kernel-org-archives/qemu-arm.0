Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1013987njb;
        Fri, 6 Dec 2024 09:22:40 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCX0Fm/k89wpbHxL2Qwe6drtIW9YA9DY0caidi/c/j2HUWXkuzsAfRDK3lsjuhGvJAe6NeEsISxzDrbdlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEJi6e2bIIIZ/1CJftA0uh7PHCIKBUhi5km3UZJ4ItD0701UQvlEs6bVDoBgwhMU95r7y/w
X-Received: by 2002:a17:906:328b:b0:aa5:3979:cb3d with SMTP id a640c23a62f3a-aa63a080181mr329194666b.26.1733505760764;
        Fri, 06 Dec 2024 09:22:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733505760; cv=pass;
        d=google.com; s=arc-20240605;
        b=Hzvu1T8XUN0rYXTXigneLMT6BPtMc5iMnuY2DIBLGICZbX5BAJztxuE5HAbslPGlsp
         /9vYDSD9RpVBgBHfRF55PyE6gpI19/2mZEFi2BHEAv6bk/ASFS4Mi9RYEPXZUTUzuiPf
         k/GbXIXX0gcGBrM6BbHk55Li7yTz9pYLN/fPWbf1XNKMx8GViuEygFT57i9cZRG2z2+k
         kfdM8BxQKeJiaGK5Em+Qq+RmU4cxrKGi9/QFCCq10V7OvFb44vQkovqO7RYopiE+vdiW
         NcZpCdeI10oaFTT00fVA5yNsvH8wV/Ghk8eX9tIZxnJfBhU6VBfCPi9g3zcOuImBpYVh
         qLLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=njN0mQtiwNhoeXILTLsJquYkjIFqajhmhvFXoetcr2c=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=P9MexeFfhngliflUrHW2dpCMrzGtjvqeqVsZ93UMwCShBYvBVJZRBM3ZQNSedhX6rj
         Q0R2GBvVC+ODOAkK9UrZvrw3gB+/ytI9eWDwopr6XQEhBW5xjRdw0BaXxPBm+prsDPAJ
         Z51yEPUEp+fJwASAoVpNqYYAw0ROybqsLDPVa+Y2MLFY7Bk3RnD+4r1zRBNgUxH9jrzi
         gsGHtjn1Dbf7Zx0zqm/xVBnPtgS7u3n9iHQdv86NWow3f1QUGciH10Kje3PcnW1upfpS
         k+Aldc8aLW5i+vHBpgbKGLoiZXV3gAJAt9c4ayPjjZsOFUeXY3Bdw4skvDgDVJJlRWRW
         Rbnw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fycifNtu;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435389-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435389-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-435389-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-aa625edb843si291016466b.4.2024.12.06.09.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:22:40 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-435389-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fycifNtu;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-435389-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-435389-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9535918833CD
	for <alex.bennee@linaro.org>; Fri,  6 Dec 2024 17:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18699216E1E;
	Fri,  6 Dec 2024 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fycifNtu"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2FD203D46
	for <linux-kernel@vger.kernel.org>; Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505688; cv=none; b=EXJBsO0uWF4ZdZx19sQQEjxZpMu3/kcVrZbYf90iP7NlflBbxNsw9kLtQ4qU7Fvz9IUji7yL967ESkd25mZxMI2fhzf34zxiaiJGVsEClOtLvJhyB6wF2uZVwR+z9sQRGauCKAqBR3Frw205jcCwBDLd65yfjsKv9TAsbtMBQz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505688; c=relaxed/simple;
	bh=EZFsmHMf3WbcMSlyh1u3n8d24jrZ2fM6gqwzFgnZ1EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nqZCva41YHXw25+AOm1gldq2RpNJ583N4L3RC+VO0acMpFO9GtNtyU2ykodkDwAx5lKxUyWP2vC5i3TWvmPWOMle+WlBRybrL5WZHgfHSNtBt4r7gJpxHZSKkQlSxsjEtyYvm9KmERF8S/AEiAnc7fDJFu2liR67BtID5xcnwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fycifNtu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D053C4CEE9;
	Fri,  6 Dec 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733505687;
	bh=EZFsmHMf3WbcMSlyh1u3n8d24jrZ2fM6gqwzFgnZ1EY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fycifNtuEjP/MCgBm6JPBOptAWGUXxqwpD0CxnlHGZhhvRp8hijf8XEaBY0uOepN7
	 csBVDTTb5kycySak7Mz+TOlkk1ce1/XX2JpRSA1z+7MMykODETLNtwx0/T9+XS6VE4
	 rl6J4eDIoKloPSA57yAG8l2HdF2qBJojnBGOasH+FsX7YVYgKe9karOf4oAiCa2IK1
	 KVycZuZ+8EEZ63qZn6L3JLC8QWt6wofvVsFjSEDv066GLiMEzdXrYmrCakhmmZIjXj
	 9MFux4Ha415G3zqTWXPrqMdEojGlQACqAYa5hquf0bmVYpFPYxaLxfYq0PdUUrcDsK
	 /ehphYruOdgqQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tJc17-00000005RKE-3DUg;
	Fri, 06 Dec 2024 18:21:25 +0100
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
Subject: [PATCH 11/31] acpi/ghes: don't crash QEMU if ghes GED is not found
Date: Fri,  6 Dec 2024 18:12:33 +0100
Message-ID: <de6e3d9b672d780b9fb778f6e11c6f4df43bc1a4.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: y76d6g2znxAp

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

