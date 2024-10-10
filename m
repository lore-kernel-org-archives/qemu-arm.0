Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1405301njl;
        Thu, 10 Oct 2024 03:22:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5vwzakdqJfbYgLMx1Z9X2xT9fYJZfavtDivH+KWWDRbyknxuKnC+KQYWuYEVgLAN3j3iJUiTmVXbeZA==@linaro.org
X-Google-Smtp-Source: AGHT+IEOhaZX8szC+KgZm35TpH7HODQzvgTNKqfXW2+j9rwImFF/5gnDoqTP+zuUfgvxvAe1/AaX
X-Received: by 2002:a05:620a:3183:b0:7a9:c2e6:5217 with SMTP id af79cd13be357-7b079527875mr810130585a.1.1728555731380;
        Thu, 10 Oct 2024 03:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728555731; cv=none;
        d=google.com; s=arc-20240605;
        b=d4fUBXI7Gu8IUpFgUZRGlo1jg8ZTz/omS4fdapKOnyuck9FeJVvTgFuVTmNAshdusa
         wDktaYStynnIldHlINGThE8TqUM1UzL4l0Lu16Wu5z0dWaMWfcLVtrfkwzLTbbuAXZE/
         IY9YlpNSnzEuYwglXerD2wgD6whjBUkmNKUVTW1P8PSrbFU7BAKSO6eaXF6LtFeHWLbz
         qrtGbKFSKyWKcba41S0I7Fn3n05FHYec5w2zP62WlEmHDrqM7v1u0LPQJc2g/Dje69KA
         0bN06BKzazcl2bD0XOmztK494E014vc0jFkTqZk9gInJeB6MAbc1VjPlBpwW6uJDwCZH
         RSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=CbtJNlh/4kU+uT8XlT+C+4NJ05bnQ2F+DNUZIKZyGBs=;
        fh=gc5KcyZvb5EukBWAcAqJYJFzy2j7OfIVnH14NzjLUiU=;
        b=h0EM6VfnFhccSWTSTi8Wj+MFm/sHy8iaNBh+DJMd1gckXpQovuEUP08EGxnCh9Elxh
         Ur2x7VZHMRjvmE/xKqKM6j6yQbG5XTU8ZOlNDNVqbylZAl6ah3MR8ivdjD00dAUmD+Bi
         kvasM+9k6dmL+CxCVHP2xTlN8C/Hb8BfyMDlKoXQSFWOZrGKmoCzMwktTdXPHt2e0oNF
         GujcglXRcP5yZCrIly4GQD7knHdBQGHXvqFfK9PsyoSfbALuenuy8WXUAn8k0mS6NBCM
         P0bg1AD6a50McJ67gL3tr5/98Kxix2kvAJXjz3vtSj0aRzQcWBPVjpN4ITCupR4e1Epi
         R2Zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HcuWs1h2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149c26dasi103282085a.555.2024.10.10.03.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 03:22:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HcuWs1h2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1syqHe-0006Rv-LB; Thu, 10 Oct 2024 06:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1syqHc-0006Qh-VK
 for qemu-arm@nongnu.org; Thu, 10 Oct 2024 06:20:36 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1syqHa-0003Xk-DW
 for qemu-arm@nongnu.org; Thu, 10 Oct 2024 06:20:36 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3e8a74so943572a12.0
 for <qemu-arm@nongnu.org>; Thu, 10 Oct 2024 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728555633; x=1729160433; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CbtJNlh/4kU+uT8XlT+C+4NJ05bnQ2F+DNUZIKZyGBs=;
 b=HcuWs1h2XG6rZRvuZuqLl0rp9PDJMFurROihz0xflWSstrMxNIMON7G+hzeeQ+FN7L
 sR7J+mM3suqajH1XsLx9ReT6Q+eqkmhG4kMHV8r3F3HjivOL/xQxch8ARG1Y6M9A8Drb
 xGUmXSL51zypEaydCZyLW7oNn7YcemAAh+grsSoXRSpPvakn6OEQ31G4e+H3Dzu/Nnob
 PapZ1PQ8nvw7HL0pgZbEGz0uswTHTlsduw0EAjylGvCeJF16FEZOH0YPb28OxBXE0uSt
 wvbQHsJs3zAe02t9D2yCZWvkUMPOY2VC73o+w0VxUvdYTWepsHSu3jk+dvj5I1PVroDl
 xPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728555633; x=1729160433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CbtJNlh/4kU+uT8XlT+C+4NJ05bnQ2F+DNUZIKZyGBs=;
 b=Vwfz7/lKzqacV9rx7cMVEex46DYzwLYeBBFjukEkzB+OVWW0HdOo3T4bL267gOGSfK
 Qtf36NSAxNj7QU41T6+D3OX+psK5eypeK6vIbxDJMZ5XbZv/d8gqIADBuNlq2e+N5lLb
 bdHO2fV1VyIgEi0MS2IBeivE4JyFxdcsMeTAzQa7KzuhVqN0IvYAEMAzngJq8fNOkkew
 tqj0CAzvrIA+RqqAqIucPD3AyqO5BJqruubOtlJ829hZSJQw3Az905k3BZ/PucglvM/Y
 E10GmW4Q1hfnuoSpsAiEwtxlg1EOZ9x+kqKp6/dYA+uYGn/jiCqXIXS0PLl3CGaj/0cK
 APXw==
