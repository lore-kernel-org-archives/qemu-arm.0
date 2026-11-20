Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E9606A325
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Nov 2026 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qWHkHAY7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUNf7-000555-Mz; Fri, 20 Nov 2026 07:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xUNf6-00054R-LQ
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 07:24:16 -0500
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1xUNf1-00045N-UX
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 07:24:16 -0500
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-380b40319bdso1041191eec.1
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2026 04:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795177450; cv=none;
 d=google.com; s=arc-20260327;
 b=cHOmFTnD0dVPqbh3RN1S7KjuC1S/6t1y/u30kXjVejHAmY04gIwUcPqa4+PyclI44F
 0HyfJP51N9pRfbZsT0dEPafRcCdHJh119ddcE6rh9xku+XXA+yW8M9x577iwNqAyE3zO
 pqjMcZY6dTsNSxgNP5jzF1dsceFCf4MygUH1Xy64egC6bQ2HmUSBet5oaQEB013zr1hq
 UdRN9O+C/YYfOCQZqc678FCez6w2tCs6/gEfLJTPxoMQpSByANIX7tO6hdzKa9ax2zv2
 byjcnTTYjLpEo9Aw3Laztgpng2AI8e2DW8xAryiVXJ/onoBXPZu8uN8jz1vtP508qz91
 aNtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=XwgY4GGOqwuqzYcj2+EsO1wo0sF82aLszvYxn922DdI=;
 fh=0k1E+vRpDuaRFsHP7K54a+mz5QrECsE1sUrTdKVXqZ0=;
 b=k0kDnx0wUR2wWkqd88ahQIMJCvQJonUxmicDfTWOT0Jn0nzYxSBBNM/5C4Tqofb+PX
 2QGdy7yHTfeBJDnrCaieC/4fED2yeH6Z8if1+NXttz/Eo1tHFIfGe4wfAFsj0p8b9IHc
 tP42tvFzysart9qvIP92NWyIlqw5a0Kx7HKJ2b6Mtd61rO+LO/QcBeDiJGtbrboYoZ6m
 fN7Pp5bFhvy7HAEi71q8lH4tvL9zX4hJl0h9tayxiSKjcLmqyy9/EyXcDFOrh2BJfbrt
 11nF692+v6FZOaKFQK3WrXaJUO8rIeVS8mziQnjaTzLnODqDkRuU9fn4a3agZvUUD3vM
 unTA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795177450; x=1795782250; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XwgY4GGOqwuqzYcj2+EsO1wo0sF82aLszvYxn922DdI=;
 b=qWHkHAY7WCJp2KbWvGnor64HIuR+oyLZccbH4023zTow07f88qnrTdlp8TNnLyWTXj
 5geDs12hzxrKQwUMJnZZQykjPpvN/2RDylnFLGdocTAUks+XOIdndsncHRGFF9YpZdmw
 BFV+YjWbvO+8AtQmfAtQmxgR8nGQGnXienYT/8AfHC+hXtfG5xunUHW6LmSp1I7cKP/d
 HzFO6N2ElAcGTbOsoMkgg7/34RbAHB8k2HsRXHwOnl/X0Ar1a9eqLG+8YqWwjqV4XeiV
 rWBJuuYPPS6mNudsuzgvcrmvplsq/sjMhJKAQdv7+TUk0mRjI8cww6loC2/LlpcGjQCu
 vSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795177450; x=1795782250;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XwgY4GGOqwuqzYcj2+EsO1wo0sF82aLszvYxn922DdI=;
 b=S4Fp5CkOTe0J7op3ZPpM12Tv3GeFsnsmBGC4LdYw3dmX5AlnQLNuszWTGWJxKiJCs+
 vsBYG57n5GlaHdQ8LGLA7MzBG0tg+zSDL0vE3eU9GVTprYvcxv2e4LGVCrNr4HReGoyM
 JA33Nz+ojHr/awJY7XVMkkfBYDcp5LBkKbnASfhESCDILQIlav7W3RXzPKqER/r+m6it
 Lhxzp4w+fCLdCmBmaV7lsHvn+5rBqRMSJYn1zq7rU/H1SdMFdR6i6AAgXBv/cnvh+zuN
 gp+r5iJhJK9zmq0eCWqAxnPIPRuVKten6NsLbP9QOY/T6sKDCXC1uZTuFuv7CLG+e9bG
 1m0w==
