Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp824322njk;
        Wed, 17 Jul 2024 06:52:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/ypY/TyG2wbQSwHkGxc+Jgr7TQfgWX/ru9+bhVSedGhGz4W8Obbea7nOwZnbO0A/U0qvmhg0WTyRWjoCPhOZyLEiRVMiV
X-Google-Smtp-Source: AGHT+IHcbtscnQ6wye79RWwVCMl7cd59+I8f6b8+CII1FHSpz8juopNPkQJkHYMbx6yciXRQp9Ov
X-Received: by 2002:a05:620a:1a0e:b0:79f:181e:3c58 with SMTP id af79cd13be357-7a18749e51amr202225885a.42.1721224345747;
        Wed, 17 Jul 2024 06:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721224345; cv=none;
        d=google.com; s=arc-20160816;
        b=R+ndGA3ynfxdWnZcX4XF5QxGO7RL6VPOTnruBom5yVftBujU6DjtX7YG+436VAF25t
         onywOU2K26M0NvpNv5lmdihPahA+ada3JoH0d8O/lgZBPzv1x6iMNrXz03lyEO6wVTn0
         h4aqp+oyPiBLXirSx7DAfYZW3+pvccNriDAmrJbkg5vwnGwihWK2SQQbaXEvZwFIbiUg
         4+TdikMQcakSfoVc81LNswDOWDgAl8FkzPon0Dr4ScU20aCoBVgxlhFrCMitJkLC36XA
         nZylxkWUrA2F0GdIuf+wMgMHovu7b6vxjpl8p8+dSVwpsin3/48Y7dVdpWy+5+Ph0Hm0
         kjag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=o3prwc8i8KjPKTzImRLqp5LTDSxC5nsQLP1EJDs9kRI=;
        fh=24BkGl0iP6hyZaX12CqS2QV+ri2bc/FA2GTmbLfZouA=;
        b=hCTp8EPrmW0wIxuX1a3MtTuMNnmy5WMRbtOiE882P2nZVbf9CO6R89iXpsJprDu8e6
         4mzUcfL+NLE/aPPbYLJaV0nvNobLwOYC0sS/m4AfnKA5+sPBaKJKpB39UdajzalDUYUM
         uf9ass47tTIfDwz9pWsIxHwfdpPNWlwRy3gHHbS6SP6ZTI6o6ycGDN8kw8Jm964RYQk9
         ZHRm1/IDmiDLKPLUioSGcwcCKbFOKm7hab4syCEddsiPRucQnzAn2eLnbxE5AY+Rvs2i
         Q+agtxjtqlM864lW/lzpRIerIGfmlaBLThojKM8oZrN/AAXFFmZ8NbJw6ONZMqq6nepV
         aLXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4vvT7ll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160bab124si978503285a.161.2024.07.17.06.52.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 06:52:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l4vvT7ll;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sU54v-0001hc-9j; Wed, 17 Jul 2024 09:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU54o-0001EG-3o
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 09:52:15 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU54m-0004Xl-5P
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 09:52:13 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2eefc3d707dso9111791fa.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2024 06:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721224330; x=1721829130; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o3prwc8i8KjPKTzImRLqp5LTDSxC5nsQLP1EJDs9kRI=;
 b=l4vvT7lleG48pbyvbKnFBNA+iEbeMY2bbZkceLTsHr2okB5S/UD0f9QH/WqXAUl8sM
 UleZpnHZU2WsjAIKU53ZccY5XD0U4804KQOPb6ioj2nMog56Vk4DL5B6bB1TwIqZkA39
 9lVjEUKyUl48s0a3nG5S2f3BXhydsx/iT/7jTnuXnKVK/t7WYCgqp7sParUMSoCJm256
 BQfxkXM+TXsjiC3wGuiKIuF0nRoT+BzauQd7TbNghSKNd3FNfGfCcQBfdpO/frCJHpKd
 T1+rSJoPLGC7JHAyoCoCRLyHwhrA2ookQpviuMcT/M4cTSsB8pnhUq/1ztaIXY13j4fc
 ycRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721224330; x=1721829130;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o3prwc8i8KjPKTzImRLqp5LTDSxC5nsQLP1EJDs9kRI=;
 b=d2u+ZK9Cr/OIZC9cpR2H71PjZBdc22P+mjsJnFc/ZVKgnPO/btYOqzVecNR+/LYpeG
 qpoOu2PsdLfXjko4GWpPeMLPoFhGYbehwWytV49BcmqlngOt4kdCKtdW+8iTjNxzsI2A
 popy2G6MRALBsTif27QC10UL11DK+72+8oZCDJTbMEZUSxMW30bWiz5MnQBPPgKAZopi
 jR3fQkb266JiAdQR3y6lDtc/pLffzwwbw/U+kAKkO7ZKU77qMIU3cm/goMz9giilzA20
 WFe8PKpxF0DABa2TY4q5L1qI0VmLENzyMay+LXeX9feFg7e5nGTbPu67ML3WgrkUxzJV
 R56w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8LSmCM2A9xvDsUZPPI+GstBnlIPcmLx4YqPtvgF3MTmwLEG7dNROfl9IohtV8qQTSKOiBsAipXLPCh4pTZmlKaMcl
