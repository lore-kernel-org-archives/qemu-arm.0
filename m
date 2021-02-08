Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1414293lfc;
        Mon, 8 Feb 2021 10:57:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya4KkFyjnrTVY7amcYfivvN6lhRALreN92Q6huzPcOZbzfhjPWW5Nwv3H8v4rLw6oB764F
X-Received: by 2002:a25:1457:: with SMTP id 84mr28064467ybu.74.1612810653752;
        Mon, 08 Feb 2021 10:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612810653; cv=none;
        d=google.com; s=arc-20160816;
        b=KCgk4kG0p5zrvr61ZcmAtTcdmIl5YrGKPJDFpVLENv5fGkgonm9XaTRARZjASTRQch
         DYQhM+Q1driDx30WdrPoeufmQQ9LzS5ElPDA9eCHFmgRH9di2+Fx9elgJuXM78Zq4Y4P
         ZGpcJLveT/7RDUKxaRyEs6bnzPr0PLAISW/BsD0jSFFLItmskouUUF6b9r82fS6H0ba7
         MbkoEBea59CzO+MjREmkRy5JVZsEogjpvf1NVJmN7lqgdS6aaIbmCq9pd1v2wNx3ZDWB
         DouUqV+Jz13SbpZ9GEFYftmA7VMthmUYQ5pILfPvW74qScrmo1JylCotDOA2XRajnGpG
         T/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VXstIEEQ61Cn4wtGdWUEpZXJMxNohWtfh/1DgCQY5os=;
        b=dcdvkXbinFXRFPtkOiRFlSHviMclN+qympHGpscqUomIlCCIu0yGW7IDRmRtOZPOJ9
         ezPqCYJDdHBkN9UsPEg+fU4MqvQ3rRj19W4tquYz6HkmQcKc+FppY2nit4fzQ3GreK1d
         6/RdviuVy0afQs7Jfmp8wALDRulaF8U6vJ0R5NrIOkMYeCECQ7hdbqrt32AmXvkD9uX4
         kIgNKHfshuWj219vZr6q+huF4keW26ZG0OPPUWaxRzh7WNQf0yccnfgyCK2pwIx7SiNu
         oV8FWwR06L7eUCp5PK5Uf6QPjPjb4V/nb54arZEzCO1UUYYRiiNDAY5LRHTF+/R59HgC
         c/xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vKJK8D4K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si20378529ybn.230.2021.02.08.10.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 10:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vKJK8D4K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9Bj2-00089p-2E
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 13:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l969M-0006id-2T
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:00:29 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9690-00054M-2J
 for qemu-arm@nongnu.org; Mon, 08 Feb 2021 08:00:14 -0500
Received: by mail-ed1-x530.google.com with SMTP id t5so17900667eds.12
 for <qemu-arm@nongnu.org>; Mon, 08 Feb 2021 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VXstIEEQ61Cn4wtGdWUEpZXJMxNohWtfh/1DgCQY5os=;
 b=vKJK8D4KGRf+al1dK10oFdV13lGK/l/b0qIc+JXR0G4DCV989gmnXDg2jx1/EpHxvK
 Ex6zs5iPbFE//jx3TpeeWRkkcypU9wYdutqzGoCDjtfENY0I004aa3Uw5+iSaOfFQIp5
 iCglpJx9+geiLz83Idl7AR33RO25fiHUeUiWZqCN0rv2mAAjkPUzinc/lYXYvTq3n81c
 lMZEsXpIXUc/rah5AVyiVqFs4VoDCtGmeGYQpkBneUCvDKUlAXZHgoz5oM9XuJmf3cxZ
 vm1eCUhAX7nMbg3Wdtcl0y1wX/wTfh2lNRLL8xXY9nUuYpiHk+LqfIlIArptO+TF2+SB
 v/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VXstIEEQ61Cn4wtGdWUEpZXJMxNohWtfh/1DgCQY5os=;
 b=dZzGFmLFGrB57uqId58+Xrl4Gq/UGh9CyJ67K7B8Tk0MsQogmv9n2ewltvi7zohgxV
 niLylsMXdOsiIXBg7AF3lmTT65a485rI80tiViAQ64tKuSGo4TPJTKwjfy0EyDEgLcTw
 cj+sA+lpOk2BKsIbyQ5PUOBmrQvfPpM0C+etIiBLTMgaVxYwgyPswzFAOwnPOzNcCk6V
 yQQVLarp1NsfacBuorXxdT8m2Bq5Opp4lFJ5wA5iHek24CjEt9lqaaR210CpG3Z8WZBH
 LZQ4bQXR16HGfj+dgBWTCv2NHYGpeUIngkweUifxFr993bR7/6L2ArmOA7XhNj5GBPW6
 uGxQ==
X-Gm-Message-State: AOAM5330L8RhGhEpHIpOWK+FOleWUlYX/Aubri4V9BWtMXaNahtAbeE+
 SOxy3tnFeYXdaJLEdIRbZoCZwtrN4OZzhotxZLLijA==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr16916654edd.52.1612789196531; 
 Mon, 08 Feb 2021 04:59:56 -0800 (PST)
MIME-Version: 1.0
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
 <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
 <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
 <CAFEAcA-+dS5r5LvW5DTEH2vBrm1S2rs7sjjh2V7zjtD6ut0wBw@mail.gmail.com>
 <20210205140807.GH477672@toto>
In-Reply-To: <20210205140807.GH477672@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 12:59:45 +0000
Message-ID: <CAFEAcA_W0AhNYs7+9hn1H6B2DL+UnSdhrj2JsBS4vCZ6fEd_pw@mail.gmail.com>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, schspa <schspa@gmail.com>,
 Kevin Zhao <kevin.zhao@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AYff/i8m8Obl

On Fri, 5 Feb 2021 at 14:08, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> I wonder if virtio_mmio_bus_get_dev_path() really should be peeking into
> Sysbus internals mmio[].addr?

Nope, it should not.

> Sysbus mmio[].addr looks like a candidate for removal if we ever get rid
> of the default system_memory...
>
> I don't have any good suggestions how to fix this. I guess we could wrap
> memory_region_add_subregion() with a sysbus version of it that sets
> mmio[].addr but that seems like a step backwards to me.
> Perhaps there's a way fix this in virtio_mmio_bus_get_dev_path()?

I just suggested something on another thread: call memory_region_find()
and then look at the offset_within_address_space field of the returned
MemoryRegionSection. I think that should get you the offset of the
transport within the system address space regardless of how much
use of containers and other oddball mappings are involved. (If the
transport is not mapped into the system address space at all then
you'll get its offset within whatever that other address space is,
but I think we can reasonably ignore that unlikely corner case.)

thanks
-- PMM
