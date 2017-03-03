Received: by 10.25.0.147 with SMTP id 141csp365066lfa;
        Fri, 3 Mar 2017 10:10:09 -0800 (PST)
X-Received: by 10.223.155.135 with SMTP id d7mr3517673wrc.99.1488564609753;
        Fri, 03 Mar 2017 10:10:09 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com. [2a00:1450:400c:c09::232])
        by mx.google.com with ESMTPS id s4si15766500wra.167.2017.03.03.10.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Mar 2017 10:10:09 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) client-ip=2a00:1450:400c:c09::232;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x232.google.com with SMTP id n11so21453514wma.1
        for <alex.bennee@linaro.org>; Fri, 03 Mar 2017 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kT2L3TkwERTVIR2f1e41ZKkKeqU+mKIG92fYyoPS6uY=;
        b=MeDKwafZzGlGYS+V+Ys/M7hCepgkZZzBcHTxYtSO//EhotkXz8HWiflSxYBF5Mnnij
         Uhsdnr4xk3D9N920O2zmPETd16R5RtLaKPsK04n3M9ty7wOmpAieZpB47Bg3OO5bVgUZ
         3xxeYf/tSvgYNFn3ndiZRYNxBLCD+aGauT79Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kT2L3TkwERTVIR2f1e41ZKkKeqU+mKIG92fYyoPS6uY=;
        b=BrUbSBzDXk3rz8vZ2tqZYpsiQY0WRTijWPHGR0tyg+cz7XLgL9rfNzhO4oHU/neNzi
         BttOlNplCwoyim5bJGqrC2wH36hxbhvG3VtMyMNmBrB2qPWWbaZIBPRHTWbZcTIi5Xg5
         azTAk+LVXUgxqDyQikrlF10TO0llVx0DQt0WgtkNa7cKQLrt0Ps6L04bleaSlOhQS69o
         bjSeuEQCA4ii70Zc5wHc9LUcBkkNKCBLsi54BIWYOplDKxqgKBlVdSkEkub7SYpF8cZg
         87k8WKWJhMOSEL5HRYexq0DndJjOXyWrma+tBuak0jyvBWAdHhKIAgJ4g0wDPoRmWmoh
         Ns/Q==
X-Gm-Message-State: AMke39k/TNI1p/jdfRHgF6dstPCNXJn9mm0hWQMmIprrbu8DXunOktA20m+hvQLLRj6HhK6AUxx64Ygg5LK96vD+oVo=
X-Received: by 10.28.226.215 with SMTP id z206mr3645476wmg.92.1488564609434;
 Fri, 03 Mar 2017 10:10:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:09:48 -0800 (PST)
In-Reply-To: <20170302195337.31558-12-alex.bennee@linaro.org>
References: <20170302195337.31558-1-alex.bennee@linaro.org> <20170302195337.31558-12-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:09:48 +0000
Message-ID: <CAFEAcA_q7vr59B7Oz2pk8iWp6FtbP_9b7f2z9QsTBf9FE6fNQA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] hw/intc/arm_gic: modernise the DPRINTF
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, MTTCG Devel <mttcg@listserver.greensocs.com>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	"open list:ARM cores" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lSncS+jMoHF3

On 2 March 2017 at 19:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> While I was debugging the icount issues I realised a bunch of the
> messages look quite similar. I've fixed this by including __func__ in
> the debug print. At the same time I move the a modern if (GATE) style
> printf which ensures the compiler can check for format string errors
> even if the code gets optimised away in the non-DEBUG_GIC case.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
