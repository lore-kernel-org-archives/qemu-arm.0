Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2169851ejf;
        Mon, 26 Feb 2024 08:40:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqtXsHnl8ASD+EVCNzs2iAV2wPlbeKyaBPfj3MD7D1YjQB/FPj0a+lYmbyxoiItKuNhjzsc5Hde2r0Fxmi9FZggkhMlMXY
X-Google-Smtp-Source: AGHT+IHgyxQ3OF1rgeTUqW7+JpMJPJlJ+eIf7lcBzlGCeZ7fngZ7N5IpqbE/xSGTi7VOuF7X/yfQ
X-Received: by 2002:a0c:e28c:0:b0:68f:2a2b:c6e0 with SMTP id r12-20020a0ce28c000000b0068f2a2bc6e0mr6641210qvl.64.1708965645976;
        Mon, 26 Feb 2024 08:40:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708965645; cv=none;
        d=google.com; s=arc-20160816;
        b=lZ/7xbsxB2855ud/AAwiA4gXeRjOp44d5XNplSOwxAsEVeDU84vPbRaKIv5dFgGk9v
         2nMrhmlTXCeOBZxFfGF7kosVf9AzEi7P39LAZY/z0mn3bZNbI/ugkycuter5MLebjL7Q
         Na8xxy0OGjltpSMUCC1ASL5qQJ0ixTsURjHgUKAfUE8p/egX0XhxhwGXvVtVMfXOAa4V
         A4jwFm/9FqdhzRJ1QU8UmbnW2U2nRluiX+6IzvFrgsW+HDfcHcT/Xi+BRns3q7rYg/HV
         cBOB8DNZ4nmsNaaOIaHjLx4XhUgSKd7YwdHBOrx44Bl073KSmQ0NDkWAxQ1YOcHbDvyz
         c2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OeA7zoj/+JYyg7kFDPC8LPBeMuXP/XzZt1UdIvovbl8=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=WUvEMJyZUFfUOY6KgqtkIDMcj5f6ADx2RaT+NUnnv/WS+5PUfHKoG6QCErExsID7tg
         1qxdYhY0mfoJPGgF3YSuwLdnF8epu+QVZJssFrdhlamNOTRie9YgE1JyG1k02uZTCZDm
         RgBBuCkNNkJz8PGLAlv1qFYYdhqAofaahbztQFCE7m3U2C1anCJrM+rcFFehnotJRe5U
         lXUAytJzpk+LzvJqNcd6vpcoBTe23oD9s86ILq5L9+2MKG5783sQPJVORW9bNoG4p33Z
         JoIA/272k0xXyWBD8lAMlrfJLTkMPV0eQu3BIVHJygANCHuVSouf8fPSbivFs9N4tfT1
         5myA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OTvxIOTg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020ad45742000000b0068fdb1356b8si5405253qvx.427.2024.02.26.08.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:40:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OTvxIOTg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ree1v-0006yz-V3; Mon, 26 Feb 2024 11:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ree1s-0006qp-DK
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:40:36 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ree1m-0004iS-TJ
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:40:35 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so2678590a12.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708965629; x=1709570429; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OeA7zoj/+JYyg7kFDPC8LPBeMuXP/XzZt1UdIvovbl8=;
 b=OTvxIOTg5prjaUpNTlaMYOzuaco+4D+kyQ+O6TVMcJzsD8rvm1Xs/63tVDKDaAMqxU
 o5gsLyXJXc7RfUnZmjYHO34DnZAbYZ6VFv4iVWAEVq1LN+54ppWyoGehG1YeAMiAjq3N
 2EPKUKrQHZW04BhQN8Lg5AtCjQvCEFebti7vP218DfYNJtBRO4Ix4bld0GkRFH/39bH2
 8TSzUSOXnb6HIKH5M/fWKHCSomUv68pssJqk7aIWBEZLu0elEvvohPR63vjdQCDGOo2b
 gx8dcl7uy6xU1NvC06zXPS/sXS7nOEc2Cda6ZBf6scmk5EO0iniTrX3WIpqTH83ghOqk
 iC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708965629; x=1709570429;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OeA7zoj/+JYyg7kFDPC8LPBeMuXP/XzZt1UdIvovbl8=;
 b=qW23zoMIslRSzVEeYnLS0glqmHFV3Gs8DnT41SFfBe1JJBIYoHZ3uMoHjQqvuzfM9t
 B+DU3jOk3LUop6hOJeykr1ldPCl7BoKqK+Bgue9tFzgZNazhp0tvR3WiQvpiid66p37W
 AKP/XTwy84HxKOSNAdoyqpX4FLdgBS6mcTXy11SH2GRPj+/qtlQgFofLCxfY77f6OCA9
 dYOCOrdVRzZYz/SHXwcr/GAWm/iHne6aEgaGnbrWNam8IwfaComXVDACQznO/lKg0vuJ
 DCIKsnTBlSnpnF3LxVcNV+tiZyv/fmIyeBO4nu2YMiX0bjkaPKVz/D/EBBesAp9Hdt45
 Aopg==
