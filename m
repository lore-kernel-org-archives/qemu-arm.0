Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3AC606A327
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V85DtD2j
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRV0M-0004p8-Bp; Thu, 12 Nov 2026 08:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUzn-0003n2-UI
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 08:37:44 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRUzk-0001wq-86
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 08:37:42 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-67990a45e02so4424206d50.3
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 05:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490659; cv=none;
 d=google.com; s=arc-20260327;
 b=pROcQC7rDnLBS/lMzy0zFNz2LABH8Wxj/R0WEXSsTjZ2XJlv45HtV0C76Ep2ExaZIm
 LEM+FxnifQlfpbEE/KrYZ6AIz2JBf5BNWTZTIZNDEQWSZFQNNd0BaHy9i2+cc5fHSgrJ
 X7+oVGUH9bQcgtPOuXoWu1VLzoO1tpMFY+Yz4U97MmXuM9rwVlq3+QhP7Lo2tfC/Qhjn
 OgBDuMyrHC0OIV1mCkvZCYttR4glCBeKKlPkG+Ul9/wNbzREbvEl+ScCIPhqOYvXc7aR
 hto5ozxpPAGDRk2SQUWW4t5QU311TuRWpRjSClbWjXcammdhNSUTa20lXRTHuCbhFRnS
 GyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wQPUvIXNYS48s2Q4jDpTRSsnQIcmcLIDMkdERd2E5k0=;
 fh=ChVZQ/mDqZMiYXdFY1v6qFnKzuMxcwI2Lr9X+DpYByc=;
 b=a9C8O2ekHSloNEa+grctYt3rS5ZcJP2XK4i2xzAIdzp4SyIrKUcw77NacJ5HfPAS0o
 66wlbUZMDeRlRrT1TN0HgsV+DiCK67QBe+4a5+FJCJVIzXeCbsIRcAEVyRBOLYDufJsX
 cJDB4d6OjOb3fa9GFPgSH2iq/RFX4DNqoW3kFK4KgA4+xdUP5DqbbVH7L4VqygMpY4UR
 vL7JTQwjd9WqJkaF72Rou5LcauiYcoYMR5QIjbiygbpgDRYrbaMUQzLXRhOa9v/o5lFJ
 y/dPEQg/TFEQ6q76rsBG019QNz4ZuOmusxxJJ3xqS87di01U4ULFT2A1Z7UtS+K7DAtb
 cFpQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794490659; x=1795095459; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wQPUvIXNYS48s2Q4jDpTRSsnQIcmcLIDMkdERd2E5k0=;
 b=V85DtD2jffG4O0+/bWgnUFSXOwlyx/YZbEq8X0rtg6vbGE5AE5dezZ7tRmjdonQNm5
 0Q3HAfTXC7HJvF9NtDlFosIo8X2Rq+7eLEMD6pwRRjnKWI9fQa6ISPHlspcIf+qXRzF1
 NLhuucBqOMUgwxwIyoqkIyNYEZP//6QfTIq1K+6ilmjBiOIqVb7cXE/RUohNng6ZUeJp
 WuMjchKDCduwv41IOr8lMlNU+TpY1GONoPkGEgYDjnlE4be/hM1HX2WLudAwavaP7DWp
 RhhF3aTxUf3YKc2szu4LzYgLX0+f18vJCKmYbZoxeEDWIljaCWUzuQMuFKCNJwtklzsi
 649A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794490659; x=1795095459;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wQPUvIXNYS48s2Q4jDpTRSsnQIcmcLIDMkdERd2E5k0=;
 b=oV53aL3NKSl6RT+S9jiVOhRg1yUsxQBUzFhW4wvC1udjdzXbHE3UWZ626R8/tLqXpN
 6Zw13PDUh62M2yWiCyxrPdmKCSkBsrC0g7AA/QLK3QX3Ne5vY6D4Gso21IqRun1oZzhe
 cGhVwWT4Hi+5IsEexAOtz/iFVmu2F9b5ZEavMkh3XXo4FFR/B0N48lP0CCJe9lxhDsBo
 Zo+4DwSZKynuETd4TpFdLAcR7UooNfMzc6HM3EGPQU6X4zY3bRRJxqYVaz6bAgDIgnp6
 Sx+k7iR2Iufs3rjF7NXPiTh++D4x5s70OTpRCeXIeazITmyn+icw9AwNcyfycdmvlP8g
 FSKA==
