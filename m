Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6107CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 06:39:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6NpM-000861-M3; Wed, 08 Oct 2025 02:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v6NpL-00085j-0H
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 02:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v6NpJ-0004hN-2h
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 02:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759905543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BhMGqgOnwEYmufh/YfgQunVPx9XbXJxuca30AxtR28U=;
 b=LFcgn3sMr3FlyLXTKzZRDtMKNYeewI8LjzPRW+IAbvyzIeaEu/sbY8LRP2K43nb1ua1yOF
 GT3dmQfqv0JzVD9xvSAC90cFAFNsZdzxHm3govkg1wZIgqNVTvKpTIlH/2lB9lhP9oVOz1
 hN7yOzfM2wK+RaAaeFVeNLi344WToWs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-q8Gz2Tk2NBCWbRb4_o0sUg-1; Wed, 08 Oct 2025 02:39:00 -0400
X-MC-Unique: q8Gz2Tk2NBCWbRb4_o0sUg-1
X-Mimecast-MFC-AGG-ID: q8Gz2Tk2NBCWbRb4_o0sUg_1759905539
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3f93db57449so3643650f8f.2
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 23:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759905539; x=1760510339;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BhMGqgOnwEYmufh/YfgQunVPx9XbXJxuca30AxtR28U=;
 b=L2f34cZRQZKX69a5gTB5m/IjIC6d8GlZLStgmOCRugZg5sJqN2zg33R2ZMXSD1Fjak
 C29yaAFdbRJwPdmN4l0ha/7DFtfMje1mxx9V8sRUKbomxKoMDjByB0Oq1mTaqlpSLS86
 eF8cI9rOrxZ3a12cLaFThMtZep5iDp9gcqhiHIqaCDW2y7hcM+PRCriZCsJtAssnkaGc
 Vs0GcKElKi/0KV0BDeuAmAAXCd1s5dxVEJMRW8FoBgTp/DTdSGIA48milP7r57wG38do
 repcFEp7bemBS58TWdHR+2v8uYufVI0dyvsioqfwNLYJBQ30YIMvku9FYGDOwlOTTWav
 pSnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK6tjmL5v400k8jHZHu5wYOQaXXo4MeM0RmsRzjlhlMNTH9RP4y5H4aZibd/OZPxT/JK6NFn0qjQ==@nongnu.org
X-Gm-Message-State: AOJu0YwiQwkaT0DOAh8HXcGv6OHOAIzwVp6LAQvFpxeNcpzPiYZje+Lz
 5WBMJlrMZt9i+MNar+J1mkTQuR1VB5/Zi/eWYHRykc6n/gFXB5RPl1BkDfu+8BY/82MLaEy7n6m
 W41CeMYEF9eCaHzYTpa9ky8uWbjL1CYxXLw1QQFeODMva+okXTKUc+w==
X-Gm-Gg: ASbGnctXEaL1U0boYXxML3u4bZS29JVbRq6eTpvsCL141EkGwXF6zGasgF+eraotJWB
 fIhSDAv7DrZuG+LhoQ8rjNdXERLZHi7Tm5fSy4yP7Tr86Pro7Cez6Nv621CxgtDhNR0o+CS2+nR
 XiBIDvD26yDbQBvP8CLxIYWzSBLkI1BJPJPtmtGCLWbjbGjBAARjN/mkaQwHPrZ4immHOOdVKwn
 JIhYAxdNObHen+TKpJIa3waa2OrcC5wAMinHhPThbWhiwLbqG2eb6bFeQ1ZVlA+NIX5W399zxKD
 VnNs4v62aQZfmarn/p99eBDksY21Jl78CTjIm+TkmcvapiGIhmC7fYO+NPyTJ6IFTe51z0xeXsc
 MaTtOHzoirg==
