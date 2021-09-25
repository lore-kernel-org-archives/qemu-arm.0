Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2347180lfp;
        Sat, 25 Sep 2021 11:11:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPTMosLocsuR+p+GVykBoFBPRXeOn4QSvkWl+6f7VeRJ+gXvBmOzhXlLQy/Jr/hwwPzWpY
X-Received: by 2002:a05:6e02:1e0c:: with SMTP id g12mr5175455ila.155.1632593502466;
        Sat, 25 Sep 2021 11:11:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632593502; cv=none;
        d=google.com; s=arc-20160816;
        b=blC9pEqWgn1x2UuyWI0fMBrf1zVWJUytobjoe+LLoi9QbsG8N5AWoS3glYPxOm/Zp0
         mfunduAFX66sIPgn2kXYYh7sZSzPNFzgKVfUhFztcxnBP07yuwB/ofq2Y0U2hAhjY5Xi
         BnI+HVXpGVClwy3MxJP6lb6ySu/1V8ukUYzokvpvWrkRKzrmhqUjH7QdlOzWHMo5AIPA
         sqa8+blDyFhhLLtMnZtMZ83AzY8O+82DbWl6n3MwqadXM4z7NJavwxfsTIRaAJZiFOxC
         RheFH8lr4mVM9NyAiWLykw34gjwTTZnpxxXCQbCyJ9+F0Ff8ZxS6EY7rWiM8P4HuV9sj
         WPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KUFZiVYURmlquJb/8hjhnumrTU8nUimqof9Ge4p1/c8=;
        b=ZbPyHXE3wlQ9hCNVqlU97Bu88Si11xKCofYiiKcq+hlRl15CWofXhZp39xtuyeaHrx
         aR3M1YPOnI7224Ai/zRDg38vC9rLYqhj20X5s2saaJ1X00XsHKsYi/zOnEGZWA/9XVR3
         C4a85V4T7td1Q04Dh8EWreJk9aG+SxnC7UIDMSJM7Vs7XU2r6SwHvGN7ny5ECh+gDQmJ
         TRSVAvZb71OOP9pHlxTHms2Slw9ShJI2ImPRW0ymy8uxmaJjgGfyKhVSRguHSIuBQuow
         oboUl6a+wlPp0f03g+tbrMZQzwi0LxwU3fFd07Xz0ySHlSP/dRjtQGrgaIe8P3XNwZou
         yxGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nNDAsgVQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si17112737ioj.101.2021.09.25.11.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Sep 2021 11:11:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nNDAsgVQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUC9F-0002bW-SB
	for alex.bennee@linaro.org; Sat, 25 Sep 2021 14:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUC8T-0002Wv-Hc
 for qemu-arm@nongnu.org; Sat, 25 Sep 2021 14:10:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUC8R-0004uY-T0
 for qemu-arm@nongnu.org; Sat, 25 Sep 2021 14:10:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id i24so21632946wrc.9
 for <qemu-arm@nongnu.org>; Sat, 25 Sep 2021 11:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KUFZiVYURmlquJb/8hjhnumrTU8nUimqof9Ge4p1/c8=;
 b=nNDAsgVQkWr96C+IMqGNziUsVJhpousfzAm5sCX99XD4qG1WOU5K+nf/SjHhLuXidH
 6UGEobp3ciD7ss9/K8MLIMCbwfsAELTIHleCp9+Gs/r8hRIY8cS0d9XzU29tqqwDjh95
 BeJqtcoF0AjMT78Pig+M0q3PAPul01CbSTVfVG3SSkj5CwXBDHpL3/vMzwuVtxw9vKE1
 L1TT4ogEOffi3Jqg3XocYX0g2gTFHf7t0IwHz3qC0IXzoQNgTKvXHHuOFpVOc2D3LOa8
 QSiBsngiAvjRXgPvh+cA0tgRvFw+4JXTDTXTirXLOP0Hi2BfIgLVFSkcSSl8UKPuclUC
 /c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KUFZiVYURmlquJb/8hjhnumrTU8nUimqof9Ge4p1/c8=;
 b=Vm481UnuPXo853r6d+7iVT7gSLSDr6IXwLpIm9XpIZt2VifNzZqsGsBUnsO5QieKPH
 ia2cVBBKYW7MEBedueSf+rwgnkYFNPY46lRKgPmu8Gm4b6PJdET4i6d8QUI84U20FSNT
 PTVoauze+XUNTTdwkYyJYMXiLcvAj/YFuJ3bi5mhHEdZd8R3keGOHmuUD9zHAbic4YtL
 4miJ7Kk65DTatGHtfwzg39CoiPv1/J9IzidTPuwAeJVMLZhRJb/Y6RMEWUSpVhIIzS03
 1obif5rNi3sD437F5nKh7EVn/VyxBTxZz/as3K6E2nWlvRBKDrKgasIhBwdNPAy7Fsv9
 cgVA==
