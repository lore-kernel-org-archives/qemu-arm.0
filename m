Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4932AC83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 14:22:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZs9W-0001Nf-OB; Thu, 10 Jul 2025 10:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZryZ-0000g9-Nv
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 10:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZryU-0004Jm-KQ
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 10:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752156607;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bjJYpCH7ZfK0sawPwyP0TDIcWspMQNetqywwvCHqCc=;
 b=JI0qK3NQHqIc6ogpXFqXTRMdnLVXaYTKo5Mo1F+E0T2SDECG9mR3kaQc6xEu936XN2tl/M
 HZ82AR5sPneb8tPPy2eztyw6wPZSQjO+vx/alS7ySiLx/WrUwziqt96AZgpIc6qSggbUf3
 bcDhqBr4Z6j8UR5srSYJydReJqtfe0k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-ewlvVzbEPu2i4oKJZ6m9Sw-1; Thu, 10 Jul 2025 10:10:06 -0400
X-MC-Unique: ewlvVzbEPu2i4oKJZ6m9Sw-1
X-Mimecast-MFC-AGG-ID: ewlvVzbEPu2i4oKJZ6m9Sw_1752156605
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-450de98b28eso10323875e9.0
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 07:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752156605; x=1752761405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9bjJYpCH7ZfK0sawPwyP0TDIcWspMQNetqywwvCHqCc=;
 b=bAzm1/mw+AUXS+ZuC6Usc8xUi+j4l6YvklAXrEWyGhEBlSoBZy9B0Dw8YhvnqUd+96
 nno26PEa1920RDJ4vIk6Mg4PKVwwHykSf0nlo82vwrReOgU0LQ8HvW05PIiMfOnoptgY
 Pcd5mxIaE37SC6QD+kXI+eVWfJDZwo0LXSC2vRFEUbNYREyfOtV16u484/+Mb5Xka0cD
 M6JifHn+FjR9YNoK2n7J+qMXTfkEplEaapnhpm6Bb2n04ypuwekQ6PqG7+Pp+mrriJDI
 d4w63INIB4OYBc7kGtYZS/1sKyiCioaGE8hNQAmnOYExUZL1n99dDFqnVdeZ7ufZ65TP
 T2yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwjjszKnFPAycmi4kjKo3po/n1lQjtzBYqWMFeTolOcFmVNmW5bzLItQuOV9m8w38UJYMLTO8BMg==@nongnu.org
X-Gm-Message-State: AOJu0YzcQXJ0AXH7OZ/aRzcpOCSbckbmNF5Yjqu5uf/D5wWbTXzLH3w4
 +CF5nw3jnSq68JZqKddJUKMRMCWmwrOES96kYMts9bQ0YFU5Ptqcm74ArhU0EvmhVTNZWYiCqZb
 alIwES66LxylPFvHn175hjsA8Pl7Frr0xC71pItALAeGj7eduYfEtKg==
X-Gm-Gg: ASbGnctngs9z39gMbCTKg4yl2skLXCYg4/ZhXDKfxnQh81rmQdQ4nb7TbVnG69LyTR8
 3jo7dE6eIus/eIfVe3FSfe4A8NCFBdbE2W5XdEV25JsprXXaiUyPZfkETaNOS92LhU5suZC+Jid
 XyENtYECWkJS8E0hLjEq8L6sUc41RiG2YaTz9XC/7ZZ4wMJ9WWseb3T9yi6LDqQ92RdTChIecxo
 5VtfJH/l6SNtLv/nlbGbN+ezZdMGcBEiKZtgm5+wk+rgqrdR8E0biR//Zmoh5tdxV1w8qULwSkx
 sB/RDPed1ZGJqlv8HBiTFm9YDntY5eRj9Kdsh/rFv13+WXTaj+P1qyhWboJSmEAmkBkBww==
X-Received: by 2002:a05:600c:1e8a:b0:453:45f1:9c96 with SMTP id
 5b1f17b1804b1-454db8bf413mr39662325e9.14.1752156604819; 
 Thu, 10 Jul 2025 07:10:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6psRf5P3aN2vGoaXDYQS7IIdKIGys2vxts3vY0vAop44l6lLGzwwi9GjwHLRdCCTUXuK3Qw==
X-Received: by 2002:a05:600c:1e8a:b0:453:45f1:9c96 with SMTP id
 5b1f17b1804b1-454db8bf413mr39661625e9.14.1752156604150; 
 Thu, 10 Jul 2025 07:10:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d511bd78sm61242615e9.35.2025.07.10.07.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 07:10:03 -0700 (PDT)
Message-ID: <322a9301-a1ee-4cd9-b423-fbef2fc0593d@redhat.com>
Date: Thu, 10 Jul 2025 16:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/5] hw/arm/arm_gicv3_kvm: Add a migration blocker with
 kvm nested virt
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, gkulkarni@amperecomputing.com,
 gankulkarni@os.amperecomputing.com
Cc: hi@alyssa.is
References: <20250707164129.1167837-1-eric.auger@redhat.com>
 <20250707164129.1167837-5-eric.auger@redhat.com>
 <48fca85b-096a-4d1c-97dd-380669cb6604@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <48fca85b-096a-4d1c-97dd-380669cb6604@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Te860Mi1nadoq6GFNuIAPNqLRG1zreP7J-j4dNJDDo8_1752156605
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 7/10/25 4:04 PM, Philippe Mathieu-Daudé wrote:
> On 7/7/25 18:40, Eric Auger wrote:
>> We may be miss some NV related GIC register save/restore. Until
>> we complete the study, let's add a migration blocker when the
>> maintenance IRQ is set.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/intc/arm_gicv3_kvm.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
>> index b30aac7aee..fccb3886bf 100644
>> --- a/hw/intc/arm_gicv3_kvm.c
>> +++ b/hw/intc/arm_gicv3_kvm.c
>> @@ -827,8 +827,16 @@ static void kvm_arm_gicv3_realize(DeviceState
>> *dev, Error **errp)
>>       }
>>         if (s->maint_irq) {
>> +        Error *kvm_nv_migration_blocker = NULL;
>>           int ret;
>>   +        error_setg(&kvm_nv_migration_blocker,
>> +                       "Live migration disabled due to KVM nested
>> virt enabled");
>
> (mis-indentation)
Did not notice as checkpatch does not complain.

Eric
>
>> +        if (migrate_add_blocker(&kvm_nv_migration_blocker, errp)) {
>> +            error_free(kvm_nv_migration_blocker);
>> +            return;
>> +        }
>> +
>>           ret = kvm_device_check_attr(s->dev_fd,
>>                                       KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ,
>> 0);
>>           if (!ret) {
>


