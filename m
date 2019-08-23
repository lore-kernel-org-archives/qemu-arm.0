Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp502517wrs;
        Fri, 23 Aug 2019 05:22:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCLm7FWO9bBBOA5Q0N58OiLWfSS3hq5TrJKPs7e7Yc58jaXtDWtUf0ACOO0Yq7IqUYbPZH
X-Received: by 2002:aa7:c484:: with SMTP id m4mr4133344edq.174.1566562966206;
        Fri, 23 Aug 2019 05:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566562966; cv=none;
        d=google.com; s=arc-20160816;
        b=V+9Xlk6jekosLLaQ+cCIKGcCQgCVfsEGoa4Bo9vd9GAQw0vxNPxE++a8veil1r2AeQ
         +4stHZoTnX9w7rOr4P5QtZIGoRSJfDZHAmXtgIpv0e2FOP6aedNnoctolI/me0C9/Lbs
         iuOYx7DQcCK0zYfxxmRK8LBXPdFQcKatOos+rSw5NbOypmRRQoeS709VD6rjHeehV2EH
         tp1UkIKM3zpyw5H6CVZf9xPU0XoaPzSMVjZ7kcuqpcVacWvELWvtVS4zOFMlNuJ5mVK+
         PsPETfUnD+bwDWSO8iJNL2FYFZGsEnUkHkwDY+UwodUEt8lRG+aCeML6PkYpdqwwyUnq
         mB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I0C3/joVFUOtgynTDfg2nK4FAcVaShynoVdQ7RiFvBw=;
        b=KvztwRmmjKj872TDb3LqqqaAe0yt58VZ5XLn+KfLG1qqmSvBBicDETT8IVGnqM2+mu
         xs/xkPdQGzNtiH69wg+dNP0W/bif7CYZnXmPpJFZ/SrphTl/sPqq3EuL+VDo4vtHG8AD
         vBk7aBUwHjV4g/6jubuU20J6g4ukOmsGW6rVW1ZJIdNgXfM7HWv5YC/F4zWvNXGiJT3O
         TkzJKtc2g11hpGS1Bs7y15DktLKOzB3O7zB2FZwBzwQ069ITr1Q/pn9iJZrGtRUQuCqy
         +H1gTlaDjnhaZGWtlR8M23hZzMK5bsECvhIWqL8X/TJWHz/Ev0E6aoPWmsSxlEyG/LVB
         oX4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jO5nSRTW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12si1230372ejs.382.2019.08.23.05.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 05:22:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jO5nSRTW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i18aa-0000Yn-N0
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 08:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Wo-0006TV-U3
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i18Wn-0001kh-Nf
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:18:50 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45168)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i18Wn-0001k1-JZ
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 08:18:49 -0400
Received: by mail-ot1-x344.google.com with SMTP id m24so8521168otp.12
 for <qemu-devel@nongnu.org>; Fri, 23 Aug 2019 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I0C3/joVFUOtgynTDfg2nK4FAcVaShynoVdQ7RiFvBw=;
 b=jO5nSRTW7/h6jcJGHBgxceG3GfleWSGUtvPR67mAXXhEkboyDsT9F43toEb7UxaaFa
 TKHst7h2msJumUDGshP6hnzcfq7OiUTWNPU3gVh/XGapi6DFrtLeruzU6fDRvAwZI0wX
 fw59cb0oczyD1KFlUIQvO8t6K+erpA31iG8T73j2ugT99/3tidtJKGar/djVOHIMIggk
 6zwagODiotSN+azCBSwmh9Zyq5zkRSpiAFDJe7wyAc5j3tgNryGBMcFPpzH71dshVRU+
 aqlI/DMXM9zdfyikhtIzmssdeWggcedyB3dWpFeQ8X20nQtd/OPCTkqfo91lGb4+pH+w
 j75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0C3/joVFUOtgynTDfg2nK4FAcVaShynoVdQ7RiFvBw=;
 b=bw+MR9ODiNMgprpbTySDmPozwQFAQI4g+e74NIemnAS9Be8w16hNUdC6IpjA0lE5BA
 XkZR4HUqkkIe4AB3U/hWJeGqBDJ2z+dhy6E5wk0XxGcICzqvy0iunDuomvqD1solxcD7
 P/O0FT+Xcbqff/4TmGFzOyxYi6YKGUsVtsiLVgGPpvUFCIN2xnpcVFIih8+IAS5xcYVu
 89fC5HNDLer81aJG+YBKN3Tz/x7ZgqtS9yOEMQqrxqoOyKwkS/H0qg0n/GtAJkrlByMC
 ldGT+2oG13UlEnHRA/RNuPDAigqN24W8J1n1+UoGWOzh0vYWFbNR1umFAiQz/l3Iw46g
 A3yw==
X-Gm-Message-State: APjAAAVv+zOShCPr9QCRq+2OO1utagJEDJ8w8R7yRldIZxEgX/1j9F23
 stb+7U9geVnLboF2vPYo+m2fdQZH0K34jux6kMSSPw==
X-Received: by 2002:a9d:4817:: with SMTP id c23mr1031355otf.97.1566562728883; 
 Fri, 23 Aug 2019 05:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-7-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Aug 2019 13:18:38 +0100
Message-ID: <CAFEAcA96pH8LSKPaYq9yDpO7nmgxw8LTChRvcEz3M6MKK4+Fdg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v2 06/68] target/arm: Convert multiply and
 multiply accumulate
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UZHeB6oojVw5

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 248 +++++++++++++++++++++++------------------
>  target/arm/a32.decode  |  17 +++
>  target/arm/t32.decode  |  19 ++++
>  3 files changed, 177 insertions(+), 107 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
