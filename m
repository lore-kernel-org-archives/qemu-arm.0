Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp188008ejk;
        Thu, 30 May 2024 05:23:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNX82PWIGR7+OQgLAjlRXVY0xeEjvJ9WlWSpvuj6zNmqwLvCRUfoJai4zbLs+ZKjsuwJMsPt4LNmBEg4MeIZglXvaLND+B
X-Google-Smtp-Source: AGHT+IGX9NxXJsbsJpYNIjnUGDKRRnKT2QYrMZhkkTcNTAKuJLRB7dnOYIS0HHLleGzPU1s03LBl
X-Received: by 2002:a05:622a:19a7:b0:43a:daca:f300 with SMTP id d75a77b69052e-43fe92bc59emr19896551cf.24.1717071805471;
        Thu, 30 May 2024 05:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717071805; cv=none;
        d=google.com; s=arc-20160816;
        b=Li1bmPj4af2MLCzJneQUdmj7/h+L5j9MCzqUlZEKolDduk1a47vWN9fUVzyPMeoZci
         pA/59ZqclA7JqR1Fc7g2Y5Uh1gweJMH16ut+v+3A3HBrkS/5wMKscFwa7cgU2SDP89D6
         ap6DqP019aVKw8H5d1S4JA3f7Y7XihiUHWBGFIcvGxNdXuRcrv9oECDcLrCysvkGnr2p
         HU3CFF9sd2amaOj7Iv2jU8daCn+HW0+7J2rnA/bVPaS9c6K2szbP5vwXbPCtpIu7aOTX
         ZWdUIPZ7xAFKY4XCBi/avKVC9qAJyjcY5b6zFPaQdGE1zGEs10Jn9Yl4BLyX89vXkYYH
         4eGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VTLvvrgD8EGDGP5twaVu5ShhR8MXpAbjf/cKpiOrofk=;
        fh=6Fqp0YdqpusySTo+NOII2R9OUiDpIKDRvMyjka6jt+8=;
        b=bLSz1gT/PBoiTFrLIL7X9csvM3z8B7215D7ewkU9HevR+92wyqAwRxUBZf/xXNXRac
         s7K2CH9YYqdNqyaQmz7No8KrXXUII1VD7BqNWcl1tFTOc7QuEueeTrvzWxWs38GUVMQE
         2ZL8Ow1XGLxZ/depdM+FqsKNSvCTvJqgYtuireFrctqdpYOVNjg7Z+tRFBLcSD+n6mtg
         qhGwWN9UnQ0Rb8SRQmqyI9N9PIs7O/2dxgs52BTcwK5wEmPCuKF3cpBAKGhws3Ak3DYa
         2rB14MziAyAokazH9GwTyl9duUqlQkVaUo3FK4E6nHd1e6erHxZl87z1UEESfbHdQfIi
         Ks5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NLCstbJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fec92e973si11798131cf.742.2024.05.30.05.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 05:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NLCstbJl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCeoC-0003OI-2N; Thu, 30 May 2024 08:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCeoA-0003NV-DK
 for qemu-arm@nongnu.org; Thu, 30 May 2024 08:23:02 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCeo7-0005lB-1a
 for qemu-arm@nongnu.org; Thu, 30 May 2024 08:23:02 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5789733769dso1663538a12.1
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 05:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717071777; x=1717676577; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTLvvrgD8EGDGP5twaVu5ShhR8MXpAbjf/cKpiOrofk=;
 b=NLCstbJlsZtzXusevYWQOpYrmO9eZQWxKQdpxbb7H3A6FR6H7zcNMxb50+bIcq4MfX
 kAQ1C+fYsdGBi6sUGVHnG4a6JslFiTz/lAySw5UfkHVDKJvCwoDVuc/6z0NffQbxNqrQ
 Ul++vaIJXxt/gEaE5Dg95Ugn14NR8OKF/+k7OFNVApPxZ4qSCl23kmbsespTlcIdIEFg
 j1XPHbC2jQsW31DCpuoQP3/I8j8fjeurQMMcBWEV4UemTdA/Vlf8+kL7MrDtG8pqRQlh
 m31y4UJKyFqFut6pFXGbEOuaI5NPzJ8d5uh7d9prDC2P4NAFCE+VP361CL5SVvdQAuaF
 luMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717071777; x=1717676577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTLvvrgD8EGDGP5twaVu5ShhR8MXpAbjf/cKpiOrofk=;
 b=WjyXkENsGT7ekU3NHWxOQhW4dst4qZ2axWsU5ArLmwJW4ZxMN8z8p3EJjnk32F8TIw
 dHDXxoOqV4Y57QEmNjHee57EWT9GmZ8gQTE9SusOGtycyuqOjIbxH2Li1VKPAKj7CYX5
 W5L6kgV7a+qRa9Vp5rvIRyj37yM3RZ6ljsomonk2vCokS7z43XfYxEFhm9NIbwWJloYk
 /D1rmtTmrk1UvHO8JLntgeHvjWdah2xX1JHeOXCB+GZB9xgGPB4C5pCtakOmUstfflnl
 GZOTlrCK32JXg6zgrtOGjq8bpg7Mto3TKJGuUBBUvkrehg/5zk1iJNdKJjkPEGtsfhP+
 8jOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC4A57EN9DFk5hq72P3Dvh7P70/ZBrOUQ0j7VnCMUF8bStHL3Ip4RhMW2C4BDuwpyt8zUrzHX2ocD8XvuKEcdxC5AT
