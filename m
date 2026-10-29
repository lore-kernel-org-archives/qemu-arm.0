Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E65E606A31F
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LIh0sakT
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMT9W-0008Ai-0U; Thu, 29 Oct 2026 12:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMT9M-00088q-Hf
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:38:48 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMT9J-00034H-4N
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:38:47 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b0ca1ebc8bso20670577b3.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291923; cv=none;
 d=google.com; s=arc-20260327;
 b=eT7syomGQhadA/fr7P7IJTJQpxfhhdLQXIgq03EkrlleEvSLwS9Z49AQUjmj87TWF9
 FfnClxAiRbqWWsgSqM3T4/th0gdCMmIKbxxLC3aVFP+QMThUtQLGMzIrMFH1koAEsChB
 oZ5tLWn+0nF7ORTzeNToTOL7BvObqzcP+fKPZJXdDjkqny7K/iQACAVBw8N9C/48TmpO
 FuwrEIc3rxNney6yyaZdIfdIdiDpQoKW2P3KtKOGIPDJRLMHVUzlmWe172oiyskjQ/S8
 iwiXo4akrpOqZTrwEZIwfTB+igpAiBQcCGN6q18vRCMOgV4WOuuPRiOudZ/F/DMkxI9D
 DXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DWmAgdQQCO6JUskQB0rVpaMUkzSXFhe8eRhGQeydCEM=;
 fh=YFjwJr4yV2iqZvSAlTaxlR0vKPGtovUuxJ71sf803cY=;
 b=Y/t7V8K6Seb8oWiFVmchTvtlnDprG5FxartF9li0kOq2JNZdG5YASkVEuGnIapNepr
 Y99NEcxHoFNn3jnUBFWt+LwpdGviHmAeMe/eqR8ngwjOxmQHJyxIuDG+9U9Ek11Lytx5
 Uv+kiklkZBbskbGULFHHgBizOhY9CjyIMTW9KfQRA1/TYUOEuwA5w/RFjYpNC3Qo1Nt/
 5satnqyaIBwYdSAuoQcwlwQTKvoLrH7YFBk7NSZgPhtujq3bAX9V4oSYDsK5hzRDwejh
 pwoeMXiPP8bSRwY8zkmR3BJcgIK3HRes6AF2YVvNSzVq+zHe07XQYLN/oukDlH2Xbmpk
 NALA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793291923; x=1793896723; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=DWmAgdQQCO6JUskQB0rVpaMUkzSXFhe8eRhGQeydCEM=;
 b=LIh0sakTUgVqpPKlwUfPW1T1+SHulNDO4aaZjrozs+Cpe4aASEE+6VdJh06Yi9nk6x
 FJRZZ1pQ/X++aDw30GOCFajE4RuVLgcYD0GD91jdM0n9p6CSzXRp9OLRbt+bSlHyQhZ3
 ZKsIo8FeYhK+06DblqSZeoIPMfL8DZEBeBFI1bDrGU2Df188ONCpVHW2M3gKY7wjm0q8
 7Zqtj6YSc+4gMvf6oNFGxa38tEMkjvyudJh1nJ2bLuufLxzHU24qZCLn6P8I2Rg455Hp
 Dz5+V96Y8USKzcQOHyDjRV93Hc21jnmrHF3rzrnkwSdy0nhzTqRbj0/ulWnLZr9aStax
 vm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793291923; x=1793896723;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DWmAgdQQCO6JUskQB0rVpaMUkzSXFhe8eRhGQeydCEM=;
 b=jkoinkxS2xN6ynPw4sYj+928sipkcIsSCBTRLHPRatBe6v1TTlozuscKQo9P7a28ie
 YkDd/PAlhuw1FSL9hTekZlZCYGq8Hi8LYBKaCtcS5CPeHwE88DeHJdvzuTaP1/8dgs1K
 Cpg+7ib/uQSE8TOr8LnL800HveE+CGt6RtNSlXMLM741tFjS8tIbHUph2yJUS7SqltFg
 pgSLTQv+O6weAWIsJV/z/1qz5ujDyXGONp9Cbh2jTszsOe8PIPJhU/sncPfq4aCagc61
 Tjt3/6Pberyr1f8LJS1nAh7lMJg/cyqzO4jN7kVYoNfY2adHLJ8NhTx3JaM+ouOFb35w
 QEiQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByDWXRs5FoYLspQpQ/aHsRDTLvYYgSVJdxs9ajtldvWY8DcvnzvOq3QEaZtSLiq1uQU1zi+XKXwlQ==@nongnu.org
