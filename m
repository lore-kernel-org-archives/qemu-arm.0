Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E93606A31E
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VfNHcQ+r
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLJMa-0005RX-51; Mon, 26 Oct 2026 07:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLJMZ-0005RI-M0
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 07:59:39 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLJMX-00044b-VM
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 07:59:39 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8b10d24345dso25473177b3.3
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 04:59:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793015976; cv=none;
 d=google.com; s=arc-20260327;
 b=CzxfhYXUfoQ5IIl7Z8g6BPLZEsE/AjrWoGmf3KPE7qOttuMCP2o4K816LL/SFamHUL
 Zi7c+kwjWQYdDmHi92GDcJ0Q+Kei3oezwbqQO+ifGM/hqhy6yeaN8/CxkQFzTPge5CtL
 qSHFAOtTXcALlYGMysXcN+C4w6RWPwjdZxhpKg8rdAuV9NivtTryjQxTZASjSeI7Ny9D
 O46yqorBWqVWwYeJ2jiHBAI+p44b8VioDDh+mILHTo/KDPkETbHMO5RPXUGaIZgUizIR
 IljXrMe/lRUg+pk2e59ypWGuEmZurlWfafijESOF+JA36ZU9+EM3fmKiC8HgqW2IviW2
 zCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=899Dii2gSLoNjy8fOpby8R6kcqlhk0ZLuIwDdFI4jD8=;
 fh=dEu0TpvuIfD6DS/fXnOHQ6lixCWl9QtFdvxGTFF7mZw=;
 b=LO/sCnkRbZ/0LxtcAw7iNGzTTUuOBRhyiTlvnTfWH/NgaOLIGqgZt8aK6Rp3OBxnJu
 dS+5SFl6MfX8l/pggHsJR5GZQPupTieDNDA6CFIKtLRBCZkT4ixQAQedw9u91JQ9cpbr
 1h7i4sAv+LborBYwtm4iSyI+5fctLzE4zmKCD1OIEvJ3mspztx7/KQ3u2DPSNotddFfK
 4A8J7S1RgB8pzXVsUuke0NQNMfEFrAsX2jTqVSwurZv66Dd3kVPtMeGHDX8yp1ubSLEY
 r4/p4PXIYjb52xebI4ZAoRwK9qJv1ZZDfKutDkmEYtMXVfMxf9R/KaNmMQamUs2NxZis
 uaFQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793015976; x=1793620776; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=899Dii2gSLoNjy8fOpby8R6kcqlhk0ZLuIwDdFI4jD8=;
 b=VfNHcQ+rZU6gwteBwPci0hux7T7ZA7Y72bfOmepDFPlsWz+j4c9H24ZT3SxplyelBV
 qXBBORvXznxNW24/zz1zGhqv8RgKssPnLk7kDzyo/G997WYz7YjWXwm8ImCdzeZOIVA5
 OFlqeh3Fj7XpOnRGyTL6o3Xufhc94t5tGyp+/ZidRAK5o+WFd1KeDwVm4G3EsKWSo5rd
 lhad5ESWgiBniIXlR9KDrx553/JSRA5TBZ+m9cU0gMECjkH9zMOJ/GRAvp3xuL9QYq8f
 uPfZqte5aNptwpIBG/D4cOxWTYDfFgeFW93wr72p5JdVBwl09G4Wylrq5ekABqWoYAxK
 HErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793015976; x=1793620776;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=899Dii2gSLoNjy8fOpby8R6kcqlhk0ZLuIwDdFI4jD8=;
 b=gzKGf27x3904riWasNnGe0ZiTWHzSnL9rJ410VhdIRVz4HUK6fIbAX8YXCRLqmYoBh
 37zU6qjH0204rzq5SjOCYiUk8J8fDfYrTfWeCsa9aQxZ2OFyZQJTZftnxfIPMfze0Wwa
 58kfotlrgHZnST4CJxnD2Y88cjse1mPA+RSDLpoEY34I+UtqeGYvYTTKVAte9uFeeV6v
 TNMqIZQkQvMfhTUDggjezxK91uxtezrd7R2NIVM5/W6VrNvZpsEm3oXLXmdyekZV5pJS
 9sgPYiqWk5KhhJNT0e/O4crG9Tju0lxxNGBAJGeueNPUPhCX7YySS3XaPoPgP5cN4myQ
 behg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzRdi4UEDDPYjM4+2zrs9x9rYUJj6GpDHqvNmvBZriW4HoYgOZdr11psKoUiPT3yX5K69nIwsaddQ==@nongnu.org