X-Gm-Message-State: AOJu0YzgKyp+VJxAVcsOmt5RsOJwlfHQBYFZiH1PuyUxi5JsJkHhOLaE
 Q23zz3WuF+R1S+xoNXJ/eu4AxbisxxPCGo5WzSoGjKxVAbToeaXQKN4hdMRpiSgW3OLIzH7uaA8
 6UqWBLyzqhr5EdGX/KtLu8wVSbsapmNzFMHel4Q==
X-Received: by 2002:a50:d659:0:b0:578:e204:bfb6 with SMTP id
 4fb4d7f45d1cf-57a19f66369mr1145363a12.9.1717071776796; Thu, 30 May 2024
 05:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240523183928.37809-1-marcin.juszkiewicz@linaro.org>
 <f2b32bb7-409b-484a-b4c3-71ca40d9bbe2@linaro.org>
In-Reply-To: <f2b32bb7-409b-484a-b4c3-71ca40d9bbe2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 13:22:45 +0100
Message-ID: <CAFEAcA9Xi8A4bpcMU5XXMQR0z7diBP4VnYTHe26prjAaoxuWew@mail.gmail.com>
Subject: Re: [PATCH 1/1] tests/avocado: sbsa-ref: switch from OpenBSD to
 FreeBSD
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GGbQadRhuNWl

On Mon, 27 May 2024 at 10:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 23/5/24 20:39, Marcin Juszkiewicz wrote:
> > FreeBSD has longer support cycle for stable release (14.x EoL in 2028)
> > than OpenBSD (7.3 we used is already EoL). Also bugfixes are backported
> > so we can stay on 14.x for longer.
> >
> > Planned to upgrade to newer OpenBSD but we would have to wait for 7.6
> > release to get Neoverse-V1/N2 support.
> >
> > Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

> > +    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might tim=
eout')
>
> Nitpicking, maybe 'Test might timeout due to PAuth'? (few occurrences).

Yes, can we have specific reasons for why we're skipping tests,
with also a comment giving a link to the relevant gitlab issue
about them, please?

PAuth shouldn't cause a test to time out -- it might be slower
than without-pauth and mean we need to give that test a longer
timeout value and not run it by default, but it shouldn't result
in the test hanging indefinitely.

thanks
-- PMM
