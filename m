Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D5BCCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 18:03:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIshq-0003pn-Fr; Tue, 11 Nov 2025 13:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vIshO-0003W0-3p
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 13:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vIshI-0003KR-Td
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 13:02:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762884148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TTN5SXX6lLcJCCTOfwFeybQXnMnUgF+QYM7KqAj8vI0=;
 b=OpiIBxDZZXsI3tQo9zGTqvcSYZjCT/3uqZv45MeW2N/hdrv2gAqmbGlhe4tiVRlbMRIr8B
 LhGim9dwAERJr55+egnZ1kNSIfecwvXs8Hbv7I9T5yJ/iFFApVip3vEdeEkdDNApzWJmEW
 JnrxpnaKXr83xtAR55Z8PqWnAwsE2rY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-PPXq-OGgMIeQTVMrPDDg3A-1; Tue, 11 Nov 2025 13:02:26 -0500
X-MC-Unique: PPXq-OGgMIeQTVMrPDDg3A-1
X-Mimecast-MFC-AGG-ID: PPXq-OGgMIeQTVMrPDDg3A_1762884146
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-429cdb0706aso2771206f8f.0
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 10:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762884145; x=1763488945;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTN5SXX6lLcJCCTOfwFeybQXnMnUgF+QYM7KqAj8vI0=;
 b=rAwj0jCJrqtfttGrdvxHL+/+rqHErqAp0oCS8c2H//CLO1vwfEjGcHEYhGkC91KKv+
 UU18z46r53+uZO/f1UQwwURnDe/a7kkhXKNePkMR/4gd/2tsCognGIB+ZUVOWae5ezup
 IhkUpjpi7LF0AG7BItSSAduRxFlbEo65PdJT3v/qQ+JYseaQnvQ5GU9UtLCPhpCxUiF5
 +Rm2ri8dD248mGlYGfk0r5LzgAb8ZJ1eDDouNa7kTMeKDyDfSiRmXKshws8kdcjKmaHi
 QcUbWuqdpsGTbA77IpsGRThEifpaX+aaf3XuJfvcOZnVyPr5dXDQvl5pdWka0dcQq0ll
 gm1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOk/HGapBm4w3dJAK7aXzN2boO7LQKKYz8wJsmm/G+M2FNxOFpWvd84bAm2amwtPWBCaHM07MC5Q==@nongnu.org
X-Gm-Message-State: AOJu0Yzfng0f0FzpIsq9XNarLdoTgR9J/YqQIvZ1bhgIo5kQGC3p7a9I
 QN9Wx5OkY5jRuJ0NgOoVxguHoHPIR9zvSFqb0rFYlfiDDpREQkBaj68zm4qp1gdjTDehKzRUY6t
 s0FmfzPGA/Wzop69wwkRKUfr2YyZa5d3MU8CPKOgsHaOMZ+X+Jdl4ZUCTnlZ7/A==
X-Gm-Gg: ASbGncskyK6iOVV4PnLqmSPoxlBHPVfdXSSzAFFIZlW2OjyE9fKcfDd1A3vywyd/OA1
 O6FLbhLmevY28Um1c07ee5nxkcv+T81ffCu9Q8/nz7rrKdtsJMvjAZt61Eao6XVhBpwu7xdZ5Ib
 vyT7uUYO6aaSiazh8evT07MiX6KP/JMfDEeo/ARdgsjnh+E7laRaFMe8BceyGU/TnPVJdhTrXwG
 JFAbHzzYhoN5Kig16qx4/aXfEcERwLfCvO9lgY5VP+vXtzQ8ZCf6P3iephz9tiH5jSQoGogXYk2
 jRD4VhULe0rJruNrjIKf+A2QcxnSyNGi1tuJgwnqydxNAmhHaQGdjGow7Y5iBcZ804gxJzo=
X-Received: by 2002:a05:6000:64c:b0:427:719f:de70 with SMTP id
 ffacd0b85a97d-42b4bb7bfa9mr97978f8f.14.1762884145520; 
 Tue, 11 Nov 2025 10:02:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXmGGIxQW4UVktKiWPN3q0JgVSfTGugHVmSCr2qeTegBDXhikE2BpwPbjjaIAbsOm3kEDhyw==
X-Received: by 2002:a05:6000:64c:b0:427:719f:de70 with SMTP id
 ffacd0b85a97d-42b4bb7bfa9mr97947f8f.14.1762884145122; 
 Tue, 11 Nov 2025 10:02:25 -0800 (PST)
Received: from [192.168.0.7] ([47.64.113.41]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe63e131sm29480878f8f.20.2025.11.11.10.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 10:02:24 -0800 (PST)
Message-ID: <5888d509-5fa6-4e65-9c24-186b2007af46@redhat.com>
Date: Tue, 11 Nov 2025 19:02:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] tests: move test_virt assets to share.linaro.org
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Kohei Tokunaga <ktokunaga.mail@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Ed Maste <emaste@freebsd.org>, Paul Durrant <paul@xen.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-stable@nongnu.org
References: <20251111171724.78201-1-alex.bennee@linaro.org>
 <20251111171724.78201-9-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251111171724.78201-9-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K3AcFIu3vuWRLFd4C9akDcwjFdiQhAoQk-rGk4ivb3g_1762884146
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/11/2025 18.17, Alex Bennée wrote:
> Linaro are migrating file-hosting from the old NextCloud instance to
> another sharing site. While I'm at it drop the old pauth-impdef flag
> which is no longer needed.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: qemu-stable@nongnu.org
> ---
>   tests/functional/aarch64/test_virt.py | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/functional/aarch64/test_virt.py b/tests/functional/aarch64/test_virt.py
> index 63071f9b517..972b7bf783c 100755
> --- a/tests/functional/aarch64/test_virt.py
> +++ b/tests/functional/aarch64/test_virt.py
> @@ -60,8 +60,7 @@ def test_alpine_virt_tcg_gic_max(self):
>   
>   
>       ASSET_KERNEL = Asset(
> -        ('https://fileserver.linaro.org/s/'
> -         'z6B2ARM7DQT3HWN/download'),
> +        ('https://share.linaro.org/downloadFile?id=3zGlbmXh8pXFewt'),

Please drop the parentheses here, too.

With that fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


>           '12a54d4805cda6ab647cb7c7bbdb16fafb3df400e0d6f16445c1a0436100ef8d')
>   
>       def common_aarch64_virt(self, machine):
> @@ -77,7 +76,7 @@ def common_aarch64_virt(self, machine):
>           self.vm.set_console()
>           kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>                                  'console=ttyAMA0')
> -        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
> +        self.vm.add_args('-cpu', 'max',
>                            '-machine', machine,
>                            '-accel', 'tcg',
>                            '-kernel', kernel_path,


