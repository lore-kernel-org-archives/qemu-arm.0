Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp2628686lfp;
        Wed, 20 Jul 2022 06:28:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tq/izvXtldLPcsnWvzVQDGfQaOPiGFzxjXtP8XsxNzgt58naWiWr6nLzMOZCm6REeadVLy
X-Received: by 2002:a05:6214:5181:b0:473:1a26:99f6 with SMTP id kl1-20020a056214518100b004731a2699f6mr29015890qvb.47.1658323710113;
        Wed, 20 Jul 2022 06:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658323710; cv=none;
        d=google.com; s=arc-20160816;
        b=HrdAk/OHx18Fb2a9dzs2HXe5xdNXX0BmYuVGoc0lfOGzepLnDijHJ2PeNE52MNtZC8
         KtAU4sdAkJXN5E7uQgcKu52SAuD7Qb5kT+FJAXnH4Wl/kx3khMYtBHhi//SPYa80SeKv
         7fIY9wjOrSV0Aw/vpMWiT29gNNqdoIlTz9VGvwXYqxrRDhFt0Ze0vVxbsFQYQFkfZnMi
         lFWahc6xf2Hq2pi8dfHUPjmIPGI1yGb4tRyAqwv+Iqs4fh7Cotpu7jahda/fbpgpr8QE
         K7SgdT3MLAstQs9fB9erAMGx5fUgAdDyhYMZ9tRKJHnqYtsWmt8/0M7+qisgA6d47kL8
         ChjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=N46Nlyr5egsj9AHUlvY1xdDDhpVHZYaFyU1Qrdnh5VM=;
        b=GOuhdce6RlJbFR34/Ky7hIu57P37iiHCMe8rE7VxeTaajg4AKNwE+gf47R9+XZLop1
         FX4L89n/2CsPeoHTWVNO9sAdpt3JkRoIZnfJ8/NXFFkVbhiLtsHp42OTkV4v6uxQUV2v
         htDJ6h9Zv+o6SPftr8LsGPO/bURAoVCCQwe9H0pGx9vnBvLZbHp65/9i7WUWvqry6xys
         COoCkuNWs6SAc7BLd4ePdsJiiga/kvnOEaPrjgDZmYDFvaV1gr963OdjgEHg0hpgF+1v
         w3hjoOUlEWWaWYA2qigOpq8JMwNlolu3duRneyp3YzlrOMikiDMElhIz2OVsZ4JGYQvy
         snlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQ0bRhnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2-20020a05620a0d4200b006b5826a79f4si8062908qkl.346.2022.07.20.06.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jul 2022 06:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQ0bRhnE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oE9kb-0004aL-LL
	for alex.bennee@linaro.org; Wed, 20 Jul 2022 09:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE9bG-0004Zc-A2
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 09:18:50 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oE9bE-0007tv-Ow
 for qemu-arm@nongnu.org; Wed, 20 Jul 2022 09:18:49 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id r3so32045541ybr.6
 for <qemu-arm@nongnu.org>; Wed, 20 Jul 2022 06:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N46Nlyr5egsj9AHUlvY1xdDDhpVHZYaFyU1Qrdnh5VM=;
 b=WQ0bRhnEth2fziOp/kCOJ8s60kgj8avz2qxRLs3ZUy+fSnzTI/332TEBJ/JSqEyTPd
 zQCL06SWhTRIpPK9hpQGoywxdrtoMELAbrxBS35oBQd15Sj6GK9MF8IwI4GLcAeBt/Ql
 tdBWHgr4PTVP0BIgx/IbT7IvhV8MF3D9jY0VMDqu2/VvtVSfw1WJA2RPK6sKIkpPc0E2
 LRnB4vtbn4YwdRfwpj+cU4+3mHoD1dqByQz9Tmu4KVFYAr0VCP9Oc48k16EVOWW6WV0c
 R4gw27/ABzRn20GVeeExC0/R90edBvu/+ZeVOa6BulteVxiRoLqHJV9qMoR1DTdOcqI0
 QjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N46Nlyr5egsj9AHUlvY1xdDDhpVHZYaFyU1Qrdnh5VM=;
 b=yD8dtAJe7nLu//BOw+DbqJGi6PyszHiFQiyIiirsSv0WL1BrgwIBrn0u3z4iFkWNBl
 dnQaOd2eaNOHyIbwAyBuSOMOZmsnVQosSSe8xaQ4akFJs0464JxAAqFb+MtbAh+p1UHW
 UKIhludL/FyE7w5Rps3d7WG8Z+Fyn4w+sXwfUKES25thblLH9luAfdPI1vJFkQHrg2F8
 c8xUNaV0Ehmfph5uO53Kk1AkYThLoaUnxwnjEXp6a8ZaR7CKxqe8UsYPsEjnR7+VYx4X
 FIL7omJ/eEhEgXzoylFUwRFYPyxaNaPt8AAiUElzHsKK7/ZxHxhrc2fjB5+nFnWZBKbq
 kE0A==
X-Gm-Message-State: AJIora/2+SGsAdbwwEprcJIgraNwdDErBLXvThQQjNWbIAfTRR81bMVz
 k5gzVrWeQcCXVWI1XfNTbIobpM3o2iLNxXNQg8kEvQ==
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr38972913ybj.479.1658323127451; Wed, 20
 Jul 2022 06:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
In-Reply-To: <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 14:18:36 +0100
Message-ID: <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b6T6xPprFWYL

On Wed, 20 Jul 2022 at 13:55, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Hi Peter,
>
> thank you for your file and information. And I get the same wrong behavior (see below). Also with the dynamic qemu-arm version 7.0.50.
> What does this mean? Do you see anything which could be different between our test environments? Kernel too new?
> I am feeling frustrated. I have no more ideas, except that in fact, it is a bug in qemu. But if it cannot be reproduced on your side...

I guess it could be down to behaviour of the host kernel. What
kernel are you running? Here I'm running an ubuntu 20.04 kernel:
5.4.0-122-generic #138-Ubuntu SMP Wed Jun 22 15:00:31 UTC 2022 x86_64

There definitely are some bugs in our timer handling, e.g. there's
a fixme comment about possible races if multiple threads try
to create a timer at the same time, but I'm having trouble
seeing how that would result in the behaviour you see -- in this
test case all the timers are created and deleted only by thread 1.

thanks
-- PMM
