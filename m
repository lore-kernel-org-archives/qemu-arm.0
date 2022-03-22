Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1223202lfb;
        Mon, 21 Mar 2022 20:06:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqCX2GVSe8PdD9LJHt77r51EBk0Pq+yY1i5+eEE0ACPgqxDbO0kLw32reKBumdvfdYVBII
X-Received: by 2002:a05:620a:2682:b0:67e:1a58:c947 with SMTP id c2-20020a05620a268200b0067e1a58c947mr14305231qkp.650.1647918377274;
        Mon, 21 Mar 2022 20:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647918377; cv=none;
        d=google.com; s=arc-20160816;
        b=sSNa6hZyh+u2/zpmHtHnGJFfH12XUoM3JN8ypxmC/Gx3NeDGGKUMaZcfp4MoLndp8V
         gu540JYE27dOlQJy3GAM2ln4h6HJv7hH3VBizFrDIoKNH5bi2C0bu0tIMxktjkp5Utnt
         9GWu525q5qT9SkVCqOQEFwOZcj/nKAEd/7KicIjoxK8ICXBCR839p3fwIR1q2mzLBXQv
         5Jds+XMaDtoj6enq3wN69mG2c/KYKjTjSIVljfxzD/XaJZ7stzhflZxr+JTE5JiVmWVA
         0KNzLwFqHai+MfRo0e9qrEiCFHvoge5y4qCz46lfwHlg40GVNhAvjG8kQrUxr48979Th
         yM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=wO1Es8pKM2z2tIk86ddbDqWBfyqjVpiOKjxId5Ov7Co=;
        b=Ne3bas6BFkbIA2yXf7hBT6cV+DBw5zRkSfnHy91AdpoFaq/zT/r6dizqS52OCkcIRz
         z2RjEbTa13xhlXPa+yXaMrZK25A9yyD+xQoEPtdgQ9xb3OaiIU+HScZxTMrlaNe8h2xG
         j8LVqq1gZSRbZ+xKD5+ri0pAAeUtmG7YiEmgGaDvFI4DnreULcphuHwmbuabx0m3KkC0
         ifeVRhoBT8SuKCpP761LUD/rxQoBNwyDY4pJ6OXZ8VxgLXypAhnXs30sxYKTCP5+qeDy
         V3xlB6XjsWaVtD/TRGAq+MB3ZkdZemy1vdi9Zv+08yKVcc7c4zaEMTdKGKKPzGZCcHRP
         HG0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v128-20020a379386000000b0067e4be23970si2330314qkd.437.2022.03.21.20.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Mar 2022 20:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWUqe-000382-Qj
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 23:06:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUq0-00037l-Qi; Mon, 21 Mar 2022 23:05:36 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:57808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUpy-0005QH-7L; Mon, 21 Mar 2022 23:05:36 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2shuT079375;
 Tue, 22 Mar 2022 10:54:43 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Mar
 2022 11:05:11 +0800
Date: Tue, 22 Mar 2022 11:04:57 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 1/1] test/avocado/machine_aspeed.py: Add ast1030 test
 case
Message-ID: <20220322030455.GA4273@aspeedtech.com>
References: <20220321091646.17234-1-jamin_lin@aspeedtech.com>
 <20220321091646.17234-2-jamin_lin@aspeedtech.com>
 <1f14533c-1163-f3c0-72ee-b79eba79480c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1f14533c-1163-f3c0-72ee-b79eba79480c@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2shuT079375
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R1MIYcRlwu7N

The 03/21/2022 17:39, Thomas Huth wrote:
> On 21/03/2022 10.16, Jamin Lin wrote:
> > Add test case to test "ast1030-evb" machine with zephyr os
> > 
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >   tests/avocado/machine_aspeed.py | 36 +++++++++++++++++++++++++++++++++
> >   1 file changed, 36 insertions(+)
> >   create mode 100644 tests/avocado/machine_aspeed.py
> > 
> > diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> > new file mode 100644
> > index 0000000000..33090af199
> > --- /dev/null
> > +++ b/tests/avocado/machine_aspeed.py
> > @@ -0,0 +1,36 @@
> > +# Functional test that boots the ASPEED SoCs with firmware
> > +#
> > +# Copyright (C) 2022 ASPEED Technology Inc
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2 or
> > +# later.  See the COPYING file in the top-level directory.
> > +
> > +from avocado_qemu import QemuSystemTest
> > +from avocado_qemu import wait_for_console_pattern
> > +from avocado_qemu import exec_command_and_wait_for_pattern
> > +from avocado.utils import archive
> > +
> > +
> > +class AST1030Machine(QemuSystemTest):
> > +    """Boots the zephyr os and checks that the console is operational"""
> > +
> > +    timeout = 10
> > +
> > +    def test_ast1030_zephyros(self):
> > +        """
> > +        :avocado: tags=arch:arm
> > +        :avocado: tags=machine:ast1030-evb
> > +        """
> > +        tar_url = ('https://github.com/AspeedTech-BMC'
> > +                   '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip')
> > +        tar_hash = '4c6a8ce3a8ba76ef1a65dae419ae3409343c4b20'
> > +        tar_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
> > +        archive.extract(tar_path, self.workdir)
> > +        kernel_file = self.workdir + "/ast1030-evb-demo/zephyr.elf"
> > +        self.vm.set_console()
> > +        self.vm.add_args('-kernel', kernel_file,
> > +                         '-nographic')
> > +        self.vm.launch()
> > +        wait_for_console_pattern(self, "Booting Zephyr OS")
> > +        exec_command_and_wait_for_pattern(self, "help",
> > +                                          "Available commands")
> Looks like this belongs to a new machine type that we do not have in QEMU 
> yet? ... in that case, please send it along in a threaded patch series where 
> you add the new machine type, otherwise it does not make much sense to see 
> this as a single patch on the list.
> 
>   Thomas
>
I created a new series patch to support AST1030 model which included
this patch for avocado test.
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=291430
Thanks-Jamin
