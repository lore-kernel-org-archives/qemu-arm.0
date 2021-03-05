Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp678592lfg;
        Fri, 5 Mar 2021 12:49:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydphCdEKrJ5YHjlHJBC5gfGoFmsELpLzC5rFS8sFNEThv8BIYLTsWbVLuRr9qdYW50KySm
X-Received: by 2002:a02:9042:: with SMTP id y2mr11890481jaf.94.1614977377416;
        Fri, 05 Mar 2021 12:49:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614977377; cv=none;
        d=google.com; s=arc-20160816;
        b=L0D2bzPmlseL/EmrMgzGvMFpvhhxzfvH8lCH9VjtTQ4mOgMEreirO8iGi0CF+1Xnl/
         VQoMmcNRDbHPSItXOuXZ8W56G94eHOB5RA/aH+vwjsZjTxFZwrPsNdOguU1PueZXwgMg
         ombqjqCeO+rrwtTRVcK9lueUqjni4BDE7vEVmTmvuC3PZYpEii76clHdZu78LNitHFSK
         5C2s2JsUTPMVeVI2Sv1f6h+ZXkqensQwP7Ot6IIy4nsohhwpelK60FxlM5NhGrF5Obeq
         FHZwJFf3S5+dnuyg/CGHWYMAGSoAL6i4ORSQti5xFGJpURzGpZyNZSdS4rk5dj+rBIGy
         f1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ln6FVFENwJzOW8sfJeAn5TYTwUJKP6rmMRmKBU9wElM=;
        b=T3geMsXXky25drgl9Emd3nhBxkNZ2k1i/rbsbV3ssx719PTv/vhvaNnUz76jtu9YeW
         +ogKfYORIkb8PmXsqRB0yQQb7DH1/Yf7oiJjtjV5MkHRWiB4NVmrz1dIgoQwaKxtHaet
         QixCm0oAmdRErvIH72Th3Ra5RfGyObpbGaNJmqW046quCa408Fzux+FPQ4ckEFQJDfB+
         QtSTJgbc9/2BP/m78uy+vNg8tUko9DWtFRWvbFTU5jZbOKLCtNPMHNHXsyE/9b538dqw
         VjICFuFsUkg3wKf4AbkegOco+34TRtBjE/Y4WZnWOppoEq8ORSEdyzLwKOJEr5NnXb/Q
         Gj5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zk1OMKbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si2986805ilv.25.2021.03.05.12.49.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 12:49:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zk1OMKbY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lIHOC-0006io-Lg
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 15:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lIHNv-0006gl-Sb
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 15:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lIHNu-0000r2-4J
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 15:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614977355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ln6FVFENwJzOW8sfJeAn5TYTwUJKP6rmMRmKBU9wElM=;
 b=Zk1OMKbYEMaD6fJEYEmzDxXQOn0rlkAMLsB0suggK3GPA0YY9ZrzN8Sm8lH13lpwedEBGu
 IIh5Hqm2JxTt+fl6O43SYNYKGoU3Jhwo3K3/1mnKxVs5JGqejGes4lldmawqJxSf1YrlPV
 7SD2uHuMFqn/aUegFT+oAAUHKfqZRpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-2cJh-h-pMZqbxRrvoM54_g-1; Fri, 05 Mar 2021 15:49:12 -0500
X-MC-Unique: 2cJh-h-pMZqbxRrvoM54_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9D76881276;
 Fri,  5 Mar 2021 20:49:10 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53D835D9C0;
 Fri,  5 Mar 2021 20:49:04 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] tests/acceptance: Test ast2400 and ast2500 machines
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210304123951.163411-1-joel@jms.id.au>
 <20210304123951.163411-2-joel@jms.id.au>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <340b24ff-006b-3934-c0ef-31be3b7057d7@redhat.com>
Date: Fri, 5 Mar 2021 17:49:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304123951.163411-2-joel@jms.id.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-TUID: viGCbuU3UIjw

Hi,

On 3/4/21 9:39 AM, Joel Stanley wrote:
> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> from ASPEED, by booting Palmetto and Romulus BMC machines.
>
> The images are fetched from OpenBMC's release directory on github.
>
> Co-developed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Tested-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   tests/acceptance/boot_linux_console.py | 46 ++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index eb012867997f..2f46a08fdc10 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -1048,6 +1048,52 @@ def test_arm_vexpressa9(self):
>           self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
>           self.do_test_advcal_2018('16', tar_hash, 'winter.zImage')
>   
> +    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:palmetto-bmc
> +        """
> +
> +        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
> +                     'obmc-phosphor-image-palmetto.static.mtd')
> +        image_hash = ('3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d')
> +        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
> +                                      algorithm='sha256')
> +
> +        self.do_test_arm_aspeed(image_path)
> +
> +    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:romulus-bmc
> +        """
> +
> +        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
> +                     'obmc-phosphor-image-romulus.static.mtd')
> +        image_hash = ('820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
> +        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
> +                                      algorithm='sha256')
> +
> +        self.do_test_arm_aspeed(image_path)
> +
> +    def do_test_arm_aspeed(self, image):
> +        self.vm.set_console()
> +        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> +                         '-net', 'nic')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern("U-Boot 2016.07")
> +        self.wait_for_console_pattern("## Loading kernel from FIT Image at 20080000")
> +        self.wait_for_console_pattern("Starting kernel ...")
> +        self.wait_for_console_pattern("Booting Linux on physical CPU 0x0")
> +        self.wait_for_console_pattern(
> +                "aspeed-smc 1e620000.spi: read control register: 203b0641")
> +        self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
> +        self.wait_for_console_pattern("systemd[1]: Set hostname to")
> +        # This often takes longer than the 90s timeout
> +        # self.wait_for_console_pattern("login:")
Maybe remove those commented lines?
> +        self.vm.shutdown()

Not needed explicit shutdown as I said on patch 02.

- Wainer

> +
>       def test_m68k_mcf5208evb(self):
>           """
>           :avocado: tags=arch:m68k

