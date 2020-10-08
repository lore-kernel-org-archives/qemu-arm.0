Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1230656lfq;
        Thu, 8 Oct 2020 04:05:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp0guhU6JindJFhk3xn5Ku5TpdXzOm/9kmXMpl5kFyZIHE02whtTEJTcYlEuYjyzt/56we
X-Received: by 2002:a5b:d44:: with SMTP id f4mr9560755ybr.153.1602155147392;
        Thu, 08 Oct 2020 04:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602155147; cv=none;
        d=google.com; s=arc-20160816;
        b=Yx8VYHotmp2KrajV2hY0obdzIN2QtJHn83rRSIolccUrAvl2DJX1H0nPTH26oGEVOO
         k/UuGeWy0XMSoI5itT4tYlsYiWjx1/ls5XdoKBPcJpYOReyQYaRsbQGTr9Lb5GSKAtuB
         53hajrAB2nyISVYRwtfqE/bQsJKwjPyqVEs551dnx8Xmf9ipVMIWhCaEognk8OmAIFM0
         xkuLGsKMIQCrS0/6EhrzDq9+AuP46ONgZl8NYJS4e3fb66AAGEg9+03Z0b5VAZM5A0Ok
         m7lYGcXQwZ638ZBu0FqL5y2S/fjyd3XUokThwljckK3azpnmytQIVpz3soBCKX6liKPO
         rAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=G4MqhLqpjMcTPLUEHu+e5WavH2k49KYPVDzsHyniNXI=;
        b=Q4ws1NyUDwAzwBh0H8ERhyW5+cJgQGhjmDqld3pzM/XNgFgTg34XmYsKuMuM7CqHy8
         UsveQXp03vNxLEKbZpgXbiOhBDRrs6iJkDPdINJUgdF2KghGTZkmp7RbyTCkrV9clOQm
         yl7STkBwJdl37O0bFPbj9QZwbxyPmRnDAE9Wf/wyIUy2R4wGZggdNeo6r+7jN2haU7D8
         Xy2/IDJn/1iHeAjx9K9vyDlzIJPeGMlvI/PKhZpbOjJrX/6DFJr/lItQHzQnyuG2OdE+
         kc9Mft2wz91XouHe+ZusSXYmwCT4cCY3/EqoxRNCThHAmYQAwLMY+Rd+5NZoAmP5L1/l
         OJdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="u1sD84H/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si4556643ybm.400.2020.10.08.04.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 04:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="u1sD84H/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQTk2-0005j6-Pv
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 07:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTjq-0005iF-8m
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 07:05:34 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:35102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTjm-0001rX-2y
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 07:05:33 -0400
Received: by mail-ej1-x643.google.com with SMTP id u21so7508957eja.2
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 04:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G4MqhLqpjMcTPLUEHu+e5WavH2k49KYPVDzsHyniNXI=;
 b=u1sD84H/Td+ncJk3VHEhOQbsgvpquiGKHv7UPQTcbhDXN74GY8CysqTNVhkLQ/Ig/4
 Ty02vHI4ql7AXY7x3HMbYLMAMR2ZVeRlLuvrcSUzaKkbqY9JsOoD8maapGklfGxdeECV
 ER+k3Oudwf8VjpzqQ2WFkaueLanztSjxH6BpimJGcDM5yHfpR4JB6K5xl9ieJSRjqElH
 MM28H5h3H//vPoVgu2v3VIVhkEWCP4YccuhiJ0U91WapWAneqJwLAw4xg8gpnHdniHsP
 eJkT12nJNhgOySkcmSjsN+9/GzK/zgQwM9/BWE5HHyn48OuSvTaQ35vAMlf5ee223pX6
 NAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G4MqhLqpjMcTPLUEHu+e5WavH2k49KYPVDzsHyniNXI=;
 b=jF1soR6qp1kgESmEzAnrl2fCPp+pcZeUxmWUZOOXguuMss6W8vf7mFIEUW7q+XZf+M
 qJpf0haPW3rtjswCyROezcce9o8YKFV1akdNYZqDTZgwOi+p+pP9wNnIwiv5to2EkF9/
 nl3fNQxTvAnj4ffTJ1KXseSH+fkVyCPNqC/p6WVpXRkFT8/GVWNlaYfey1364gaJNw2g
 hbvA9pJZ+LUV3V+IC9x3y+SUKMivdZu2DIyRBYflxWVPiV+5yBaQlWRtIdOowJLCQfvX
 rHlpKj7RWJlL9Jr2jkwegfn93MhOhXz7fL5YvCyOkeqQ3jyHZ0J/p2BHlMCia6sLrbVI
 QueA==
