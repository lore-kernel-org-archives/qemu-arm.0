Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2905105ejy;
        Tue, 4 Jul 2023 06:22:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH6pPBL97U797PT2pZ8qK+yYArgSAl1ypnc2+M5U97/ZxWo4TGRTOycJKOZdV+mJnIebYft
X-Received: by 2002:ad4:5d6d:0:b0:629:78ae:80f8 with SMTP id fn13-20020ad45d6d000000b0062978ae80f8mr18253283qvb.10.1688476936225;
        Tue, 04 Jul 2023 06:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688476936; cv=none;
        d=google.com; s=arc-20160816;
        b=UQ7O2LJ9k7PG8HNR2MhBqyAE+w/8QPXWwAPhQhGRpNVWht/gMh+t4TpRZYaiCrkdjo
         uT0FXTy13YnyguVLh+HTH3pVTuW2zWXP4a+t2hD9GL0jeJ+oiXYuTdmSqC6FXlHHI3EC
         lFt5MapnwvXa7iOUtZAJRJhnUd+em5UIVv9Irzbf75KyFzY97nSECoRsuNMwzJutYdhV
         a5yyw/qSaZxGhOW0X6CN+Beq5kl7p3UZZbuFakAV3GCz3AvbrZabq5iVOXyfeGuHTtu5
         lxBtdKIErJORcb+cdUcLFdfIqP4+aspc7KsEYMzNed2XOixWzLcwWBIAdskQjHmjz6ej
         FpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=p2bayySQ6FpgW3ti56DIy/pwdOCtOffRBdRrh1f2cdE=;
        fh=KBlgtE3ERa0ZUYgqV31WqhalP1RAhAFOCovn4+lLDmk=;
        b=n1vXBvo92Ff1qqJsaNmrdGrbB6pFzW25SiE6K2z4CrWepEh2QXNajh60ZC1S2j+ZyM
         PAoIE+BNAU1RXUOjLYvijrzUU/vjzZOnIpvHw/pRouvtX2HY9P5NSHZWmOLTAIo/ZLEk
         EY7Fu2PPyD5mNOtbwDdWL/3BChPa4o9rK009xBEx33UwYIbCiCrwPe2pO/NjNcZv9rtp
         cxdfcfOPUNfkDouueqMvXsHAuUsCPgDTPqk0s3weQ7m242QaZl5FQKqalOaJG9wcQiZN
         2l06S8jDfkc8cnK28ANNt5TnRgNQY+IJMNVbTMuyMmLP9KrlxmzYlB2cgPIZzuwEK4rQ
         qXWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nMgQIVaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr7-20020a0562142a8700b006350899946bsi2556011qvb.39.2023.07.04.06.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 06:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nMgQIVaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGfys-0004HZ-NS; Tue, 04 Jul 2023 09:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGfyq-0004DR-Nv
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:22:08 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qGfyo-0007r1-Q5
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 09:22:08 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fbbfaacfc1so433768e87.1
 for <qemu-arm@nongnu.org>; Tue, 04 Jul 2023 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688476925; x=1691068925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p2bayySQ6FpgW3ti56DIy/pwdOCtOffRBdRrh1f2cdE=;
 b=nMgQIVaCuaHER0lYEHjKV/UWu9LT/aRG9MTOB13xhnPgWq+QLVGqyzCl/9lpRphOKj
 fnFw9N/f2v/RJSo2bP8mOO9j/8LeJLLcw1U4YQOB1duFd729WcaVHdFRx1Cm518rtcx4
 pWsPMXyfAv89340PzUgxno3hriOVU3LSpU6DprpfrkrKelkwL/uTt/BMBExxAgPJX49s
 tYLmiGg8MQIlpeoOR1fG1gGV7AnChcKncbSjtkAO6ZySM/2uN67d2SpZjBjWLX/lug17
 HGJVLxLZCYnBPkEZdn012+BJxPQsSaP5+2ua6MfLQ7HsbVgvgik4cmT9+a4JO71E3jUm
 JWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688476925; x=1691068925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2bayySQ6FpgW3ti56DIy/pwdOCtOffRBdRrh1f2cdE=;
 b=XvGJgXGFc8r82oh3IYn33oZJhDYg0W/KiQWTEUXPOtiyeNZMJuPaSNNC0CA1UYuh7j
 mvqbrEsOY+7TEtRMoWJB4jlHoJaJ6nt5tc4IGcW9bq8mgXQR7oL0jl2/gSf5eh1DZ6nu
 Bh7BqyqyXeVYqhkH13SfQknP45lxrD06pv49B7frq+rBb6cyztl3oVVtHYqAqQxIV5k+
 /OzG8St4Z54fifYbGEmdul1ffp93AGOBrZgZ1oY2MqtvGqRHsYTee8qJKGUgqJlMkmcQ
 5aY3KpjWG2SQBGmBSpU7QV3bK8WMhnuaQRTFWFsCmpChpiByJk8Q09Qu7s2kJpFuJrVT
 J6OQ==