X-Gm-Message-State: AOJu0YwJWAm1En17QKlyDHwUd7A4SBjSXBzP6YrwdKjnzfEzufZpt48+
 M0oUt96q2n4NCqIVwvBxk6VflhzKQOYDPk0QGfpdzKvZf5TpNapYrhWfObWy0UQ=
X-Received: by 2002:a2e:a4b7:0:b0:2ee:8407:2f58 with SMTP id
 38308e7fff4ca-2eefd09f9c9mr11735041fa.17.1721224329461; 
 Wed, 17 Jul 2024 06:52:09 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5edb41asm170699155e9.36.2024.07.17.06.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 06:52:09 -0700 (PDT)
Message-ID: <55050833-24d4-47d1-af16-5033ff8ad4aa@linaro.org>
Date: Wed, 17 Jul 2024 15:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Add eMMC boot tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240717130657.648701-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717130657.648701-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6A3Qb9fwQDja

On 17/7/24 15:06, Cédric Le Goater wrote:
> The image was built using the process described in commit c8cb19876d3e
> ("hw/sd/sdcard: Support boot area in emmc image") with artefacts from
> the latest successful build of the IBM P10 BMC platform available on:
> 
>    https://jenkins.openbmc.org/job/ci-openbmc/distro=ubuntu,label=docker-builder,target=p10bmc/lastSuccessfulBuild/
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---

BTW this patch is

Based-on: <20240717063022.549849-1-clg@redhat.com>

>   tests/avocado/machine_aspeed.py | 38 +++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index f66ad38d3503..1deb8472818f 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -439,3 +439,41 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
>           self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
>           self.ssh_connect('root', '0penBmc', False)
>   
> +class AST2x00MachineMMC(QemuSystemTest):
> +
> +    timeout = 240
> +
> +    def wait_for_console_pattern(self, success_message, vm=None):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message='Kernel panic - not syncing',
> +                                 vm=vm)
> +
> +    def test_arm_aspeed_emmc_boot(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:rainier-bmc
> +        """
> +
> +        image_url = ('https://fileserver.linaro.org/s/B6pJTwWEkzSDi36/download/'
> +                     'mmc-p10bmc-20240617.qcow2')
> +        image_hash = ('d523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd90b')
> +        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
> +                                      algorithm='sha256')
> +
> +        self.require_netdev('user')
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-drive',
> +                         'file=' + image_path + ',if=sd,id=sd2,index=2',
> +                         '-net', 'nic', '-net', 'user')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern('U-Boot SPL 2019.04')
> +        self.wait_for_console_pattern('Trying to boot from MMC1')
> +        self.wait_for_console_pattern('U-Boot 2019.04')
> +        self.wait_for_console_pattern('eMMC 2nd Boot')
> +        self.wait_for_console_pattern('## Loading kernel from FIT Image')
> +        self.wait_for_console_pattern('Starting kernel ...')
> +        self.wait_for_console_pattern('Booting Linux on physical CPU 0xf00')
> +        self.wait_for_console_pattern('mmcblk0: p1 p2 p3 p4 p5 p6 p7')
> +        self.wait_for_console_pattern('IBM eBMC (OpenBMC for IBM Enterprise')

