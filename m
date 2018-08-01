Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp760912wru;
        Wed, 1 Aug 2018 06:28:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd1ezRB0SsCH0uHLF4rd6ffe1G3RY6k1xo/jNMRMa6fewuyB8ApYB7shG2j/FBJ0qXr+4rT
X-Received: by 2002:ac8:1c63:: with SMTP id j32-v6mr24087188qtk.242.1533130121111;
        Wed, 01 Aug 2018 06:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533130121; cv=none;
        d=google.com; s=arc-20160816;
        b=vo6f4oH+bczfs+oQQgJ6kzRC5yjQhcmOBrCU8khFAGQS6eNGm4FwBcqgyHlmG1SHEF
         13kWGmBwfgkeKqyBvdsa/niu4q8YoNsk1RaZ8Cud5f56+ElzbnKPnw3KjWaE0M7Oz/lU
         Fgeio0rggHzzBkVtUaJ1f0IF/gNlAvBRYJ56necfGBSoyj3t/ei0kTvkz9GWx+/qN2IE
         2P5QDT7EN7eXSpD6Q7Q+R1pGT16vTTd10RRw9euF+VG4vCYdXAFK2X4w8M8YeHMOs4Qo
         ZcZiXX/RDS5UhDtpUzLcZXLOQ9bbSKTkAJMOeicEXsWaV1/rUC6+NA/5HBPn/Rm8enwM
         JmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=24+OWpho0MO+KZMBdIU2yCpgTvuNaWNv6cIKBzQ8/K0=;
        b=SBoCmT6S3KDNhpniYXMYWGa0xHLFR/2MMG0cx0oir8XqVTsMc1sOK3rUgdfjDTHm97
         c2/pVRe3IMFk1mK53jyw3G96nhQ+cgd44E73dAXeXsQXhvYd5d4c9mVoyuiSV/AVzOef
         xwz2ktTT5wqkN4VTizTurvsh0UgUmIuztyFXIDJdPkFscpTB2gLwVVCdMTgYQGEdT2Vv
         HTiiNkdUmjJj+W+Ybay2CPS5DBYzCb4TQ/aglUPXrrAWPYrI8OmH6kTj21FYSgk03D/A
         l+vIddJzwdAbsY5Txo3y3C0aTPyg/aj/72Al3yxkSXDxg8bbay4YxqwGRXSJQG3xbpv2
         UQXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jjtKGjWw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 65-v6si17115779qkq.393.2018.08.01.06.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 06:28:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jjtKGjWw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkrBA-0000tb-K0
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 09:28:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrB1-0000ro-9G
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 09:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1fkrB0-0005bN-Dj
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 09:28:31 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:36930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1fkrAy-0005aT-4f; Wed, 01 Aug 2018 09:28:28 -0400
Received: by mail-qt0-x232.google.com with SMTP id n6-v6so19825221qtl.4;
	Wed, 01 Aug 2018 06:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=24+OWpho0MO+KZMBdIU2yCpgTvuNaWNv6cIKBzQ8/K0=;
	b=jjtKGjWwBVRI3vfIJF2qQhDFyHXJdRoR6tufrIDoSxaoeArhkYVFgEYkL1euVIhKEY
	Sb6PMdHhhCglw0wd5We17wugo0WTkAmAmW0hxXTbhyHvCHl6V9wPIv8tMOtuev4p+cwm
	nSB5hGeF4qtfdYGL03FyBChxidpaT3nWbZW/RIDodHCoIYwPMWNYn/ipe+SdPuhf6se/
	aFhRLH8/hP0qbuuU6Hbrmq88euLPMD1BJ6YSlCKdt3QZhJa+KSfdy36XEc+eH0pTtMz5
	6vKMz82Y3suhQCZnI0ZVGxMOgZaaN5PsriKQCateUNl8wxFQ9QH2MKks/i3YxQvWCNJ5
	6I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=24+OWpho0MO+KZMBdIU2yCpgTvuNaWNv6cIKBzQ8/K0=;
	b=KDEwmb7TDI8spYr9eNg+uGuZUoQ7qKoabcXEvqkmhTcy3Ym6cTPTTq6SIEgv6Zbe8P
	/Ya9g8UriMmUbbc3ag4gJY/fjGswe+C41w8XqfzezecqtcLQig3UixoLLxu/GSZzjPh2
	ytRJeJQYJUZUJsGESOhb4DqPyguFVyy0NHDo/b90I/lLA6OdrylZfrzkhukrImYy2/L3
	XT3BGkkDTy8MFmZ+ieorrplLcXsXOsoCHuMsVV1zqosYadbz7HU/FrwkRa3aJB8NvzUB
	CKyjLa7vru5vyfPZMLFOeX0GMsvrU7X5W11QxcVN7EbfW//LPR9T0tXaFBNYk1FP9g82
	g56w==
