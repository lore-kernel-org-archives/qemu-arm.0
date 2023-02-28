Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6003553ejc;
        Tue, 28 Feb 2023 09:34:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/qB+mWI6RnO9MXrKYo2UHO9VGj9aU+7VpuFKQFAe6gBWormzSkH0IT6EaBQhCev35E3zBs
X-Received: by 2002:a05:6214:c43:b0:56e:9ab5:cd9f with SMTP id r3-20020a0562140c4300b0056e9ab5cd9fmr6052762qvj.39.1677605695043;
        Tue, 28 Feb 2023 09:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677605695; cv=none;
        d=google.com; s=arc-20160816;
        b=czVM+HJXM0Jv2T+b0MU/Ye0ssQ3mGIU75I2unCLz6K48G0IKf/SkFd/8Ewg0k5L2L6
         q+ratfWi69AWXZZqtQj2vLhSC4b7oT52dYrn3yna4tg63+tpCDSSdIxjpOKrNB7ZiMRi
         uymYGy/N3cBSGTu9rbD3toVIj+h1UCqjB/k5Nm2Riaouf7jMIzxHYxeedUTdf1q7WoBM
         XWJ1MoUpZ8xMEsdQBe1LhJM0q6UnoJB5Nsj0+hd+CVpVgK15nCrcH8n8tpwiSCfFVTGa
         8/KBrsiAuqln9UKy19QG8LN27c9D520jIBMluEVNHd5b1NhrCsPgEEdw/cICulT6illL
         ojAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :in-reply-to:mime-version:references:from:dkim-signature;
        bh=s/AGn97AI8YGBk4aLDSy0vGS4XOOuR9v1pJVC2xh3L4=;
        b=PSRuKyQrxa+swj3R82LvENk+VxLPm2rvMBrRrrKg+IOFAVp/cRH9+KjMDD2D2U3J7R
         IrnB/QtDmGHlYMh0wZevpld1pQjPeSnfOxXr6a6OmPWtg7Te7ZiRdZu/C8DrzldwR/Pg
         6YGzX6UymEn8Hwmk+OXMhle0ntZ+1IwuhBQq5NP5/dVTeuEFpflE6NMLwQCiwk/1/ALL
         XdXJKhF3b8hbqhMOAZqwfBJEZPaDuwUZQZsQTOehU1j527gSHJCxFMlJmiissW59vw4F
         7sLeCwV2hb1T+Q+lU8nwE7/q+KL6UXAbnGb9yPNHa7wM3M2j1eAdxXv721+tGzi0dTJv
         uweg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ej64kDX+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a05620a454e00b0073b83b0eccbsi9920554qkp.296.2023.02.28.09.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Feb 2023 09:34:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ej64kDX+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pX3sJ-0005Bo-MS; Tue, 28 Feb 2023 12:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pX3sH-00051e-Fg
 for qemu-arm@nongnu.org; Tue, 28 Feb 2023 12:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1pX3sF-0000Dq-Hk
 for qemu-arm@nongnu.org; Tue, 28 Feb 2023 12:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677605685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s/AGn97AI8YGBk4aLDSy0vGS4XOOuR9v1pJVC2xh3L4=;
 b=ej64kDX+FjL1zZ6Ozv57pK0sXSJd4YZE/0d+l6tlv+KUIpFiVtdVnqOQJ7kTovLn3Cd9SN
 dM+vBMBnJFQPI454BXvTUTDnOAZS5mxnB/i67WPLdw7YUgVgptwOHr/YOfNtmFzIDQlOpa
 7ZI35KAa5f8WmWsFTyDsQiEcC8XSGyM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-e7HaHu65NkCa6SG-cOUC9A-1; Tue, 28 Feb 2023 12:34:44 -0500
