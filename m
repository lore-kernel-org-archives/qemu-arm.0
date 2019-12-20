Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3663974lff;
        Fri, 20 Dec 2019 06:16:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwaaf8M9IzadPbnoMWtDl6bD8l0sxQZNwbn8AgtcT1D1see6vbW8VzG5vMRynbkk7n+uMO
X-Received: by 2002:a9d:242:: with SMTP id 60mr1983845otb.253.1576851380679;
        Fri, 20 Dec 2019 06:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576851380; cv=none;
        d=google.com; s=arc-20160816;
        b=C2fts9vEkm1KP1WzIbjWAxzqR5vCYz+F7F04IUh/KZ3OvhEdO0yOx+LyplINS+yFmq
         /XwRf70qUUgHZfI7VdbxSGOet+3Mh48gjKUpmlBZmdMmc6ogmo68qUzTY5BUno19xoVu
         4901UctG3ViD+Xj3Kic8ywsPr8kL5Mf1M+rQfhBZou3Ph5sLJfuf3GcMGCa5/rZ2+2Rt
         fGzps7XyksC8FGVjZf/qcGAXL1I4Ke1kr5aeoNXcGGoXaFxyAX0T4dKF8QV0sIKYngMe
         eOu3ovUVJpE7OehN9PYAVVEtzUZhQR1Sd9DvvcJ5vvi9eOMI32CsMVU7oOj11pqMncIb
         wllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ELpgbcB63eyC8D0t7Z4Fvx7gbMm7zBoq3zJjp0z7mJs=;
        b=qkLDVFMwT/9yd18j+UBJGGgNRpPuaeDzgJ7EB13sOGAiyZ+sxn+ZJJnYVa0bncXQGb
         R58E/N9QcpTaZYo81LDTK2v496gINhOfORS67MRYkdQDaS1usppdscTcjMEtPC9PH6Th
         F2N5VeXwmMa1eNRsR+Ml8hAUdftTxtRcTePFmGy6w1KbkuLo6F28W4vSMB7eIm2WMOnK
         a3+nYKZhMBpJTF49Lio/LauVVFeRKMF1Kd1j5o46Lq+QVjOHdejd42CDnB/Tw5vNC88k
         TW4ij0A7c8qOuZA55t+N0GqR2Q4pnYwcIqfq5NL7GHVm3bbn/UbEcT7IrUByk93w3ZSk
         prkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C2WsHvtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si2227218oig.75.2019.12.20.06.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 06:16:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C2WsHvtX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiJ4l-0006Cb-Ea
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 09:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iiIow-0007fI-UA
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 09:00:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iiIov-0001jh-BE
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 08:59:58 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41384)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iiIou-0001fO-V8
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 08:59:57 -0500
Received: by mail-ot1-x342.google.com with SMTP id r27so11970043otc.8
 for <qemu-arm@nongnu.org>; Fri, 20 Dec 2019 05:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELpgbcB63eyC8D0t7Z4Fvx7gbMm7zBoq3zJjp0z7mJs=;
 b=C2WsHvtXy749gvkXphiJQTFHdm/9pOO9gjYmzXfaMLqdg68HFmS3occ6TK1MSzXdyb
 uUmtq1l2Po1yfQpIgwdvSzEpC1uFhJAh+kyjBMD+mNCVzYn6dXscMcqBrGEh3zzEnZsO
 8JyRWZtXbDIB5QdXXP2eFjy4UT5TlMOPrJZUCExUXpdPXMejY+y9M+Xwr0Vvkd4AxszA
 z28XwAmP270e3O4nXANpuVyISK8HH/ZfARLCWsT8YvVejQkspcLyKx/t/uPMDb6bULvj
 P6l0OlDwUPI+f/VomsNt6imSbigMkNHTUseeuFb0hbKpa91s00rtXGiGZOTJcW9tAMTr
 jATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELpgbcB63eyC8D0t7Z4Fvx7gbMm7zBoq3zJjp0z7mJs=;
 b=mN8EcwdniY8Gkv8osQBY5ehzItP+9a879mymkQbHOyEtsASU6nA5Ngla51rLYwtwY9
 1FxBP0CeDOJx3CM5ojRTF+iBzqTOHezJsSg8I1SoazJvGJkMlPAKHoZSmIinyfzvc/NT
 DUO0YVYYw5ROTdN2HWUXX/VZtON6VhLDj+yRcX6i8ztjtBJG5JTxNjCkCv5HM4oZPnRG
 CECiI//VG1W5FOrS5Kjmwc1ytwYVIqcRu2B4ULv/dI906w+WRPkOgJxkGIAaUsPgMbX+
 x1v1F27xmZAWEFa9pgXyEOG1DNL0tWqE9ZSYh75d+cTUmJ87U3KKFxstlXxKUK9f0Aqo
 LJ6w==
