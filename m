Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2333397lfg;
        Mon, 2 Mar 2020 03:34:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqzhFJoQzzVJCFi+U4ugHIhOa3nfYiiM2+ydi5VpC/hON/gt7G2QrBn1pY+Ew1ZFZyCT7GGM
X-Received: by 2002:a05:6214:1907:: with SMTP id er7mr14558567qvb.199.1583148892291;
        Mon, 02 Mar 2020 03:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583148892; cv=none;
        d=google.com; s=arc-20160816;
        b=a4N5tPADQS7h+C1cPDX6Px4XK+xWyDwzmvv1l8v6oiUAtcBwXSEcsKCHvw5gdyyWRc
         FnM6j4bAorMsr5TVT17ruzSS9TQ3ebkjQfgNAp7JFHzhfd9N3Tvnqz0k7AtUrhQL44F6
         RepiprUdR75G/SPB6Fsnl614fAfZFQ9LsjuPrK4AL6lxM8jeUECJ6MFO5Zeewy6pMMeo
         ArWv8XC56o1EIB/c+7Fyvg/OBFzjcFWgzKkHur3cw+kZt/H9QawG6U2rpj3tk4Ega4YH
         MwY/gjrk0fgU59787sspO7SXMOrsreLDGdTMWx4sRVPM2zbEg/t+L61yydbyF11P2KRP
         f93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTrWWnG4/ici2ugq8yxmlcpAWcIBvmRozTKVrbvCX98=;
        b=P/6i5iLtyrHXPVVID7mwXImjFXQiejT1kTsbUOXVcY4C01kIRGrFYS1IyXucdNLI57
         AjLBWfA/6jYnoRlHVMdw21bYVq5c2HxfEqKdv5+EUKwrXHYYSQ98bXJSSy+jiFrp4X9I
         4LvXNLBnqLXzX9PUsn6wPhC3QERwdRF1P0Mb/BWZDxcglDoaJFMNXx+EsDCXLZUi/U5p
         qJ3TRZuFe48QNSWd9VvbAZi1bQtsLejXfWeQXr9/ZUJ0pf+p7Bsv6jQamA1xKy7mkvAF
         18jAYQPHz4IW4LhD4X3hm3Evg5chDIAbJtzR6zTWezOBl1FlLlrykIPoc1IpHQTkQOyW
         tZ2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JJDbO88W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e40si5857426qtk.337.2020.03.02.03.34.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 03:34:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JJDbO88W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8jLX-0006AK-O1
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 06:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jLH-00065V-ML
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:34:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8jLG-0000mN-H9
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:34:35 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42708)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8jLG-0000m4-Bq
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 06:34:34 -0500
Received: by mail-ot1-x342.google.com with SMTP id 66so9314304otd.9
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 03:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KTrWWnG4/ici2ugq8yxmlcpAWcIBvmRozTKVrbvCX98=;
 b=JJDbO88W9uwjGBpJuFZBUrZfbLR6GaF25okiXT052Nrmf6tJmdeCxOqm0dUBno1Kxb
 6lln248FFT1FGCaI0Jik6SqSqUfbjpBy4A7cbPRlaYdf//hOCmdVefE47qj1cq5D3FTL
 YWHW9oortHhYeM40GecrKzDCwU581//G0bmhTl2HABbSVNYtjHbHWyXy8WXDhmSaqCBW
 o/Gm0yAGEpRZOTwqCTHLxO/YcxTfPyqjIrtDyPNlX/pg0Tdn4Aa47y8KOmGMWw9a6egH
 joQriVWjM0weJ+2S63LHaRoVYb9X0KeEydaxv7mgv+IYLe6VwrG1VblOX/uzpOJhc+op
 Oobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KTrWWnG4/ici2ugq8yxmlcpAWcIBvmRozTKVrbvCX98=;
 b=XubpYrh2aaGjalkl0Xj0iJ1zNI1pmNZOtkYoFkbAr51WVoBvm4I2jIkDxTgfOx/8mO
 3G25MLdEzosqeKlGNjpDYbcjBa1WGwt7rouk+fh3DkFErDdX+V7g5ljVdfZ1LxQWDLrC
 9r3eE5vbYKhlIOMuWrp4hyr0mx65Vjz1kn2wjOFR9B63RpAgNEf3/NWr/VU3AM2sXVdJ
 ADFb+NTJUklvQcx2HQ84OD1SS8jsrAm8r1Or4swEwOLuInE79XzdukwkoWaktRbOdST9
 5RHwreMDsFB7m/YxNzkIKL8JQ0WvQN4ZTtlxyMtmdqPWaxhi98kSPk8xHsirhk6aArBM
 ETBw==
X-Gm-Message-State: ANhLgQ14zcW2oONdFyCTHpBV1VCM9slk4EzLWRdKritbbZWxXGuqjoDN
 SKJgjqVU3+R2jGuXXji3eKkCDCfULBD+6PmUsexcYw==
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr4613650otq.91.1583148873478;
 Mon, 02 Mar 2020 03:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20200226172628.17449-1-eric.auger@redhat.com>
 <6f82ec7a-fb74-a47a-100b-325d5de36a7d@redhat.com>
 <CAFEAcA-2DJ_Bw2NhWtJdNugkHKwAHmxiFv+tGO_y9wRm8aCp4A@mail.gmail.com>
In-Reply-To: <CAFEAcA-2DJ_Bw2NhWtJdNugkHKwAHmxiFv+tGO_y9wRm8aCp4A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 11:34:22 +0000
Message-ID: <CAFEAcA_uU-sPT3Dw2fVb7AJvMvaaFJ13QKe+CQpQ_F1m13rk_A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmu-common: a fix to smmu_find_smmu_pcibus
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zjJglkoYSvoX

On Mon, 2 Mar 2020 at 11:02, Peter Maydell <peter.maydell@linaro.org> wrote:
> Would one of you like to submit a patch that does it that way
> round, please?

Aha, I see you already did:
https://patchew.org/QEMU/20200227164728.11635-1-philmd@redhat.com/
(I process my to-review queue mostly oldest-first).

thanks
-- PMM
