Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7FFC5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 13:15:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx2c1-0005JI-RN; Thu, 20 Aug 2026 09:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wx2bz-0005GK-V3
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 09:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wx2by-00017o-61
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 09:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787231713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=txngaykquXZiq+V+U+/O3Xi4zPZHpCcoMSna6F3gejQ=;
 b=ZlSbE3UqGi4gtSqqcDceR+0cHq1CyF5zKuOhXBAy+VRbW5JiAZ6C3ta+g93ZODDrkNpi3E
 uF1hhnUDOHDCgVPLgs6rPpdU6WLTy4DV5MQjIxkUM/LEnZHXVet2/vElC4uHUd4Nmx20wa
 u77bEgWWgmV5TzmcXxoU3+V7rGVMYS0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138--l4d6KjBO9CYjeeo4Ypcsg-1; Thu, 20 Aug 2026 09:15:07 -0400
X-MC-Unique: -l4d6KjBO9CYjeeo4Ypcsg-1
X-Mimecast-MFC-AGG-ID: -l4d6KjBO9CYjeeo4Ypcsg_1787231707
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-481514be433so952441f8f.2
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 06:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787231707; x=1787836507;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=txngaykquXZiq+V+U+/O3Xi4zPZHpCcoMSna6F3gejQ=;
 b=JI1TqBvQuWu8EqBLrzTc0V6Lb9EN55/l7kvAP7i+M0WpAeWRDGifY/mz178ENko5RV
 TRiSxzL67TszPDaVJG4Wx9OCfqOSgtF5mbjz8LBh2sm7eXS5rvFP8l8lUDtDSL5ddvXf
 kHuMnoZBkGZq1cV5qfA+8B6wrR7zsnlFvj5sv5qIuRUR/GE/0x7xXPcEVS2PXVpDuIsB
 CtMR0nNRA6C9o8P9wWZrGYDPhGw/pfEkhZSv3cU91bBMGipoawsYhEyxN53aE0ahp8RQ
 fyqYY8YCo+AVWgLuv+1IOU2CqbizpRMxqbVJIv76pwM9O5fT5V6lpMnKSIsjzmN1S4SG
 lOfQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RonPcc9eJJVW55Oq0h6Uok6oBfasYmP3EgoB04WM2kF6x4TMwiprkboB+twdpOJZ4y9uGioOjgSYg==@nongnu.org
X-Gm-Message-State: AFuF++ll9KN0XJgSk/LEQSlx1Xw48pUXngjeWUODCbezwwQ4tHiyNsv3
 wyQplSxXYDg3KZh4x13WsuktehpIqhR5JJzZQDjlSJR9Jbezy8pzsnVq+vPM6ZfsyXp7xseCCK9
 XiAWEr+PlWrZlcKmTNxgOcCaRb7BzYWaC6YagdBJdv6YVHTAHIZaXFg==
X-Gm-Gg: AR+sD107x8dVaP+5UoTD7UWpoeWLBPFxZLhkB0DgFZvpO7GdpZqcvqw8og1qwHphjDd
 QkSbqRSe2eg7uGGvzFUtu0Phl5VYMfmp+eEe0r5q8SCVJ8Dlna9uGqL8X5Dbq3UH6Mv0JhF6Arw
 FX3BJV+cerQZgZJLj42mg1vxd4KshbZ23jdKjyXs+91d+3GlI8miEzc8UI+ERtkAfCK5pcLdkQc
 KOqearAA7fxZGJkZ3WLp+SnTjAoIybWEfmlnAGHMYw70rCPbHiCEcRFpSkx6gbx9CWVe0a+6rsh
 cqDBFXajo0soKM00qb4GpvM4ECj6hOTUloBTa0+rQBn2tNP8PFkNnkJakguJoXVbSpBMxek=
X-Received: by 2002:a05:6000:2605:b0:481:4f9b:282b with SMTP id
 ffacd0b85a97d-482b1ff75bcmr22567038f8f.21.1787231706685; 
 Thu, 20 Aug 2026 06:15:06 -0700 (PDT)
X-Received: by 2002:a05:6000:2605:b0:481:4f9b:282b with SMTP id
 ffacd0b85a97d-482b1ff75bcmr22566883f8f.21.1787231706140; 
 Thu, 20 Aug 2026 06:15:06 -0700 (PDT)
Received: from [10.22.3.81] ([91.26.127.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14c46f2sm15050607f8f.29.2026.08.20.06.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 06:15:05 -0700 (PDT)
Message-ID: <110eb230-f61d-41d2-b498-2792cee37f65@redhat.com>
Date: Thu, 20 Aug 2026 15:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] docs: deprecate virtio-crypto
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 zhenwei pi <zhenwei.pi@linux.dev>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, devel@lists.libvirt.org
References: <20260819-fixes-for-11-2-v1-0-b7981c2cc371@linaro.org>
 <20260819-fixes-for-11-2-v1-6-b7981c2cc371@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260819-fixes-for-11-2-v1-6-b7981c2cc371@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OHUAlzA4TOtArlCQvZoTUbQPuIdj6dKu30hCdD_l6jY_1787231707
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.346,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 19/08/2026 11.22, Alex Bennée wrote:
> We have outstanding guest exploitable bugs in the code which is fairly
> complex and needs some serious love to clean it up. As off-CPU
> cryptography acceleration seems to be waning in popularity lets just
> deprecate the sub-system with a view to removing it in a couple of
> cycles.
> 
> Link: https://gitlab.com/qemu-project/qemu/-/work_items/3625
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Gonglei <arei.gonglei@huawei.com>
> ---
>   docs/about/deprecated.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 0c656a968fc..3c22981fc8a 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -276,6 +276,20 @@ future release. Where no 'dh-params.pem' file is provided, the DH
>   parameters will be automatically negotiated in accordance with
>   RFC7919.
>   
> +Devices
> +-------
> +
> +``virtio-crypto`` (since 11.2)
> +''''''''''''''''''''''''''''''
> +
> +The ``virtio-crypto`` device emulation is quite complex code with a
> +number of known flaws. It has never been migratable so is unlikely to
> +be used in any serious virtualization setting. With most modern
> +systems supporting on-CPU cryptography acceleration via their
> +ISAs sets the need for off-CPU acceleration is also reduced. Add to
> +that the kernel has recently removed the ability to use off-CPU
> +acceleration suggests the time for this sort of off-load has passed.
Reviewed-by: Thomas Huth <thuth@redhat.com>


