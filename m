Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373796lfg;
        Sat, 1 May 2021 15:37:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4u78DiORcQqonwkecDzukow1L7E/MsZDmivFnWWMg5dXrhYPR9oR6ihI0RlllvRHtHjIX
X-Received: by 2002:a17:906:eced:: with SMTP id qt13mr10235080ejb.382.1619908634044;
        Sat, 01 May 2021 15:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908634; cv=none;
        d=google.com; s=arc-20160816;
        b=RXJLjcaia5VqXkJjVQhrYoFI3uPKnKz05yTQI+11/A06IKHzPdDSPvOmlp8ZqFQ/pS
         h+3zb/F9XK6dbTKwYB7647Dd7K8Hkey1y8r0UEdWHYNIFceXlt+JaiJqRLBCFt/fEsfJ
         Xx/a1an49RMXhZh+buAjZJAMUxx93Zm4Jp1Be+gcK4bXUgdWiVQc3aG2aiXNQwd80IHP
         bPt0z3xhgOTWYDI3l904xPw8GEHp4d40RBOecqJs4n9CebfWmoZkCtP3rT4X3YF0f4mg
         84D2yQmwERb9KfVTyQ02XQIv3RMKVP8GwERyU1ymvSZBi4cC8B6VhBzRhi4n6XB0Zpev
         YkuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
        b=RvoUEKi7KqUeRtfd3GhgqSSJwEVdPUak4IHNCWJQf7jFCrIl/PCSOALLw5Pl/YVZiL
         oR9P7qz/NrcF0CCux752dYColhuypljgjB5KS9MN09wycnvg+MxcPUFvaAR0mhecs/QN
         HUnm95afoKbRSVVtqrAnCDRIzQI32izOZ8pCEtEy7YcQjGMCzt5pMSDrBxzbFqLDSQ+K
         NWjX0wCnMj19UxWj9TX8hVyidfG4KTVxHHrT9oIYBp0UOVZM1/H1nxFXjMSk7QLFAtHB
         emJvCdJnp+FmftP3XbE3INGroZzes+w1snLSyT+dStcQMhAqnI8fyy+WmtT8TX5gY+Uy
         9Cgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=heipv+jj;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id dn3si8514333ejc.746.2021.05.01.15.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=heipv+jj;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
	b=heipv+jjCUKC/pGkJX+IvuEUqOwA2t0cp5r+acuG0vwo0HKmSG7cW/4+YibXth1mccIQqT
	gyjcF9hMyxDzgL53oh6m4iqYlGUC1XjqcoyD9nkEgNWCgILwKwNbOxGOKFlnAusBUDa57+
	Mi2ZMnNzPn9akS/btCZAh4sR19TcEgA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-vf5bOoUbOGKk7IqfMgthkg-1; Sat, 01 May 2021 18:37:11 -0400
X-MC-Unique: vf5bOoUbOGKk7IqfMgthkg-1
Received: by mail-wr1-f71.google.com with SMTP id r12-20020adfc10c0000b029010d83323601so1265717wre.22
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
        b=Xk4989x2b8mGULUK5BdxQFrWtWaXCWG4Yl5e9NlFXLUOXHNZOShSEZkutm5GTv2krt
         cwvUX7boXsCPV9bW2DgiOu4LcNW9CP0G40VEueDeKQVpCtV382huyv/esmtYFmzZX/8r
         p3+cqquUq29R2ByIiyZ7D3WZiT7t31+QqlyLGZuaZ8A2TfYTrLBPVWvYcn+M+xK2A/zJ
         EN0GvfSfAV+Qf6PKMyKr/hcVEtkQojjnQRMvGPqmc3gdcICnSSb/0lXQxwMAH01UgGJn
         +E/lCTPkoPPCVhOxdk5WJs9uDz6x5CSX0ROnfZihl5ru/J5EmMfCjC5rKOddqWXpUajG
         Jg4w==
X-Gm-Message-State: AOAM531rxHoq6sQv05TpQQpr3LMrRc+OTwIdO5I2jBjDnvwWyLW9FmV5
	f+N+wjuWbkc27USmE7PgvJpV+BgEinIyxWPrtJNRtULu0KEo/9atbSaYG5AspM9nIT2gjmbPhui
	X/4CrU7xjxOOlIELt
X-Received: by 2002:a5d:6207:: with SMTP id y7mr14238798wru.39.1619908630343;
        Sat, 01 May 2021 15:37:10 -0700 (PDT)
X-Received: by 2002:a5d:6207:: with SMTP id y7mr14238787wru.39.1619908630241;
        Sat, 01 May 2021 15:37:10 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id c2sm6658948wmr.22.2021.05.01.15.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:37:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v5 06/10] qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests
Date: Sun,  2 May 2021 00:36:34 +0200
Message-Id: <20210501223638.510712-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gxLwIXuOqwio

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
