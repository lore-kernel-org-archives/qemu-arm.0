Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp491604nji;
        Thu, 12 Sep 2024 05:12:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1u5zvOHJ66Gw8CMYMW+uLg2pcU3nqSg1P941h1VMryEmJt5SW8Cac9g2ZBrhA5hxf+aJwtQMzsEOrSQ==@linaro.org
X-Received: by 2002:a17:907:f76a:b0:a8a:9054:8391 with SMTP id a640c23a62f3a-a90293c51c2mr236774766b.5.1726143149180;
        Thu, 12 Sep 2024 05:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726143149; cv=none;
        d=google.com; s=arc-20160816;
        b=Kf+xqlCc3/H2hJfyURkz1Hik4Wh8AxnUs2h9INvCqrf4jOJPEy6Dk1MXe3abVEmUsD
         mCMctzaYnh/wc3ZmVtEyatfqt8a0Up95oG3WJOpyPpA77/hs0bIq6yBASouGJQdOH1ok
         0PiFwAofj6FfXpcPQ6FyuCkmeX1fgJOH2Y4eLYexWSGB0TY8M/MdeKyWB4AvZjRq9AP7
         ytwzHJS41N1SbdcvslTOqToSDgCr8FfDOwiYuVZYMuu7V4NUqANdVA8GJaWh5CMzctgm
         srYs5RNCpVzKjMkzzDq99S0J3Uh2kK+Xcz86Rq9MWP5VYvV7nFagjWvlqh10wI6UvNeX
         N1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pSke8FlFE4N6exTtc6EKOjb2LrZxkDR+LzQcBycp73g=;
        fh=UGfhCrF7jSivfZ8dHFzJfw9eq/gbPDbGiR8wyImbw2U=;
        b=KPTW878EV/YQnTb/kYfHyQnUnWL1oD+r4SHKiyw1o5/b7ki7MIfnl00SaG0KX7FYBA
         +62bKGOrAvJmG+oZMLaLJEaroxmPiQ5zrKJT0N++/X8hNBeIl0Qk+7q2zLl/Z9KJNSXp
         fs+NdMlIqJaL5B7COBwCP8d+vr5LHegXhx1r5HuesnG2T0DKnZNhVRtDFOGgO8dUhrfH
         W0r2AknNAcX1GRLtS9j+jFhKnVNkrizdX8Q/4Tyuumtk7iwOidcxAQc8zmVKDXRdPYz/
         2h4EZuC/UMvzN39pffxzW8kCCU53XSnegyrjZko3bzmsdx/VTtkvth1xGfq3Jnf/rSwV
         zP/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k75J/wQ8";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d25c3c525sor342316066b.15.2024.09.12.05.12.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 05:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k75J/wQ8";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726143147; x=1726747947; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSke8FlFE4N6exTtc6EKOjb2LrZxkDR+LzQcBycp73g=;
        b=k75J/wQ8ybAz55A66Jd/2/o5S8LeLWY4zvN/nzBzsp4b0HnDKb2/yP5n4GGsmcaAX8
         DeMzj+w27156lRc12oNnZfMu5NSLB2E5Xfd96S8AEHSZyZjHsDOKIXy9lIeBTZ3mMAfx
         ftOSNBNAGzd6vRlGFqYIR9rO5XYnInJc9oMlv4yU3k0AOvNH1laEIhjhUvuivznrjS9K
         58Oo/kVlWZQwUkgcKBW2A048vqMXQcHfjP6hQ8sWGnGeuc900NQV9GjYzH9lHysSnCZe
         MZXBIbhsypWhFYJ2fjOu+myGFoSOj/jF+om/ijLp0+Nj3P+DoFKA1x0aS3eCjwxVM+VE
         CRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726143147; x=1726747947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSke8FlFE4N6exTtc6EKOjb2LrZxkDR+LzQcBycp73g=;
        b=hqo5QVYgTaoRaz9Qz/BRdqcBMZjtn8b8JyQv0ZawJQdYMbNhOgznejHMX3An0O1tOG
         523MI1knL2sJIIgrCzOKthSjZZAsWTwpwggbLneWsapWFtT0OaNGqi7NIM9Yesue+mpy
         6yjvZzpyTfFJv8s4pLn2jpgoaSkc2tjI1A23nKUuVLoMLDRcflLfaxZWM+owNFHdiIwC
         mkB9DmpJAjuVeSxhFDXmnCiFKr5a0pqU2V/UiS2zM8RvWel/LU5F0EHOib4ofaG+dz/M
         Y+e9CEQd6aBCsHS6bwEJAr7Fb1zKDIqHiIuanR+yBW6QTqpbkH7fDdBS8a0dBIy9eKXS
         8ITw==
