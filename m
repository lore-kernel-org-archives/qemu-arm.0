Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8A7CEACEF
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 17:38:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vL3BO-0004jv-90; Mon, 17 Nov 2025 12:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vL3BD-0004dx-8R
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 12:38:19 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vL3BB-0003mc-PU
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 12:38:19 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7895017c722so12335907b3.2
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 09:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763401096; x=1764005896; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g9YMoTHiA8EtV1v/OdAo2noKhbi3CuEHGudADMjDqHc=;
 b=Kw9qCIaaEc7hD5P//kySAh1XMgUF1h5t9r5R/U795g3yrI9ne3wgX/UHQFn863aTzU
 KnToyRE8amOI1Q9ARqLW6Bbd6cBZnzpxsU9VN3VwoshZdJVCHsusGsu6ND75C2rQ2AaW
 T2qNEgHxVqDRMwqIYDWzanpZAPIq2mzIFKiYLtZreW3A8a4W6mZSJDR1TrvmdacyH1Jm
 JMLj6lkJBL5Zp7lFYzEp2h6EgiXYVxAtjefOTwIFsmwekYc7pVKKCAcLHrEebV2DqGbZ
 +U/dD7K1I97zm4NtAj0Jk5kYpjKBkUSoskyL2i4Jz01LB9AQryK3Cn4+bQJoojwO6Fe1
 fXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763401096; x=1764005896;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9YMoTHiA8EtV1v/OdAo2noKhbi3CuEHGudADMjDqHc=;
 b=PbiK3DEFlBDhaTCo3IV1dMBKGYW5zs5TZFC6KwALQzFTR+rodYJ2TNpqDI95L1Ux9P
 3k3X/gG0T8j6H5BTu+/NvDjiDvnW+WhoiNiwNr2a71RQXCP1zXH22ZTORMeMKf6Yev99
 /rQCxxVMsdEbJ+4laFkQYXfFgr/5us9QJbD1coky8dGHDFxMWG9AIMGwl9tq1GFGX6UV
 HO/RuKTN+mmJ2nhlHSVx1pfL/Tfm93MHISakHUMl+dntGZiqawIihh8vjWF9ryl+CxOb
 +KOzZm7G533k5Gx0LiLrvwqYEB24XcHPM0mVOs7N4bLWGlA3BeaZjfJU8DumPzrNRMgf
 s3/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJnBPX23+/TqWV3X8fDv29+oZgkPnw1kZi9NOYI5rgp5WuVJ5Ie/Z6ZKElGukq1hzhjFJN16baNw==@nongnu.org
X-Gm-Message-State: AOJu0YwRUWgKchnBGlnko2kJ6Eb+RK0BQjt5mOFY0ks4NXBpqTQ1bHp0
 oZsL/qUT/dxkyzeeyVEpTqTvIu+brTlgfWU7rMfDsbbDUQ+kyIC7xNf0QC+W4NRhjeMxOws1YRb
 ImVgfL2Csh/z7YkDnMYQ1vtDnpH6zmuxFI1l+DP74WA==
X-Gm-Gg: ASbGncu5WM4kIycGNag1NSL2AuAvJ7EzgJ1DZlG95J4mSJLwbHh1lvZLxB/Vnh0KKnY
 don1GO7T6OHN0cAu1bQMSdDVGhqEBe3gkhAsq7tUE8OWe4MjBLrzELwI51sMJyA0fAbzbVpLDd/
 fP/FO+KNlducdI9wmZlt7RntBELgTtjsiP9xGc0X9EJrAsfjLVan0ocsycmJOCbHuxLYmaxwLbX
 TodrMNmNG4QvdwELlIPeYz1arDxuTgDZFPrc1oh+/iJ6wFHRqand584vnE7UD/8fiVUNxEcqeYS
 bBNXBW0=
X-Google-Smtp-Source: AGHT+IFxkK8+KYZKcY9Pjs9MgQKLdaMetg1TNe+INtQH9bBEsXh56HvYx8e5dWoIylKX3psKDM7T4dAXawjGlHu+pL0=
X-Received: by 2002:a05:690e:191e:b0:641:f5bc:68ce with SMTP id
 956f58d0204a3-641f5bc6daemr6305364d50.75.1763401096399; Mon, 17 Nov 2025
 09:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20251101120130.236721-1-shentey@gmail.com>
 <20251101120130.236721-2-shentey@gmail.com>
 <87v7j8r399.fsf@redhat.com>
In-Reply-To: <87v7j8r399.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Nov 2025 17:38:03 +0000
X-Gm-Features: AWmQ_bmQO4uc0RRaMJHYg4ZU7v5SYNAMNMlLIcfJ2OXnjBa_AH7PuF8uOMjhT3g
Message-ID: <CAFEAcA_XORdwONC2YbVKPois6BLPEr0dFt_QjTHE=UWmiCiv-g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/arm/imx8mp-evk: Add KVM support
To: Cornelia Huck <cohuck@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Mon, 17 Nov 2025 at 17:13, Cornelia Huck <cohuck@redhat.com> wrote:
> Running current master (resp. with this patch applied), I'm getting make
> check failures on an aarch64 (Mt. Snow) host ("qemu-system-aarch64:
> unknown type 'arm-gicv3'" while using this machine); going back right
> before this patch, everything works fine. Haven't tried to debug this
> yet (maybe I'm the one with the weird config again...)

Is this a KVM-only config (no TCG) ?

I think this happens because the KConfig now says
+    depends on TCG || KVM

but because the machine by default doesn't use KVM then
trying to run the machine with no extra arguments falls
over if TCG isn't present.

This thing we put in to handle "creation of the SoC object
via device introspection means it doesn't have an ms->cpu_type
to look at":

+    const char *cpu_type = ms->cpu_type ?: ARM_CPU_TYPE_NAME("cortex-a53");

also probably won't do anything useful under a KVM-only config.

I think the simplest thing here is to put the KConfig back to:

  depends on TCG && AARCH64

People building a KVM-only config almost certainly do not
want this machine type and its devices, because the main
reason to build KVM-only is because you're in the
"virtualization use case" and want to not build in a
load of not-security-supported machine types.

thanks
-- PMM