X-Gm-Message-State: AOJu0Ywvvn6Z/VC4KsQA0VwDfs3fKZivIPd3dITCVL2aulpCKpJtDYKu
 qRib0WatfL+BfYsZPk4dV7JBKhu1nlvIpV7EhoQyyaxSXojsI3KpdP+8sgX43ox4YmAs3P0t8SX
 Tuau/l5hYTeyzncJ01r2DTL8fxUNEiDmpDDMlkg==
X-Received: by 2002:a05:6402:5004:b0:564:4211:faa3 with SMTP id
 p4-20020a056402500400b005644211faa3mr7358928eda.1.1708965628995; Mon, 26 Feb
 2024 08:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-31-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-31-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:40:17 +0000
Message-ID: <CAFEAcA-hXz80bMA3anadAO3fQAM=MA29CefM4yjXp4_b9R7w2Q@mail.gmail.com>
Subject: Re: [PATCH v6 30/41] Add Rpi4b boot tests
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X7fAHZWnMAEh

On Mon, 26 Feb 2024 at 00:05, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/avocado/boot_linux_console.py | 92 +++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)

I think it would be good to get the base rpi4b support upstream
now (all those parts are reviewed), and then land the ethernet
and PCI support afterwards, rather than holding up most of the
patchset while we work on the PCI/ethernet patches. That will
mean we can definitely get something at least into QEMU 9.0
(softfreeze is 12 March), will reduce the size of the patchset
a lot, and get the refactoring changes in the early patches
upstream, reducing the potential for conflicts on rebase for you.

To that end, my proposal is to take from this series
patches 1-12, 18, and 30-41, with the following minor
changes to this patch which are necessary to get it to
boot on the "no PCI" version of the machine:

--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -530,13 +530,17 @@ def test_arm_raspi4(self):
                                'dwc_otg.fiq_fsm_enable=0')
         self.vm.add_args('-kernel', kernel_path,
                          '-dtb', dtb_path,
-                         '-append', kernel_command_line,
-                         '-device', 'qemu-xhci,bus=pcie.1,id=xhci',
-                         '-device', 'usb-kbd,bus=xhci.0')
+                         '-append', kernel_command_line)
+        # When PCI is supported we can add a USB controller:
+        #                '-device', 'qemu-xhci,bus=pcie.1,id=xhci',
+        #                '-device', 'usb-kbd,bus=xhci.0',
         self.vm.launch()
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
-        console_pattern = 'Product: QEMU USB Keyboard'
+        # When USB is enabled we can look for this
+        # console_pattern = 'Product: QEMU USB Keyboard'
+        # self.wait_for_console_pattern(console_pattern)
+        console_pattern = 'Waiting for root device'
         self.wait_for_console_pattern(console_pattern)


@@ -578,9 +582,10 @@ def test_arm_raspi4_initrd(self):
                          '-dtb', dtb_path,
                          '-initrd', initrd_path,
                          '-append', kernel_command_line,
-                         '-device', 'qemu-xhci,bus=pcie.1,id=xhci',
-                         '-device', 'usb-kbd,bus=xhci.0',
                          '-no-reboot')
+        # When PCI is supported we can add a USB controller:
+        #                '-device', 'qemu-xhci,bus=pcie.1,id=xhci',
+        #                '-device', 'usb-kbd,bus=xhci.0',
         self.vm.launch()
         self.wait_for_console_pattern('Boot successful.')

I'll also tweak patch 41 to not list PCI and ethernet
as supported yet. We can then undo these changes when we land
PCI and ethernet.

thanks
-- PMM
