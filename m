Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2400624lfm;
        Fri, 17 Jul 2020 05:34:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG0xC/lAqXiziWJZPQr9mgy6JxPR22A1+QhxNwPQL26Q+1eDMNgPfyENrTxUImXM5PQtqU
X-Received: by 2002:a25:9302:: with SMTP id f2mr13839406ybo.238.1594989266137;
        Fri, 17 Jul 2020 05:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594989266; cv=none;
        d=google.com; s=arc-20160816;
        b=OCsZtzEx/ISFp1TSpE5pECg5EsQglUDQDvE0YZ5/x8EPjby+5Qyn7DvQkbQzj9Y2lo
         W5fpDwjSzOOqo7spdRmSlpRPDPMOkOPi5knEwfY13AGfK2eousFdKbsaF4YI/++VCKR1
         2H+f0lG5WijukuPS/7/gtv8l337lfgKurn13VRYPo/rPVj3DSRycou4EUf1SuTkXg+00
         nvIqN7jqw5k5fSZrhBsakfBKpWBoJLy83Ir18dxEX/gr2OssNdMegXIGd3E5ChY67CLq
         UIwAFFAj04NOPGcu2hr8YJh38hBHOPhOsVViTSGc7XR52Vt33hnfj9UtmWRgPrnTCpKz
         djqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=bxnjS7CpL/1cFMTmVEL4OgWAPVCkcG/vEdZJlgUAl7Q=;
        b=yZBFxUqUZu7xlyID8gMkQnd7WqS1aC3ClXHW5K+H8cxV2Aa+0NYFx1VPtO00AzdL8k
         Ok2p56e/QhjEqAdO2/rzISzJ+YAnCXSCeJrc/CptlWWUU8z9P5+7jAkuTzdjzaxOAHB/
         lvZjoXGREKFsLiIHefcufnSkGmf6hz5/9o8IxlWb7gymhiabPAdf8chpWwz0F6nx0YQv
         rmkyLPj1LvJT/a82t3WFYNPb9dXcSpCdsw7/WBxz0cBzkzNfoOdu3MGoRVPjFI8IJNH8
         N4/9wX0pT7IamFD4/lxHvatqYoETFMaNRlKUf4KudWbpnszByomxjVE9ztZRfaP7JdQ1
         KQcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si9441094ybj.55.2020.07.17.05.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 05:34:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwPZJ-0005v5-F2
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 08:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jwPYq-0005dL-6H
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 08:33:56 -0400
Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58]:52048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jwPYn-0003kp-9Y
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 08:33:55 -0400
Received: from player158.ha.ovh.net (unknown [10.110.171.215])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id C6C1A25D70F
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2020 14:33:49 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id 7DB2E146A94D4;
 Fri, 17 Jul 2020 12:33:37 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003a2901222-9bce-455c-ac92-4ccef942abda,EDCDB8C856EF0F0B0CA5B21EBB7B009702C7510A)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v6 13/13] tests/acceptance: console boot tests for
 quanta-gsj
To: Havard Skinnemoen <hskinnemoen@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200717060258.1602319-1-hskinnemoen@google.com>
 <20200717060258.1602319-14-hskinnemoen@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f098aa02-28cd-f86b-1641-5e164ba5ca7f@kaod.org>
Date: Fri, 17 Jul 2020 14:33:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200717060258.1602319-14-hskinnemoen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11145564655394261777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrfeeigdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieehjeelfedugeelgeduudfhueeuveetfeevkeduuedvleeiuedvfeetledugedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.178.58; envelope-from=clg@kaod.org;
 helo=17.mo3.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/17 08:20:31
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 kfting@nuvoton.com, Avi.Fishman@nuvoton.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dhlErSUKjIra

On 7/17/20 8:02 AM, Havard Skinnemoen wrote:
> This adds two acceptance tests for the quanta-gsj machine.
> 
> One test downloads a lightly patched openbmc flash image from github and
> verifies that it boots all the way to the login prompt.
> 
> The other test downloads a kernel, initrd and dtb built from the same
> openbmc source and verifies that the kernel detects all CPUs and boots
> to the point where it can't find the root filesystem (because we have no
> flash image in this case).
> 
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>

