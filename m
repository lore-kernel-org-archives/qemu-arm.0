Received: by 2002:a05:7022:698c:b0:8b:e46e:3391 with SMTP id cj12csp65208dlb;
        Tue, 1 Oct 2024 00:05:42 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVfBOPYWl+XvXqaxC+9XKbZAmW/128dnAiA/d3tEoAEneHuY4Hchse39lCQR9t8odd/tiVDPQjXUoan9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IERsKpdPkfTQVirTAKQv+bqY30/OtE/Cc+r/Wj5dkD/27nhGGV2rf6pV1Td9RVbx1MsFCvD
X-Received: by 2002:a05:6e02:188f:b0:3a1:a179:bb54 with SMTP id e9e14a558f8ab-3a344fd82c0mr151526785ab.0.1727766342226;
        Tue, 01 Oct 2024 00:05:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727766342; cv=pass;
        d=google.com; s=arc-20240605;
        b=DPojG/LPHRNfYBGo0uVxPHHbtOY4PsJjWOmG8NmyAsGkzdPm2GyQfRjI4lFw0LMkJf
         VPgpgLwu/dyReWion84Jy7YNmz0Ms2RipQgN5FqiG5tFI5CU0elx9cqEvlP1G+waHSyP
         n2xO7MP2on5Gcx90Zb6rKK+upliWFOls9cPlQ+sU37YRPLTLSxFFx+NcopnfkZfkyP5Y
         I10cyIPgSYODEaob0bEYPyD8JGW9F+gNIVKwQOZQ4mgLzRmNPaQ10C14nbEhImytGoDS
         qWhTT5DBKNX30bFCWCeBcdtkhzWjUoANQNMTIIqeYDp+vsPMqMJjIlYPCiQphWtYLmYd
         6/IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=8D8YxNvC9EtEt4VNZvDkfLu7uA2XUBzyFaaBiIORTHY=;
        fh=A3Vf0hodLwKHs9QV7aLOHcBHloasd8C9PfLtK84qXL0=;
        b=NvMHGfEhSixlfFk+g05n1K14wI47TvI28GA9bl4vmGeDmUAzIgIwTISGs8KghfWkF4
         svRWttUwjWnxc6e32WTIzoYNu63KV21jYpJDWdQDgIL5jAvmrUEdfgdToLfIo16iAnjd
         Y/eNDySQxAu3sckOu8ITUJu7MJoRNyru3dfBeCEHrUxObJfZW46RFsys39FNhPlQbNDd
         nym6iyJe094M37hV6FHVmj7pEyHQMR4EkpZgK1TkO2zxy8GJKe41KwLZgKj4e9VYod0D
         Jck/uSabKJ6ZPw3H6noNZZG/MUGigZBSeFvTRP8Z69wefYvNC/PL0MYNes4ukRh9JAFt
         1BHg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LwvHTe6s;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345361-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345361-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345361-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7e6db6f7af1si10286282a12.806.2024.10.01.00.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 00:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345361-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LwvHTe6s;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345361-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345361-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F1A7B227D0
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 07:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F1C1BE844;
	Tue,  1 Oct 2024 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwvHTe6s"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761481BD50C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766252; cv=none; b=ntKSpRNf+4UpIezrHaEJ9Lkquy97CmZPa9+vsey8i/SkcDHym75/tjFVNC7qhPPgFfxHFIBdduz0uDcy9/9kI2ox23JrA5uNAXbMfh1qXmOCHRLC+KHLHnsQlYB2pko5VbTxONeX7GEgyZjPia0z1mu9X9yqE0uZKONux865Svo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766252; c=relaxed/simple;
	bh=sRsbSliw/+ZXQ/ZQ+dhrxx2M70UfTSUIKGoJ5MP3coc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGKOZ+rIXF+vrkm/3MJ/e+mVBabSG5IGdssmkBzEUYImPB2P3+4Mk5kmgctS6BXN+t+lGtxnHjijAMZMbwqZgRuXGtCtMe7ZlZWGr6NkNZ3loUM6Oi+cpPP782GHGDnMpbtTMPCL6D1KrzIoOgVQW1GLOhcLeTDGUdtnaP0RJDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwvHTe6s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0606BC4CED2;
	Tue,  1 Oct 2024 07:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727766252;
	bh=sRsbSliw/+ZXQ/ZQ+dhrxx2M70UfTSUIKGoJ5MP3coc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwvHTe6s+Vq2Bv/Ow3XuXGR2JU7N7lNKsHZj32WvdnHbN+H1IoS4hiExkhqBc9ruy
	 3kGaNbcdy89SUVAP18D9CxArlAhVD71sKgdiHBJa+hSXS6VDGZM4qswrOjal6j1ZC4
	 OJ6KKrTTsLIIsObtOOgXQIH+fB+SE4oySlWyc+t3ZWpnlVD3VUQGy9usvLqSEnYOIZ
	 MQr4bkcYrXtINiHwhnsdaYm+wmcadeIzTP/16G/rfYbpKQ8f+M8kD4hKSv4azh5+MD
	 KiuvQkPtOoXP3UBWUVBi8Y+Nme8/KeKjPUmUPNRIEosodOZF2v0R4mxLP/JksyYQtC
	 9j1M9/vZSpwhg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab@kernel.org>)
	id 1svWvY-00000001V19-3Khk;
	Tue, 01 Oct 2024 09:04:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/15] acpi/ghes: don't crash QEMU if ghes GED is not found
Date: Tue,  1 Oct 2024 09:03:49 +0200
Message-ID: <18c69e8c7a6b6ac365397fe1f442f3ba0cb83be8.1727766088.git.mchehab+huawei@kernel.org>
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
X-TUID: eynJcm0f0EHj

Instead, produce an error and continue working

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 3af1cd16d4d7..209095f67e9a 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -418,7 +418,10 @@ void ghes_record_cper_errors(const void *cper, size_t len,
 
     acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
                                                        NULL));
-    g_assert(acpi_ged_state);
+    if (!acpi_ged_state) {
+        error_setg(errp, "Can't find ACPI_GED object");
+        return;
+    }
     ags = &acpi_ged_state->ghes_state;
 
     get_ghes_offsets(le64_to_cpu(ags->ghes_addr_le),
-- 
2.46.0

