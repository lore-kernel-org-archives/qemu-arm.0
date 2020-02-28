Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1009683lfg;
        Fri, 28 Feb 2020 11:03:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEEUmnA9M5cLc9NoOEleoe5wOBuyIHof5ovIBPpKqF5+DDWt5EpK721hT5HZuEK7wJuCVr
X-Received: by 2002:a37:e10f:: with SMTP id c15mr6016109qkm.143.1582916611635;
        Fri, 28 Feb 2020 11:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582916611; cv=none;
        d=google.com; s=arc-20160816;
        b=g5CRYCpjO5jeYmKKyXbC7V7229JQVF4jaxnsZw69J8HQtfLy6WypQKBAzBLcyDgNGa
         qOBW6nkRCSn16C5hKS4ooz9EclgH/fMJoj8NhJ3SgFEbwD7vktXZ4BndclmLdaizoY3O
         g7WtVo4CNi6v4TsQI7KN8ml90NL1YcSuowbdt3RhNvlFRzRV9+5jDFmwbgrEkSXL8fwc
         C/K/zKAzR3vNoxhrysLTLS4XgWka9ctfJ6OhS2QiMshVtBRycitJt49PSaQRzoq4RikF
         twaPD62v57ri8mWopzWj8vSPR2OEZtbNls5Vdk7UuNaL7C6zVGUuPfQCfyrp4b9Qzdxa
         RJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qhZ31X135cuYdATYDFYvdleK2ZEMRZ9mZZiVRHSMJFY=;
        b=Xr+Yjrj6sH1vMM20+lsPJFpTglU7p/VKqKIUtNNvI9QZckOxlrIq0KYxNkOijJyrD8
         RkFq84pYkDOrIAywxIF8IlZbBEzkoq+2YL7gR6YTxzSrZW0UECBAFOG3YsegmlVwWCH0
         nk2kuvys9yuQlOuYzPuJW/Lb60+SCcgWE1gIdldCEdTXLPje7lLcZUQeoi6Fp51BbCoC
         k/PF2olj4PcXTxuSRn1SwIdpj3CO2rFUjnIO2Q5dTRnjGiV++Aoufph4JNmZQMu7FsaX
         n/H/KLq9guNmwn1QbVbeG3yM6gpgFHpxfYPrw3n7h5sJ22jyCrij1fK/OxXqptrr+iTF
         SOvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BckALGRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cp16si1664734qvb.103.2020.02.28.11.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 11:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BckALGRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7kv5-0006cn-1c
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 14:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7kux-0006cO-9p
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 14:03:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7kuw-0001MR-8T
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 14:03:23 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45382)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7kuw-0001M0-47
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 14:03:22 -0500
Received: by mail-oi1-x241.google.com with SMTP id v19so3832757oic.12
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 11:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qhZ31X135cuYdATYDFYvdleK2ZEMRZ9mZZiVRHSMJFY=;
 b=BckALGRCO2gA+PtEZ37n/fmzm0REileBlk69/M6WCOiIfsFEvh7lrp2qlzgn3tP78o
 8LFCzK+eZ9U++NRfHqQSyZwa3HTvJduNbydzvdQDluDu9+0J8uWWdiIM84JO1OFRislV
 WrMuax4T6TgL32Oq8T9YVFMwQZvCgbIgIw+q8+zVSz2M0HXS+hb2CwCn24mGWYGuTSoe
 Y6lAom67AeybF5sEckezdmmlhbOmR+c2KuDpEkdx847o+9aYqF55P9AleDLmWcZVMTaU
 esVS1H5rOBVxInAUqq5BF3Ye+nUdy3YfV9gbwrrermlsWZRENSbpqtaBI2A+KiVjNGo1
 C0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qhZ31X135cuYdATYDFYvdleK2ZEMRZ9mZZiVRHSMJFY=;
 b=cnT6BOybgq4klvGMkVtDxU9ID5/Tgu/QLYdZqIMN3aFt/dq1xENZSRxlpoEFj1Mvqt
 F7HGwrY6Hgin929CQvk7J/ZrBTPxBqJWWHwun2m0RNe+pGAWh4W4xLHyjc5hmM8OUjHk
 VkfWjC/GKSOMFXPOfZThqqFevTa+YeRiePAOxVAefLL/4fmECyZIqvHthmjeZkQjZVQx
 wcUOITswytJe1N1FTBhFYXTG2pcCvimQCx2t7QI0Pk+I/DbVHzJCBVSjvveYATC7f0az
 LIjm8MwltaBB5/nGJjBMKjVzqUeHv2lknNIWSPpHHyoS1ikNcj6AHYVhsPrcU3wYBk8j
 B1yw==
X-Gm-Message-State: APjAAAVKzDoCAMAUvZpiZO2USKGG0Mt/Up9U3t0s5eRoE8tXkTNgojhs
 9gbwQ8ks8uHFxKra/44s9VwRPemVgLiZQUPpx1VMbQ==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr4245311oid.98.1582916601193;
 Fri, 28 Feb 2020 11:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-2-richard.henderson@linaro.org>
 <CAFEAcA8ipK0nZioEgbNq5B1L-tqA+rzn-C2yyfet4_4yNVnYqA@mail.gmail.com>
 <e4a70637-f4b7-eaa7-237a-57053c5a63cc@linaro.org>
 <CAFEAcA-8a4eQXf+LRS3KLURyyEPpPm9uh6q6r6D-1-sh3t8Pdw@mail.gmail.com>
 <5c484ae5-b4da-8eae-c10a-547c670c89e5@linaro.org>
In-Reply-To: <5c484ae5-b4da-8eae-c10a-547c670c89e5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 19:03:10 +0000
Message-ID: <CAFEAcA96AZB765TizrPLJYfXhx=KUcb_feL3JK1WNmf5dRSR0w@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] target/arm: Improve masking of HCR RES0 bits
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HchuTiMUBJ3/

On Fri, 28 Feb 2020 at 18:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/28/20 9:34 AM, Peter Maydell wrote:
> > You could refine the valid mask as the & of the bits which we
> > do want to exist in aarch32, rather than &~ of the reserved bits:
> >
> >  valid_mask &= TTLBIS | TOCU | TICAB | ...
> >
> > ?
>
> Yes, that's a good idea.

It occurs to me that we should check what the required
semantics are for the opposite half of the register
if the guest writes to one half of it via hcr_writehigh()
or hcr_writelow() -- is the un-accessed half supposed
to stay exactly as it is, or is it ok for the
RES0-for-aarch32 bits to get squashed in the process?
That would seem at least a bit odd even if it's valid,
so maybe better to do aarch32 RES0 masking in
hcr_writehigh() and hcr_writelow()?

thanks
-- PMM
