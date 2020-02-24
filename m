Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp810391lfg;
        Mon, 24 Feb 2020 13:43:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqziYjFUf6tznCzUs9NYQLGpnDOoxHrzuRHfu9CTj1nLN+B01jfdDU5q8ZhILv7JEzihu5eR
X-Received: by 2002:ac8:2902:: with SMTP id y2mr37191965qty.258.1582580606968;
        Mon, 24 Feb 2020 13:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580606; cv=none;
        d=google.com; s=arc-20160816;
        b=lKHGUiJfWlTGOnPdJx5ypnaMWOmLrnagyBIAeK8YEX8U+yvPYt7sVQhOP14V3iER+Q
         MMdBciLDRVk3qp5XGylfsd0kvSrKsLFBuukJGmZO+DSKcFw32dCDTTXG9VN8cHfVKjSE
         BToL+FluQ9vGKV4sm2NMmVYz7j259q/8czH9xu98+vltoxD7oHWuta4KbcLLpnImbApU
         2qMjnrcKNLR+3HKe6r0/06vlc/6+tQKbwGr3hsH38BxdzjW39mZxbEABR1vsSOG61EJ8
         htjUX1z+qEm2WqXOSAp8890waaFHFpfxnzIDso9bKyzWq5WpzHAnoL3e3INJ9HCZcCFI
         ya3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=f/ifAF9KuPku19Cn2OwygyTt91U6QCUjnSpXcB6RnSA=;
        b=rhkw+CfwO8gbqjp5FHJJcXaGSuA1sbGKGx6D2dp7ppqFlLdsVaPDzyypIRva6ID5NW
         4Ag4hAL8Gone4nHnpxzDpieEukGcFOis8d0LOa86gbTKrYQN5xEyJ7U7NsBLK6tUfYhm
         H7jEvPrwon8gBt7oWSqUkVeSlBkJ0VJOAEi2YSNFxKyDT+2WaH7Clx8J1VNiKkV3dHLj
         /rX7akYTdsqs8AKADE/W3cd8RnzCEX8+2x33TspWiml0P0VGLuUHmvH0BhL6fpK17XMF
         lC3yLXiMKkWPCXLWD5vcrHh++I5kWJuCLU7sMYS1z0cn2jesbkQMSNzJaORP/hDI7VDI
         phPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Plbot5xX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 43si6296676qta.50.2020.02.24.13.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Plbot5xX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LVe-0004IY-D5
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j6LDy-0005Uf-7z
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:25:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j6LDw-00008l-AT
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 16:25:09 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:34709)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j6LDq-0008VV-Bw; Mon, 24 Feb 2020 16:25:02 -0500
Received: by mail-lf1-x144.google.com with SMTP id l18so7940475lfc.1;
 Mon, 24 Feb 2020 13:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f/ifAF9KuPku19Cn2OwygyTt91U6QCUjnSpXcB6RnSA=;
 b=Plbot5xXUC22k6W/VTeAJm1AvN3NYvMbKqo67/KxfYVWbRkmnwPR3mUJskptCA2KIj
 hI6Ny1bkzn8uiujqqRZwEFMMo5siZWfChYcskfACv78pRbJt8xomgP7l35C42JeCpNVJ
 ebztbymX7FWbV3cbH3Y5bs7U6WpvfoA9rcUu3JvuAuBwo4/V/DEewzRBY5uEIvjw/Rg4
 NU30G1iMSh7d+HcrHyYa5ubYUbu5K0WYvg2YQjWClpSFja6YxzBYgxoUCVo05yQWv5LL
 aNHHXy1lNIKhSnStsTw/aeA9Tr3lZ7YUk4A0TlC5dzQ2Hnp3+t2BsIcIrjXflHDNVTcI
 7HEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f/ifAF9KuPku19Cn2OwygyTt91U6QCUjnSpXcB6RnSA=;
 b=So54aTbND/mXb/mA75FbO0NnmYOTohu/ZaJvXpeZEQW0qMdDTSBIyVAYhn/4tNklB9
 x3dh6kZs9I7ddFvDf9mCsZ9ld7dRO0JD/GYySoHvSBLw1muQhnNCh0Hz/qYrwnCf+/XC
 wf+1e2pvD6SaPRJkNZMoDpCt1Ej+IPRH9mfjlPjbQcRvbAmgBa87bhI/HZK004nAge2w
 oUt23vZIFkHit4RKOZFP2+V6cRuNE74fzg+2GdKGh0nPBHjvzotEuc2VgplHxPiamZ+P
 rHe0S6WVnqLQL+wAVmvs2H1sNMn6AcHmzBbuPtCJmibByZvGnA8bo3zxZW/cdf5ilhPU
 vvww==
X-Gm-Message-State: APjAAAXElYXx9EQsrDEidvjPPK87Mhvi7BLugRZRTIiJ9m60UYJ4AaPv
 jq7NZPWrPbBm1Jgcy2Lua5gcresSRKb/tYNZAeI=
X-Received: by 2002:a19:8585:: with SMTP id h127mr7476613lfd.196.1582579499762; 
 Mon, 24 Feb 2020 13:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20200224205533.23798-1-philmd@redhat.com>
 <20200224205533.23798-3-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Feb 2020 13:17:22 -0800
Message-ID: <CAKmqyKPYOtVjK0z6JWzDv+HK6oNg0BS2RLSHWzVHreiLAFQrbQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/32] memory: Simplify
 memory_region_init_rom_nomigrate() to ease review
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IfrczVQ85p1s

On Mon, Feb 24, 2020 at 1:10 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> memory_region_init_rom_nomigrate() has the same content than
> memory_region_init_ram_shared_nomigrate(), with setting the
> readonly mode. The code is easier to review as creating a
> readonly ram/shared/nomigrate region.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  memory.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/memory.c b/memory.c
> index ce1179874e..6a327a54ed 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1659,19 +1659,8 @@ void memory_region_init_rom_nomigrate(MemoryRegion=
 *mr,
>                                        uint64_t size,
>                                        Error **errp)
>  {
> -    Error *err =3D NULL;
> -    memory_region_init(mr, owner, name, size);
> -    mr->ram =3D true;
> +    memory_region_init_ram_shared_nomigrate(mr, owner, name, size, false=
, errp);
>      mr->readonly =3D true;
> -    mr->terminates =3D true;
> -    mr->destructor =3D memory_region_destructor_ram;
> -    mr->ram_block =3D qemu_ram_alloc(size, false, mr, &err);
> -    mr->dirty_log_mask =3D tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
> -    if (err) {
> -        mr->size =3D int128_zero();
> -        object_unparent(OBJECT(mr));
> -        error_propagate(errp, err);
> -    }
>  }
>
>  void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
> --
> 2.21.1
>
>
