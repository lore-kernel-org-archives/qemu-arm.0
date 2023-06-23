Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp114521ejn;
        Fri, 23 Jun 2023 05:23:26 -0700 (PDT)
X-Received: by 2002:aa7:da96:0:b0:508:3b1f:e6b5 with SMTP id q22-20020aa7da96000000b005083b1fe6b5mr14645168eds.15.1687523006496;
        Fri, 23 Jun 2023 05:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687523006; cv=none;
        d=google.com; s=arc-20160816;
        b=WZ5NlLnywgx/CBmer9m6oShx6q3HfwC37bxegwJo09PuSXoiLy0fEq4ONMiAMB9aS+
         cXhIAMhMphtDIZeQ37cg6vbzfEExvugKg7zNHawKHgQhhTxkpOF47vp49COsE4rh/ihF
         7C5i+v6nLjDq9ymJigXQhl/1FsMyPPS3MoHh7YDjpzWue7QdZMGmXpPH+yqqvotqVlzg
         D09VoGzn4MeZh3RfftR+TtbFx0XinugK7rh38dMmkUCjo5kXDDVdKa4Z+TyEmxQtYB7C
         wu0NA8014t3enP9xJfB7Rekdu7I1wJXfIygnmorBUMQtPV+S6vQ++gQpS+hPCnrufjTi
         OJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vXp47oGLNh9p2YnDXCzSE7S/t6QJAgmJXuUvykEqQAE=;
        b=h5Qif3fqMsjgWZOsriu2aQ7zIFj96NiG5yxbtSNUNI9FkSgqTgSnQtDa8V4sZx+BAg
         eBIy66ccwKja9nLHEXjU1FyIkE3SKIEmO14YWADmjpEyzi2tVibYTzgC0JOzTyBOM7vS
         bo57IijY2Ut6x/UCOHgIpQdpcXyGDvBBDGcy7mr8Udu1n1pXZE8voPPdGYLC1AE1mXY1
         aRjwj0iANxkHbk79tad83TTYcPU0LBy0CM8MiXusSnMBkfIYQuMsu1dXmP6GKtKBJ++P
         IvUn6oDgd9/jbX69EeSF5G+tOOkzwXswEWOb5yUUPUCtPC1z0gQD9e06EnsVD343BU0m
         qtIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+YawrYl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n3-20020a5099c3000000b005169f3f21c3sor2906953edb.1.2023.06.23.05.23.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Jun 2023 05:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+YawrYl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687523006; x=1690115006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXp47oGLNh9p2YnDXCzSE7S/t6QJAgmJXuUvykEqQAE=;
        b=Q+YawrYlrpeHKJX2qcSO6u8gwQ1K3lZjYRbiAyZF6MOg+GHX75utIYjiHecHsm/aCQ
         cPmiEZNni7TniKOoiptIW28d9/DutqDdBjWjFrgaReczbZaX+AVmhxJ2vtGC5O9SHoCG
         mWTH/Hj2w6fF3Z5ZFnN7hCjNw4ESUIXHE+AMT/mSAGDr9nbSlTBy6Ra9zWz7OWKKicFT
         GpgW31s027jcVQcx0wzuLRwxyGKOdyMpf45Jklp2Q7Gxyjd3r0h0QoRHT4S3FaOOVBry
         kHJiJ7Hz1HR4QjClpleLfocrKhg5hYUDjj+8sUZebNJqvsFiDKPHbwJmEwf8bM3gbnTv
         wHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687523006; x=1690115006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXp47oGLNh9p2YnDXCzSE7S/t6QJAgmJXuUvykEqQAE=;
        b=e/Wy6S/zZcwzDiTLFqMSxskNO73KFX2N9M36kibQ4zkB7wa7brzCHTVmT2NBenqv2V
         vg6PGJrcTRwOjGYJ+alAm26Lm/9JMhnWTDdXGziX0Olc7ksg8SyIAJNICdCRGvLI4W3j
         c78pFY2DNHsFqhOa036rDEN1JZNL31CiCDzIiWYDWc8+IXxvQb+wo817H3KJFD1AW0au
         0Gp0SZfdg2QPw5CbPDxiq48K5IZAhMfRQsa/KMJtIfYh1tZxy1+KTS+CaZBHii9NaZeR
         baa6xboJQ8RmfW8aH6xpVkNxULysg4HKL2MBHPGwYBRUJTQ7ocsYS3xJ9msjc4q7T0xN
         wFfQ==
X-Gm-Message-State: AC+VfDzG+MOqfRG5zjApkVqtR/gt/VAWm97jYEC2sBATNVFFgbjzZZd2
	IVKBazGe+7YDBIT4djj1w7Ywh5jcOKHZl2RcYWUBE9sqkLDjt+4MEaQ=
X-Google-Smtp-Source: ACHHUZ4r9jd68vB29U8iK50jwchhhoExqSjN6sScXPRI08pugh2SsMCvYLBOJ3iumiS2/PPw9cTeNojbADZicfrbbtA=
X-Received: by 2002:aa7:d148:0:b0:51b:f860:29a5 with SMTP id
 r8-20020aa7d148000000b0051bf86029a5mr1279156edo.4.1687523006160; Fri, 23 Jun
 2023 05:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230623122100.1640995-1-alex.bennee@linaro.org> <20230623122100.1640995-7-alex.bennee@linaro.org>
In-Reply-To: <20230623122100.1640995-7-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jun 2023 13:23:15 +0100
Message-ID: <CAFEAcA-Ghv6bybS8gxd-S+iFqTLvWBDw8rJ_HbVWevYaAbOBqA@mail.gmail.com>
Subject: Re: [PATCH 06/26] qemu-keymap: use modern name for Arabic keymap
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
X-TUID: f3aqthdFjlmo

On Fri, 23 Jun 2023 at 13:21, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The very old compatibility alias of "ar" has been removed from more
> modern versions of keymap. Lets move with the times.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  pc-bios/keymaps/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

There are already two versions of this patch on the mailing
list, both of which have better commit messages than
this one :-) The first one is:
https://patchew.org/QEMU/20230620162024.1132013-1-peter.maydell@linaro.org/

-- PMM
