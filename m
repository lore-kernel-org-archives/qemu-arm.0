Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5829274ejb;
        Tue, 7 Feb 2023 14:11:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+VpvZxbIdJSSEwVaCSJOJUFOiGiMEm5FBxfliNbMPQZklCkwXpTDCDJxBSiVyvFYfinJvq
X-Received: by 2002:ac8:5e11:0:b0:3b4:79f8:26c3 with SMTP id h17-20020ac85e11000000b003b479f826c3mr8582198qtx.33.1675807886257;
        Tue, 07 Feb 2023 14:11:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675807886; cv=none;
        d=google.com; s=arc-20160816;
        b=0EnKgxPNWXr0Qzk5MZoOHtQiIxoDlB28kZc/mkAd3Hzk0rWfj8uwt60mntknZr3ibM
         ZimMP3Y2VIwm9P1pyegM7vSyxoB09ZDFi/MQlNK0fK61w5WbM+kTm6A9eRSXhAiAmjQO
         f7wg0qFU9efADRYODELKJKV81rZgrLJEQNpLTbvwjeHFo3L++IiPntwzOLKJ35v1pudf
         IsS5wlaeRBkZDPliWmqYmWf6ryiILy1lXoiKX7I8KtAo10zkkdZOgCi19phy5sIqN8Ev
         zSzMVwaFYG4wlaRdmoG0nrZy6MuyjOlEc2c5rAbNZTTLGfoQuz7qLGQ5/gAw10XS0x0D
         X5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gRKnaWz2seEzH+vZ1Vks165VGrnQpRizTdVClwYbdoQ=;
        b=uye/uXVQwGqfpirCXuOwSLgBtr6XuyWhUOTH6r3ZLTKtSlBWxogb0AsOpL/jqrA2+Y
         Ucfu6FNcyCz4DZe7sInAZ3bvPep+vVStt+CmR5yksT90up2u3RWzpTVXnAPb/QXLUch9
         NAVOmG3VXrGUt6QrF4VovfGH+4N3uaShn7RK5tzQwcZ1ZbQ1Rl0yQujzkyBZUW/J/NKI
         7wl6F4ETqowurwy7pcOM/sx0OVwBYOE9LQuJ3rT5wIxiMTYcm6Xo3vVgEm2lPxXE1RP/
         hYNGbmm+CLMV49RUbKnoPOwL4bjTDlTjnYgqRl0Uv6g5yLFkLLGZCqz1bOcEF6T+/sLb
         zo/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lKd+E6Zz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5-20020ac85a05000000b003b63b1ee8d1si11122524qta.179.2023.02.07.14.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 14:11:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lKd+E6Zz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPWAu-00071E-QT; Tue, 07 Feb 2023 17:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPWAq-000702-FO
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 17:10:48 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPWAm-0003ta-TB
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 17:10:47 -0500
Received: by mail-pg1-x52f.google.com with SMTP id s8so9321574pgg.11
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 14:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRKnaWz2seEzH+vZ1Vks165VGrnQpRizTdVClwYbdoQ=;
 b=lKd+E6ZzjmhNb8xROguQwe9m3nM0ck3pHRMaQQ87fzZVES+UXwVO2E8YxAuRP2RHkY
 ilcucr/NDLs58aVRfksruYoLWKEP+sDcBip3LhZJv+jgUXg+UczAhXvgVFtAGk1f7FV9
 WoVpokork2XJPZ2ABT6B1JUlNE4Lp1hGgrCYUWAcMMwLkgtOLDRD1fd5YRVe6iIQZU+f
 fUHMVzqpAArBXgVGdHENJvzl96KqFDox4ruRBQDP+HpI7FL+IKEQbxFgXDbGrlVsV24J
 gibA9Hty7ak92l4+nkr+D+u0eKnThQdyyM6ecNexNv30LRv0SlhWDVNe6KqtdfSoGFko
 gMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gRKnaWz2seEzH+vZ1Vks165VGrnQpRizTdVClwYbdoQ=;
 b=4835dLNP7BZNU3CP5zujL3Kmi+TOAe0783sY4X+xND0U9pxL8MAvGxYEo6NYEn53gv
 Uy2pemlSHBjXTReK+YptWXybeCKWJr7dgPjRrACw75+Kip94jMvBdZ2yE4iqalptn218
 cEb3DVmc1tXOh6gwhGWCAHvkZPSZSNulUE4E+JqvCMu/BnT4r9WaO6+SS/MqNOS0wAbr
 GQd+93dmPMXu1KBBKeCnctqjOFjFEEdVLexizeVPnG3+k8RC8UXZO5XjziLqFvWekIdD
 cx9SKqlqC+bIuoinEM/d75g91LrmHdQzQgLJe1504hJw4pl8ldlfdhQX2fS4tTUm4CXf
 aPuA==
X-Gm-Message-State: AO0yUKW0LttiZOhTOGBJOU/T9NaK94tf6L0RglYW1x3CyjU5u6jXHtZE
 lYY3RdhzIH013d9NnakaFaFxGvJ1Y8Zm61eOAsxtzg==
X-Received: by 2002:a63:7207:0:b0:4fa:b562:f29a with SMTP id
 n7-20020a637207000000b004fab562f29amr906238pgc.120.1675807840185; Tue, 07 Feb
 2023 14:10:40 -0800 (PST)
MIME-Version: 1.0
References: <20230207100744.698694-1-clg@kaod.org>
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 22:10:28 +0000
Message-ID: <CAFEAcA8rejLeXarhqgpymV82-1GwKhy72cPERQTvi6PQKbOHSA@mail.gmail.com>
Subject: Re: [PULL 00/25] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zmCC7Jqb5Y2f

On Tue, 7 Feb 2023 at 10:07, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e=
8b:
>
>   Merge tag 'pull-ppc-20230205' of https://gitlab.com/danielhb/qemu into =
staging (2023-02-05 16:49:09 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20230207
>
> for you to fetch changes up to bf81b8f8acda4f1f774adc5f8e76225d472c6ae5:
>
>   aspeed/sdmc: Drop unnecessary scu include (2023-02-07 09:02:05 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * various small cleanups and fixes
> * new variant of the supermicrox11-bmc machine using an ast2500-a1 SoC
> * at24c_eeprom extension to define eeprom contents with static arrays
> * ast10x0 model and test improvements
> * avocado update of images to use the latest


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM
