Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DFFE81A2F
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 15:07:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vs0C1-0004Xt-9B; Mon, 16 Feb 2026 10:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs0By-0004XH-Ne
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 10:07:19 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs0Bw-00013W-VJ
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 10:07:18 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-64aea64bf15so2857917d50.2
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 07:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771254436; cv=none;
 d=google.com; s=arc-20240605;
 b=g49RlgrgSQstCD45G1YlCo86Ia+TRup6c58J0AM2srSxN0AQSr6TqgpQLmzdpy7nOv
 bWX4DbUkRxjuW6qoee9L7ureTaC9njDYLXaIZo1wzqqDdHG3XCvbaNVOwzUSO5y/QjDI
 VX5hFJB48JgxZTrI26jFmRXczQnPk3qa2i11ZgxIRHMP95fMCbAM4jE+1r4209XbdUKA
 j6SyHQfexmcYKGPnvc7GSU92aB4wDx57beLlXexBmVsYVKb7rizrnyxDcpUX6P1eRzM0
 ldsH93aT2cu0vJ2kKYMV47v0OBMSV/jnq4p9LAXEe0xtRbJnKslRiYqHXZ47VS6xtYY9
 uluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cLj5mvxAEDc8A+D2g5Kp2Cw7/hFb6Z3ufCAWz8ObNVQ=;
 fh=qiAfE/6JZe0A0u6wZVF3sON1AVnnDMuSS0w9+ux8J4s=;
 b=Wja/tAIo9W9tAg3dMcKac+2iOq9tXCWfwQZdBiLuD4zOb68b8AQOaJqGf/HR4mfPuE
 yUI/PnDA6jvnUQy3bYnpjYfsyUp6wL69rhLipNAaRnqsZvNsbsM6euw2g6eJoTVO7K1w
 VqU2lN95uOCWUshoaZQr6gmgh13bzT6haJUm5n1588Ysl3gYxtHJ0hA6jEiefaP7/H9y
 xurvYWlNYCIpGJDbmgzg6UDO5oTIcYWkexMdNAKp8QSGW/lHSo9zLYQLHQydoN4iGyLP
 iZ70kjOERdvL/OaLb/noJFWOdtHCKbsXFjhIfHqHIrP/ZjTnHfYtNGeN+qXU0lwnhfje
 XqLA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771254436; x=1771859236; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cLj5mvxAEDc8A+D2g5Kp2Cw7/hFb6Z3ufCAWz8ObNVQ=;
 b=xZu8qKSy0d7+2WD8RT/otlAtsqp/no5aqEGAGypWKVnhYbkMGiIS+YY0Ohx9aT5Qi0
 kpIXl2CQ89Y/4kSZsWMjYto2eIrw5wUNfDOCd/of8APamB6HG/hl4F5tga6Zpmvjiie3
 4ysQUyR68PaGDWb3q2cPFROzkuhs1HqPtaIOBE2UwwOTZtB92NoW+6RaWpt0TuhjgZ/r
 EMCIy6qS1CJLcP4B+8dtYBY60TqXUNe4ONMgMmDIzRdPAyw6Avh8qwig7mRELxMGvpHT
 JIMYrLW/7ynKLljK0dTJ67pwAt/XQes+OaPT3+fexeJujq3sE1HZSZhuaGdGU5lynv3j
 soUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771254436; x=1771859236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cLj5mvxAEDc8A+D2g5Kp2Cw7/hFb6Z3ufCAWz8ObNVQ=;
 b=L2Bq7JrnGfX1PolbwOloEs5vE2Ks9E1Z3PoFlPj64Qp+PoVk4JRUAck2sDiWCCssm7
 TWTRkY2DrzyNZAaDuaz1ub1jeRGUeIPbiFP67k1UW0psxoDl01qprUA0VeBL1a/9beMo
 J5A/Y1NU3deskBkPYdPmSSWiq3nUx4GKuopE+AZiWF/taaMNq/+zNh8uAo44kz7eRdkE
 eSWOG0p+2P0sA2RpmxYXtlv8r81/QD/juNIN5q/dvtQOgEXE2qNfdi5Sjxyis46Hsp9d
 S231ugdrLcwg5Hyh48HBM9Kn9KqYhI248amGO21kRM8ULtdCgvqXrCAzkY/m9NXT/ALq
 O56A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkmhhf4N9dxh5cVK30a3l/5FS/uRpEjTGNAnr7dWbhPTlz2dZy6RpqWllmfFHLOgC8JtHuV0pKuQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy7wHXfbLaTPNWZMcaq1GDtd8xVR+IiM7dUp2p5m+pxTxNzCaRw
 P2qS6sM4WWEsiwtVKeyuc8ZTtDOKY5raASj0X1SWX6mfjTt1pZ6jfJtcfBAfgN+YIzCGs/+ppBj
 Wp3rNLJ3TQCdavDj9D3Y5xVI6T6qKZg5Fdpp4vlrd8w==