X-Gm-Message-State: AOAM532mfqp5cibnk1S+E6cU/iMhrnr1YbGS8PmlSQg+GDr9KCGpNzmX
 breeLS7ahpSPFSOvKAdZCMNfPIJRzQSo8qnw2sHY4w==
X-Received: by 2002:adf:eac5:: with SMTP id o5mr9472431wrn.275.1632593449147; 
 Sat, 25 Sep 2021 11:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210916155404.86958-1-agraf@csgraf.de>
 <CAFEAcA-LrvO7sg9gY0ZKnvXJyJuFc2Ej1Ve1245FZ7YkH-Oj2A@mail.gmail.com>
 <CAFEAcA_Hkqg16VbA1qACK4RG22iXHo8b3VZWQoBRZL0HuBazZA@mail.gmail.com>
 <d4859cae-d9c1-2879-0682-080d4b5efe90@amsat.org>
 <27a265d5-2e7c-f234-0d09-f40a731e588d@csgraf.de>
 <bdeef51c-901b-f5a8-0415-03c464255b1f@amsat.org>
 <60aac468-973b-daee-49ce-71829c234af8@csgraf.de>
 <2db79dcb-feba-4175-6805-5b365b30d819@amsat.org>
In-Reply-To: <2db79dcb-feba-4175-6805-5b365b30d819@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Sep 2021 19:09:56 +0100
Message-ID: <CAFEAcA-hxM3b-zS2s8FbWG=SogNdp+o=X1K45kYqXK=OhBCUbg@mail.gmail.com>
Subject: Re: [PATCH v12 00/10] hvf: Implement Apple Silicon Support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OreK7f6DFfnC

On Sat, 25 Sept 2021 at 18:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> So this part of Xilinx Versal:
>
>      * When loading an OS, we turn on QEMU's PSCI implementation with SMC
>      * as the PSCI conduit. When there's no -kernel, we assume the user
>      * provides EL3 firmware to handle PSCI.
>      */
>     if (machine->kernel_filename) {
>         psci_conduit =3D QEMU_PSCI_CONDUIT_SMC;
>     }
>
> abuses the fact that -kernel command line expect a *Linux* kernel able
> to read the provided dtb which describe SMC. >This won't work if we
> manually provide a crafted dtb with another conduit

...which is not a supported thing to do (it won't work with the
'virt' board either)...

>, or if we pass any
> other binary (not Linux, not particularly ELF, since -kernel can load
> many formats).

-kernel means "assume I am a Linux kernel and boot me accordingly".
Sometimes it works for other things, but there are no guarantees.
Among other things it always means "start me at EL2 or EL1, not EL3",
so PSCI handling via SMC doesn't get in anybody's way even if they're
not using it. (People who want a pure "load this ELF file" should
use the generic-loader.)

The basic distinction the versal-virt board is making here is
"we have EL3 firmware to run in the guest" vs "we don't";
for the same reason that the virt board does, in the former
case we disable QEMU's internal PSCI implementation, and in
the latter we enable it. In theory the orangepi board code
should do the same, because if we're really running guest
code at EL3 it probably is going to assume it has SMC, and
QEMU taking control instead is going to confuse it.

-- PMM
