Received: by 2002:a05:6214:9cd:0:0:0:0 with SMTP id dp13csp1645752qvb;
        Thu, 15 Apr 2021 05:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfULVqden3FnEphMetNdPKpPixwDew1xETjxlpg0tgJ+vylG6OeiqjBAzDbc0UnEw128E4
X-Received: by 2002:a67:62c1:: with SMTP id w184mr1693632vsb.45.1618489664134;
        Thu, 15 Apr 2021 05:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618489664; cv=none;
        d=google.com; s=arc-20160816;
        b=aXezW0do5uL/RUWfm1Xz7jFeH2yU4h0okazf2kLxh4k/Elx9TJa+uHVNUJbCZHd186
         DbEFn6kI2MX9zLUfHX1Q2ECj/pNIA7B4Qq7b7zaEy6+ZSqbTa7Te+I88AIhCtf2hn5nr
         BSqqRUXsJjR9eIR/rD4z9pyGtzMeKkwoko4iNVQNQEYANtVTve94i0EX7bC76324803K
         1fppFy6pPmQpKpNZtmV9as0n0O8eriSFuocYJkWSIXA7+4n69Nr0FCwY3AyI6yUtafBR
         +0spalqodHB37rDcfKWgvoOb3L98cEGtAwQrnt5g9UqSeIM4GuYGS2BXd0CkREk5MIWS
         JRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
        b=WvX66fe4v5u4VzH1vAeVlVT1psqg15wChlvC8XUYVEUGw4vUeoYYCohMmJBPUz+wdu
         Sl5Qz7ikGUdexouqmu1GsOVXjh3o2+TAW13Z4I5/cwCZDNS3ETKiRtlSnnS0xCenYrnq
         bj/0tJhLDZHynfitnzrRboFoR8PC5UqTboUGWW0TQAX60ps5imkulqg8I0U57rYRY03o
         YFHiEo6z0E2r68O/Qsmzob7qZ9HvFkdw/ADPTAirtFKbGeTBFWNKLtTr86v7DA6K/Bw2
         yXGkVRPLjqtgLHHDRRYXuK3jZmxpt2W7U9eAfNM8lC9Sd+ZWDYNwjoiQuXf3iFsteBIU
         3Quw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aT9FPnWm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h89si921588uad.145.2021.04.15.05.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 05:27:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aT9FPnWm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX15z-0003GW-G6
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 08:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX15R-0003D9-B4
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:27:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX15P-0006BT-Sq
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 08:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618489626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
 b=aT9FPnWm4xI/utF+CAk9HUrwkvSBVM28DPL+7MtVUpqURwmL7apdevQ/Fx1D98P5SddUiA
 PLXSelqeSQuUstY9/MjAGI2B5ifcP/OWMYJrnsk3g7rxkG3O3Xzmr/5/KTPpX/n7wgcsyc
 TZigwodAdvZdYpNAOJXxBghToPnaizk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-7zKue-kLOFGl2QXASGcUXw-1; Thu, 15 Apr 2021 08:27:03 -0400
X-MC-Unique: 7zKue-kLOFGl2QXASGcUXw-1
Received: by mail-wr1-f72.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso2682356wrs.2
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 05:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
 b=NPgzdPnR/J1O9I9lTYkySssLZ71UKEjheSM7KYFquPiEdCFBBJjPxeXV5viZ4Ks4GF
 TXX2Q0RieXAH8GQp9j2Mhj5I5y8ypZchNLoGo39Xujjb3O6gDuJ9+2zZ4C9GoEdEnSV+
 Im6cWBw1iUOVksdMSvQNMp51e+4qs/ulXZory3TJbO074rxWkHjyqzpiN+IczYs/vy7t
 o6Yejtpo2q6DYdcGaff3fPYQWlBS861ijVMUBhAcB6YI/0bN/+TP3O+duAyxH/e1tPX0
 J1bgBweGeMtfdCLoCezsiUuNDAy7ElZOLMUmqptUpwX8k9Z83yRC4x8y9yYte3R8LwHa
 zSMA==
X-Gm-Message-State: AOAM531vAqvytsbD2FFo1yiKsWIM+gFQshlzw+21xucFs1XWWisyl6uj
 gV7m+5ZMJiRRV1dfRV6UbT3IaYPYIcUqvZ0G88Q1e+ggsJmPuMEu+UbdOWS7KPeI0sttqj6iruQ
 Cg1Tt4YpczlvO
X-Received: by 2002:a05:600c:649:: with SMTP id
 p9mr3008077wmm.47.1618489621833; 
 Thu, 15 Apr 2021 05:27:01 -0700 (PDT)
X-Received: by 2002:a05:600c:649:: with SMTP id
 p9mr3008057wmm.47.1618489621666; 
 Thu, 15 Apr 2021 05:27:01 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u3sm2456551wmg.48.2021.04.15.05.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:27:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] tests/qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
Date: Thu, 15 Apr 2021 14:26:32 +0200
Message-Id: <20210415122633.4054644-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ORQ+Zjt0btf

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Reviewed-by: Eric Blake <eblake@redhat.com>
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

