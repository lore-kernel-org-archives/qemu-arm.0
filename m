Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp158890lfm;
        Thu, 27 May 2021 02:08:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu/sAeWOmoRe8Cdi8rynzF66ok7kwkb4t45q0C67AijGoWodawsW7QqRc5MHixBIColU6S
X-Received: by 2002:a05:6102:10f:: with SMTP id z15mr1391793vsq.34.1622106514768;
        Thu, 27 May 2021 02:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622106514; cv=none;
        d=google.com; s=arc-20160816;
        b=cB0MBmxKJF0BDRcdrJyKenBFAxESe8MLnQDnyyNv24qYOGchCLSDilnhHyx2s5DwdY
         yjY+oYgkU2hoHkSSdk7QHZKT5qKr8VBnkc56lhFhPAxIHNsNFhR2+YKTQE+Zhzl6A6Ow
         pmKVV/INPYqBa3R3Wm4w+5EDC40L+QV7zij55pUklvqiitdKPclw83+TP5xHCUyzifn9
         vbRBXIeUl4TTCNGPpjd5pZt40HW7ErtSFjjhKOq4YkxqIS1wyDEJOhpM+SCzbKDGgW5X
         3KjNGpGLD75oXtJftxc+3fWhsIw1yaWi3Xb74r0oCBJZrpR6ouH30czUxmBz6FE8nbIp
         6vbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KVEuB+h4KzEXpphTEpF4JDFUcpRvqaV1m8M0c2d/CQg=;
        b=dUI4FqCAInT1idsboQLnxvbE/YjFruPyOsHXK7OU1qRKsViq3zmxgrW2hPezyT02+T
         K781oeSW/a6/GW9nPswOCL9jlx3y36J9g5QYQ4hmkGF6Jd0oBYnc7b2Nq9YPd6GR8B48
         KH4HcQZatyTS1dhBNgHj/QrUKoXpH/otjxwfeoHdn1rD++dpXkVoSFAerX+lpJ6wxMmp
         XYOd2AmMS+kCCf1r7gRVOcdI0a70c1mZMLEZIxBPyf+4w+SGc0D3hxsURRrkZaqGznlq
         uNmIu9iZdRsYAf7HkBiZJLNr3tb5qCkNafikwIAXFy9GkYYc3d30cSb5fWviFV0vI+tv
         e8Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b9cGvjIh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si578324uap.213.2021.05.27.02.08.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 May 2021 02:08:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=b9cGvjIh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lmC0I-0002UT-42
	for alex.bennee@linaro.org; Thu, 27 May 2021 05:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmC06-0002Th-Ak
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:08:22 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmBzz-0003qk-3L
 for qemu-arm@nongnu.org; Thu, 27 May 2021 05:08:22 -0400
Received: by mail-ej1-x635.google.com with SMTP id l1so6875324ejb.6
 for <qemu-arm@nongnu.org>; Thu, 27 May 2021 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KVEuB+h4KzEXpphTEpF4JDFUcpRvqaV1m8M0c2d/CQg=;
 b=b9cGvjIhM/4M5iBjBK8Wrk8wEhAl87luaQZSqlMPtKTfHvP2Sx0MULIY1G+ATDniT8
 or2frEBy4UMrg9adjd+4hyPJyFNOYUAH3rfIQm7BSFGn1EmE3FSKApC5EFYf/RzDR7OP
 At/IBhst1xIE3Qx31AMWKQWmafaqBAtPr0kUp5gRE2S7DJ/frVjbnbBcaPyjAacRBCUb
 Bvn0L2DUXfrRSrqZv0oTbpotEWf+zz1lr1pY4kxI9Y3KuCH04gJ4H1tc+3+DywLrlwQz
 oguPQKnghw6IQP1a6WwZ3s9iY623QxO35M4RFE+Y57pms/4Igy1llBejT4+M3DWkH02l
 ojog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KVEuB+h4KzEXpphTEpF4JDFUcpRvqaV1m8M0c2d/CQg=;
 b=RFZOWiy4zV2A4sXwd9hOvRhhRKjjVBhhHwUnYUiigZjoYqyLgYxHacmucBP9rGOIVr
 aDHUVu7SIH75wY0LyQZsYIpHjeq1uIQTS2FCteRGnXHShLApLagHqEnMNg6dLaPEzW8p
 49/bEbl3MUnHZtcGfAO4obCKZiMMsKuVKp8MOdXrDlt5u1FHpuwJViSgQE06kQGV9p0q
 Pn6o/JQZkQ+V2FmZIYhxmptRS8cxkfLQYpfdwrN2J+mpcxebZAzIbPHwDQ6VBh8tSNUp
 Nd7CE1S+fe9DQd2hPznrgFNmbrkKDqT16B52IFFEUgDRgQhfKs+E0G+zmZ37rltg/X0N
 Qfpw==
X-Gm-Message-State: AOAM530Krub3WLDdRaZDS96PuRDBW8VK1LU1Fz21l3mAydpKP+dhXfdC
 TOFtlwGYwZ8z4BCFW8Y00P2JXSmF/Zc1wBM2qSO4JA==
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr2703345ejc.382.1622106492986; 
 Thu, 27 May 2021 02:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210520051542.2378774-1-f4bug@amsat.org>
 <20210520051542.2378774-4-f4bug@amsat.org>
In-Reply-To: <20210520051542.2378774-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 10:07:46 +0100
Message-ID: <CAFEAcA-JLiP2OTYzhiWH1sNOW4-z+LF+9xWN73h=CzuVWx1iQg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/core/loader: Warn if we fail to load ROM
 regions at reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u/b6MFSi5KTt

On Thu, 20 May 2021 at 06:15, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> If the user provides an ELF file that's been linked to a wrong
> address, we try to load it, fails, and keep going silently.
> Instead,
> Display a warning instead, but keep going to not disrupt users
> accidentally relying on this 'continues-anyway' behaviour.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/core/loader.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index b3c4a654b45..37a2f2c4959 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1147,8 +1147,16 @@ static void rom_reset(void *unused)
>              void *host =3D memory_region_get_ram_ptr(rom->mr);
>              memcpy(host, rom->data, rom->datasize);
>          } else {
> -            address_space_write_rom(rom->as, rom->addr, MEMTXATTRS_UNSPE=
CIFIED,
> -                                    rom->data, rom->datasize);
> +            MemTxResult res;
> +
> +            res =3D address_space_write_rom(rom->as, rom->addr,
> +                                          MEMTXATTRS_UNSPECIFIED,
> +                                          rom->data, rom->datasize);
> +            if (res !=3D MEMTX_OK) {
> +                warn_report("rom: unable to write data (file '%s', "
> +                            "addr=3D0x" TARGET_FMT_plx ", size=3D0x%zu)"=
,
> +                            rom->name, rom->addr, rom->datasize);
> +            }
>          }
>          if (rom->isrom) {
>              /* rom needs to be written only once */

address_space_write_rom() as currently implemented cannot ever
fail: it always returns MEMTX_OK. (This is because it completely
ignores attempts to write to devices, and writing to devices backed
by host RAM always works.)

But perhaps this change is reasonable enough as future-proofing
in case we decide to allow address_space_write_rom() to write
rom blobs to devices in future?

-- PMM
