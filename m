Received: by 10.223.197.9 with SMTP id q9csp1691675wrf;
        Fri, 6 Oct 2017 07:09:39 -0700 (PDT)
X-Received: by 10.55.214.7 with SMTP id t7mr11959155qki.30.1507298979684;
        Fri, 06 Oct 2017 07:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507298979; cv=none;
        d=google.com; s=arc-20160816;
        b=FYPwXXdnxq2FznsznfmucxYcvYmm4jzghYCMlKgwPAn8lfQtD1HjC5RLEgHo8w5kH1
         jormTUuG5C+bdGKHk69oIRqLzanb55q1K5dFOYwIIOvd51cBOEoNzUUX96XWugl6lhs7
         jBskUKEnz3EsLyd3hLyiVNhEvvf/eycQimmV7Xvggfn96ub14EEXjGmQBSoCgcQ6BhTQ
         9OLw24iZq7mhz6nJ7BPNIJuh6WS7IUvUkMscQyiFDizozEHaI9Kvl4QrsW+1fMzUsOxH
         8WM+YKBk8gFJdFhBUNw4Vp3sway66LEvh46Jtl7s2I2L3uGld1O8t+wU3ACkcq0Sbscq
         zVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=MDsaw7WNEsrc2ASbGplw1agDgPGBkHE3xFu/3GNLEJ8=;
        b=QUagX1kpFx1ZP3fhFsXvDsheggM0QQOmw2cRHZ/agQeO2sIU+kuBy94diHJkcLhsSZ
         qSxBG64iqMUI9nwmLTbqSF47Os5JR17XPymEKIV/nDNzXhCbV4lNg6t6rbVWK+x1ORlZ
         4JIR6wGRnlQ9V/iDGJoTOyQSlhhtEeGeZ+PBN6TNVLcOdBWvB0jsabXeGqWK2k/3lXpO
         7s84yUkffJVzrwj6pqChPnJZsfTX5xv3SMjRmb55qCDSFzEkaBxb4AB4sJMlzwA9m4BR
         TpJxFbdgUOVFvOrkIT4nCY4NKmfwrYUMNvOIohSkVseRxmXX50J+5yXRfzBrBhV/hm0F
         LZiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=evmb8C9J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p190si1283958qkc.549.2017.10.06.07.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 07:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=evmb8C9J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0TJr-0000E9-44
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 10:09:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TDW-0003v8-Vk
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:03:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0TDS-0001GL-TK
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:03:07 -0400
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231]:53213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0TDS-0001Eb-MF
	for qemu-devel@nongnu.org; Fri, 06 Oct 2017 10:03:02 -0400
Received: by mail-wr0-x231.google.com with SMTP id k62so13099080wrc.9
	for <qemu-devel@nongnu.org>; Fri, 06 Oct 2017 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MDsaw7WNEsrc2ASbGplw1agDgPGBkHE3xFu/3GNLEJ8=;
	b=evmb8C9JRZNe7rBZv67eYNn47Oi7Jl3hasXycbbdSuM3v+xosri1HMpkihi4z3m9h5
	izFL7PqvaVwe3gTdCWa/3SoBhkXAbWKI2k6p2cNf1pINytYhhEqpNxYIcFenlid8BTAn
	tzOsIMehK2XlWkwYq3sOPB3b4Aymf3E3qv9D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MDsaw7WNEsrc2ASbGplw1agDgPGBkHE3xFu/3GNLEJ8=;
	b=L/bHnqgc+Wc1OxLKpWt0D6G7pXCi+Qpppyu3bdORnX3g+KIotBm3jaQbowrjvDWYtR
	DHa7fXM65Hr9xyXPJavTDS0boBHQWUzi5eO5Yx3nlDzVLhx8VKLEY4H/0zi4tkWaYjrT
	TsOtc3k8NQiiWJtKX4+GErZWnz4x/+MiBhCPXaYY3l0kxJ+/rrVDXlS5e6ruTGI0QjWZ
	pUFCkoMG+pJ9CVmQIzw9R0vttqSNI/gehlVEBmhRLiwbtHtyd4jrod0I1kgBI3DbM8dA
	9DxjmaU+snV3L9UkjL0s5KMag7EazEQzsA5ygwThT+wvAfK666ZCUM0XcFfsh30mNypw
	g/Ow==
X-Gm-Message-State: AMCzsaVl8y085OVLYpqyVanzRdb9spiQOIPDcG22O9qpgVp+jWvvWTts
	mFy+qsjM27UB327czzszM/yJSlIgfP8/oH1MlItlxg==
X-Google-Smtp-Source: AOwi7QANSh6gowycITwbEHcucV2xXcXvzPMEr7FRLfjOKHEiOCVqo0Imsv1pg/GSTCePdM9pUkeF27zjp6lmkD7zmmw=
X-Received: by 10.223.197.13 with SMTP id q13mr2401104wrf.272.1507298581561;
	Fri, 06 Oct 2017 07:03:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 07:02:41 -0700 (PDT)
In-Reply-To: <20170918195100.17593-8-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-8-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 15:02:41 +0100
Message-ID: <CAFEAcA_+HDjZWHbNhedzL7he=-1WPMRePh917-9BZJK0AYqPdg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::231
Subject: Re: [Qemu-devel] [PATCH 07/17] imx_fec: Emulate SHIFT16 in
 ENETx_RACC
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08iB9KkuKcdn

On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Needed to support latest Linux kernel driver which relies on that
> functionality.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/net/imx_fec.c         | 23 +++++++++++++++++++++++
>  include/hw/net/imx_fec.h |  2 ++
>  2 files changed, 25 insertions(+)
>
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 8a77136d38..bd62d7a75f 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -1037,6 +1037,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>      uint32_t buf_addr;
>      unsigned int buf_len;
>      size_t size = len;
> +    bool shift16 = s->regs[ENET_RACC] & ENET_RACC_SHIFT16;
>
>      FEC_PRINTF("len %d\n", (int)size);
>
> @@ -1049,6 +1050,10 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>      /* 4 bytes for the CRC.  */
>      size += 4;
>
> +    if (shift16) {
> +        size += 2;
> +    }
> +
>      /* Huge frames are truncted.  */
>      if (size > s->regs[ENET_FTRL]) {
>          size = s->regs[ENET_FTRL];
> @@ -1085,6 +1090,24 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>              buf_len += size - 4;
>          }
>          buf_addr = bd.data;
> +
> +        if (shift16) {
> +            /*
> +             * If SHIFT16 bit of ENETx_RACC register is set we need to
> +             * align the payload to 4-byte boundary.
> +             */
> +            const uint8_t zeros[2] = { 0 };
> +
> +            dma_memory_write(&address_space_memory, buf_addr,
> +                             zeros, sizeof(zeros));
> +
> +            buf_addr += sizeof(zeros);
> +            buf_len  -= sizeof(zeros);
> +
> +            shift16 = false; /* We only do this once per Ethernet
> +                              * frame */
> +        }
> +

Can you avoid having an end-of-source-line comment that wraps
to multiple lines, please? (put it on a line of its own, or
edit down to fit.) Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
