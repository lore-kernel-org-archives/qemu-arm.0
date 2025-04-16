Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp349941njk;
        Wed, 16 Apr 2025 13:24:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7wDcawnfGxF2K1GUOPLXaD76TeNuK3BGjAKyd3GnwpBI+8AtACn+ZUGKMcZs3efP0NsZC7FHenseSIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFs4lmCkOUkKqRP69/nqDfJwX7ROWR4kTCuXgkpW6vVBtEVQ6VoV7gVrBxjMFyklVK+MPXc
X-Received: by 2002:a05:6214:21cf:b0:6eb:2f30:55cd with SMTP id 6a1803df08f44-6f2b3091cedmr46032946d6.45.1744835093324;
        Wed, 16 Apr 2025 13:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744835093; cv=none;
        d=google.com; s=arc-20240605;
        b=gG0ioN+oplfjOS2kp//1/7YK7ufkh37WVgXdTIcS7vDsh2NIndt5u//uLFUDSLhf5p
         juS6eh6+oQDqsAqmfAFCgjlsc73ZMHN5sCoyr+6HyPOlLaOdkdldm/5nW7NhjOHfNMVP
         FfGbkbhVRdR5j7JuNHUF98XrvxnGwJ2zP03x91KmuxAoUVkBNs8VOwNEmSZOA/88xFpv
         ZufCFrwL6WzOZngqoBRzMnT62LK+hf/YFQAxqjzNY0v+l8fUIuJqFlixoh6fPcbCIDLf
         NECku+hP+cqJfpkWKPNNPvjo9kij7CV76MwhvigjcS8l1sKoEeHgXJhxmPP9dV+TnoFD
         ZQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vrL3XtudSocKq0wooSnmOfM6V32+vXg7VAsA0PUIkm8=;
        fh=T+blIFm8ZAtmy+rg2/Khd7KLGmvNRoFPDNXLP/Kiqx8=;
        b=jYx2R2ZY02Cy3sI4AR+LaOblme49RTbfOCI0IJqZ037pr/7Gp1MT3vorqIiV4fIboN
         wDV3qSkuGJKEXvvxcr8hN7VngnD3yVnE9beMNoYYZX5Qls36WZypzc0PzObKBiFRAdSe
         bzy4N27emhM45iYi1OgLP3uUv4EEksUs21wYj/QrHUbiaXe9LeBZHw0ezL0LViNli/t6
         Pmqz3bymSGmp3/hGqxUVmZ9sfLojlTuflmKGtlhuhxKH25SjiEt2QnDNVI+kIsefDDXC
         dZIZup0gZmGwvUz18f/xcDb0rVPaxM6dcjpo3G9YQSV9Fih8tr0fJG4waVmivUDGpWQs
         tdMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Hirt6xxC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de95f9ecsi156142336d6.67.2025.04.16.13.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 13:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Hirt6xxC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u59J9-00070H-1z; Wed, 16 Apr 2025 16:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u59J5-0006yd-Vm
 for qemu-devel@nongnu.org; Wed, 16 Apr 2025 16:24:28 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u59J4-0002F8-A0
 for qemu-devel@nongnu.org; Wed, 16 Apr 2025 16:24:27 -0400
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-4769e30af66so20961cf.1
 for <qemu-devel@nongnu.org>; Wed, 16 Apr 2025 13:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744835065; x=1745439865; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vrL3XtudSocKq0wooSnmOfM6V32+vXg7VAsA0PUIkm8=;
 b=Hirt6xxChwL3qwhBX9M+amJyroD/a2ZlHk3rlKSeP6Zkq9K6ws39OfRUCDw3j03o9d
 MHi9QhtPb+S2Zf2/gW/rX5uPYuVsnXyCRqWAnkJ0So9nXcr9tXfiMRkz8Uto3pxEDldr
 8dJERFZOHT5NWnIzL//KgN66Ch1Wn8QsKzlsPk2knIy4psz5duFMBteFWQ3LRyxxS1Up
 ettm0Q5VbLaY4nlU0sZEUY0g55SIGATPiSOyLZRhyIva0HcCFbhV9F3/bqmzO9JGwCdn
 4QHogeWdlkLT45VccOrqOdGVKyXrfReCZ4nZau5Lr+NiM5sSvTZj/lapYAu2kjEb+hR8
 oQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744835065; x=1745439865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vrL3XtudSocKq0wooSnmOfM6V32+vXg7VAsA0PUIkm8=;
 b=XvyXSeGl8t2clmTmmdg7pI3UTk9dQA0K1cn4OonF9FHXbZBa5BB/Na4hzCIZ/aQgBR
 sZ5d3JDUmKGPow7VixBRtzsZgGtxWrjzZdOM2n828tIrWAuxyy2R19Hz6DHaJL8/MeFH
 4JP9ASUJovWNCc4QgTPYplVKkdzPorE4STZV1aMUbeL1xXkkCVYz+H1K1yf+FABZiGfR
 wcvjOlGcgETKHxxvugl8ErUuX2eArVHVPy8ad/M0zszjHfkN56MwMx/h9woMJLUId3Qe
 esTE0h05fpnt1Bso0+dpdcII6u3POAsOQ9PniKjSs0yWHg5xqE8KRodThmryIVH2lgFe
 FjXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMBlhoQLL23am7OMNQmGXeJ21wmIEO32P+O1XdxfMzpPAqVrW5OUXo63tlPmRBHG1iB5pY9WZZSaZK@nongnu.org
