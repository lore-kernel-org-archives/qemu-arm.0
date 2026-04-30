Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41377CD13D3
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 19:00:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIWcg-0001x5-9P; Thu, 30 Apr 2026 15:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIWcX-0001pl-Lt
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 15:00:25 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIWcW-0006CD-7A
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 15:00:21 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-651b4d09141so1948406d50.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 12:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777575619; cv=none;
 d=google.com; s=arc-20240605;
 b=S7OuvUA8/5CFSP8QVBCXyQiUIPUPIHmulVOPOKOSG2zrYNN4+iCyarS9/7LSY2UMhX
 s0SjUJ3unbSYBNge5I5URYagRcQGtOoE7FagTPGBQaemfZ/0rDLSs1zZXXaCWBqkYkZa
 4qC2Sq/jPn2cqhMLpQvBgc9ld2m6trOi0Mkybp/QwfgsUUIEdaayNOWOdmF/jbJ9NWBq
 N5yE+nIrcVvnfT/33MPurpjrKtZuxp7BdGe5QUnepS6lpx7JCcXXTOsx0g7v+8/xKFzH
 ZSs/Bve8Myf3SaCzrxwFxWV+cWC6gqGZNarWDEJWV51BfgO3cBQ2lOulHuvKN6ld/dra
 46Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=33PsOdfRzSkdPROcUPsbwRof+hEAHu2aY8Z1kMr6zvs=;
 fh=rg0aCDj36b2my0DyZkuMQaZjiqi1EMNn/JF6zdVBS+w=;
 b=PFsYqNQ/MMO7cl1wTS9wWBfZO9juuERwp4/a+5F8f+1zGx+TEp6olLP4AGlE1DUHfy
 YQLg3KVwjlADOmgmnb5FQgptybyaTm8sxnDu9o8qPibWDoe1EGS0WvLrNQh3m5pXjz9p
 g4KjeeCM9fq+263TbjOq+8GvP3EPifewR7qLlik4I0NByCya5OVKU88QgdUg6Qp0hYrp
 fiGxGGHXl/VH5ZJKsjbw/keJhSXwkcSqjflTjGtmdGPEKPTuHw3FZse2930G66ZwiDcO
 4p/bvoZLZqB7OIrvNznd5muwW9BYvZHFUY0RAk16xGWFiM7ngCHA0wKyZJ7w5zhYS2s1
 /C+A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777575619; x=1778180419; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=33PsOdfRzSkdPROcUPsbwRof+hEAHu2aY8Z1kMr6zvs=;
 b=wfZ5RmLyy1aeg9tydWBBrvlTovPmV85YU6oPfZSp6RgcK2vUr71thVxrq4YpgoTY5V
 herAt3fXnn+oSh8NyDsUdytOWzBEhrrgUAF7yElMwx6Y7DF0jRmk6zlkZqlGfwaCb/Tb
 MaB3XAJ3GICHzN5z0Hwt3buWg/8XNriGn2yIZTgJvZQsqwfAsq0sxp957QR8/5EQeboh
 SyNheuB1C9x2CHESs01B1e5kc1DKq+eCwicAW3LNvy+w5Ea/ldq/PYQqRkle0/HtDV/3
 jRDsDG8jh0H9EUta7S/OEbpEXL2e5XQTnx00T5ZGbbNClIhYPG5qiCauBJb0NYkYb/uK
 hCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777575619; x=1778180419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=33PsOdfRzSkdPROcUPsbwRof+hEAHu2aY8Z1kMr6zvs=;
 b=OXOS0WJAZPrRkENkwL1wQqvzsccF3IImuQsID6iqGzxYQhJS8D14LRfm3BfyFvFgnI
 SFNx7rejllA25204m/BZ+Sa4OtJNOnUBKZillmTcIgzzBNwSnxoK/hklAdlAYXhil+1Z
 98EnbyIm6OFoXs9hJWRM8nTTSBO+jj67SUr8ds9MDzBlK3SpoUxSPrVmSSQMf9n/96qh
 jYxSPDKWYNi2e1JowikPhgOCnLz+yau+FTi53A6JlA3bpa8WLIXBQBl2RnNHAKQalxKl
 1yjLmtoQzryyt5DAkA+xlFyLgHIbf1cCT+nJTk4167CJPaFvraPnBlNQ4Zk7uuNufVoS
 mV9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8OPZgQgb5BEJ982DKeY7E0iMd3vulTQe9qoLuEiSN7ZiQcXEAyVB86hu9ZZixJg3NcUJhXDGQ05A==@nongnu.org
