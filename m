Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E08C88E6F
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 17:52:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6Aqt-0004KE-Os; Mon, 14 Sep 2026 13:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6AqX-0004G5-AX
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 13:52:01 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6AqV-0000B9-Pg
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 13:52:01 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-6714595153cso75218d50.0
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 10:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789408317; cv=none;
 d=google.com; s=arc-20260327;
 b=SoLsAh1fqCNffW0P8AKDPkZPKqgAzBdYuuEL/dcYNBITxXiO1jzpPSaTmqBsy96+g5
 i13PQo4nbgDws3xiq6Ni2e8hqbhxpDEWDj+2emYK9kmp9rIzpvDZ6Nx85+IOX7TKME8f
 zHhoQh9XE461mlh6/eW7Bw4I7L7Qb0c3yGpIDiejWHZ+aLMRIz+L27HWMn7z6I/j6nrx
 MJzTmx4b5gErUD1SWFG4y/Q8TbQrCAL+YYvJQSa2u+78rrNsoAAOxzIYBbA1WKvSoozH
 0NW1QZDUAwJS3Q1YgW98Assyxcuf6ZnRsUCbt9UNgW/4EpP4fb7Qv6LuCCONIJsPhEPy
 BPew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Z+y9OUzhFJYi6VOAPvadEexAEwbMzmh1iwkml1S2xE0=;
 fh=tU+JVthGRGIbFnDVeUHcxMxQj+6zuX07hwt5D+GUbFk=;
 b=eHl//9PksjDxGVf9dQ0LW783Fhb2XYV+u4BKoScSv6GGdlQrxnSObJuSsFVlV73nfp
 O1gDR5C8Hs6IncO9UW9dQpzWCTFtVFy++VhzoXFIg6HE6j9IK2x2Ik8M2SFLjt5EkGcN
 xHVZc3UPU803F/F9fwPvPzFpXfY3vpSRTJ7QFZFSRYXdTx8P25a6isfXvQDdP4hS5hp2
 /SLtXjzvuPLUdy0D8euytYgGkf2hCqUYqk1tc+uIADwE99Lk20jZLk7mW2e0KaOPbxlF
 Q8Kh5LrFsy1fUEY3eMt8yr3VCLuZPDsZsi4fS1R8iKfGpAKw0w5/g01BzP9JYUucOmLh
 +AdA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789408317; x=1790013117; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Z+y9OUzhFJYi6VOAPvadEexAEwbMzmh1iwkml1S2xE0=;
 b=BnW+ThgBbg7hlNBfYp9B+fJ/LpszPl79wSZzWOGthd8LDLOd4wCEL4gvRes9NCQVnv
 VtxJPmZSTegKzfyFbZKPXgqkGyuLAK1R39uR4qJP5XjiSsD85LGlALaLPs1LNuaM1KXW
 AnOce72M4WU1P7ABLMFZLE2ds+5R74pYDfr7v3/omnIi6IRypZ8qdb/PGPE4FzywOzRL
 BqgDkrDKrjjKmSIod7iTfNoPqshwsQdGoc444f4R67pUGsRRhFSYcoUIianvCbPOrm+L
 9QiiXwQnQUpCHzE6B3MsaS22vtD5P/lfEBN5vgNrwDiYLVMaYrH9A+nqH7rnsHRTnSSH
 buqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789408317; x=1790013117;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Z+y9OUzhFJYi6VOAPvadEexAEwbMzmh1iwkml1S2xE0=;
 b=F4lgjVyjzGQJoC3F/XHNLZFY1J3eER8JwXZ4okstWUlrd2nzCXiQQzRH0nmsPfW79L
 Ovf0hFHUVXj/gTF4a7jlgU1zcw0qKkGQf8az3kFxIBghWzsHONLpEvrjjkN6qUW/cCm+
 XptfOjP5ftKwj3MxTV5Dho/X+kw8w2PaW3rlhGT+pX62Gcxm5seGrKqMnP9oDd86TPSv
 NwMOsWTSksQlE9ujy1gb6AT5mO1u7FNMbpQENU3l7nXnohWzqJgH50HCWgbn36RZLABP
 Vb/ZhHfWaA+s63aoJwxQZ4gsI1QUh7EuO8bNv46f7Cclkf+IAekraLXM3CO/EiE0CIZ6
 X+bQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByYcIxbkI+kWmzj7a1a16AD3qidsSEFZMBAmhBnWch1A+5j058Kp34b07urCqJIUV3mt3tGfsd3eA==@nongnu.org