X-Received: by 2002:a05:6000:610:b0:3ee:1586:6c71 with SMTP id
 ffacd0b85a97d-42666ac6c7amr1142822f8f.27.1759905539314; 
 Tue, 07 Oct 2025 23:38:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6w1K3X0LjnbMSp/aN7V/VMhMplmlGGjhyyrOA8XmtmWavrmNfIkoLPnFmgzLbRAGJ+/npFg==
X-Received: by 2002:a05:6000:610:b0:3ee:1586:6c71 with SMTP id
 ffacd0b85a97d-42666ac6c7amr1142796f8f.27.1759905538861; 
 Tue, 07 Oct 2025 23:38:58 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-112-083.pools.arcor-ip.net.
 [47.64.112.83]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8abf38sm28015199f8f.20.2025.10.07.23.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 23:38:58 -0700 (PDT)
Message-ID: <7c84108d-6fe1-496b-92a6-e13469c32397@redhat.com>
Date: Wed, 8 Oct 2025 08:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] test/functional/aarch64: Split the ast2700a1-evb
 OpenBMC boot test
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20251007141604.761686-1-clg@redhat.com>
 <20251007141604.761686-6-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251007141604.761686-6-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: byVVklNW0lggt2wic-qxHopR4jTjZAx8hlBUnrg3G-8_1759905539
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.422,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 07/10/2025 16.16, Cédric Le Goater wrote:
> The 'ast2700a1-evb' machine has two functional tests: one loading
> firmware components into memory and another using a vbootrom
> image. Both tests perform a full OpenBMC boot and run checks on I2C
> and PCIe devices, which is redundant and time-consuming.
> 
> To save CI resources, the vbootrom test is refactored to focus on the
> firmware boot process only. The OpenBMC boot verification logic is
> split and a new verify_openbmc_boot_start() helper is introduced to
> only wait for the kernel to start.
> 
> The vbootrom test now uses this function and the less essential I2C
> and PCIe checks have been removed from this test case.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/aarch64/test_aspeed_ast2700.py | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/functional/aarch64/test_aspeed_ast2700.py b/tests/functional/aarch64/test_aspeed_ast2700.py
> index a60dc1259f69..32c971e13528 100755
> --- a/tests/functional/aarch64/test_aspeed_ast2700.py
> +++ b/tests/functional/aarch64/test_aspeed_ast2700.py
> @@ -37,11 +37,14 @@ def verify_vbootrom_firmware_flow(self):
>           wait_for_console_pattern(self, 'done')
>           wait_for_console_pattern(self, 'Jumping to BL31 (Trusted Firmware-A)')
>   
> -    def verify_openbmc_boot_and_login(self, name):
> +    def verify_openbmc_boot_start(self):
>           wait_for_console_pattern(self, 'U-Boot 2023.10')
>           wait_for_console_pattern(self, '## Loading kernel from FIT Image')
>           wait_for_console_pattern(self, 'Starting kernel ...')

The patch is a good idea ... but I'd maybe wait 'til the kernel really has 
been started, i.e. by waiting for it's initial output like "Linux version 
6.6.93" ?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


> +    def verify_openbmc_boot_and_login(self, name):
> +        self.verify_openbmc_boot_start()
> +
>           wait_for_console_pattern(self, f'{name} login:')
>           exec_command_and_wait_for_pattern(self, 'root', 'Password:')
>           exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
> @@ -141,9 +144,7 @@ def test_aarch64_ast2700a1_evb_sdk_vbootrom_v09_08(self):
>           self.vm.add_args('-netdev', 'user,id=net1')
>           self.start_ast2700_test_vbootrom('ast2700-default')
>           self.verify_vbootrom_firmware_flow()
> -        self.verify_openbmc_boot_and_login('ast2700-default')
> -        self.do_ast2700_i2c_test()
> -        self.do_ast2700_pcie_test()
> +        self.verify_openbmc_boot_start()
>   
>   if __name__ == '__main__':
>       QemuSystemTest.main()