X-Gm-Message-State: AOJu0YyM2oo7Inh5OkITKY/WA8pgkWhFDrlx7ugUFVkEP6k8DD1ooMcX
 7S2rfk9dN+rsdGMvk8pZNxOHv0btofEQzIPzmgBaKK1c5O78hx0R5abnZInoUzChFZsVtAk6RP5
 tyLuasIPoiHgwiwuQ5yHjOLfac0GLdhz8eEbYBW9JnA==
X-Gm-Gg: AeBDievfVgzNAoCnX4frSwq4re8MrGDcV31le3Go7WROkDIrwggAo1hGSGQWDJJl/Mv
 5CvYkvJmFED/b52vC3YMH9NFwcLWzdhZPcr/EbUN0T9efLo23kOlvgtl3hoHDpQd032PGSV5qxm
 fqgSlSEyiWav7DHxRlVzuX+HDn+o8+DRK/sqFnYuqs6UF+5a0+yukB58V/3SS32n2ePe/VjhySN
 KCy9tbtHZHs8VkproJJl0gJP6UHdgjM9sXeWhULXlkDdWgkB8OwdcAhq+ICJ4wGyWVOVh/a/Ono
 P4OYYn3ygkFxJ57ai/bLks3D+MVVMLrqwgpoINs4QaTUxojdWbe90yEtYRF7h5aPRRSSMhdMSw8
 zHQ==
X-Received: by 2002:a05:690e:1207:b0:65c:2dde:1f20 with SMTP id
 956f58d0204a3-65c2dde2dcemr379405d50.22.1777575618555; Thu, 30 Apr 2026
 12:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-features-v1-1-1841b39da7e6@rsg.ci.i.u-tokyo.ac.jp>
 <CAFEAcA9_Sc=+Cn7JiPOo9GjOZFU4KCc7nFVqU=9=QAsNBG6AsQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9_Sc=+Cn7JiPOo9GjOZFU4KCc7nFVqU=9=QAsNBG6AsQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 20:00:05 +0100
X-Gm-Features: AVHnY4IS446GOgig4mj2hWyzIYZXt735BiHhTy8NoMwOpE3wZw3c3RnA8q9fDSc
Message-ID: <CAFEAcA8kk=mUYaqzbqT_C55398SknRUdCmkWKk1ruLMnr=0vOw@mail.gmail.com>
Subject: Re: [PATCH] target/arm/kvm: Cache host CPU probe failure
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 30 Apr 2026 at 14:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 28 Apr 2026 at 09:07, Akihiko Odaki
> <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
> >
> > kvm_arm_set_cpu_features_from_host() does not properly handle host CPU
> > probe failure with caching. The current algorithm can be summarized as
> > follows:
> >
> >     If dtb_compatible is not cached:
> >         If kvm_arm_create_scratch_host_vcpu() fails:
> >             Report failure
> >
> >         Cache dtb_compatible
> >
> >         If getting register values fails:
> >             Report failure
> >
> >     Report success
> >
> > This algorithm has the following problems:
> >
> > - If kvm_arm_create_scratch_host_vcpu() fails, probing may be repeated.
> > - If getting register values fails, later invocations incorrectly report
> >   success.
> >
> > Make two changes to fix them:
> >
> > - Cache dtb_compatible whenever a probe is attempted.
> > - Record probe failure by assigning QEMU_KVM_ARM_TARGET_NONE to
> >   arm_host_cpu_features.target.
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> > ---
> > Supersedes: <20260422-arm-v1-1-106a9a9e22dd@rsg.ci.i.u-tokyo.ac.jp>
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