X-Gm-Message-State: AFuF++kz4xRrv79elOC+VCS8XbtXw0NlVVBZccmGbwSHfgbX02EyAssl
 /nj63SpvD73lToWRmGgwJvpjDtXTNBwM2ac9nVyQxAv/k2vUQ1ejVirDQwhvORyFYH2J0V28Ahv
 GSA2As2XqQypAJ6Eh8hXyEcXfGl+2qwz6x6vQ7+OZ3w==
X-Gm-Gg: AYBFou3+eWq+sqeMCVzUrw4rxPNTKSUWwNy7dwic36/pJCb0IWh+vvOBjW/487Sod2Y
 JJqe2Cz2WS6jJbGfOt95jNGvl3FTzf2UQq/I6vl+QabMCXK7uOTkmeIfQw6kVpQSum6gFKkALjp
 8rOqpLcfw/ft4ZDJ/H71JWbfBCfXLWNpb2l9YvvEqzZ9sJlJZBtEO9MVCnNkWQENAkl52NNXzse
 omwvJH0JWAhCGS2pAFVlvUz9mrF8umU7gRJ/p8NdbKhvVXvLBQbWRZcU2pHN+uB4JsWkIGmFNmo
 DdH/tcoqgnVl5uvyLaGlkiDPTxsdUj0z4aSHzQ8ABa2N4+R1439PhqhfVhZatJxS8bWOF37VgTb
 BGU+EaPymvjyePYh/Nszzwq4MjUUBlW8hq9CGwiU=
X-Received: by 2002:a53:ac9e:0:b0:671:482b:fc72 with SMTP id
 956f58d0204a3-6715501ce81mr110439d50.32.1789408316287; Mon, 14 Sep 2026
 10:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260806173123.333423-1-richard.henderson@linaro.org>
 <20260806173123.333423-4-richard.henderson@linaro.org>
 <CAFEAcA-NoW=39G_m21zQO6CzH5UU3MnsKuFNjkjX-55gzXqD2g@mail.gmail.com>
 <a930c1b6-dd93-46ad-9e61-eafda9dcaac9@linaro.org>
In-Reply-To: <a930c1b6-dd93-46ad-9e61-eafda9dcaac9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 18:51:44 +0100
X-Gm-Features: AcwNN1UAMrlZMLL4c6UcZdvKECQiwi31H-8xgkYecW6cN_BvcU9IpsRw-nC5JBU
Message-ID: <CAFEAcA_-UwXB9svLsFwJRfe37+CkwkRHnNVoWDScTEL=L4uOpw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] target/arm: Implement HCR_EL2.TID3 trap on
 undefined TID3 registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 14 Sept 2026 at 18:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/13/26 23:16, Peter Maydell wrote:
> > On Thu, 6 Aug 2026 at 18:32, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> It is IMPLEMENTATION DEFINED whether HCR_EL2.TID3 traps on registers
> >> within the range which are not explicitly listed.  Previously we chose
> >> not to honor the TID3 bit.
> >>
> >> However, with FEAT_IDTE3 it becomes mandatory to honor SCR_EL3.TID3
> >> on these registers, so we might as well honor HCR_EL2.TID3 too.
> >
> > I thought we agreed not to change the behaviour here? Is this
> > just a "forgot to update commit message" thing?
> Oh, yes.  Because I did update the code to test for v8 in translate.c.

So what does this patch do? Is it just a no-behaviour-change
refactor so we have a place to add the SCR_EL3.TID3 check
in the following patch ?

-- PMM

