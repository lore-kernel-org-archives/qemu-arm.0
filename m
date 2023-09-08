Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp365012ejb;
        Fri, 8 Sep 2023 04:59:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdnGyZwXUzgqxbyhsX6KJYwLlt1b145pZc+gyqyNTxVDeeEy+vtUI3/JkvAR/QZkYeKR14
X-Received: by 2002:a05:620a:454a:b0:770:df33:58af with SMTP id u10-20020a05620a454a00b00770df3358afmr2569676qkp.62.1694174378724;
        Fri, 08 Sep 2023 04:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694174378; cv=none;
        d=google.com; s=arc-20160816;
        b=eRuHKmOf+Up9a22E/itiNb8Cy2IG6UwwkayBUuGlD/lu1bBAep130UJK5TkvG67rnd
         PCcnqUxplwM6GnPby2UxZEJhAu7Cd7NJNx3os4I+GwEP49bJyF5KWvdN+IAq/AGrJZ6e
         ruwYO/+DObFA/FueTdqszFQ2mPCkuwzreCryhQFB9sPh/LbT+lAn8HPlcq1JDWSBX8P/
         q62TPy20ymnNvxX/8jbDVH20dTvfEQ6MZyAPezzEQ5/u1MXWX9SLIrnVRBD/2HsHpJz/
         Z6ymfWOeoj3h0wRju2rh7hwZZtf4FVlzW7Q6ChakZpZFKzQ11blJaX1CKNizAAaDAGCM
         566w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=E+oss6jtXfXveXQVZVT2ztEHGZGYTmftkrj+eKblzuc=;
        fh=x+qoi+m999Ir1daE6uv/qTjFEisptL9TiYpAP4s0Sds=;
        b=pBG7xYc+zxpNFjSDgkzGOw26nfMKkYfUkXsrvucIrOka8O3qz+qHOOGy/mRN6BfPtP
         h+kwOuZzWRK33zr7k3tV4v2DepzgWm1LDJ7B+hWC9MFsw6GuNqKypJgZQPCK/mZK1ym0
         s4/O+D3VnqlPiOegzbtRpzlAQE0vI3VamyLpK+2W461ga5wl15tBNn4m6dGX3C1rCSx+
         5cfjJd62U65e1abHpO/PAmUN+gaKRyKCtmXsUc18S5J69E5qbQOjSF8BNNm2UDAQkitU
         qv1NzTNhWYRA8ZhKpOsMNVBHcubtiKQV9Q3q280t8j2qiXpH+MgIvsqhMwLOu9KwS2aG
         Esdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2TbJ5nr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17-20020a05620a0e9100b0076d9bf00a07si896380qkm.585.2023.09.08.04.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 04:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2TbJ5nr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qea8n-0001Rn-Au; Fri, 08 Sep 2023 07:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qea8k-0001Qe-D9
 for qemu-devel@nongnu.org; Fri, 08 Sep 2023 07:59:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qea8i-0006kd-6n
 for qemu-devel@nongnu.org; Fri, 08 Sep 2023 07:59:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31ad779e6b3so1877628f8f.2
 for <qemu-devel@nongnu.org>; Fri, 08 Sep 2023 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694174346; x=1694779146; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E+oss6jtXfXveXQVZVT2ztEHGZGYTmftkrj+eKblzuc=;
 b=Z2TbJ5nrm63HdsZ54clzfSOM2C0bWFmJa5z8w48n3lVOWbwzlLZiFtLz/Oi+NKaHwl
 s3Gx3stTntVMDuF6TJLFqtORxCDyP7AvYxmrDQ6FtnHhtPOCZVmWeZUcyu7Q2VgNjmVv
 Nt4l8oR/GUo6v4t2I5rjudu4iyna1SQRNhldqwCCAtKPknD1oANipou01EvOP/98BWrt
 HX5YJGvfz3AxggXRBAQsd31n7VrXB/akad5y1b0ALTZkj+j6dh3/xbw3V4HGicsFJmm/
 9qxmV0Wqm1hhPVyJhavmisER6YTZj3l+fN7y74X01DA5CHpHkfgiQx4glInY2lNpiCPc
 b8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694174346; x=1694779146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E+oss6jtXfXveXQVZVT2ztEHGZGYTmftkrj+eKblzuc=;
 b=LZfTvPnuvWt2zsyRW9cxWlXxhT+1vMn/qh8l59HUvojNietJsuEDngO/asUyvaBEWS
 ANFiVX1J3Bp/6HbNEKwihZd4McThlUqGR1WMbiA9zp4A1GN/IvuaG7//Y8TGfTaD6pBm
 QwzS0uoQbVPdeqGvabptQgwiuML0FWZks+uGXMFOJOnFUih32v/8pB5+/Umog7rc18t5
 gQUcNkxvo0DbHVZMoVrErcEY7wpovObNY6oeSgDm1QZoiq3Zr6MBbpURbmSsiqIjJfZH
 zJDobw2BfxphQEjoej6TvGXyX0yd1iMkxnvueX8S3o+4ledYnhojJNM7KedjVkbITDcq
 r7nA==
X-Gm-Message-State: AOJu0YzaJwaGWPJKcwLnMJqNf00aAOGZe0rBYmaJRjs0FL2q8THKvAWd
 wd2eM+qQomadb+IkmuD4Nt9ZRa3cvtp83amEa3SuhA==
X-Received: by 2002:a5d:6350:0:b0:317:6653:60b8 with SMTP id
 b16-20020a5d6350000000b00317665360b8mr2086955wrw.50.1694174345899; Fri, 08
 Sep 2023 04:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230831131348.69032-1-philmd@linaro.org>
In-Reply-To: <20230831131348.69032-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 12:58:55 +0100
Message-ID: <CAFEAcA9hqKkSRS+ChNk_zOn3gMUGJkd_+971npMKVzBPJ=nPxw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_its: Avoid maybe-uninitialized error in
 get_vte()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JeEp2A/1oR/O

On Thu, 31 Aug 2023 at 14:13, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix when using GCC v11.4 (Ubuntu 11.4.0-1ubuntu1~22.04) with CFLAGS=3D-Og=
:
>
>   [4/6] Compiling C object libcommon.fa.p/hw_intc_arm_gicv3_its.c.o
>   FAILED: libcommon.fa.p/hw_intc_arm_gicv3_its.c.o
>       inlined from =E2=80=98lookup_vte=E2=80=99 at hw/intc/arm_gicv3_its.=
c:453:9,
>       inlined from =E2=80=98vmovp_callback=E2=80=99 at hw/intc/arm_gicv3_=
its.c:1039:14:
>   hw/intc/arm_gicv3_its.c:347:9: error: =E2=80=98vte.rdbase=E2=80=99 may =
be used uninitialized [-Werror=3Dmaybe-uninitialized]
>     347 |         trace_gicv3_its_vte_read(vpeid, vte->valid, vte->vptsiz=
e,
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>     348 |                                  vte->vptaddr, vte->rdbase);
>         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
>   hw/intc/arm_gicv3_its.c: In function =E2=80=98vmovp_callback=E2=80=99:
>   hw/intc/arm_gicv3_its.c:1036:13: note: =E2=80=98vte=E2=80=99 declared h=
ere
>    1036 |     VTEntry vte;
>         |             ^~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
