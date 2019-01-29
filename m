Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4618957wrt;
        Tue, 29 Jan 2019 08:06:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5S/uNM9O31OkpUSy/sqYhUiSa6IhMih2VaL8J1ckcu0bT2bsIdTL69t6frwh7RXX+ZXojN
X-Received: by 2002:a25:4e57:: with SMTP id c84mr25819524ybb.117.1548777971378;
        Tue, 29 Jan 2019 08:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548777971; cv=none;
        d=google.com; s=arc-20160816;
        b=TisGg7DTYgXFdvO9LbW0F2THqDbRzsk/6cx0NYtA+Z2CAaASVTzikA64s8Yx56EfB+
         m0tDhI/Ov2iGbZ2eRkbl9VIkj7jR1TXId1uvzF2CRlLxgFUVz4xqqrt0hIMEfQa4IaNs
         EQqKzvbA6J9ACdEfo7Xj/V1nQRKDuoXKOG479XIDNGalS+7L6Law4mIkiM4HNAKZxNjX
         xhDcQ4D0fnnKfv4bRGryII63MrJcIgMbTPjM4/KBYIjEmlSFqkynPNXLxUBggXFztp8O
         c7544fqusmLiUd7br0ci02jJVfqO0crr2fp9pSqQyK+5C3FYaA56wJ2w9KKR3Gzk9Oxu
         1i7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FXy/0xrxGUndw9cUjyJrDYX2PS81ENoDlIBK7WQ7S7s=;
        b=fTIm343oFghdQ6ZOr37uTG0OUd6PPYE9BJMdgZoyShtm3Rilbo3jjBCYMNNdXlD/As
         BttDnkI/twqC6E1mPlImXFHhXuEnQLZIKUToJgwko3XtBe9eJlwVmHQMM35DHNkbX0WK
         cEoj12VClKLNh54OUDEXtqR0MbciEtMY2axFoRo31WvECBKI7yVMSdZHa3nEbXYYzlgN
         2RvGI8JIFY5SpqRNsPW0xa7c/C+n/jFgoYxDopIDwpgNrl3PN0s1xSLoDe5qZtrqPaXr
         uZcBLdJ0NzOvP7veos67zTywy2fOBRQokBcIfg0ZVIo2ShnlJ4gTBJvj9uaWwSeCXOke
         T/Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="doRt9sb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d63si20739163ybf.111.2019.01.29.08.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 08:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="doRt9sb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goVB0-00025z-2c
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 10:19:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goV1n-0004ze-0e
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 10:10:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goV1b-0006Ri-06
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 10:10:13 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40950)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1goV1a-0006Og-Ch
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 10:10:06 -0500
Received: by mail-ot1-x344.google.com with SMTP id s5so18120096oth.7
	for <qemu-arm@nongnu.org>; Tue, 29 Jan 2019 07:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FXy/0xrxGUndw9cUjyJrDYX2PS81ENoDlIBK7WQ7S7s=;
	b=doRt9sb/Cwd1EX/zRTFGU2jDCFuGJoL9lJ+iqm97nDBBdNpj1Tk6T+cmGVu/tkcxns
	FAA+FMWvxETz4LyMUIAimS5h+NTjcZEvzIhgAopo6I7cH/mSXYmOz1FkhErxQast9Ypa
	xCCLGp0flubvz7b0ec5K3lwQvTRNNlcsU0i+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FXy/0xrxGUndw9cUjyJrDYX2PS81ENoDlIBK7WQ7S7s=;
	b=qIJHkZr/4alXoeNYy2phA9z9mOLwNEDQ03zx2TYW+qrBFYzpv8XnF4lfJaZ8Lv7OJj
	7Qdw+hPeGN3E9SWUEOQfsLMYiY5CXxAOdVrLTVN4aeOsXuPGHtYEKxJCbmCAiaQsTjx2
	A91yKKOhUU1UuMG096hhrl31fYfEiQ5TpKb4pobaS8kNv8kzukbF19z44h9QSv8tEzwF
	v966MKIWXIMKH9h165RrIJWXEqWKHAG8m3F1BA7dsvKnJFjIFzIHJxbTpWNBvjDDEz+z
	W6Cz6B8MqtzaBO2YLQk3Nvn7CCWJ5BGrv5A3G4+Q4lvxWCYkFxILpTZEU1Oti14sGnOZ
	191g==
X-Gm-Message-State: AJcUukdrYtRQ3fjqNTrqKIMu+88mJr59MoJn6thyqU1a8M/I9HqGh0n/
	ph2r68RzwHWhD08Hsi8wUoWfU/r2p4m41XN/pVa/xA==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr20041441otc.238.1548774586798;
	Tue, 29 Jan 2019 07:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20190125155630.17430-1-sourav.jb1988@gmail.com>
In-Reply-To: <20190125155630.17430-1-sourav.jb1988@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jan 2019 15:09:34 +0000
Message-ID: <CAFEAcA-E=-6H340nhA258GkCbM2YC4=CxCRsBicanKJtEc7SXA@mail.gmail.com>
To: kumar sourav <sourav.jb1988@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH] hw/arm/nrf51_soc: set object owner in
 memory_region_init_ram
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AOCUIbc9RaY5

On Fri, 25 Jan 2019 at 15:56, kumar sourav <sourav.jb1988@gmail.com> wrote:
>
> set object owner in memory_region_init_ram() instead
> of NULL.
>
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
> ---
>  hw/arm/nrf51_soc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 1630c27594..3a1c7e200c 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -89,7 +89,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>      }
>      memory_region_add_subregion(&s->container, NRF51_FLASH_BASE, &s->flash);
>
> -    memory_region_init_ram(&s->sram, NULL, "nrf51.sram", s->sram_size, &err);
> +    memory_region_init_ram(&s->sram, OBJECT(s), "nrf51.sram", s->sram_size,
> +                           &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;


Applied to target-arm.next, thanks.

-- PMM
