Received: by 10.28.71.27 with SMTP id u27csp576119wma;
        Fri, 23 Feb 2018 05:13:23 -0800 (PST)
X-Google-Smtp-Source: AG47ELti90HZpNSfnZ7fm3ab+YigDivKskXdLGut4JIQl9v9UL6P229mk+8Ix17q1xPemNK2gO2n
X-Received: by 2002:a25:860b:: with SMTP id y11-v6mr964575ybk.249.1519391603490;
        Fri, 23 Feb 2018 05:13:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519391603; cv=none;
        d=google.com; s=arc-20160816;
        b=X2yMLdclNzRUA+KNZI2iLPtHevbqEXFOhC0kUsm6fVPBz6bUq710Npzd1xl2np7GDd
         AXs61VGEpMq5AqxUt5o8fEEwNF8D7EgDeaKBEunJFJ/SmCrDRxKvs+Ata5W3VKnMfuGU
         nKq5y/RdbZE6LpK9lioouIN9jAQnriYUGEkeVgVOQlDjgOJHz7D1mbrkKZOgk5JUreNE
         /K8PxaAcSYlwb+7m0ej4xotGfGCCq1JTaiE1PU7yixGYh55nJPGAtsIAUqJYx8F4wxKX
         Zv9k4CahNgyxxN+wo67HP52x5csM2ekZPLk0GFo7dlmdq/CkqTIJ+OJ5Z8D0OsvdrMAk
         TTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=C+wo61kBNM8AHM03ad2sAeNwPDJs/FoDQCMAHJCJTNA=;
        b=NJUx7lTriWeWFCaPYJJKRqZ6gCerZAuA+xj7MkoJgClY7YT+Dm2ypcOW/bNWUIrJIF
         SdWU5MTWg+u6rAFTZapIXSDqv18zRqJbNcyE8hQDp9kBzUb+i9MPhR8EH8cBNQ3C09d4
         zQ/MaFOwsxumDhfb10EthpwmmeDod3rP4X4U2LGkj7mfSnzH+PYxcJqj9+CxYMIhO9bE
         cEHDa+//y7ZhXA3wfH04vz+wbOGR4rqv1Bb/9nMKVcUdsOOB1pIipxkMz7AkywnJFl8E
         4RcF8IEJxIhzHyujhf8bO34u/1IdV5hveBssVV/46xMVueuGqP7cUyZeBOpiE/ZalsKL
         5Asg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TFAgEaDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 205-v6si403282ybd.23.2018.02.23.05.13.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 05:13:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TFAgEaDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epDAA-0000wx-R2
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 08:13:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDA1-0000wC-Qg
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:13:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epDA0-0006MG-Rt
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:13:13 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:39601)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epDA0-0006LG-Kw
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:13:12 -0500
Received: by mail-pl0-x242.google.com with SMTP id s13so4873334plq.6
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 05:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C+wo61kBNM8AHM03ad2sAeNwPDJs/FoDQCMAHJCJTNA=;
	b=TFAgEaDQeSgzD8KkzxLHYhSOgnjl8Xz5Xh7NYSCmRBMNLX/pWb/CV3O0lpeBA6/kWW
	6xmImUCD3Io0J2Syojtdw38vKd3byGsP6kQd3wGw/oBwVfQQd+pEujZXySzmJ+9A9Vla
	+K7sOWuiQSG029bonnngKvOHN+xPwsjZLfE9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C+wo61kBNM8AHM03ad2sAeNwPDJs/FoDQCMAHJCJTNA=;
	b=GCvQZZttofjiIeKbeojO/TwHFEekiFgs2STT8f66YQeBduzvM1p7+mNqM05Zc3+aU8
	C3or5Sy6G5+JLY78Wiy7vDkdleeLEimcdLW+w7jDXhDlej9OI1MD2X6ZDezYZs2ia/TI
	Lnl0ZoHmGS7ojLLWdzNAxUpZJ9cMvB1gNkWNhduMBa/QbFmFoIy7lK6DVjGDBHeKpqYk
	QRuriozXMxLCGJrRSOZEp9Wmv+oX+4XjsIrarF0W4kX/uluw5X7Kup2ADg4rGsslG4vb
	HF6uXFBL5IeWCHI+9bX3j+EPQmVomyawbJadIqS0RtuISGWwjAVPHSf/GMDSrQpzOKw1
	GJTQ==
X-Gm-Message-State: APf1xPAwUvpgI7xwJQDKQGSIiaIuk4HFRL8jihj5B2+zki8s9gx2JqkA
	XEd4Vb+5mC6ZMRNwWdaeGNoJitqfbhPgVwNj3N3svX8a
X-Received: by 2002:a17:902:a515:: with SMTP id
	s21-v6mr1683557plq.393.1519391591773; 
	Fri, 23 Feb 2018 05:13:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 05:12:51 -0800 (PST)
In-Reply-To: <20180217182323.25885-16-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 13:12:51 +0000
Message-ID: <CAFEAcA-xH_SSR+EcRcauAb=eOrsqLDRoBWfSmt0nhyDWkMh+-g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 15/67] target/arm: Implement
 SVE Integer Multiply-Add Group
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
X-TUID: oSdEGIO7J5Av

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 18 ++++++++++++++
>  target/arm/sve_helper.c    | 58 +++++++++++++++++++++++++++++++++++++++++++++-
>  target/arm/translate-sve.c | 31 +++++++++++++++++++++++++
>  target/arm/sve.decode      | 17 ++++++++++++++
>  4 files changed, 123 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
> index 11644125d1..b31d497f31 100644
> --- a/target/arm/helper-sve.h
> +++ b/target/arm/helper-sve.h
> @@ -345,6 +345,24 @@ DEF_HELPER_FLAGS_4(sve_neg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(sve_neg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(sve_neg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>
> +DEF_HELPER_FLAGS_6(sve_mla_b, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_6(sve_mla_h, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_6(sve_mla_s, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_6(sve_mla_d, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)
> +
> +DEF_HELPER_FLAGS_6(sve_mls_b, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_6(sve_mls_h, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_6(sve_mls_s, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_6(sve_mls_d, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)
> +
>  DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index e11823a727..4b08a38ce8 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -932,6 +932,62 @@ DO_ZPZI_D(sve_asrd_d, int64_t, DO_ASRD)
>  #undef DO_SHR
>  #undef DO_SHL
>  #undef DO_ASRD
> -
>  #undef DO_ZPZI
>  #undef DO_ZPZI_D

Deletion of blank line should be dropped or squashed into earlier patch.

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