X-Forwarded-Encrypted: i=1;
 AL+hErHLUvhTiOhyvhAEo8bL763g5LKSq7CjoK+nEQqKR39E+rFo4hAiBjGBGDAwDDpphMqkV72I+7pIAg==@nongnu.org
X-Gm-Message-State: APuU4Z+0rd7mVtwqo9talvsdzd2KiyvEAfSASkbCmnDWOf+C/S/mUav9
 9n0007+E+LECUY8BoXnrxKOWE/D6255ivVHSx8bVPdysQTVTGYSxaKf4OdZYkSY9whbWdUkxwaM
 jtG5HwO08/Ur5i3cd2hE/m1G5ULUEjqo=
X-Gm-Gg: AZFdTZekgM/xZaVh4vfgnnK+PV6SSBZElFlg1F6QI+5mgey0wKhejRH6trfamUQXk9H
 P5AKSIAprkyZjE2vZ5gdIa+mQREsUycJNVO7GMToRFPMUpwlVYEKprCVGpv3y6xD6fyxD0+FTmJ
 G6gJaqNGjkltUCT6WTwGApxmuuUaKg6pkYp2Ol5f5Di6Q5ccv0kUDsWr4htURU+m4fBs0xi5Vij
 hyy9mO6AeMrKr7T523iYKoUW1hYh2JeytAa/uREHITmX1R8n1TEnZPBeUjhjIs7EdnxQ1oPK8YQ
 lKdogt7JGT83smc3iI37oOYJHsgIvo7YEwyJMOlz7q8eUIJ6na+Np+LmGDaueiuD3AHpjrCSbFp
 QV8w4duJVpDjXRyfSFvESFIpsJMu2HDtyE4oyqWLPOv5HdN9esvRzW6bxwdYQCNg2Z+UOTuKcXb
 xi0N5ijJnCi9Q1VQ==
X-Received: by 2002:a05:7301:7e07:b0:36f:9d8:4a33 with SMTP id
 5a478bee46e88-38570e21c39mr2680973eec.31.1795177449609; Fri, 20 Nov 2026
 04:24:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120121458.3723625-1-berrange@redhat.com>
 <20261120121458.3723625-3-berrange@redhat.com>
In-Reply-To: <20261120121458.3723625-3-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 20 Nov 2026 16:23:57 +0400
X-Gm-Features: Aa3M54radXEOrKx4IuO7FdGMOphv7fl0y-3Td8-jQzdWKtoR_bh2xRzRTRNaE2c
Message-ID: <CAJ+F1C+eBx6qUmtLGw2vSgk+Pp=Zpt92_tokyyGsrCREaE45gQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] tests/functional: update sha digests for tuxrun
 kernels
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org, 
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Eric Farman <farman@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::132f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-dy1-x132f.google.com
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
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 4:16=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> The images appear to have been regenerated since the recorded
> digests no longer match
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

See also
https://patchew.org/QEMU/20261112133320.418012-2-marcandre.lureau@redhat.co=
m/

