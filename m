Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp1605327ejh;
        Mon, 29 Aug 2022 01:11:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5bnS7g0FYf8MHER4yWzExIIWi2g1gfHzUrWhuxHibUw7G1u9dKax1OZH69MD83gdiGjjnN
X-Received: by 2002:ac8:6b05:0:b0:343:6173:f513 with SMTP id w5-20020ac86b05000000b003436173f513mr4496193qts.681.1661760666632;
        Mon, 29 Aug 2022 01:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661760666; cv=none;
        d=google.com; s=arc-20160816;
        b=XEqtVFIScVpZ8bFtpewyMoc07qIbL2KlaS1w6/vSmTw4d6njaFA47SNF3MI7EcF9ga
         1naF/jqhg/acnC4q8mRXcYb61+mgeJFE6i6kZuT9CHWdTxgAEmS/69kwNqOsGGTWZ7yR
         mxY+X9+/vJqlreIqgfrXohGRuFAZ0I3S475R3ZNa5K/He1dW+Ap3iGLNMKYQy6O2jl+X
         zlB4+uo1hEubdncdnojW6bWtgFm9M34Vac89Im+P6jJ3xfwSG156B8E9/wG+1SwyWvXo
         F7jzIuy5hLTDeJngAQmg9A/Vxcdb1HQ737AZ+GA0RkVjFE39JWgIIebh5gQ+TQT6heIE
         6NMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pBBTjB/SbwHMGw6GqAFQviyP++kri93EN3+YcY22TVA=;
        b=gpgsZdVyIkva8RhVt05yKiKmYGS1azsguqkhmxTmuPmkI5YsGJJ+HtZtcwmuG6as6Y
         eVlL/Jik2/M/+hRRlhggB9N1ywer1KQatvRQAT2VTJU0JrnN0sp9uvKpIo65peOQ9XmU
         MhtvMwWOyi5wRYGaLlJx6B/IZ2D0FC8qkh1DxQzTXBUKh2MPL1AF8tYoO+pZsFvvNuKw
         EO7GQLUy6DEFWkQijI438Kmsh4uDi0b9LRL9P8Z3OjCpuSNQ/KtOG/QAnkyQ1EQx+zjs
         tKNFGevSw1/pVvHpYVCzR91lb3UGXBvbsL8AoYc3kkNooT/Yws70A7KJ+q14MHQw+eZG
         nHvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NpYMd/ul";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl19-20020a056214519300b00476977baa3bsi3426644qvb.431.2022.08.29.01.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Aug 2022 01:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NpYMd/ul";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oSZrO-0002mx-5d
	for alex.bennee@linaro.org; Mon, 29 Aug 2022 04:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oSZqF-0002mV-Oo
 for qemu-arm@nongnu.org; Mon, 29 Aug 2022 04:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oSZqC-00030A-7L
 for qemu-arm@nongnu.org; Mon, 29 Aug 2022 04:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661760591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pBBTjB/SbwHMGw6GqAFQviyP++kri93EN3+YcY22TVA=;
 b=NpYMd/ulYZ4InvUn4s6N2ZgqtgnK47SBlhpVamu35bXXhYQWaxsokR5KWpgUnjelc3TS4J
 CEOtIlyVVVGTj1qTc3GAnUMd5pTQ6paWvq+R5Kle07SwtWKhpD0uQRSaT/F5nFtfYiDibd
 k0xNLKlv91akMlf6u16DMnaUWXL5X0M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-GXNnq5E4MgCLLTtOdU36Ow-1; Mon, 29 Aug 2022 04:09:46 -0400
X-MC-Unique: GXNnq5E4MgCLLTtOdU36Ow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CC943C01E08;
 Mon, 29 Aug 2022 08:09:45 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8EA340CF8E4;
 Mon, 29 Aug 2022 08:09:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-7.2] tests/avocado/boot_linux_console: Fix the
 test_aarch64_xlnx_versal_virt test
Date: Mon, 29 Aug 2022 10:09:40 +0200
Message-Id: <20220829080940.110831-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aYSz/qog+47I

The assets that this test tries to download have been removed from the
server. Update to a newer version to get it working again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/boot_linux_console.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 6b1533c17c..f26e036ab5 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -335,13 +335,13 @@ def test_aarch64_xlnx_versal_virt(self):
         """
         images_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
                       'bionic-updates/main/installer-arm64/'
-                      '20101020ubuntu543.15/images/')
+                      '20101020ubuntu543.19/images/')
         kernel_url = images_url + 'netboot/ubuntu-installer/arm64/linux'
-        kernel_hash = '5bfc54cf7ed8157d93f6e5b0241e727b6dc22c50'
+        kernel_hash = 'e167757620640eb26de0972f578741924abb3a82'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
 
         initrd_url = images_url + 'netboot/ubuntu-installer/arm64/initrd.gz'
-        initrd_hash = 'd385d3e88d53e2004c5d43cbe668b458a094f772'
+        initrd_hash = 'cab5cb3fcefca8408aa5aae57f24574bfce8bdb9'
         initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
 
         self.vm.set_console()
-- 
2.31.1

