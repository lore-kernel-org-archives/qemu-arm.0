Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E475FC83F17
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 10:06:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubcYd-00008K-0F; Tue, 15 Jul 2025 06:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ubcYD-0008Pt-Fs
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 06:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ubcY2-00021r-OR
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 06:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752573963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=fnDk+h6o7nepgD4uqHUPyHVCRgLgei/bOR6+v9RICHo=;
 b=D6BxPfqUeoA+LqGlyQb4Tf3dFhCJf7FG3NUQfueoVMEGQ3bgxtpsQkEg0kJhemWp/9qf2F
 ei+MRwjeAoKKNZBbwY+kwdxbx7lcTR6hMnK5DEJ5LY2HTYdngQUQPKYF/sv+XECvkurfql
 XmlGDpZ1oaw0z8FpBNcVmteiiPml4OY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-3t4Y5cXPMzWR4HyBuWK-7g-1; Tue, 15 Jul 2025 06:06:02 -0400
X-MC-Unique: 3t4Y5cXPMzWR4HyBuWK-7g-1
X-Mimecast-MFC-AGG-ID: 3t4Y5cXPMzWR4HyBuWK-7g_1752573961
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4f6ff23ccso2799800f8f.2
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 03:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752573961; x=1753178761;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fnDk+h6o7nepgD4uqHUPyHVCRgLgei/bOR6+v9RICHo=;
 b=Fx7LPtZnPI27/DB0ijnRHJrRTBRS3Jb5+mNzoiay5lFZO9juefvt/RgAaH421ZOuSU
 zM3387SPgh5qiWqTKSS4Sxc7SWvSun+tIs03niDnD869yAFjhxWpRFcUF7hWW+7vhrhc
 JCDn1oZamh/Bf2DJBpmuOehIYiyBju42gIuA2H8hjVujf1zuRPAVd96dpp7vRykPa/Wc
 BDjxH5lTCh0K+G2wzBgD+p4StVRwCbhuEKT7eKRWzRnSLBMVeGFF97w3RzU941n3xuJA
 W6OjZ1RhMoGy8oWoUmCIczAlI0vIisOMyy1OOFVLXQQRpFVHZ31yf/Z4EG6HQkKIfeJ2
 GkHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8ngy9wJiWqp0EGFCT8Gf0YDH5QBBnL21vPXjB1SRObpN8+19Bk5yopTcnHhtayuxoDqmxgce23Q==@nongnu.org
X-Gm-Message-State: AOJu0YzTmvUT3lzeIPe/2zqtpOAyCd3luJ8xrcGAcwgKc7s9fSD9of26
 1faaphBVHEwxe7nP4yR0h+Ov+4qUAanmsE+5BLIAbAVT/3aHG/9EmeUkXWnF8K/hr/AHDmoffYl
 HVEMSW64oRJ81RW25uHRjpHZJbjjYdztKz9GYOuVz0ZV+J9rZxuVP/w==
X-Gm-Gg: ASbGnctioAunFBvtgeGUlkFHIepcx3rgKwcqnwjQE6YVCOu+ijQYXlEv0Jr0fHDG1OV
 DjaKPo00FtgWkxUnIsBSmFgKP798DfNyOFd8NVfYKLavvPA8vUSqMGDyuDF1bQulewOm8runlRF
 zczrD+edue/mGk6uFgiAMQ5giqNrgnToemORA3zVHa64x4648lchwQrlE5Aft8vW4L3W1KUHOyN
 pC+fvi3n5gMNb+LMI1rG/XRI8aGgfs9VVHWrxD9/2xG3bhxGWazP4O4dzT82kn5OyuAYxyqxS71
 ycrPjpqs9vhgKV2ZvC1o8VD2y3MaHWSHxovaHhKYrUVUpm65xDm1W0COZe6iEp4AvR41c6tIUnX
 TDzAc
X-Received: by 2002:a05:6000:3cc:b0:3a4:fe9d:1b10 with SMTP id
 ffacd0b85a97d-3b60a1a8fb4mr1603442f8f.45.1752573961012; 
 Tue, 15 Jul 2025 03:06:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXy6PGwdWsZsLr0wV/YQn5Xm/SuUXlagN8UEEcgNem3qltywd418UcUxWI6cGv9N6D7yTyHw==
X-Received: by 2002:a05:6000:3cc:b0:3a4:fe9d:1b10 with SMTP id
 ffacd0b85a97d-3b60a1a8fb4mr1603412f8f.45.1752573960571; 
 Tue, 15 Jul 2025 03:06:00 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-115-130.pools.arcor-ip.net.
 [47.64.115.130]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e14d12sm14846156f8f.70.2025.07.15.03.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 03:06:00 -0700 (PDT)
Message-ID: <58451f7d-6f16-4d10-93e3-ad8aa890d303@redhat.com>
Date: Tue, 15 Jul 2025 12:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix Aspeed title
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Ed Tanous <etanous@nvidia.com>
References: <20250715061904.97540-1-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250715061904.97540-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mZXlpsL0gf1H4mY4o1cEQ5flAD-JMjqP7O7I-WS6_6k_1752573961
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 15/07/2025 08.19, Cédric Le Goater wrote:
> commit ad8e0e8a0088 removed the "======" underlining the file title
> which broke documentation rendering. Add it back.
> 
> Fixes: ad8e0e8a0088 ("docs: add support for gb200-bmc")
> Cc: Ed Tanous <etanous@nvidia.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   docs/system/arm/aspeed.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index bec0a1dfa8b8..bf18c5634700 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -1,4 +1,5 @@
>   Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``gb200nvl-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
> +====================================================================================================================================================================================================================================================================================================================================================================================================================================
>   
>   The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
>   Aspeed evaluation boards. They are based on different releases of the

Reviewed-by: Thomas Huth <thuth@redhat.com>


