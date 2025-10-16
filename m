Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F193ACCD195
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 14:03:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9OZb-0004nE-9f; Thu, 16 Oct 2025 10:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v9OZX-0004l6-Pr
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 10:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v9OZT-000794-1m
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 10:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760623385;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8giGHhG8T5nbIjMPjoC+yK9yQpSqCmuqMYVXVpZhhA=;
 b=gkhDqwmupkgcKdxBy0JTvKItIkesprJrsP+1mXFTBOcmHK1nqR5dXmrF6ET4Peah2ycsxT
 WVjHkWZ0Cawl38vBKLajqLzEy5CYtGeTrUxf1mCoU/u+3KanQGjrJjttM923xgKdmIn9j4
 PB9JVfr/lOJ3vWDzokwrVj1gXNGlVVc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-m9Gp0YFsO26k3swgOsCK9g-1; Thu, 16 Oct 2025 10:03:04 -0400
X-MC-Unique: m9Gp0YFsO26k3swgOsCK9g-1
X-Mimecast-MFC-AGG-ID: m9Gp0YFsO26k3swgOsCK9g_1760623383
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-471144baa6bso2588005e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 07:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760623383; x=1761228183;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t8giGHhG8T5nbIjMPjoC+yK9yQpSqCmuqMYVXVpZhhA=;
 b=RkNL2wct6usayP6zxQqPyD78AbqFA7hx1A221yaX/vNGrU6kwTAmaWqyNpi9zVwF62
 S2JWcVdCKDCX2h57yodX5APngZTOPq5v9HiQNp7TPy+fKGcvqGpqPXQBrDrgx2PDiEgX
 Knv0ZUyz8przpdkLpCdilx+iaDzBXZ36zRiKM6uIwwNQLaQkpIavS7FjZQdVO25TjubP
 IwKHrMZzcRO8KlVSq/CTY5sMLHR+0CcFC8AtInJd/Yiw1Z1Lrnf/m/h6fo4ma123JZtH
 7mQ2StNqrZp56m6d5CBjmYHXHHKHSw7d4Otw2L+U6DEw3W1v3YUJIzlLaMtJtSSY7An2
 QCVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3l2jTezHFqjF4zeWy3TcIJ30nbOmlNs9YQ9OZY3p+MnC5ssz3B91a5IOEDvS74fBFlAvpj5ZMcA==@nongnu.org
X-Gm-Message-State: AOJu0YzMb+oqb0jdIMwBeKp63ZU8fyZAniulmDvlURfto1DFk905J3kC
 ArnapdRtxG6RzKYJjLh39CAcmCsTLQRLhSSpvhW8L1ulu5YDPz/Ynzhf5iP1fyij4ve2I+u7TBA
 ZNTUEqMeSTVDUGHMww0dm5YOR3WY/SspCOnvj7ZAPbP9F1toLGr+UBw==
X-Gm-Gg: ASbGnctJnxIyQhj/H94jmnRM9dmtkphPYDN3qHyuXQPMOO6Wvbk+cLLf+pwARNWfa2I
 7WopVKWhyu6aGo9hlZtRB7DVosGr8/pqUkT2hGZfk11p7fhN05PLCTl1BL9uXuwSug0bvdtSV1e
 9ho6cCtJtH1FVjA2/M90nVj6+YMxJbeN3fB33ok1t6n+SR50D2EBrsfcoB4KZN+njIM95KusLzM
 nzPjPyfIiCJElX3lXT2AJ4k279gbSHY3+Ba+ynuMEh5ZtZwiAFtZ7Ii+r9t1zfyDt6zWdDvNAb/
 oh36yOfQLzWj0BxEB+8fqiMGOER2cmn10+kr6qWWCSTDWEiTDG/ZjB30CyMkqRe0b1vN3RGkg7F
 yQqD4nbgf+7J0BnTI33pN7YcPgekRyz7Tg9IzpStGgU2Eww==
