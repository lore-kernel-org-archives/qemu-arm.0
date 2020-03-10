Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp768572lfc;
        Tue, 10 Mar 2020 06:38:51 -0700 (PDT)
X-Received: by 2002:a05:6808:d7:: with SMTP id t23mr1175804oic.69.1583847531027;
        Tue, 10 Mar 2020 06:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583847531; cv=none;
        d=google.com; s=arc-20160816;
        b=w2OFEkTpEpEAtrGyxGTZp2NV8yBMH6WNRcdxUgH9FsRTmVQRScaaVSF5ZRSxoEC15G
         WrVQO8n+vzlsEkZm5uVuvou/rPYc6eiBIs9uThbopSJR32sOvJcG2kS4aq2wjXc2DYle
         nfcXDf1LxkTorGQ2zJyoqCw3WS//DQ/vOdmZmYN6hS8Q9jvBFvzFXMIp+VXs5llcF75n
         Dx6HsdHh9WNrkdJtGYffhb3XCsrHotn0UZzX7GojLFjd8P9cRx+CLw7EeSJRgsevZnsW
         vTmXkoe4F79zqDHwFL/am1jEArQStNN/dBxNMdfLbOD00s8B0u4bDNAXM2oUM6XCSALa
         KtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AfOpHfANqMh/+buT8CipNlg7u+XulNXv4MgEELSKa6E=;
        b=HH/KYEayacMfa5hoIi2Z33XZ21Bm6r3aBZ3DcPIi2OIRrUYNzIH//draTGSrjvKsHi
         3fUg/uCIp35d+VkPmpW4PIn5PTzT/uKxrx4SYh/xtpQuXpsmdfGaMLEg+BkB8Ykwaj7u
         bn4eWbLbVXI2gckxh6FqAgGR/rGoesWJs+iJrAaS75kbByKelJXqEuxWEwtCzF0vqXq/
         tgdgzpd/O6LEqYSPaAqWpXkuwFVHYmZE6lfloiCs+frIB4ONCC5uVQVrz1kVAWZftk+Q
         ++hyL9huy7vDzCS6wpyNyCDJi4dS9Gboldt4SrdKebfGODhwTIE22iNPDdUwuFurJzVP
         ZDuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Sa6/1WJ/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i10sor3002192oib.67.2020.03.10.06.38.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Mar 2020 06:38:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Sa6/1WJ/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AfOpHfANqMh/+buT8CipNlg7u+XulNXv4MgEELSKa6E=;
        b=Sa6/1WJ//aoDEcg0oJ9iEbWvpzckJjUrdwvS9RzjasDSQgFNArkJM6agOl2In0IZhs
         kdb3sB1RcFwS0XhIIMsGz7uZ7zF5wtdJLF0AyiqLx2MI30GxuX4B/+t7kMlCNfGs0v0i
         8JSHj75sENs/iW26yU4AF/HUY+3uwYl4SdyHfdnPLZATdspcEgm4kL12eMz1bKCplaVQ
         VMU0jx2R6CBivXqUBcAXK6JeXZbSTg77UK73/aOS1Pp+uyw/VWV7wWh3hMf9tOE8u0Ri
         BMmlK+KYSrKKiGbbHbOvtEqvEBIMzfHiYpP678WrCTho6ne7N53KRjQtWMGFiKN/0cSp
         DPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AfOpHfANqMh/+buT8CipNlg7u+XulNXv4MgEELSKa6E=;
        b=GW0ClSZK5TvYlf2E3Va3Dx89iGOv0hLlp6FJL5sbJTZLT93/vw57pQ/VHpD96MALfH
         sOXAwWbBDp6QXFaoHDrcCGmYFW+/wwKdz8ZTHeUNgUV/DqREUG0eJbC2d46TaiIyNjWV
         7KVrFu6TZqxsjy0r3LCn7q00tn9ON5FzE5I6OvuyBUSApAxZqDikRZYIpKGck5hGxMuY
         zDBHB5TGkEUt1Gpgo4Uqb/V8NdFwYazffnhs2Y1iQUjnp1SUoScTCABUZkg8XrJ6btEL
         UP+OYj9svU8HFoElvPdlkZ+lnoyuPpnasJSxmNvUYnQJKD9dCQDOqIdLb9Ra4KdzHtcl
         vNsA==
X-Gm-Message-State: ANhLgQ0dBNEDQXTzmI3ksiNd8tbvuMI+LOWS0zN+n/Asih1P3+VSoXym
	Unf4F6vmhpIifT+AfrDNgXUqKmaq5XGVHPOlhcMRZPd8/pAHLXP7
X-Google-Smtp-Source: ADFU+vsd/nbAZ4CCViMsj2mWxgKqFfaWmnbwaPzv260A3g3egoesewmn7R2t1zpgWqAx63JV48O2uW78fTPqh95er30=
X-Received: by 2002:a54:478b:: with SMTP id o11mr1134530oic.146.1583847530221;
 Tue, 10 Mar 2020 06:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200310133020.27196-1-alex.bennee@linaro.org>
In-Reply-To: <20200310133020.27196-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2020 13:38:38 +0000
Message-ID: <CAFEAcA-S1g4ojEkYdEa-ZHH+=uNUgCDWo0Z29ikbvNoX8Ro7Cw@mail.gmail.com>
Subject: Re: [PATCH] docs/system: add a little more detail to ARM machines
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: gQ1yelu5WYlb

On Tue, 10 Mar 2020 at 13:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Taking from the wiki page mention:
>
>   - both 32 and 64 bit architectures
>   - the roll of A/M profile chips
>   - warn about kernel portability
>   - gently suggest -M virt
>   - add headlines for groups of boards
>
> This is still incomplete but hopefully is a less of a straight dive
> into a dry list of peripherals.

This is a semi-duplicate of the series I sent last night:
https://patchew.org/QEMU/20200309215818.2021-1-peter.maydell@linaro.org/

thanks
-- PMM
