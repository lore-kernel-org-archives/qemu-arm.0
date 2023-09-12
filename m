Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2254078ejx;
        Tue, 12 Sep 2023 12:00:17 -0700 (PDT)
X-Received: by 2002:a9d:7d8d:0:b0:6b9:b904:99d3 with SMTP id j13-20020a9d7d8d000000b006b9b90499d3mr604639otn.28.1694545217194;
        Tue, 12 Sep 2023 12:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694545217; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZGCqIASwYci9beJLV+kgakXBzK7Lq1Ba9xigP0cZjSG66PmYV4fnVd09KHtTHC+HC
         yvnNqaGytkOCgPS6UHAbn8zFr6R6zAZV1BdiTAULuyeb6q7tVAVyrGJ76ZU5Xj9IZhrR
         KLYpuAzyY6735tYo2ekH+cXwG1TcXe3vR262sdYiQIBIIaNVNDlqNh/5UrvYQpkPIU8w
         pNW3YFLLkHJcHai4tIEmqaEJDOl16qMZxMzUourNX6Vff7ZLnsMtDeQHqKBZ4oHnsF1M
         oINII0I1ewoFATkxQ4yzVRDJ1uxZ2FKntvJxQdrJF+wY2n3aWrWHxGHEtr+4r5DAxE6B
         R2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=piu0eHKYmcAc4W9uppF+EeQSMzIi9xiD6eKhcA2ryU0=;
        fh=OEc6tgPo3nQRpMKybyhrkni++VeP/vop3bbPQRFLTxU=;
        b=0HNP8xy9TFQKZwy0P7RS4LhGjyqp+RSbMGES0yYvsvtsuCsG6gG7a+dyg/4oWp2A9R
         HV+7ON4Fhlo0ZqPeaR2Nd7V07aSTxgCF3bV3B5CvFE5uus0roPB6rwsNwJPlDY+Tu3s+
         /atX54qCPiy5OK0LBxvrn7za5PaZQzH6fzDNJ0vSBZPuMMiT209p5BcIe6JuyyZNgfmW
         lDgxOy8F+h8FmCzAco9xIb4detQMVpfAdrvAUC6QDYz18U2jfISiP/OKADrnyrDeCZvq
         9Md1/Atqpl7ecync9zMaH7V/YNmxV1Kns8UyMo+4Jj5R8tXbxZ2/vTKROXpVcm6hH7Hp
         KO+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="IYxSTu7/";
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <stefanha@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v18-20020a05683024b200b006b5dcbfcf17sor3811013ots.10.2023.09.12.12.00.16
        (Google Transport Security);
        Tue, 12 Sep 2023 12:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="IYxSTu7/";
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694545216; x=1695150016; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piu0eHKYmcAc4W9uppF+EeQSMzIi9xiD6eKhcA2ryU0=;
        b=IYxSTu7/MEg3+6sZK1oZIQG7bUl+P5rjtYkYQ4iHvYapVoR+KdLElKz7lcZ9xmvaS8
         +5Z3RXISKpzt29StE9h01lgX9L7jv5MmzIY3Q5eWD4yQc1VK2V9wHXVz1hOn+UGVhYMo
         fKgkUOYeJ6sifuUJdhNCaYBQ6neMGcPczg+y0K5PmMmVrRT7UG+/A3JfRUaq5pbEGQSL
         5DJ4FZ4Iwi//NUCvFPcWjqzP78gf32mv2C3NqtdFfqNnhaRkw8AGoMdcvLwQYcbXtNVj
         vjjnx0Cb4Gh9esIK7GGOz+rqQy9vpBryVs240PCEVleUaXea+0w5zW1Eq1rEyaHltkod
         HlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694545216; x=1695150016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piu0eHKYmcAc4W9uppF+EeQSMzIi9xiD6eKhcA2ryU0=;
        b=PzqI9y/xgSuudaznECntwh1NLJLSb+/Dopu+X5w/BQPfe7JimUX2iOtnsmQdq1IA/V
         lzkaT4FvKlMxdRN0XYnsXdJ/unYq1ZXbMYcoHHwtntBpQzr1noKBVohgm5Rkih2RZ9hc
         it/7L8gX6DuRlX+NdJs+8dHFOMzSjkt1jGnde74Acr6Pv9jgJWb3b+CRvW9GG07j3tYN
         4Nw9WkKYsjHa1raa9Y7XnfAXmgS+6v6MZt46+dza/m34fbsW+G/gAVn81txKpuKfPz2a
         u7HUaBNPL9IAmn8H91wbdOsth9/LUBJlLnfQKtCuUb7N+TmONWix1gQoPh5pTd8PqrvE
         Si1A==
X-Gm-Message-State: AOJu0YzMwDbzvPxfIKxL1aDWa0/GHXi2LtOdJpipdXuxjrrsXsntbmXc
	zUrYh1bmxpWAJrM3mrbwR7IOGEbvTvuLj7VKwek=
X-Google-Smtp-Source: AGHT+IHV93FpCnhqVsit2bwizRL6P5PzDuK2CadshF9ddMo+or4565E1M0joWr2fG669upfbvHKfrjYxDystHhJ8X/s=
X-Received: by 2002:a4a:7452:0:b0:570:c8fa:4ad7 with SMTP id
 t18-20020a4a7452000000b00570c8fa4ad7mr508407ooe.1.1694545216659; Tue, 12 Sep
 2023 12:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230912184130.3056054-1-berrange@redhat.com>
In-Reply-To: <20230912184130.3056054-1-berrange@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 12 Sep 2023 15:00:04 -0400
Message-ID: <CAJSP0QW_Oa2w-WdSeSkHnd6kFN6OxAkPr03_UO_rDWDhpT7Wxg@mail.gmail.com>
Subject: Re: [PATCH 0/4] ci: fix hang of FreeBSD CI jobs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: pwK5FQkYmbzW

On Tue, 12 Sept 2023 at 14:41, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> This addresses
>
>   https://gitlab.com/qemu-project/qemu/-/issues/1882
>
> Which turned out to be a genuine flaw which we missed during merge
> as the patch hitting master co-incided with the FreeBSD CI job
> having an temporary outage due to changed release image version.
>
> Daniel P. Berrang=C3=A9 (4):
>   microbit: add missing qtest_quit() call
>   qtest: kill orphaned qtest QEMU processes on FreeBSD
>   gitlab: make Cirrus CI timeout explicit
>   gitlab: make Cirrus CI jobs gating
>
>  .gitlab-ci.d/cirrus.yml       | 4 +++-
>  .gitlab-ci.d/cirrus/build.yml | 2 ++
>  tests/qtest/libqtest.c        | 7 +++++++
>  tests/qtest/microbit-test.c   | 2 ++
>  4 files changed, 14 insertions(+), 1 deletion(-)

Thank you!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
