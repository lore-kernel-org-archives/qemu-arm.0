Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4518694wrm;
        Mon, 21 Oct 2019 05:37:10 -0700 (PDT)
X-Received: by 2002:aca:7543:: with SMTP id q64mr19321228oic.95.1571661430556;
        Mon, 21 Oct 2019 05:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571661430; cv=none;
        d=google.com; s=arc-20160816;
        b=nwga9C4RNMFy/3cOaG9TjqmJVKmstIOe1uB2p7jFND8brkB+o9YEpBkg2ZsoOHgghp
         x8Lp2M/vfa4E/rNSlD1nNnXcO1VaWqPAhUnn6TgXQvIryXpbGr8jcnoGLv1SAoHTPAFu
         PAF2D54TZMbPn7BudivXol6AZeNRGEYa/ObmEVtBRZSq26kzQ55ieDb6rd7LuGv0Qgx5
         GfYGGq2mEez7KnxZUj8l4VQodX58KTGo+yPc42dBpnX3bV9AKGsSnMv5OhkxkYwjU7L6
         1dBN01Gl07S53m2xBQ93xXpQpGubtFrp9MIfHsUFNOaIfyC917UEMI3eHPORKqz85uzc
         drmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mm5TGvUKEhtuKejBNL05RY4Uqnb5TiQAHsOfYFLXK2U=;
        b=UYLPA/z2QfoIpU5LNu6/cdzd4ux2vISWg2R9TnUi/Can3KrGH8Sz8+T+pset7Tl8VI
         7zVFByjg4R0IbsV2WC+Tzk6/omJMdgGNXFoZhLd3ndG9IX4gplqQaW2RwkKZd4iFC3zK
         HsRGeyDWC6Dkb/kMDJ0j02hRmw0xMzS0zRbRx4YFZ22h370YacrrumpmXWvFcpPzf6FK
         Ja3I2z+mawqxPw5fFjKIxGpRdUxBqcjGym1aTJoxQzFJopcaIJvejHZM+FS3Usp7+x51
         5GW1KkIzl/pS7aBCsHeiyVj0kuAq91R/ZQhoSyYd81DfMJCFFXk9KW8GqWgnW9X1c2cF
         2ykQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nUYyULkr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m5sor7233410otp.33.2019.10.21.05.37.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Oct 2019 05:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nUYyULkr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mm5TGvUKEhtuKejBNL05RY4Uqnb5TiQAHsOfYFLXK2U=;
        b=nUYyULkrXAPihD8Q+0e47s3J+HadPwbcIBqxTAwtEThHUPtGhcxPqBRiUrrEC2CsYc
         MEf8XlgvWmxtgBH3jC3evESx3/93CqT73q6I9fQtEPWrOx+RRttOrymPsLZNKncgIVmD
         oARUaANgkwYcCa18XEh9fDIvsUU8LnJId/58LP843k6CR2x/NyRnVhGPexE2oXK60pA4
         CP+5pHUR/cnChMPnurHOfO8ncKjXbkRlbd0VUaocYCn7qMxuUYn281lw+XWBK1zh2B7G
         lpkqz/zQdUR3/Gc58GSvRbCVfkGi/678B/YaCczAwLadJTxBfG+Ll4X22BJ+tCBGcS6Q
         wMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mm5TGvUKEhtuKejBNL05RY4Uqnb5TiQAHsOfYFLXK2U=;
        b=TfYVkrXczgjuBWdpPPt5zQiIeahpbdPn3GneECwrOP7i8SG3Alcvq6DJxiHPS/2z3Q
         m89tANWhhm0FEQNLEajDD7evM4+fFKChOHmv8Sq0ruQZE0oKoA6mXjfPekHlMP+ZvBa5
         UXfQHSgbSJmhFMt/au4p0/wEILoNLnCNPK0L+23XyluZ0on1Y1eITKfqpu8g1IJyuyUD
         9HOCco0KBiJr1wA2NxlaQURz1zYufDHY8zGxfh55OysWehanekjRSWLyqrAjcp/MvwaG
         Msf1baFlUT9mx+hMoNvKMZyK2hPXlpX1PHEasrHoxZ7X0V8a2NvXia592pdQuvjR5Wqg
         zTJg==
X-Gm-Message-State: APjAAAVfoGy8FGrP59Y2R6dpErEjxOAZ6ehNReaaiKAze0fP0BPoVQK1
	UcPYkaHg/wZNOcQUaj/tu20v70VL5n0SKRnSZJ8h4Z6x
X-Google-Smtp-Source: APXvYqzmRgilBJ2MK2CBZgcGYx+z/mLsUolk1WCKxIcgUOhpz1zhsJ9f+ynBAsyE65y+a0ZlWBKJS1YstnDb9Ik6RS0=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr8079621otj.135.1571661430117;
 Mon, 21 Oct 2019 05:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085408.24360-1-drjones@redhat.com>
In-Reply-To: <20191016085408.24360-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 13:36:58 +0100
Message-ID: <CAFEAcA8pV5batrPk+J6RLU2rv9SNAmL8JS9Kd9tWP3pD-m29eA@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Dave P Martin <Dave.Martin@arm.com>, Eric Auger <eric.auger@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: EqPYCgJ3Ichz

On Wed, 16 Oct 2019 at 09:54, Andrew Jones <drjones@redhat.com> wrote:
>
> Since Linux kernel v5.2-rc1 KVM has support for enabling SVE in guests.
> This series provides the QEMU bits for that enablement. First, we
> select existing CPU properties representing features we want to
> advertise in addition to the SVE vector lengths and prepare
> them for a qmp query. Then we introduce the qmp query, applying
> it immediately to those selected features. We also document ARM CPU
> features at this time. We next add a qtest for the selected CPU
> features that uses the qmp query for its tests - and we continue to
> add tests as we add CPU features with the following patches. So then,
> once we have the support we need for CPU feature querying and testing,
> we add our first SVE CPU feature property, 'sve', which just allows
> SVE to be completely enabled/disabled. Following that feature property,
> we add all 16 vector length properties along with the input validation
> they need and tests to prove the validation works. At this point the
> SVE features are still only for TCG, so we provide some patches to
> prepare for KVM and then a patch that allows the 'max' CPU type to
> enable SVE with KVM, but at first without vector length properties.
> After a bit more preparation we add the SVE vector length properties
> to the KVM-enabled 'max' CPU type along with the additional input
> validation and tests that that needs.  Finally we allow the 'host'
> CPU type to also enjoy these properties by simply sharing them with it.

This fails 'make check' on an aarch32 box with KVM support:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm QTEST_QEMU_IMG=qemu-img
tests/arm-cpu-features -m=quick -k --tap < /dev/null |
./scripts/tap-driver.pl --test-name="arm-cpu-features"
PASS 1 arm-cpu-features /arm/arm/query-cpu-model-expansion
**
ERROR:/home/pm215/qemu/tests/arm-cpu-features.c:420:test_query_cpu_model_expansion_kvm:
assertion failed: (resp_has_props(_resp))
Aborted
ERROR - too few tests run (expected 2, got 1)
/home/pm215/qemu/tests/Makefile.include:902: recipe for target
'check-qtest-arm' failed
make: *** [check-qtest-arm] Error 1
make: Leaving directory '/home/pm215/qemu/build/arm'

thanks
-- PMM