X-Gm-Message-State: AFq9FYLYtxGFeLFOlo9vX2Nrza5FBr18kPKpI87T0Oo2Bgz0cZy6+OTj
 HofQPvgk7gv/lefYee3+4gIfp2K8oZh+OOrascKL5mLhmCuvhkJPDjYR5zZZHCx1DiMpsOl0u7e
 Bqpqxg7vKcINZeAhTG5QycemhN+D6PRblGKM597rz/g==
X-Gm-Gg: AYBFou2y3biXcNGo/sHUJ+s4CzmN2XULAfRMzdBSHbBnfN6QC2bPYTKYjOrzV6Mk7uB
 g+VgirKBuqIzlrsfnFzBZNac11JT7HdE9XhasBfYcnZm5mZtPD+GT5eB9Q1Cerb8jggrCth42We
 RZiDGFPrPtNzmyH28MRoKMpzBe79hAwJaqnvX4Edw07gKhjuQ9IHldKQ4kJhQv60/hU7DgfYWcY
 vzyKmGy4JKRLORX4EQLXVm+V3uagwdtciWYQ9QCEiCrIeCKeOYHvjKw8Ql9+SBDI+jAavd+Kmdq
 lFLfc/OTyZuL0nKVzCj8yDxVsAbpyV0sOfUiMvPxd7Xl49hLOXLzUmwla53OyaJ6yqkv/dDzhVX
 0KKBKvvb8eVcMQYok+oeBxqsyqfKM14mvKja1ieCROQVBOU3t2L9YDH2ajpwrunbr8oA8oiGhqB
 QyNBFHyYazflmnM8pL7EOF
X-Received: by 2002:a05:690c:45c5:b0:8ab:4a67:71b9 with SMTP id
 00721157ae682-8b166c442femr54428217b3.29.1793015976296; Mon, 26 Oct 2026
 04:59:36 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <DB8PR04MB7177C8ED1A20409414A573EF87622@DB8PR04MB7177.eurprd04.prod.outlook.com>
 <CAFEAcA-dpfXTLk9KNJ0OsOEaCYppcZLLgcnOCqhUXmOVE2jfaw@mail.gmail.com>
 <DB8PR04MB7177409A95BDC85AC5446A6687612@DB8PR04MB7177.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB7177409A95BDC85AC5446A6687612@DB8PR04MB7177.eurprd04.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2026 11:59:23 +0000
X-Gm-Features: AclHuK96NYsbOwrJ_CwKJkxVnXzBkRPE56daCWYEA1F3VH1nRe1rxjVL4lJEKdQ
Message-ID: <CAFEAcA_BNjFC4vEJ2h62NytzYQXKE0o4MvB2jpN74S05kHRLMg@mail.gmail.com>
Subject: Re: [EXT] Re: [RFC] target/arm: Correct MPIDR.MT handling for i.MX95
 Cortex-A55 Aff1 topology
To: Gaurav Sharma <gaurav.sharma_7@nxp.com>
Cc: QEMU <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 at 11:26, Gaurav Sharma <gaurav.sharma_7@nxp.com> wrote=
:
> I investigated why the secondaries don't start with MPIDR_EL1.MT clear.
> The final DT passed to Linux has cpu@0 ... cpu@500 with reg =3D 0x000 ...=
 0x500, matching the mp-affinity values of the QEMU CPU objects. So, this i=
s not a DT-versus-QEMU affinity mismatch.
>
> The MT dependence is in OP-TEE. The i.MX95 build uses the generic get_cor=
e_pos_mpidr() in https://github.com/OP-TEE/optee_os/blob/master/core/arch/a=
rm/kernel/misc_a64.S-.  So,
>
> With MT set, OP-TEE reads Aff1 as the core and Aff2 as the cluster.
> With MT clear, it assumes the core is in Aff0 and shifts everything up on=
e level, so Aff1 is read as the cluster.
>
> With MT clear - OP-TEE gets the wrong core position for CPU2 (example - 8=
 instead of 2), loads an empty page table, and faults forever when it enabl=
es the MMU.
>
> This is OP-TEE's generic implementation rather than i.MX-specific code. T=
he implementation is appropriate for the conventional layouts it
> supports:
>
>   MT=3D0: Aff0=3Dcore, Aff1=3Dcluster
>   MT=3D1: Aff0=3Dthread, Aff1=3Dcore, Aff2=3Dcluster
>
> Therefore, I think the problem is not limited specifically to i.MX95. Ano=
ther platform could encounter the same issue if QEMU presents a core ID in =
Aff1 with Aff0 fixed at zero while leaving MT clear, and the guest uses the=
 generic OP-TEE core-position implementation.

But shouldn't QEMU's Aff0/Aff1 be the MT=3D0 arrangement? That's
how arm_build_mp_affinity() sets them up, for instance.

Is your SoC model specifically overriding the default values
to something else via the mp-affinity QOM property?

thanks
-- PMM