X-Gm-Message-State: AFq9FYKBs8VIaYslKAMEOrwT2of0oxeDVL21obDIYvjTdiyJPZ+2yrzr
 hrglDW/GGGnKz3XxvJ7u1gtLJgFuTtvXsKgUfZeyoV2ceR9gMLD7B4qhE1l1i9LoaoJYppRf949
 pvnXZNfQHrjXfBvq5/6FXZMyjjtLNPMBwptePwAKvvA==
X-Gm-Gg: AYBFou239dVeVEuenXAZfGgj+CcrhevC6xw8YdwzydbWvoRxGQYHqAzreH9nqkuxywK
 eDRXOBSXm9eqWB0dAjtZdlUrZ4sxdIGdgo1Nu4JZ+yu+qCYxks0p5r23nECw6+P8yz8Fet/HC5J
 9CcHkBC/1UYAABSjq237hRux/smuQ4nqZVy8V/hQmVlsVMBYvE1iNjHtWRgVbWj2hq749nwaouG
 KHVWoxF6fuh4DH4meuWt/G3Dk0gfBmI3e3ZJGCqhoWB5QKXcyfWcvyk/Af+0y9B43B5EmUIw6AU
 WpGv6P2eG2eFBrJdAK9LXISKPIqJ+UW6Lk/npEUeyzb0QUFp5YgEMxl+UW0qTnDLPz2xBHWzkvi
 LQT+PdfcZJA4kKUDxgQckcsU3KPy3oQIVf2FT81yx8ICA44mFu3HMthLN69MxyJdO7hPtMWRg2Y
 PUagjDqh7AKl/BfLI2zBWb
X-Received: by 2002:a05:690c:e28e:10b0:8b0:881d:aadb with SMTP id
 00721157ae682-8b1b5c8ca2emr32313807b3.32.1793291923506; Thu, 29 Oct 2026
 09:38:43 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-8-alex.bennee@linaro.org>
In-Reply-To: <20261029161310.2065290-8-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 16:38:32 +0000
X-Gm-Features: AclHuK9r1rmfsQCEHjBIglsJwxFhv-pQMBDG2HZbbOBVp73yJX7W9GtYTa6w9B8
Message-ID: <CAFEAcA_UJ=QMFwdGtWv_wWhRyzoig0_0VC+T21+kFvzv9qasoA@mail.gmail.com>
Subject: Re: [PATCH 7/8] tests/functional: remove @skipSlowTest from
 quanta_gsj test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Chao Liu <chao.liu@processmission.com>, Tyrone Ting <kfting@nuvoton.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 16:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The full quanta_gsj test would have caught the regression caused by
> the WFxT implementation and isn't that slow (<60s) it needs to be
> gated.
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/functional/arm/test_quanta_gsj.py | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/tests/functional/arm/test_quanta_gsj.py b/tests/functional/a=
rm/test_quanta_gsj.py
> index cb0545f7bfa..0c0f5d85874 100755
> --- a/tests/functional/arm/test_quanta_gsj.py
> +++ b/tests/functional/arm/test_quanta_gsj.py
> @@ -30,7 +30,6 @@ class EmcraftSf2Machine(LinuxKernelTest):
>           '20200711-gsj-qemu-0/nuvoton-npcm730-gsj.dtb'),
>          '3249b2da787d4b9ad4e61f315b160abfceb87b5e1895a7ce898ce7f40c8d404=
5')
>
> -    @skipSlowTest()
>      def test_arm_quanta_gsj(self):
>          self.set_machine('quanta-gsj')
>          image_path =3D self.uncompress(self.ASSET_IMAGE, format=3D'gz')
> --
> 2.47.3


It looks like this was originally marked skipSlowtest() as the
evolution of what was originally commit b6eea069ab marking
it as AVOCADO_TIMEOUT_EXPECTED because of observed timeouts.
I guess we'll see if we fixed whatever that flakiness was.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(We do want not only to avoid running tests that are slow in themselves
but also to avoid accumulating a large number of tests that are
individually only moderately slow but together add up to the complete
run being slow. But I think we can afford this one.)

The other argument against using quanta-gsj as our test here
is that as discussed as part of a recent docs update:
https://lore.kernel.org/qemu-devel/20260627063208.33642-1-bin.meng@processm=
ission.com/
it's no longer supported by OpenBMC.

I didn't get any response from the Nuvoton maintainers in
that thread, but I kind of favour deprecating the machine
type in QEMU.

thanks
-- PMM

