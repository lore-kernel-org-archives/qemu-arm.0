Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2264057ejb;
        Mon, 20 Nov 2023 07:31:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQeKeBPwBNUnjmTXU3J75+tpruiUvNUszhBVy/2rP6itAsV9CS9p6bDV5+UkrVMhFoZcuY
X-Received: by 2002:ad4:5c67:0:b0:677:a207:8770 with SMTP id i7-20020ad45c67000000b00677a2078770mr10523800qvh.0.1700494307585;
        Mon, 20 Nov 2023 07:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700494307; cv=none;
        d=google.com; s=arc-20160816;
        b=AIyz18jK/cjBeXaIbVdrbxMl6C5FtbE4+tGUgkR0GsKr0rzCcmbgq8vIJRqNvZwnYC
         ID3TY8wToZANyyaNd9q0MrZ14bKrEnzbfCB7udAn9QYLXroFm6iHY4sGcXa0Y8+j43gD
         0SawsDVRamuPdvkxfadLFZCNt7JDkO7ZcKAgYhFnPFZZfOXxOFr619vgPD/UsRdSQo3q
         yCAJ1B2uf0uxEGpPG+ugIWBveMYdumIYs8VdrgKU8+VLBHv67OgtRKcjeB03nGQggRkL
         gbFuab9CKrrWkg8UWOlI2eEIF3XT9vNGnoA8+XKXJqm6/lDyelscD8Soa5KqP5fHVK/o
         nr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oeywu8kSO5O0y2XZ/oyJH7tep+m6AGiuZIfGIyFBXBg=;
        fh=iYcsIVFBQZLXLroM1tORJDrblqrhjoEGBJ0TJVBH8/I=;
        b=dp9x6j/n0vUDV4CDHp0e+YC6FsRGW3iOTZD5m52m4rs5Hlx3wowvR19Fa3G0hv6p9l
         wpybwLmOBAbmfoF8ytdHPveAb0kEOPnT+PpxEIGf22aQRsN9/eqvc+bLuH9PBEpTnEst
         NgKW7hOVUeXBJ1PHGcL2Kn3czg9EZPLBMPaip/Tc474ERAuZWJseTR/o4AvvW4g8IFzr
         yF9yCYYm9l7YvCMd6cqIsyzx+4Ue3nWEvf08B2/wr7MIe+eW6uPsLanv3RUBGTOG6noc
         7y5ffDZgsMPVzKMWDtKWzIkEsxbDnP8j/nKmUREX5b9BpHHnp2xqmpvScN3mWTvo6ktA
         eXaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C0lmF+FI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk18-20020a056214093200b00679cf417abdsi4034728qvb.560.2023.11.20.07.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 07:31:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C0lmF+FI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r56FD-0001iL-BI; Mon, 20 Nov 2023 10:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r56FA-0001dg-NL
 for qemu-devel@nongnu.org; Mon, 20 Nov 2023 10:31:24 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r56F9-000133-4y
 for qemu-devel@nongnu.org; Mon, 20 Nov 2023 10:31:24 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-548c548c40aso1721522a12.0
 for <qemu-devel@nongnu.org>; Mon, 20 Nov 2023 07:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700494282; x=1701099082; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oeywu8kSO5O0y2XZ/oyJH7tep+m6AGiuZIfGIyFBXBg=;
 b=C0lmF+FIPRm6znln/cqppEENTiu5sTET4RJh6iUCYHUa3QVVD5PEzReEsTqNPmpV0N
 brBU1SWIyUqlWYccO3de2V9S/UXT0TlFQZJDFMQY0dSIza3S567z4j6GDzLj0mA5Qzga
 w6FBmNKCAShZDgWB0wTM13MVjpSdMob92mmdNEcKHibPGlMGS1TE4jamEyR5hJlGq1Ox
 7h1vlJf04K3D+F2Ujid3/iwpTXIjFe1o+UuRJyrc1Nm4eKC4kLToKK3UjrmUx+rsLnNO
 HOOy0BZb64OA3CWyoi6CKB1khAk/LRaPeogsJUzzb1KyLCVUZibA0zyGKAMsN0tNBakf
 5ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700494282; x=1701099082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oeywu8kSO5O0y2XZ/oyJH7tep+m6AGiuZIfGIyFBXBg=;
 b=rxuKF3YnsUde9xXUXtIx3YRmDQgSjBPJr64pjg96QODwu9hNetek3eAU4Q5aQgGc8Y
 utIg8DJ9q5WrxPe6q6KdDRfcfSSrwTQ6yh3W3kKzjqlEszs/+VZdCtYKQeugzeK9ehI0
 IFoTDKETXEA3Oed8jsn06fPFeu9wNJaWh0iXiSoPsOf+pd8lzRH5Ob7NCsryp0dyXkoF
 NqMm5yMFMJpFOCcuqtIzPLr2ccDER86JIzTLTfRhMxpoP4Yt5RO+j2pVo42Ve1x996Sp
 s13Hz73/rMJOxna3FNtJfksl7G9xGWIHlALSio9ucQupClubCaQewd2WVf8UasjGUCkB
 hT8A==
X-Gm-Message-State: AOJu0YxUS7d7aem1ujSZZSiNF/yjbXK5UaRBzqSg1XpnlOpEymwWpGJ6
 jf2SNa7DFdrb6vfYmkD3I8A/d5UhIFTyuEUHn4QyXw==
X-Received: by 2002:a05:6402:1658:b0:548:ab1a:dc2c with SMTP id
 s24-20020a056402165800b00548ab1adc2cmr2124652edx.9.1700494281797; Mon, 20 Nov
 2023 07:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20231117071704.35040-1-philmd@linaro.org>
In-Reply-To: <20231117071704.35040-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2023 15:31:10 +0000
Message-ID: <CAFEAcA9-ECe5iFvru02z-3a=1ePCDCsFS-KYEpjx49m4gPrO5g@mail.gmail.com>
Subject: Re: [PATCH-for-8.2? v2 0/4] hw/arm/stm32xxx: Report error when
 incorrect CPU is used
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Igor Mammedov <imammedo@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Felipe Balbi <balbi@kernel.org>,
 qemu-arm@nongnu.org, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Alistair Francis <alistair@alistair23.me>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Helge Deller <deller@gmx.de>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ofToIzNhCnOK

On Fri, 17 Nov 2023 at 07:17, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Series fully reviewed.
>
> Hi,
>
> While reviewing this [*] series from Arnaud and In=C3=A8s,
> I realized STM32 based boards don't check the requested
> CPU type is correct, and ignore it. Possibly confusing
> users.
> Since these simple boards code is used as template,
> I took the opportunity to sanitize it a bit, using the
> MachineClass::valid_cpu_types which seems simpler (to me)
> for newcomers.
>
> Patches are candidate for 8.2 but this is a long
> standing issue, not a regression from 8.1.
>



Applied to target-arm.next, thanks.

-- PMM
