Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp115223ejn;
        Fri, 23 Jun 2023 05:25:21 -0700 (PDT)
X-Received: by 2002:a17:906:9b96:b0:98d:9396:4762 with SMTP id dd22-20020a1709069b9600b0098d93964762mr1265324ejc.1.1687523121722;
        Fri, 23 Jun 2023 05:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687523121; cv=none;
        d=google.com; s=arc-20160816;
        b=vlyVkTRQabMaDRBUHbaYwQ19d3zALpVljzgzsGqgZljtMFY+L3S6Ek0f75nfFAx0Ox
         XRj1n/zf6sVrbc4Zt0iKmmkb59ivXCFAGO7FIYBnazvFNElZye5FBD2cU+N4xsI/hgJo
         Sw0ZwTKR4COlWlu6IKPFeH9FyIS8REfH4FGDsxdzWJAPIjTBYvfG4524m1HJ1s0gXorY
         F9+6U/G2ZKNusdl6szgKiadq6c6PGjx7gTi80D+htKEn1LwGMi6VihBb+JUEg6jaDbdB
         ObJ7pK41WpDZ3AO6Yy108kN0vp7mKdsunECq8pz04KT+8P9gP+X7bhwlRpliD9+W0WWE
         EEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hmKf3A/k3LsA2vd9VJMx1nMvPcRqxo1Q+dCvMYHx+I4=;
        b=oDscqzMtKquIQjJQb70Hi70N931Fm7oFSjAEGldOQAE1DQSvQv0L54Wz2xshPZXEa9
         pvhSXaIT4AcAoufUqf8ct+mJ2rdMHuqsRywV4bf+ug9ABpz/nWsnVkoswEZvXM0gz2Lf
         +gggO7WDDyvnctP8PGfTaC8u6hGHhRNni566uJH6k6RYagonb/Vj8V2g+kR2Aef9XiAm
         e3iFvTBa0Z06GXGd2JAO4G1N6dSOdwqk6gc8Rq+S+1CzlZ3KOx7uC64QGEwxVKL+aS0i
         1lNYawiDz2X30J6D4Z3pVysb8lld+vT+ZGZuX36EZJYRw0RZ0NQyi8PI1Xgavo6VKXFj
         IVkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AeEoZ2wZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k10-20020a17090632ca00b00977d8d9d10esor990040ejk.2.2023.06.23.05.25.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Jun 2023 05:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AeEoZ2wZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687523121; x=1690115121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmKf3A/k3LsA2vd9VJMx1nMvPcRqxo1Q+dCvMYHx+I4=;
        b=AeEoZ2wZ3hKpz2O3yzX81Iu0uGFGTzUfQTegkzujqF5xT7flBgAfmOG99mM1iDQZ3J
         Zfy5q33aXQw4f/L67dc3YbtVXoOYAJk+0Tc90v86ZypNsyxD7l/s4DjI99FOHh/AV956
         8ds4uedF3N4EwoK4hTKz6myJvBnOmrzi2Vqtujl660AFdLoSw2fOo0P2pY1d1LaF/zo2
         kMQAdWJ5uQwv5Ll8YqlsNZtNQfBttRVySI9QfdCwjO834676408piCS2oJpxrD6CKwNm
         jA4zaeKEoAOPEYjKkK5zOU7o7YUQrJPn6y1wYczsipkJuCxR7J21rYzAkEFgPzeJRo8V
         gYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687523121; x=1690115121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmKf3A/k3LsA2vd9VJMx1nMvPcRqxo1Q+dCvMYHx+I4=;
        b=ZV100EVneReAXPto1JrytTfWzOAX1KHY6EgJrYv/4hU5c+nXfxPTUoHEbFs/BAYV/9
         pQQJoFcYSRB1edQLaewyHxCBS7LRrPiFpBsEYPiVc6BO0d5HbLO/Q4slgJM+KK4Fk4Hw
         QXca1/lRQK7v5JigtecOvIVohQDYsTkqTAO6wkoD4qwWVJjUMY/Sij7NqiHgf6eErD2E
         qbm0PZ0bcxBmEsjMh6ZLFrkqx2GmSaW9KDKOX5+qmA/KegWOqlRTUkt4vvNBA91V16bJ
         aijV78GC8SfwtM7ftAilNxcRLmfh8p5ZIYq7gHB9DQAUEIoKRS4aqPE10/EKC/i8Nrim
         BoqQ==
X-Gm-Message-State: AC+VfDxs93grHJ/XVNyKZnMGVCfYo+69wM0y5GeXu1FfEN7zwAgl0xe8
	or+Jud+fQPlcVuodKwt/ph12kHAQ156eI9zBnIexlbjClX1uxjNDNig=
X-Google-Smtp-Source: ACHHUZ75Wm01NYVv4EgW3VkoJ9IhWU92gXiSLyIH6Zst3yw9yzvidkblDHQbb4b2shVl/hURdAzitc9v2liXAOz/El4=
X-Received: by 2002:a17:907:7255:b0:98c:2b4b:7da5 with SMTP id
 ds21-20020a170907725500b0098c2b4b7da5mr6828389ejc.20.1687523121371; Fri, 23
 Jun 2023 05:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230623122100.1640995-1-alex.bennee@linaro.org> <20230623122100.1640995-8-alex.bennee@linaro.org>
In-Reply-To: <20230623122100.1640995-8-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jun 2023 13:25:10 +0100
Message-ID: <CAFEAcA8QX55yeTb+DFxwzd=ntOS8nH95xtQKPNGLiQRvC1=Fcg@mail.gmail.com>
Subject: Re: [PATCH 07/26] qemu-keymap: properly check return from xkb_keymap_mod_get_index
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	Juan Quintela <quintela@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Darren Kenny <darren.kenny@oracle.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org, 
	Eduardo Habkost <eduardo@habkost.net>, Riku Voipio <riku.voipio@iki.fi>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>, 
	Alexander Bulekov <alxndr@bu.edu>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Qiuhao Li <Qiuhao.Li@outlook.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Leonardo Bras <leobras@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
	Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rBBfK/70twL2

On Fri, 23 Jun 2023 at 13:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> We can return XKB_MOD_INVALID which rightly gets flagged by sanitisers
> as an overly wide shift attempt.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Same comments as on the first version of this patch:
looks OK code-wise, but have you eyeballed the output?
Does the keyboard layout that triggers this have no
AltGr at all, or does it call it by a different name?

thanks
-- PMM
