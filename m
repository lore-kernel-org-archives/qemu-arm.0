Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505229dyc;
        Thu, 3 Jul 2025 05:38:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWja+RgnrJ8B02QqgTVrIleXcv1uxLAlXU4cxdpEqkdc9jUylJYSLCIbc7dBNCSSPW6X+mjqGK2WCu2VA==@linaro.org
X-Google-Smtp-Source: AGHT+IHhf9u4WbQKCiT9joSq0RMf7C6j4lYts3zHhccQU642gphh2RU8vgBOiLRvd+nOKIcwiie9
X-Received: by 2002:ac8:7c4b:0:b0:4a9:85c6:be54 with SMTP id d75a77b69052e-4a987aab544mr53184201cf.52.1751546283205;
        Thu, 03 Jul 2025 05:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546283; cv=none;
        d=google.com; s=arc-20240605;
        b=iN6I+F5YPWM7I6In9iznjlYVzIV9hbqCNqQEdEhjjkrKwAlLcnipettn0Te9bWl92x
         rS07G5wvSDufTSgpgETgdKIGeLj9woqmLQOFnNoQ+VICwMme9rydW5ET/YmqVnCIOZK5
         idyOm9Mc79BTRZxOfxZvw0Vlw1+FEb5I88Yfl0ehaAC5AkwPVB7ssSNdqpU7ik20rWKZ
         oN3HlH2UYfba+lYxauGV6XfvGbBs9KXLgUpEflPc3E17e45sdGtrfhtqESeqAGHqCs24
         OBtIVYNidFBYWOg5e57k8Pr4XQSr82B3SamzKORT40S6s269GD66Y0VDdlpsvpeTKYqP
         Tnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0BaxeOnHXIUQwuoJrhSzXIiwHPjpUaxWi3HguO7u80E=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=H9IaMwBMGMU0UWR0YKvadu72+a8p33zS0hLqxg9L97JFbTmObL5covKXRGP6l5WnJD
         PguWHnePDXOaJg6hdx89ZYwOUla0qrBP5r/PUjwjw87/zSy7sZz8vYNPjXck8wnwWNqC
         ZHMLMiAj9WHiVcLmmaFlIAtNr3YZTMJXOYeqBVaUkP8izauARFou+XrEMXPfz7p5SWa7
         IteUVhaZ3SvyE3U+lmoz5FIvJI5/S9/jVE4TkuT8DBvv5+QgHQLorgJR+UUVnoJLWKf/
         JvI8CjoKzAQr+HMlbvgsWfawQfLHEvC5zNTeEhdweEj1VBvs3Ue2aDvyNauUVyx6mURI
         tBrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSB4o93M;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc369b69si153578151cf.455.2025.07.03.05.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSB4o93M;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BaxeOnHXIUQwuoJrhSzXIiwHPjpUaxWi3HguO7u80E=;
	b=FSB4o93MbzqgS7IPNUrEGK5DXX21FEbmoVELosViR51bVtSYWfadJsOwH+J7vlEqHhZIFI
	NtArdlyyjiCAic+Jow8zwYijIDjM0cuYQVbZakMc6Ha6B6yIyKP42XUaAT44m7nxTM0Yec
	6L41uB42joBazezC9AchL6I6ZaWoGwE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-dXUOKrs6P9SGqEebpwDcbw-1; Thu,
 03 Jul 2025 08:37:59 -0400
X-MC-Unique: dXUOKrs6P9SGqEebpwDcbw-1
X-Mimecast-MFC-AGG-ID: dXUOKrs6P9SGqEebpwDcbw_1751546278
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E681518002ED;
	Thu,  3 Jul 2025 12:37:57 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 786F11803AFF;
	Thu,  3 Jul 2025 12:37:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 04/36] tests/qtest/bios-tables-test: Prepare for changes in the DSDT table
Date: Thu,  3 Jul 2025 14:35:04 +0200
Message-ID: <20250703123728.414386-5-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: gn5hIcJ0ak+Q

From: Gustavo Romero <gustavo.romero@linaro.org>

This commit adds DSDT blobs to the whilelist in the prospect to
allow changes in the GPEX _OSC method.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>

---
v3 -> v4:
- add missed tests/data/acpi/riscv64/virt/DSDT

v2 -> v3:
- fix for microvm
---
 tests/qtest/bios-tables-test-allowed-diff.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..333e5acf63 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,8 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
+"tests/data/acpi/x86/microvm/DSDT.pcie",
+"tests/data/acpi/riscv64/virt/DSDT",
-- 
2.49.0
