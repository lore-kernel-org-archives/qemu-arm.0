Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2608999ejf;
        Tue, 27 Feb 2024 03:28:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbF2qWuW2UhASZIpq87c6T/eh4rTVmF4bCJ3q3xRo72lzl3fRpoXC7dKv7t9Rz7e0b7IJzCxI9h5g6lvmLePdydYn8Edar
X-Google-Smtp-Source: AGHT+IFClELJA6oh9Z1wjydpjf/FuNluU2MCyQDimA6vH2VWTEM7L+nX74CCSiQRQwbNzs05HI/c
X-Received: by 2002:a05:6214:2622:b0:690:d58:c6e1 with SMTP id gv2-20020a056214262200b006900d58c6e1mr2621399qvb.23.1709033291350;
        Tue, 27 Feb 2024 03:28:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709033291; cv=none;
        d=google.com; s=arc-20160816;
        b=tHYQ6ocWxgnygT5xxm3ItOCrOD4w2plfArnRbjJwoaiVBykT2nXjgsuWvWLoLSt0zb
         jPhcNLw8q8djVub5p9PVVe3gico5APy7df+jhA30nLTUkF0YzdX1Q5c6HodRAFTTwCRT
         TUKWBDT6DDqxFA2k5xqjU3MlT8LHD/TLU62DK8g0WRjOt8Vts+9G+jIpojXdnGbpWo6x
         CvFKG+eNn3q/swbKrcRf5QhFfwtgWnBFXYQyOC0nv3o1KRc5feXIOM+YCSIvvY2UcFi8
         tRNaeXHkh9zuw5pR6qFm+Fq8opK1Lnj96FRmjb4ZI4XUK9D54GsR07uifLVmTvgbFL7T
         LLjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yH+ysTtQHkZx1mKQLtwZgc/8OT4X9Vo3uEOds0+TbkI=;
        fh=WxHSAr0douJCho47EDhfM/XjfxwBwDauKoNbFX9eT8I=;
        b=rrEu8MmVuYPBUSa8Nl117y52kPBNAPc56pKZPG8UVD3lEqxdm5A8ZVMhCjq0wKWMYi
         izR4yaKq+hj88HpPKN7gqIFWGjFja7+Z4jVToEwpNhtLvV5CtnqHeZJIzclICr3g7wyT
         lIEYMa6Od/EeZu4G3ZiQqO2U4Rg3Rn1Z9OsoQDaAsu2y+2bCgoHR8ClhT1ps298rhJ+t
         MAMk1F1mdPzyaNVxLlvlNLVk+DLou1ijp+DBOlqFyqskMfWTcqRHP+6V4YqF+1/iDskA
         DDZqOn6sgrPvuiW6dw3/2riv9VJgaH+chWbNAbD7G3Mt0oZykMZYpzq5NaVxAI8Qo2Zt
         Yt7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szpRvs4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf6-20020a056214250600b0068f8b839896si7641749qvb.472.2024.02.27.03.28.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 03:28:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szpRvs4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1revcI-0004Pt-Va; Tue, 27 Feb 2024 06:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1revc6-0004Js-Qn
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 06:27:12 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1revc5-0003Hi-7v
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 06:27:10 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so6364885a12.1
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 03:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709033227; x=1709638027; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yH+ysTtQHkZx1mKQLtwZgc/8OT4X9Vo3uEOds0+TbkI=;
 b=szpRvs4uPdtOMxouNbwIO3z4guN9KoBjCtWtIXhhKF+ttfOLtFbi9IIA9VssS0kih0
 vmbtG9mrNiO1eeGPlvWlh4deA4ht5RdWpKNIJf0l/DaVkXTslHoq7+4cNeaX5ky7yLYc
 0HP1hFzNPzJ/AORH2Dd6Lbhyx6o0j050uOnvOLmumA8LzviF87VuBmiQVD/3l5W37ST4
 HmiympUcLH90ktUvCD8vXZDFQwsno9SAuOR5OvgDNOqi6ywJq8XKKsYXZQqzCrqV1hSk
 NBy+wae/deLwBvhoouc1gvGNMgUGdIrMRRATxSS56xYwk71xBLlhVWiGpiEpy+/c2M9U
 ZDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709033227; x=1709638027;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yH+ysTtQHkZx1mKQLtwZgc/8OT4X9Vo3uEOds0+TbkI=;
 b=bqqHJ9qlK4ND7qGXh9ZFyNsla9oeSZ13+0+P5OllOOENQ6/g+UQSBsyliZ9Us1YFXR
 ffzCosMdBGKG/vA80CvWKzNHALdNkH7Vet4LhuDPXuy+6iNkz32ZG1yYXUhUuOHvddn8
 RVu8cI9V0InvUXYWXbfaGmEvXwz4IKfH+KrksDGSO6o4KzaT983nfxULCoOuq8gN4th8
 N9g3tsisspQAYTWz8do6Hh/SYW8jp659XvAHqpypm/z2/J8+IJv9X1nDl+9+NFkk3H9F
 Th/bzdZ6eU8m9k54TYe9sYNDFzK2o5j6+YNUJCsKe8kdomDS8WuWkR/YRNweD3eggHKK
 JTEg==
X-Gm-Message-State: AOJu0YyoKOXOUXnkNz0QdGTOBhkbp7tVdZT3bJrDI91KQEm9Qf+uovFM
 7SyQcmcsYKtCK8SuYUDmt3DaWPvoHeZMABgzaQ52kOccHVgWaS83G2pic1e7RJBQzmH5r8WPE1S
 erZ3ok+bbjkhW4tWfYwMqS4IxJw3TioeOgjsTag==
X-Received: by 2002:a05:6402:3126:b0:566:4e7a:fa2b with SMTP id
 dd6-20020a056402312600b005664e7afa2bmr125483edb.36.1709033226883; Tue, 27 Feb
 2024 03:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <CAFEAcA_brkckzDZh_-UJ-KFfBGvjPozPHNmG-bWFO0Xa63R0Gg@mail.gmail.com>
In-Reply-To: <CAFEAcA_brkckzDZh_-UJ-KFfBGvjPozPHNmG-bWFO0Xa63R0Gg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2024 11:26:55 +0000
Message-ID: <CAFEAcA_An-KUbaKHDGmk7Uiovft-8JDbW9J1s36wccS2sh9vJg@mail.gmail.com>
Subject: Re: [PATCH v6 00/41] Raspberry Pi 4B machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: GbXlJ0QAuCQV

On Mon, 26 Feb 2024 at 18:09, Peter Maydell <peter.maydell@linaro.org> wrote:
> I think the one question I have left is the name of the
> board: currently it's "raspi4b-2g", but should we name
> it just "raspi4b"? None of the names we use for the other
> raspi boards we model have a suffix like the "-2g" here.
> Philippe, do you have an opinion here ?

I had a look at what the different raspi4 models are, and
it looks like they're all the same except for the amount
of RAM. For QEMU, if we wanted to allow users to pick
the RAM size we'd do it via the -m option, not by using
different model names. So I think on that basis and to
match the existing raspi machine names, we should call
this simply "raspi4b". So I'll make that name change in the
patches I have in target-arm.next.

thanks
-- PMM
