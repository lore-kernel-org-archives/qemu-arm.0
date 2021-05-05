Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp272403lfg;
        Wed, 5 May 2021 05:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd3VivIzL9a5tfZCjVgVBGxaSJGPdXxNF9zzOYMUGrIreAgr61C8n4PrWksiVX8LYRSPRm
X-Received: by 2002:a17:906:ecf4:: with SMTP id qt20mr27349611ejb.59.1620219520886;
        Wed, 05 May 2021 05:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620219520; cv=none;
        d=google.com; s=arc-20160816;
        b=MMbcppQBfaKcVH4Grm73ggulc55Bc20QpTjnGoy5vGxFkf7RpUYsdi5huKN38d3Ok+
         zJOkHtGWFt7iYLPrZaXaIu85g9ROf1yS2EMEnV21ahCFeihgjO7u6j66St4ESWoHzd9/
         X7a5ZVKgpPukJIfZWm4HJr4MPY42RkUeU1Vkd3JAf4eYR1n44eWGbbzXcbmyOQ507+kn
         0nXZI+S/lBSddGyXqnW1GgsT7xlbSFyJRHLU8i+NonG2ed9dDi+Urs4zmScmjirT3PV1
         aDKi/v3yREw4BC939ZZzFwWZ8H/MOIKVXK0ozjOO84z69EGT0yzXoXV3f99gXf2CveLx
         dj7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
        b=O/q/mMu3OYQ1Z4CvE8wNtkFkSEeku6PcbvEaP40WArcE2y0Sbyvra3jZm5ruAxTdf4
         UYZShISOvV5aLCCmH+E1y388hpwVMX8JU4PhLu/wA0f8uWFo6Qdy43T4lWhkObUXVayR
         8abaV99gnjDBNgRZqAEjdzGcbkXX7Q8PjZN4L7NzFgyYz256Eif+1DIasuGnTIj5Pr3C
         BaauFs7C7ECWMP0jZpoyBJ5oBO7QVlGUEx4AefMA9VrESxKHoL0rCMWZJMAFf+FdnwiV
         VS8bXbjSmWg6o7ekql+V8djtNBDruOCdQCpdhNjFgMQtie8qg9BJPzHpGQOflh3fPYIU
         N97w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VYTAsihG;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id r14si8626785edy.200.2021.05.05.05.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 05:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VYTAsihG;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620219519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
	b=VYTAsihG6w13TQ4/ssG4GMamEpqfL8v+KJ53+4gHs62FliA4orm2OwTJZ7ZVgBu/m7xK+0
	SK7qI/+gQ+GkcZfHD6d+LLv8YjOGkhFbNtKeoJL1Ir6lMaOHsaxOT7pXB3CN5ginXnftOO
	uj+UjqJKuBa3tr0j3Zlsb2kMqtyzRv8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-SgY6Og3EPmmKOOTCG6K9PQ-1; Wed, 05 May 2021 08:58:38 -0400
X-MC-Unique: SgY6Og3EPmmKOOTCG6K9PQ-1
Received: by mail-wr1-f72.google.com with SMTP id a12-20020a5d6cac0000b0290109c3c8d66fso663678wra.15
        for <alex.bennee@linaro.org>; Wed, 05 May 2021 05:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
        b=rIWQUbZ+v+N7pX5lL9T8n4qL6BcA2TZ0TpNmtkxNmgwfymxOzVvHHG5DcXZ77GKPMl
         5oXG4RaFg4/BMbJQZCeY50yADoAzxiNdZfSfU64k+njVGH1VOg57TEWahxpuSrQF+pq8
         rHBcEwvbawkrwKDDXRkbKxP27drETehHCOsZabcRdbE+iTvsTW45ekVtdk2iLdIlHbKq
         24+AExV3uHQMkG5xorznWNeWxs+o4B4YtvCwRvHHgosMrxTdWUCVIuMHYk52CsacatYa
         sS4834kdKHp7eZayoVNT1CQoHpLQCGGJ5xfYTvAv4hdCLtqp5+0Oaf81FnSR09Dk0uvG
         mWjg==
X-Gm-Message-State: AOAM533oCIBfrvr3hY8oyFqLwNAnPACPlRlcsNfVj2a4Pg6HLEjlWXKP
	WXYj3XdqqcQ3KA5LvAWmbti/c/QRA0HKQ0RAM3eIBnpZhkjgg/qcK2iUlStASVYGcz/+xhvbkK2
	5/8ZIyMbLs/CcOFtH
X-Received: by 2002:adf:f205:: with SMTP id p5mr29122735wro.170.1620219517316;
        Wed, 05 May 2021 05:58:37 -0700 (PDT)
X-Received: by 2002:adf:f205:: with SMTP id p5mr29122720wro.170.1620219517193;
        Wed, 05 May 2021 05:58:37 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
        by smtp.gmail.com with ESMTPSA id x65sm6912160wmg.36.2021.05.05.05.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 05:58:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v7 06/12] qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests
Date: Wed,  5 May 2021 14:58:00 +0200
Message-Id: <20210505125806.1263441-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LCRM5vXOw8Ra

sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
tests are now only being run if KVM is available. Drop the TCG
fallback.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 66300c3bc20..b1d406542f7 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
-- 
2.26.3
