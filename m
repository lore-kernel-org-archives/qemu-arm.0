Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp643157lfc;
        Wed, 26 Aug 2020 03:55:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0dzITNQFYhTcBa9GxrHoEFFn3SRL+nH+l7Q+zkQhqEk5cV0twpaeVlnNI8ebtjbqupP/I
X-Received: by 2002:ac8:1c82:: with SMTP id f2mr13897506qtl.305.1598439352827;
        Wed, 26 Aug 2020 03:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598439352; cv=none;
        d=google.com; s=arc-20160816;
        b=T1U5sk0kVGm+xf/DT02jfhWEF22QRal9ItMJQg9q6LaTCJWZyuQnvz+50DIWZxSV83
         X7bqRrmDibSLjQXBDfzrqtlIK8eYkw9nhcJ/5Oz4IhQ0T7W3nvDgVJ0LEOqxKYkm5pGk
         fP3gyCNl08bn4LLNHe2IDkckpmFVy5DXZ3ookIJI8pYAH67Uuqix6x3vmZcRQT8wsVGX
         SfNxF7JEPywwz8pXZuDxwFIv2/jOv+/V1uxzZzs7qDb64+1w8vSoy0jrvtVGasoT+AcT
         6ZAnBq9atTqTJvXyJiqnRCGQKf85fxPjw6gMX4Ljmr3Bi5Fldc2VgiwJ9vk6R0+23kE3
         J4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xJwqIXJgtPya3h9FnX+F/kZQIPaPKuTAvRRxWNyjYgU=;
        b=rHVi20B5SJyzRPRj4YPuoGCr1OicnPaAjJ5C/rOha2mlKIrgiPHTQo3jW3hHAKbHMs
         es3cxXt6k/X7w+TsDmQkh8odo0OtC1prAx0GoSzzGQyp+e1Ungco5igkc/GyGCWKaXUJ
         5pfjMw/UEMRE0Ghp2tHlKUgeqVAMfbeh+xQ/jTR0yUoP2/Rhr25UYKXsumBQqj1qOX73
         rHujP99aEpEckon77lH5UlAx3OiTR5k4FrfiUt73wKLGRmt59rozyH1nSKy6kAZps/sr
         xI/Yr9hJQsjTvuAwU0aiupcgZOOjhnqBx5Nyrql5C1Nh7dJZwifM6q4TSfvFJCxPEM16
         cOug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TgUiBCbQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si1065301qvz.165.2020.08.26.03.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 03:55:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TgUiBCbQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAt5q-0002UO-Kw
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 06:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3I-0005hj-Nm
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:53:12 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35230
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3F-0001Vv-TN
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598439189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xJwqIXJgtPya3h9FnX+F/kZQIPaPKuTAvRRxWNyjYgU=;
 b=TgUiBCbQaZdnhGdGR39T61eMUV1hpbB6pSc5EAve50Z7VokHTowGT/LgSFED4FxN5HaHUU
 i/w8PfpJ3uWfEk5/isgct2fdltTbbSt51A9q2qXAzIiRSXtvLMoHLbV4Lx76G7ZdwUCNnG
 g9TZnDYzBVaO1PNGzytBcA/MnQzyQCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-Z0zdAWZhNF2pAAUacGa_5w-1; Wed, 26 Aug 2020 06:53:07 -0400
X-MC-Unique: Z0zdAWZhNF2pAAUacGa_5w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22E97807334;
 Wed, 26 Aug 2020 10:53:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B586E5D9E8;
 Wed, 26 Aug 2020 10:53:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D6F931F73; Wed, 26 Aug 2020 12:52:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/20] microvm/acpi: disable virtio-mmio cmdline hack
Date: Wed, 26 Aug 2020 12:52:46 +0200
Message-Id: <20200826105254.28496-13-kraxel@redhat.com>
In-Reply-To: <20200826105254.28496-1-kraxel@redhat.com>
References: <20200826105254.28496-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7H2hgi61x9rX

... in case we are using ACPI.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/microvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 54510a03f754..04209eb38fbe 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -343,7 +343,8 @@ static void microvm_machine_reset(MachineState *machine)
     CPUState *cs;
     X86CPU *cpu;
 
-    if (machine->kernel_filename != NULL &&
+    if (!x86_machine_is_acpi_enabled(X86_MACHINE(machine)) &&
+        machine->kernel_filename != NULL &&
         mms->auto_kernel_cmdline && !mms->kernel_cmdline_fixed) {
         microvm_fix_kernel_cmdline(machine);
         mms->kernel_cmdline_fixed = true;
-- 
2.27.0

