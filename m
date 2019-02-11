Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp2659914wrq;
        Mon, 11 Feb 2019 08:35:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYkpbM0eEmVmE1yYmHadM9GJiq4VgL0ImAMtVZS0IEOtrB4yzGhnBdfHnc/hTKK1/Ikduel
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr9062398ybc.220.1549902937761;
        Mon, 11 Feb 2019 08:35:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549902937; cv=none;
        d=google.com; s=arc-20160816;
        b=WxSHvS7KU3swPMDcj3aO3wH60UEq65NZN6T7aHQqecq9y4j/qThZRWliUTDAfMoizY
         Ji6mxaqTpZxjmw1+yJwRzhsT40wWO5AnG44QwdfqSRwCHnqY/uut5x68b2stqjS4YYyr
         CdOzty69VAAOidwE1UusKp9sNhnCnIZ7sh6YbsjnvIAddu5OZA4Yg+WvWzjg12JMNzyE
         hA/ImZPzB6wCkN11hFadCYWZtOAEQyd8RnWVKFgTDJTxnb2U7F4q75SGv0dqM1VoF0tR
         2+mXwv13m3YApdWBk+zupcAoyWyy2bD7i4/as5SZVzFp5gXqL6ofzM0JBsZAEGMkVtim
         NXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Rv+fNQRdUzkzHoC6wWAsHWNo3Rs55ud8FhVzAKo3NA=;
        b=zluDssRcOuHNhcc174ngK5anMBGxqCRwDWw9h3s81qF2U/VjNGA0Y2Lf3M+9jS27Rb
         RMi8h7exYhatL4gTfo/U6RYQHhgEAEHRP1YawOR2pYdTKNaOqsAet3KWO3aD6uE171bD
         dISrlffQODoFY/MqeYnmpaMbzCx5h/k0a2VHrYpss3dsbXp31gsFIV6eQQu8QIC4oNp7
         PRJpKgBZqdd28RyYHB5mAcTPsGnHQMnOyB/XGPlYWxDqZ4WuNNPStor/4IvZ0mVXZ/UA
         418C6mZpJEd7pvYgC9xCCLvIM4KNqeihwgY4lT4XntM/XU3hnf38OM/xrDwrqO0lDPL7
         zrRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Idr+iYwW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si6148570ywh.262.2019.02.11.08.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 08:35:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Idr+iYwW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtEYQ-0003ph-J8
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 11:35:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtEVz-0002WD-JV
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 11:33:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtEVx-0003YB-Hs
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 11:33:03 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gtEVx-0003Ia-Aj
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 11:33:01 -0500
Received: by mail-ot1-x344.google.com with SMTP id n71so3915364ota.10
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 08:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Rv+fNQRdUzkzHoC6wWAsHWNo3Rs55ud8FhVzAKo3NA=;
	b=Idr+iYwWv+MsmedE7JWAhR2tHfRlZneJ095FZCFuaxqYKcH0iqwa1mdqHi1PLSdS8U
	YnMnR6/vXUN2j7ihHM2raEYXeyL7jrZYDXsTiNWUYj8AYdESBRuFjdh4FjeoIzwljIB0
	fWWMz7IzJ9fjGBVKNrRSDUrJp+4zhTJnMLT4OyLNcGWLXR0cahgNxHi8adfT5bJeoRkk
	Sy7LGE6ZYhXiukUPIlhC+4NHPuzYpUzyX/6yuewg3WG8l5e1531ZV68h4Z1NQTGW9Hzo
	480xKptNsR8b+5Zt6iu0gmeS4Cpie0vQ+kBSxzno49N7t/KIkwcCmchMEvbXYKGJcRuF
	5xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Rv+fNQRdUzkzHoC6wWAsHWNo3Rs55ud8FhVzAKo3NA=;
	b=OJ6DMOp+tVfBrj2AJEo3g70vUR8VVZ84K96jWdKVjrn8C4rkyDlpjcl6NLlTCoOAbo
	B+nFpkS3LJqL7V2Ko/gzCRAaWVgMVdfSWPEy7nDd4JEknweuNHdxvJEbb85Kk7Lh413N
	O22mcCH9h8JWM3Hdv4o8WHT1TUtMGzXmLVytrQr+bHAcQX597c+fHZ2i5zej4/Qfi88A
	Cj/GOgm9jjS2/PwG5IpL6EWJjCCujDhDm/n8NeX0IpYktRcjqtI/qxzRBpH9KWFodm/w
	vC+ez5uCgJMxfAugvaskddsXqGc4ryhMss6IIm6ij/BHuHaxznzWqf4WLF/oxPXbk3UK
	+HZw==
X-Gm-Message-State: AHQUAuYvQmFl/KfgmFvhEqhtje9270gCcF06mjJ1K0sF6LCGlKgQqJmp
	/RSvkC7YqDCqRxFaY878nJo3nSiNFpKkKMM40T9QdQ==
X-Received: by 2002:a9d:e89:: with SMTP id 9mr20100833otj.216.1549901971772;
	Mon, 11 Feb 2019 08:19:31 -0800 (PST)
MIME-Version: 1.0
References: <1548985244-24523-1-git-send-email-catherine.hecx@gmail.com>
	<eeb0f275-b262-25db-337a-b6c78b29c124@linaro.org>
In-Reply-To: <eeb0f275-b262-25db-337a-b6c78b29c124@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Feb 2019 16:19:20 +0000
Message-ID: <CAFEAcA9u_FYk40QyC=_R-VMVN74A5kTWYKCSgH-Kzya1_Pqzdw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [RFC PATCH] target/arm: Fix int128_make128 lo,
 hi order in paired_cmpxchg64_be
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Catherine Ho <catherine.hecx@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a/f3Gep7FzbL

On Mon, 11 Feb 2019 at 16:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/31/19 5:40 PM, Catherine Ho wrote:
> > The lo,hi order is different from the comments. And in commit
> > 1ec182c33379 ("target/arm: Convert to HAVE_CMPXCHG128"), it changes
> > the original code logic. So just restore the old code logic before this
> > commit:
> > do_paired_cmpxchg64_be():
> >     cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
> >     newv = int128_make128(new_hi, new_lo);
> >
> > Fixes: 1ec182c33379 ("target/arm: Convert to HAVE_CMPXCHG128")
> >
> > Signed-off-by: Catherine Ho <catherine.hecx@gmail.com>
> > ---
>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks. Richard: is this effectively a bugfix for big-endian guest code ?

-- PMM
