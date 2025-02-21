Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp327632njc;
        Fri, 21 Feb 2025 06:36:14 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXPAV5wfEtMpuzG2SdsnVaOOv1o7zXxPUMGH+9NZDPz2rO+XkZsbK77MaCv+e9P7yCxEJsumUTGyWNDXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFOsHrtWvto2W2rGlGxV13K+ELt82GZQLQ/ORxWisdtLQnLpmzJ2FKsm3OlTVH7ci33QxQU
X-Received: by 2002:a17:907:9709:b0:ab7:f2da:8133 with SMTP id a640c23a62f3a-abc09c0985bmr390109266b.39.1740148573963;
        Fri, 21 Feb 2025 06:36:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740148573; cv=pass;
        d=google.com; s=arc-20240605;
        b=IHOnTpq9TWnf/rU+g+9sOLFFovZK2vU5zW5XJWFLehF7MJoWW9Ms7qN3otXv1XxxHh
         VUl3UH5+Pco1qyIK+RaR276tdLMkYf3uufXeBpTSSj+z6o2iEXc+jwCBTU6dCukyvTaf
         ytQQwa6PSkwiHV8Fy8/1noVs62qjz157yEuixN4fq6kGcNuquWIYmjKNp8a4vu2ifz6b
         52KLA7StJKMJyevqu+gFNXbkOS3Wn0LHHoyAe23Btjfdmp52pmIN5qzT56BrtvdtGDm5
         uQ3wLXCCvG5DM1mbp1+sRnj4qM+OA4ZIkUhQBubQPWoCLcU2Yj6xX9QoQ2aJDIWAXBfp
         XUyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=cTYJnesHEnWKTwKbEMt1TxAcoTfuwKIoD01FJaTsFro=;
        fh=vRlcgZ7942FHQd1Q9f6uT6HY2D7AnE0jt7dFCXEYTHw=;
        b=S5w5p9mCfOqTMlCuuh2/1pXXUvTLKuPEuHGOelbau41qAbScmUVxV/DOStkXi/VZNy
         nBWPJeBV9VwcI9QRy5xrU5LDvKGnYrWCFqQ4W2/Wq8ePn5XSmZSbLqd1Eeuo0jt7o1Nm
         Uoqco6GvXHxQ4wZzLaMxDPmXymefW3XFuyjg8dHJvZ3GX/8woCzFHwKIUVWzp+DnZqUh
         yXu/+AaEcICIu9CDQNkhStpy7O5nufrj9QkB95di05ZreWDG2gBUTPqBmR9/XFw6pwJg
         JVHwToz96LSM7aWNpSJ37EcwqM8xvmp6ZU6Ma51wbgfjCZe/at1F0Bp8q0tqQjy/Y65W
         XdQQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RGmZuAac;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525916-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525916-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-525916-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-abb7b421428si1034948566b.784.2025.02.21.06.36.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:36:13 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-525916-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RGmZuAac;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525916-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525916-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1120919C6DE4
	for <alex.bennee@linaro.org>; Fri, 21 Feb 2025 14:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443F720FA91;
	Fri, 21 Feb 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGmZuAac"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011981D5CC5
	for <linux-kernel@vger.kernel.org>; Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148536; cv=none; b=MvLLjdU8sa7GZWNjR7Jt4gJYEJpakSU6dFo+z/Jabt28Bnfy6t6Ni0uxLrM08q21oESfQAUj51SH9PNf+Cl4aA0AQj6e3b8EsBRwlnIFkj2hxXw4jW3m4S2an3nwsXognU6OQ646G709KMhRumnQmCBcsQ53oW65xE+dt5LJ+VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148536; c=relaxed/simple;
	bh=2D9pZyu5nvDMala9KRXqJgIj56Nko/r8tX77RBHNDRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YYNDO+Qx9/iACbSIBaGwcO5HsgHVstNU6842HPzYiggmQ8Ez8INB3CUVOrNyLwVMdGPzonWkH3amS7jr/KJj3dCZtS89t/wkaQBp+hQAl2cKVajwJzPzUtgWDyABpShOLwdGrB+KoodQP6RjuVKXJ/hdliU++MM8eAF+HO8rmjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGmZuAac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811ABC4AF09;
	Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740148535;
	bh=2D9pZyu5nvDMala9KRXqJgIj56Nko/r8tX77RBHNDRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RGmZuAacj5ew9jGw2Eooh+7wrnBPsvIX5y82oo/pf/fd5ZKL1e65o2ZfR1BkosawD
	 YnL2PB9pLJXXeXe8GD8hrs95HWZkeJO8Bj1OcsFl174cw4djFOUYkM20dMT04WYbMv
	 s599O1CFgueLGQT8J7iTK/znnCKnCjjMcYRtWnbW3qrLPS9AccdLQDk0UZfBYhKoBf
	 1SvkkZjTMHQuiUDGwIGCKTTfjJri0NJqoipR547U8/Cs+QP4C8ZWWXvtmofs9y0OnX
	 erptTMq+xe7qj4Wc4BKONhHedHTw51bZygmff+UtgRM6ZndvkOzZIq5ZVb6cvxe1oT
	 NzZavF2QgvEeQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tlU7m-00000002jEB-3USu;
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/14] tests/acpi: virt: allow acpi table changes for a new table: HEST
Date: Fri, 21 Feb 2025 15:35:19 +0100
Message-ID: <94ff7f7ccde4c8d74c7838c0021cbb453e91f12a.1740148260.git.mchehab+huawei@kernel.org>
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
X-TUID: AGS6wzYgfa1l

The DSDT table will also be affected by such change.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..1a4c2277bd5a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
-- 
2.48.1

