Received: by 10.223.161.27 with SMTP id o27csp514141wro;
        Thu, 26 Oct 2017 02:38:29 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RecC5J/ghpcDnGAr+Nz/k81y5AR0hxyeCZ1/jNZ+k2O58dPaUmUAa5V6DSQzTdY7KFchvR
X-Received: by 10.129.123.135 with SMTP id w129mr14664742ywc.299.1509010709791;
        Thu, 26 Oct 2017 02:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509010709; cv=none;
        d=google.com; s=arc-20160816;
        b=SedPjggMcIMBv6HUnGt7WhIeBy+p4lq6emMC4vdNgb3mAWgESq07VAfI7WyreajBfl
         /WmEI9C/pnD3o2WPV1K2spgAlG2OazlCBrHX9rjNKHnL5WT2rcQnlBHX+2XrqP77MrA0
         0UHTVY4TC0F56Fke0/R2vBycZlcdldyj6hePm9Zoni6lHwMntH9znndD6E2dj6c2Bp7v
         3GCE7bHFd5/2ws0yGOy90/sf3hAfVhfDvZwSU5vKhuVBkCoglSEXc91sxAWs2nUTJpry
         /dVb1Xz8lCM3whEhDJ2j/OyUD6WXa3L9ZsrsY6ePhYX+UwxkmFHoTbRmG5t166cdBtZr
         o+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9cZISm/Mxc63mNx1I+2y5N4Iysre5x4mD5gbLfrbgh4=;
        b=zRkTzm8NqWhA96L7mIeT/P+wAFB0vMNk8kxAFjRrB3bDIOWcOkm0bOB2dwocIo3ngR
         wp6SfuiOuOYR6p5xzBne9ifyM+kwPRyP/o4A4v4sZWLCSaoUMciM+1YDVHez0tWztjvi
         iaCrrcuULTNphkeq2qtp4lAybFDJcesc3g9huM53olxmMBudIgJpPJE7Mmpyliu9uU7F
         PEZqffihTdDV2AeXrPVf8g5iSw/G86le4R+sYjACZI68RsBz4H/OZU4yfeE71/5QOddD
         vmdUlgHejAK7/1AZ1RL2h/Ts/y76a1If3Hm31L59kCkSw596/jnHS5MDHJ2R/dPHp9Nm
         A/zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZmOownJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3si305291ywl.369.2017.10.26.02.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 02:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZmOownJX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7ecP-0007lv-8L
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 05:38:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e7ecB-0007k8-4I
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 05:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1e7ecA-0005WE-3a
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 05:38:15 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:47759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1e7ec7-0005TI-Qd; Thu, 26 Oct 2017 05:38:11 -0400
Received: by mail-wm0-x243.google.com with SMTP id r196so6703835wmf.2;
	Thu, 26 Oct 2017 02:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9cZISm/Mxc63mNx1I+2y5N4Iysre5x4mD5gbLfrbgh4=;
	b=ZmOownJXXGMm/N42xqe7IQYO/EXvFwzYzB5RrjpsJeRseYkzyA8m7R/b9iRt6cvKTn
	yI+EToHJFkVjcrj64E1Hv9Wv+AqqK0yFUxJtWQ8aMU713X4bU4lUT7SNkb02zXd1EW5R
	PhRBSG6MnNuZP3ZaZDNx95U5dJnwYti6L1DhpLVglfglUEGcNx26SymnNimiYgJrfdOT
	bjPZ4IVHbgsY1niULMssDVqKhuSpzxf09Szip9nCHu8qLRqN3oe088jqkmBMsemNK5iB
	0OUUTt4VyjBYDuX3Mp8LZRTVd1YOMUsXDcr9dongi42I3nQQf/7y32H7AtH0fGDYEVG7
	1ZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9cZISm/Mxc63mNx1I+2y5N4Iysre5x4mD5gbLfrbgh4=;
	b=nG7BNKAmxepyw+ajThQ8hOkp7zMhcCVGXhb9T4W1G2+3oeJjQifh1Hls8tO6vf7vwO
	qwZRfUMKPyHO+XC4cnRCNpk4UxnXGWxzXQUkw5/ZyjHPplK5Ei887Tqi7E3z74O1jKXc
	FWuuKNKCI1JGl4mmlam//yFGldhNRwTP7FjgQjykERIiYbHbws1PPVO22ElNZfSz6VE0
	mcOkb8KRjHrLqlqR2Np0gkpZORFBmzN4xLfUdqIZDg+xmVDJB7wM65ILrJwYcw5BA8GX
	iOjbbvwir19OG6doQVHTeP+qbsv5Jl9CT7j8f3UksR0SBYCWiwlaHHB06VqhcNpqKuV1
	Vi8A==
