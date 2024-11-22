Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5248354njc;
        Fri, 22 Nov 2024 01:11:59 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUIYTbvtUno2M5ak0+qhfgdzGggIb7OFLudPW3U/Uhhr+p7LGacPfQYi2l4Zpc+N7zxez88gjSTAj9rEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGMkkIPTVyc0AoV0CnvuK5YsHH7yWr5a9HAE4dC+78PXYXBcWrJahSAy1vwMwb39IAZ26Xq
X-Received: by 2002:a05:6808:1507:b0:3e6:54c8:fad3 with SMTP id 5614622812f47-3e914ab97abmr1366320b6e.19.1732266719170;
        Fri, 22 Nov 2024 01:11:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732266719; cv=pass;
        d=google.com; s=arc-20240605;
        b=OIBou8WDS2zrM133821UuVPWHcHDoknNHPY7AO3ANfHtUfZCSymzkHdKGZD1g2psjG
         K/QcT3hmdR6KuGXuy/qYrJHF9BjGGnzKjmO8KOMKUJ+3/iIO4dgDzt/cwVdftkJPFYzJ
         ISsr4ri8F9iLvDqTF4mEulKU/daeLxqtLIRIQapAUncFloe6f7F9wA/mRr34306T6oz4
         nqx92i6dL+LN72QIm9uEYm2mLlddBSzG5SoHuuigBlSJmo+mZ9GvvtbQGrU4+OLFqpM4
         JkMMvC2jhaUDIGjmw4v1kH2WAph1HyItdJJOV2kEkWghPE59cGxaVk6Qks3ITG1zfYlm
         skfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=QW7hn7Sr7ojF9znvgg3rZtwYgLgYCG/tFtR17l/BsyE=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=Q5OKUK9CdjmcMiKTE4nM6Xusg70DJiu8t4k/TydPGKXEzyoq5oTavZkdK9cIUJ7b8s
         V67dqIHOTeKYSSg8Sn4X54aanhpTtcMEjGGNm07ZQVEtx30GGU0AAuCH9Xl1cB/gqYUf
         PVUoAmgaiSaihJbV8Ajol3pReNHpHUvSameV39F58dfd2reQqkhuNctIa0VxT5iPKTHi
         LVhZ3pMaiq2p09YaYlWnMwTZL/WerKqm8iCoe86RvOKb1ycIU3KJtEkcD1QFzmTMBP/U
         aV8U9lomz9QU+k1CW8X93ZkvwjtpVmKk9H4ZTEvGGmjO3+fMjhw06YeQPpaqrbNV+g+F
         uHvg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cLd5FCWY;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417980-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417980-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-417980-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 5614622812f47-3e915047adbsi667479b6e.275.2024.11.22.01.11.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:11:59 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-417980-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cLd5FCWY;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-417980-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-417980-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B261728281A
	for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3835E1C460E;
	Fri, 22 Nov 2024 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLd5FCWY"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56C117107F
	for <linux-kernel@vger.kernel.org>; Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266709; cv=none; b=QzxAzpEGOphSDw05kU/iuy80RpGvtsN6mGhT4XvTH8llS6W3VzABq4Ao+1TXHSKh1LvOXQmheXXrrokc+kw7zzNjOkl6+YIVMNSACWcK+Y5FJ/IodD0wGtnubz+f62bEpvzmhPaa08aQwR82yYVjnbtlxDXed+krK/EJhYmI/p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266709; c=relaxed/simple;
	bh=0AQUDLyqeERjbSqSRvCL78HkKAIvkN74meWRt+QvhBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQIdvBh4WZMwLNF2qSzrG9tk13pA91f/H5YpMgSr2oVzSeUS1F9DM/GpgHW8mznxILN2XTMDeJA70Lq9chXtIN8bsqkWyD2WPE3Cr90tb31cR62NVyvPe5IxVx7XIdZ540MTYTupU3a3XAhahGcu1J2Za33g9GOame8W/aLdqno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLd5FCWY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74351C4AF09;
	Fri, 22 Nov 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732266708;
	bh=0AQUDLyqeERjbSqSRvCL78HkKAIvkN74meWRt+QvhBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cLd5FCWYYslwq3ct4I91L075lCQQTFwpn77DDvu64EA4rGJVXOea9VIZk9Ux+OIIR
	 PBlcQ2y7ZljDH2VIf3ddXwbUEHGYvbiIsyTJSzOtXTI8kYu9NEDLgUBTrmr7TQrMIr
	 T2K4TsZBL7kzLjQkUhIwRY2ne30NsRFn7k0RCgBWk/3g9m6Q6VT8KPjRkPl7IVJhY9
	 SribaSyqlgqjJFSysp9KjK4+5OydiXDKY4jGwqf89+V27b8m8psVZ9/dhBiZxrYaUB
	 M3PuRixzTIzR6sl/6HGWs2I8N73o5OSBelohgNfZ2XiXknt5zEXuExdQL7N69lqQrS
	 rx3FvdyQnFWMw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tEPhX-00000006l40-0rlY;
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
Subject: [PATCH v4 10/15] acpi/ghes: don't crash QEMU if ghes GED is not found
Date: Fri, 22 Nov 2024 10:11:27 +0100
Message-ID: <d72d9cf99ad0169a39cd3f8028ee7c2e112edf06.1732266152.git.mchehab+huawei@kernel.org>
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
X-TUID: WFPuS/NS/bfS

Make error handling within ghes_record_cper_errors() consistent,
i.e. instead abort just print a error in case ghes GED is not found.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index ad7d895def2a..25587f5fc9ab 100644
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
2.47.0

