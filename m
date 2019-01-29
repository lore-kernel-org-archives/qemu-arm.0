Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4597263wrt;
        Tue, 29 Jan 2019 07:44:21 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7jThmin0iDX2it7XVYYCZob1G8s3MfHBBRENMf6yOczUrGZdAUoGA0WhWq5xNcfQeAggyz
X-Received: by 2002:a0d:e1d6:: with SMTP id k205mr25632086ywe.78.1548776661277;
        Tue, 29 Jan 2019 07:44:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548776661; cv=none;
        d=google.com; s=arc-20160816;
        b=L4k1FcPtdR6ZKMdvolBTVpecByy3EzfYX4WiklrZBBrZYTuKKYBDEt/1X41QVOjSF6
         tnFzQ7Rlk5Cj/Xvlq+Mcq3YqbB0VDiZ8APKxP12rABrMuqoUzuZVH4F0oA61apuheSbt
         qHVk7AszYvxkxlkUwtx1sFbDLDm03k0zUEvn/i1FEQRB5zvmLjQiBKVlnkeRKjhp270A
         3GngibhCw6fwjHF1Ut95fPYsGVxfp9FTSu8t7Aa6Vnl2Q2UlvhD0LFrsiBbNBud1AOSN
         OzvQMTPtE8D+8I3juVXzkYs4fp6B08UOaaFSW+UW8ZNEkQRzOa/3CTXY1+CVRiwTjQPd
         vxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wmnbOLwfBe1PPlfe+MTxAn72yTEEmweypbtv39nlCNY=;
        b=PFTNddNk57KYHv52ZtQXwQ4Gsc+psq+ZIXEDaN+Jv0NDM8HE2KRExN4BClkRaY+hWi
         ivM41YELj2Rz9+jYVua9B3ODVWor41mDhmJmCbXRZ11Td4Y/Q1hMc4qV4A3hiUlW2nhm
         8xuhtVe6VdH/NaUEuNw6jocQF6WdNhEdrW6cuohAU6jm2eTqLi7udnsYxIFeCmOd0hj1
         WrgWo/MYdMFTLKJ+eMVw88MKvcvdMwGdHobAQ1vV4xYrtj9TnR9cKQDgEoIg86wtNT+A
         nI4emiCG6zKkV6GIiJa/oQTVhs+HXK4DSbKen7aKFtCbHxxK+c/Kx07+Fijj/N3Lidm5
         C3xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BshmBMlX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v132si21663692ywv.297.2019.01.29.07.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 07:44:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BshmBMlX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:50392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goULZ-0003Yy-S8
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 09:26:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1goULI-0003Yb-46
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:26:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1goUKv-0006aO-1B
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 09:26:10 -0500
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143]:54198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1goUKq-0006Wx-4k; Tue, 29 Jan 2019 09:26:00 -0500
Received: by mail-it1-x143.google.com with SMTP id g85so4706521ita.3;
	Tue, 29 Jan 2019 06:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wmnbOLwfBe1PPlfe+MTxAn72yTEEmweypbtv39nlCNY=;
	b=BshmBMlXkOgVyhnfpJYdqtJePjtHfsGRE3E1t3T4fgjFTRubKRqI9mcP0NPf7sPl/5
	L6CgLvvYzVFrufvy2YUXHyDn5wTUX6YMqU0552NZBl640p/LNcRnqw0ocX+pNP11TF7V
	+QWCKTuMRDE91J7KR/yAp6Wk/BMlyLn5aZLSt7wUdNJK8YGonr0s+Y0cx4Sy+a+WJcwG
	NVG7xAqKNfLwgu73x4obOwacz760wIQePwQE24051iveMLkwr5PEXhgnir74Sb5caC/W
	k/u220xSCucdIbgRCivBykLHyrLbASCYx3AlsSQCfQWTT7ZJz9whc6Q5UneIGQGGcjWc
	9sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wmnbOLwfBe1PPlfe+MTxAn72yTEEmweypbtv39nlCNY=;
	b=KJ0Sv1wFi77u5GIREtBSt2gXENLc1bxQmVdvATJl3w53oJeEHHvy9Eu5npYo3zbY4P
	xVYzXnSAzqF0Y89K/IH7XESPctnXLJkBNO81baC1yEJTPv8KeRN8Cpj4O4zr6wuNeSgM
	HmrAjH79kojAHehYnerOIsYWs8iLfUEazPRAZTTxKcB/OgiIs3Ap2Yj17D2+ibMr48rc
	gQOAPAx6nAVghpDimuQHdzqYcFhDLYOk6IMQvgeFUeIUH8aDtLNbPYQ4R7qUNKAfGbI9
	krRX1sZmQca0QjiLkHRo2ldWLNUrq0HTF30p8iUlyf13U/KWLJEhRNW4tzSbACiTPQCa
	F1vg==
X-Gm-Message-State: AJcUukfHhmwrilNQjKSc4kk/q2J9mJ1mQucwEUIC7iE1XeliQ5fwXYmH
	/Hnp2wfKPECgsJFJ3avr7KsAnhFKu71/FoRvBsM=
X-Received: by 2002:a24:fa04:: with SMTP id v4mr11390529ith.175.1548771943997; 
	Tue, 29 Jan 2019 06:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20190129140411.682-1-peter.maydell@linaro.org>
	<20190129140411.682-3-peter.maydell@linaro.org>
In-Reply-To: <20190129140411.682-3-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 29 Jan 2019 15:25:54 +0100
Message-ID: <CABoDooMVGMsOvHiMZVQ_pBr4ZUrw4JndMtYyG=HmaPu2hZyksg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::143
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm/translate-a64: Fix
 mishandling of size in FCMLA decode
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 15eT7FMcmAIW

On Tue, Jan 29, 2019 at 3:04 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In disas_simd_indexed(), for the case of "complex fp", each indexable
> element is a complex pair, so the total size is twice that indicated
> in the 'size' field in the encoding. We were trying to do this
> "double the size" operation with a left shift by 1, but this is
> incorrect because the 'size' field is a MO_8/MO_16/MO_32/MO_64
> value, and doubling the size should be done by a simple increment.
>
> This meant we were mishandling FCMLA (by element) of values where
> the real and imaginary parts are 32-bit floats, and would incorrectly
> UNDEF this encoding. (No other insns take this code path, and for
> 16-bit floats it happens that 1 << 1 and 1 + 1 are both the same).
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/translate-a64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index a7b999d2b5a..06418f0ac3c 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -12680,7 +12680,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
>
>      case 2: /* complex fp */
>          /* Each indexable element is a complex pair.  */
> -        size <<= 1;
> +        size += 1;
>          switch (size) {
>          case MO_32:
>              if (h && !is_q) {
> --
> 2.20.1
>
