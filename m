Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1156195lfp;
        Thu, 16 Sep 2021 07:07:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA6olgOC30H2YpnNna2eLg28gTU68jaT+NZaIFPAJQVk8RrhjIY5Net88ejq0AGWHyLhyO
X-Received: by 2002:ac2:4e05:: with SMTP id e5mr4079494lfr.632.1631801246942;
        Thu, 16 Sep 2021 07:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631801246; cv=none;
        d=google.com; s=arc-20160816;
        b=Oqd9HFtGEY13ACu8Eg2uE34hZuME69u+awLwoMwd+9vivUTk2jcEOBbb8lhtnWI7rc
         tPhKalJ5Whv/C/SmvTG4A0B8y1c6EjXE1+JIjz6L6761rRKYDqHZks48VK6JdesjSX0v
         lZCgomzGGfMjlMAJp/E+crv2GhX6IKejQFIxGMhoa0KlhvSs4TKhZo5dyAJThLWpbsRZ
         PU8gz2fEdWv/qI+55SE6ayMBl5UVtTXggxAXcUNRW90nZGrtV9v4XdXYiDBWmyVX+Yuc
         J7UFC48kElHRTVm9X5O8Aw0A5upI1btNMGHT2XpBKWUX4WfyQBaazKKtCDY7BGZrEaz2
         1skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flE3/Xp9xEou041iPWoTUEH1ojqRrVEenXKxIz2IbME=;
        b=KwS8dOMv3uqz8vo7OC1yLCzoTZB34JTvzbxmfU+KQ7yuCl6lG9/2i8TUuikvG1Vv80
         fcZpn37tO5Oz7sEDTvASuYKfc0d/FMtAZw0kkb0C92xM5Kf1tzr9HoEq5RohAS9lIx1U
         XlMnI7dHtgHP/wBiqlx2iqEoaXRh3Qlnupo6B8yfFavUiOIX8Xq0MvKIYF69cEamY6Z8
         vpiQ9nFgvo3VpjFn8fkgpnrEoBMGEAiUCCi77as+fiB4zI3PbD0j/c/CV6US+ZOPS7w7
         pT1VEhWer10l96cCNlfaVzuHT/DI0h9YPAWR2nuBfV4iMlTGeYNP7rV8sK/5rDh2zdIQ
         ZcPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HVPw1HIz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si4412213ljf.491.2021.09.16.07.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 07:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HVPw1HIz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQs2w-0001yy-1f
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 10:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQs1u-0001vJ-Km
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 10:06:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQs1m-0001to-C2
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 10:06:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id u15so9688349wru.6
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=flE3/Xp9xEou041iPWoTUEH1ojqRrVEenXKxIz2IbME=;
 b=HVPw1HIz9L3iKwpRx+yrWAOvHAjAeImDSe/Cl/07mnaTNqRN5wTOkt3cdtkdddFo7C
 9b7R/Dx5mKS59Rvc3Xzai8lKpppRTl6t1I1U9klrWTxP6GK9HHYDjB5S1/m5U3xKctL+
 /5PTRVd+UXlprQwIJeMDK5VBbcHKheJ/WEAR96jzPTZS9ztyuCIoz6Wkb2krY3Ouhcu7
 iSh00jstWTEXH6qZZENI/u56ajOzR9xDzNop8G5d41DAcFl9q30oHA435S08mZVDEmt4
 9kJM0R8AiHmpQa2DVqhC+M7zKKPdFE7bQ+0rFipNryllGiCdXI7NlVG1Z03O/8dAtmxQ
 NTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=flE3/Xp9xEou041iPWoTUEH1ojqRrVEenXKxIz2IbME=;
 b=xdGNZjAhqR7XqaLVEz2p/xzRcY6N3AA/+Uw+5L1k2lYM71jawSM/NX+TtDY1fpXHBE
 TD+SHpFFDdQDAZGdXGwiR2apxhhfwDECcAtYnXbIsIwRiw+Fc6EEA2ZSRr0Q2rAFNAVL
 xkrqd7YtmqacRga0xNZt/H9rotoGdadZUe52HoxuHtqcJTs+nTV/LdPwXzCEJG/vSchI
 qXYtsCcRsiT4z2TONOrCUABPAofMbigba5yNgjKpy1kMX/rq2kD7wZHnvbjGGwmZAXBQ
 x4kOiAidCm/UBGCH7ihRffyeAU78ZhKwikeXAMnNp3Kkt0gw7CriTjBls6iD3fuuoZp4
 zvwg==
X-Gm-Message-State: AOAM532nrhvA8HnqlH36DxZE0U6PSe7DoMw/gswLkHrgafQCoUhjZNDv
 LdkyW/ygCxlHACO3kPbqRASTdORXm73cWKEvnp6q5g==
X-Received: by 2002:adf:f185:: with SMTP id h5mr6393048wro.302.1631801172409; 
 Thu, 16 Sep 2021 07:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-3-agraf@csgraf.de>
 <CAFEAcA9e+tnF56J11AWcsyKGH+h+3VKKADOFGaM37JhYR_HqDA@mail.gmail.com>
 <2b3f4581-56c3-db0e-f083-fd6d1b7cc2f8@csgraf.de>
In-Reply-To: <2b3f4581-56c3-db0e-f083-fd6d1b7cc2f8@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 15:05:21 +0100
Message-ID: <CAFEAcA9+mRkGwHTnHzRrhAFRKj=NM3Yj_tsMskGjNE+=fzdf3w@mail.gmail.com>
Subject: Re: [PATCH v11 02/10] hvf: Add execute to dirty log permission bitmap
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rnyAG8D9GM3Q

On Thu, 16 Sept 2021 at 15:04, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 16.09.21 13:59, Peter Maydell wrote:
> > On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
> >> Hvf's permission bitmap during and after dirty logging does not include
> >> the HV_MEMORY_EXEC permission. At least on Apple Silicon, this leads to
> >> instruction faults once dirty logging was enabled.
> >>
> >> Add the bit to make it work properly.
> >>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >> ---
> >>  accel/hvf/hvf-accel-ops.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> >> index d1691be989..71cc2fa70f 100644
> >> --- a/accel/hvf/hvf-accel-ops.c
> >> +++ b/accel/hvf/hvf-accel-ops.c
> >> @@ -239,12 +239,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
> >>      if (on) {
> >>          slot->flags |= HVF_SLOT_LOG;
> >>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> >> -                      HV_MEMORY_READ);
> >> +                      HV_MEMORY_READ | HV_MEMORY_EXEC);
> >>      /* stop tracking region*/
> >>      } else {
> >>          slot->flags &= ~HVF_SLOT_LOG;
> >>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> >> -                      HV_MEMORY_READ | HV_MEMORY_WRITE);
> >> +                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
> >>      }
> >>  }
> > Makes sense -- this matches the premissions we set initially
> > for memory regions in hvf_set_phys_mem().
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > Should we change also the hv_vm_protect() call in
> > target/i386/hvf/hvf.c:ept_emulation_fault(), for consistency ?
>
>
> The x86 hvf code seems to deal just fine with !X mappings, so I'd leave
> it as is as part of the arm enablement series - especially because I
> have limited testing capabilities for x86 hvf.

Yeah, I should have been clearer -- that would be best as
a separate x86-specific patch.

-- PMM