X-Gm-Message-State: AOJu0YwHJUImQK/iWeATGX+CUmmuDhAjjNZn2fw6edOLlv39Jc12DhH7
 DIgr+SZtb7/yFeQkgp9Wb/K7TQR8N3verPl034cBMR3dQn1LSonODNFXNjvK11IGPWbpv+tKQtD
 IvyXOE+LTNsakC1AJvtHydGC9vSCSdoTmAnfzUTempEkbyp/Q
X-Received: by 2002:a05:6402:4411:b0:5c4:a6f:9be7 with SMTP id
 4fb4d7f45d1cf-5c91d57f4a4mr5480758a12.8.1728555632724; Thu, 10 Oct 2024
 03:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240927150738.57786-1-rcardenas.rod@gmail.com>
 <20240927150738.57786-3-rcardenas.rod@gmail.com>
 <CAFEAcA-QUAKPuzcjLafU8U_=wk2HWhHbxx76WgwN+Cgdec_kGQ@mail.gmail.com>
 <63F1DC02-ECC8-44C8-91BB-337DDC9420D8@gmail.com>
In-Reply-To: <63F1DC02-ECC8-44C8-91BB-337DDC9420D8@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Oct 2024 11:20:21 +0100
Message-ID: <CAFEAcA89FVucYjnJpMzUg4mewX4F8rhq-b9nnMzDcP5omzMU9w@mail.gmail.com>
Subject: Re: [PATCH 3/4] STM32: new GPIO device
To: =?UTF-8?B?Um9tw6FuIEPDoXJkZW5hcyBSb2Ryw61ndWV6?= <rcardenas.rod@gmail.com>
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wsnHE2dP/QOn

On Wed, 9 Oct 2024 at 15:32, Rom=C3=A1n C=C3=A1rdenas Rodr=C3=ADguez
<rcardenas.rod@gmail.com> wrote:
>
> Looks like the stm32l4x5 is quite similar to my implementation. It didn=
=E2=80=99t exist when I started with my implementation . I will take a clos=
er look and work on improving/extending the stm32l4x5 GPIO with my proposal=
. Is it OK if I rename it to stm32_gpio? so it is clearer that the implemen=
tation is generic and can fit almost any STM32 target.

Yes, renaming would be OK. (Do that in a patch of its own
that does the rename and nothing else.)

> Sorry about the issues with the patches, I am not familiar with this meth=
odology of working with git.
> Could you guide me on how to send with you a revised version of patches 3=
 and 4?

So I've taken your patches 1 and 2 into my git tree; they
will appear upstream probably either end of this week
or beginning of next week. If that happens before you're
ready to send out a version 2 of this series, you can
rebase your patches on head-of-git and then send
out a new series with patches 3 and 4 in it. If you're
ready to send v2 before the other patches land in upstream
git, just send out v2 with the whole 4-patch set in it.

thanks
-- PMM
