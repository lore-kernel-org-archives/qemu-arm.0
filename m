Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp118677wrg;
        Tue, 18 Jun 2019 19:11:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx83a1NLMETyvx1k4ATtn2kw+DxjDQb0UBHGxjBtwMBh5sxLEsxIljmhWMHQ9eHX6yIzIEf
X-Received: by 2002:aa7:cf0c:: with SMTP id a12mr57390875edy.146.1560910305112;
        Tue, 18 Jun 2019 19:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560910305; cv=none;
        d=google.com; s=arc-20160816;
        b=jWys3O2Xiz5F4mPq/xvIZtH0kVtFyL8lnGYOA+j3StNA9qqWYFKnLbU4Ot3NWkAR+Q
         YliOrUEW4BOGAWyAXS5IljlbpPJpf5W1cBBhhFfyRgjgF5Akw8RGbnPywbNo0n+d0Gc7
         eWuBff/mIzo+UM7vdmphsgCkleAV1U3QoSqLE6g2Q7b5E8gxhw32IdXabcpk9NHmzqGw
         r57qqyhIOhactnuGowN/zYYYV9To3qrkiGf2RA9fOJsEkr4eZLnoF3YNW+O5bTIh0d75
         GS2HzLP+6IFlqs2ogcV9Hbo3/AQe2rgm3Tk3tVm+56iqUI9Bk/elCbJC2zn5/lpkA9Zi
         uxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ZmXSnwHDh0E8tuWNW03pqMDS2oeDoYmhkZWu+MRjA6A=;
        b=Lybg9+gjyGz2pOWSID6vf0M+gDV0Xl6/kgGboCX+VhZxvmXF0ks2WmQibkVlVt4WHv
         Dt5Xayv2XgOnUQAwox2LZF4RwJ1AO+5IVVN3bHxeGVa+2BZyUxqBKpYsB43FYYMrEsP2
         F2xAUE4sQcVB1R3nCulgH+IDTREbT5vwme0iTwYQoT5ITK33C3xVIUZz2U1z8qU2U2MJ
         trB0KWD6EZBk/f7EPIXHCdAmORJawHMrYX6jEbiYfbHY8rdeeVGCYAbUoXR2uO59b0Iu
         j7817kZw9rHKjEgtcu34l3Ye33qnqIcWMdyjTwa7QCKjw2fgrQKb7qpM8gglZLse7aSq
         9VJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=U9Yl9mR1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si12559316edm.368.2019.06.18.19.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 19:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=U9Yl9mR1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdQ4e-0008I4-8G
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 22:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34145)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ4V-0008FD-KR
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ4U-0003Vj-MU
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:11:35 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:39221)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hdQ4U-0003VL-IA; Tue, 18 Jun 2019 22:11:34 -0400
Received: by mail-qk1-x743.google.com with SMTP id i125so9935276qkd.6;
 Tue, 18 Jun 2019 19:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZmXSnwHDh0E8tuWNW03pqMDS2oeDoYmhkZWu+MRjA6A=;
 b=U9Yl9mR1NwT+3QQTRdK6Y4WF/s69kVjlkhEZTi8uOLkMc89kbwPZW+u8RN0clz18wj
 D/Qe2r41Ku2B7OuPov7ULEL7mSU8jz0P+nZvUpxdQWdQM/MIVFIAI7qsbGXWAlDMYn32
 XX3b4J7KiLWO1POnGMqLMTKC81Q4miqUqlokE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZmXSnwHDh0E8tuWNW03pqMDS2oeDoYmhkZWu+MRjA6A=;
 b=A/EQA7fwEJ/dK/+8Cqo+XFYolj5vxpRBfiscAHtOlrY1DvWEgwklRURHRmtnKYFpMI
 BYKHO56uGw64imlEMBU6XTamg8Vl7TqVrFIs98tfy1oeasstMGaT+wkrQxE0TeBjwA7N
 1YnYkcYxKVT4e+QGeL4LXHTbnt2XXUL5w+UHc7QgMYvfll6Vr+nW6zgCfwUOeSARGtt/
 R8mzEWTQeeLhe4czQr4karWVDBCgxdKNkxAZVg3tek4UYxxuHePmDEWuks8HQDElkpXr
 sIQtCWj/04yg/ql+PgmqJqbPdZHXBcmsM0YVDHVeT63ySSFh/2T7/RSeQtjY/91sI6m6
 sNWw==
X-Gm-Message-State: APjAAAWhoVB0A5uXth5uJqPNL2j408iYMCtAxCwtWW8dk85ar5sfp8jy
 TQ6dBnkCDsFRZPa3nhXpFPWW+ktsk4HUVJ7ypnE=
X-Received: by 2002:a37:4793:: with SMTP id
 u141mr71663312qka.355.1560910293823; 
 Tue, 18 Jun 2019 19:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-7-clg@kaod.org>
In-Reply-To: <20190618165311.27066-7-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:11:22 +0000
Message-ID: <CACPK8Xf1RSiixc_8vZ7AEMTxq8G+LQ9Q3+3eANnMLaVvJW3xQA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::743
Subject: Re: [Qemu-arm] [PATCH v2 06/21] aspeed: add support for multiple
 NICs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4lykss0TGEtk

On Tue, 18 Jun 2019 at 16:54, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The Aspeed SoCs have two MACs. Extend the Aspeed model to support a
> second NIC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/arm/aspeed_soc.h |  3 ++-
>  hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++--------------
>  2 files changed, 21 insertions(+), 15 deletions(-)
>
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index b613b00600fc..75b557060b9b 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -25,6 +25,7 @@
>  #define ASPEED_SPIS_NUM  2
>  #define ASPEED_WDTS_NUM  3
>  #define ASPEED_CPUS_NUM  2
> +#define ASPEED_MACS_NUM  2

This will be 4 in the future. No need to change it now though.

Reviewed-by: Joel Stanley <joel@jms.id.au>
