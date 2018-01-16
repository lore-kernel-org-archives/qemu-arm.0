Received: by 10.28.173.206 with SMTP id w197csp4097402wme;
        Tue, 16 Jan 2018 07:44:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBouL5zjHv8coW8BJ+2KSPQOxUi6nnbBinKaaiyhLfct/uV9cvPAOqKzHGizdovNMC/diVf0A
X-Received: by 10.129.85.83 with SMTP id j80mr26366553ywb.479.1516117498469;
        Tue, 16 Jan 2018 07:44:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516117498; cv=none;
        d=google.com; s=arc-20160816;
        b=0UuODfe0T13mJlquSNS4j8fPvHycKwDn6a8jW/VwZArRbG4ZgpqmNQRcc5Uc6G7tXE
         W2v8lUPq4H2z3D+tIQ5zX0mL2w4zTOiv4S7VqXyoYo81Ca9mQOaRgEcWHqIE7WWXGkUf
         2qWenThs/Zz+jHDRrVmzvYPF99xegySivPctA0w3QbgvaOYxtOMU1g2PhL8+JJ2NeFJH
         cupQeZ2Bb8jU0MP03nTbQvixiAFYr9u0ipzgOiwucV4dnalCZFqnShk6CQLKqxZm0Gsp
         Ws1AwEVO5nsBDFUFnAC1H7l/IluPh4odZRzAM20MgYqETdZBvsj+bTamI4lJzQxtqVVK
         r5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=veoCAWnMg/ulBpf5BkmcRv10dAGKU8uONAMWYh1Lhso=;
        b=vB4oCTqZlgUQTnHat7Yru7tc9rTLErDHUCJ6i+xkuOAqaIEy6rl/G2xLhW9VVKxrOK
         6kBfPvxdS5Ycj6y6e0L/MxAR5K8bmP2PdbU6lbvB49XBuCmelv/VicfDti+tRvrbFvaA
         7yePRa0L1qHYrSrJo7qI80BymkUuItsqN0rB+rCpVbfsjW3yCPnVjpOwx1ipSpkBkrn8
         HUub/ItnYnzXikRm64zccylzR9hn5kedsrs4C0VP+jJl4NLbUrDry4LRM/KUeM45UXGJ
         60lzwlNZToEa4gzyeA6Cbwfrn50ZfvEQAyEMtqbmfpsXcw3c5gAMiEX6cQlHNd/eM1Nr
         +XcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UNleGg0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s13si560711ybm.704.2018.01.16.07.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UNleGg0M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTQ1-00057c-Qm
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:44:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebTPj-00051R-NA
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:44:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebTPi-00077a-Sp
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:44:39 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:46299)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebTPi-000776-Og
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:44:38 -0500
Received: by mail-ot0-x242.google.com with SMTP id t35so7314852otd.13
	for <qemu-arm@nongnu.org>; Tue, 16 Jan 2018 07:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=veoCAWnMg/ulBpf5BkmcRv10dAGKU8uONAMWYh1Lhso=;
	b=UNleGg0MnMEU7Ne3zmHWGt7P24HcPX+/jO6vMS2KIyWC739K5zSXb28Ta2pDsjRhp4
	byf6SZ0ciN4ao7xunkoOg+xUwYRZNbm++O71n6i2YWDpiUVnpTR34CFxCR8JAW+yBAtj
	mcu8G7IfIea7qmu2kEeIFa8q3m73Es8/MN+os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=veoCAWnMg/ulBpf5BkmcRv10dAGKU8uONAMWYh1Lhso=;
	b=onlQbDOhM44Fm2Qm2bG1KLnYYa+DPp8T4OnBfrPZYul7QUmjQfA1UG5eH96YOxvBP8
	DcagXDbOWS1BRAju9c1p4OD6uM9zPK95zhVUwn9/T4onSDI2fKBE7Be7QyXaIjNOhRqC
	Uc8Ru3YvYd3npnNhMuEbSCM8ptCPzXXr6quBTo09b6kRqYKDziyyNf4zwoRi5CijG4kv
	6nYrSmjl+fjntkganB+d3ILkhxycamKA10PDb2oscg6Nk/FKOtcj7V9i5sIp188Xqp2v
	6eYHa1MCKL/nQIY1C37p54W3OffB0KFwd9VzgG9IPmMDqHnrM0e7n4ILcmv1hNQm8YFB
	MDHw==
X-Gm-Message-State: AKwxytdoPoyuYjFG3nKPapX6ot9sdw3aapc0muh2tvE5kBFV/a6oV2rX
	D+tav6R4hMZu/v3ULgY2tuTM7TLpjqX1ozzn8ef9pg==
X-Received: by 10.157.29.229 with SMTP id w34mr1131498otw.24.1516117477969;
	Tue, 16 Jan 2018 07:44:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 07:44:17 -0800 (PST)
In-Reply-To: <20180116151152.4040-2-marcandre.lureau@redhat.com>
References: <20180116151152.4040-1-marcandre.lureau@redhat.com>
	<20180116151152.4040-2-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 15:44:17 +0000
Message-ID: <CAFEAcA-3xF6z-D7XrKzAhNA_p0Y0U-UuDL7R1dK9+HaF4DPH1Q@mail.gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH 1/3] exynos4210: workaround UBSAN compilation
 error
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X9LjmqBgSqoo

On 16 January 2018 at 15:11, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> gcc 5.4.0-6ubuntu1~16.04.5 build with UBSAN enabled error:
>
>   CC      hw/display/exynos4210_fimd.o
> /home/petmay01/linaro/qemu-for-merges/hw/display/exynos4210_fimd.c: In
> function =E2=80=98fimd_get_buffer_id=E2=80=99:
> /home/petmay01/linaro/qemu-for-merges/hw/display/exynos4210_fimd.c:1105:5=
:
> error: case label does not reduce to an integer constant
>      case FIMD_WINCON_BUF2_STAT:
>
> Because FIMD_WINCON_BUF2_STAT case contains an integer
> overflow, use U suffix to get the unsigned type.

We should note that this is a gcc bug here (we compile with
-fwrapv so integer overflows like this are well-defined)
which we are working around.

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/display/exynos4210_fimd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> index fd0b2bec65..86e37e93e9 100644
> --- a/hw/display/exynos4210_fimd.c
> +++ b/hw/display/exynos4210_fimd.c
> @@ -98,7 +98,7 @@
>  #define FIMD_WINCON_BUFSTATUS       ((1 << 21) | (1 << 31))
>  #define FIMD_WINCON_BUF0_STAT       ((0 << 21) | (0 << 31))
>  #define FIMD_WINCON_BUF1_STAT       ((1 << 21) | (0 << 31))
> -#define FIMD_WINCON_BUF2_STAT       ((0 << 21) | (1 << 31))
> +#define FIMD_WINCON_BUF2_STAT       ((0 << 21) | (1U << 31))
>  #define FIMD_WINCON_BUFSELECT       ((1 << 20) | (1 << 30))
>  #define FIMD_WINCON_BUF0_SEL        ((0 << 20) | (0 << 30))
>  #define FIMD_WINCON_BUF1_SEL        ((1 << 20) | (0 << 30))
> --
> 2.16.0.rc1.1.gef27df75a1
>

thanks
-- PMM
