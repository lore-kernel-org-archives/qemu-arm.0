Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp835641wrq;
        Mon, 4 Jun 2018 09:57:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKSsD2SqemszRzrMvK6AItRSx1EzozOAoGAHDCWpr7vP2tAsPFhWDN08kl9AhF5FY77PVvF
X-Received: by 2002:aed:3d09:: with SMTP id g9-v6mr12440655qtf.272.1528131442294;
        Mon, 04 Jun 2018 09:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528131442; cv=none;
        d=google.com; s=arc-20160816;
        b=W3c8aB17ZLb5f0ND9l2eHHljH7ryIg33WF2xBfMMEaulCQwDhNzSlvNgRIuW3yFp+p
         Y/AFjL1BOOGPHScUFtXxSr6VPM5iv8cMNVzhb0B9UH8WUrg8jXctFtY3oNBsHfKOS6QZ
         xlmbdmxOzxAq3uZ+XnixC8qwf7VfW8auU71Ht8xDe8kK7Q8Cw4mtSCYoMCyydMPc2b2a
         2xiFa10tjjfyL8ZVy+avG/Oz3R2v/mxB4ZDXId+Ro26hRN8cET/VLKS1YOJ6tcvYlVRY
         jkdNEEfU+QjuL70ahQ9KYIO/J0N/BJNK/GQzDSh3O4lDb4FWHR3UhJogSiu/3JbxEzGU
         Qbkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6yrFRKSV8eKqxj8ef/gZul5HJrqS/9d7eYFGeaznuvo=;
        b=VDjRqyU4Ad6lq6ucAPYyIJ1fw+e2QQRcfvDKUWc98Nk6NGBoPNcZP67z3tPAflEOg4
         0FHRfNZXLQlha9oJpzuaibVnN4wQD0TOxv/UbMWNnhJ+nIamEqIoeJHG92o8Ou9U3rnl
         GMjYxq74dyFMlonJC7CAt3lSwcoIm4fPw1Suuz/jhuAsM3MuYQDkX6m8kq3XGrrEenX+
         IU+R7ZNQI05cDpqoXjYCgK2tKT8YVYxzKv2sCMlxRyD1PShcGSmzCkE3F7YFnocrb9ys
         0DlHkMhSGrubNDOzkz3gRxGiTuJLzv8E12qn4HxKvsdDmE/nbQg3u2iTUDpvdaMVlGNY
         Lg0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RV07Psk6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o32-v6si2461607qtf.339.2018.06.04.09.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 09:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RV07Psk6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPsnJ-0006d1-S3
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 12:57:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPsn8-0006bK-Bm
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:57:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPsn7-0000wo-Ih
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:57:10 -0400
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:39901)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPsn7-0000wX-DA
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:57:09 -0400
Received: by mail-ot0-x22f.google.com with SMTP id l12-v6so38531374oth.6
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6yrFRKSV8eKqxj8ef/gZul5HJrqS/9d7eYFGeaznuvo=;
	b=RV07Psk6gYOk8HjC+z2VB2YkU68MFDP1fK6VsjQ5Qez3q+AZ1O+KjTKbw3XUtYAIVn
	wVsofhTz7EOT7Yq+r52DqgxEjMvSX+DuultKFhbD2KfTp/BndONT4mBZI29uItfeWNVZ
	CYwD4B/L5bEuK8TN84WgcQMVw6vut8Z5J4fLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6yrFRKSV8eKqxj8ef/gZul5HJrqS/9d7eYFGeaznuvo=;
	b=eJ8zI8C0jp0U/fqkEyRoQuctkeTANuj/wjAoC/YQMFRH+Xzjg9VZFi2xLeix4ADsgd
	AS5uvzcKSzjGkCF9TEb+GkBSeS7cpePOCuB/TyVU9QiF2IZ9AA6XeZSO7fHHdSpSe6DZ
	7Cq0p7gA/5NsYE2bJkJerjt5T2dHiD7qXrZ8VKap26AqHFu+1PAmSZLsX+fBsNNFAygj
	oA2+RZir5pCItkOiDpvNh6JasZtaJTCYVH+quAMaXbf5Sf99k6OqWrNnJMQMOKObEQH0
	ktmOaTPkV37fXpl4goCzcaMqzpOfG96RnwIw7aixX1kdkM12gVzs4cMtK6LkP6SDttxO
	fKPA==