X-Gm-Gg: AZuq6aIXO0mSsAj4IozOsbOYmdB0yw2/EhzwQ9FtKCXiVGrsUnCostVK9GZH7PfSTmF
 RNft3j4zM+uczqPkwmPw8dqcb1keyGhGEBJo+gBfrHBJgcl6p3ysgASc6NrMfS8US20SKoqXIBE
 jkLeILudfQ56ghnZ20DklRAkbGx+N8Pi9TXpFaYeTfAX8SAbFZzFSe6Ik13awTwQDp2huLhAWAC
 zmWMwTwccru0mt2wd+VajX5HeyxHJiffbPespngIczdvmJ9N+T/36LwFqglofugwRFI+quVxGmq
 5bti2XpQbJhcwoq188bYhhRTRzBKkcMGvhj7HfguA6yfMM6O+WQ7wg4SgrO6Sif2NeFiifNjgzl
 6GA==
X-Received: by 2002:a05:690c:c50d:b0:796:3124:6544 with SMTP id
 00721157ae682-797a0bc23f2mr179995317b3.3.1771254435576; Mon, 16 Feb 2026
 07:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20260212213955.2225662-1-clg@redhat.com>
 <20260212213955.2225662-3-clg@redhat.com>
 <CAFEAcA_oJgTc2SyRr11QTeTkmCPgvKiwngAaDiDNw5nUcTFA2w@mail.gmail.com>
 <CAFEAcA_9Np04vouA-m99xB8yU-JhduwxxLj_dTG0QM=AnDbHoQ@mail.gmail.com>
 <aZMwvfw4O5xeH-Gm@redhat.com>
In-Reply-To: <aZMwvfw4O5xeH-Gm@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Feb 2026 15:07:02 +0000
X-Gm-Features: AZwV_QimQU6IJYBL87nhKVRWSpbXRnX9OY5bjBUgydP-l9OQCzkzBCRZ0st54-M
Message-ID: <CAFEAcA8y-UQC-zSqouFa16eEcJzksdyvpCvTGVNiE8aLp8DYNg@mail.gmail.com>
Subject: Re: [PULL 02/16] tests/functional: Add SDK tests with Linux 5.15
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Kane Chen <kane_chen@aspeedtech.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 16 Feb 2026 at 14:59, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Feb 16, 2026 at 11:17:38AM +0000, Peter Maydell wrote:
> > Followup: we have six test assets that are over 500MB in size,
> > and they are all aspeed tests. Please can you have a look at
> > slimming these down?
>
> I see 2 big assets from aspeed only
>
>   64d8926a7d01b649168be96c986603b5690f06391286c438a3a772c8c7039e93
>   ece1a934095378929780f03e7d092e562f4b33b2841b80ad7c3d12a85744c0f6
>
>
> what are the names of the other files in $HOME/.cache/qemu/download
> you have that are over 500 MB ?

-r--r----- 1 pm215 pm215 519M Feb 16 11:07
e2b8f043fe8063dd3b6ded93422e38bd41914dc9c3202199507652df024de4dc
-r--r----- 1 pm215 pm215 520M Feb  5 15:57
d5ceed511cd0dfefbb102fff2d731159e0472948a28066dc0d90bcd54be76525
-r--r----- 1 pm215 pm215 581M Feb 16 11:15
0e93f7976139da71fab9df7952a58bdd80650e23e7abf5853b0eb6695deb02d0
-r--r----- 1 pm215 pm215 582M Feb  5 15:59
4f8778be176ece1b57d33c4aee13bb989be114c3e4703150eaeb6f996bd5587f
-r--r----- 1 pm215 pm215 1.1G Feb 16 11:11
ece1a934095378929780f03e7d092e562f4b33b2841b80ad7c3d12a85744c0f6
-r--r----- 1 pm215 pm215 1.2G Feb  5 16:02
64d8926a7d01b649168be96c986603b5690f06391286c438a3a772c8c7039e93

All these hash values turn up in tests/functional/arm/test_aspeed_*
so they're not stale leftovers.

thanks
-- PMM

