Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3007176lfg;
        Mon, 3 May 2021 14:11:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZxQ4maRlPPYVvKfpTWdSrF9N2i6oWgp6ce3Uy0oRpv6pHh3Xwo29xGeP+aNxkm4VV50Vo
X-Received: by 2002:a17:907:961d:: with SMTP id gb29mr18181704ejc.381.1620076287238;
        Mon, 03 May 2021 14:11:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620076287; cv=none;
        d=google.com; s=arc-20160816;
        b=vfJGth33o0MGxkmWWBAFg8jDzdTbwU5azM4GubIoutZjOlfRm+ZZNcjvK6sb/rrSJx
         fArpwmCO2P6QhjhYx1GzDRc/XYO5ACFI+J8pbVAk6qzVVVxQt53CVsQ63CcaOtcqwHhq
         T3KlOa8u/mWFFGEsJvd+G2oVVAaB/Eyj9qlQ37bjm38Xm6zE5Ecf9gvzKb+aA/o24kDj
         +keGHS+p24ZueRVB0s2ECeLjPoOXnnPv3lr4M9sW266ebvlLJKkFanV3kHBF6wyxDMcN
         8OR3BpJ+Wj5cJGxPfeBxvRBlb+5eze8+JsGVj6gEEWR9EHaXfpXxPCCeD40TB3Wm8Z3/
         SsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
        b=SVZ0zYYUvQXgJh23GBVFw6MyYx+6RyMBOO7s8Z0i3EkVYxARiCSecZ6OVR84eC/FDk
         b0cM90AHPX17wubnpz3Tu80xULMR2NWZ+4RtE5bTrZx9Ww8QK0GSbHYXY32ho40xGWuu
         V3mcjPcDvYiDVgCz1kBhgdULalnjA8okOt7A9/RfEJpgdg4tjb1aTli+Wh3zqBFhHsqA
         JMwfuhtGMO0rszUaaDOKHGSqLl3HVUFhEZr/dnwlBtgd+2x7bQpNzXxgwFXf6j+5H0dQ
         mRLUFMJ4fzBmmOAh4m+W0MLD409RTE9KoS6n/Stgu0abJpVnTvJGm/nt1FO+9TBlntDI
         ljSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GCIzfmrA;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id m9si1070390ejj.281.2021.05.03.14.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 14:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GCIzfmrA;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620076286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
	b=GCIzfmrAAB7NZyClscJDsPurW1/JxJdgWTai5LiHfxF6SMx/dKYp3Yz6ogVtjeMzeD4t6/
	Hn+Z36Acsje3mk4HxQQYdGkQrvtFkCyQ93cLCReBeFV9FEpX8iagVBZmNTZ59VrhbiCS2E
	Jq1HAkcebsB1UrhDAwO5UZslxWjAuFY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-yct8ANgYNSa6Pz5Tz0fZrA-1; Mon, 03 May 2021 17:11:24 -0400
X-MC-Unique: yct8ANgYNSa6Pz5Tz0fZrA-1
Received: by mail-wr1-f71.google.com with SMTP id x10-20020adfc18a0000b029010d83c83f2aso4653950wre.8
        for <alex.bennee@linaro.org>; Mon, 03 May 2021 14:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
        b=HMqKRDFd9851cBjQGrxYNaQMcNbapPJiTB3C5ZDRlUoe6qx4/CXisi6Htfv+0p30cG
         3PgnIqF/beggBv29CZwc0aEAoo2OxgiJdkTXFzEE2IitdLhO2GnvRjbjQNgi/MMSOz8S
         TTtZJNgs4QJfEOYU4oGYxUiiH/3zvo+Z6zPGb5+WKmkzBWGkxPnXljO9xYcQZFstFFoc
         RyI6QhonFFofI8TL1phVhRxrkjm5E2IeQ2CFpUErHU7MXqu2H4FsxwukgWCWh+9vEQNg
         mPFPhhD7m9bQlp6ueh2kqfkQd71t7N5Nb2qktOaysoBzykkT9uaEz0Wtp0N/fZb1EwAy
         PykA==
X-Gm-Message-State: AOAM532SqEEOi6Mv7sOeXd8KRUd3VarOZlK1r2TTjpzQAB2eJXkXFSpX
	t8/4YKRQnYV9H5E4nVg4duFebMEq6j1CqHAj15m/wIP/YCjNTS+WScpGmOh0taRRBpSTG39qSH2
	YhezaRQuWlvKdxn8I
X-Received: by 2002:adf:f205:: with SMTP id p5mr18206951wro.170.1620076283621;
        Mon, 03 May 2021 14:11:23 -0700 (PDT)
X-Received: by 2002:adf:f205:: with SMTP id p5mr18206939wro.170.1620076283523;
        Mon, 03 May 2021 14:11:23 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id g13sm9225576wrd.41.2021.05.03.14.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:11:23 -0700 (PDT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v6 12/12] qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore
Date: Mon,  3 May 2021 23:10:20 +0200
Message-Id: <20210503211020.894589-13-philmd@redhat.com>
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
X-TUID: xuTZubOsrrCw

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c767389217..46de073d155 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -175,14 +175,13 @@
    'boot-serial-test',
    'hexloader-test']
 
-# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
+   'bios-tables-test',
    'xlnx-can-test',
    'migration-test']
 
-- 
2.26.3
