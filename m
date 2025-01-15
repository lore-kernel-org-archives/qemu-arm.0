Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3040675njn;
        Wed, 15 Jan 2025 04:52:14 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUjPf2hqY7yAaxxqLvpEwKCsM40jSHrGnrmUCFG6lkk1lNXh9UDQiLoofBtv5rM7ERgAv4LJoyE6ejMOw==@linaro.org
X-Google-Smtp-Source: AGHT+IGeZqZ/lVjWN1woZVeGtKLZAuq08f7rmbT1hbazQ2fvjI+AMsI1DwqZEZ0XkC9mZqLExE5h
X-Received: by 2002:a17:902:f693:b0:215:72a7:f39f with SMTP id d9443c01a7336-21a83fb156fmr380179815ad.36.1736945534119;
        Wed, 15 Jan 2025 04:52:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736945534; cv=pass;
        d=google.com; s=arc-20240605;
        b=Sc8FLxUQyIw1t5NSmvMw7lILQLEZbi7rZY+ZOpaEcwEwQjhqOUVStK2sbEYbVbUT7B
         O4W7CrsuFtclsLXdovYJz4X0ZVog1/CPJ5IYHzfgwN5ftGoaj21aCO7tJe1sx/1OEFWy
         cGdniBWRE1N/EkmIcqgiVVF19jn2o1gUKqboKvxKbK4VfYH0Dnge4t7mkTxcg2/siULf
         ieWjFLM8Z9+Bkr/d3hO5AUNwD3Zj3S4yrFx0+GhVME5gSoPwtZsy1tMp/HD5I6PcQ4ur
         xAWseU1GPmFZ0X+KBZq/8lUmZb4FP53kLwooR7qkqR7GXk0+UE3+QIm3i/zs7Hvuog/q
         /roQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=7J2TJDzG8HqRYf/QskMTPFME1l4Un9ioeJUk18Z9BA0=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=SWubciHPBw2t1F8Oxxp4zN+aVYk+pMisR0cLsrVCnnPabtjRr9onzNp8avytbJTyiK
         zC8safCkzfjfOvuN2uHCwF9sauc+nLEOvD5+duRrPJRBRSmNI9a70L/oju3WquJ58h2+
         Vf4OCgPKdlFKuPg7plrFacfez+EnDhERveJRwEPeCdbMEPllCi80Zdxp+1A0wsoApueF
         0yqRgkGWuiCXzJTZIzNmLjg+YM697DKyXx89wfUpcmQMqV1CHQXqCy3Gfimdl9rsfOCH
         aNZME8mJks6PwfFM7vURO5qtGOh3N/uGgKClpmV+2Obmnvq76m3LBsUm7fcUlHnSQ4cf
         ojoQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oO9XnvT7;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477911-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477911-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-477911-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-a31fa7f663asi16811441a12.665.2025.01.15.04.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-477911-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=oO9XnvT7;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-477911-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-477911-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3CB93A92CF
	for <alex.bennee@linaro.org>; Wed, 15 Jan 2025 12:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C51624386E;
	Wed, 15 Jan 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oO9XnvT7"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AB92416A2
	for <linux-kernel@vger.kernel.org>; Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736945441; cv=none; b=PMiIZSRgvIKmBept31x+rXkxS6UJOM/sTur/D1NjVwK+fShGinbzDo6Imyo/pGF/nyc+YWb73hOVSUm3vfHcVGqS6zfjuBwFwUNyoZmNtqKbHbcvvBW/lejM8ggYrbTrc2QFuqMWuT538U27v3ANFPs2gZhHS3CNXOa0l/ksCXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736945441; c=relaxed/simple;
	bh=3C96ssj/xDlI84cd58F7mXcZmrkIiSad87IMjZPD91c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCpUhuJBprjOAMTTJRLvjNKqXMWhwYw7Cx0KlS3y3DnaPog7qW4C0kWx6Go89BMceSMwypQQc1E4vCq/RP+1lBvm4hjA1i6pgMnyxBN4FWDOw5pWjlKmKYx+mffRJPkZh7yqqyrVe3cKsUlLtz+pUD1tMvd4fMEt/LedjR2WPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oO9XnvT7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0A6C4CEE9;
	Wed, 15 Jan 2025 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736945441;
	bh=3C96ssj/xDlI84cd58F7mXcZmrkIiSad87IMjZPD91c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oO9XnvT70YLEUsfEk2lXxwaFW0dfWP7CALVlv0qoPszXfPqM+UBv3NoIMFVv61uxl
	 vYRTo8XoiOO4rdvmnQNEyRhqUvRrQp9kH6G3OY/4qd5q16bbHipBkYHOKAln+cfyk/
	 q9SMTN4liumLpCjORhweMA9c4/7B9zEH3aWYdBmE3XGTpPsiRFyf5uDhxZZKT6ikqb
	 xhdDwp/0ZqUDLbY0RlFYdMNdVrIOuRJquoJE63gxZy67gZ+MXxrms9F1bajX/8CRFS
	 xf29Pvfwi9rOewnrWMsHgv/lHxrd6va9971UAhQZfaQDXp3riQMKG5mgeGQeIt08IQ
	 3GlFjTXaf96xg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tY2r1-00000004yG6-1JFW;
	Wed, 15 Jan 2025 13:50:39 +0100
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
Subject: [PATCH v7 11/16] acpi/ghes: don't crash QEMU if ghes GED is not found
Date: Wed, 15 Jan 2025 13:50:27 +0100
Message-ID: <c7e1665ba46df321f0ce161d60dfd681ab827535.1736945236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736945236.git.mchehab+huawei@kernel.org>
References: <cover.1736945236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: gPdGn0FbSv2H

Make error handling within ghes_record_cper_errors() consistent,
i.e. instead abort just print a error in case ghes GED is not found.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 66bd98337ac7..6843ddf64b29 100644
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

