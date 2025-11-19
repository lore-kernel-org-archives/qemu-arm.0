Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D146FCF258C
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Nov 2025 08:32:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLdc1-0001Sz-IS; Wed, 19 Nov 2025 03:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vLdbv-0001S6-EV
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 03:32:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vLdbt-0001PQ-5f
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 03:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763541135;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gPVuk/sT4zE6r1azzUQorcbjnOiVwRZ/n3G9NSDFQY=;
 b=M5B3Voarp4p+yxsEmP1i9waRLW4mpV4llImpevfP7xVBhzlHqy/S84pWP+tm7dan4wBHam
 dwNG6Zao6sn1xtMGHkmNUCVwQOdjqcQa2pP93JWYXl/VnHjTiiorchvFcdkg71IDm+aKDE
 hZI3lLCHbK/S1q3mtMz7IrrvAHfo45g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-FC0E6kogPs2RzM0e7PmJLg-1; Wed, 19 Nov 2025 03:32:14 -0500
X-MC-Unique: FC0E6kogPs2RzM0e7PmJLg-1
X-Mimecast-MFC-AGG-ID: FC0E6kogPs2RzM0e7PmJLg_1763541133
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4779393221aso12508925e9.2
 for <qemu-arm@nongnu.org>; Wed, 19 Nov 2025 00:32:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763541133; x=1764145933;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gPVuk/sT4zE6r1azzUQorcbjnOiVwRZ/n3G9NSDFQY=;
 b=UTCvpHjpripEqt/XnofOjP0xU/tFIxX6J4XfqxjXHMYzzTRIOWi1BZleLsWz+qBBdB
 1JrS7yXA8NkZCXOeZVPnBE63r0tbTv8blkTp0/YuHUruwU4Z4oOFQTNlR2xf4DV9dRDi
 GDehRtbLdb+GLMZRRdUwwHFzkD2qAcPmZelfO73YYhBcnw66uwlozk20eh7GCW/Qt1Qn
 rGX7+dsUwBxdqwGzbgDeCCaguYBtlpI19Ofb7MglCVK0GGA+XevC7pusd3BIuBZb4TAM
 4G6BJG6/5hZMx4w+VmhJZiyVt1EcYpjGh5LW0dIwbk2Q9vK8Jo7AR7cXVeg6zwxIM74b
 hCSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwla3nRvKy0iLi0DyDxtwiJMz7QhzfaQMovAsQAL3TCN4OaRmOHsTjyf0xhcgJCMub4rEFLCZelA==@nongnu.org
X-Gm-Message-State: AOJu0YzCV69r5DIVe4cuTvYQlIT73IxW9q70PsWRrHNmWFKRX225gKWS
 VItZjOaXBsxaf56aOrD9Uv5IkjpBEibxgfhF1bl+dqL9X3R5IdnpPCl2kDDuPwruY54y4gR/oih
 TEEi3bFJ7s+54/18HOxO00HefUv5S+4chsFKE8MwPigcxNj1qNQ9ozw==
X-Gm-Gg: ASbGncs+zoMXZWAW2zZQqN3wfMMWatEZtgsMWsRLcAcrE+fOakIKg6iBiZKGn9MnfSe
 eVVD//+pvwDHwfV+alif2uI5kH/n2ahAiXpaybavD8v8Eh/SffAFUlecGergm4l6Ois/2C8INwS
 Alld6bCDm9n4h7ZEesNnq7MRaSkAVEl3jspvT1H94OdazxQEyG7/K2qcu2DqAGkv4wwKTKkzTup
 2N2+Gv0Lvl19OJPqx5jt9+BH8yFyUDyTKCswdN4l/g2jcU+Hmxmk+SbFgmvh0y8fvwjiiT3P/oJ
 J56++YjCFa+sNQc/cSZrnFkDn27SVLzpQSgRZ8l1VANOP+8fJTK7a/3TcDm2iV3bcnK0IGKhRgs
 EObJ0MoKZiGKmqxprEj4WnQPY+1CeH5WQSYhhXhuzJrYvAf7vCS9xTsmwHA==
X-Received: by 2002:a05:600c:1c29:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-477b197ab30mr12981325e9.1.1763541133438; 
 Wed, 19 Nov 2025 00:32:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8KG/wESUYwc0SFV30ukmYmcBLk5m7c8dt391qHu8WxTy8KOn35j0jyWk0Y5cJscGmKitmwQ==
X-Received: by 2002:a05:600c:1c29:b0:477:7f4a:44b4 with SMTP id
 5b1f17b1804b1-477b197ab30mr12981135e9.1.1763541133064; 
 Wed, 19 Nov 2025 00:32:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42c961f6e64sm23194804f8f.27.2025.11.19.00.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 00:32:12 -0800 (PST)
Message-ID: <f724ffae-1fc6-417b-afb9-406b6d705ee9@redhat.com>
Date: Wed, 19 Nov 2025 09:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] target/arm/helper: Skip hidden registers
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com,
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
References: <20251118160920.554809-1-eric.auger@redhat.com>
 <20251118160920.554809-5-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251118160920.554809-5-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aWsvhGiurqWU00DXV2-p5xv-ACquHrEnzjFp5N2M6ww_1763541133
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 11/18/25 5:07 PM, Eric Auger wrote:
> In case a cpreg is hidden, skip it when initialing the cpreg
> list.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/helper.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 27ebc6f29b..7e34b4803d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -236,8 +236,11 @@ static void add_cpreg_to_list(gpointer key, gpointer value, gpointer opaque)
>      uint32_t regidx = (uintptr_t)key;
>      const ARMCPRegInfo *ri = value;
>  
> +    if (arm_cpu_hidden_reg(cpu, regidx)) {
> +        return;
> +    }
>      if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
> -        cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
> +        cpu->cpreg_indexes[cpu->cpreg_array_len] = kvm_regidx;
I screwed up with this last minute change. This diff shall be removed.
I pushed the fix for now on

https://github.com/eauger/qemu/tree/mitig-v2

Sorry for the inconvenience

Eric



>          /* The value array need not be initialized at this point */
>          cpu->cpreg_array_len++;
>      }
> @@ -247,6 +250,11 @@ static void count_cpreg(gpointer key, gpointer value, gpointer opaque)
>  {
>      ARMCPU *cpu = opaque;
>      const ARMCPRegInfo *ri = value;
> +    uint32_t regidx = (uintptr_t)key;
> +
> +    if (arm_cpu_hidden_reg(cpu, regidx)) {
> +        return;
> +    }
>  
>      if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
>          cpu->cpreg_array_len++;


