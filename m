Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp171943ejf;
        Thu, 6 Jun 2024 02:16:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVhApzFfXCd9tliyEhiUv/aGdWO8P0nSLvZgvGOWZY3NHxiA2LapkNjKMOKsqpNFDFRIJRixSmwIxg4LfFU1uyO6AQfPN+A
X-Google-Smtp-Source: AGHT+IEHrBNQfmZkthCDIdWCQYUaLId10+HJna5jiL/qJ3E+feUx4EL+eYlr6hPw4Gmk7xnkGSbc
X-Received: by 2002:a81:ef07:0:b0:62a:a6:ad5b with SMTP id 00721157ae682-62cbb5c0810mr51268967b3.45.1717665382985;
        Thu, 06 Jun 2024 02:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717665382; cv=none;
        d=google.com; s=arc-20160816;
        b=s9GXqKTXTGCXhAmQt41Rr6qZ6/WH8Rq4MTEKFDujPYod+Lk5AkuaDOz9SgJkmXAzkQ
         AA3prqvT/oN8FxkyjtBGt8PuyapI50Kqx8VXtOlQNlJi6hRQyF1bUF4bbRlheoXbugie
         uvDbYeA6FRZjLCxY8+Qz35SAWkYMrRpgoHEiAMO/N9t2PCZguFM36z978iblNiuqNqv3
         f1d7r31Xr7uyBMVswrOEY0ryt+PklBfTSEHnHUeARWWbXkKKMvP3lgl+NIFMzMJPpV7D
         ZywQRV9oa9/NwgvxN5REc2/XgcU178x2ay9fDtxF3i8UjbD84ksfFaCmcCLIFdvXzBIu
         QbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RyFHHn4laOD9s1kWDbBzpnUCYmHLXV30EXXSuP4dGHI=;
        fh=rONAo0C/ir1TXMHOBD8fhsJ6N+4CaUsrN4ZfRJHEQrI=;
        b=a/u8v79GC91eKZffstlhN/t7C+kihlOfiPff8x7/pRARfso74HkLuhXA9zOKuruQ20
         b4A2P1pYbRzpyItnsf7yKJsDIk2XuZzU771lo6k5Zdhg33jvBn8QWLCGzxhgjAXnbN8I
         Shjtdpw8i2OEDJPlVYAKP+1I7G2bNIq5t1O4eJG75d7lBFPBQrSpgSTT1IO2q1Zvu5k9
         +NxyyRoRhL6EOwfzWEZlgRag8HiI6YmvQs2YyAS1IwUvBOv5QvrL/hav0fIqO47jkYhH
         ZO4nwdoVS41KlKrVEdOWn9+m+wW+Sq+wSuYRC69TEKECmTLVs6jaqNAKQfA4HTwIJ60G
         BKzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BAEW78zZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b04f68144bsi11044116d6.150.2024.06.06.02.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2024 02:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BAEW78zZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sF9EC-0000wa-MR; Thu, 06 Jun 2024 05:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sF9E9-0000ue-Tt
 for qemu-arm@nongnu.org; Thu, 06 Jun 2024 05:16:10 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sF9E4-0003cO-V2
 for qemu-arm@nongnu.org; Thu, 06 Jun 2024 05:16:09 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe639a5so746140a12.1
 for <qemu-arm@nongnu.org>; Thu, 06 Jun 2024 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717665363; x=1718270163; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyFHHn4laOD9s1kWDbBzpnUCYmHLXV30EXXSuP4dGHI=;
 b=BAEW78zZXia84abwM7ctAvGOKGPfjr6XWnRLr5ix8fuH4o51lWA8FSWvj8/OCn50OM
 NKRi9l8Ej6DOAC68cxUiicxM6gt0pvA0baRvdsHcnBtQrilVgltmfrTmnSsrZN+N1bWB
 dtwCHgxYALBDD17c/aO2UFcvQsURdPHE0I5Fyjx03bS3z1u2mWz6wdK+FyZaUV9HkQIx
 Mkq45svqnxrybYsRkWAqviacOMpkTMw569/yWDcvcLQbMJ7M8ZIfI2hLrcp3tOdeS9kY
 tfZFLNLa7B0m2TJ9rsonGTImjGvebe1UeRIJU9C/55kljZ8JlOUGOrNpvTVc3XaiV4VS
 JcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717665363; x=1718270163;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RyFHHn4laOD9s1kWDbBzpnUCYmHLXV30EXXSuP4dGHI=;
 b=nqLjCPBuYRG+uta/NrJia9iLYgAYGvhfztBdMLmA8/rS8+069i+CqhYLXOXSVWCnJR
 l2xdQi7kFS/Dld324z1+gxLAcfIdANT84acevO0+fGy0PQoLoVMh3jL2g5J4KhaSP+VV
 icRCZ0VHUE5+HyvOyZ8zXuxmRfEwZKcs8Bozgo5THrlg2L1U1NWSZrqKlu3pybWAELkO
 kikwDK0E4skpi1DHOfpT1/puGEOAket4i/MPwoKfAPMg7kHbdlTVigwcXgk9tKA+Fw4y
 i56qyns3GnXztQzKrilMxv5Fjvg8YgqaCq1xLV4vrG7UQRUTgffrnssq8IU/nqfd8yqh
 ghfA==