X-Gm-Message-State: AOUpUlHwy5wBs2SonYD/yU4naouIXcnusZDMRd4jzItkSHiKSDivCtm1
	Up3FLEKz5YxW0NOZPf7LFTa89Ak2FmQJPuqlGGU=
X-Received: by 2002:ac8:6790:: with SMTP id
	b16-v6mr26111446qtp.66.1533130107397; 
	Wed, 01 Aug 2018 06:28:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:12c6:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 06:28:26 -0700 (PDT)
In-Reply-To: <20180801123111.3595-2-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
	<20180801123111.3595-2-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 1 Aug 2018 15:28:26 +0200
Message-ID: <CABoDooOvxBww=HeNGt56t3uE_7zvhm70nz=fR54MguxaA49XVg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: Re: [Qemu-arm] [PATCH 1/4] target/arm: Fix sign of
 sve_cmpeq_ppzw/sve_cmpne_ppzw
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v+y2kY/Lh7SM

On Wed, Aug 1, 2018 at 2:31 PM, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The normal vector element is sign-extended before
> comparing with the wide vector element.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>


Laurent

> ---
>  target/arm/sve_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 54795c9194..9bd0694d55 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -2436,13 +2436,13 @@ uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
>  #define DO_CMP_PPZW_S(NAME, TYPE, TYPEW, OP) \
>      DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H1_4, 0x1111111111111111ull)
>
> -DO_CMP_PPZW_B(sve_cmpeq_ppzw_b, uint8_t,  uint64_t, ==)
> -DO_CMP_PPZW_H(sve_cmpeq_ppzw_h, uint16_t, uint64_t, ==)
> -DO_CMP_PPZW_S(sve_cmpeq_ppzw_s, uint32_t, uint64_t, ==)
> +DO_CMP_PPZW_B(sve_cmpeq_ppzw_b, int8_t,  uint64_t, ==)
> +DO_CMP_PPZW_H(sve_cmpeq_ppzw_h, int16_t, uint64_t, ==)
> +DO_CMP_PPZW_S(sve_cmpeq_ppzw_s, int32_t, uint64_t, ==)
>
> -DO_CMP_PPZW_B(sve_cmpne_ppzw_b, uint8_t,  uint64_t, !=)
> -DO_CMP_PPZW_H(sve_cmpne_ppzw_h, uint16_t, uint64_t, !=)
> -DO_CMP_PPZW_S(sve_cmpne_ppzw_s, uint32_t, uint64_t, !=)
> +DO_CMP_PPZW_B(sve_cmpne_ppzw_b, int8_t,  uint64_t, !=)
> +DO_CMP_PPZW_H(sve_cmpne_ppzw_h, int16_t, uint64_t, !=)
> +DO_CMP_PPZW_S(sve_cmpne_ppzw_s, int32_t, uint64_t, !=)
>
>  DO_CMP_PPZW_B(sve_cmpgt_ppzw_b, int8_t,   int64_t, >)
>  DO_CMP_PPZW_H(sve_cmpgt_ppzw_h, int16_t,  int64_t, >)
> --
> 2.17.1
>
