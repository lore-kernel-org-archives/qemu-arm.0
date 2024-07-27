Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp910268njb;
        Sat, 27 Jul 2024 04:11:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXz1wMLeZBaA/Nz+JnlszSb40rLEDWsnVpb+IflIgTakNrTVsRTqAyyTCHfYklrXOSjjX6O7MG/s9/3jmffzl8U6O44Cvt
X-Google-Smtp-Source: AGHT+IHFwEzN0KJR5WmPjJJ8CtNdCeSiaK+ZvzcY60j9bp9cGAZk0T6N8UbAY1SV4cWTdBqR1x1M
X-Received: by 2002:a05:622a:13d3:b0:447:e890:b19b with SMTP id d75a77b69052e-45004db066amr30570661cf.8.1722078665795;
        Sat, 27 Jul 2024 04:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722078665; cv=none;
        d=google.com; s=arc-20160816;
        b=PZmKLmPYbMsDG4FIWik9NssC2Fj77I7yPDvtt2afwVuAcPjiC/CEih89N3QFfoMsuB
         IGi/l0XSHK/oo9YPE6QcYzmbDTiGodVMFnpedETZoJdx7fZd0NpcAG8gEjaBceT6o0+U
         sH+wru9Kh4miMnEb6JSLxODjjHqK3JT0oYVIZViSaOc9Aiv6qOjI5hUZFOfQw2obo5Nn
         XUk6BhkHEhSDq93x333AA1Rz2SLfvZVcesVxEm3G2PyiqCWJmr981zIwZCq2l9r5upiD
         k02r8jBqEpRdYqLsZFb+5R+JUD4NJmQlAhiy6agOvRbsGV8zlgwFjfTgTfbdWDt62ppw
         Fa4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zuJcDC79uydJgeDwLSiY0EYC9g2y4XFLPHOgIxL6US0=;
        fh=3RM03hozst3aBnd+mLSwuXg8HXGuagtcy//S+0q6wY4=;
        b=hcpiGMD/wttmKBizv74AzRFlGdGEsJInc2TMTZkZekHgT5JYAw46dLlybs4dtHXCnl
         Ut/NAzcfL1mHW2Tvvp27tjKp0v5KY80XrGmgRK3R/pn8qr3JnUqOHqCS0PYQhvmFSLOC
         /OiR/5ShGem1ukJUSkXU5zVIM88fbdfXr42x6NFhZuA+R7ToXaBnjiOTpPXqLe5a6Kyq
         v2LJySP93cU9tcRu8W1r1eHCHzHC5ZEUNrKF/NVpDWiZocNRhi2SPQTH+PEBhOPIyv9g
         N95U8gObdusP99tyxo8C8Uqfr5L8E9OKeSDZ27KHEPU/MjeDu3eNJWLFp/6RD31bpYrW
         GuKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bOTExxHZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81fafe9si58630751cf.252.2024.07.27.04.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jul 2024 04:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bOTExxHZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sXfK9-0003EZ-Ag; Sat, 27 Jul 2024 07:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sXfK6-0003CJ-B1
 for qemu-arm@nongnu.org; Sat, 27 Jul 2024 07:10:51 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sXfK3-0001D3-LL
 for qemu-arm@nongnu.org; Sat, 27 Jul 2024 07:10:49 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f040733086so23752061fa.1
 for <qemu-arm@nongnu.org>; Sat, 27 Jul 2024 04:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722078638; x=1722683438; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zuJcDC79uydJgeDwLSiY0EYC9g2y4XFLPHOgIxL6US0=;
 b=bOTExxHZq/BYmgRjKweiV2hxMcyX5Oa1noSf2wmzjUqZjJ7wBbHEWzWmHfUVEscKAI
 /FqNYWfOy/Xd53JsIxy59Dn+zhK9scmoQMG6/jXeAKgqqe2WdMv3UgoLw3kZVU8ObVEQ
 At78BCqgR/uBm3f5rcH/CLo/QzVFOlzg4QYPem4k2eaoMn1JSmFLbnm1v+YR+4iDYqbS
 TxJcJMDzZP4ltjrQ+z8zx79a8OVZYtUxS1gLvj6dsRKOyx821Jwk/X9l07SFz/dw7qph
 6RhO8Rmb1gmJQrTqXIN2ENeWz5UiD8mzpQqu40q3YlEQIHhu37iaYYbTXxpWc80OmwJZ
 kmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722078638; x=1722683438;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zuJcDC79uydJgeDwLSiY0EYC9g2y4XFLPHOgIxL6US0=;
 b=UyWcFua6VqgXnSK2UBD95h77cAmyhDeXNc4cQsyLFjgwQHY7ukrooq+irsXnXqj4hM
 MfNdqbAMLpMbJRykSFoFlapZykVnu+Wyu2RikBvKteB3TXT50CdfzofUFOW49Q6U9j7N
 RGQFJ31aq5DuWQbhGvDhQjW16zin7YWk42crpCPc8AKeNtEjtLCk2dSyo4tp85i85ali
 MWP0D2FFXn4zSOPVYzSJkYuU5m+ESf4WfOgv7SIFMFZ5HzClCH+nw7h4l3FojvILIbiG
 sLxzyMZfbTlrlAT/Kr6JwiGqwtZH8EsDGt20jy/6gKEKsRabgpvPvIqUkMMLuWGBTNd4
 8s6A==
