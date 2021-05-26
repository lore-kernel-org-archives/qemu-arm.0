Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5615345lfm;
        Wed, 26 May 2021 10:04:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjxC+pfvoCd48n3TaLIdSFSheKiLJLCFriUw+aI9lltYf5c9K+5liD6H+LCTisaYSLrnmX
X-Received: by 2002:a05:6402:2207:: with SMTP id cq7mr38069891edb.216.1622048699284;
        Wed, 26 May 2021 10:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622048699; cv=none;
        d=google.com; s=arc-20160816;
        b=LJApNxaR8cGfp9iupHt3fPFnrM9zQzqxulLMtgzv1umAKNxLbb3j+oE5yKit9PemIN
         gW4p5BaKfk9vrrCyUSPz/ST4fWCyGm9vkbxL6PDLuEBVxLfRvd/XdWrwbOmT3VDAmmg4
         t3upOx/QAcnx/KyuqafnWg/w1AOBa1siO5/P7tgDQOKR+8E9o21r/U5ySla2m5uK0Q+l
         TlXxZSP5BADdTeKmWCWX/o2JiPtPBaF0VwrA7GhAl67GFe2AzEV+dl6n4CAuBtIUu9yq
         5MIzdd9BDwU3Zx1J16ep8ekYS7V245pyo0J7b+m1QgvCryqWiK3zShI5g5ZVoh0W9cxI
         LIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zJWoGpGBb9XoVGl1zEB1CPuzVYBaioPmWvxlvBAi+gE=;
        b=U01x4IZ2wbLpk16bJhHLjri7bgWnNWpuTIM0WHT+e3gnVma1S2oNLDNd/68brT/rZS
         +jj7EbYL35a7JzVVzBuuPC6xHHsA5FQNXvE9/xOU0uyLIjLVTigTQFVTEE67cpM6u683
         w8Vftkh0KN3sBmaJwOvK6OevtTmhp4QsY2MS4owrDEFWbBpBKMW57wsOGuCx2NwTrL01
         tliLKz/fAmwkKhu4h1GcqjA/vXsr5ZpuQRRjotPKA7tZLJ5mx5SZwQGH0qjBtjRor7YI
         MxOmaE/wlaqeQvyMQwsZJr4hQexU+Rr4l30mqe+Ero/OFFJ3YgqJt2oYfNEzUgnP4BuZ
         8FQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GNvmojzP;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id nb27si5125106ejc.548.2021.05.26.10.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 10:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GNvmojzP;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622048698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJWoGpGBb9XoVGl1zEB1CPuzVYBaioPmWvxlvBAi+gE=;
	b=GNvmojzPEk9KWHmsM+RRILjOFDOw5o51U8zImyL5waW82rwjpFGNcxtcsO9EUutL1+okXL
	3Qzl9c5hZDtuQNtO/3ZoTfYSI7sQ6mAGOOvgY1v+fNLpsTB/Q3WyC9N9FyMZNmruu4oMP6
	lsdoWbi+RN/0F9Ko9wOffI0pice0y/8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-4qpnVhuhMdS9CJJzO8aUXQ-1; Wed, 26 May 2021 13:04:56 -0400
X-MC-Unique: 4qpnVhuhMdS9CJJzO8aUXQ-1
Received: by mail-wr1-f70.google.com with SMTP id d12-20020adfc3cc0000b029011166e2f1a7so583680wrg.19
        for <alex.bennee@linaro.org>; Wed, 26 May 2021 10:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zJWoGpGBb9XoVGl1zEB1CPuzVYBaioPmWvxlvBAi+gE=;
        b=fVVCqmuCVrRtUeUN+ibtVkuSMutYkDeS5ieQrhr78yxynSGA8kVSXQkRwqd91snTNA
         ubPIXY66I8oYTLKEcvdrpYHZkBtGaTuzWIRMFviiReR0DyULbBixXKdyX94mxDGeZcP3
         EyG+gofbOWTlbK6FApTFxCtqkqyC4GVzNv6TzFJ3fkTwuNAvRh48GCpQDugYxXcDcV2w
         pg4vPg+Q1TD+z9JsWJj9qcL9jc5f3g1H8K9tIQ6+QVzr0x1X2YcOCNnjFL3D4IlrxaNg
         yhaGznn1K/Y5gNe8lBF57IZw9C8uunBUO5dyLElRzmx0Dr3g+rx5fe6zLMQinKlaTGaf
         TwYw==
X-Gm-Message-State: AOAM531qWzGGfGAkAjM6SGRkKGiMNDgJgBSpukWJTZp9hLxFWT45livd
	e/IULxHHP6v1lWD4CW4cgDD/I7atdm1ZWaF7TuKWXQJsBrjaz3KYCks/KRSDB3f6RnmPH1xCJ1m
	UkAC+b6I851XP1M4b
X-Received: by 2002:a1c:f016:: with SMTP id a22mr12679072wmb.65.1622048694956;
        Wed, 26 May 2021 10:04:54 -0700 (PDT)
X-Received: by 2002:a1c:f016:: with SMTP id a22mr12679045wmb.65.1622048694817;
        Wed, 26 May 2021 10:04:54 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.64])
        by smtp.gmail.com with ESMTPSA id n10sm20650630wrw.37.2021.05.26.10.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:04:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v8 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section
Date: Wed, 26 May 2021 19:04:21 +0200
Message-Id: <20210526170432.343588-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /NRU9pElfUlL

We want the ARM maintainers and the qemu-arm@ list to be
notified when this file is modified. Add an entry to the
'ARM TCG CPUs' section in the MAINTAINERS file.

Acked-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a77f2465694..52757b08540 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -156,6 +156,7 @@ S: Maintained
 F: target/arm/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
+F: tests/qtest/arm-cpu-features.c
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
-- 
2.26.3
