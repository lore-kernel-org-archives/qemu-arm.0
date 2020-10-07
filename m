Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp543226lfq;
        Wed, 7 Oct 2020 09:16:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHEXzwUWNs0IlrVRUzgZG+XsX7dCqoRfI/gyMybg+0lHsHnr2lwi/8D7VjuNYk0TJEyGQe
X-Received: by 2002:a25:5507:: with SMTP id j7mr5285334ybb.214.1602087370791;
        Wed, 07 Oct 2020 09:16:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602087370; cv=none;
        d=google.com; s=arc-20160816;
        b=HvSdzTBaIZhK118SaEhTSsyr+RskNqaCBsoLfmZV6wvsYPRwbUTO1pKocrurRA8Uyc
         tuZdjrSBx0qwz3sSicMpL+zYgEAEBbskRm3r9JXnotnehApYiaAWScdYisT1XE8r6Kjs
         K7cCDdpeZaYg8PZ6LQVq5KNzVrdaybXQsYnUVOWRB0thOi6uK8r0bFge4jhsVC1qRHRe
         fW5mQ+/y5wbqcfwuS3Q5rWMcDpaP/0LM/SrceeawmE70wH3KKAgzOErllHW2C9gXj9QI
         hreq9a/W2aX/8mRNJWDEUPI8B6VwzVMYK12fE5ihPqa8B1M6jb5T6d4VovduUSKSophP
         8Aqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7OyP3p/J0BJTuUMR+7M8eSTXEQKQJgp0W9yhB+Uzeec=;
        b=K/LmS1/nF1qvHGeLL5Ol8dAaNqvZbK6UYJiYm/XqDbr+bRiRc7q9909SXmD2HvS9Dq
         q2U5IHmx0k/ny51yzKiYnBvvgvRZmI72KrnAZWK7fiXPSEoG1UX/TWrdSZo764w8FMk4
         Jlo1n3ziEOfRCJ0po3/SCO1QHGNcHqayi28NoHAxXBEsxerBimPUAqs+590ApKhugdxB
         8hz7uyL4wv/0QvTzv4jb50/3ScUf6cK6BSkHD4OefZVSJ5yc7r+d+Sdvi8mwxHy8uYeC
         4w3FjbiiXR/en8QhuwPaAX8P0ptMzW0JQKjjKYFHhXQYtGzuaFViSNzVpRH2Uxljn/wN
         E+WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fpXED4jJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si2133684ybr.155.2020.10.07.09.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 09:16:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fpXED4jJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQC6r-0001iq-Ko
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 12:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQBqH-0003vm-8h
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 11:59:01 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQBqF-0000Zf-Jl
 for qemu-arm@nongnu.org; Wed, 07 Oct 2020 11:59:00 -0400
Received: by mail-ej1-x62f.google.com with SMTP id lw21so3700884ejb.6
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2020 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7OyP3p/J0BJTuUMR+7M8eSTXEQKQJgp0W9yhB+Uzeec=;
 b=fpXED4jJez9o+tGUuQt5fbq3Y9S8FcKGfdeUgSbaOC5TiZBP6wgdmvckuLx2XpdUaL
 m0ZsojOb0ZN+Ce+b3nK/Y/JvkTNGcOqI+AoYsnN5KlCuvEr9PiXLb6yIBYg9G6w23epU
 BuGjICsQSF0Vya6GA0a182kzIo38j5Iz++I4PSzT0tx8YXdcf4TSaD+yqCNInde3dkKT
 ifIKUbjc/1r2UrqxN5Bc/9sm5feBOukGV4B6tf+JxoIEQKprnXLBVOqInUedf9eDWhoX
 +8kVjyOOmKmFH8W3+GYrTUju7zh+GyPzJEc9elOCzTPG5az7lEC/0TRDekaBG5D7ppi6
 lpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OyP3p/J0BJTuUMR+7M8eSTXEQKQJgp0W9yhB+Uzeec=;
 b=Nbo6nT9OVHnE/bOMA/79OjvZTSeGG2044IjWq3czLMD+bNS5cfHuX+G7k35czan+6s
 ws57jEMRDj5ouH4yTaUkPvYPBVabDs0511vR0WtOvcQWj1obi3TRw+hpmJxzaYY7rG3k
 71PTV081pqUxc1RqhuPpfewWX2LqprF7/xhSCmb3EvpCl8O2BdV7mL5OXUgEGreOXqV5
 jhTwA/o8Xlve0Ga5FYaZbsqJrL53pLLfUsoEu1sG4fZhVqxjlkkecGR4KXdOpf+kIp8O
 6UW56ayQ0Q1ribOPuG0CpXHDhbLrwQMOA4ZbMn7SModrHAB8u4/xhogqmv9760Jo/9x+
 pLKw==
X-Gm-Message-State: AOAM5330WCN7n9HRbxRpG55FXbuAfM1eN78d14SohdVh8Mj/Xz3AEMhc
 UiuQgKQTFHXXiyM92Zna8vd9n/d7QGnuFnf848c3QA==
X-Received: by 2002:a17:906:c7d9:: with SMTP id
 dc25mr3999790ejb.482.1602086337977; 
 Wed, 07 Oct 2020 08:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201006220647.GR7303@habkost.net>
 <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
 <20201007130240.GU7303@habkost.net>
 <659289e0-4133-b945-45fd-25e759c18b03@redhat.com>
 <20201007142742.GV7303@habkost.net>
 <117cb090-d9ce-6394-42a2-2ac99fd965b9@redhat.com>
 <20201007155105.GX7303@habkost.net>
In-Reply-To: <20201007155105.GX7303@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Oct 2020 16:58:46 +0100
Message-ID: <CAFEAcA9kaTa0P8g6qzEvGYq8fKqmjquH0+bBbAWLeLaa11ygHA@mail.gmail.com>
Subject: Re: Purpose of QOM properties registered at realize time?
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xvLxd0ikgSaQ

On Wed, 7 Oct 2020 at 16:51, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Right now, I only want to know if the QOM property is part of a
> supported stable external interface.  For the properties
> registered at realize time, the answer seems to be "no".

I don't think that's inherently the case. But most QOM
properties are not going to be part of an external
interface (and definitely those for devices which are
not user-creatable are not), so the chances are good
that any particular QOM property is not external.

> Now, how do I locate the code that depends on those QOM
> properties to work?  When the property name is visible in the
> code, I can grep for the property name.  But I don't know how to
> find users of the GPIOs exposed by qdev_pass_gpios().

GPIOs are wired up with the APIs documented in
hw/qdev-core.h: typically qdev_get_gpio_in() to get
an anonymous GPIO input, qdev_get_gpio_in_named()
for a named GPIO line, similarly qdev_connect_gpio_out()
and qdev_connect_gpio_out_named() for oubound GPIO lines.
Most GPIOs are anonymous because that's the older set
of APIs (and sometimes it's still the simplest). To find
which code is wiring up the GPIOs from a particular
device you're better off searching for the device name,
because different devices can use the same name for a
set of GPIO lines (and lots of devices have anonymous
GPIO lines).

The GPIOs exposed by qdev_pass_gpios() are no different
from those exposed when the device directly creates
its own GPIOs.

thanks
-- PMM
