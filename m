Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DDAC83F03
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Jul 2025 17:28:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZYaq-0002Kk-Uq; Wed, 09 Jul 2025 13:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZYZ7-00010M-Pi
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 13:26:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZYZ3-00084X-5X
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 13:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752081995;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tinj7o2qT74O6OD7exxZnCoLbtUywkiRXt4zmRD4qLY=;
 b=dMZ4fnUB4FUcEP74igCLJ31Rtx83jDp/6/1BUtbyGZ4ZIeTExnR5wKWAYlB+dCuMftJHxi
 4VF/bktJs1KEAotslO7Mchexy5hjlrHvV+8j8h5vzJHHB1e+sgUcchYyzCgUOJ5Bu4MiWN
 Ld0oz3DMeo//H+6tmqkCRKKl9fB64EY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-2sS6WjimNI2yAwjYRVpkJw-1; Wed, 09 Jul 2025 13:26:34 -0400
X-MC-Unique: 2sS6WjimNI2yAwjYRVpkJw-1
X-Mimecast-MFC-AGG-ID: 2sS6WjimNI2yAwjYRVpkJw_1752081993
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4532ff43376so610575e9.3
 for <qemu-arm@nongnu.org>; Wed, 09 Jul 2025 10:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752081993; x=1752686793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tinj7o2qT74O6OD7exxZnCoLbtUywkiRXt4zmRD4qLY=;
 b=qvdiAzBON83LiV8PWUgh5NEFQ9UybMtTiTH3LkseP1BpiGsBRTV4x3arIkZz2ooBQu
 swQBhwAApGmJT6WddexXyg8Ytgc1B9109rIlo+jjEiZMf01VvPRfltdUTiVDmOOzpl8d
 J5RCpi/+3u3MxtK4PhNgcy1LLN4MWZigWglJUTRVB3R5vXBHCJlkb7xvF/xybHB8dyBg
 ZQFqDpR2htJ24zswX4M9QJmPU3whoUo71QLMhTgWmpftoygsSSeRREExFIrB1SGJ3S1M
 fPtn0c096R4ow5PHH/dfrteakcK9kTNojaRdWFGybVyqMsWdPLLixjgEa+jP/LF0w6N9
 8dnw==
X-Gm-Message-State: AOJu0YyBvd+mforGf7hHPxyATRDl1g6vdQOU/ZtmnCkkXXS574l5HWC6
 FkQb4PrfhArJjcuaSZ2Ucnn9fjDtadZnRZhyquINqVU1QJB69b8TUqDXu9/5IsqudWMNnAdLS8D
 fpb9UVmPjlDgTx7iZVp9KnjM93/vD2oOL+RzHoOX8Y8mD+VDDani6HQ==
X-Gm-Gg: ASbGnctx48aYZVlkfyeUbO1/TDoNbYkidV/wPTeNRm/Er8qDkwFcAL2GIckz5RE7Jqu
 kWlJB3Lju2cJ1qmsoXDaP4cYRWrJveZnn8Ak82ihsIdDVmXDlHk/1IbEubsHKdTa8SNMyHrSJRA
 wBeRlpfww8PXR9IV6DXhbQwyRkORwrSEiUHjBO+REKZPgpxQFGqRjaR5mhzQN2WDwGkHfWSLytV
 eNkoWYKgsKfdTgMAVn5umZODoSwF95rlnVPitpANHISHk9llGJRBZcmdBuhVLvoyuCfBQmtDTxq
 DanJw12BCw6awKJrfP/Olw8PLN4kq07lrqk7hiWr0yKJBr8gRRcKt9f2ALQgrsDEq9VOhA==
X-Received: by 2002:a05:600c:548d:b0:453:5c30:a1d0 with SMTP id
 5b1f17b1804b1-454d53ae0a1mr27177525e9.21.1752081993079; 
 Wed, 09 Jul 2025 10:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL18TWFgYbdQ4Qx6FJrY/Tha3RQLnCQZh8Plw+je9CuK8wMPlztrzFt0C8mpODqGVuEMK5cQ==
X-Received: by 2002:a05:600c:548d:b0:453:5c30:a1d0 with SMTP id
 5b1f17b1804b1-454d53ae0a1mr27177335e9.21.1752081992612; 
 Wed, 09 Jul 2025 10:26:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5070fecsm34121345e9.31.2025.07.09.10.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 10:26:31 -0700 (PDT)
Message-ID: <46f3c892-45d6-4d46-96ab-06e09db986f1@redhat.com>
Date: Wed, 9 Jul 2025 19:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm/kvm: shorten one overly long line
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Sebastian Ott <sebott@redhat.com>
References: <20250704141927.38963-1-cohuck@redhat.com>
 <20250704141927.38963-6-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250704141927.38963-6-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PiVvI4JcCgqzKnXVNcoQaXQaOmKlO2wZzHDIHjX50aY_1752081993
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 7/4/25 4:19 PM, Cornelia Huck wrote:
> Fixes: 804cfc7eedb7 ("arm/cpu: Store aa64isar0/aa64zfr0 into the idregs arrays")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  target/arm/kvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 426f8b159e82..8ab0d692d36a 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -230,7 +230,8 @@ static uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg)
>  }
>  
>  /* read a sysreg value and store it in the idregs */
> -static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf, ARMIDRegisterIdx index)
> +static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
> +                            ARMIDRegisterIdx index)
>  {
>      uint64_t *reg;
>      int ret;


