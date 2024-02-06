Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1965584ejb;
        Tue, 6 Feb 2024 09:46:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHi7DUw3Wo3fNSjoAviWtRQZAJIL7eYMnG5NPXfoQgTwQCFY2WAmw1zXSUHdNh0OTQS/ik
X-Received: by 2002:a05:6214:20e9:b0:68c:72a5:a93d with SMTP id 9-20020a05621420e900b0068c72a5a93dmr3387992qvk.27.1707241591279;
        Tue, 06 Feb 2024 09:46:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707241591; cv=none;
        d=google.com; s=arc-20160816;
        b=W2q1PnLBPsRfVyqBOeplbTBw7IRqHVlsuSeo2tvZ2KPQgNx3soqeSKEUtJwi17A2qj
         JK7goAIn1UOsEX7NWLJmaK7dfDbQNjaEsgRRCh0/cHTJ+P3kWJU0/HjGJ45xxYoP9ws0
         3sy0NvEW6nBfDxbw9FLaeH1p3zvQdez4J+zJPd6mgQ8w4hchxnRMleOct0jGt+k2DuH+
         9nu9gjpk2A/Ar1VMMI+3vSX98xKpmIRxuUYkvsXZfIT09xII7Oni7Huxcgl4CBSWksBE
         7D7T+Qp1ch++dlPrULW8lSR9t7XXLaQRN0j6PhNFO4h6uryc457sxlVz1IkoC5d+4Z1I
         st7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Tp+8vZ617JGjQNAydqXDnkXmQj2eSEDuQMcwtamx0mc=;
        fh=vxnBENKWwXl5J6G9zGnk+dS7LxBPevR9NzgLpTzXunk=;
        b=lz1nDeM78VaAVQr+JDmGOr9wp5aP707TV3LFpXTGzUe50NzHMGRmEOkppMengxoaIR
         UyF5FVtfU4syaqcIY+MotDB760KYWVchGOOafcVDShTPW9MBgqIg5KIm0STAweRje5u8
         BZAZOL19Mf3RtfYSVf8PT9ThA1iVh0A/8ws4cDfaNjlctzcMvbVCJI9JiSm7ugHZKaZ2
         XwlFM3GJkPNkEgkB1MMT+g/2zuVmTvRgMO8xd3c50MKb365x0wIn+UYzf4pA8r/htAGI
         RhKvIAvUDzYPQ8UqwR91P+ohGLB3pgO/w9pua44WBDfyPsWQrFgMaFspJum0fyFq2VNu
         28Xg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IimpNZVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXLCdV8DtQkd2pAc2k6KkhudN8mDdnaMcJTsvuZsac2Iar42w180gqn1OpQiqT/0KV97FxW1kWhHCmHt0GxLM/BuVwFdZzj
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke10-20020a056214300a00b0068c7aacf0basi3222799qvb.354.2024.02.06.09.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 09:46:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IimpNZVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXPWb-0001NL-Ki; Tue, 06 Feb 2024 12:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXPWW-0001MF-22
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 12:46:20 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXPWS-0002a9-Md
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 12:46:19 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33b45e8a670so634368f8f.3
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 09:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707241575; x=1707846375; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tp+8vZ617JGjQNAydqXDnkXmQj2eSEDuQMcwtamx0mc=;
 b=IimpNZVmNnGx3+ouZO7I2ztYIYbCuT2gJr7/qYPLvSZYsRzUe/X0bQnPXGhf9hEeN+
 KMw0kL81XjSzZ5DJbhWnsrAGpujHy8tSYzU6fheM+iBu/la4IpLVWoH/FsHg57/BRG08
 OMCkIExZ4tANnRwl5wn0ifVoZ7mfYDaWvtlBsIygVxIMgTW8DXl9/EvKPifiIygv9zPq
 DnvKJ/PmCWoc8bOlMVtWr8Xdv5dDSq5wX5XmsEdEw4QdZDWykTnLnb2Iv/XJ9YEgqGDn
 7nu+LAzwVqydiecheOXhmQZPu3PwckoaprXX+EryXq8Y5VWwgbjdCQUY0DgvPEUrOaNH
 ZvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707241575; x=1707846375;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tp+8vZ617JGjQNAydqXDnkXmQj2eSEDuQMcwtamx0mc=;
 b=n+SprATTys858OE189X3/+ET6iRkBWvZSx3gb1bejBIdMO4k/WkWdxjHITYKJv5TRv
 tj4A1ldYCbbIfMC87ThUTPYa2Bf6Vv5vwFPVECZA1NzqY6Tb2dXYf4dAWQC42tO3krjs
 LP4/WfKXz8CUT++6lhoHTLM9Or5z1RAgRsRlP8TywOTbRLkoGYMVrBBAooSt1vTybHIS
 GL/HYRmHVlWk0XiT5Ij/zXTAUYZscYt2DlvQZ19DdaZolMHN8xx/rPpOGJXtuD/ZqXMO
 oYhM1BcqCoxHtsDKHh2mumZdv8kWX7DhjeFS/EscawOHKeJHFPxry4MTU/d3JszO+CjY
 SWjw==