X-Gm-Message-State: ABy/qLZN2b8BNbyPxF3TVO/Ivz6kDEVi3OAJ1DVc7/BWFsOvbxKM/ddT
 vWmukfEqhBGuSACNxTLw+EgqO1z162pLY7aeI8h28w==
X-Received: by 2002:a05:6512:1595:b0:4f8:56c8:e6b4 with SMTP id
 bp21-20020a056512159500b004f856c8e6b4mr11374253lfb.47.1688476924851; Tue, 04
 Jul 2023 06:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230626075207.623535-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-K_2SLxbq90TpUyzLpiC0U2WVJe7ffaC_TH66K-=GV4A@mail.gmail.com>
 <b26c98d3-3e9f-331e-acbd-ae0c451e0ed3@quicinc.com>
 <CAFEAcA_rg4CbE1Y9mTQmPs_KBqb-S=3Z5Hh78gbVUD6R7DR0hg@mail.gmail.com>
In-Reply-To: <CAFEAcA_rg4CbE1Y9mTQmPs_KBqb-S=3Z5Hh78gbVUD6R7DR0hg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jul 2023 14:21:54 +0100
Message-ID: <CAFEAcA8mk0upQUqXsdm3YXvRjAJc+6npkXAWWLtHS+3A8bMJKA@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/sbsa-ref: add PCIe node into DT
To: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: taM0rfZ20A5H

On Tue, 27 Jun 2023 at 14:27, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 27 Jun 2023 at 13:52, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
> >
> > On 2023-06-27 13:12, Peter Maydell wrote:
> > > On Mon, 26 Jun 2023 at 08:52, Marcin Juszkiewicz
> > > <marcin.juszkiewicz@linaro.org> wrote:
> > >>
> > >> Add PCI Express information into DeviceTree as part of SBSA-REF
> > >> versioning.
> > >>
> > >> Trusted Firmware will read it and provide to next firmware level.
> > >>
> > >> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > >> ---
> > >>   hw/arm/sbsa-ref.c | 20 ++++++++++++++++++++
> > >>   1 file changed, 20 insertions(+)
> > >>
> > >> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > >> index 0639f97dd5..b87d2ee3b2 100644
> > >> --- a/hw/arm/sbsa-ref.c
> > >> +++ b/hw/arm/sbsa-ref.c
> > >> @@ -171,6 +171,25 @@ static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
> > >>       return arm_cpu_mp_affinity(idx, clustersz);
> > >>   }
> > >>
> > >> +static void sbsa_fdt_add_pcie_node(SBSAMachineState *sms)
> > >> +{
> > >> +    char *nodename;
> > >> +
> > >> +    nodename = g_strdup_printf("/pcie");
> > >> +    qemu_fdt_add_subnode(sms->fdt, nodename);
> > >> +    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
> > >> +                                 2, sbsa_ref_memmap[SBSA_PCIE_ECAM].base,
> > >> +                                 2, sbsa_ref_memmap[SBSA_PCIE_ECAM].size,
> > >> +                                 2, sbsa_ref_memmap[SBSA_PCIE_PIO].base,
> > >> +                                 2, sbsa_ref_memmap[SBSA_PCIE_PIO].size,
> > >> +                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO].base,
> > >> +                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO].size,
> > >> +                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].base,
> > >> +                                 2, sbsa_ref_memmap[SBSA_PCIE_MMIO_HIGH].size);
> > >> +
> > >> +    g_free(nodename);
> > >
> > >
> > > Why do we need to do this? The firmware should just
> > > know exactly where the PCIE windows are, the same way
> > > it knows where the flash, the UART, the RTC etc etc
> > > all are in the memory map.
> >
> > That is not automatically true (it was not for at least one SoC I have
> > worked on). In a real system which had these dynamically decided, some
> > coprocessor would program the CMN to route these address ranges to
> > certain offsets within certain components, and that same coprocessor
> > could then provide a mechanism for how TF-A could discover these and
> > provide it to later-stage firmware via SiP SMC calls.
> >
> > Sticking the information in the DT lets us emulate this without actually
> > emulating the CMN and the coprocessor, and prototype (and verify) the
> > same firmware interfaces for developing i.e. edk2 support.
>
> OK. This is the kind of rationale that needs to be described
> in the commit message and comments, though, so it's clear
> why the PCI controller is special in this way.

Just to be clear about the status of this patch, I don't
have a problem with the code changes, but it does definitely
need a much clearer commit message to explain why we're changing
the way we handle the PCI controller. So I'm dropping this from
my to-review list on the assumption there will be a v2.

We could also do with expanding the commentary in the source
file to clarify the design approach we're using w.r.t. what
we do and don't want to put into the "dt" blob, but that would
probably be best in a different patch.

thanks
-- PMM
