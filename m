Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4792483wrt;
        Sun, 25 Nov 2018 14:50:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UIFmfz7c0QWWsd0Cud0hIj6S5q2xkywkGW1psf+kLCTSoSqsuUbb6Wi7nUYM+JnXAGut22
X-Received: by 2002:a25:3502:: with SMTP id c2-v6mr25340225yba.410.1543186248173;
        Sun, 25 Nov 2018 14:50:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543186248; cv=none;
        d=google.com; s=arc-20160816;
        b=n+9WQflDLwseUwb0wcMnLwMbWCdkLjfCzT9crL5m3gD1WGHdnKVMcrPqSUdXjB50gT
         9RwKxvyeiH/t9qkwVGzIfgnUeRFPOIECmGJFhrGiA9zGsKUf21ha06zEKmhn96N1jyVn
         xE5/+Ozb6uNz7MCah+PKLyI5eP4CB5Yh77y6lEjEK9m5+GOEayVWDLU+rTJa2DbLxv64
         Q/xz2NEtd0glbuWhYz8xNNebPaALtNNWrt26poEEFOOM0K8HwmJA7dPgM57hKWnLd5zr
         0HnhjfMREFTpYx5m8PHAZFau9tIVEkI5cJ7v1NOp6lYkylm/3ReSl1N2WNHo3ht+fxhS
         Gxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=kxhLBVEQ9wXqeM2FbtUtBixBvKfoDdmGu9+VegkbkTk=;
        b=drUuG4er82Kt/7Qzbqua2NHX5+6SX0yKBnD5UR2Dk67+SeQxrkv9Cfs9OTCjHxEUyi
         tOUbtigHzzjIibM9E2KEJ26y/Nwq0zwLMI3QK3HErr72q80oO5Vj2ZJjKm/z+7zRsNbY
         z9jBCXZ2FPxCJSfefTisXx8FjDrVBBJgQk+QbTr/7DN5ethpGfvY4jTAXNFjUAk7tzJ4
         MwVYpbZoLPbd9W8Nw9AOG2cmK8kKgteSqCfAJYpBNNrde8b0pDK3/O8AHcOJC3t8YRpm
         SWE4AnwbmOQD4I3ujmGhMNFOEctLfKPoZp2EN8RdA2y4G1Igb9qciUkoJCrqBEF1Rwf1
         GH4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aqTHZYT0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x143si23630633ywg.78.2018.11.25.14.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 14:50:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aqTHZYT0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR3El-0000aR-2n
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 17:50:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3EX-0000a0-5S
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 17:50:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3EW-0007MQ-C9
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 17:50:33 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:32905)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gR3EW-0007L0-6M
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 17:50:32 -0500
Received: by mail-ot1-x344.google.com with SMTP id i20so14977858otl.0
	for <qemu-arm@nongnu.org>; Sun, 25 Nov 2018 14:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kxhLBVEQ9wXqeM2FbtUtBixBvKfoDdmGu9+VegkbkTk=;
	b=aqTHZYT0Zy7Mppv9x2J3udk7+yUTOCPJwxJCJSIqU6q5/9Dnq3I2ABUJU7MJUXj1ZG
	xQVCuLiikBxTzDR1UaOuZdyLqodV1S2D3u57iuoZTmTivHZJo6yabAKn0nkPAyD95l9Z
	JfZUXl/rAoGexZ9br6fjItcPi50WNUqk6dUgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kxhLBVEQ9wXqeM2FbtUtBixBvKfoDdmGu9+VegkbkTk=;
	b=m/GF3JuwzFCCTbZqqfT7AWmmFRov81siLWSD4QDATgvTR4+4BOveQHXvOMAKLVK40Z
	4O0CZMTLNklzxMmjafX9kq9HSfzcZGl3RPASuJgb3TcGDDWNzZQyfOEoLdyegr0FIVD3
	mr2/hENpHLL3+IQTvrUloqDIhZklHyB8w9I8W+9ASDe5btlptTcI90QVoB+wc9cIgW8l
	fCrJJQeNRLTp3qxxdhkLO0fyewa8eDNnOjgM95ktJ7LPpb0lrTWelmdAdaKXmUETZl8d
	44pDzhKOoqIx4BVZbJa1HbbVtlntF33l4D/7NQmpq85fL2mFwQHE0uU2RG8QAObWKMob
	OOAQ==
X-Gm-Message-State: AA+aEWaJa97TlpXnI77cO2FUSZQm6hRYIkG+hxKr1EhZEmcWyEdJwSK9
	MJwvEz0og5zhmRPhMpwAd6+/E3/HMfgYrU5uz0vykg==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr14156618oth.238.1543186231328;
	Sun, 25 Nov 2018 14:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-7-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-7-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 22:50:19 +0000
Message-ID: <CAFEAcA_ujDFu_X0cm5gVppESYeZ4KfNwjJkVKrsCNRgBeeQ1OA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH for-3.1 06/25] MAINTAINERS: Add a missing
 entry for the Xilinx S3A-DSP 1800 machine
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5xxiqUwtnwhD

On Sun, 25 Nov 2018 at 20:51, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e396cbe71..aa17e9bbd3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -822,6 +822,7 @@ petalogix_s3adsp1800
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
>  S: Maintained
>  F: hw/microblaze/petalogix_s3adsp1800_mmu.c
> +include/hw/char/xilinx_uartlite.h

Missing the leading "F: " ?

>  petalogix_ml605
>  M: Edgar E. Iglesias <edgar.iglesias@gmail.com>

thanks
-- PMM