X-Gm-Message-State: AOAM530FEAtVVVl14MO7DbJcDZOqWoCl+g6c4G/YvB+XxKEKsz+tGXvd
 ZWVc0CHhUakJlXgXLYDlDxymSc2MSrjWEmi621AJ3Q==
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr8354395ejb.4.1602155127018; 
 Thu, 08 Oct 2020 04:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201002181032.1899463-1-f4bug@amsat.org>
In-Reply-To: <20201002181032.1899463-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 12:05:15 +0100
Message-ID: <CAFEAcA__ibwCfP72qQch9ahmQAo07i-yTzTPbK60H5H0Trubtg@mail.gmail.com>
Subject: Re: [PATCH] hw/char/bcm2835_aux: Allow less than 32-bit accesses
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Luc Michel <luc@lmichel.fr>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M2Esm/FVb3Ub

On Fri, 2 Oct 2020 at 19:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The "BCM2835 ARM Peripherals" datasheet [*] chapter 2
> ("Auxiliaries: UART1 & SPI1, SPI2"), list the register
> sizes as 3/8/16/32 bits. We assume this means this
> peripheral allows 8-bit accesses.
>
> This was not an issue until commit 5d971f9e67 which reverted
> ("memory: accept mismatching sizes in memory_region_access_valid").
>
> The model is implemented as 32-bit accesses (see commit 97398d900c,
> all registers are 32-bit) so replace MemoryRegionOps.valid as
> MemoryRegionOps.impl, and re-introduce MemoryRegionOps.valid
> with a 8/32-bit range.
>
> [*] https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Periphera=
ls.pdf
>
> Fixes: 97398d900c ("bcm2835_aux: add emulation of BCM2835 AUX (aka UART1)=
 block")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Noticed while running Trusted Firmware-A on the raspi3:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg680115.html
> ---
>  hw/char/bcm2835_aux.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
> index ee3dd40e3c..dade2ab5fd 100644
> --- a/hw/char/bcm2835_aux.c
> +++ b/hw/char/bcm2835_aux.c
> @@ -249,7 +249,9 @@ static const MemoryRegionOps bcm2835_aux_ops =3D {
>      .read =3D bcm2835_aux_read,
>      .write =3D bcm2835_aux_write,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
> -    .valid.min_access_size =3D 4,
> +    .impl.min_access_size =3D 4,
> +    .impl.max_access_size =3D 4,
> +    .valid.min_access_size =3D 1,
>      .valid.max_access_size =3D 4,
>  };

We don't seem to document the exact semantics you get for
a write with a size smaller than the impl.min_access_size.
Looking at the implementation in softmmu/memory.c, the
answer seems to be "it's turned into a write at the larger
size where the other bits in the write are zeroes".
Those semantics seem OK for this device (though there are
devices where they would not be, I suspect).
(The other plausible implementation would have been
"we do a read-modify-write sequence", which would not be
OK for this device, since it has some "device state changes
on read" registers like AUX_MU_IO_REG.)

We should probably clarify the comments in the MemoryRegionOps
struct to nail down the behaviour when the .impl constraints
are tighter than the .valid ones, but for this patch:

Applied to target-arm.next, thanks.

-- PMM
