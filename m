Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857F606A324
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 03:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hpJLepmN
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNiP8-0003im-41; Sun, 01 Nov 2026 22:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNiO8-0003PV-4k
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 22:07:15 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xNiO6-0006XX-GU
 for qemu-arm@nongnu.org; Sun, 01 Nov 2026 22:07:11 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6b1ec41d8e9so2645847a12.0
 for <qemu-arm@nongnu.org>; Sun, 01 Nov 2026 19:07:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793588829; cv=none;
 d=google.com; s=arc-20260327;
 b=sAo/qc9CNM+R+kXWHChr+sUBT+BjKLSw3/Ra7d0KmZEHKpEaUrmRd5xXmbwgdqNmoF
 1OLjH1m8xiaAzOQAYw2L4ed7gLgeGGVT/oAAOEnSTx4aFfm9yoeOjnsNmpbVY/gJQ+hD
 759BarWs/MxHowwaFUBoFmslD0eNUfF55WnRrdk3aHq0Z5wXyaPd5RjcrrnPWnyjVv0P
 Va9GJKfMK8KjPKpUYccB8qcIFLEmnTVMtTYCRyPfP+eIMLPVI57Am4JF7oSWLLqkGMV7
 jzCx9nJk8qxLHrAzSw1peXxekusN/U+Ry5Bazbl3u08w5BdrY0bO0MatgZMW1Jpn/uUC
 LMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=Ysznio8LIhbrNhMwmFi6gLvF+hQtGM6cCyNInXytu+8=;
 fh=ro6Qs1M4UIxC4iB5h4o+eMoK05UtwnELann9vPKE3g4=;
 b=is7FJ51g/lbb4Npfft9Y7ggG3c18Crm0ZJJJf5IDtbF0sHEOVFcJZEGzRsVnDzps7o
 8kwUmDqvYF5XgrHRGnpcfX7XsAiQ2jVLFqS4C1tWhai5TUkPNy+kjxfmxU24fjXGOsnM
 cUIvvYAQngGH7bEbHs8dKI6sK0+/kL4EzyYJ9wKDV5XvYnOgUxJgwI9Zaui8ZYmUX9sp
 9+LuACXWUQXi088/fEaq2+rnFl5cGek/SFQvRAPiMw4TnWOYGgFE44890mb3smmtPYHp
 fNR5aE8vRTVevC6dF8CneNTqt7piCSQ8eIVNORVml5p5Vlh2YD46zy0T4h7fD7bqPX91
 1Ryg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793588829; x=1794193629; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Ysznio8LIhbrNhMwmFi6gLvF+hQtGM6cCyNInXytu+8=;
 b=hpJLepmNZ53OfnTaTdaqCJFdvjqxmMdPpXZ85NXafyHEQuGdxaLvWWX5e2L9lDucyU
 aO8qLQnHgVxNgleHLJextAo5xqdqXT8v0aTrovKU089OMiHzIeD1baO0R73QjNIE67gA
 nn8mk7aCSof0DQ8J83zhN9zLbD4UE1nZt4c/hKFGXpuvuo/kRZam27n2tsR35suL8HkZ
 PoM3bD3h1r8NRBctdXdQKyZlecilcbskeYRBa0NXR+agDjkrEg5slvXo4F0hKBbxDbOL
 +o/hyAx08c68aQ5copx/hdT5UbESdmIRm71l3dzEz6fGfriXy2/99V/OlSFXW/g6/H8K
 tdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793588829; x=1794193629;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ysznio8LIhbrNhMwmFi6gLvF+hQtGM6cCyNInXytu+8=;
 b=jqARw5UQJYp1uuM1dUtWeNCmzkkV7yxLzfYY8EQiNbumeKNbPNbiTq+Bg5N+1zMscZ
 qrhuVhLFvY/aAupACfdBpBdl2hh+fu9OMzbr32LEPTvRRBwaUcHs7t1WJanIItRm57xt
 GQSFFkQ23FCMqrtKG3akOHcn8RvY+f1I2pe1SC5dmoqFSDxBCn0ofvTNHDUhY8F1kBfl
 6X6D5m8aHy+QvLp+ogygN1JcqlwqHIGzDVOOHz7We6LZyOOuUdZKZaCEK2S/JKqMaLpI
 encmyKw06n+oXHNN43GXNHKJSB2Sbs5yYHZFVtdpk0bJ+jLjV2RDPotv7NKEKfksERrO
 7qZg==
X-Forwarded-Encrypted: i=1;
 AKwUvByf6jmjBvqSGtKFtmY9O51wT9jlvObFmSkAuBEF4IXXRTRD9WDBVbk7Vc2MXqOdNA0yBeLQIUA51A==@nongnu.org
X-Gm-Message-State: APuU4Z8BZASXxsPKK3nCrIWLlL4wGVa0Xbv+phrF0aCDfw8gtN8/aKL0
 o3n6rclgoz4zlth3XM0cZcwhC37DEo24v6H0zudH5+ci71hqbZotYzFfv+GSMJyXZZZ4I7vKxBy
 N9f7T5NIk+6OwN6MscVcgJ1EDOx4zOS8=
X-Gm-Gg: AYBFou1C+k02ViI+8XC+KRW/hQmP6On1ctXa1pJu+shbvEOFMME0kARtz5AnuH8fBa3
 tMHdsptCYCuOPBLdWGzQYGSHwcCC14XAGWiL3k8F2aXtkis9+S3kaShldFOEn+l1MEFbKAlvdcY
 dhY/z/1T1PJlVvpO+2KI7CS+kfcegUR6/qTVq2r43x4YoTmIsWZ2ZE0kI942qPuE7CerRF4CueN
 3EjHDLA/J7/alzFm1VOsq0Gko+7HPBQ5YP3pPo3uCdQPpmbZJ3lKYnWMJWuyx4PDvYmPgwfPG8m
 TdqtrEUB/pmzIDXvfQf4x1ciA818c+OBAkvimSmnwyR4TcNwQ+ab9AgQgyoZiYXsX2W+Otus4mx
 pMbrhpWheGmyYF1R87j9vRJmVOL3c/N6i95ry
X-Received: by 2002:a05:6402:1cc4:b0:6b1:c774:58c0 with SMTP id
 4fb4d7f45d1cf-6b4d4d812f1mr6163810a12.31.1793588828434; Sun, 01 Nov 2026
 19:07:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com>
 <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com>
 <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
 <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu>
 <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
 <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu>
 <CAE2XoE-2w3A4=BeskGgp7NYUtkRVNkNufu4SZjW_OQ-KAQZvhg@mail.gmail.com>
 <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu>
In-Reply-To: <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 2 Nov 2026 11:06:55 +0800
X-Gm-Features: AclHuK8P8SDKQOupp80GFDOIHp3NTFl6EuHgXjfpXxX0vFgO-CLq7hQlTWSRT8g
Message-ID: <CAE2XoE_Nf0bpoyYuW9G_OWAx1J83iANRf_=2vr4G_BqgRZThPw@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo
 registration
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org,
 Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, 
 Antony Pavlov <antonynpavlov@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
 Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: luoyonggang@gmail.com
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 4:57=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
>
> Is this conversion needed for all machines using all DEFINE_MACHINE
> variants or only some of them? If the latter why not convert those to

The is_avaiable add/remove no need all machines, only a small number of mac=
hines
need touch DEFINE_MACHINE, I'll do(expand) them when needed.

--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

