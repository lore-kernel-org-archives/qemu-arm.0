Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5143810lfg;
        Tue, 2 Mar 2021 23:44:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynFDF/bCFyThcfVfIO5itzR4YKAtforUboJIz6u5UtuOCzGzBb4U0jy17IQWES/2m+6RJX
X-Received: by 2002:a25:67d6:: with SMTP id b205mr33831181ybc.394.1614757474627;
        Tue, 02 Mar 2021 23:44:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614757474; cv=none;
        d=google.com; s=arc-20160816;
        b=yrV5iJlsuwiZxV3MAm2du+Vk6EWYOTfTiycNkUqmf+9nQqMfyKDSv/N9rjnrXGjVJp
         ZPVaZy7ENAngd5HPQqnTA1juVP0VywHX4NIUoAb7jR5jkJayHpZwGXKYfQzJjBI7nb6J
         VfBuT6vkbemObB3KSVmDF/q3HsfoHKgKLdAQQfhWv1Idg5zCwjz7ZZkSlGg1Rj+pTAAy
         PU8fY5IboAJ1MpQGz8V3HBRYbHiC5Fiy/h+aGm8AtQrdqLcBzViHagQesKXOi5bcQw00
         3ueQib54+CRSo7OeEe52LDvV+rjBvkP3uYSm5GL2DffRsS+RBRFzREJuM0zoXSazFS4J
         yK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=/thsf2m8kzsudj+kEPGKymkcYPtbahIoKlYHdg1mNPY=;
        b=al6359sVKGTz2yJxNUOscfdPg5p3vajXnEq89iY+70xft/f2tSjFkwxn+LPtrW1Oji
         D6k3Sn5LHrQpRXJptPhHKfYCTjVfTaC7vz+9/3a9WMXMQKA0XItM3vaM1wzcFZLDIqnE
         PWcT0k8Vjq97Rfy1QoH78BCdkSaQk7hpkmca7wZ+kHIPQV7jTRyTeB7qGW62LPSt/V4L
         MIuru2CNZzmy3babarDfQrK1/9g7wqIBkgoq+Qc5rHrCHw1kt0/n5PZZzp4Iooys52Z+
         ijfcvn3rc21gq075oFfMIkM9qA0jQv9w+dHhPXr1ySvM6YoIOsbtLfYrodPnr3gA4kmD
         vtog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f81si22245432yba.148.2021.03.02.23.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 23:44:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHMBN-0007oT-Vd
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 02:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHMBA-0007n0-7o; Wed, 03 Mar 2021 02:44:20 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:49257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHMB8-0003kX-6d; Wed, 03 Mar 2021 02:44:19 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 170158C810FB;
 Wed,  3 Mar 2021 08:44:16 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Mar 2021
 08:44:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003aca21b35-0a83-4473-9e4e-d2434cba8515,
 24CAEE7A76C7E725A9866EAA9907F8E378F99BC5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 1/2] tests/acceptance: Test ast2400 and ast2500 machines
To: Joel Stanley <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>
References: <20210303012217.637737-1-joel@jms.id.au>
 <20210303012217.637737-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bc8b807c-1f48-6013-a13d-c32abe06692d@kaod.org>
Date: Wed, 3 Mar 2021 08:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210303012217.637737-2-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6592f083-21ab-492f-b198-ffc0801ee721
X-Ovh-Tracer-Id: 4489807353640553324
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtuddguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehuedtheeghfdvhedtueelteegvdefueektdefiefhffffieduuddtudfhgfevtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: eXnkddC0apRF

On 3/3/21 2:22 AM, Joel Stanley wrote:
> Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
> from ASPEED, by booting Palmetto and Romulus BMC machines.
> 
> The images are fetched from OpenBMC's release directory on github.
> 
> Co-developed-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 


> ---
>  tests/acceptance/boot_linux_console.py | 46 ++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index eb012867997f..2f46a08fdc10 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -1048,6 +1048,52 @@ def test_arm_vexpressa9(self):
>          self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
>          self.do_test_advcal_2018('16', tar_hash, 'winter.zImage')
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
> +        self.vm.shutdown()
> +
>      def test_m68k_mcf5208evb(self):
>          """
>          :avocado: tags=arch:m68k
> 

