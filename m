Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1232171njm;
        Mon, 1 Jul 2024 01:58:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6wnammojoP0dMNjegs5yreI8R7OvqIohlyb86x/LU/RtLvar6//FKGRfgrMmCT9O4Y5AUCzyf8GJY1vrtg0XbM2c328Ai
X-Google-Smtp-Source: AGHT+IFQIcnzuQoBUCXZnkVxfXvLv3b7c4kGoZ+fi4/U0zZZxB+Ox39LVYK1QP1V5SaFRmW2Zeaj
X-Received: by 2002:a05:620a:4148:b0:79d:807c:f491 with SMTP id af79cd13be357-79d808c390dmr604014985a.27.1719824329641;
        Mon, 01 Jul 2024 01:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719824329; cv=none;
        d=google.com; s=arc-20160816;
        b=IzCLwhcurLH8BdPVNJPd6ahLHdmnSp9HILH1noL+hqRFhRvhnnz2sw0lwZOc4wekv1
         TFjPIo5/70CC/YxoOBCwqpLrG8CPnbD1B3EMK6VvOjauEiAyDCR7oZGnFB13vHAl99K6
         QLBiRWQwIqQj8tRRTHl2JIAcewA/14wpKFvOf8w7dT/lPGbJHW0gIfGRWLYA93UPrmqu
         V0TU+8ElXQXrg9zZqNwlz8SVn66O4TTZzbIg//6fesFygIl3u3hm9rTcVcvIMXdlAI4P
         TX2wIQgv9A4aqPYmC2gIB02/RrXiJKlPjOEjPHApX0sc62v8AdAue1nO9EjNA7fEW7yp
         CLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kXXH3LOqJxGPAXdIJxcNmav/alDjOGq1U7fctTEu8io=;
        fh=TuwqD8r1+reBABsFdcUyPF3OiewYn/ccsNu0VRF7bMk=;
        b=eSLFqedfN1lzzjky9SWoUI1MPtnkTkCBr6acRFn16/PvEFjH2gQuwkE6nRvpn2jh0F
         MqH1a2DtrM4ay0zT9/vsJ+Cq1kbKzjFxP8R2eyJ7eb2XB+kkbvzZsvo+rn3xw6AVBcRD
         983Rqwt31AjxF2seuPJyPumKbYiFDuDV8YCqYDcorK2ZXntGsmZtLSvsVy9C2Mu4LAxQ
         2tmNU7+OeSyjno8w0VghOy+dGGtaOfROlyj6OEEZ9JuNrMhYCI4MI17Q3ASJUCDk6AkP
         KMKl9WJfZ3Ge+bwfV6YqrniU8KdquprrTpy7pFVKbUCuG5KRpgRhAoq9WGXvxbFuYEZR
         74Og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fxl7SlJC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69307f64si809715585a.417.2024.07.01.01.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 01:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fxl7SlJC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOCs0-0005By-QQ; Mon, 01 Jul 2024 04:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sOCrf-0004zz-CN
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 04:58:24 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sOCrb-0006j9-8J
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 04:58:21 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57d26a4ee65so2910676a12.2
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 01:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719824296; x=1720429096; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kXXH3LOqJxGPAXdIJxcNmav/alDjOGq1U7fctTEu8io=;
 b=Fxl7SlJC2Vsru/qVVW0PtNRr3DV6NIflB1E9ZZ93IoE46MqMh+shCJ1+YEo0wdlcxX
 p7yuDgwEnIVZE9VuAKj/MhE17TGRNybD/EbaDFbMcbyCZ7GD5xScCgHp1ePMDF5GXrXF
 yPLAwX2hLX+NtEvBbrl3EnUAA8NxoWsarNIAg90OkS/BsnBK1i84lw8BFXCG02PR/R1r
 qebAlpayKfqEugb+OQUlSkbxYNeIu987eWbdGc4k45oEfznZ3jfdqYULRgmUDC4fIdZc
 eU4Y4R7hEzmExYI+inQ8/M2ObWmgSc4jzb/dQeSHL8LL6DTcp9NB3vl01tKRiG/cICFk
 FtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719824296; x=1720429096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kXXH3LOqJxGPAXdIJxcNmav/alDjOGq1U7fctTEu8io=;
 b=OKrlqvcEq27z7+wK85mbqYNuhdqqpIv8BpnPlaTM1Qhs829RUweNKoc3Umw70AzX/3
 sQLL8ivVCdyXPYqeHrAAmxmbcqEWkbpMNzmrKVIryutqE7TMbzexM2pZMvhLIGT4ikqN
 AK/NHYsYxM30mNw+1SV3Q8hFZjOep2JISrW1UsSkI92hBXs6EI85r3ObhkmA3q00TVPq
 L8su58i28pawCXwadf3jJAinJN3gWzh1j1UEYwAKKQBV33ZpvmnkiO9QvSJvY0rhT0np
 Bs/NYb6vxPqB+voBoxsOSqq+8t5fuJr8DQTZYZ2R7i1rLubEQvwrRauEVVMQli9+TiNW
 BTqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj22zYgz6jtjpFYWGEpSEDCN/dLyLmd6NK+jj9CErS51Bqe/oku+tgj1BnQNDg/PKI3QMF0puSOyBB7rJazrtYf2az