X-Gm-Message-State: AOJu0YyJMYYpwo6MYC3YBE8bVmuaWD+U40T/SpF4JiYOeR5vJYMP4xrj
 qOllEtIPae2eXLLthekBc8YUb3pUCEOtgx6z1O7EBOBIS5sTBA4En1voEyh0fe7db1dUmWxO46r
 lngA7lgAs0vCu6q81bmPqmiV1R48wHIw/eUrZag==
X-Received: by 2002:adf:fc88:0:b0:33b:304d:36b7 with SMTP id
 g8-20020adffc88000000b0033b304d36b7mr1686640wrr.56.1707241575063; Tue, 06 Feb
 2024 09:46:15 -0800 (PST)
MIME-Version: 1.0
References: <20240206171231.396392-1-peter.maydell@linaro.org>
 <20240206171231.396392-3-peter.maydell@linaro.org>
 <bfbeda026f49803025e2a90e41c5e043c93d1a59.camel@infradead.org>
In-Reply-To: <bfbeda026f49803025e2a90e41c5e043c93d1a59.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 17:46:03 +0000
Message-ID: <CAFEAcA_-opZFSEn4DLGzkpGkoAxJsCpD87SR2Hn3mGMtx-Hy7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/qtest/npcm7xx_emc-test: Connect all NICs to a
 backend
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Nabih Estefan <nabihestefan@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: 6Z+ucrDfJGWl

On Tue, 6 Feb 2024 at 17:36, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2024-02-06 at 17:12 +0000, Peter Maydell wrote:
> > Currently QEMU will warn if there is a NIC on the board that
> > is not connected to a backend. By default the '-nic user' will
> > get used for all NICs, but if you manually connect a specific
> > NIC to a specific backend, then the other NICs on the board
> > have no backend and will be warned about:
> >
> > qemu-system-arm: warning: nic npcm7xx-emc.1 has no peer
> > qemu-system-arm: warning: nic npcm-gmac.0 has no peer
> > qemu-system-arm: warning: nic npcm-gmac.1 has no peer
> >
> > So suppress those warnings by manually connecting every NIC
> > on the board to some backend.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
>
>
> ... although do we want to expand this test to cover the GMACs?

It's very specific to details of how to program the particular
ethernet controller. The GMAC is supposed to be covered by
npcm_gmac-test.c (but that has issues of its own, see
https://lore.kernel.org/qemu-devel/CAFEAcA_gkQz7q+PhiqrVd+YrVJvLt1H=Ypp4av9qn+6mYC6jdA@mail.gmail.com/
and in any case doesn't yet try to actually exercise the device
beyond a rather minimal "check the register reset values"
test that doesn't need any particular backend connected).

thanks
-- PMM
