Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3181780wrv;
        Mon, 29 Jul 2019 06:54:23 -0700 (PDT)
X-Received: by 2002:aca:3fc4:: with SMTP id m187mr53687089oia.156.1564408463609;
        Mon, 29 Jul 2019 06:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564408463; cv=none;
        d=google.com; s=arc-20160816;
        b=y81chry4t9O2YB0mXI9SpGI0QSE2nBtV/X23Ijf+68kam2bKdC0kbumvyMg1ofaWGM
         SMsicj33rWnbF4T64OHa+DAojXYvkpiLERZtr4AXQKHbFp/jQ0lhaXimoMKlfDzAOraS
         3KxhX398ukpNBsBTgvezMLvK1RzbNuYwWhvuf2bOyjY/ufr0zXLl6YmmS32uO7ZSl4Ki
         UFhswPpQx5xyUYlFRo+8rCJs/c8Uw40mERUKzc2jBAIHhPk11tN0duBG7jPMD55pPvcD
         0ttexGaDvexwglZcpmS9dsvzlAEtFctzhNJu8XIWVMXngTljdGjgsO5L6jYJ8wkRfyEv
         RLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D94d0FaMRBU/A12jdNzpAFYDLjU+Bo/jgqqx0M39XkQ=;
        b=WtjSq1fJeFSAXy7kEUt0DjsypfndCMeEy2f/2CUh+wDDHrI3kj1tt3JIRA3qQvLxmR
         eYarYmo8j9XSH4j/OuTwh19/DCOgXOGtTroqIPQTqw36LiejBTNzvPV3lLG7K3Vgsxv/
         n23oZ7aq0BYoOUDpvHp8FKFM6avVilpGq1SIhJ9ydxx6ecapdN0N43v6bDPe7fUtpk7C
         Cy4yki66JHMI7fumO7RaCX93ueb5wAMCpeN0vDIO8VbgwWuXN+8xoImXHtG8GJgW9hcW
         VOhh60WE/XgwB406aT+Edl7wzTR+M1neCoNZP5vL3OFxPQJ6uEgVZD2ewX/D4kjw297Z
         TCdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d4qqU3wW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t20sor31799635otq.132.2019.07.29.06.54.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 06:54:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d4qqU3wW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D94d0FaMRBU/A12jdNzpAFYDLjU+Bo/jgqqx0M39XkQ=;
        b=d4qqU3wW8Uz5k/FJNUrjLQAUVcvJB6e6iaFR6GE6f8SrlKEsT+udHMxo/f8sUc7zDG
         8ZKNP4JiRAHIBew2PwdX6FTD1iSabVYIPIQHvmeXdB8QVA7YAIUxcDuEIpioh4B0aHOj
         9CX24QPGVFvAqHezC00htuxOyu/PDJ624scw6bTGX0so8xcCw25tI1LJ+6eJrbNYf6Ky
         e06OGIzntEo7N5Rzg8ewa7y5uoOahv36tU9YOe5oDr+QIrKUkqTdOJby46FnAXWw3uhq
         69odoR2p0ft2jLGd1GTcbn09sEVEJWVkriUEuOgRq+HXgNzYF7ty386NfjLQPNL/7rtp
         HOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D94d0FaMRBU/A12jdNzpAFYDLjU+Bo/jgqqx0M39XkQ=;
        b=m2D5Zfruy6iV0AICP+tgyPsDPWGIVOtQnau6oZ437FQIvDX3aGlaD8N0JZ7qj24zcW
         NfR94Cgz5I1kPYmLypX7DchV+OTybf7KrgS+iJADQZRPButCB8iskj3i969+W6ne0EFA
         XSMn5yiCbSz+ysXwPSCVtXdqWM0TS1m0vUU+cG+MkNGILmh0dLhMpmmBcHbui+NFO1Bb
         eIfXwKDGnxmh77kLiI20acIq4cO+Lblzo8ng6k6vOYeMZHDrYhOKnRUIW9iWq/qPnLTw
         P8hZHYRiiL0/iYm44b766XeJDHQJODxf02T4P8Cg0O8zibe9Qorr6z8GcwJwiYHIoCvC
         wLXw==
X-Gm-Message-State: APjAAAUReHTHIMA2L7OLymveWXu3S10vmPHTdS9WiAf2ccLorqGqlbPu
	C6HhvyHEb6ys5lOOKcirEyTyj/MUQcJFH2yLfmLtdl7Z
X-Google-Smtp-Source: APXvYqwZFLloC+kkN3VAbttm2CwB9uD1ErF5DbJPb6CJ9n6blephgO1sQ+6nyqHIPcjIGY6fgTLUxUq5v5lzq80QzHs=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr239175otk.221.1564408463061;
 Mon, 29 Jul 2019 06:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-6-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 14:54:12 +0100
Message-ID: <CAFEAcA_7MCLuBPz-OQRCcdf02S2mqqVT5nmP+i6k7SAcdGkutQ@mail.gmail.com>
Subject: Re: [PATCH 05/67] target/arm: Use the saved value of the insn address
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: YZyahR3xvDce

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The address of the current insn is still available in s->base.pc_next,
> and need not be recomputed from s->pc - 4.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
