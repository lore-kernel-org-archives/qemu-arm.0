Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp677305lfg;
        Fri, 5 Mar 2021 12:47:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztDS48oIqc0WSzK8LNE3lcLN2YM2oy/R2fPYAab2su4MfgbBLeUwq2Fzxne4em+D2dNH9l
X-Received: by 2002:a92:da48:: with SMTP id p8mr9919323ilq.137.1614977243261;
        Fri, 05 Mar 2021 12:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614977243; cv=none;
        d=google.com; s=arc-20160816;
        b=SI+g4OmmyhQSLjuQSOuNINN6jHrgwPDHw4pnpsHcAToUsjjU5d8U3uHMMNBmOqphPi
         O3aKNuzZqLQXhEwZqGbI7j9pk+tQitHjYVnEUXIiSprTmociHlFpZv5uL/NOviymqQsB
         V93IOgqnNRcP2qgzp5nNQBGH84cEvwzL2w15AODJU+Gbnuu8QIFLNdC1NuTtLhpmHP/D
         dx7DECwpVRPO53mZPbfeO9+sk1WSU/U/N2Z7a1R4oT91MtXQN6ObHrYBTSlHsLqV2Fzs
         C1CrnESg0Csy7i9JpYLGhYDeyHPWl/KWkOXa6lrnKxcRca+e08QnhGZEFdKkWlTTKkHC
         B0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YECGE5Lebm4zpMSyfng9b8VBW2OWVrqQywZFajAxnOY=;
        b=UhPAvdDbqNfR6+a86ivUMEiilGSji6qsv3l6KBNs3zoEevChEciAL6G6zknk7CP3SL
         tj2nejzObWe5YGZVAwv41gEun0Qi/2FrcT/OjpLAfxdBsuPgZRzmE41uhDhl05tm5adA
         4n0NCqgEan/B7yO23NEXOjzYwXKepziOTaUEDeh/MLo8MH8b/285K3rBBY7ydSZBOT6A
         J756l1G7Gsq9ka/FR6qsmoz5QDTs7PkZZIBfYzGAhVlcB2p6t92PmEcQTMDO63kvgFzN
         benNCN2VuA4+/Ta/vdIwKa52OJS67c1z3BHfoEQz2ldKyE67GHQ96sTVXPMwcdS9L2NA
         EZVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FpXn1oSM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16si3128709jas.15.2021.03.05.12.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 12:47:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FpXn1oSM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lIHM2-00061P-Jd
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 15:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lIHLj-000609-Bu
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 15:47:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lIHLW-0000Dk-DW
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 15:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614977208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YECGE5Lebm4zpMSyfng9b8VBW2OWVrqQywZFajAxnOY=;
 b=FpXn1oSMzUXAkCEsIthNBxAVNz9ymSfSFSwmWnB1DAxPQfMPt2yl1z/ZHwpUJzD2i536Cx
 HwIB/5EsT+GGovu4sRADeMnkPK9av39J2CyjlqKkhEWhcG6fZ1RB+6Qahh4eqhArCdlFkm
 nJTPFVDUfoI1I11/SQFuUQ/PKEc9hD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-pzbFHg3pPuit_JkqL_hWtw-1; Fri, 05 Mar 2021 15:46:46 -0500
X-MC-Unique: pzbFHg3pPuit_JkqL_hWtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BFC2DF8A4;
 Fri,  5 Mar 2021 20:46:44 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15AE519D7C;
 Fri,  5 Mar 2021 20:46:39 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] tests/acceptance: Test ast2600 machine
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210304123951.163411-1-joel@jms.id.au>
 <20210304123951.163411-3-joel@jms.id.au>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <5e6691b6-1cdc-8d66-25e7-4df1be63be46@redhat.com>
Date: Fri, 5 Mar 2021 17:46:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304123951.163411-3-joel@jms.id.au>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yIZ7l0lgSwKv

Hi,

On 3/4/21 9:39 AM, Joel Stanley wrote:
> This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
> Tacoma BMC machine.
>
> There is no root file system so the test terminates when boot reaches
> the stage where it attempts and fails to mount something.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2: Update expected strings so test passes
> ---
>   tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 2f46a08fdc10..4f1df69bc75c 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -1094,6 +1094,32 @@ def do_test_arm_aspeed(self, image):
>           # self.wait_for_console_pattern("login:")
>           self.vm.shutdown()
>   
> +    def test_arm_ast2600_debian(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:tacoma-bmc
> +        """
> +        deb_url = ('http://snapshot.debian.org/archive/debian/'
> +                   '20210302T203551Z/'
> +                   'pool/main/l/linux/'
> +                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
> +        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
> +        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
> +                                    algorithm='sha256')
> +        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
> +        dtb_path = self.extract_from_deb(deb_path,
> +                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-net', 'nic')
> +        self.vm.launch()
> +        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00")
> +        self.wait_for_console_pattern("SMP: Total of 2 processors activated")

Above check isn't reliable. Here the VM started with smp 1, therefore 
the test failed as:

FAIL: Failure message found in console: Kernel panic - not syncing

> +        self.wait_for_console_pattern("No filesystem could mount root")
> +        self.vm.shutdown()

You don't need to shutdown the VM as the test's tearDown() does that for 
you.

Thanks!

- Wainer

> +
>       def test_m68k_mcf5208evb(self):
>           """
>           :avocado: tags=arch:m68k