> ---
>  tests/functional/aarch64/test_tuxrun.py | 4 ++--
>  tests/functional/s390x/test_tuxrun.py   | 4 ++--
>  tests/functional/x86_64/test_tuxrun.py  | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/functional/aarch64/test_tuxrun.py b/tests/functional/a=
arch64/test_tuxrun.py
> index 2ff321582d3..6c4367c8a20 100755
> --- a/tests/functional/aarch64/test_tuxrun.py
> +++ b/tests/functional/aarch64/test_tuxrun.py
> @@ -18,10 +18,10 @@ class TuxRunAarch64Test(TuxRunBaselineTest):
>
>      ASSET_ARM64_KERNEL =3D Asset(
>          'https://storage.tuxboot.com/kernels/6.18.54/arm64/Image.gz',
> -        '39f4633bbcb444267d4d829bd28d8868a287c4c160cda64b0fd23fb090571c4=
e')
> +        'e297f12682af7e88735a0aae38e6fbd137192b516ab5f0fc1a81c4bcc3992e8=
0')
>      ASSET_ARM64_VMLINUX =3D Asset(
>          'https://storage.tuxboot.com/kernels/6.18.54/arm64/vmlinux.xz',
> -        '6487eb113ef6e841aedab6cb6fa704006377d68f64dd544570aa42f462a52b8=
5')
> +        'aa9b984337e975528162ed873cf18a072b27be8e4f48e6cf0723e9b490c6317=
1')
>      ASSET_ARM64_ROOTFS =3D Asset(
>          'https://storage.tuxboot.com/buildroot/20260924/arm64/rootfs.ext=
4.zst',
>          '4ab8cec9d1e17dbb1abdf2ae1939ad4f9d0dc2466230f6a119a7c1845cdef0b=
1')
> diff --git a/tests/functional/s390x/test_tuxrun.py b/tests/functional/s39=
0x/test_tuxrun.py
> index 1dd662aaaf0..be38fcded2e 100755
> --- a/tests/functional/s390x/test_tuxrun.py
> +++ b/tests/functional/s390x/test_tuxrun.py
> @@ -18,10 +18,10 @@ class TuxRunS390xTest(TuxRunBaselineTest):
>
>      ASSET_S390X_KERNEL =3D Asset(
>          'https://storage.tuxboot.com/kernels/6.18.54/s390/bzImage',
> -        '5efeb31754b211440e1595ab11355bb006fe78a2c0604ed0a8c55c4598b71ae=
c')
> +        'b5022f97e243b8ecd51fc7ce4290a15806ecc51a41edbe777fc0fcdda567269=
e')
>      ASSET_S390X_VMLINUX =3D Asset(
>          'https://storage.tuxboot.com/kernels/6.18.54/s390/vmlinux.xz',
> -        '5bbd4d34e0950f88053a9bfd16078896df4b1ee1696fc2ad62488e681a6bdd8=
e')
> +        'cd70050ddb638e81c2f1b96a4629c224aedd36bf8ae3b56b264b070e94642e2=
5')
>      ASSET_S390X_ROOTFS =3D Asset(
>          'https://storage.tuxboot.com/buildroot/20260924/s390/rootfs.ext4=
.zst',
>          '5ba18c4d18831c50a0c743990f7bdee1d3b520629d423c55b668d8fbbac9c6f=
5')
> diff --git a/tests/functional/x86_64/test_tuxrun.py b/tests/functional/x8=
6_64/test_tuxrun.py
> index 1a1138d16ae..efe907bed82 100755
> --- a/tests/functional/x86_64/test_tuxrun.py
> +++ b/tests/functional/x86_64/test_tuxrun.py
> @@ -18,10 +18,10 @@ class TuxRunX86Test(TuxRunBaselineTest):
>
>      ASSET_X86_64_KERNEL =3D Asset(
>          'https://storage.tuxboot.com/kernels/6.18.54/x86_64/bzImage',
> -        '24a3ade610c2cc426ff821050de8a35930b0371357d94cc2c334abac6658552=
b')
> +        'ba98a8a07d5f3f3e20119341059c0f0096fda499d30e30049c1ea64553b7e7c=
2')
>      ASSET_X86_64_VMLINUX =3D Asset(
>          'https://storage.tuxboot.com/kernels/6.18.54/x86_64/vmlinux.xz',
> -        '77bf44cca48c9c1b9c142e16a2311d58b8ae3462b61bce44bcaf9243b5f2662=
8')
> +        'bc8af37608753c6ba47c6fe85f4034188b5f15bb757a0cbd79672c65122278a=
b')
>      ASSET_X86_64_ROOTFS =3D Asset(
>          'https://storage.tuxboot.com/buildroot/20260924/x86_64/rootfs.ex=
t4.zst',
>          '8e310455b0244414ccff29c507f7ccfd4032e3587cc405e49ab0322738e3e27=
c')
> --
> 2.56.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

