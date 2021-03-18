Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp730172lfg;
        Thu, 18 Mar 2021 14:29:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFor2MBpera73q++453A4JjsPOL3dDqkO4W3VrU7zpT6epX7b0tSouXOOKA6StLbgtKdgV
X-Received: by 2002:a6b:b2cd:: with SMTP id b196mr457442iof.67.1616102985814;
        Thu, 18 Mar 2021 14:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616102985; cv=none;
        d=google.com; s=arc-20160816;
        b=0T5XPGd4o3s9eSbAJaUDYd6QoA2PTqki1erfjLVtgoCp6YCjpBa/Lc+LEXshcoibY5
         HX4ZnxXRPQpDtkPG4ebXxnDMi6BlFqZvNKvOtWcSLtm6NxTdf9SmsdiRs2R5lS97NVAL
         z7uajE+6e08gNibXOOTcfIQW4nf/8Sy9hDd52C3m6CBBw9IpTq5V3kwh0LBjlM8R+Ym1
         rj9AMFz9BH0l0BbWFVgL32bCKAsJCwkj+xlHzZWNnC0VfP7BEgZOcv2vGAKfeMZuClH9
         HvrdlT5YGQJ6H8kXJ9FUdqL77qGNlXW+MajwFVQIihP5MWRB+xwQcoMPWUG0QcXmb/RV
         4FTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e96zrz3bBkHkSRTd5wrEVa/AuScRiO2HztO8NjaOxcg=;
        b=kOYh7QnmCG1/XAB8A7ycQtabbITtpw2N6D4g437xHGzJ5r6m3qOdMAtG0B7cz2v9kC
         Li8HRSMw8/LpPWXS4BptypQ805HUZW49w1Z9rAea2PjHEc87mzjf1nUIp37v4PLkRova
         OiYTDfrakU/oVHo9UVTiV0rutxBQfCFWzJnZNpnJBNOt+SkiUfwqY4S0bR+ziQl+jbdk
         YdFzT7wvIQvR/v+vlGf6wglUVk7qHYPtWxBEBNhmyWNotKHnKiCp1E/6xKJ4uq5c2anW
         Xl3FP5GfuV7vTg0OWSGHBiGC1ifl1o/SrAySMrxBjKII8ZWB2vSr7wivpPf1sC9/qjfv
         HbGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cTFbh8ou;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si2218597ilh.73.2021.03.18.14.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 14:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cTFbh8ou;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lN0DB-0007dx-3F
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 17:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lN0CX-0007cV-B0
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 17:29:08 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lN0CR-00054K-Vz
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 17:29:04 -0400
Received: by mail-ej1-x632.google.com with SMTP id hq27so6250298ejc.9
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 14:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e96zrz3bBkHkSRTd5wrEVa/AuScRiO2HztO8NjaOxcg=;
 b=cTFbh8ouw652/gr5ri874gGVMntqOKs1+JGAVc9lcA/9Zz3aAOcSSL9S9Sk93/q7UC
 cywZEPj9qGDw43ROGSYItZDkb+N3yiWc9WYY4zceEB8o53FYo0reWs/oc4fymcMIAT/Z
 ORxwG5Dg48PVoi0ee2bhz4sc3V5Mba4rSwxKzNc2vuhHiPDXQB0s4VSPKotAd9aFCBac
 hvu1rsQnV0s7alOyi2FIzkSCCSuK7nvkEz90qp9s7tQZQ8hFU6sGGI8WXB2e9GIVE2K1
 zs8HbfsCE/x5oEhAQ2PRHwvPHOkt3J494PZht5frrAEOtghSsoZSYMdBouk5Ltwwgcw/
 V18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e96zrz3bBkHkSRTd5wrEVa/AuScRiO2HztO8NjaOxcg=;
 b=b/PFyEeIAAdlsKmsBBtf8MFUlFOtkfyvuXtYGrMJrfQ5PaOjuc/QeowZ4uoVM47I5j
 pg4ylUTZgAYxx2NaeI4isiQgTfK6rUhtHVvyp6husugIg5JGuU3k2otPn74iw2TAe6Nq
 p1jqye94CI0LtwIhuQHYUhvszdNwFI6IeuC62sX0q+cRIXYoQdw/kU06+rvnJCVOUb0X
 Xcr2fia15yievE8gK40Q/4iFvMI9Uxr9u5ZMDIWcVbhEUdbDON/7vAEakCg/nakt7IBQ
 D+4jped6KCXuElgkCwQI4qB6hUs4g0aNMDEuPWLBw5UqhX7s577d3Ib1Y3cOpYWqgZFz
 cACg==
X-Gm-Message-State: AOAM5336FJUORcUeMKBZCweLWXV4ROCn8Y+0l0e5R1nQnq4/JMMy6gDL
 /6HgmTD0AiNsPjgZ/Ka5n3/LI2WhW5EzbA12LuoUGA==
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr686599ejb.56.1616102938260; 
 Thu, 18 Mar 2021 14:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-5-peter.maydell@linaro.org>
 <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
 <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
 <ec96b321-80d4-948d-b482-dfad61eff67f@linaro.org>
In-Reply-To: <ec96b321-80d4-948d-b482-dfad61eff67f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 21:28:33 +0000
Message-ID: <CAFEAcA9i21sTkYoMfMt8sgN+18B3uHSqzG3No7k-+XJkzREi9A@mail.gmail.com>
Subject: Re: [PATCH for-6.0 v2 4/5] hw/core/loader: Add new function
 rom_ptr_for_as()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TO+nSMO2fhMl

On Thu, 18 Mar 2021 at 21:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/18/21 1:02 PM, Peter Maydell wrote:
> >>> +     * Note that we do not check @as against the 'as' member in the
> >>> +     * 'struct Rom' returned by rom_ptr(). The Rom::as is the
> >>> +     * AddressSpace which the rom blob should be written to...
> ...
> >> Should you really have this special case?  Nowhere is this going to verify that
> >> @addr is in @as.
> >
> > It's the "happens almost all the time" case. Nothing verifies
> > that @addr is in @as anyway -- see the "Note that" part of the
> > comment above.
>
> The comment explains why we don't examine Rom::as.
> But we do check @addr vs @as via @as -> @fv -> flatview_translate.

All we do is look for "every other address in the AS that
maps to the same MR as the address we started with".
Are you asking about the !cbdata.mr exit ? That's for the
implausible corner case that the caller asked us about an
address with no RAM. In that case the early "check rom_ptr()
directly against @address" gets us the "did the user load
an image at that address", and we can skip the "check for
other aliases, because by there aren't going to be any
aliases to no MR at all.

thanks
-- PMM