X-Gm-Message-State: APjAAAV6Ouf632HlutshYkQ6IC3ErWF6aRRf7HEsaZUBwV8D09w0i7lr
 b8BsrcTxovnGtFqe3dq+FrX6Xqsl2oXkfhtr2CDmRQ==
X-Received: by 2002:a9d:8cb:: with SMTP id 69mr1308538otf.221.1576850395953;
 Fri, 20 Dec 2019 05:59:55 -0800 (PST)
MIME-Version: 1.0
References: <20191217210230.99559-1-jeff.kubascik@dornerworks.com>
 <7a274247-e593-5828-73f8-2042971e8633@linaro.org>
 <CAFEAcA8Egy=Jkw8yKSumkeX=+Qxi8bPy-0fJjopHR6gCmz3FLQ@mail.gmail.com>
 <e8daa5c4-ba9a-a6dc-1037-7eec6335ad0b@dornerworks.com>
In-Reply-To: <e8daa5c4-ba9a-a6dc-1037-7eec6335ad0b@dornerworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Dec 2019 13:59:45 +0000
Message-ID: <CAFEAcA8Dxwsx4dUuq4YjD9zYCJEW5gsYc=99nH=YgZTF4Ay2aw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix IL bit for data abort exceptions
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HczLKOXSkhBb

On Fri, 20 Dec 2019 at 13:53, Jeff Kubascik
<jeff.kubascik@dornerworks.com> wrote:
>
> On 12/19/2019 7:43 AM, Peter Maydell wrote:
> > On Wed, 18 Dec 2019 at 01:03, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 12/17/19 11:02 AM, Jeff Kubascik wrote:
> >>> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> >>> index 5feb312941..e63f8bda29 100644
> >>> --- a/target/arm/tlb_helper.c
> >>> +++ b/target/arm/tlb_helper.c
> >>> @@ -44,7 +44,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
> >>>          syn = syn_data_abort_with_iss(same_el,
> >>>                                        0, 0, 0, 0, 0,
> >>>                                        ea, 0, s1ptw, is_write, fsc,
> >>> -                                      false);
> >>> +                                      true);
> >>>          /* Merge the runtime syndrome with the template syndrome.  */
> >>>          syn |= template_syn;
> >>
> >> This doesn't look correct.  Surely the IL bit should come from template_syn?
> >
> > Yes. In translate.c we put it into the syndrome information by
> > passing true/false to syn_data_abort_with_iss() depending on
> > whether the issinfo passed in to disas_set_da_iss() has the
> > ISSIs16Bit flag set.
> >
> > I think this is a regression introduced in commit 46beb58efbb8a2a32
> > when we converted the Thumb decoder over to decodetree. Before that
> > 16 bit Thumb insns were in a different place in the old decoder and
> > the 16-bit Thumb path passed ISSIs16Bit in with its issflags.
> > (We should cc: qemu-stable@nongnu.org on the fix for this.)
>
> The problem here was syn_data_abort_with_iss would return syn with the IL bit
> set, which carries through when it gets or'd with template_syn. I had to change
> the is_16bit argument to true so that it clear the IL bit.

Interesting. I think that's an entirely separate (and long
standing) bug to the regression where we forgot to fill in ISSIs16Bit
in the issinfo field, and it masks the other bug...

thanks
-- PMM
