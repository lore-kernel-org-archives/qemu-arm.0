Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965A5D340BC
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 16:52:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkmIb-0004Ut-WB; Tue, 27 Jan 2026 11:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vkmIZ-0004UC-Nd
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 11:52:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vkmIX-0001JH-UE
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 11:52:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769532732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rHkHrFUsEzO8KekL6OGYKfzXVNKet8mDOgQIYRfibQI=;
 b=Qi8Gj2kF0T6uGedu62YHViMfwZlqHFQH61zZjAO4fdX23+pClazY1IlG+prKLFNkezWESJ
 02g3+33jbXAXMW+CkimGW9ajVCzougsJXa/x9J5ebG3Y48DYbFFtYBW2VI0lhfb+dLhdf4
 Zd4OMDRVVBblwFYJzDQut2Iwuos52yo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-o7Ex-NJ7PzWKp8NqiIj7gg-1; Tue, 27 Jan 2026 11:52:11 -0500
X-MC-Unique: o7Ex-NJ7PzWKp8NqiIj7gg-1
X-Mimecast-MFC-AGG-ID: o7Ex-NJ7PzWKp8NqiIj7gg_1769532730
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4801d21c280so39824375e9.1
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 08:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769532730; x=1770137530;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rHkHrFUsEzO8KekL6OGYKfzXVNKet8mDOgQIYRfibQI=;
 b=S8TaeXHZ2fUDqL/Pl5TP5FiUcu7Ax218DL5QmIyGashEFOswugRN9Zrw1ojSvTI/Hx
 N9J062c4cupAmyCDvXL9rFBtEUhqH3yS5hfvcDLMITN3VcUZU1vG5LdWOQ9KKTHnkqZy
 yN5GEAL4DAc/3vxIcJQLLm7qLYbg6tR5Hrg5iXr2p0AlUTZ60jYyJTCmLIxEzqyXY27S
 A4HjBROdpEqr3LMvIqya2/mPT2CsiGMzDuw6RnYutAZtY5LewgdZ0ShsFPG+r8jrChAU
 aQ8sWGx3Xy3cfKehbQFWz+2NpJ75Yosqp9iA8p770yoEbi/tAaO8KkVBS7ybUEN6HNAm
 na0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUELwAe9z1QGUmTLpqxu2ZlMzNjWvOka0pkURlgKn2CglYnvkMMc8Mh3+E6D6j9hxdRbstSZGjwAw==@nongnu.org
X-Gm-Message-State: AOJu0YxjmYMssFp3rXmi7g/+ErBFkaFzqquhlScj3Ydjh1DqvHnEtN/9
 HEsU6TpV5EhqxEBfM3ZxrOfFDQ2/ZJRECdsaCUD5lExrpmCzVDnyw5oEMh0OwXprX/Ncd2O7Jxr
 MsTu95bnIWVFuvlnNce8/Db+qnzQE/MyU8OcHt0ZWIdJsP3sGv6dEAw==
X-Gm-Gg: AZuq6aK9zUEtlzfRzcbt1kRHZEyz602TaFw//k8BZE1wvMJEILojKMlHfj4ZJz/D+F2
 WD1yEOLds/bkpAsQYhEgXp4fyEybn7pDq/Mm9AR/ila/ty2dDLr6Z0TbtkSrol6JJK7Iqdqz9zL
 gkejUHqqzeT8eIKoKqmrYgW/87d+NtxR2AF5fpJ8gl2WzT+Dkfzm8bss7yBB2alo4wNJ4TY3UWM
 7eMdm7Aynl3tAxUbocYV+yys5wxx/KZ88MeM1EPdfD+kBiVqHVoIJ807NoZfgFyA+/qoN/2yUiV
 sPmA74Pcv7udOuSlemH6EI6FJJ0vfOz0Rj+nQ6jOGMZj/MEhqXdu0iJc+yQ+qoqeMwfmkvr+egU
 o9NnTO/K/pJPIgjhyUHCaXFH2JKqSKUXZFJM+YNgWA3j/yELg9D6nY9pRzl0=
X-Received: by 2002:a05:600c:3e08:b0:47a:810f:1d06 with SMTP id
 5b1f17b1804b1-48069bfac67mr32498135e9.4.1769532730030; 
 Tue, 27 Jan 2026 08:52:10 -0800 (PST)
X-Received: by 2002:a05:600c:3e08:b0:47a:810f:1d06 with SMTP id
 5b1f17b1804b1-48069bfac67mr32497825e9.4.1769532729551; 
 Tue, 27 Jan 2026 08:52:09 -0800 (PST)
Received: from rh (p200300f6af31d00062ddfb9151537832.dip0.t-ipconnect.de.
 [2003:f6:af31:d000:62dd:fb91:5153:7832])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce564f9sm3852565e9.14.2026.01.27.08.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 08:52:09 -0800 (PST)
Date: Tue, 27 Jan 2026 17:52:07 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>, 
 maz@kernel.org, oliver.upton@linux.dev, gshan@redhat.com, 
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 pbonzini@redhat.com
Subject: Re: [PATCH v6 00/11] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
In-Reply-To: <20260126165445.3033335-1-eric.auger@redhat.com>
Message-ID: <02feaa00-2188-8265-4a65-63fe40270093@redhat.com>
References: <20260126165445.3033335-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d7nPMesX4dArM1DNeNln18JWoYjWanbiRj7ssN1BuVQ_1769532730
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 26 Jan 2026, Eric Auger wrote:

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
>  register from v6.16 onwards. Causes backward migration failure.
> - removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
>  from v6.13 onwards. Causes forward migration failure.
>
> This situation is really problematic for distributions which want to
> guarantee forward and backward migration of a given machine type
> between different releases.
>
> While the series mainly targets KVM acceleration, this problem
> also exists with TCG. For instance some registers may be exposed
> while they shouldn't. Then it is tricky to fix that situation
> without breaking forward migration. An example was provided by
> Peter: 4f2b82f60 ("target/arm: Reinstate bogus AArch32 DBGDTRTX
> register for migration compat).
>
> This series introduces 2 CPU array properties that list
> - the CPU registers to hide from the exposes sysregs (aims
>  at removing registers from the destination)
> - The CPU registers that may not exist but which can be found
>  in the incoming migration stream (aims at ignoring extra
>  registers in the incoming state)
>
> An example is given to illustrate how those props
> could be used to apply compats for machine types supposed to "see" the
> same register set accross various host kernels.
>
> Mitigation of DBGDTRTX issue would be achieved by setting
> x-mig-safe-missing-regs=0x40200000200e0298 which matches
> AArch32 DBGDTRTX register index.
>
> The first patch improves the tracing so that we can quickly detect
> which registers do not match between the incoming stream and the
> exposed sysregs
>

I gave these a spin - works as advertised, no issues found.
Tested-by: Sebastian Ott <sebott@redhat.com>


