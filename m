Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1323945lfb;
        Thu, 14 May 2020 05:26:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqNwSwDN2gcQx7LDKm3Q+ilRCokr4RhlsXoJDblYs4n627sqf01Lgz6ZFpR8f6cRQA+yWJ
X-Received: by 2002:ad4:42c7:: with SMTP id f7mr4560194qvr.127.1589459194757;
        Thu, 14 May 2020 05:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589459194; cv=none;
        d=google.com; s=arc-20160816;
        b=k8FtiWB0aYpNGayYi8eqY0rxf/BwRNlyXVWRiaMOkGEW7SyeGMT+epMvdc0ceLRFMA
         bxdiwdYdQ/O/MkcOuVxWT0xMsUEkrNlGNYeZg2TfBHRnwTnmG8YAp6znnb8ovp9WYszG
         jqaQ1VaRfDJur4B7JO23nq+wJnnKLHZmxzkNyByTPqyAu8jatxpw2bYxuXONWu1NesUz
         ke5ibMP07xofZUKuESiGjRDSWM2wV8vYj/ep3yCkfoq8WCdBDrFOvKFZhnhBwMaM9vcd
         r0S8xxxBGdwmpJHRgMeUem+Gwx0d/RuX2u0jm/WtwVa4W7STSbNxzhhvTatG7ecm8tDy
         leZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=DzPHp2zdx+Z8HyCCS6sehHSF83vfHPYQ8ECZCHWdUcg=;
        b=RgvOytdLjFvt1w3Y6RmglV1lOaGI7L3U8Vlr9TJxWfwDluV/90Y+yu55r0Y4xpWxZK
         UI0jIVydQNlhgyTf1HyBv1qIB3LPN08Qq0yHqqIxM9z1h/T+XGofQXTEetjRpG6+5osf
         aU516Id4MdJDwp5xqG7xOv6yWVcjJIFHsKFHL5WHYvk6JUjh2Fn9QucI1axsnVo/TRG6
         oKNyRKu/LKOUBtFIH6V++jWngymLxftcXmBZu5PhoTkqVutkPbNSDaX9tJU+MXGj3uqo
         IVle8ors2RSAQ3huK5GmthLWNVO9WJpDtrXW10no6od+KZLtaJBAi821ZYFE6+wWHSfF
         lZvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V+9yyc9K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7si1556628qto.36.2020.05.14.05.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 May 2020 05:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V+9yyc9K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZCwc-0006GV-5C
	for alex.bennee@linaro.org; Thu, 14 May 2020 08:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZCtw-0001dy-3G
 for qemu-devel@nongnu.org; Thu, 14 May 2020 08:23:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41576
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZCtu-0003ZP-86
 for qemu-devel@nongnu.org; Thu, 14 May 2020 08:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589459024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=DzPHp2zdx+Z8HyCCS6sehHSF83vfHPYQ8ECZCHWdUcg=;
 b=V+9yyc9KXYApsBIxXGuBPf1i8J0joux2ZkfvoXUacYVMHCuPTQajhHZfjm4ibDZDw14rpm
 W3rdJB9ZwuejLZGTt92DMA7GrliHU5u4efcgZbwgvzN0y0bdSx6kMKJYTdNK+Zqt7TUJBm
 BuOgzMSF9D5YJ/q2eHF48tClS8/MGfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-4WGkB4sMNWqYGETVNS0bcw-1; Thu, 14 May 2020 08:23:42 -0400
X-MC-Unique: 4WGkB4sMNWqYGETVNS0bcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 475A28018A5;
 Thu, 14 May 2020 12:23:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-145.ams2.redhat.com
 [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8ABA60F8D;
 Thu, 14 May 2020 12:23:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F2CA19DB0; Thu, 14 May 2020 14:23:34 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] raspi2 acceptance test: add test for dwc-hsotg (dwc2) USB
 host
Date: Thu, 14 May 2020 14:23:34 +0200
Message-Id: <20200514122334.25089-8-kraxel@redhat.com>
In-Reply-To: <20200514122334.25089-1-kraxel@redhat.com>
References: <20200514122334.25089-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4WqYEieg9Meh

From: Paul Zimmerman <pauldzim@gmail.com>

Add a check for functional dwc-hsotg (dwc2) USB host emulation to
the Raspi 2 acceptance test

Reviewed-by: Philippe Mathieu-Daude <f4bug@amsat.org>
Signed-off-by: Paul Zimmerman <pauldzim@gmail.com>
Message-id: 20200512064900.28554-8-pauldzim@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index c6b06a1a138f..abb5ca3dd4ae 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -378,13 +378,18 @@ class BootLinuxConsole(Test):
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-                               serial_kernel_cmdline[uart_id])
+                               serial_kernel_cmdline[uart_id] +
+                               ' root=/dev/mmcblk0p2 rootwait ' +
+                               'dwc_otg.fiq_fsm_enable=0')
         self.vm.add_args('-kernel', kernel_path,
                          '-dtb', dtb_path,
-                         '-append', kernel_command_line)
+                         '-append', kernel_command_line,
+                         '-device', 'usb-kbd')
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
+        console_pattern = 'Product: QEMU USB Keyboard'
+        self.wait_for_console_pattern(console_pattern)
 
     def test_arm_raspi2_uart0(self):
         """
-- 
2.18.4

