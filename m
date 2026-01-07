Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A68CFD64D
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Jan 2026 15:02:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdV3K-0005o8-La; Wed, 07 Jan 2026 10:02:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vdV38-0005ci-GP
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 10:02:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vdV34-0004E3-QF
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 10:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767798128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qeBwb+kuS1vGN4hNmbg6q1OvpiRwNvKrctJpX+axwLI=;
 b=ge+yu3M5ihrx+ptQgJCk2QaZGK50bJoq28tqi9hP5SU/Aeixw0U8HVzTbkUONBz7qiSxnU
 BQ7NqewyOFNUZH8VXprLp2hIBmBUQWwX3/kUttopg9JzMuMJeTvp468CAwAZRe1TP67mQG
 j8tlY5GxQNQkA9SANyOiFPKqmllSpFQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-YkbgH7P6POaWXZ-CBi7oEA-1; Wed, 07 Jan 2026 10:02:07 -0500
X-MC-Unique: YkbgH7P6POaWXZ-CBi7oEA-1
X-Mimecast-MFC-AGG-ID: YkbgH7P6POaWXZ-CBi7oEA_1767798126
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-430f57cd2caso1779772f8f.0
 for <qemu-arm@nongnu.org>; Wed, 07 Jan 2026 07:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767798126; x=1768402926;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qeBwb+kuS1vGN4hNmbg6q1OvpiRwNvKrctJpX+axwLI=;
 b=YqXiJlG3PbgFQQMeb7ciyFadlMJjyKFzP+gqB5wZfb3ClwRYA/tGuvs7whKmX7Ht9P
 gFXZzJqKh2Il7Xx/kmZA7uUSGq7xDj1v9AdbgdR3sxt/Xfbh8Txj+GEiW6aBjwNWRGmY
 tD38ndV4//YgIQeqOozC494LXOCQy6Hv8vaYouzHtUW1Lt2QYbpAVytTh1Q0ZRBQhmn/
 a8UzyBKGkJykCk3AOTC4+0ncybYfnPb5Q8WojnYGFVG33kPvx3uWCS63W4Jr9qUOi5nY
 UczO/Z28MMgG1FlAzGkYvosyFUUZYa0pvdVWBJdQmzdmX7eOy2MtNoFC3tHN+zTbvzYG
 3vgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOyW4SyuILCxfpajqaNNn3gYwDhHL2AoJ4JFAVC3r8FvOtbkQvTC8ItOgTJP0pOnGecNVSF5JLiw==@nongnu.org
X-Gm-Message-State: AOJu0YzxjUBtplrKTKCyoKkyfWCIYIOzjEP3UmaH2GTay8rezJ5j357M
 fhDKgYjD2DNwsjynjIzY8ns+I3wPvJ3XXhkaucaWH9IUPaK5QL/+BkNb2xPSqJ79eKYolN2kJ/2
 E5NdxQrKKlkb4TDLXsZpbrdDwv+01hyxWuaMNq+z1oaCpUUtDfbE33Q==
X-Gm-Gg: AY/fxX57QhJ5CumLydsNLkzQU0wqbkzNQbY4f+L+UkVDL869Hu69O6xZI/yyLJxpo4T
 AzseSyhTPYW3cmWsrBSWH/GZHRHwzHoYk3hC2lXWLYudL2dpeBfIrOIFcVOjIcp+G57y5Uv9W9i
 tz2+SGeSPZUHFD8h0ltiji4mwuZ982Luy8sV6Vpci8HUQZoVGt68hU3ycMkF6ain/52FTR3LUo0
 VyP9JafprqqsZuh7W/P0tWFK+U5ceWldqU9v7S0ZR1YvDpzl7gO+KwQMNDFnHPF/oOLn+S7MHyj
 Se7L4K7NxGSzd98SNGmNSI91hdnA2sPObrbzr68izNpUd+mcjVVUKTkj4DNIYe1F478cp6LsKRW
 eh8wvjlmWQSg25tAIk+mLPc6mbet5NLadMOzXyjiV8io8mTgSO7IaGrWZ4P0=
X-Received: by 2002:a5d:5f90:0:b0:430:f850:9444 with SMTP id
 ffacd0b85a97d-432c374f1d2mr3161582f8f.1.1767798126204; 
 Wed, 07 Jan 2026 07:02:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBmdQhqp+FLDyTZWB+uFq5MCD/34Q2HeOUWX7Gz/cjyhsgKrTiczCbjYz2QKCTqlnIRmwNWw==
X-Received: by 2002:a5d:5f90:0:b0:430:f850:9444 with SMTP id
 ffacd0b85a97d-432c374f1d2mr3161522f8f.1.1767798125553; 
 Wed, 07 Jan 2026 07:02:05 -0800 (PST)
Received: from rh (p200300f6af1b9500f87ca516798197a2.dip0.t-ipconnect.de.
 [2003:f6:af1b:9500:f87c:a516:7981:97a2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e17aasm11057480f8f.15.2026.01.07.07.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 07:02:05 -0800 (PST)
Date: Wed, 7 Jan 2026 16:02:03 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org, 
 oliver.upton@linux.dev, gshan@redhat.com, ddutile@redhat.com, 
 peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v4 00/10] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
In-Reply-To: <20251222134110.3649287-1-eric.auger@redhat.com>
Message-ID: <efc862fb-d393-67a7-672d-9f6cfd2ed3a9@redhat.com>
References: <20251222134110.3649287-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HzRJoI4XE0W2BZ92jiAN7iBKH5BzC5HilPbvYgMUKvU_1767798126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Hey Eric,

On Mon, 22 Dec 2025, Eric Auger wrote:
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
> Mitigation of DBGDTRTX issue would be achived by setting
> x-mig-safe-missing-regs=0x40200000200e0298 which matches
> AArch32 DBGDTRTX register index.
>
> The first patch improves the tracing so that we can quickly detect
> which registers do not match between the incoming stream and the
> exposed sysregs
>

I've played around with these and for virt-10.1 I get:
./build/qemu-system-aarch64 -M virt-10.1 [...]
Unexpected error in set_prop_array() at ../hw/core/qdev-properties.c:717:
qemu-system-aarch64: can't apply global arm-cpu.x-mig-safe-missing-regs=0x603000000013c103, 0x603000000013c512, 0x603000000013c513: array size property x-mig-safe-missing-regs may not be set more than once
Aborted (core dumped)

Is it possible to aggregate these, when there are compats at more than
one level?

Sebastian


