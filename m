Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4791787lfg;
        Tue, 16 Mar 2021 10:52:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3a9d5/WgTIgzKV7ZoP686oz7hrV/cCobtJ+H8HL/m29NrC58R2DxlNafqsqwDqt3a642a
X-Received: by 2002:a05:6638:e93:: with SMTP id p19mr15038658jas.10.1615917167018;
        Tue, 16 Mar 2021 10:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615917167; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8rKDKre+bqXgb18KBiXqvF2p0S/za75IUq4ZbUaDui3FrCQryj9MK78W8hhgt3LWE
         dfghfVMgbSOEKhkFrarSdPgztKTKDzFm4rKwFUGFmJvp6PEk9YqdcBa3tqPhdkTPJISE
         SUuap+BU/+kXf8Pk86gm98scpj4kRja7JaqKtbCN7I/bPT5BEp2uqMyOgpJx1Fe0IfeL
         BIhCnbeaE2YleSc5R5vzyCVPEx+eVUxkhLMgvF3rMZ9v+REYo6wA97cPB/OPDDdFOUg7
         7rEiisXNQa67gT5FVlPOGoqLSSupZIBA2aUYyWQg4WAwB2mu2f0WRZ3NDlTGIgCaPPRN
         UwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ef99CGiVPIoBJ1DNt6ZdEeS2PoHSPZ74D2ug+Z1Mo6I=;
        b=BKU8lYawaQLbt+v5GqjFKVfv3OTzs5XvMZV5LW14KmNq6/Xx1+RZePQTT2QnMY7X4+
         wvBeLhm0PQpAkLBFVYOiAnIy8oGM0Yo4hqud318Lr8jREwQDSV8iweYUO7uPmnSNIaVv
         v6LuHXYuRO87PQMYMHKi8BC8PlF3uuEcJrLljzU9L6m7B1F+dZS61YlEWEG5WHds+HVW
         H2EvxdrfwWk//YERrItUKOoobpG4nyx0NUw3kweuRdfRgE9q1dFudnE6X3Go/2G5AtHl
         tRI9fQpb6eEI4+Ia+aMH80ALxgEtJw8xWrVGRDvC9FjF2ZRaV8+lQ7hC+wB++vbLF5+M
         f04A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bcCQgyaZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si13994907ilh.127.2021.03.16.10.52.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 10:52:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bcCQgyaZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMDs6-0008FJ-6N
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 13:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRW-0000E9-Lj
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 13:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRV-0002vt-4k
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 13:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ef99CGiVPIoBJ1DNt6ZdEeS2PoHSPZ74D2ug+Z1Mo6I=;
 b=bcCQgyaZwsAMakgdtk1j+BKVo+Mfhp7yk/moq6K3Q3qJr1iLnJHLgKAQQw2+XgWFO0eUhe
 xcPPn9kcIjlJONc6EXCUKQa0acm3VaZCSoYErLKK3iE9xn2NwaqEQfm3hgrj0kLFBdeFwz
 ZRKQu193z/TF+8GyW6O9amJj92Ba194=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-SRG2oxZ4Mq-9roC_W1DAuw-1; Tue, 16 Mar 2021 13:25:15 -0400
X-MC-Unique: SRG2oxZ4Mq-9roC_W1DAuw-1
Received: by mail-wr1-f70.google.com with SMTP id z17so16993957wrv.23
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 10:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ef99CGiVPIoBJ1DNt6ZdEeS2PoHSPZ74D2ug+Z1Mo6I=;
 b=RF4IYXjrwC3mYTnO547wzNyPkoAA7qMGjG2HOdCGmDOBsEU6DB5SCYijGXqjTzXdW9
 znBD7gDasDd84wk/2dQzT0S7IiCY+EaxGJBsJNu/iJeZDtRIyHnKi/aLsTjq3odNuN95
 Jut//qar472eziGguVubShjp/QNgYeJKuayvRGCxDqVYdg7rvknE8L+YUlYeax/M8GNk
 xk6AYxl5qIuPC8tlznmzeH3ZpRvJHDzTyI37mroams4e1kGOqOR/84HVWJMqKCLJu1Ez
 YFK1s24xpN0OT+NF03wa+3Z66eZPKp3OWKpON7o2p8+fENbU9pLYBAhEvQjYPBc5ncWt
 wJrA==
X-Gm-Message-State: AOAM533DodguB4GUHWiVJs6PZoYgdNpnU7c3zDimrOPn/bvKMY4KLioh
 KbXy6k0yJieyJb6Y4Be63CStgY7OR7U3IZdqmyZZeTTz8AvWYmXnPlqo26apEKvdCL6gYsqF8Gl
 nludtoghdkWLo
X-Received: by 2002:adf:d851:: with SMTP id k17mr112716wrl.254.1615915512914; 
 Tue, 16 Mar 2021 10:25:12 -0700 (PDT)
X-Received: by 2002:adf:d851:: with SMTP id k17mr112693wrl.254.1615915512741; 
 Tue, 16 Mar 2021 10:25:12 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 12sm40097wmw.43.2021.03.16.10.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:25:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] tests/qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
Date: Tue, 16 Mar 2021 18:24:49 +0100
Message-Id: <20210316172449.3148634-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316172449.3148634-1-philmd@redhat.com>
References: <20210316172449.3148634-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Twa40ADshrnn

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 66ee9fbf450..82e92d33f82 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -173,14 +173,13 @@
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
2.26.2

