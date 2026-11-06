Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE093606A329
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dI6VT4IX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPJ0a-0006GH-Iy; Fri, 06 Nov 2026 07:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xPIyr-0005SO-Ml
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 07:23:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xPIyp-00087a-Ue
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 07:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793967817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uu+cDuCorZz51VgUzDaApyZ78MqY5eiqcqx1CYytCsc=;
 b=dI6VT4IX6rteZYsChR0/8E/GXjkRKiItoYxP4Ll+akkL0FvQlvZYbZnkcEGf9hwD8gUtjZ
 asj+HZlZDEfJDCXCXd/P0l9Ivsi+XdxxTDuYEwGKRUHxKPcSOe08SKojB9tlWTXT5wFC6s
 ADuRXbshLmI2ZI7HHxPIfu7ywhF2bA0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-gdBseJYdNjaDQ1SoqtLp5w-1; Fri, 06 Nov 2026 07:23:36 -0500
X-MC-Unique: gdBseJYdNjaDQ1SoqtLp5w-1
X-Mimecast-MFC-AGG-ID: gdBseJYdNjaDQ1SoqtLp5w_1793967815
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-48fcb657f32so438183f8f.2
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 04:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793967815; x=1794572615;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=uu+cDuCorZz51VgUzDaApyZ78MqY5eiqcqx1CYytCsc=;
 b=nj4/YditnJFAi4kpSzQvnOYPkAkJ+WtfIbkdBbD9IgOBJ2sN3OrWMokbUVhY4tVUFs
 0W2myUxXsdZMMIcVKMWFieciWTPROjH9m1Jc2FomWGa/Ayl9hRUKjDKWNEU1YhKO6gqK
 RneJquG+ywV3jaeKoz5u6/niIPzb5XkuwVPSdCllsgIIq5LuHNOrXPdH55dblyRjsU1M
 QpV576jUEn/xUbfhgoQvIZJipPKQhAARJSZJq+Db/Y8ocRSvLXS6xqH1+eIeFwAsCqAE
 AE8ZipoUB0b4Nvrhi8DoVjm+Hm683pAgrH+GIym+nxgSDSaFbJTuIDdAalOM6jUHQA2c
 7iUw==
X-Gm-Message-State: APuU4Z+XYxL3NkcPJytpbO8d0V6/r9hEyazZ+U0yjZ/TC8ulkGBiJkJR
 bE4SHVJLAzbQgNt4Z6Go4QamDv4J5BqOAFDYn35PsGkjfLyTFkYGqofJYDO683NLRxZK7Dwi2Tl
 Fk/90fhMMx3b/Jf1/JGj8vvbUpaWNeqSV+pBNp8pEr1wYPVDTeC+MPQ==
X-Gm-Gg: AYBFou2UUDgoZYozX0pGe/LcG4kLRBF2xZ+Xjx4Jy2tBGMH68Bsr/GebkmYzl0vKWeL
 dHVwOS9dFwZFGb7pdW1XTS0MjMnYQxTlpBRU9QANvIRmqp0bqrXYTQn+pF1zT4gIxFjkYgagxnR
 K7TKN00FW1WP5ZLeVMjpbNIhZGbEQlpVqw6HUPMV43Llna4f2KepCJ4Mhz582svVP3YfTgud33s
 CyjHWbM95q274zC6y7nRRjL0gTC99QXenp9DSc2MQoC0Nlet8Tb2cNxIbIK5qwXWIJisQ70rcBc
 CbvJkVJeJd16/ni547qMMGNSO2aLudi0TSuXRc7rxFRf4NmJqzepI5G6l0KmLBrEEanU05bwJJN
 MYJc2FMxqPe1J+/q1f6SNzpe1bMHCpuI/+8c/ZnKav5w3s65FqXCw4/4zewrQXz75gZLTY/9Zsa
 uKAv0x2VEl0A==
X-Received: by 2002:a05:6000:310a:b0:48e:5444:a1d3 with SMTP id
 ffacd0b85a97d-4927e553b25mr3926404f8f.11.1793967815260; 
 Fri, 06 Nov 2026 04:23:35 -0800 (PST)
X-Received: by 2002:a05:6000:310a:b0:48e:5444:a1d3 with SMTP id
 ffacd0b85a97d-4927e553b25mr3926359f8f.11.1793967814842; 
 Fri, 06 Nov 2026 04:23:34 -0800 (PST)
Received: from ?IPV6:2a01:599:b03:7322:436f:1f3:b26e:91b8?
 ([2a01:599:b03:7322:436f:1f3:b26e:91b8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7233297sm3590478f8f.27.2026.11.06.04.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 04:23:34 -0800 (PST)
Message-ID: <31bf0fb1-06fa-4bae-8b22-853f80548f9e@redhat.com>
Date: Fri, 6 Nov 2026 13:23:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/28] hw/display: mark cirrus and QXL as secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20261029131241.2275706-1-berrange@redhat.com>
 <20261029131241.2275706-28-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20261029131241.2275706-28-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2qY5M1Ysjcwp8Io5exQnsSladCfmNEEaD72YLDDWLAY_1793967815
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29/10/2026 14.12, Daniel P. Berrangé wrote:
> Most of the display adapters are emulating old hardware which is not
> relevant to virtualization use cases. The previous commit added the
> generic, simple devices.
> 
> This proposes two further devices based on their historical widespread
> usage in virtualization use cases.
> 
> Cirrus (PCI, not ISA) was the recommended default for x86 for an
> incredibly long time and while it is now discouraged, it is likely
> to still be in common use.
> 
> QXL was the recommended default to be used with SPICE, which is designed
> to service virtualization use cases and is still commonly shipped by
> many distros and often used by default in mgmt apps still.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/display/cirrus_vga.c | 1 +
>   hw/display/qxl.c        | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> index 0a8c74e1374..8232c5c4687 100644
> --- a/hw/display/cirrus_vga.c
> +++ b/hw/display/cirrus_vga.c
> @@ -3013,6 +3013,7 @@ static const TypeInfo cirrus_vga_info = {
>       .parent        = TYPE_PCI_DEVICE,
>       .instance_size = sizeof(PCICirrusVGAState),
>       .class_init    = cirrus_vga_class_init,
> +    .secure        = true,
>       .interfaces = (const InterfaceInfo[]) {
>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>           { },
Considering that the cirrus card also had a bunch of security-related bugs 
already and nobody is really in the mood of maintaining this anymore, I'd 
rather not mark this as secure. I'd recommend to rather drop this patch.

With regards to qxl, maybe better also omit this for now 'til we've got a 
proper maintainer for this again.

  Thomas