X-Gm-Message-State: AOJu0YwknefJg1CSIcsSRUDaMsC5znLUcLxrNqK47CV1Mlj9crCqWmiP
 hGFw3pGs1vGoKWRRiE8gl28mPq7+BINRhw8sCq5aVpXikhd1J2gkhNW9fz/lwDrg3SrmexWVUrh
 BCc72GvewNguCuojZ8ZRmCxHzBcmWL0zDQV2hRA==
X-Received: by 2002:a05:651c:446:b0:2ef:290e:5b47 with SMTP id
 38308e7fff4ca-2f12edfd7aamr14570301fa.15.1722078637790; Sat, 27 Jul 2024
 04:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAETw2qO29JpKUeqAEzWEu-hNyYG4sB2wfiQA1nD6a8TC9YX7iw@mail.gmail.com>
 <CAFEAcA9POmXL+moGKJOzPm82wTw1eXmfZzHAqGF-uc=EUf8eHQ@mail.gmail.com>
 <CAETw2qOV84jVApab38iemKN9RZXxeAeKxjba9zDj=GmRHFfsiQ@mail.gmail.com>
In-Reply-To: <CAETw2qOV84jVApab38iemKN9RZXxeAeKxjba9zDj=GmRHFfsiQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 27 Jul 2024 12:10:26 +0100
Message-ID: <CAFEAcA8m6owwg67i9hmcJ4Uwow3aPxdGz=pYH1cL99MqjYA9Vg@mail.gmail.com>
Subject: Re: Running qemu-system-aarch64 with KVM support on a dual-booting
 android device
To: Jonas Noll <jonas.c.noll@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QprYpEQlc4n3

On Fri, 26 Jul 2024 at 21:07, Jonas Noll <jonas.c.noll@gmail.com> wrote:
>
> Wanted to rope everyone in here since I have forgotten to include the mailing list in my reply.
>
> This worked for the main error but I continued to get the
>>
>> qemu-system-aarch64: error creating in-kernel ITS: No such device
>
> error. This was fixed with Peter's other suggestion in a private email thread:
> "The error means QEMU asked the kernel to create an ITS device,
> but it said it didn't support it. So kernel too old, or kernel
> with the ITS handling not compiled in. You can force QEMU to
> create a VM without an ITS with '-machine virt,its=off".
>
> This also worked. But naturally there's another problem now. Also not having much luck finding anything on this one:

>  checking logs I found this:
>>
>> $ dmesg | grep kvm
>> [ 7197.208742]  (4)[6508:qemu-system-aar]kvm [6508]: load/store instruction decoding not implemented

This means that your guest attempted to access a device (or to
access part of the guest address space where there is no device)
using a complex load/store instruction (e.g. one with writeback,
or a multiple-register load/store). Arm virtualization support
in the CPU includes assistance for emulating simple loads and
stores, but not complex ones. KVM doesn't support trap-and-emulate
of complex load/store accesses to emulated devices, because it
would have to look at the instruction itself and decode it to
figure out what to do.

These are generally not normal kinds of load/store insn to use
on a device, so if you hit this message it tends to mean that
the guest kernel has a bug or has got confused. Occasionally
it means that the guest is doing something that would be OK
on real hardware but isn't supported by KVM -- generally the
approach there is "get the guest OS to change to not do these
odd things that don't work under virtualization".

thanks
-- PMM