X-Gm-Message-State: AOJu0YwXKVb0PHR+Vx7fasjA5G8KvdKDpT03ZERN5x6XNDP0d/AnycNo
 WkmkZ7mJR5bLMa+JdmGmMajw1e/a37KbpOt+0H99io+6tka56k4+riq+L/eB/gYBC8QtNmgXJXV
 5w1UF2yTtmGQtHnlvhswJvHFteLfrO7uKmaRJYQ==
X-Received: by 2002:a05:6402:1751:b0:57c:749f:f5ef with SMTP id
 4fb4d7f45d1cf-587a0bfc733mr2734717a12.34.1719824296410; Mon, 01 Jul 2024
 01:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-b4-new-firmware-v3-0-29a3a2f1be1e@linaro.org>
 <20240620-b4-new-firmware-v3-1-29a3a2f1be1e@linaro.org>
 <CAMj1kXGb9xVQ5E3oK_QX+3hKkMfCoA9jF5jkEeG6Eq9+zbHPHA@mail.gmail.com>
 <ca463afe-486f-4590-acb5-a61265cbbd37@linaro.org>
In-Reply-To: <ca463afe-486f-4590-acb5-a61265cbbd37@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2024 09:58:04 +0100
Message-ID: <CAFEAcA_RUK53BZ7oiFgnt0HgcghACTc+XXC1h2340GAR8xHUEw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] tests/avocado: update firmware for sbsa-ref
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 Ard Biesheuvel <ardb+tianocore@kernel.org>, Rebecca Cran <rebecca@bsdio.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5+3n0YfZgW6S

On Mon, 1 Jul 2024 at 07:49, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> W dniu 30.06.2024 o 16:37, Ard Biesheuvel pisze:
> > On Thu, 20 Jun 2024 at 12:20, Marcin Juszkiewicz
> > <marcin.juszkiewicz@linaro.org> wrote:
> >>
> >> Update firmware to have graphics card memory fix from EDK2 commit
> >> c1d1910be6e04a8b1a73090cf2881fb698947a6e:
> >>
> >>      OvmfPkg/QemuVideoDxe: add feature PCD to remap framebuffer W/C
> >>
> >>      Some platforms (such as SBSA-QEMU on recent builds of the emulator) only
> >>      tolerate misaligned accesses to normal memory, and raise alignment
> >>      faults on such accesses to device memory, which is the default for PCIe
> >>      MMIO BARs.
> >>
> >>      When emulating a PCIe graphics controller, the framebuffer is typically
> >>      exposed via a MMIO BAR, while the disposition of the region is closer to
> >>      memory (no side effects on reads or writes, except for the changing
> >>      picture on the screen; direct random access to any pixel in the image).
> >>
> >>      In order to permit the use of such controllers on platforms that only
> >>      tolerate these types of accesses for normal memory, it is necessary to
> >>      remap the memory. Use the DXE services to set the desired capabilities
> >>      and attributes.
> >>
> >>      Hide this behavior under a feature PCD so only platforms that really
> >>      need it can enable it. (OVMF on x86 has no need for this)
> >>
> >> With this fix enabled we can boot sbsa-ref with more than one cpu core.
> >>
> >
> > This requires an explanation: what does the number of CPU cores have
> > to do with the memory attributes used for the framebuffer?
>
> I have no idea. Older firmware was hanging on several systems but was
> passing in QEMU tests. After closer looking I noticed that Avocado tests
> run with "-smp 1" and pass.
>
> Checked failing system with "-smp 1" and it worked. In meantime you have
> fixed problem in EDK2.
>
> So yes, updating firmware may look like hiding a bug. Which I do not
> know how to track (I can build and test QEMU, but going into its
> internals is something I never done).

My assumption was that random chance meant that TF-A when
only dealing with one CPU meant that its memory layout etc
was such that it didn't do the unaligned access. I don't think
this is likely to be a QEMU side question.

-- PMM
