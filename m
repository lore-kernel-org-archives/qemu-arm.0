Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp679003lfb;
        Fri, 15 May 2020 10:08:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQLW/kQ3jdhU128WFNgGFZYZ7j9JLFLN4zIaF0ooIpOKwTWE9CJXs5lXTQ/Z16IamWT11c
X-Received: by 2002:aa7:c415:: with SMTP id j21mr3604808edq.266.1589562502720;
        Fri, 15 May 2020 10:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589562502; cv=none;
        d=google.com; s=arc-20160816;
        b=IGJvcMP9RJyntliDC+cLn4ATDWCO0Uln2E/XzDWSxaT8zK3Vi7ZFHm7yvdBhbftu5V
         5IPYiX5gHH9wwlnKFKtmIrGHDXuQFgL4yMzto/zySy3lAFjugJ6hdWfFZX2CSQSqlZ9G
         5K/sqDLbeimA3UGu9sjPOZs5ilD78G5HUCb4mra8PcxXodxAPCD3Mpn+TsnZY6ty7jDh
         VMibSduRRh+p2tWlH7d9/OtlCfac7IiZnw97umf5SjS9k1bjCcXUdhxNX2f4FLO8mxls
         4KpQF6jKgUq5n2H21U8lm2X5cqtdkbDyKBKxOUBgISpJrmaAdDzzsy5in7v4wS9pJ570
         kRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LtqBVDpcxzLSIYr46Mh7kdVW472e1QUV+XMsC1Vk51c=;
        b=nJV4u7A8r5oYt1vpZdxnfTXX+D3Oz8IRbR9iZQzMPHvRV/41tswlQaiWmfG7odf2ED
         2Vgy5vZBuBQGK7s4OH1qUePkfvFOaiJaEssTsv0tLz9Nsr5M7yPIAIdMo7UyzGgBRGBj
         Y6UL97Cl7FDytkKx7OR1LN+de1jGAZXMKWsYcpaHdOq0UdhDBSSuul3RbzdYzru4tYZu
         vURluSjF6I7N6Pi/iBzCHvCclSArPIs/ZVZuIsn49hs+LW+VSwFF02xi/gIRFTJaGi7V
         X2s1+/f9eyaivs2topUu4voLXCVD0rx+IqRCLkQ5VwJdzWXcu18EBzu82K4+S1GL32Dp
         Yaiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fovsmLAq;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id j60si1384021edc.8.2020.05.15.10.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 May 2020 10:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fovsmLAq;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589562501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LtqBVDpcxzLSIYr46Mh7kdVW472e1QUV+XMsC1Vk51c=;
	b=fovsmLAqsKcuttUUSF8HXN1cOfhnVKOFnY5uyRRLsFjcdsEU/+rD7WX8N9LjuzmnaqufPe
	R/k2zUoqvexnQ99TmtcfcCS/oVK6klizCiRYHB0BFjHHUs4KknpFKvW9keYQOIGZUrT41H
	9qTQmOBwk9ajLfu6x9AhVxwNquHPS9s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Gn7m3EyMNaqoOnvYuqYpRg-1; Fri, 15 May 2020 13:08:19 -0400
X-MC-Unique: Gn7m3EyMNaqoOnvYuqYpRg-1
Received: by mail-wm1-f69.google.com with SMTP id u11so1259594wmc.7
        for <alex.bennee@linaro.org>; Fri, 15 May 2020 10:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LtqBVDpcxzLSIYr46Mh7kdVW472e1QUV+XMsC1Vk51c=;
        b=d4ByQEYB98HX5Ibp6hjlw3GPBgT+p4fHem3rsojmFWR5Fd2meFYiUab+JARRS5Cw+X
         mTvUUKoxLBlmgegjKJ7xWQSX/EfMoPw7rmqd1Z/sDyKYa/ICsjWoqlnZDkFmkMzUc27c
         l51Kzfh4jGYDvx/dO611HpUg/Bzr2FpAgDGgitnKH7+6D9QoOsMaJ9+0yZhPDBNwy5Wp
         +vBM9NThMCUBUjv/pUo5+rghnqHtkaPRPV9vITgzJxlwg3/9DNL4RaioghnCAud+trZg
         9v1Y9Pf4HfJqFq0yQfWh4Kx+gPQXX5zKoYkgsObXOs2JwX+6Vk30sg1vgvrguxbSIYD3
         92sA==
X-Gm-Message-State: AOAM5312E8mupentkxG+YYc0rzZiK5SyCUwnoUVERYStpmMGhV7lkXrU
	fnAO10HudHxEAFuTczWmA63Iaq5PGPDm3JcxMMGQx65nj6uVSFZuL2fk+Ue/iWe5CYg+ZMCVDxi
	/xHFtw5TLWVXXD2MX
X-Received: by 2002:a7b:c086:: with SMTP id r6mr4873585wmh.29.1589562498392;
        Fri, 15 May 2020 10:08:18 -0700 (PDT)
X-Received: by 2002:a7b:c086:: with SMTP id r6mr4873567wmh.29.1589562498195;
        Fri, 15 May 2020 10:08:18 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id j1sm4416059wrm.40.2020.05.15.10.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 10:08:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Marek Vasut <marex@denx.de>,
	Michael Walle <michael@walle.cc>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 02/10] MAINTAINERS: Add an 'overall' entry for accelerators
Date: Fri, 15 May 2020 19:07:56 +0200
Message-Id: <20200515170804.5707-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: fZezy877cEcp

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd88a3de49..659092eb43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -415,6 +415,15 @@ S: Supported
 F: target/i386/kvm.c
 F: scripts/kvm/vmxcap
 
+Guest CPU Cores (other accelerators)
+------------------------------------
+Overall
+M: Richard Henderson <rth@twiddle.net>
+R: Paolo Bonzini <pbonzini@redhat.com>
+S: Maintained
+F: include/sysemu/accel.h
+F: accel/stubs/Makefile.objs
+
 X86 HVF CPUs
 M: Roman Bolshakov <r.bolshakov@yadro.com>
 S: Maintained
-- 
2.21.3
