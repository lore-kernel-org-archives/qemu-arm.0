Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9797710lff;
        Fri, 17 Jan 2020 05:24:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqyG8qqHDywj9PwGGykg8aX9VsVrr/PcLWussdI/DYjYipLc86UdeTvIZqR8F7VlA5+r4nwM
X-Received: by 2002:a05:620a:13da:: with SMTP id g26mr39072351qkl.410.1579267451870;
        Fri, 17 Jan 2020 05:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579267451; cv=none;
        d=google.com; s=arc-20160816;
        b=GTzBt7o/QCHiYKjBu4BFYI1XQM2ohqPmmdcEL8GZOSTWsrolExuyWWG8W16HRUqQA8
         Hcy47jd2wgk2EnBiPIbJqqrW6R1DjwamfZqv7cmXkOyyO4WfVqwnxjmNbunqIlnWbiFE
         DQybBbb2TZ+O+owwq/C2Y9qSH8IiksM2Tzn9L9dzWS1wHGfEg/yEUlw3QRbYwtBs+VuZ
         iM6LUpshI+PolxBCFIuUv94E+AyFI91XQ23bSs/sCRvGTzEdzRK4fjOz5bh64ldAjAIR
         ZJa7+fjb4LR1+gDhyZmpCH7JKRJm/jFgAU0+0iXMfhXUvC1ysWK7TXwDdtnZIceZ7lHf
         b1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+zYS3Ud1rDBMQK54BEbf3637JZsB+MdOPqjMUZWYVTo=;
        b=M7U8goXviQnKDBTuPR3CSvk3wjxVjI1q74n4qNCMpPhqeiuL8Sh/BNVYrh4jUypHfL
         gXdltCrnpACwQLNnCNv+VxINvfvzcpqE1dE/VpQqD2lZqu0Y7V6J2hDs23lDZUnA7QzG
         2/pSS93oOie0Uu/ydx4zGi/nNcookmQMnMh5Wi+FF5oMHNM1P2J9FuSDMquUrerIm8jJ
         5jJu5qXsL+wwLU2VC5RoaRw+WYRUdKGKiffb968TyZhmYkMx1sjV0MHKY69GkluXtb6y
         R9Z5vHTtX/CishxCrS/H0dVds2XdKI/alRIDkzt/PFgDVPJCJjKd0Dkb52WfASftTsDI
         G8jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oTgXrAgK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19si13781267qtn.210.2020.01.17.05.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 05:24:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oTgXrAgK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isRbe-0006CD-U4
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 08:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47829)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isRbT-00069H-Ta
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:24:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isRbS-0007ut-OI
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:23:59 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36213)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isRbS-0007tw-Hv
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 08:23:58 -0500
Received: by mail-oi1-x244.google.com with SMTP id c16so22158095oic.3
 for <qemu-arm@nongnu.org>; Fri, 17 Jan 2020 05:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+zYS3Ud1rDBMQK54BEbf3637JZsB+MdOPqjMUZWYVTo=;
 b=oTgXrAgKu93y78nHno3/sYxNzUyyZcj7j18x93jXfFkjeJZrCGZLMbZn602Nf8WMsV
 2hs/uXRv/F/SAS5X9ZycgFNcDICR3Jn9K1Qzed1ZroBKqAIulc1O4f8oaxN+R2Igy6Ji
 PYytMGdvswT+MClLSKW5C8luW4PXoHiKkvqvWpZ7duN/5BBMCiBuOVXkaL9T0TNfboVd
 Mugm7UKR7uyuue93v6/G1D9CeiDRZfH8apLoajdE/92qmdX7Iha9uhqP+fLR1b3jPicC
 LrsrnLSIULjC7ruSsN5NXPz9PowFxQHO+LqCNqx7ePtrf4qZSER5w5lzih2AZVGx135o
 DYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+zYS3Ud1rDBMQK54BEbf3637JZsB+MdOPqjMUZWYVTo=;
 b=s3CtwtvvV6R9SIZPVAJoXD/VfXKzvjyJ+pHkdOJzm23bEDWxeFhREHsBXRZ2KRnO3O
 reE+TnxuOAbJs42krdAGZxEmOjnicH9h6Ybg1Ac7vhaNpy/squL3YXSvxgqjEW8Lr36l
 8mTWN67nYvQg/C0QDp2lkhXrF/Le3hBZh/Tks2EQa6sxPuDa/SPFh1EFZaqThWLZsouV
 luxZLkG0+JdUDesrx0qgJBXWG0qr0zdAoN/5COTRKLsRRRJMGCoaWKFAQTk+gCMjeGIu
 Tg4l7cvufTQkWDE/Ch9+2brKC2Qz6Kx2ZDMn6K46ptV/xA6klxNqPDWWCRUSdmt5Iz7U
 nBNQ==
X-Gm-Message-State: APjAAAWWBV48Ca9JwzC/x8dx43TK3WP9TfeDUzTJosf4ScEwbP97omny
 8+aHGKXwFelNkvlIeBAA0Ic5gQpsl+724ZzSakrdZA==
X-Received: by 2002:aca:f484:: with SMTP id s126mr3234670oih.48.1579267437500; 
 Fri, 17 Jan 2020 05:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20200110203942.5745-1-linux@roeck-us.net>
 <20200110203942.5745-2-linux@roeck-us.net>
In-Reply-To: <20200110203942.5745-2-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 13:23:46 +0000
Message-ID: <CAFEAcA_k8xdzmsgMK+m6wSgnBN53UjCNU4nTBx=hnHnHz+Su6g@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma/pl330: Convert to support tracing
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: COm97BiZ2Ga7

On Fri, 10 Jan 2020 at 20:39, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Replace debug logging code with tracing.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/dma/pl330.c      | 88 +++++++++++++++++++++++----------------------
>  hw/dma/trace-events | 24 +++++++++++++

> +static void pl330_hexdump(uint8_t *buf, size_t size)
> +{
> +    unsigned int b, i, len;
> +    char tmpbuf[80];
> +
> +    for (b = 0; b < size; b += 16) {
> +        len = size - b;
> +        if (len > 16) {
> +            len = 16;
> +        }
> +        tmpbuf[0] = '\0';
> +        for (i = 0; i < len; i++) {
> +            if ((i % 4) == 0) {
> +                strcat(tmpbuf, " ");
> +            }
> +            sprintf(tmpbuf + strlen(tmpbuf), " %02x", buf[b + i]);
> +        }
> +        trace_pl330_hexdump(b, tmpbuf);
> +    }
> +}
>

> @@ -1175,11 +1186,8 @@ static int pl330_exec_cycle(PL330Chan *channel)
>          int len = q->len - (q->addr & (q->len - 1));
>
>          dma_memory_read(&address_space_memory, q->addr, buf, len);
> -        if (PL330_ERR_DEBUG > 1) {
> -            DB_PRINT("PL330 read from memory @%08" PRIx32 " (size = %08x):\n",
> -                      q->addr, len);
> -            qemu_hexdump((char *)buf, stderr, "", len);
> -        }
> +        trace_pl330_exec_cycle(q->addr, len);
> +        pl330_hexdump(buf, len);

Won't this now do all the work of constructing the hexdump strings,
even if tracing is disabled ?

thanks
-- PMM
