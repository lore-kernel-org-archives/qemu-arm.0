Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D507460A2616
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Nov 2026 18:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DHTXUK4I
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRwQs-0005i6-7G; Fri, 13 Nov 2026 13:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRwQk-0005eM-G9
 for qemu-arm@nongnu.org; Fri, 13 Nov 2026 13:55:23 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRwQi-0002iM-CW
 for qemu-arm@nongnu.org; Fri, 13 Nov 2026 13:55:21 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-67bee1f693bso1142381d50.1
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2026 10:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794596119; cv=none;
 d=google.com; s=arc-20260327;
 b=FPMWFS4Kjrxb+LeIhI4zR9UTAHxQb97aHt4VGdAu+QlbRXWqs70bY1jaKSBrgoWDXk
 6nfiJxWCOOeVjfxwVM82isYE7hKm4cZ5+YaHTndIoTm9p6MkrmKqTPWget5HKL0dcsBI
 lTKWWrZl93iDRTPgqJRg8dnPG7grwKCy3e/AK2dGjXOSbvoGo7i6lrGQtvBCdQP2wYxm
 s/89pBOtBtAufes0uGWkUL/1KHJ5fWpQXAqcJ09yFXaOwreBiLqrQnNUmvmOxotxXQzo
 uvm51/ceWgq+rljkAmXh+kua/kvGRfoQgwgdKjbvOk8iighmsrDJ/n+puPp85sh4bptA
 Db7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5yUQz0oRrhnwrN3KjE4ESfdFm0LqHS05K6oOdecwAAg=;
 fh=oRt6QELXsxvFR7GsicLaU0UBDzvTXyy3gtxg/EYMZqw=;
 b=niSIUj5266AzYqt9BVUU3PHkUhrJVd/qrBy0mAu/kkxk7RS/aynxTYoHIu7rcNHA01
 4LdojMyU4xvbX/zzNXeHu0H94DqUfr41JyaCcpffk9q+oIi1DNJfoa35wo9Yba33NpKu
 LQ/fE4dFfejxVkeqydFpuZJrTZBaF0tpFe0aux0PA8YhkiSNjcC5ULHk8NSU0jhsmPt/
 HN+9mRj4HyJfBAJ2dLvRl/a1g2UplAbpHhv8jeVGBQVcIbDMfTIDeOn5zZeNsvXslrLU
 U+pRdfRmQLKwLXU/4O3/WBM6XfeRlYWSNMdZoMhMrFPFPqHAnVhp0D0hxzn3FqNXY/6x
 xTrw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794596119; x=1795200919; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5yUQz0oRrhnwrN3KjE4ESfdFm0LqHS05K6oOdecwAAg=;
 b=DHTXUK4IlAzsVZgAFs00hRC+wM1f00vwwJ/snL8mHNVbDJUpVrpBPcLLzqITZpsCXn
 yBYT20dDNJmaQPh6i/XvBOoRxu+OrwvWSOktwxtrpKTA4YG7LViv3n2dnuAfZKhBBC0t
 tqjYOXxBFMvz5zQMuNkuMO65VTQKcC3VyHWf06l9XaW2iapQpmjUz5vtrvWNHKgfQ66C
 5lYTlyuPNBStH4zOu+DJ+0lYIAwFg2T0QAUKg4zThZHGj21ToNARvdsJK1k2K+PNMpUF
 20ccLSpJ4fYXkyEBifVGFHDAfZQt/jrSSGWWemv9mR6Ge9eZHW9pMCBLXYSqXarauYQ3
 ZqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794596119; x=1795200919;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5yUQz0oRrhnwrN3KjE4ESfdFm0LqHS05K6oOdecwAAg=;
 b=GcEDtViiKOm8b96oSTKIUvvLaj9qtt8umxV2Gg/quLx0RTPwREmbWZ25oMCCIySBP4
 O4UKtA+Y4uKBWKAmwPQpAINrazBzIEruNn67kzMrvf6GwMTGVEUbHAhVTHqMeSg+Y0GP
 qMgiD0HjpcNBLXLb0w1wKps2zeN66cwGySR4waxBY4zaj8ojy3sgAN0nU6v27stfRrQZ
 BdGrtXUrHdv55kAItNZ6MLzIDi98dnpN+2AgYZLI3kQ59y1rDxDAqTRgga1LeX5JCSrE
 dEdR72p2zJt7g0Lsnr6LknMdRAeUUbdz43HSJl15xK9P1g7JeWC8XT7wHCsVJjsL9ygQ
 9HJA==
