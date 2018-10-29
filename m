Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4863491wro;
        Mon, 29 Oct 2018 16:48:32 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dsY5MltsvUHgdLLAhRYM03WZxOqO04iY044df3iOx5R3YpSCCQMDXmLGizJ4HWFaIszbBv
X-Received: by 2002:ac8:701d:: with SMTP id x29-v6mr424358qtm.161.1540856912385;
        Mon, 29 Oct 2018 16:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540856912; cv=none;
        d=google.com; s=arc-20160816;
        b=EiwB+eThJlrZWJGS3eTfS1y3rx8WIr1kF24twwUDGG4NOrS+kpMwty9RZLltMZz0rL
         trBYM4jYw/AbuALNd8NRzA57ol6W1yQGFdw/6QiI2si0VFK6xk7l4eQHW7tfLVjrm6vD
         IGcOKIc/qYP5FcICL2knzF/A+gwim/azcqII7vbzCouh5cr0hF0VC58OEsdFAwR0ceyb
         k99NiOSHoI7U204aWIj+fp4Kyiw8C8Z5QSIISIUO0SAQED5pczf3xCxe9zzv5rLfMD9F
         p1jgK09RW6IIEZJu9ohCMK3KbHsc5Mh3onjsEC2vNzt2uCcUiLrKT0zPpeiSxDv3QsHj
         E7WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=USMMIFJ+q/2TeHIbK8bhk+iy24x8w2aeZv74U+iAefE=;
        b=iEerKjZu3B0nNe8XiyWrnbQVXjYDvimuO3i+xZjX88T6nsfgv0FP6wJ0IOJ6DEWdJa
         U05J680mc9wwfRDqKNzKL52qkICWB6Lg54dcpPoSmIi9sYi7B7r119Ixn7HHufwv7Crx
         Gz7hu/sZHGW4RZUrx6ThiR07MF+Qi0b2LzlrSiBBDHgc3Q5FbVXODskT4XO4PSz0bvWE
         LefjzhSsx099iwWX4iAw1RA13yod/AqpmdE0LzqCtcH1EsKSktiDioa0HFYH14D97QFG
         JMVHBUqJ/LcWw6+1AMJWlwn+RT7wt92uMyLRPhhJrwNisFpwJyR/f4Mxx3o7nhcwJ6HV
         pJaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a2IxOZkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t66-v6si3388553qka.63.2018.10.29.16.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 16:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a2IxOZkx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHHGp-00070F-SE
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 19:48:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHHGY-0006xB-CD
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:48:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHHGX-0005Qb-9Y
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:48:14 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:39112)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHHGW-0005Nz-PE; Mon, 29 Oct 2018 19:48:13 -0400
Received: by mail-lj1-x242.google.com with SMTP id a28-v6so6565739ljd.6;
	Mon, 29 Oct 2018 16:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=USMMIFJ+q/2TeHIbK8bhk+iy24x8w2aeZv74U+iAefE=;
	b=a2IxOZkxAuRUXLQG6OvVKw6O0yKnLPAYLzPIvSiuRFjFjHmWl/Y/L4QcAvBB1BuTJG
	IgG0C62eGvpHypSFqI3ze4TrO3MRDa1N4BlowlHw6YwcDLifBL+VtuTFscblH+meWLPq
	KBaEsOkxRTWwFxikiXdJVxVJQrj5SooeIn5LlcPspE57WoTj34iw3QUUoxH98qTcjDjI
	PdXtdZpXkXeU8LOActBddP5mQM/WVYtkWgZ5VRpTTMlEqn2x+mZ/c2Ji/E2X4c0bMqpP
	YvgGZXjgZnOw/aeBUha/qKfJszJcEcm90bIcMUW9e8lYby6RM19UP3yJ327BH+01hxDn
	Ntpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=USMMIFJ+q/2TeHIbK8bhk+iy24x8w2aeZv74U+iAefE=;
	b=bfpgWdx0c9rw0PytVnhnO6FCtzmUWidgH5idMchBOlQ3q6Y0mVFkwQFx3TJ72OEROS
	TRrEiGJ3WJv80NyGQcNSz4s5jvrTtlD6dCac0YrF53YBwSYY39tk4dbBnv6UWEUQpA31
	4nLKH1vjnaFiBKJuDK1/n33y3+uo9N4hZH4TNAWHgdBAPCWH2sH9iu3EDD4pDQSHVfej
	ABQ6t9Cg5cpMnG6PfznzcqLF9j41bEzqPoi1a/du5KuS7lH8GZ95aJ99UuOGYCyULPXu
	LHGop2YUQ7ZZ3NjIqdGW/8BLsKQ1z7CyNUlYjtxfEhuxTAq0WpLnBQinvWKcN1dimNfA
	4KKg==
X-Gm-Message-State: AGRZ1gLb0HH9VPhL5fEy6lGFLM8CbIO/G6wqfcbE7P+pGYbpoQL74sof
	CMfOCim46br9Bb4xxPf2o67GJ6vPSnfcoNGHmNU=
X-Received: by 2002:a2e:1456:: with SMTP id
	22-v6mr10483114lju.116.1540856891481; 
	Mon, 29 Oct 2018 16:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-2-philmd@redhat.com>
In-Reply-To: <20181029232100.8454-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Oct 2018 16:47:44 -0700
Message-ID: <CAKmqyKOnfcm6_AYWmZn+SdHtdY6Fr0s7xLVn-XPGm=ayk7imNw@mail.gmail.com>
To: philmd@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] hw/arm/xilinx_zynq: Use the
 ARRAY_SIZE macro
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
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m+J0+LfeeKoR

On Mon, Oct 29, 2018 at 4:22 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xilinx_zynq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index f1496d2927..57497b0c4d 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -294,7 +294,7 @@ static void zynq_init(MachineState *machine)
>      busdev =3D SYS_BUS_DEVICE(dev);
>      sysbus_mmio_map(busdev, 0, 0xF8003000);
>      sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line=
 */
> -    for (n =3D 0; n < 8; ++n) { /* event irqs */
> +    for (n =3D 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
>          sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET])=
;
>      }
>
> --
> 2.17.2
>
>