X-Gm-Message-State: AOJu0Yy9nKtW4VZ6xBOX+UGMq03t/dtvPx1DtKJlmuQSXAJrfP/a/3OM
 RximM6t7d/2N841Ms7jH2qZ/dp29HXCY9v56YW0wsvt/Pyyft8faZ349+jmhLeTEbia3gAeabjo
 3OySngL5ZaVRrXycrCY9wkPdBEVaPZNm8IYv6
X-Gm-Gg: ASbGncun3PzI47TFm1OIBed0W8WgqWwj+/R54XWVMiPPUiCO6UvEEj3DSMSdw2nsckB
 zm1zbj8ZZPgurapOmAgn6cNZ0EOE9joBLNx3kkM7h3iDPpWBw250FM4H6KZcpiAAtkClA53Usuy
 BHbh3ED9zkZJHDGnsvgkotMOjdCW9QpCbMV+y+CXTg1sIwYSMO0Gii
X-Received: by 2002:ac8:7d05:0:b0:477:2c1e:d252 with SMTP id
 d75a77b69052e-47ade6aa718mr814611cf.20.1744835064721; Wed, 16 Apr 2025
 13:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
 <20250416034327.315714-5-jamin_lin@aspeedtech.com>
In-Reply-To: <20250416034327.315714-5-jamin_lin@aspeedtech.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Wed, 16 Apr 2025 13:24:12 -0700
X-Gm-Features: ATxdqUHQJLb0d7VjvwjPePztUybeLQnb7sB6snG84yYEU9uFNl0kURntxWFyG8M
Message-ID: <CA+QoejWhbdbEu-F=SXk_yTVabk4QjK0A47DngamXguEK-xPVcA@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] hw/arm/aspeed: Reuse rom_size variable for
 vbootrom setup
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, troy_lee@aspeedtech.com, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -178
X-Spam_score: -17.9
X-Spam_bar: -----------------
X-Spam_report: (-17.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.268,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UfwsYR4AULQ/

On Tue, Apr 15, 2025 at 8:43=E2=80=AFPM Jamin Lin <jamin_lin@aspeedtech.com=
> wrote:
>
> Move the declaration of `rom_size` to an outer scope in aspeed_machine_in=
it()
> so it can be reused for setting up the vbootrom region as well.
>
> This avoids introducing a redundant local variable and ensures consistent
> ROM sizing logic when both SPI boot and vbootrom are used.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

> ---
>  hw/arm/aspeed.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index e852bbc4cb..b70a120e62 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -381,6 +381,7 @@ static void aspeed_machine_init(MachineState *machine=
)
>      AspeedSoCClass *sc;
>      int i;
>      DriveInfo *emmc0 =3D NULL;
> +    uint64_t rom_size;
>      bool boot_emmc;
>
>      bmc->soc =3D ASPEED_SOC(object_new(amc->soc_name));
> @@ -475,7 +476,7 @@ static void aspeed_machine_init(MachineState *machine=
)
>          BlockBackend *fmc0 =3D dev ? m25p80_get_blk(dev) : NULL;
>
>          if (fmc0 && !boot_emmc) {
> -            uint64_t rom_size =3D memory_region_size(&bmc->soc->spi_boot=
);
> +            rom_size =3D memory_region_size(&bmc->soc->spi_boot);
>              aspeed_install_boot_rom(bmc, fmc0, rom_size);
>          } else if (emmc0) {
>              aspeed_install_boot_rom(bmc, blk_by_legacy_dinfo(emmc0), 64 =
* KiB);
> --
> 2.43.0
>
