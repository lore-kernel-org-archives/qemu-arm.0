Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AB0CA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 15:04:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usN6B-0007Ul-AE; Sat, 30 Aug 2025 11:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ursmf-0006Sk-0F
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 02:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ursmW-00080v-6H
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 02:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756449613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yh9ohG+VWrky/QdXWGA0razfDecmCl0pK+Bqqjh1BoE=;
 b=SBUuTV2+WQBdu/tDxtHu1LW8x8zv0X6GR7LuhCc7+r2EcHtvyE41CnOtLZl+Nz3dtPvUrL
 n64vYs6n9DwmP/U0pj8vxE7OEO//TRv3XK/25cFZdPIoNVxpaMC9gfskHJxVpTELen5g2C
 Py75qaDbOMUn7I4gkCHySJCL9DFrpmk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-DMcZlhKrMuavj6VhMSjaCg-1; Fri, 29 Aug 2025 02:40:10 -0400
X-MC-Unique: DMcZlhKrMuavj6VhMSjaCg-1
X-Mimecast-MFC-AGG-ID: DMcZlhKrMuavj6VhMSjaCg_1756449609
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-afcb733834bso226967166b.0
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 23:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756449609; x=1757054409;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yh9ohG+VWrky/QdXWGA0razfDecmCl0pK+Bqqjh1BoE=;
 b=GLmXURVW790yFYAWtGiRvEu4kbkrWH8wA9QWiYBswuHANCHD4qY/qYbwbClOic67w4
 KEAsBTdjcK+c4IhTqq9y9qKPiVCFHvjA0VxNLljr20sPtNmF6SNBLlTOyX303Yl79J4a
 HQIq7bdPzIghhNfROtCv6hvBJEMPG75M8lCE7ZjPVu4xE2+kUoYdIrvY32URWdFhsVM7
 CGvUbattKTBMFi/KYnNIhOT1Q5F6eZ4JMwZJ9r+Zch7DRvas7GG7qAoGV7QJFYi7tBnH
 p4BF3CfCLh0pwIhLJRLXVOV0BLBmw5QLAgOeFp6Oe9G4VqdPOZKEETp2qnGyetY2eTIV
 AuSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+sMSnnSKZ6LG59NVRbWL5AzMElF79CHYitJPb7jTmxHDdIQ3RXmK2SscH0bkaM4Ef8LjspsUrng==@nongnu.org
X-Gm-Message-State: AOJu0YwJrXNhw8BC8Xe6rLo0U2LgFTsfoC1ku+DG5ZU4CiIBDs9Pj/kO
 uhOzLiKXWoE0sey51/6YOrACnMzFUaMvjkgMH7nuZNgt0JEri04raTahD3NrQwkgoZQd5UkcQZO
 +y7uGkUrkwqby9S7xJ3awakpZbhQrqVALqkxble8k6vUBwVkdEHidfA==
X-Gm-Gg: ASbGnct52QEJqoRzCeAf0tTXKQ7Xdh/vhV9d2HUtKCr4PnrsPJSSW13upcwKG3tBxgu
 6BUantGILyt1mFdiGknsXdgbEnEAgiPr4ZvAxGQAQMpqJ0xmBbOQ+Tyjex3RjL0j+z3j8+u5UHG
 CXH437QlIoLlF0VlPa4BySs0JlKR1LsBqf9RRaK53eT4nFrV+yUWxLFR6T0xEiX4e7mFP9hV3+X
 wvzVhxUBkeCHMyBmg1/qEott2QGpT0US2L5lkcvxPOjbzWrYRQgz4Wh7nyThwBsEdBI8cQ9jArC
 M12nPFIqRiqMmLABXGgeLjFtUhNxvsvYOZWJNSeGhFMMjnk213qnEBo20xrBR+tQKZAs
X-Received: by 2002:a17:907:7fa4:b0:afe:fcaf:6d1b with SMTP id
 a640c23a62f3a-afefcaf6efemr183575766b.43.1756449609181; 
 Thu, 28 Aug 2025 23:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOmGFSW76Vir/KDiT6uLNHGRnyLpXH36pJxpV3WM5T4rzdH8ODslS3DNxznMcwPQSmv1k7uw==
X-Received: by 2002:a17:907:7fa4:b0:afe:fcaf:6d1b with SMTP id
 a640c23a62f3a-afefcaf6efemr183573366b.43.1756449608738; 
 Thu, 28 Aug 2025 23:40:08 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-42-48-43.web.vodafone.de. [109.42.48.43])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff10eb1ee3sm2482466b.19.2025.08.28.23.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 23:40:08 -0700 (PDT)
Message-ID: <6d35349c-f6f7-431f-a305-d548f2e4ec65@redhat.com>
Date: Fri, 29 Aug 2025 08:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] system: drop the -old-param option
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250828162700.3308812-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250828162700.3308812-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G7269_YOk4EjADElZR7KyvsBixeYsbPre-ku3Ta6ESI_1756449609
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On 28/08/2025 18.27, Peter Maydell wrote:
> We deprecated the command line option -old-param for the 10.0
> release, which allows us to drop it in 10.2.  This option was used to
> boot Arm targets with a very old boot protocol using the
> 'param_struct' ABI.  We only ever needed this on a handful of board
> types which have all now been removed from QEMU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/about/deprecated.rst       | 13 ------
>   docs/about/removed-features.rst | 12 +++++
>   include/system/system.h         |  1 -
>   hw/arm/boot.c                   | 81 +--------------------------------
>   system/globals.c                |  1 -
>   system/vl.c                     |  4 --
>   qemu-options.hx                 |  7 ---
>   7 files changed, 13 insertions(+), 106 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


