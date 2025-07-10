Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B9EC83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 14:14:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZs28-0003VA-Pe; Thu, 10 Jul 2025 10:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZrtH-00053C-J2
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 10:04:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZrtD-0003N9-9o
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 10:04:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so618348f8f.1
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752156280; x=1752761080; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/WyByU3iX/pgJPNBNOMD5iwQVgwPnTkuFYE8Z461EkE=;
 b=qQW3IoYTEHk3llgOxk/7lV6VZRnfQiQh49ebHBFkF9Z79Wl6g+JQlbmdLke/52nFgX
 CFy1OI7jvB9kM0PhiiSnTgMVclAqR6ayyaAlgpUCIF2kE9XKdtZe1QIWQCjD83sMFFLJ
 kSPB/JKuQmGg30gbftzc/eQcexVGhMr3+3GGIVfiuwv841x1JpmmIuPNSgR2KjwllknW
 GUD+6b9UBmDt7m2byXg4FqStalfS6YHJL9774GbpuTl/EJBk/dA1CccFyzJu29sYVbk7
 yqaMk9G4QXft1JCxTheGCYcgTgC9j84kVPs7wZBYiBkUIMFNyi3h+uL40QVn6UwAUgWD
 a+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752156280; x=1752761080;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/WyByU3iX/pgJPNBNOMD5iwQVgwPnTkuFYE8Z461EkE=;
 b=DFr3hdQcpQ//kN8ukdsjSKu5N+9RQD8WsT5ccUhCGLOZ2UPBe17YTLb/zLiwMM6Dom
 x0PQ9jLioP1nNjDjesCJ+da2u8sG/lzeNC8r63BTivk1Gw/kot4/l6l1y8NLTzkYVX4m
 sB4neGbDTa863NXmRx1OU5lgYhVUh8ktrwVwFu00ncxUNCdXQv83J9JGwl2wZn/ZGUbw
 TR5jpzcH+2hxL84/yewCzMuOA9YS89BDN9mX1gw3m2j6H9BqkCXzSGrErOPFAhDH6aK3
 E7FC5CXV7SC+QaHBh+8a4VWgtV9T4tv802i7jymr2AqdoR0BO5sKPPbcokuiQXwgc1DS
 eLVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/2fV1TqkGLDDpp5VLRp8FVXgZgCz/4HZR+t0Os7yHuqhO5MhTXMPE/h/g7TBClOSPVfYp73T8fQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx5YWgbSUW/0LMOulE3WmUtdFSR1eS5nyHZKPi9n9W4SIYZTQpf
 ffyfUCrP6z3XwJII3bS4vzbt6FKn9P22QunjDxUP30KuJB5YRZ9njlgodv0BIfkIzqg=
X-Gm-Gg: ASbGncterj1/F5lfsYTmEyrCITLqv6uEhaYNO4MSYjECbJE/635lsmUoSCBKNx5TjNA
 0caU2VGSeBUnztJVZ9KFP/IAzc77qth1Ft2jyX64GmGc9TMhWsMnjOuAtJsKTfk18tnedzt/ZDj
 iM3+qKcfr3oKJv0QNV+uWKJUaVsmVTkewEyd0+FbWunlgQs0oOi+UPl9+CnrK1PH9J+yO8RF2id
 fN6KDrf4ZStGt9HnL4eWjV6/Rqu+rATNqeShmWtnFVSFuZKQALdrhzqYuUO1NNs+hIs0G2LuQP1
 FUWDOC4kvqr/8lzb2qeUPmFzawsELlulvHgaAQJE8ZLc3N/oGw0fHgx88aioNLMvEnXlEEMx6fG
 MRV9h+jCs5PruQjOCnDw3ojkRXZXGtT606WBLVVbGOeSc+IG5
X-Google-Smtp-Source: AGHT+IFlD5vjUKBFSCBY+YV6P9/0yEePMT/Sn+zJIwPMnWpnrQaBVLnYOjXWUY6cGcaTKMk0VtDUEg==
X-Received: by 2002:a05:6000:200f:b0:3a3:7ba5:9a68 with SMTP id
 ffacd0b85a97d-3b5e7f1d873mr2728940f8f.18.1752156279884; 
 Thu, 10 Jul 2025 07:04:39 -0700 (PDT)
Received: from [192.168.1.117] (lfbn-mon-1-970-120.w86-227.abo.wanadoo.fr.
 [86.227.5.120]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0dc3esm1945392f8f.47.2025.07.10.07.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 07:04:39 -0700 (PDT)
Message-ID: <48fca85b-096a-4d1c-97dd-380669cb6604@linaro.org>
Date: Thu, 10 Jul 2025 16:04:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] hw/arm/arm_gicv3_kvm: Add a migration blocker with
 kvm nested virt
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, miguel.luis@oracle.com,
 peter.maydell@linaro.org, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com
Cc: hi@alyssa.is
References: <20250707164129.1167837-1-eric.auger@redhat.com>
 <20250707164129.1167837-5-eric.auger@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250707164129.1167837-5-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/7/25 18:40, Eric Auger wrote:
> We may be miss some NV related GIC register save/restore. Until
> we complete the study, let's add a migration blocker when the
> maintenance IRQ is set.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_kvm.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index b30aac7aee..fccb3886bf 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -827,8 +827,16 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
>       }
>   
>       if (s->maint_irq) {
> +        Error *kvm_nv_migration_blocker = NULL;
>           int ret;
>   
> +        error_setg(&kvm_nv_migration_blocker,
> +                       "Live migration disabled due to KVM nested virt enabled");

(mis-indentation)

> +        if (migrate_add_blocker(&kvm_nv_migration_blocker, errp)) {
> +            error_free(kvm_nv_migration_blocker);
> +            return;
> +        }
> +
>           ret = kvm_device_check_attr(s->dev_fd,
>                                       KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ, 0);
>           if (!ret) {


