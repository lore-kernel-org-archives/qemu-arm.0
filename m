Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2868459ejm;
        Wed, 3 May 2023 07:14:37 -0700 (PDT)
X-Received: by 2002:a17:903:1112:b0:1ab:1184:1d74 with SMTP id n18-20020a170903111200b001ab11841d74mr215182plh.21.1683123277259;
        Wed, 03 May 2023 07:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683123277; cv=none;
        d=google.com; s=arc-20160816;
        b=VtE9ZVolnwt3mDeLUp82QKL3y9UOahD2QQOXG1JHMcVcq3QdBstyrDUk00v677+tPP
         p2+L0DEy4HzV94Gv2Yda1zYWhCNqWcIFojhMLdR4YfiZi9sC5RwQqehYy0XEqXmvapuj
         kBvqMn5/80fY+4RvKk6gAR+M+k6WfWe5MxOYBXgoTaqimcLkQ9u7tD6QywfozkDtO3ry
         5eumq+xxeKNTCtianhpXOUkOnNm1WDfr3pvpaQLn0FylFAEF6FNgUtXNvuVseCwI5QNO
         EHpxiaUeSW/TD10h77XZJd6U/nntBvyZTvWSr2nUskpvXoG7nhlW1vOhw/BbU54FK+gB
         oqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ok3dnoIOVRhWF/QeMA4JZUHCP0Ga4MRBynhtmL9YmzU=;
        b=MhbvNwGE7iA0qrzSLkBHhQjY3cFwKYh/eLcWCZP9GnEZBrFw3koYxI55qJj5cMn6kk
         Icd9yMtRmep7/SJ1UCgW+tT7SYtqWBjpROKMLqTM4a0Bjr/xOIXdiuZnPTjxnRdyXhsv
         Fnyy/kzd8votHyFKlxm4rZUrJRdSCHkftlAMWQYAOseaDh9eVQkQkMt31xyESb9EbkMm
         qD9gpiC2eqo200K3Wh1ann2EPdsfb6z1AT/RWZlSlXOXVvQYJxhhpSelPZcTPPK11nzL
         fzWsyHflEpC06b8sOOhAZFYL4sqg9Z4lq70YLEypvROhHxVL3zU3vlaDS2APDkL0VI7c
         6gLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=JMzlq6AA;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <jcmvbkbc@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h12-20020a170902eecc00b0019a9bff1023sor4040353plb.52.2023.05.03.07.14.37
        (Google Transport Security);
        Wed, 03 May 2023 07:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=JMzlq6AA;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683123276; x=1685715276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok3dnoIOVRhWF/QeMA4JZUHCP0Ga4MRBynhtmL9YmzU=;
        b=JMzlq6AANJSz4D3TAnij2TrFC98V3bkL1w0hw1lUztjFBTU5llv3GKWRVsW8BAiI7H
         LyjAvjPDO9FOiexpkHNlXxJj8vwMLApDIazEniiI+obVrOx9JvNVI15REpyfYlXWVDfy
         3yCuv4l/tduAvX7iBVyxRYlfAS2zZO+2YWIVtBPXl7Ntpn7+S8qwJk3q041xElJaSwp8
         c2xfccmfjfovsSKx3T6Bj8s6dGkioz94/OG4j7kMT6Wz+um57la7C3ZXwUi2Vz7h7g7Z
         VH/WZf8qSohV6cMdJUvv7dpczZudzvalp5cZZYLVAWUX2qxT8ov2v21kkJ72B3l3ADh0
         2kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683123276; x=1685715276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok3dnoIOVRhWF/QeMA4JZUHCP0Ga4MRBynhtmL9YmzU=;
        b=LB0Aqj0QB4vxd4Gt+SHYJCidjXDqWHPGDzFlem5PP2Mz2sr9ISfzj9PNTCGGMbBfcZ
         JYeyBMyQH8dEeca68QBSsuJTYjH8/ZDnNi40f0C3nz5GGHswz6OO9lg7n6liTW4xQy4m
         c0Q/9YDgiTACN81UYSrFMuYnaKrBFfqK5WrWcOAHp3nxKRLOHKhz0NUJeTYH527zAKg3
         jW3qo7UJWeK26aVTSJ4jX9gvrvb86V+GUAF+2RDb3rl38g0LeRd4Xe6tVrQNfgWuI652
         4hTh75xhKPXD8bpTQBMurOnEzXafv5uGCxr8an9XSnMlvTFKaqlDnLv3XjydUnCF/PT/
         wRMQ==
X-Gm-Message-State: AC+VfDxqobh3j8zoF2H/dAWZqsZEOOxXrxnAaxKcNQ9Rxy3dF5FxWOEA
	Bie7AEKfVglO08kpRjeAe3koc/BRRJLcTzgxdpCWDA3WMEpYFA==
X-Google-Smtp-Source: ACHHUZ4/I2s2XbL3TlysGZz1VvWH57h/7jeqr5qD+Rp59sM8wCWNHDS6YtH6ugZEWNQxcpVtGfAVCdorOREDZbcaGeA=
X-Received: by 2002:a17:90a:8c8a:b0:24e:458a:9543 with SMTP id
 b10-20020a17090a8c8a00b0024e458a9543mr2363506pjo.32.1683123276459; Wed, 03
 May 2023 07:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org> <20230503091244.1450613-18-alex.bennee@linaro.org>
In-Reply-To: <20230503091244.1450613-18-alex.bennee@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 3 May 2023 07:14:25 -0700
Message-ID: <CAMo8Bf+=xQOXJECB-wPZhKN3hQA1T=fVV2vcQKUa4F_4YWp7kQ@mail.gmail.com>
Subject: Re: [PATCH 17/22] hw/xtensa: add VIRTIO as dependencies for XTENSA_VIRT
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>, 
	Xiaojuan Yang <yangxiaojuan@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Beraldo Leal <bleal@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, 
	Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Djgm5KSNoER1

On Wed, May 3, 2023 at 2:12=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/xtensa/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
