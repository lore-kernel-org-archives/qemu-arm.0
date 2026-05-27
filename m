Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE701CD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 15:18:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSG1f-0007rV-I9; Wed, 27 May 2026 11:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSG1H-0007lb-1y
 for qemu-arm@nongnu.org; Wed, 27 May 2026 11:18:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSG1F-0008Fm-0W
 for qemu-arm@nongnu.org; Wed, 27 May 2026 11:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779895082;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQvj0wwCTqJ+sGXiLk6kzvtAtH/Avbnj+KF7JOy6SJ4=;
 b=MFm4V3L+GG0s673QnurEUHLjud3Fb6iZz7OzGQ0sLeaLcJkMNt+uidjN42RWEWdgF8yrf8
 gvEgf6KL3kz74n9Sygfxvh4SZ3GAOGb4GSoIRfNdBH3sjJLhBa16H88Prp1+Nu3O+6IyKk
 IrilhpHC3WlC2+3XxfX4+/Vx3CElgy8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-bib9moLDN9OXOyAOCSMaNQ-1; Wed, 27 May 2026 11:18:01 -0400
X-MC-Unique: bib9moLDN9OXOyAOCSMaNQ-1
X-Mimecast-MFC-AGG-ID: bib9moLDN9OXOyAOCSMaNQ_1779895080
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4904ee02e72so40071725e9.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 08:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779895080; x=1780499880;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sQvj0wwCTqJ+sGXiLk6kzvtAtH/Avbnj+KF7JOy6SJ4=;
 b=TTsbXT2q7hFQbVBWy896DQEC43goCDH0rxPOY7wlUjGu/lU2YMdqvgIZ3ujIltUDdg
 4qnx29AYevLDnjb9oGHV3hLzOxXovzv1bgd5ingTEABUQ/ITJNiQUgmuH0/DOX8canVn
 lYElCp1m9qZDEOOI23G6cBb6FXBL96cqpmR49U01NpKWLBMoCpFpo4HQDpilRtUhxcM8
 HO9msmMUO8FImLydM40f+4Hb02chDvj5ThC6wUhOICStsDOZyvcuuVSDq+ZSxQHZTdN1
 e2f+Cc7SXo0WoQSqUm+ZM2/db4vc/19iZ+eWQqMXDx7wuxM4FYXzKl4u93k/EWVpxSi0
 3yyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/zwEQxYaogec5h1FCNjc5/7Z9COVY5F9B/17j4xZ6vANAuSN1s+gvRH5X6N/lkr5PAdtQzwzSgjQ==@nongnu.org
X-Gm-Message-State: AOJu0YzAyLr1WNUSW5x274XDjVPb314ykPCa/6V8GEPyVKJwQ3fXNNEg
 rhHxfn2A6cbKBcJohTdmNrrQ7SEiunxW3sV0nrWG7TMHvQxTZaWbzi3AGewnzYJ3+hPkOZcthxE
 KtEuDpLBg7s+EX3BhzyJW7N7Y6asrVlNM0D7z5Fqh7ahtB8olXHfGrg==
X-Gm-Gg: Acq92OFbFoyZjN9slbd6zg/SBtc4Xb/0xnfdcubqhATzD5gKT4RzdScXeqW6s89vucQ
 jOi9vJ/p6CF4e86BWFENxWbeW3xRuH5bdHZvfjL2xrFHUjwUWOX06hZL4NZRztK1PD1uhWkX9ny
 zQlps4vcNb/cljn8HizgI2EPkbXZwN2J9Msp3a+B2s0nOffibllV2Wbotv8Xzl42oOah2Ha+1V2
 CXzJo8WCFf8IIWLoenqrXQ+v3O8LtEICHpaPyaTNHiAAmNgjYB/zcXPL32FZYcGN24I2FMJoToO
 Vv0YoSgrBGR4pvJgs9wGdFC8DgukcNsYwBOweZjcZ6G+jyC26NbtpQsLpREqBFHhIWXvZ0W5q9L
 G8niqOPcIbs7nrOfVnm1iEqf3iXQhGZpL91rVRS1pRVlnfMIC2bZYH94Vv5DcUBHEzbNMIEvWo8
 F3H8fS
X-Received: by 2002:a05:600c:474a:b0:490:51e2:d992 with SMTP id
 5b1f17b1804b1-49051e2daa6mr324911275e9.13.1779895079658; 
 Wed, 27 May 2026 08:17:59 -0700 (PDT)
X-Received: by 2002:a05:600c:474a:b0:490:51e2:d992 with SMTP id
 5b1f17b1804b1-49051e2daa6mr324910655e9.13.1779895079227; 
 Wed, 27 May 2026 08:17:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb549e79sm7283945f8f.7.2026.05.27.08.17.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 08:17:58 -0700 (PDT)
Message-ID: <bd69090f-856e-4996-a310-bac0456b1bca@redhat.com>
Date: Wed, 27 May 2026 17:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/18] target/arm/cpu64: Retrieve writable ID reg map
 in aarch64_host_initfn()
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-11-eric.auger@redhat.com>
 <5A95F33A-5FAA-4292-A8AA-9AA20B508A13@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <5A95F33A-5FAA-4292-A8AA-9AA20B508A13@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UDntT7o20WKkgbuLTj9NPw7rxfRMj-Yw0nbOv68s1Q0_1779895080
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/27/26 4:54 PM, Khushit Shah wrote:
>
>> On 19 May 2026, at 6:57 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> +
>> +    cpu->writable_map = g_new(uint64_t, KVM_ARM_FEATURE_ID_RANGE_SIZE);
>> +
>> +    ret = kvm_arm_get_writable_id_regs(cpu->writable_map);
>> +    if (ret) {
>> +        g_free(cpu->writable_map);
>> +        cpu->writable_map = NULL;
>> +    }
> I feel it should not be in ARMCPU state. The is a KVM property, which does not
> change for a given kernel version.

in cpu.h struct ArchCPU there are other KVM specific flags
See    /* KVM CPU state */

I agree we can eventually copy the result in ID reg structs but I am not
sure what is the best

Thanks

Eric
>
> Warm Regards,
> Khushit


