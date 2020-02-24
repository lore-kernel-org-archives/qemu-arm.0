Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp651465lfg;
        Mon, 24 Feb 2020 10:42:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqx/WNyFCeApInk1C+o4EVwk3J8D4Mk4DAYbdF0fZfL5ReXAs/Zm9rzh+VJig6Kgxa11YSwB
X-Received: by 2002:ad4:55a4:: with SMTP id f4mr46014715qvx.221.1582569751230;
        Mon, 24 Feb 2020 10:42:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582569751; cv=none;
        d=google.com; s=arc-20160816;
        b=VtjWQHgn7BnX+fiCOf4faTGx8PG+tJwZAEQDINHgOcDT274YCX3PG/NHRPA80aOsGS
         wCnNoEFuDF1FLcQwJi/E+PHjoKa1vID6itCjXFoQrOOTfUUB6mORqmG4imu4oqSWU0zC
         oAQUVE5wU/NOOzR0z7q35PL0BVTFhqKXwvOwd4NbzT3mhm88XoO91Dyy9vfFf+Rm3w4h
         YXAHBQYJrwycE/waekvlWxDv/RSvZfBRj1JY+uB3iQ1YFnMxU372oAw1FS5ZZ/mpSoQK
         xkEox7M8FCPwhqpajVHBPtDRg2xGxixtrkuFPgImKQpmoJW0FkeK3E0RFLaWEvu/Dpzg
         mygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frW4XW7C9DTZGXxJUUdjq/QcCG5YG62CSZMprWf4x6Y=;
        b=oe9GHrgiP1N1HD7KauqtvR/67aSNEqiEwVA5JxSjLctF5koa1bWxc0c/IRlIkdKtLV
         559I+7CuX6HWYuYX5fNbI+Al1M3aZerzVVwaEQg6GXdDce0N58p7oklpKBhS7FrT1VL/
         iuOFhBYdmB3/P6GQD3WYyFZu/Wg1S3hinaIBMvC/oAVPCQj7hc0/UB4u8HhcBncGPDEM
         b4/T3/g6SUFi/+0F8D1pCtgNysbArvkWdqMAFHQlkjrrsZzPXCrJEFSyRw2cSFS8pkMM
         0Pj6dp8/FjFv5M8khTgLK0m9ABraalm9tI/Hx70anEs0MEYVLZSgHItfHz4lGGhU2AY4
         W0RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EStkK0Ts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y32si531635qta.311.2020.02.24.10.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 10:42:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EStkK0Ts;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6IgY-0003u4-L9
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 13:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60568)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6IgP-0003rw-St
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:42:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6IgO-0005mT-S2
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:42:21 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:36107)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6IgO-0005l3-ME
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:42:20 -0500
Received: by mail-oi1-x242.google.com with SMTP id c16so9943575oic.3
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 10:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=frW4XW7C9DTZGXxJUUdjq/QcCG5YG62CSZMprWf4x6Y=;
 b=EStkK0TsxQSuLSG1efUjuQEwGXU+WkgTERGXBN3i+bKNioU2iDXXMgmj5kUXqjAahe
 dT38pnyNKn12CIrDn6FjFHpq+EWRO9B9kFTgMTgknciZrwgWZeiv2PgFj+1emj4hLeuB
 0e6rbeTXs5gMtLKyJwLMAmoWtTBEqXr5WaLf4Z2WK9Qs/0bHatkbwcrxqTr6OfIv4Lp3
 lzfrdHduqKFUewfRoO6zQG8yzBonU+tRFLyF9CMzlvrsxZsXlUsywjzNQTbhEw/ez3ac
 TIKAecbyjo6F1so/1s05gvu26SfP0lR9Cj1dx+nCbCLAihcSNKBzv40yzM9B0Lho7ELf
 tOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=frW4XW7C9DTZGXxJUUdjq/QcCG5YG62CSZMprWf4x6Y=;
 b=oiICXTAYpSL9AyyoXH6e+yeq3C9/AsWriXUcwnbi34lvriULQ/3J9rQ9cG15Y3+mr+
 tKVxoUz7ySoHS+aKAAMnaq+/ByKEMO4ax3yUc7b8udxMGAGJPXTLzy5DCPuHFiO9vf7w
 JRN1+uMsGgnlpEPQpXWd/70m8T+hj8ezvS2Te0+1F1QZjFUAXbbs8jXpt/SDqPscKH23
 c7fm6KEALAqWf1QTPAes87MWxmFxnWgAERHYMfftzJSeCWzT8ivdm7oOA4GJylbNjyY1
 s6PnaZrzYES5PzF5uP0JmLd6XK1Kli/fUa0d+eRKU1fMuP4HAtBbdykPcbYZVAc98Vd9
 LQtA==
X-Gm-Message-State: APjAAAV3G098Qz42r9CnJW8tSv5hnFNqht+AejxuNCXjzHGGFucSRhSP
 sDkvjA26zRFU85fNal29CNNLtcke4Hm4lejhnBHgmg==
X-Received: by 2002:aca:3d7:: with SMTP id 206mr375211oid.98.1582569739730;
 Mon, 24 Feb 2020 10:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20200224172846.13053-1-peter.maydell@linaro.org>
 <20200224172846.13053-4-peter.maydell@linaro.org>
 <60d47c82-1c7b-9e75-f4fd-fbf752092a82@linaro.org>
In-Reply-To: <60d47c82-1c7b-9e75-f4fd-fbf752092a82@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Feb 2020 18:42:08 +0000
Message-ID: <CAFEAcA-zDpucXU0fp+JerfhkOBEaHUZtv=05v_Zxuh0U8XTE_w@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: Implement v8.4-RCPC
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: 7Y5sNqz4DQO/

On Mon, 24 Feb 2020 at 18:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/24/20 9:28 AM, Peter Maydell wrote:
> > The v8.4-RCPC extension implements some new instructions:
> >  * LDAPUR, LDAPURB, LDAPURH, LDAPRSB, LDAPRSH, LDAPRSW
> >  * STLUR, STLURB, STLURH
> >
> > These are all in a new subgroup of encodings that sits below the
> > top-level "Loads and Stores" group in the Arm ARM.
> >
> > The STLUR* instructions have standard store-release semantics; the
> > LDAPUR* have Load-AcquirePC semantics, but (as with LDAPR*) we choose
> > to implement them as the slightly stronger Load-Acquire.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  target/arm/cpu.h           |  5 +++
> >  linux-user/elfload.c       |  1 +
> >  target/arm/cpu64.c         |  2 +-
> >  target/arm/translate-a64.c | 90 ++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 97 insertions(+), 1 deletion(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I guess your memtag series will need to account for the extra
loads/stores added by this series, incidentally.

thanks
-- PMM
