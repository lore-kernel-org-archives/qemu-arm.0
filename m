Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5615942lfm;
        Wed, 26 May 2021 10:05:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMA24qUMbANDmYv3A/dFVPyrng3o/3mCxC1oft2Exg7ByAZyLRadg+9DRN795oY8BqNrTC
X-Received: by 2002:aa7:d70e:: with SMTP id t14mr38770338edq.377.1622048740637;
        Wed, 26 May 2021 10:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622048740; cv=none;
        d=google.com; s=arc-20160816;
        b=b9LUlo35tBpY/yz5m2uGh3w0yWFl9d3i5Vl7Qz/gwDMJMsSAamLJ+XKmqJKTygIV8e
         cXMtSBElkZ7LqmJdVnUqg97ySiVjDL+iQ4XIXHj+6IpDeuvw46xXtj32ubsIbF0nVdw4
         p0vNdgH9v61SaKUTvYc291UdXsOZlOF1+Pripj1vd/UePCXsh+ZUe8HGS+y4bdls27EX
         +0CEIdzUXwxjVhXKeMdRnGoz94441Bu14E+So0v0fF3lWarDwgTSpCRqjkBViWZXgDec
         gxmIPqmvG4X4W7JYJSsGDJYElJqJlQ89HAWjrBKcF6oZMmfYYSasgp3XFSHiOsmuDG1n
         HbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
        b=nZkIqOeP1tvXl42W+Qjiq9u1Vy6srgB96w6jHKz6NdDG7E0ua3+CqsdxFGnwLjAjn4
         JdRY9BDVTs29MdbIsrHDX48byId9zYhHJM7QFrOhh5VVG1Gb6s0uuzaAfaSsPlpD23mj
         NNUOOVc8igUuPV3J2WfZR0Ypr9ugt8cEL4SB/Xtutl4l0MFnLZgu5O5VxOv4Wd6t1CmV
         IIEK8jXKVeiLXCBqFJnhLlLqKuh0xelAsQ3YmbHPOVcvVvk/SeQVMXwxbL9HX4dLVj2W
         Y12dedN9Y4T57WTPbjkooNm7vB68K1WXr9rRzgrUvQa+ICwdWBigzlOZvWSxBWrbsHRI
         maVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bNV6s/HG";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id pv13si3793872ejb.251.2021.05.26.10.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 10:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bNV6s/HG";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622048739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
	b=bNV6s/HGwX6bO8ykc2/puYKyLhZ7EzyspL+R06+2wRiTCUghWwzPHJpmWMCeMPxCpLK/U+
	/yXOd0lFqLSJC1z0jRAa5O64rT5gznI0D9SWrkGz/cHho/wCxarjsr+w60+8B31+g/mpS5
	4Jml21OTZV91FGbdI8RZD9k2FCqSD/c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-1-J35gd1MGa6rBOR-eAJ1A-1; Wed, 26 May 2021 13:05:36 -0400
X-MC-Unique: 1-J35gd1MGa6rBOR-eAJ1A-1
Received: by mail-wm1-f69.google.com with SMTP id f141-20020a1c1f930000b029017ce5240ed6so626951wmf.5
        for <alex.bennee@linaro.org>; Wed, 26 May 2021 10:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
        b=VgV5m5eDMyP6rwDZIaJMRhnneVJoXpdhywO4Qwltg3AP2YlvIZltXD58ilEqa+40Wo
         kIoeo+sq3C0M+eDzVNtcRoh8KFbN6TGmRIDIwiEUZLd2AW93j+WuqT5PJtmcSIN2Fl4z
         CzA3dGc5vZyjO1++qgHXUQu4Yc5DZaJX3n1HhktH28pjzXEURkhQrPHMay/50MmMSz1L
         HDXnFCF0yIrCbGeMSW4cLV1OvN4aiZ4rrBdxTdyMvoQvYdIr2faPMXKESxovOLOHmPlz
         vd17RInAs5DgOlymsL+Yg98qB61aVALbAOTpK4Uw8j4zoBZHsNdaRlVgyubur5tLh5wL
         4wfA==
X-Gm-Message-State: AOAM530Mh1lbijRDiSuI9IzJGL7pyEZPtnJSapXLqdnWCaFo8ObC71Iu
	g1NngTKSuxmIKzf/h+jgupByqQuGLV0zCYdxYX4LNLyTJxZ7mYZ8arepx2OIN0daW5/tWVgjrvh
	9kWbiOQUmplCB40Mc
X-Received: by 2002:a05:6000:154c:: with SMTP id 12mr35102843wry.14.1622048734777;
        Wed, 26 May 2021 10:05:34 -0700 (PDT)
X-Received: by 2002:a05:6000:154c:: with SMTP id 12mr35102817wry.14.1622048734589;
        Wed, 26 May 2021 10:05:34 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.64])
        by smtp.gmail.com with ESMTPSA id a16sm20462434wrw.62.2021.05.26.10.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:05:34 -0700 (PDT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v8 06/12] qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests
Date: Wed, 26 May 2021 19:04:26 +0200
Message-Id: <20210526170432.343588-7-philmd@redhat.com>
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
X-TUID: ksEQG4nJ+vJ5

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
