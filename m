Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp703375lfr;
        Thu, 15 Apr 2021 09:52:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCYZwzpVU9DPKk7qXBMtwDvQZ5FeU6s7/g3+gfS5iOnRZ1X8ErUpNvt3lMlj0/yLudvlaI
X-Received: by 2002:a6b:6102:: with SMTP id v2mr185516iob.42.1618505554071;
        Thu, 15 Apr 2021 09:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618505554; cv=none;
        d=google.com; s=arc-20160816;
        b=mzPzRE+ju/EPhsJXGZg0BguoYvJEh5upBKkSeiwAzpgtAaRECWgU+YTO8ZTOmxH9OO
         ZblEObR46GGhiRgm7LZ8gDdvOZo1y7jufOE4nP3TZkzXnbkSbsraUcAz40f/iLhMvvpT
         HXcBhp9lhFCBplqc/JxNtdLw1yJc3pvBqvtY2dLQxiZKT9in2OsIxLtuWN2dK624Psdm
         10ceTPrI3OpJbBk0hpEdxHHbny42t+qY0EBsa3TMcws0p4Rd6gLzAT0X5IW5P7nwxfp2
         DrgS1uwgVjvIQ10s5r3W+gf/fPj7qH2HWLvnHhX5DTcEKZk2RkHW/7gdsal+/2HqRI/e
         OMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
        b=VysMfWwqo6TpQKAJKAOeyjFrerLpqI64SdaercGWRs6gG2oFBAOgAsoy/uC5utqmXC
         FnuIEcOVY3m7kPtUIs1CP/kBEBRxz/BLBW9DT154uXtgbkQSGLfZ1LTpH/LrA3pgTRYn
         D2oGNfNK5seXKwuCVmFOV5wXzHuULVtAXCuE/5YvH6VrmxunXIcvP1xTeNGRivtzStfv
         JXrsJdq2ghdvYvRdK6JYs7qUdsWt6kw61M3bImUAz2TozvhLiIvDO7GLEDCvXa1THuXX
         aXPb2+rG5HnwZDstmPxOjUd9VwEjMvrySv8CChkAMbfR5WITxr6FsieQ84qG+Z/EOe7c
         lBSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ASRtAwyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si3173502ils.131.2021.04.15.09.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 09:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ASRtAwyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX5EG-0000FX-R9
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 12:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wb-0003aG-Vn
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wX-0006Kc-CM
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 12:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
 b=ASRtAwyfX5sc8yAK7cnpJTdKvjcIFUmjnAXy4EoG9OcniJRvHu4AMz/U+xbhHUOuuQyrL0
 IqnRoB8+zqjzjc0ioH0Gz0jMYf/DWqvjvwWBjP5w6RDV97D/za8CY3sq2ZM8NBb1GBzjG6
 7zM9dyTp2h7KkO/Za2itYEZrO8aGPb0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-ssI1Yc_XN2-7Vna3y2q_XQ-1; Thu, 15 Apr 2021 12:34:10 -0400
X-MC-Unique: ssI1Yc_XN2-7Vna3y2q_XQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k1-20020adfd2210000b02901040d1dbcaeso2987471wrh.17
 for <qemu-arm@nongnu.org>; Thu, 15 Apr 2021 09:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGzikIBP/Z5SEBvKQqeWbm5PvQswPv/9xcZd1fSf1xk=;
 b=V316LzuU+oQkNtTKwET6dvkjlQn8NF+dOJ1qxwyckvrHSrOaDmklSJKbLt7yIRiHPO
 /jWHD4asIxgml59QMncfOJHq6wgZIDGMdQd/gUX4Zb8LHhT7KvIWe4JDYJW8n2AVc27G
 G3toXICEX5tnnSWntNx4i6QSBGtzQ5gre1GKy+gG6atUH8K6Xe1aNBF39++/AQTRqUE+
 Sb24H80qlGxScS7h8TsFOufVcrypR26gGgWnqgPlwwHfkM41SZ1qzoZ1vO63l9u203Xc
 q26q8m+yfm1zsWNLivGnSpESfXpSZS5jFCdr0naK3F8zQSJh+Zkoj5WPwPoy/tUv/D0r
 1cGQ==
X-Gm-Message-State: AOAM531lWZjeabpxewpKe0kMbEfg6OhY+cXB+3KMMMacUgXmJyV/Xkr6
 Hst2NBAc6KVIo73q89A/HdJLzmsjjJwmCaCGXsxw6jbrPecIwNDBUsqyt9WBQTpKSNeyGn71wP4
 1HXxWcAsuBhaF
X-Received: by 2002:adf:9148:: with SMTP id j66mr4505322wrj.124.1618504448904; 
 Thu, 15 Apr 2021 09:34:08 -0700 (PDT)
X-Received: by 2002:adf:9148:: with SMTP id j66mr4505308wrj.124.1618504448726; 
 Thu, 15 Apr 2021 09:34:08 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c1sm4236652wrx.89.2021.04.15.09.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:34:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/12] tests/qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
Date: Thu, 15 Apr 2021 18:33:03 +0200
Message-Id: <20210415163304.4120052-12-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ljrFt8Ex7NSp

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

