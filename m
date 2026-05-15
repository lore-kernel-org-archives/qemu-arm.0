Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218E4CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 15:47:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNukc-0002qR-I1; Fri, 15 May 2026 11:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNuka-0002q2-RV
 for qemu-arm@nongnu.org; Fri, 15 May 2026 11:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wNukZ-0005fl-C5
 for qemu-arm@nongnu.org; Fri, 15 May 2026 11:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778860012;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvOUScZZ/Xv4TAXhr6Aj3DCRwHhk5SYpQlDYhFoqcQE=;
 b=hIecpRQskD0Ublyhw7GM3bvRhhyGsvzd27QIRd6uwK2KU72UZNn5DpIptrzjOm1UaAdCxO
 dOtzYVRqQCBP2E++JEJ3qx/fVoIt3OoQvWl8zBcyjdHhq4PTc2G+SHZdsNSJ03AVLZLF22
 xPturAyJNgerT0D+BMvTlhyMdKnXx1M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-Qldr9kdFMpKhvSaNotnN3A-1; Fri, 15 May 2026 11:46:51 -0400
X-MC-Unique: Qldr9kdFMpKhvSaNotnN3A-1
X-Mimecast-MFC-AGG-ID: Qldr9kdFMpKhvSaNotnN3A_1778860010
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48fd3dbd16aso25388095e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 08:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778860010; x=1779464810;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YvOUScZZ/Xv4TAXhr6Aj3DCRwHhk5SYpQlDYhFoqcQE=;
 b=SAbY1a3wlsA2Iea1XPSF/E47dzC6UindnjK2BCDoazm2O20IDor0dXTvKEEuVg0Z7d
 UPFThZNZv1r55Ii0C4HQtzUGTh6mx1sNfUPF5PSgxSFNbFv8BSZ5j5jESO/6qQY6IA2u
 g1krJLajkFca1W9yxiOBRyq7tuRKbDAduGK53nd5L7yBXsz3EhoQkEve1AAEPEjTZeaa
 uUHiW5sMR012JAN6bxfMey+UQceZTGggwtpMHGWIZBoJr3+JbnM4f3k19+ZaXnT6UtLN
 HF9v1zpm5SyAg4Wz7iUuXL31REU6s9k2Hw72Jg3tbnI77SRxWwAZInJia/Wu5cKQlJvb
 UPnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ972nW64k3UlKCtmA4mK3JXjRdmhybt2Ci8LIxjtBTGrqevYodwUSGUQmb9Pz8lcVaGPcC6rLNuHQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw6s9zaKFcQkzoCpLTE61SBkO5t3m6Wh1kIzgLGvMQfQebDF+wh
 KIGDslHH737Gxsb8hObx85rYvm98IAKSl5/0/miCdRcHGRrU4deYRr7drgpWOVVfP1Ls3qterBD
 YL0viSP2dI7dnSFYd/bReZ9DKBlxT3Iga2QJQGiQbbfsbbtsUn5Y19g==
X-Gm-Gg: Acq92OEF1a0j2NySn6ehj6oqyxbiSiAySbuRnrRwDjktkTyRoBw0h8ZBD57tHQaVMdF
 pboxRwY4k3/wrQkSyogim35SRdNiFUr8KhLb5FzYvZ2TA8Oogfr61yx0//0hjYIXxU/3HZzBNOi
 3Pb8+YKXDtAt+J3xEP3dRqC9rrirof1M7o/WS6W73bNHOy2osHpl+BVSCjtbsMUM3CRM2ywrwBK
 /ayARAuC2kALT/FC3m/0N7dz8aLxRXgGvM7aZ0iv7rilt/2/vm5Rur+JTTj99CB1zahCIZ8lZ/1
 seaqrhmvjAanc2pS5+ElVdvE3B/Kseh8ehAHG+gg8Oa+GfCQyuanyQk0PDMg1X+cRzk/eEJ6brG
 KcgrUbUM6ujxe6XDgAa55oaRTqruh5Tr6hfIYvsmQH7ZQUkS7YAD6ym1UG7dwK8O/geF7qg==
X-Received: by 2002:a05:600c:8189:b0:488:ac01:72b6 with SMTP id
 5b1f17b1804b1-48fe6323addmr69927715e9.21.1778860010030; 
 Fri, 15 May 2026 08:46:50 -0700 (PDT)
X-Received: by 2002:a05:600c:8189:b0:488:ac01:72b6 with SMTP id
 5b1f17b1804b1-48fe6323addmr69927295e9.21.1778860009715; 
 Fri, 15 May 2026 08:46:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec39ff1sm15937194f8f.10.2026.05.15.08.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 08:46:49 -0700 (PDT)
Message-ID: <338ec6f3-499f-4232-9049-17118209c05f@redhat.com>
Date: Fri, 15 May 2026 17:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 05/13] target/arm: named_cpu_model: replace FIELD
 macro with IDREG_FIELD
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: Shaju Abraham <shaju.abraham@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Prerna Saxena <prerna.saxena@nutanix.com>, Jon Kohler <jon@nutanix.com>,
 Jonathan Davies <jond@nutanix.com>
References: <20260513163356.3033159-1-shaju.abraham@nutanix.com>
 <20260513163356.3033159-6-shaju.abraham@nutanix.com>
 <2a1eb06f-1293-4d6a-8354-445891ba36ec@redhat.com>
 <A84C8759-6EF8-4DFA-B5C5-A4381022F81C@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <A84C8759-6EF8-4DFA-B5C5-A4381022F81C@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3pEcv0XTYrpYJNEbl4OYMeFP_M-NvDbQr6Bpulvq5rE_1778860010
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/15/26 5:36 PM, Khushit Shah wrote:
>
>> On 15 May 2026, at 8:58 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> MIDR_EL1 is also described in 
>>
>> target/arm/cpu-idregs.h.inc 
>> so it could be removed I guess. Please check others
> I do not see MIDR_EL1 in cpu.h, both MIDR and REVIDR are
> maintained separately in ArchCPU struct and are not in cpu.isar->idregs[] (or is duplicated).
it is defined in cpu-features.h just after CTR_EL0

Eric
>
> Warm Regards, 
> Khushit