X-Forwarded-Encrypted: i=1; AJvYcCVl3TLmgUPpHJP11W+p4Jw9yuv6nSFl8uLG68TBFLwsNFL69WQigUn5eVFD/cWh9q3LrwzyiEKpwk+xnQ==@linaro.org
X-Gm-Message-State: AOJu0YwfPfuWd0+nWhcbsJiX5YJzAgqZb+grQlv+vUau814qOTQRmURP
	Zf2kJ4nT2N/LlO+g38wBepiVu73RtFEdvJA45k+TP1/2cUFO9I/o3wQX+67jFiMmLKrr4YcIoVo
	IsqWjoSWYP9tJK48ZZkiNepj1oXbv1s4PEmvD/+6Q
X-Google-Smtp-Source: AGHT+IETQd/3dKE+DCudKgky7MhTcKDOjT4e304Trb0+62Sgjre9CoznMfjV51Zt3iOwKhpGntAfXRHw7wfNzHrHWeQ=
X-Received: by 2002:a05:6402:3881:b0:5c0:8ea7:3deb with SMTP id
 4fb4d7f45d1cf-5c413e4c748mr1736077a12.22.1726143147135; Thu, 12 Sep 2024
 05:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
 <20240912073921.453203-15-pierrick.bouvier@linaro.org> <a0608783-d6d8-4ccc-a431-5fc1e96e0021@linaro.org>
In-Reply-To: <a0608783-d6d8-4ccc-a431-5fc1e96e0021@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2024 13:12:16 +0100
Message-ID: <CAFEAcA9rx6jSZ3SHa1=H+-r6H4KopK3dUG=qmqRgt=nVcs5ueA@mail.gmail.com>
Subject: Re: [PATCH v2 14/48] include/hw/s390x: replace assert(false) with g_assert_not_reached()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <lvivier@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Klaus Jensen <its@irrelevant.dk>, WANG Xuerui <git@xen0n.name>, 
	Halil Pasic <pasic@linux.ibm.com>, Rob Herring <robh@kernel.org>, 
	Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Fabiano Rosas <farosas@suse.de>, 
	Corey Minyard <minyard@acm.org>, Keith Busch <kbusch@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jesper Devantier <foss@defmacro.it>, Hyman Huang <yong.huang@smartx.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org, 
	Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org, 
	"Richard W.M. Jones" <rjones@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Akihiko Odaki <akihiko.odaki@daynix.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Hanna Reitz <hreitz@redhat.com>, 
	Ani Sinha <anisinha@redhat.com>, qemu-ppc@nongnu.org, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>, Peter Xu <peterx@redhat.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>, Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org, 
	Igor Mammedov <imammedo@redhat.com>, Jean-Christophe Dubois <jcd@tribudubois.net>, 
	Eric Farman <farman@linux.ibm.com>, Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
	qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	Joel Stanley <joel@jms.id.au>, Eduardo Habkost <eduardo@habkost.net>, 
	David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <fam@euphon.net>, 
	Weiwei Li <liwei1518@gmail.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2MiBIws+5V+D

On Thu, 12 Sept 2024 at 12:59, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> On 12/9/24 09:38, Pierrick Bouvier wrote:
> > This patch is part of a series that moves towards a consistent use of
> > g_assert_not_reached() rather than an ad hoc mix of different
> > assertion mechanisms.
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > ---
> >   include/hw/s390x/cpu-topology.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
>
> We usually don't precise "include/" in patch subject:
> we treat include/FOO as part of FOO area.

I would say either is OK -- if you do
git log --oneline | grep ' include' |less

you can see plenty of examples where 'include' was used in
the subject-area prefix, especially if, as here, we're changing
just one file.

-- PMM
