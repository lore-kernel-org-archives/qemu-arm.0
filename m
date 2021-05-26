Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5616606lfm;
        Wed, 26 May 2021 10:06:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw120apfyomiqMGE8KIybaxW5Ee0zRZ0Bns0zZGdG/mfK58a2AZup1gqam+juuRBYSJU0oc
X-Received: by 2002:adf:f142:: with SMTP id y2mr33245595wro.426.1622048784308;
        Wed, 26 May 2021 10:06:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622048784; cv=none;
        d=google.com; s=arc-20160816;
        b=B7x2SB0S8wyPrxxVAKAJNhtvobbpcTV8YBEGciRPK4iJ7otXL9BAERmsQ+8SfB+6lY
         HbOpNwCIPR5SdMEFohXwTI3jjvGSBSLP+8w6Xkh0CZUReqClzre/MFJd+WLZVzXEEBQG
         9sRmgI08hsInYeh4S4t/In6fE45tjL9MUiat+1JR+E8KWpokxCkF2bHZpIdUES5uEe2P
         ftDgRMqsZ5s3cfwuArf47+3ToftVM3mtaLyQUZBeVY1tnWpkR2P9iv8m3TPJzN6jTzgC
         wWepvBAEV26ClJ9/1rkMMHxDCxZ79rIM74prw7wlTSdbQKipBNHgeWuopPOTW6buZMsR
         sSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=W8w7RhXeFSRWGk0AutdMu5ukNCwh8itA/alKjBFfess=;
        b=uKxlKFbSowU5bp9jDA+nq0ZTYuyCINvcG3qi0KJ8ZYdJdBgDtBwKVnULdgerTyzNib
         K6BSR7/+6YjEthliRcDnE04vZ/qDkdbnzLwW/R7Ut6wC2ZGy/gRi/dAbtpe/x7Y7ox/l
         Sjjs+uBEquD/dmDWkOXWqS5aUJzXxSizTdIQz9R7u0FhyqpJRjHsPnbOswFmUbyhYICb
         HY9DyZ20Yt+l/pBDp+G5FdSX7xZuk2Awzuyr2OrHR/ngJYeunDWHsKR7oCG2cTPtNiis
         eXy5ow2n9IK+F3SFFm9bifX/Wq3tRR6BK8SWUkpLNLilE7//xkwnFu2oVmnomA7+o2dX
         yohQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Xg/GaH1j";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y14si4963107edc.428.2021.05.26.10.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 May 2021 10:06:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Xg/GaH1j";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622048783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8w7RhXeFSRWGk0AutdMu5ukNCwh8itA/alKjBFfess=;
	b=Xg/GaH1jxMC0bZA86hEzFtRD1Yg8RyNeasFFgi0XQExCCjz65QakvmBLvCIFVVknkQzQrc
	85YUxUeGIwa7bR4jNWdOQ4lJivWLVWGm/PCUhNLqN7zlS9RPjQz5zKkjWReAcRuYVO9DM7
	bwGYSfCUs60XaKs3tPCeC5t08f6vp4U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-QwaEXke3O2CFbQlLef0vNg-1; Wed, 26 May 2021 13:06:21 -0400
X-MC-Unique: QwaEXke3O2CFbQlLef0vNg-1
Received: by mail-wm1-f69.google.com with SMTP id b67-20020a1ce4460000b029017517d833b9so637649wmh.0
        for <alex.bennee@linaro.org>; Wed, 26 May 2021 10:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W8w7RhXeFSRWGk0AutdMu5ukNCwh8itA/alKjBFfess=;
        b=d7+yR3mJZklADWxmZyN7WHgtJ2LW78RWFa4R+VfoE54848OmAhYtMbQaYNXzKxOycp
         TOA8K8Z0o+JCu5avzDBfAVLU7hiSUA2UlbgHZ6wc6IGC3nt/xHAUaVSIuaXHfY4teJwJ
         NSlIm5c+XvBKA1zmW9cJ5/UxhccdAOFljdVNCcUlh/c1qtbZK4u61ZZP5PEZ6rO938UO
         OOT2c5LOnT+XCX6IZ3pAaPo62bue2n2S8AvpTLMbLg3QozyEFiwiCHmUfR9R2eib1cF4
         0d9w1Cp+XmJ2gdyOHJIKV4kN8ATDtGpkaMFZx1ULVVZwBkxyFJwTbnxPtRGGke0WM6Ww
         5xJw==
X-Gm-Message-State: AOAM5306JJgrazenFkNQKACoApfwdojRquBWb9JkwlVVdEzKEbAD0G/Y
	pWHI4BTm6ynwN1Ctug5B4TsLJdY6qTlP4yQZTTv1thhHWSZg3PGbhuKxJSaJxKOwMZRelymek0h
	U/8bC7RqQQrT3m6xR
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr2823909wrw.128.1622048780358;
        Wed, 26 May 2021 10:06:20 -0700 (PDT)
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr2823891wrw.128.1622048780168;
        Wed, 26 May 2021 10:06:20 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.64])
        by smtp.gmail.com with ESMTPSA id h15sm15245676wmq.1.2021.05.26.10.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:06:19 -0700 (PDT)
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
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v8 12/12] qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore
Date: Wed, 26 May 2021 19:04:32 +0200
Message-Id: <20210526170432.343588-13-philmd@redhat.com>
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
X-TUID: 81iT+gKmudwn

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
index c3a223a83d6..2c7415d6166 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -176,14 +176,13 @@
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