X-Received: by 2002:a05:600c:3544:b0:471:c72:c80b with SMTP id
 5b1f17b1804b1-471178ad7b3mr599665e9.18.1760623382758; 
 Thu, 16 Oct 2025 07:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJrVIC0NiC3D/z9lLru4+1nxANr45HaI5xWg8T/RSKZr4f2v5O4Ms8S+qsCZMRpPTLQqsf9A==
X-Received: by 2002:a05:600c:3544:b0:471:c72:c80b with SMTP id
 5b1f17b1804b1-471178ad7b3mr599375e9.18.1760623382104; 
 Thu, 16 Oct 2025 07:03:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710f289daasm20449135e9.6.2025.10.16.07.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 07:03:01 -0700 (PDT)
Message-ID: <6b07479f-cc69-4b05-bd6b-ef3fa199794a@redhat.com>
Date: Thu, 16 Oct 2025 16:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com,
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
References: <20251016135625.249551-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251016135625.249551-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -B05Vi0GFTX7HHDGC8kf1fpfI_zP0YFv6U4zh9rCC5A_1760623383
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

Hi,

On 10/16/25 3:55 PM, Eric Auger wrote:
> When migrating ARM guests accross same machines with different host
> kernels we are likely to encounter failures such as:
>
> "failed to load cpu:cpreg_vmstate_array_len"
>
> This is due to the fact KVM exposes a different number of registers
> to qemu on source and destination. When trying to migrate a bigger
> register set to a smaller one, qemu cannot save the CPU state.
>
> For example, recently we faced such kind of situations with:
> - unconditionnal exposure of KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW pseudo
>   register from v6.16 onwards. Causes backward migration failure.
> - removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
>   from v6.13 onwards. Causes forward migration failure.
>
> This situation is really problematic for distributions which want to
> guarantee forward and backward migration of a given machine type
> between different releases.
>
> This small series tries to address that issue by introducing CPU
> array properties that list the registers to ignore or to fake according
> to the situation. An example is given to illustrate how those props
> could be used to apply compats for machine types supposed to "see" the
> same register set accross various host kernels.
>
> The first patch improves the tracing so that we can quickly detect
> which registers are unexpected and cause the migration failure. Missing
> registers are also traced. Those do not fail migration but their default
> value is kept on the destination.
>
> Then we introduce the infrastructure to handle 'hidden' registers and
> 'fake' registers.
>
> Eric Auger (7):
>   target/arm/machine: Improve traces on register mismatch during
>     migration
>   target/arm/kvm: Introduce the concept of hidden KVM regs
>   target/arm/kvm: Introduce the concept of enforced/fake registers
>   kvm-all: Add the capability to blacklist some KVM regs
>   target/arm/cpu: Implement hide_reg callback()
>   target/arm/kvm: Expose kvm-hidden-regs and kvm-fake-regs properties
>   hw/arm/virt: [DO NOT UPSTREAM] Enforce compatibility with older
>     kernels
For some reason the last patch was not properly sent
PATCH 7/7] hw/arm/virt: [DO NOT UPSTREAM] Enforce compatibility with
older kernels

got "4.7.1 Service unavailable - try again later"

So I resent. Sorry for the noise.

Eric
>
>  include/hw/core/cpu.h   |  2 ++
>  target/arm/cpu.h        | 42 ++++++++++++++++++++++++
>  accel/kvm/kvm-all.c     | 12 +++++++
>  hw/arm/virt.c           | 19 +++++++++++
>  target/arm/cpu.c        | 12 +++++++
>  target/arm/kvm.c        | 73 ++++++++++++++++++++++++++++++++++++++++-
>  target/arm/machine.c    | 71 +++++++++++++++++++++++++++++++++++----
>  target/arm/trace-events | 11 +++++++
>  8 files changed, 235 insertions(+), 7 deletions(-)
>