It looks good but I am not sure it's a good idea to have tests 
point to URLs like : 

https://github.com/hskinnemoen/openbmc/releases/download/20200711-gsj-qemu-0/obmc-phosphor-initramfs-gsj.cpio.xz

Philippe, Peter, is that OK ? 


If so, Joel, Andrew, could we host FW images on the OpenBMC github ? 
and do the same for Aspeed.

Thanks,

C. 

> ---
>  tests/acceptance/boot_linux_console.py | 65 ++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 73cc69c499..1d82fc7ff8 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -569,6 +569,71 @@ class BootLinuxConsole(LinuxKernelTest):
>                                                  'sda')
>          # cubieboard's reboot is not functioning; omit reboot test.
>  
> +    def test_arm_quanta_gsj(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:quanta-gsj
> +        """
> +        # 25 MiB compressed, 32 MiB uncompressed.
> +        image_url = (
> +                'https://github.com/hskinnemoen/openbmc/releases/download/'
> +                '20200711-gsj-qemu-0/obmc-phosphor-image-gsj.static.mtd.gz')
> +        image_hash = '14895e634923345cb5c8776037ff7876df96f6b1'
> +        image_path_gz = self.fetch_asset(image_url, asset_hash=image_hash)
> +        image_name = os.path.splitext(os.path.basename(image_path_gz))[0]
> +        image_path = os.path.join(self.workdir, image_name)
> +        archive.gzip_uncompress(image_path_gz, image_path)
> +
> +        self.vm.set_console()
> +        drive_args = 'file=' + image_path + ',if=mtd,bus=0,unit=0'
> +        self.vm.add_args('-drive', drive_args)
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern('> BootBlock by Nuvoton')
> +        self.wait_for_console_pattern('>Device: Poleg BMC NPCM730')
> +        self.wait_for_console_pattern('>Skip DDR init.')
> +        self.wait_for_console_pattern('U-Boot ')
> +        self.wait_for_console_pattern('Booting Linux on physical CPU 0x0')
> +        self.wait_for_console_pattern('CPU1: thread -1, cpu 1, socket 0')
> +        self.wait_for_console_pattern('OpenBMC Project Reference Distro')
> +        self.wait_for_console_pattern('gsj login:')
> +
> +    def test_arm_quanta_gsj_initrd(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:quanta-gsj
> +        """
> +        initrd_url = (
> +                'https://github.com/hskinnemoen/openbmc/releases/download/'
> +                '20200711-gsj-qemu-0/obmc-phosphor-initramfs-gsj.cpio.xz')
> +        initrd_hash = '98fefe5d7e56727b1eb17d5c00311b1b5c945300'
> +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> +        kernel_url = (
> +                'https://github.com/hskinnemoen/openbmc/releases/download/'
> +                '20200711-gsj-qemu-0/uImage-gsj.bin')
> +        kernel_hash = 'fa67b2f141d56d39b3c54305c0e8a899c99eb2c7'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +        dtb_url = (
> +                'https://github.com/hskinnemoen/openbmc/releases/download/'
> +                '20200711-gsj-qemu-0/nuvoton-npcm730-gsj.dtb')
> +        dtb_hash = '18315f7006d7b688d8312d5c727eecd819aa36a4'
> +        dtb_path = self.fetch_asset(dtb_url, asset_hash=dtb_hash)
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyS0,115200n8 '
> +                               'earlycon=uart8250,mmio32,0xf0001000')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-dtb', dtb_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern('Booting Linux on physical CPU 0x0')
> +        self.wait_for_console_pattern('CPU1: thread -1, cpu 1, socket 0')
> +        self.wait_for_console_pattern(
> +                'Give root password for system maintenance')
> +
>      def test_arm_orangepi(self):
>          """
>          :avocado: tags=arch:arm
> 