X-Gm-Message-State: AMCzsaW8gAnLoXGV5UwZ7cA4ebBGJdlzQ+c9VyMCmYaWwVLTDFt2T1xg
	VfLeHA8S8dZZq0IP2jZB/yPo/FVTZrNks+AjSV0=
X-Received: by 10.28.230.77 with SMTP id d74mr944003wmh.75.1509010690408; Thu,
	26 Oct 2017 02:38:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.157.2 with HTTP; Thu, 26 Oct 2017 02:37:39 -0700 (PDT)
In-Reply-To: <1508898544-10307-1-git-send-email-sundeep.lkml@gmail.com>
References: <1508898544-10307-1-git-send-email-sundeep.lkml@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 26 Oct 2017 11:37:39 +0200
Message-ID: <CAKmqyKPJ2Dh4skNnPBpkKFjAMB5Uh9vfy7FEMeiBNMatoKzhwg@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [Qemu devel V4 PATCH] msf2: Remove dead code
 reported by Coverity
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	darren.kenny@oracle.com, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X49RuR7IVqlT

On Wed, Oct 25, 2017 at 4:29 AM, Subbaraya Sundeep
<sundeep.lkml@gmail.com> wrote:
> Fixed incorrect frame size mask, validated maximum frame
> size in spi_write and removed dead code.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

> ---
> v4:
>         changed %d to %u while logging frame size error.
> v3:
>         Added comment that [31:6] bits are reserved in R_SPI_DFSIZE
>         register and logged incorrect value too in guest error(suggested
>         by Darren).
> v2:
>         else if -> else in set_fifodepth
>         log guest error when frame size is more than 32
>
>  hw/ssi/mss-spi.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
> index 5a8e308..d60daba 100644
> --- a/hw/ssi/mss-spi.c
> +++ b/hw/ssi/mss-spi.c
> @@ -76,9 +76,10 @@
>  #define C_BIGFIFO            (1 << 29)
>  #define C_RESET              (1 << 31)
>
> -#define FRAMESZ_MASK         0x1F
> +#define FRAMESZ_MASK         0x3F
>  #define FMCOUNT_MASK         0x00FFFF00
>  #define FMCOUNT_SHIFT        8
> +#define FRAMESZ_MAX          32
>
>  static void txfifo_reset(MSSSpiState *s)
>  {
> @@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)
>          s->fifo_depth = 32;
>      } else if (size <= 16) {
>          s->fifo_depth = 16;
> -    } else if (size <= 32) {
> -        s->fifo_depth = 8;
>      } else {
> -        s->fifo_depth = 4;
> +        s->fifo_depth = 8;
>      }
>  }
>
> @@ -301,6 +300,17 @@ static void spi_write(void *opaque, hwaddr addr,
>          if (s->enabled) {
>              break;
>          }
> +        /*
> +         * [31:6] bits are reserved bits and for future use.
> +         * [5:0] are for frame size. Only [5:0] bits are validated
> +         * during write, [31:6] bits are untouched.
> +         */
> +        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Incorrect size %u provided."
> +                         "Maximum frame size is %u\n",
> +                         __func__, value & FRAMESZ_MASK, FRAMESZ_MAX);
> +            break;
> +        }
>          s->regs[R_SPI_DFSIZE] = value;
>          break;
>
> --
> 2.5.0
>
