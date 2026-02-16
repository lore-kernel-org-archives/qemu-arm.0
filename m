Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72841E7BD8A
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 11:13:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vrwXj-00046O-HT; Mon, 16 Feb 2026 06:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrwXg-000462-8e
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 06:13:30 -0500
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vrwXd-0006jN-Tm
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 06:13:28 -0500
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64ad79dfb6eso2674081d50.0
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 03:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771240405; cv=none;
 d=google.com; s=arc-20240605;
 b=HJog12OrmEn8l4zclKccjm3iYvXflCuQRMNRuz+IdSqZyCQ/oYQ8WVU1YOZYbchjr3
 krXSRXYbNCGx8vRGbY6z2RlV/EURj+Uo2c6gXlYHpZxLrb3JFC82k4myhdDcL8u8DkDr
 2gAC32gBMGLv0FRcgOoVLn/3iqYCFDTuzsXAl3RxIsy1lqVa0JuLz2b4NtGG7QXFasgV
 bWePa2+SFTrYAIl1kZGie3yrLQMY69wVPS7eHeHdIoxi27cb4dhNhHbvhI38G+MwhwOs
 IYbEJb62MXXd2eoiDwo7DAZlnwjtyMAYonPp6/mJYxJq4BK2h1P6N5rp2JYwoxwtl6s/
 AMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Bnj6PYX9XX64sJHAlUbiGDSZBG2TAqZE+5aCucDPgzg=;
 fh=p9Zvn8HxRR9qMYdkfS1Lgjmk+gnqtxDT7le7Kc7QnOI=;
 b=SUnKURIRulY72N8wbeTY+ut9a3KgV7vkhCjdymB7sRFFJkxTzNqAZYboYtPuezDji3
 FGcILKVoOSnbhQmelrvsiS0x+qmHjmjOqxLwS2txXRQdHojnWvM/dfVmYz6FLL/IbjPb
 HbZ98uZyL7r9sv1lBMg9bFTTkg6sZ4pLK2FLXp97k3v+PW1w2nAvEyP1992B3VEWovZH
 wjx9x5W+KdyAUH36b0bTKp0mOzszwSpWD90k0hk44SNm4Gc0R+irjEhYgh6ZpIMOOmzq
 NQdSoIEd7yesV2pJKuAyzcR6h2cEYP8LCd03ccVM5vDKfdb6BRdU6QM3IntFsZHTfJgb
 x05A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771240405; x=1771845205; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bnj6PYX9XX64sJHAlUbiGDSZBG2TAqZE+5aCucDPgzg=;
 b=dXiIZQLUoBVxbYAUkzuueHQbsn9hFtMCoM0pDjkjKXe4aC/1uHXngVIyOPlg2VlIz0
 Qhp2XnpzXxgU1S9SaQ4vnOrCeNsGTGGww3UH17i7AZowrLyZywP94h5cbhAQoKq/VTkY
 NRYfWdqPq+T0BKFMYt1FNmthB6o0TZb53ZQILFLAhOC0o4Apwi5Rdu7SoA+XelccNJE3
 9TjOfavxM6RwEA1JVMOmzH9HXZdsRSQmDJ+h6qzV3jCBcKit4POryvkyAGVUVjIIdPcB
 aW9qMLqq3P6yz3V+NMiTFGrekV4F797/PCPW4Dv7CuRhwP55LBwLgaRSZFiqnAWSMCao
 1pUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771240405; x=1771845205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bnj6PYX9XX64sJHAlUbiGDSZBG2TAqZE+5aCucDPgzg=;
 b=vAAJJ5FCQIdYCBY2CtEwxQ8zfIaCUw/toGFI2080goNvwccu1AJLxGnS6tCWxbfJjY
 zqTSZj8ai1I9WjgK6a7rsIvWbbBToEsk/CLlbq0/XFttoDt+X9sgi4HHCrZof+YY0pSd
 pnQP8KP6Dw5S1TliYBKkpA1/GfJGBKDVvej1uDEIYyUbMP86NjMCFFpsAFxvH0kiLnfC
 ZSTnawmPjQ7KhHOUx0Le+Vt84g2BGmrdG+psVKDt+b2G/wkSp3jKjUVaS/rpqNjKbvuT
 TO3Coeawc7g3OkLEhfWwdnwfbfmvBQGy8nZqfwTe1Nb0369LQLU5ly3/uHsOe4SmUVPs
 FNeQ==
X-Gm-Message-State: AOJu0YxxGdbTpSx9FQ1Q7otA6abApIIvRuAvK3AlKbhFYqQF+48YusUW
 D3ohrJ6bX+AXCd1n+0Xc5Uabd3ZzcyR+tOliN1YKE4WfNliT3PsvSWP2DVukffIQM/d6cA4RSw5
 BR+GNl26zEQuHaJGyvyuyihJY/5Tzply6DvJY1nCZhw==
X-Gm-Gg: AZuq6aLS0BNV/1sY8Td31ODHkx70UyH6cEBj4j/T8sBSiuPxcC8PH33DgqAqCZ4i5qU
 /6WIYTvW+PRFq09J8WziTuw30/2q/jpLMPg67euiVNiqFIzjMJxeq3U7HjgbYtY+yU5Ey5CqMx3
 yCo2X5qdovYe1d1Bez1qG9ZIWEQHUPAcpnr0WlzpaOddlvtnN0dTXMyiGabw0sUouagIaMhpLSD
 5EYz9l5ZYZFi9u/HMAlIDM531VhOOb7gq66f7plf1nv3NE8ebej/xHmLYy5mzzdX3SgxU+eHSFN
 iGe7p7jaq1Pv9YbgPntpozdzf33YDQ6qXpfEKPtrwQFU4y2UzFVmHju0THt6SS8ZuD8=
X-Received: by 2002:a05:690e:408e:b0:645:54a9:11b6 with SMTP id
 956f58d0204a3-64c19b196f1mr7675589d50.52.1771240404710; Mon, 16 Feb 2026
 03:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20260212213955.2225662-1-clg@redhat.com>
 <20260212213955.2225662-3-clg@redhat.com>
In-Reply-To: <20260212213955.2225662-3-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Feb 2026 11:13:12 +0000
X-Gm-Features: AZwV_Qi3cGskL0yyDjDTutpSoqbX2OXFxE3VeTo0RHl0QtnqdczfaLKUuGaj3u8
Message-ID: <CAFEAcA_oJgTc2SyRr11QTeTkmCPgvKiwngAaDiDNw5nUcTFA2w@mail.gmail.com>
Subject: Re: [PULL 02/16] tests/functional: Add SDK tests with Linux 5.15
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Kane Chen <kane_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 12 Feb 2026 at 21:42, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> Add functional tests for AST2500 and AST2600 machines using the
> OpenBMC SDK v11.00 with Linux kernel 5.15. These tests complement the
> existing SDK tests and verify that QEMU correctly boots older kernel
> versions on these platforms.


> +    ASSET_SDK_V1100_AST2600_515 =3D Asset(
> +        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v11=
.00/ast2600-default-515-obmc.tar.gz',
> +        'ece1a934095378929780f03e7d092e562f4b33b2841b80ad7c3d12a85744c0f=
6')

This asset file is over a gigabyte in size, it takes forever to
download, and our functional test asset download framework has
no mechanism for giving any kind of progress indication for
downloads (or even for telling you the URL it is downloading
until after the download is complete).

Can we have a size limit for test assets please, at least until
the framework can support large assets a bit better ?

thanks
-- PMm