X-Gm-Message-State: APt69E1c2GrCnf+0jRYb2LhZv5FpXz0WnR18iyyhndLu8BqIdqt3rHxG
	f8yiQxHi/UhlmKHXV5/YyVEjcpmMpm6kSJyR3cCKvg==
X-Received: by 2002:a9d:1a0b:: with SMTP id
	a11-v6mr5459151ote.205.1528131428571; 
	Mon, 04 Jun 2018 09:57:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 09:56:48 -0700 (PDT)
In-Reply-To: <20180530180120.13355-9-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 17:56:48 +0100
Message-ID: <CAFEAcA8=aALvwnD1DP4cL6CQpcji3=DJ8qDcmNbSFMbJ2kRVBA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-arm] [PATCH v3b 08/18] target/arm: Implement SVE reverse
 within elements
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jK2d91nLDNj0

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 14 +++++++++++++
>  target/arm/sve_helper.c    | 41 +++++++++++++++++++++++++++++++-------
>  target/arm/translate-sve.c | 38 +++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  7 +++++++
>  4 files changed, 93 insertions(+), 7 deletions(-)

> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 941a098234..f8579a25e3 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -238,6 +238,26 @@ static inline uint64_t expand_pred_s(uint8_t byte)
>      return word[byte & 0x11];
>  }
>
> +/* Swap 16-bit words within a 32-bit word.  */
> +static inline uint32_t hswap32(uint32_t h)
> +{
> +    return rol32(h, 16);
> +}
> +
> +/* Swap 16-bit words within a 64-bit word.  */
> +static inline uint64_t hswap64(uint64_t h)
> +{
> +    uint64_t m = 0x0000ffff0000ffffull;
> +    h = rol64(h, 32);
> +    return ((h & m) << 16) | ((h >> 16) & m);
> +}
> +
> +/* Swap 32-bit words within a 64-bit word.  */
> +static inline uint64_t wswap64(uint64_t h)
> +{
> +    return rol64(h, 32);
> +}
> +
>  #define LOGICAL_PPPP(NAME, FUNC) \
>  void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
>  {                                                                         \
> @@ -616,6 +636,20 @@ DO_ZPZ(sve_neg_h, uint16_t, H1_2, DO_NEG)
>  DO_ZPZ(sve_neg_s, uint32_t, H1_4, DO_NEG)
>  DO_ZPZ_D(sve_neg_d, uint64_t, DO_NEG)
>
> +DO_ZPZ(sve_revb_h, uint16_t, H1_2, bswap16)
> +DO_ZPZ(sve_revb_s, uint32_t, H1_4, bswap32)
> +DO_ZPZ_D(sve_revb_d, uint64_t, bswap64)
> +
> +DO_ZPZ(sve_revh_s, uint32_t, H1_4, hswap32)
> +DO_ZPZ_D(sve_revh_d, uint64_t, hswap64)
> +
> +DO_ZPZ_D(sve_revw_d, uint64_t, wswap64)
> +
> +DO_ZPZ(sve_rbit_b, uint8_t, H1, revbit8)
> +DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
> +DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
> +DO_ZPZ_D(sve_rbit_d, uint64_t, revbit64)
> +
>  /* Three-operand expander, unpredicated, in which the third operand is "wide".
>   */
>  #define DO_ZZW(NAME, TYPE, TYPEW, H, OP)                       \
> @@ -1587,13 +1621,6 @@ void HELPER(sve_rev_b)(void *vd, void *vn, uint32_t desc)
>      }
>  }
>
> -static inline uint64_t hswap64(uint64_t h)
> -{
> -    uint64_t m = 0x0000ffff0000ffffull;
> -    h = rol64(h, 32);
> -    return ((h & m) << 16) | ((h >> 16) & m);
> -}
> -

You added this in patch 2, I think -- you could avoid the code
motion here by putting it in the right place to start with.

>  void HELPER(sve_rev_h)(void *vd, void *vn, uint32_t desc)
>  {
>      intptr_t i, j, opr_sz = simd_oprsz(desc);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
