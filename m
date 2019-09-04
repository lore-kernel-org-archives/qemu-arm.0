Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp540195wrp;
        Wed, 4 Sep 2019 03:49:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzU7MT5Z8VuPWK5RvGvYqNsI4rQ6pl3Oey7ldiCUfItJRhQ0r4LWBJBdNLwvPtZolxxdgms
X-Received: by 2002:ae9:ea05:: with SMTP id f5mr1282948qkg.279.1567594159864;
        Wed, 04 Sep 2019 03:49:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567594159; cv=none;
        d=google.com; s=arc-20160816;
        b=Sw/HafpNI9ryb+mgo8UIpV7e4mzOH260HhjhGk62AAZUUk4/XyoRiD0yumHotbuOw9
         DRls41Egq3CmIOV3Pi+ZiHjFQDxYAA2QSv4scA1iLaWBA9V7vrICPRvZ+aKbJQqb4Tjm
         6SChYb+dod3U/vjqwe2a4vQYXHSdN1ULalfyoXjRNWRJ4FHS8KvFeSFcyzSrw8sZ+fiZ
         K/pnI9a1RBaZ0F5BGEDkXevSJKYwZ2Ammz8gdbkiqhRkdLQTJDt7d8HkQq3vb+70rWZF
         F0MrxUTXSJRP1aEBLfvROYaYrs5ovPex1XnSBMxCPgIf4PFZBzt74xI1cdKGmem4eGtg
         JYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e1jw3hspecwMHjLO7Arwx9CldcMxSKAz9Ekmi/2ze/k=;
        b=MY4BAANyJjc8edg4nrTz3SKS704G2HUdxV0SORND3bKL/LghWj+MMjWgaaiZ20L9Y5
         2wME2qIxhgP+YR8tn4VnteKcBpNBiviqJeHgJbDQzDzTUVz2UDczYB1YcY4G16NQfdTZ
         5utu62pN8ikoKzBXxjfdlhvu50pd8oZ/W2WnKekXplt1SxCkc5TENyTpSHysuenwsPWc
         1O0p4b1boQex/YqvXzzYr7ZArW1VNdHJh5dnvJZEjPgkUx+9NnVZe/rjsQhTIX/vMBWR
         vc7/p/oAmMOz9FzhHoddsv5dZctbJChjeGhRs00bh904GfJaPy95KoauSUIX7JsAw3jy
         brxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bbV0yhod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si14141795qte.305.2019.09.04.03.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 03:49:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bbV0yhod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5Sql-0000OT-8Q
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 06:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5Sqc-0000NK-Dg
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 06:49:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5Sqa-0000dA-Tr
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 06:49:10 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37864)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5Sqa-0000c0-Nj
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 06:49:08 -0400
Received: by mail-ot1-x342.google.com with SMTP id 97so17274125otr.4
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e1jw3hspecwMHjLO7Arwx9CldcMxSKAz9Ekmi/2ze/k=;
 b=bbV0yhodlBxQS+blf6PQLN3DmtNGMXBWGecGLtT41HRTQ0e/gFVuw22dQ5zaCfB5o7
 e3LMeJX7u4idnc+v5xng0u+1Db1rAPQE4C7W2Kp6dII6APoMKQ3nyvypSVVLVZBx9xbh
 bm0bInpRNrwHhW+yUA0IPzeFrHdFfoak/G9lej1RpRzjBbU8YRGOgBRobA5qNVyeSy6p
 N3KKMhSYuWsOZdyesUBb15dgH6YQwo5YsekCvpIb3CAHMy0bDzHIBEsj1BWv2/Ae4dnt
 lwjehCRX8dymOQrFpNaw164ZVXKxkG3JXKfHzby3tCwRtU1ucS8rnWSy2iA1z7HWIDap
 yf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e1jw3hspecwMHjLO7Arwx9CldcMxSKAz9Ekmi/2ze/k=;
 b=UCpODdSRPwNm6JAlCNUm53Jv3zkozoBA4jtTzdmdFMOVA80UVfajz/rHfGJxPMFQ8y
 3ceV3z3/EoTkbkTd07v4TYIaqtACGKnnK2yE3RvMei00ka/B80r5Z+8pPw1u/3FAUBC1
 /yNlpV2XzfZXLd7ZdBbqMslRTlGkXnrifYEbc0KrRc1mtAQYXASAKXb1LugEhNOaBKRv
 /Vei5oRWyt7Jup1cpCSbP0DK5zJDoTSix5weAHofD3JbtqLjnqsZL2mflkgKGQBBiiyZ
 G9lH7WJNesGRRUPJgGwrDY+A6LHYD1Mgkbc21TPxRPokFAj/MPVfHyxB7Tkstcz4N8rg
 Hutg==
X-Gm-Message-State: APjAAAVDYuB/7LCt8zP9STAGXAY9y8m0ACGd8EmP+6Hde6u6pxScpcxR
 QJGK0amZLyFajwTrE6oVNERQBL5yUW1NEWYZamnQAA==
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr32866520oti.91.1567594147703; 
 Wed, 04 Sep 2019 03:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <dacbea19-9692-0288-9b64-8500d0cf232a@linaro.org>
In-Reply-To: <dacbea19-9692-0288-9b64-8500d0cf232a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Sep 2019 11:48:56 +0100
Message-ID: <CAFEAcA8MfTTPrsTQhXUPHWAy_KeC-3ZztFtKM0jyQHZoBYqRJw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v5 00/17] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
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
X-TUID: W7FyiQeAEADO

On Wed, 21 Aug 2019 at 00:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
> However, while working on this patch set, I noticed that we have a lot of
> unnecessary overlap between A- and M- profile in the TBFLAGs.  Thus point 4
> above and the completely separate rebuild_hflags_m32().
>
> If we rearrange things like the appended, then we recover 4 bits.

You can't make the THUMB bit A-profile only: we need it in
M-profile too, so we can correctly generate code that takes
the InvalidState exception for attempts to execute with the
Thumb bit not set.

If you want to make VFPEN be A-profile only you need to
do something so we don't look at it for M-profile: currently
we set it always-1 for M-profile so we don't trip the code
that causes us to take an exception if it's 0.

Otherwise seems reasonable. My overall question is: how bad
is it if we just start using bits in the cs_base word?
If we try to get too tricky with using the same bits for
different purposes it opens the door for accidentally writing
code where we use a bit that isn't actually set correctly
for all the situations where we're using it.

thanks
-- PMM
