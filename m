Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92EFC44502
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 09:39:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viUgQ-0003Nx-OG; Wed, 21 Jan 2026 04:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1viUgP-0003NE-5O
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 04:39:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1viUgN-0001eI-AJ
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 04:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768988361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2/xT8iPwxVBhXyFiskTxjU+UnFqiORTdZoi4L7IpKI=;
 b=U37TlUUrrP15/sjXyEj2btYruaUPaIGK5UARPapHFfHXp52gxzO1r0sm41eVJiLLkCw49I
 6ggUWFF35VsPYhVgGzxmnEM6Mgf+XpIGF6NOGyQnzC3UZy4W8tlo1d2IGEHbEwgRiknA1n
 mtQ56c/S6dpqTqTdV9p8n5PE7SyJP8I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-KBkjD_x1Mg-RmRHeW6VaYA-1; Wed, 21 Jan 2026 04:39:20 -0500
X-MC-Unique: KBkjD_x1Mg-RmRHeW6VaYA-1
X-Mimecast-MFC-AGG-ID: KBkjD_x1Mg-RmRHeW6VaYA_1768988359
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4804157a3c9so11221085e9.1
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 01:39:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768988359; x=1769593159;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2/xT8iPwxVBhXyFiskTxjU+UnFqiORTdZoi4L7IpKI=;
 b=II1/hEtRdWmz3AEaiN/Bb4tIUM2NiXc1QjEgDSxbNXt0BbtHsnmWp3xIzV7AeQS+4y
 YxsxzG0n74Z0mmvQpyQc0VU7J1EwkWYGYHOeZxuD2WPTzQc/GOr00w6GBmsy8mKA/GMu
 2j/tlaG0hw9TWcMDfTeLShrb6tCWRnoy86yF1F6VXPflW7NcA0zJhjVG8JKlANh53n/j
 3rDJWTTDwsR5Y3RADP7QMLDsZqE1DLhPIT9HVSKeY/o45slf0tGdhx6MGO8HFMg01bEu
 4Opol+WGJ9rzNQH1+5TKoX/6RklIm4pAarDVu4CGwSz5kJJLdneTrviY936zPVoTXmd5
 lZ6g==
X-Gm-Message-State: AOJu0Yy56yXflBf7or2mC7rd3rBbyY7Na4rYwe72UgRxVRChga94YmTF
 jndWeZLfRqc25iX3prvIPNv4F5qpBjsXj6zl2IYGC/DGMXWpcUWXFb0wpCoAIzuIjUFa+4BkbJz
 w+SmE1JORppfwAX3KmofPtxndr+ea8Aun3afvxMrv5oeH5g6IWcBOow==
X-Gm-Gg: AZuq6aK1BfSvIzE2ZLqHHqt6Zp9gfmUeek1Fzxu060mq5Z2ZCXZslin0iNh1IcbUSNy
 IbbeWNixdpr5WM/JGVBEAZ+6tqbMlOjZ+iUFIN0NIC9djn213IXqiNevl/zKnBbHejZwKWGz7w2
 Ejyng7ising2DYUElsIHAKN5BJfliMrnVSHcZth70zp2HHG+9m4/19bCGV6xpgwcMiq71GcOwKn
 JNsnMInBrbzb1h2oqiSi6pxwi7TRJHEhijB6P/QIat67lwwbo0B7HbKRGyqQ91le3cltT3W2d79
 rZUz58bYknHLNzB937e80dFScBwACSR2PcM+DnQroeWdvj5KUiSaqPdO4a6EKt4h/IiPLiSsGMJ
 Zp1KyHA2tRJCwxYULAu4wECtjGyb3+00oI7ZoFYarRiKqMlix5x/Er584jw==
X-Received: by 2002:a05:600c:37c8:b0:47e:e87f:4bba with SMTP id
 5b1f17b1804b1-4801eb0e1cfmr211975305e9.29.1768988358822; 
 Wed, 21 Jan 2026 01:39:18 -0800 (PST)
X-Received: by 2002:a05:600c:37c8:b0:47e:e87f:4bba with SMTP id
 5b1f17b1804b1-4801eb0e1cfmr211974895e9.29.1768988358401; 
 Wed, 21 Jan 2026 01:39:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804245245esm20022655e9.0.2026.01.21.01.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 01:39:17 -0800 (PST)
Message-ID: <5fbdeab4-d8b2-487f-89e6-fb00037e5773@redhat.com>
Date: Wed, 21 Jan 2026 10:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] arm: add kvm-psci-version vcpu property
To: Sebastian Ott <sebott@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20251202160853.22560-1-sebott@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251202160853.22560-1-sebott@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BuQJbKTl4ZLB-1zv2_25xmz8hpUTF-legTPP_2t50eo_1768988359
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.087,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Sebastian,

On 12/2/25 5:08 PM, Sebastian Ott wrote:
> This series adds a vcpu knob to request a specific PSCI version
> from KVM via the KVM_REG_ARM_PSCI_VERSION FW register.
>
> The use case for this is to support migration between host kernels
> that differ in their default (a.k.a. most recent) PSCI version.
>
> Note: in order to support PSCI v0.1 we need to drop vcpu
> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
> Alternatively we could limit support to versions >=0.2 .
>
> Changes since V3 [3]:
> * changed variable name as requested by Eric
> * added R-B
> Changes since V2 [2]:
> * fix kvm_get_psci_version() when the prop is not specified - thanks Eric!
> * removed the assertion in kvm_get_psci_version() so that this also works
>   with a future kernel/psci version
> * added R-B
> Changes since V1 [1]:
> * incorporated feedback from Peter and Eric
>
> [1] https://lore.kernel.org/kvmarm/20250911144923.24259-1-sebott@redhat.com/
> [2] https://lore.kernel.org/kvmarm/20251030165905.73295-1-sebott@redhat.com/
> [3] https://lore.kernel.org/kvmarm/20251112181357.38999-1-sebott@redhat.com/
>
> Sebastian Ott (2):
>   target/arm/kvm: add constants for new PSCI versions
>   target/arm/kvm: add kvm-psci-version vcpu property
>
>  docs/system/arm/cpu-features.rst |  5 +++
>  target/arm/cpu.h                 |  6 +++
>  target/arm/kvm-consts.h          |  2 +
>  target/arm/kvm.c                 | 64 +++++++++++++++++++++++++++++++-
>  4 files changed, 76 insertions(+), 1 deletion(-)
>
Feel free to add my
Tested-by: Eric Auger <eric.auger@redhat.com>

I was able to migrate from a host featuring "KVM: arm64: Add support for
PSCI v1.2 and v1.3" to an "old" one that doesn't using
,kvm-psci-version=1.1

Thanks

Eric