X-Gm-Message-State: AOJu0YwuLOteETa6Y1eESvcb1B+Ddo8LXClDs+z7UOe8Bck0bR3EVTo0
 5yBGVwJq4tt4i4Iue/GHO3ZyC6ANjpNfGWWvZpif4VGBmuAOS4QTvVs6RvKt6wxOqsM0UV/e7zN
 otujPhyUFcYFQUjgp0fJf7ZVe9CvKX4aI21r/tMX7h0tPulbC
X-Received: by 2002:a50:f61c:0:b0:57a:858d:20ca with SMTP id
 4fb4d7f45d1cf-57a8b7c7c0emr3561879a12.28.1717665362547; Thu, 06 Jun 2024
 02:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <CANm_edoii9xoBNs6-hMdbmjjF9MXAo9UkbhduTMMkohZOvnviw@mail.gmail.com>
In-Reply-To: <CANm_edoii9xoBNs6-hMdbmjjF9MXAo9UkbhduTMMkohZOvnviw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jun 2024 10:15:51 +0100
Message-ID: <CAFEAcA_Ei6TAYbx+jH6R0pmU7-bSHFLx9WnS0OFxRWj=LCs1BA@mail.gmail.com>
Subject: Re: Arm64 FEAT_MOPS option B support for heterogeneous systems
To: Nikolay Gogsadze <koliagogsadze@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: mcy+brkckI7+

On Wed, 5 Jun 2024 at 18:49, Nikolay Gogsadze <koliagogsadze@gmail.com> wro=
te:
>
> Hello everyone,
>
> I have a question related to Arm64 FEAT_MOPS support in qemu
> https://github.com/qemu/qemu/commit/5d7b37b5f675d9cee0c9c1f8b386b3daa3cc2=
d9a
> https://lore.kernel.org/all/20230907160340.260094-1-peter.maydell@linaro.=
org/T/
>
> It looks like there is no possibility to emulate MOPS instructions with o=
ption B, only option A is supported.
> https://github.com/qemu/qemu/blob/master/target/arm/tcg/helper-a64.c#L157=
9-L1590
> https://github.com/qemu/qemu/blob/master/target/arm/tcg/helper-a64.c#L168=
1-L1684

That is correct. The architecture permits both options because
for some implementations option A will be easier and for some
option B will be easier. For QEMU, it was easiest for us to
implement option B, so that is what we have done.

> I checked linux kernel patch add support FEAT_MOPS https://lore.kernel.or=
g/lkml/20230216160012.272345-1-kristina.martsenko@arm.com/T/
>
> and found an interesting thing: a memory exception can happen in a hetero=
geneous system if one processor implements option A and executes prologue o=
r main cpy/set instructions, and if after that the kernel re-scheduled to a=
nother processor that implements option B, it will be memory operation exce=
ption.

Also true -- this is all architected to allow for heterogenous
systems or for VM migration between hosts which took different
implementation options. (QEMU should correctly implement the
"raise an exception if the CPU state indicates the MOPS sequence
was started on an option A implementation" handling.)

> It would be great to add support for virt board to choose which
> option of mops implements CPU to emulate and test such cases.

This is generally not something QEMU does. We aim to be a
(mostly) compliant implementation of the architecture, not
to provide a lot of configuration knobs to set our emulation
to multiple different points in the envelope of possibility
that the architecture allows. Trying to satisfy that use
case would be a lot of work (there are many many options
and impdef choices in the architecture) and I think the
audience for it is very limited.

If you want to do that sort of testing, one option is the
Arm AEM (part of Fast Models) -- it lets you select which
of the FEAT_MOPS options A and B it uses via a command line
argument.

thanks
-- PMM