X-MC-Unique: e7HaHu65NkCa6SG-cOUC9A-1
Received: by mail-pj1-f69.google.com with SMTP id
 m18-20020a17090a7f9200b002375a3cbc9bso3234305pjl.9
 for <qemu-arm@nongnu.org>; Tue, 28 Feb 2023 09:34:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s/AGn97AI8YGBk4aLDSy0vGS4XOOuR9v1pJVC2xh3L4=;
 b=TY1MVzwsxtiunNDHIBxnKLGhTIooL0HgkcsmJM/SbHAh7pK+rYqnKT0QiU/xdkpio5
 CCa5upw+WynQh85ltnwep5gAeWcVI/T9pTYg7oLwpXm4w5usnCUgRracMPp6xGMW6WbI
 oKg9xPVBp9M+eiyBV3glMu27iOm2IfzEHFsVYLWLXXMqGep6DnCUgJeRAaMlTWSIsS71
 XfoTkYmNE2kw0LTW+im3d7gEw6tyohjBks/qurl8ckAnpDx8PByAMCn7+6xamsatIu0Y
 M7tmnmmqhOe4rcBKF9Ll8EwIQK/jkwh+32gIiiRgu+etqSYnLbnMRdOkQxmrdsCfYUxx
 tQrQ==
X-Gm-Message-State: AO0yUKWFS9RxjQQ9tknljKcvKg1Dj6Cy/uFhFk+k+CMGchSPIyK19s+6
 2kLUkgZNktuZ4ljALeh6CkDeKQskHVEAzfgAdpPldm6oVHQa3cm3a8EPVsSf44gsnkFWPkcTvXX
 MTMWtYT4RN7C5anfiL9PpUuoHG+y7
X-Received: by 2002:a17:90a:d3ca:b0:237:9cbe:22ad with SMTP id
 d10-20020a17090ad3ca00b002379cbe22admr1447598pjw.5.1677605683449; 
 Tue, 28 Feb 2023 09:34:43 -0800 (PST)
X-Received: by 2002:a17:90a:d3ca:b0:237:9cbe:22ad with SMTP id
 d10-20020a17090ad3ca00b002379cbe22admr1447585pjw.5.1677605683150; Tue, 28 Feb
 2023 09:34:43 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Feb 2023 09:34:42 -0800
From: Andrea Bolognani <abologna@redhat.com>
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230228150216.77912-2-cohuck@redhat.com>
Date: Tue, 28 Feb 2023 09:34:42 -0800
Message-ID: <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5LTA/6++wQu7

On Tue, Feb 28, 2023 at 04:02:15PM +0100, Cornelia Huck wrote:
> Introduce a new cpu feature flag to control MTE support. To preserve
> backwards compatibility for tcg, MTE will continue to be enabled as
> long as tag memory has been provided.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst |  21 ++++++
>  hw/arm/virt.c                    |   2 +-
>  target/arm/cpu.c                 |  18 ++---
>  target/arm/cpu.h                 |   1 +
>  target/arm/cpu64.c               | 110 +++++++++++++++++++++++++++++++
>  target/arm/internals.h           |   1 +
>  target/arm/kvm.c                 |  29 ++++++++
>  target/arm/kvm64.c               |   5 ++
>  target/arm/kvm_arm.h             |  19 ++++++
>  target/arm/monitor.c             |   1 +
>  10 files changed, 194 insertions(+), 13 deletions(-)

I've given a quick look with libvirt integration in mind, and
everything seem fine.

Specifically, MTE is advertised in the output of qom-list-properties
both for max-arm-cpu and the latest virt-X.Y-machine, which means
that libvirt can easily and reliably figure out whether MTE support
is available.

> +MTE CPU Property
> +================
> +
> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> +presence of tag memory (which can be turned on for the ``virt`` machine via
> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> +proper migration support is implemented, enabling MTE will install a migration
> +blocker.

Is it okay to use -machine virt,mte=on unconditionally for both KVM
and TCG guests when MTE support is requested, or will that not work
for the former?

> +If not specified explicitly via ``on`` or ``off``, MTE will be available
> +according to the following rules:
> +
> +* When TCG is used, MTE will be available if and only if tag memory is available;
> +  i.e. it preserves the behaviour prior to the introduction of the feature.
> +
> +* When KVM is used, MTE will default to off, so that migration will not
> +  unintentionally be blocked. This might change in a future QEMU version.

If and when this changes, we should ensure that the new default
behavior doesn't affect existing machine types, otherwise we will
break guest ABI for existing VMs.

-- 
Andrea Bolognani / Red Hat / Virtualization

