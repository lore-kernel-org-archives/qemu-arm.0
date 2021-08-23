Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2139204lfg;
        Mon, 23 Aug 2021 12:12:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYV1qXGECERFMv2EGY/pIcLY/2eY6Gw7L5JoLUkbaogjbX1mKyVQ7hdZkNFkjroz2MfIzZ
X-Received: by 2002:a17:906:3854:: with SMTP id w20mr36541961ejc.537.1629745954867;
        Mon, 23 Aug 2021 12:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629745954; cv=none;
        d=google.com; s=arc-20160816;
        b=lOneP1GamR1c+7oH4deNaBdobf6oQpXXYO6BCiVVHac4Oj+3gEyqyqVK6qtFmj31ec
         PQ6C0roLFr1dcwmhGbFlN3XIUOo2fRY+Cb26/jqZX3DW5C4ZFMSid6ka4RBBQNg/Vvjr
         vN6lPRvvKkL2e7moqej58J9O+Fb2GQKHQovIl0NSdzZZb3fDOWtT23h++4VhZ3LH5Wwy
         YZOm6VRzND634Hib9qnAyKJFvIsI90VauxtCLQJZ0J63kDGWLCgg0K5CdeiL3zi5ITzq
         VJdtBX/x5uQHMEJSoIqwwS2d3RYvIXVsncHtWYr34WZQzD6tcF/h9C4aG82Sf5+f1c+4
         2UlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KntA0y1r7+ryrvDp6zq59PJfKZmonmKW4Vo+BnEu4OA=;
        b=0rAa94FrYAgywZfrK3sf+RIfiCq5PXZXxVgkJ/dgMfT2jp+XhjGErGuoxFISjsFaRe
         pLPcqs/r/dN670d0NZpUwXaB/H6D85Zs0Ke6VV5JXt9BqlzNjEWIRVbMXhvDS6jc5Hv7
         g6KoMyEnsDiQ+oKTSdsEKQJ19OfUXCCjTrmjbnRXTo/HqAkKSIPJsn/LU5gHlWy/GyzS
         4/LxrWZBsq2ZZohxAMG3L8MEYhzCR7f0UTc4phJPVTRgutCEVSxvXlgR9wq41CO3YCKv
         /kejO5x3JXAOTmiAcc1bpCMBo61iYOXLKzAw6kLVMHJosu6jIbyrBh6TCqZFZowtQ3gf
         aV5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i/+9IlsU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ec14si15909921edb.84.2021.08.23.12.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 12:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="i/+9IlsU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIFN4-00070S-1L
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 15:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIFMC-0005aV-S2
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:11:40 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIFMA-00073E-R7
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:11:40 -0400
Received: by mail-ej1-x634.google.com with SMTP id a25so12455192ejv.6
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 12:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KntA0y1r7+ryrvDp6zq59PJfKZmonmKW4Vo+BnEu4OA=;
 b=i/+9IlsUQbHWakuLd05NU0MVYuctN+B3n8pMBRmHZvpaRL3G2WtS8qYKko7pwxVhqB
 E7QZ/jhLwVBXHcDf4PM5jnAuh8jtMMlpyEMMWCRqGBPTm1hA7kMVaBQvQmWVumSah1BC
 HJe/8e1kdBxDb4Vd2+5ffJ8R+muwSfKuTsFK1TlRzDoGG14h8UTMI8ELKp93hUom8Wu8
 UmIHOXVGP4SPiVAW3x2CiiIWo+fCLAxmhgGvcWpwapeMjJuVe8oF27gMOjYmRAsEAZ/b
 UKX8wfRyzBlXAkrMcR4PlME6eEtJCd0tzhRmy7COqCLaMkOOKHLfy+16HQi1OuWIh1PE
 i9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KntA0y1r7+ryrvDp6zq59PJfKZmonmKW4Vo+BnEu4OA=;
 b=cJfTAm2vTG1bNqGDC7FwNGjl9sbXFzYQVcFE3fxlhGbHh+xvquncQ1ev3JhFSD9ISt
 7UZuSRfj4FWdcPT8sJCRmAH2kur49q5+YR1e17NGfiqhVwaX9k7UHWfNZQNDw2MCLXOM
 7MTfIV2PCdHybVQyzZ7HKuMUA6e9QNrszMT3S6ab4O1iQV7fms6RbBF8sK7Lz2qMxtPb
 WLcmW1xldZmFw77JaZiC4Hpm2ssdXHlMn5eZCsb5TY04vKX4MBwnspsgB5Zos2IE+pAG
 qSGFE/TOvdp0jwV97hdMAE7xBVOQyxf2VXbm7vg4+JA9bxZe4gRsC7cCl6dpQQc/QGjM
 5lRA==
X-Gm-Message-State: AOAM531Wbt+5Y4RvY2isq9fEaRTRak74Zt/rGtVGgR6BE7yOnkIaMmvx
 b6FF4geeoNA4+iLc1e+R9RWV8b0OHo9GaBNubjvPZg==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr37960090ejn.56.1629745897255; 
 Mon, 23 Aug 2021 12:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210823164157.751807-1-philmd@redhat.com>
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 20:10:50 +0100
Message-ID: <CAFEAcA9_=6n4w86gD3MHhiLeCiui9_+ePT7E2sSHdSRufUJdyA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VNGaC8iE7S8V

On Mon, 23 Aug 2021 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> This series aim to kill a recent class of bug, the infamous
> "DMA reentrancy" issues found by Alexander while fuzzing.
>
> Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:
>
> - MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)
> - MEMTXPERM_UNRESTRICTED (allow list approach)
> - MEMTXPERM_RAM_DEVICE (example of deny list approach)
>
> If a transaction permission is not allowed (for example access
> to non-RAM device), we return the specific MEMTX_BUS_ERROR.
>
> Permissions are checked in after the flatview is resolved, and
> before the access is done, in a new function: flatview_access_allowed().

So I'm not going to say 'no' to this, because we have a real
recursive-device-handling problem and I don't have a better
idea to hand, but the thing about this is that we end up with
behaviour which is not what the real hardware does. I'm not
aware of any DMA device which has this kind of "can only DMA
to/from RAM, and aborts on access to a device" behaviour...

-- PMM
