Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368072ejc;
        Sat, 9 Mar 2024 11:24:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4TYwYaBUOz7hVZxmNs8Q1jlJh6BIp/y27T/UnU+xc1Ya0YtfKDUwR6CNb39RPiI7rn/bSoLzXeVyuRKfpDEnJwHX5EHWw
X-Google-Smtp-Source: AGHT+IFuq24ATr9TGNbPdWu9cB41pUOzSDoLw3FvOutkdErTmqtkQM4FTsGD3NoB4XjYwvbrt0hq
X-Received: by 2002:a05:6358:89e:b0:17b:ef6b:cea3 with SMTP id m30-20020a056358089e00b0017bef6bcea3mr3237143rwj.10.1710012250233;
        Sat, 09 Mar 2024 11:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012250; cv=none;
        d=google.com; s=arc-20160816;
        b=yB4eqWK0e2rdNKTmZv8yDxURo1+iNbiuap1DPyeWVObYtlxuvhcicGuVPJTmQ9sFST
         B/phbz5n/dh+Vi7VEZ572lZzpKO7YObAVhprSTB30mT9Vc//S74t9AG3p/pPlvouDjL/
         uWHeQluDTAgOem15KqlYO/81KppNxJN49QTO5tXCULJ0UnUc6TDjOMJ9Vp0AeO2ah0yS
         67rRn2EEKT/dUt9JHzD73kwFukSWSrVBW8OAywimrK5nrwDQDcyea6o8qWj6llHQf/3z
         s22YhmayHiLoufLNGaKYoY1Ju/xuaVqyQr2xJ3Aki4UVKlskOtEBQvveTPTv6d7EiVcQ
         1jXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=yLHD9GT6b5p3TJG9MYP2E7Mrw1kvuaLUPhHVHq70H4k=;
        fh=TVglha8pwNg/ZU8142J4gmImN6elBeG1FF7b/wPgu80=;
        b=rmdTv4RdMBKIpaeeBZp0qCwH+kwxYnXftYHxJmHMQpSmIMW8iEcC0SIxNUllHI6xWU
         6THrYFnGiuxNxiHLiKJqYCU7VRuNieuAxgyIKwId4+BQi8bUfbNwuqrsMaSRimA3qXMl
         TLBhSo5mCjj2tJqd+TX8hkCwxxOK68rjq/hVsxdoeGFJIVFhlokL9lO2I6SIUtKgZP8K
         7rWpN2Zomt2khXIFR/7gPAe8b8ztJ178fHicRNE3nvK9zLpUYwuTH5Z1j62TufXBPmkB
         skiVDBQQfKuAtbr0Z2wdiI1GuThplHowhesjtpG/KDQlsOpg/QaSZ/ePQZuWfbMvHgX6
         xCqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=In1Lyq19;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id k10-20020ac85fca000000b0042e646b6d41si2167289qta.509.2024.03.09.11.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 11:24:10 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=In1Lyq19;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from list by lists.xenproject.org with outflank-mailman.690977.1076735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2I5-0003jX-U3; Sat, 09 Mar 2024 19:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690977.1076735; Sat, 09 Mar 2024 19:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2I5-0003ik-R8; Sat, 09 Mar 2024 19:23:29 +0000
Received: by outflank-mailman (input) for mailman id 690977;
 Sat, 09 Mar 2024 19:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2I4-0001PG-PI
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81d4d069-de4a-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 20:23:28 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-568107a9ff2so3517022a12.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:28 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a50fb12000000b0056486eaa669sm1182154edq.50.2024.03.09.11.23.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:27 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 81d4d069-de4a-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012208; x=1710617008; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLHD9GT6b5p3TJG9MYP2E7Mrw1kvuaLUPhHVHq70H4k=;
        b=In1Lyq191c8Z+vXQDtP8fdftoqvjPNGRcCJIjkBSmIh1karawBCO1YaYH3cO0bE2B2
         feHKgRTJbt+d4bVBgUuav2ejns+R6kxEQKr8M3nSDK+M9Msi+WOsuaD8DUSVsxfJk1rT
         8Crv/o0qWQ+3mqSPESCA47rAgypJD/kBjYtXoo41WLgpFl5oGb2BfA52ITJtX3ZqQ2Vp
         DU3AE3em/wcWjeWMiJTYaPxPphngQx7GrIyIEh2jAYtnna0Ntu+hr3pnien1oxbt7+JR
         fxvvXZx2he4b6i39A7e7d6AXHpEfCMI+IFxqoDLKZGbIau11GlMJG4DS4t3pqD5B1q6M
         aSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012208; x=1710617008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLHD9GT6b5p3TJG9MYP2E7Mrw1kvuaLUPhHVHq70H4k=;
        b=dPZ/RQTORjiLbWVLGSHdMKcWDmW1fsyCfz/5ipyytK8NCq2/+bbE0ZTpyPOyJHI9ix
         giSVHL0sAZMsXC1680GtlEKLS1fZL9i1WgQxKzmYT5EIBNheaJV/wxkGcAWumZIgSldg
         wVfwPDeCM41iQyNy5Jt0ziRo65T2X0TKPugPcKo/RjtPj41mPhMEV93AUJPXmtwZCnj1
         /1un8FkbEZZvqAU41lEr2uJfdzXHowZHjxl7w/zAiCd9/PIb52eYe4E6PV0IYJodIHzV
         j7soScsEFk7HRabqHoNPMEUGmgV0fpMOnykOrBlB1m+rp+1gWdlloHaperxDQBNGhbxz
         L02g==
X-Forwarded-Encrypted: i=1; AJvYcCWnJuU7vp6dmb1VXGpKyQBYKvdww2Fdq3pGSYpm0XjfZ+grgy/PSMHDn8lXpRz1dnUWNC9oLvQNxQZdJJtWVrDS3+BG8ThgssDFuOHBGR4=
X-Gm-Message-State: AOJu0YyGZdbqyd22DAcUBi3mosD5tkjOfMiKS9AfdOE3+w8GRY8tQILe
	CbyYNF5J6SPwZ9vn/iWPRU/vP91XCbdl1OZ6A/7GllpTNrIS6eM//4tjeDZFgn8=
X-Received: by 2002:a50:9fc9:0:b0:568:1b94:fb88 with SMTP id c67-20020a509fc9000000b005681b94fb88mr1660926edf.23.1710012208009;
        Sat, 09 Mar 2024 11:23:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PULL 12/43] hw/xen/hvm: Inline TARGET_PAGE_ALIGN() macro
Date: Sat,  9 Mar 2024 20:21:39 +0100
Message-ID: <20240309192213.23420-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rKanu3/qyuCF

Use TARGET_PAGE_SIZE to calculate TARGET_PAGE_ALIGN.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Message-Id: <20231114163123.74888-2-philmd@linaro.org>
---
 hw/i386/xen/xen-hvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 1ae943370b..8235782ef7 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -678,7 +678,7 @@ void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
     trace_xen_client_set_memory(start_addr, size, log_dirty);
 
     start_addr &= TARGET_PAGE_MASK;
-    size = TARGET_PAGE_ALIGN(size);
+    size = ROUND_UP(size, TARGET_PAGE_SIZE);
 
     if (add) {
         if (!memory_region_is_rom(section->mr)) {
-- 
2.41.0