X-Forwarded-Encrypted: i=1;
 AL+hErExAfdJIW3+5tKLcKHi3QHxUGTo3RTMLBXb4UfTeO3FFk8jrMzXq4cV7tOKpDnTUbdxLWV76xQkAw==@nongnu.org
X-Gm-Message-State: APuU4Z9otgOHzfrUqp9h0xl4/+nX+BT4H9O2IKt72H6+Scv3AhUh0E6u
 yGEjZ3BWNuBdUtpZJPkq0yq0amogVPwA/0OSRdQvK8/fkq1yy3sEYv0rzXKdaory0ShgCq7BrdL
 bVcGkn7SAdYKRfnFNZwpdgSJkLCXTjso3yL1tg4BbSA==
X-Gm-Gg: AYBFou3mMqvxZSvlYepIZO5HvCeL+nrn+9FX/Zh8SNUTT6dzyqWB7GQFUiCDvDfYL+Y
 j0i28KQT6QiVTU5PfAMLQHqmN6k9eKoZDtPKieRIWoFjCDwz2Yv61KFuO/gIX5+Y1O2Mu4NSysL
 H891YMFp1P67L7+GRU+UOAj84BBDKf+wTpjkzEylrWTQzP4KjGbEpvWwS3PDfNicUU9IVSeedqn
 mfpIPHJW9GYvKk+7pUo+uI5Ncr54CgtAvkA0XxANNjM8QvRHNu87L6qo881w1C13ym8tb8sqhZH
 vNsy4ECusoKF8yFvvppHUhAjSwl0eIR0KVo/9Fn3I5NzYebnHzXRHYT5AENzwUuVEa6ILI42t8X
 qZvzyQct4ZHpEdttpGnUjJviPRoJJyhXDfAGZFQshzGr2PPX/OWXIpC4JNn61vfmvbAGHwqRVKH
 uyWg/lMNCmY8N4wzBEO0NBqmUhmIBWJ9zAsDjhPV5hIw==
X-Received: by 2002:a05:690e:4891:10b0:67a:4c43:3bab with SMTP id
 956f58d0204a3-67c67f8e63dmr3044344d50.60.1794490658700; Thu, 12 Nov 2026
 05:37:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112133320.418012-2-marcandre.lureau@redhat.com>
In-Reply-To: <20261112133320.418012-2-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2026 13:37:27 +0000
X-Gm-Features: AclHuK-cqP2cgM_oSm9DSQRHE_AYyWmHEKxBSE_SSc8G4E633pLI4E1-fCSXekA
Message-ID: <CAFEAcA_qh9FuCtOeOob3GVYA14oXZAb4Pv6WDGq5pbp4k-cZyw@mail.gmail.com>
Subject: Re: [PATCH v2] tests/functional: use immutable tuxboot kernel URLs
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Joel Stanley <joel@jms.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 at 13:33, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> tuxboot rebuilds the 6.18.54 kernel images in place, so the URLs
> without a datestamp now serve content that does not match the recorded
> hashes and the tuxrun tests fail to fetch their assets. Point the
> x86_64, arm64 and s390 tests at the immutable 20260930 snapshots and
> keep the hashes that were recorded against them, instead of implicitly
> switching to the rebuilt images.
>
> Do the same for the riscv64 6.11.9 kernel assets, which still used
> non-datestamped URLs; their recorded hashes already match the 20241122
> snapshot.
>
> Fixes: 8ac1aab21fca ("tests/functional: update arm64 tuxrun images")
> Fixes: 09961fafc5a0 ("tests/functional: update s390x tuxrun images")
> Fixes: 467c9eb7dd31 ("tests/functional: update x86_64 tuxrun images")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

