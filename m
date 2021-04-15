Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp696559lfr;
        Thu, 15 Apr 2021 09:44:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe7v0M7DZpAEBlknu3eAzfIt0k2DPVLMJv1/3LdYjLP5xhBT+cewiaNI6uYndKVDhoJ2uT
X-Received: by 2002:a92:cc02:: with SMTP id s2mr3119453ilp.101.1618505053437;
        Thu, 15 Apr 2021 09:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618505053; cv=none;
        d=google.com; s=arc-20160816;
        b=n1Xjl/HNp+Dig7Yb1ft2Oi39wcfRGF3t1tjrgbF+ETs66oASOuVS+M15tttcKhYxFB
         1gUTgXWmzh5TG1mXGvcuOG7JPJ5zJ6AC1H6khEby11tS6n8ux6cTLzjoEWAE46LRWobU
         XzTyc3HiYTbawOKZPJ7l98nKK6m9nvuSwRJnF20bKSKlRbREtOeQhw9WuMWe+W35SHZu
         uQdwyX2YzOe6hQsV7AGRAEibcQRAMeOhBqA44WQFgmqb7j9y+5l2NHLth8OFnC0gsyfJ
         i3MXbIUmhUQ06wMmCLhH0MNpyK3z6foeB2T7nvtthJ/dRGMVtaO8RBoHa7kxFAzN78UV
         9Wjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9iw76Yu1vXx1t9abc6WDL1dztK1Y+iaVuos13TsdKz0=;
        b=BWbFp2PPOiHk2Msxu9g4hrKxFuU7lkg0QpN9Y3C2daeEw0Z20039/9Ra2qLnmN/rke
         iZtrTBIAzwmgX42630UKXmYLBeFfK7hZ9dVPOOKc6Jm7LDIXJNWhLeLyVKudlPklqUQ1
         bZRzMj6/YAjzvW5+hSSN3iJnJe+ut9G+YAD47npSIHCPHvBqMKO/LY6CoEMLXpKxLZew
         wqzJicudkidNQ+pigFggIzXnBA4RH1UmEN1WHcFgqd3Q8NLCR9orxm9anFcIt7VoZMS9
         dPf+LSLErK0dHA9W8WDd4Wa5h5eKvY/ypma0XOWOXb13l7HyU8u30JvOa+8Yue4znReY
         MtPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TYOCR86z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si3064749jan.52.2021.04.15.09.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 09:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TYOCR86z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX56C-0001EP-ND
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 12:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wO-0003PL-Lg
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4w8-0006Fu-2p
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9iw76Yu1vXx1t9abc6WDL1dztK1Y+iaVuos13TsdKz0=;
 b=TYOCR86z+XPdbtyu1534gN9YrQFZ0BOq+J+SSVrSKyjWKTwlNb47waNRWMdotQRa1xHQys
 Nh5mruBNcsoeMZFSgrYCbAS+fBtqf9iLeQ/uHcBMxbiQ/UIYBnsdGO42WWZRITY7Kw1pDN
 vL+EOMpDwPB5UnZZVTJxu7vwOnBXcOk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-oBU9R6xPP8GmJcRFPbhWsw-1; Thu, 15 Apr 2021 12:33:44 -0400
X-MC-Unique: oBU9R6xPP8GmJcRFPbhWsw-1
Received: by mail-wr1-f70.google.com with SMTP id
 91-20020adf82e40000b0290106e67e7bfcso210721wrc.5
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9iw76Yu1vXx1t9abc6WDL1dztK1Y+iaVuos13TsdKz0=;
 b=NqRhigIu34d7DhlsHqclFmOTv4tTqSugLO3A7JDynQLZYY/0AimKBDtehv4JLy+ya6
 zmQh7lYPhyZ1+R8oG39He/1n6Aav39gvum3XbU8fa06thL0gWs8+shVASMsLyPpd/8+z
 3HEH6quxvxv1dnsOmgexrOGVFrfmS4aEcnOpi0PZNTJ0YNCLzHf6roXfIE6/PAU2Pdqm
 2mYibOxWC6TPM94glrSRtm8J6JTN2QYEwnY4Qn9nMLlMwOUVHK8NcM+VHFJya1nGvLpQ
 qZFzHoRFfgjcOuh/Z1feHXlQNYQ6WBm/Svei/tQ1lg1CWYsPqTSc4CvsfcpdpUQpJ3gL
 NKkQ==
X-Gm-Message-State: AOAM530c91QcYoFEc02Xus99FK5uvcgwKszhSjst8zQRbR5f/dnafF6j
 mxXed0QdmUNIZEcnVM+4CHO83Ml7VJJq0mycy5fddLoVCBdphCSpobGki/noluw6FMIBwz/3USI
 9YSgB91y8HSqvbYIgx99dpl3gIARLWRTKfvUxN4MFIdnaeEVGheCobmalZ9V4eFVG
X-Received: by 2002:a5d:678e:: with SMTP id v14mr4516111wru.156.1618504422907; 
 Thu, 15 Apr 2021 09:33:42 -0700 (PDT)
X-Received: by 2002:a5d:678e:: with SMTP id v14mr4516076wru.156.1618504422714; 
 Thu, 15 Apr 2021 09:33:42 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n9sm4275510wrq.86.2021.04.15.09.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/12] qtest/arm-cpu-features: Remove TCG fallback to KVM
 specific tests
Date: Thu, 15 Apr 2021 18:32:58 +0200
Message-Id: <20210415163304.4120052-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j2cv10RAP1cT

sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
tests are now only being run if KVM is available. Drop the TCG
fallback.

Suggested-by: Andrew Jones <drjones@redhat.com>
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

