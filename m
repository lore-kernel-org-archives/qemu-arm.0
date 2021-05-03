Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3006848lfg;
        Mon, 3 May 2021 14:10:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUIkL5Dvm1m9Y3jPhyHrRssr3Z6keT3x3kddG4wht0vFTVxGXtZDgY19hzlpFS6sWEwqSU
X-Received: by 2002:a17:906:2a16:: with SMTP id j22mr18575172eje.397.1620076257164;
        Mon, 03 May 2021 14:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076257; cv=none;
        d=google.com; s=arc-20160816;
        b=jLCuNdX/pSnDDwMLAFp2ICrAkafZkMZUuneElfFgpSS8WHNhJWFv/iXhxO9GM9Ug4d
         RJlHhQleGy0A486M1TGKFXker7jjhemnJz9cFjZmFtaAdMDfbqKOoRDa5CPyraMGgOEk
         Lb0hsjdy7cLKFnqhIWS5BSwJyo3HS3h2awyiNp9KpA7UZhMOkTHG8idWxR1m8agKXur4
         /UR5wZ1mzCqV9rXWZerYWK77zJ106a2V/IUKVFrPTULFOhWHahx06+WN4bj6uuLVdEFQ
         1M7npGoELl1TiVyZsyzFQ9gtWnT759aSMZYKQWvyrUaUHYaqm0gOuzZIMnViwY7aCx0X
         Avnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
        b=Bp9a8+b1oE10NV/SAqUidYjJe5/9EQzZXwuBAkPVSVQweH/P80Xgtsjb1UtWKNo+7y
         QrzB62O0Pnj1/dGwbu+377JRC8Rcim2+KOaYkpmxB5hx2nzOVhCWWLZtyZHYWHHpcu5s
         VxxZ9f6QtnpR2h/WjY6bQOm8/BTd4/prwVdCchiatYRV0bH02RSWMfWMtpJTROHTfejY
         QiFh7GAB71mDWg46GkLAMUouDXccuS2NWLW08Xk1gLJe5oHBsDHVFT+eurG3i3GquGgm
         /wgVEmmo3/CpWd3U74OvA2XW7nGH9j4WhsoNj3oMU1KAAp612UYm5WYw7RY09TWDe9T3
         dWsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GgJLcYM/";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id bl1si880400ejb.408.2021.05.03.14.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GgJLcYM/";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
	b=GgJLcYM/yRqLHQIeUZF9eDaxe0o61Vq8mi/trw7s46EHhoNCxvLmwh5bBZb6Wcx8aQotuX
	65Jzqd7BIQgOnYF4FQu982I2usDyajRf8J/YcfVybebNLeUMt32RqvwnnoI2/rKkAZIS28
	hho2cYeA1K4rET4hhgzP40F9DlUbUMU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-VFTRq-6zPP6gWytFrPZTeQ-1; Mon, 03 May 2021 17:10:54 -0400
X-MC-Unique: VFTRq-6zPP6gWytFrPZTeQ-1
Received: by mail-wr1-f70.google.com with SMTP id 63-20020adf84450000b029010dd0171a96so4076030wrf.21
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
        b=LTP/ld6F28s5gfEA7BgH7ZNwdqzedDe4jSDg53Yd0lQj75H3LV4ytyi9R90RGjRj/l
         ysa74OpmjxccDKEK1WYzleye+o/8IrVJ1N+FdjH0AWManotYzBgBnMPuapeEwpUE+QIU
         uMLi/PvUrdcVfcCI0bzgvhZGgd0Ey4Zu6DVtUTj+XoqBBAQ6XlJU5z8Dy9V5ejgVzlRo
         Nt9IWxHHpUQAw5MWKrUSuBZJH8mHgZ3iMSKgdTTDXgu0nUhzW9cnOmCqKnNtZEpYOhxU
         x8YuqcopoKWqWelrlCBoIInL0730prjGO3fnzaH8e/llewbDv+ipROI8wmTMr/DhrREU
         9xCA==
X-Gm-Message-State: AOAM5315Q9NFBnUS/xziOTYlAqUEupbzxXoubrL1QIbhqveAjo/V7HhA
	iZMrOUsKln0XBjqIweDmXpFlboH8ldCqXqVZLMe1RHgWNb2u7Dfguy7Vc1ng0WhLRa3/rdTPHrx
	0rUupOE9k4LO86Sjj
X-Received: by 2002:a5d:408f:: with SMTP id o15mr26434697wrp.89.1620076253699;
        Mon, 03 May 2021 14:10:53 -0700 (PDT)
X-Received: by 2002:a5d:408f:: with SMTP id o15mr26434684wrp.89.1620076253590;
        Mon, 03 May 2021 14:10:53 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id h8sm667607wmq.19.2021.05.03.14.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:10:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 06/12] qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests
Date: Mon,  3 May 2021 23:10:14 +0200
Message-Id: <20210503211020.894589-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AHRgrvXpLwpZ

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
