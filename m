Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4510553lfk;
        Tue, 7 Dec 2021 05:38:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNnyDdiVSmJ+H0rbvMeaDWybQUWCUUTiuLvJXZhOzrJ53wOoR0oqlmsDRCxFuUWqVqa1ht
X-Received: by 2002:a05:6214:2303:: with SMTP id gc3mr44741612qvb.90.1638884291220;
        Tue, 07 Dec 2021 05:38:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638884291; cv=none;
        d=google.com; s=arc-20160816;
        b=dxEFH4H3YSM2ETzPSYeQY14ErE3vddUFPDxBMhC0tJdv59JdXJ4mOfBbVOCNtA+70+
         yHJ9LV1Oknov8C6qgifE7P8uM+fQoQv3sv7HbEGU2y7GG7th0Si7qpP3yO5sLEIc1sZP
         HCdoN30K8RceceIDht+ZhOhdJF0HcQCa7SY94Y1VgEy7XfSA+fUJ3GFS2WE/3ClcK9l6
         /gODeGVnMGhr5QeUKYYVvfX0G7nAc09DnMr+e5AGg7M/TtxZjEkxA9sBt7zSjrpTVwDV
         9+hvyhul18HQq9Hdlrb07BljalsIig3bxUvW7PTUVI9bKtkS9TYdtZ18B4e0fhEIwicy
         aLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MB9U9JPpTmeSHHfjfxPgMmDln8X50d6NlS0Btl6ZfG4=;
        b=o2dEeZPFXKWSj5EzPIWCUhT4gVQLBg/KrgIjYCBCcgSpGfpsTuI0LumcphGxoiQC2f
         acBmtvguv/4taH2F/x9EYGeDyWazlcXzbeduMkuQtgfsoVLzbZUAn+o9rshsViO3CV0i
         ZRtvr7bOmZyplk3dBGSoBFg4oMA/toge4CVOSdFVBy2JRYgK+aqtlgDKLcpkvsZl3/Tl
         YXvnzvyYJoG5T9RM4JA5Y451IG5eCqjagufU+FVNCW3GBu07Fmvi0q/8I0GWOi/XuZ9Q
         dEPIVPrTKNCPYM7IZjykGd7ik5cwtkwS9fGGndDIBa7x6DbaPpoaajPDDsoLUGbcS6KG
         0voA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VtMfmlt1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si13674484vsh.791.2021.12.07.05.38.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Dec 2021 05:38:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VtMfmlt1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1muafa-0007Ca-Is
	for alex.bennee@linaro.org; Tue, 07 Dec 2021 08:38:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muaab-0002FR-JY
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 08:33:02 -0500
Received: from [2a00:1450:4864:20::42d] (port=34568
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muaaZ-0008Qc-Re
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 08:33:01 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j3so29577802wrp.1
 for <qemu-arm@nongnu.org>; Tue, 07 Dec 2021 05:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MB9U9JPpTmeSHHfjfxPgMmDln8X50d6NlS0Btl6ZfG4=;
 b=VtMfmlt1Qj2HCk/B7pWi5LAenEJoo2XBAeVckmtMqXODbsTHs5Ax2SBsc9rNVXC6BA
 fZQm1rcqIPxkKtBQb8dF4VDqYkWY0OCqUdRqs7KV19e3uH6I6upFPD+sV3skekThBccc
 y3pb7lD4SkXd/F8kb6fB8hMIPgltrB+W3dc2whVgsOk2+1nxLUhCIB4/HePiJme+7jUA
 i16M21PwHabBAlLjzrPpRLLQ6eyoFxBpGI6iiEitmDJC6AgVYHhuBiC54g11YfcwEVC1
 PPg7p7rVpjLf/187djsioSjkx2XZjugUEjOED3noSWExNah97J/gYyQ8uuA9sDMs1hVx
 1MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MB9U9JPpTmeSHHfjfxPgMmDln8X50d6NlS0Btl6ZfG4=;
 b=QVBcgxyRXdtTOFKitFhF/lCKMqgQ4gpSUKy51uZ/XWAo6UjpcR02AnhNo8YkYQ8eeN
 RNU+6a8OrwT62RWF8JL1ev3d/WvgWJbcIL+QT9Cwi0xa1zMhove+b95exogy4hRCrIzF
 t89HRYqUSHO1qwqLmB1NAytaI8t+12U8xdnQV/pW+w4r6c/WQ6IeHhTt7J7YGZ67lu/X
 uryZtOKT9pj3MA/pN/K2+BRcm5Mj/wSOVL0SYt+M++8uibyD//4mkPQPslAeQpLIBnch
 PjaChmyL1fJNrhpdBAM+x4SqNpuiD3oO/Rz9HhAqlxhcyGU0TEERvTAflDqhfGtwYIGF
 lwVA==
X-Gm-Message-State: AOAM5337H7Vw5/xpox02CLvgkXfp8qFWRBbGpq5gwIuBScAsDOdlGXcx
 AsvymZHP2SPY9DBdeoMP59dQIMZdrOCdxUOdKLpeuQ==
X-Received: by 2002:adf:ef42:: with SMTP id c2mr49449216wrp.528.1638883978082; 
 Tue, 07 Dec 2021 05:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <e0419fd9-ce18-a4f6-7c8a-36e36dce2ae4@redhat.com>
 <d77f21c7-2b92-2c45-aabd-36148f7fd822@greensocs.com>
In-Reply-To: <d77f21c7-2b92-2c45-aabd-36148f7fd822@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 13:32:46 +0000
Message-ID: <CAFEAcA_snfwV8gBoo1ZHwqSimJEoW7+TVsa=BhQikxJ5sqP8Kg@mail.gmail.com>
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qDM3I4+ny7Bc

On Tue, 7 Dec 2021 at 13:05, Damien Hedde <damien.hedde@greensocs.com> wrot=
e:
> On 12/7/21 13:45, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 12/7/21 10:44, Damien Hedde wrote:
> >> According to the "Arm Generic Interrupt Controller Architecture
> >> Specification GIC architecture version 3 and 4" (version G: page 345
> >> for aarch64 or 509 for aarch32):
> >> LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE=3D=3D1 and
> >> ICH_HCR.EOIcount is non-zero.
> >>
> >> When only LRENPIE was set (and EOI count was zero), the LRENP bit was
> >> wrongly set and MISR value was wrong.
> >>
> >> As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
> >> the maintenance interrupt was constantly fired. It happens since patch
> >> 9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or=
 1")
> >> which fixed another bug about maintenance interrupt (most significant
> >> bits of misr, including this one, were ignored in the interrupt trigge=
r).
> >>
> >> Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system r=
egisters")
> >
> > This commit predates 6.1 release, so technically this is not
> > a regression for 6.2.
>
> Do you mean "Fixes:" is meant only for regression or simply that this
> patch should not go for 6.2 ?

Fixes: is fine in all situations where the commit is fixing
a bug that was introduced in the commit hash it mentions.

Separately, given where we are in the release cycle, a patch has
to hit a very high bar to go into 6.2: at least "this breaks
a real world use case that worked fine in 6.1", and probably also
"a use case that we expect a fair number of users to be using".

-- PMM