X-Forwarded-Encrypted: i=1;
 AL+hErG9+egr0XMRTn2qUK2gfXmlDw3WsX4ddZ29Ak6Njc9KZUTUIS5H9miJXjG4cmHkUv1pl2lC5kOqDQ==@nongnu.org
X-Gm-Message-State: APuU4Z8hCw13GGaEZOzcHk3LO1CwQlQNDNAActZ7LUSyjL0v43QuPFWl
 lAovjv+H3bSSYl9Pyi6dQ/0G50Dlb7njBwiy8LgNC0sOcIAeyQsoG1WClV5NyctSXJvooX7rWmE
 hdECc9e+PQz/cQXzYNm6b7l0nMZlezx1lsG5oT7ShGw==
X-Gm-Gg: AYBFou3Kdg4I+k5BxzRE1inEbFdpaUuHhaMWnaw4nKqk6c+6aPOG8V5UQ/8EdlAMn+m
 abOKUi4Kp8uZmr/UHQialk59KB9Vt/lDYWuvNTb7VKixFscGlsdAxyoxXXX52yfWnOUPI2hDbSa
 ULenN/zrBfpzkTJ9Yi63MznynCbyT776u/sa+uK+u1EzBLHBDbf5wh/u22b/SVXIRGD1w1u5N5B
 zpR+gCZ8d4IyGrkUbEBwJqIk1xIxTG5zDbfDZlYo6peNoZ99ambB3NHNK0x7GXo49iBaO/9Prdb
 VMTkkCNFtzXtVcxT/OTIDSEaYbmbNHT2tEfVAipFp3U6gTAiscy6ZfaIWPWSzlD66J3HcCfgx2V
 Igzs5ysEi/IK3aNU1kqMoa5DoIqv/ZZMGk9gDdtN+ZEkHCVjX8kiUu3JO+wxmKAf353IwkPv2wT
 G8pFe6LwtVpNLX5rGZh7+nMiEoQzzdGsdRru6ULxHxTw==
X-Received: by 2002:a05:690e:4811:b0:67c:6e85:56d6 with SMTP id
 956f58d0204a3-67d8971822fmr1642868d50.48.1794596118523; Fri, 13 Nov 2026
 10:55:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
 <9b64d3d9-736d-4878-80d7-4caa75eee778@linaro.org>
In-Reply-To: <9b64d3d9-736d-4878-80d7-4caa75eee778@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2026 18:55:06 +0000
X-Gm-Features: AclHuK_VVHo-e8YYO6oZ9bWUpkAFBAvn1WX8kWyMt4kCMftTN7Tg82QS4Y9Goc8
Message-ID: <CAFEAcA8La+8TqFY0yCxRsXY2Ad9MA5Uu-sVEbysExZPkUXVawg@mail.gmail.com>
Subject: Re: [PATCH-for-12.0 v2 00/12] linux-user/aarch64: Support both
 endianness at runtime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 devel@lists.libvirt.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 at 18:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/12/26 11:08, Philippe Mathieu-Daud=C3=A9 wrote:
> > Since v1:
> > - add ./configure error msg
> > - cover ARM32
> >
> > This series lets qemu-aarch64 run both little- and big-endian
> > ELF binaries, retaining qemu-aarch64_be as a compatibility alias.
>
> Why would we want to do this?  qemu-aarch64_be exists, but is
> essentially unused.  It's certainly not supported by upstream Linux.

I know the kernel just dropped big-endian kernel support
recently, but did that also extend to userspace ?

(We should check with the kernel and gcc folks about
whether/when it makes sense to deprecate qemu-aarch64_be.)

> Having runtime selection of endianness seems silly within that context.

As a more general question, is this something we would want
for architectures where both endiannesses are relevant (e.g.
mips, ppc64)? At the moment we consistently for all targets
handle big vs little endian as "it's a separate target with
its own executable". That's convenient because you can at
compile time hardwire in things like variations in struct
layout between the two. We could switch to doing that kind
of thing at runtime, but what is the benefit we're aiming
for by doing that?

thanks
-- PMM

