Received: by 10.223.197.9 with SMTP id q9csp2726922wrf;
        Sun, 15 Oct 2017 09:55:02 -0700 (PDT)
X-Received: by 10.28.135.209 with SMTP id j200mr5370950wmd.40.1508086502599;
        Sun, 15 Oct 2017 09:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508086502; cv=none;
        d=google.com; s=arc-20160816;
        b=OVY1TvwC3BhjsBHmKYdnyQuXDJdsd6j9wCB/hmUh0QF2Btz5pJrpq+wmwx5MjEDjnx
         2xey6NLAOTDrWBucc4Yb5x0Gd6fL8VYILzEGlBTaiMOCR8Dxc4WScsmvsb5R3bQjF7cS
         5IHoZBx/xfOpdMcim/RBIysF9PHCkFKpo/b5ZPHuxmIH56d1HbKtg5BGHJT/JE/NmX/I
         kiGt7Bc0XgRmjcj3vqFWR04w2c7jzcQpXN/EElXao9ZjrdR7VZFZZBsHVAI5wh/eSAZv
         nWVynZ7pce/d80QS8D3qaG2/32BBvhY+MIhLO+dPVAanCb38hu60aAfadvRcMVgvwCzl
         Bj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+cYj9immOWusJUvANlWmd60Cfs8rkReulXkHtZdgOtQ=;
        b=s2OyhOzeS+Jba2Xc4OPnPGW591QRwQVjm90v2pOdnRP20F7xKjmz9s3ssodnoc9cmh
         Z8rLC2M2m4bfuJ5dV5r4Qk9oQQKpQqi3Ib470ukHnZZdGVcrgiDppA6KbtOP0gzCVTEd
         HTPdSWbjiGFdlFJWNbUOLQDg/5vjJrqST4fBoh8KH7PkKDO5/aEcO7YeOx+1ukmosbTU
         sRuASs8wfivF14ns0TZjY+lxpb9FO5QQu30DrCAKkCv3l4WUosmkcOoraClA5kjNoJWb
         lcjdBylImhjF2f0OggCnUwJc6c6BRwQfv6tBSSF7Q9x0s7YZlbKBcmipYmIKuBsUU9sZ
         Awgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWfk/edd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y85sor1411926wmd.52.2017.10.15.09.55.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Oct 2017 09:55:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LWfk/edd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+cYj9immOWusJUvANlWmd60Cfs8rkReulXkHtZdgOtQ=;
        b=LWfk/eddx02k1nht5dtW+zCMMuhEGTerlIF0u1+fUjeNtg/qfCiTYVVquqzlE1LF5e
         juPqkOYeO4bwVMgOYpHAZcEQf9jCttPEJr6MOG7cadvOxf3IJ8avXX0lGSwRlLHinpfJ
         0SNSKZwJt9Ar/MKbhzg7mSuix8S15ieaSN/So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+cYj9immOWusJUvANlWmd60Cfs8rkReulXkHtZdgOtQ=;
        b=EhV0hYcSIcw9+RPE99ZywlBN0uaYjiUt1E9RSB8jbwnzcJ6qfzgNyTiGYpjfDQlkSD
         h/k6cvmWGHz74nswCqqR2AfOBB8WqCyD6TPGkGJ7eqBdpZJfpo6pQAcmKMP51+SFR7L8
         uCxLgjWp6bnkZgUjmXZn72Yq8Pw/ZPTOkCIE+nTMUsy+JsoDhsirWf9Rs6Xd9E4QRa+y
         chlzOhrxIwZdFopZPFVzrhjPiBtO9AMHgaYjsbHFCxqTKMsO5xY7GtbLjzMj2mTdnhTK
         ThK0Tc13H+tsLPeZi0uAq64QoNAk/wY0dU2Exw5Fw2Dw276wDqgYMvYittfO9KohhVNe
         vXnA==
X-Gm-Message-State: AMCzsaUgi3R6Ea2tJ1dlkuCcky5WvgUvU/L2+Dj6HRpUdD6v4PJXmiXJ
	bGdLdhNc9osr7tIKbj09TvohVCg2ZS5TA3xqr+TH5Rniq38=
X-Google-Smtp-Source: ABhQp+STvFQvJZJnOd2r+ftjLcEEtrG3Sct4Vsam1tJ8iEeF1S+UoXWed6WTeb/V/Yefu8qHJWFKgzaTCFfs7kaI4ps=
X-Received: by 10.28.23.3 with SMTP id 3mr5353680wmx.62.1508086502217; Sun, 15
 Oct 2017 09:55:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Sun, 15 Oct 2017 09:54:41 -0700 (PDT)
In-Reply-To: <20171013162438.32458-11-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org> <20171013162438.32458-11-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Oct 2017 17:54:41 +0100
Message-ID: <CAFEAcA9vcZa-v1gxLD0kjGO5zxwmZnNioLy6daEc0MtJJOY5VA@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] softfloat: improve comments on ARM NaN propagation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: vucXIbQsOMKt

On 13 October 2017 at 17:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Mention the pseudo-code fragment from which this is based and correct
> the spelling of signalling.

We are following the IEEE spec here, which spells it "signaling"
with one 'l', being American. (The ARM ARM also uses the one-l
spelling.)

thanks
-- PMM
