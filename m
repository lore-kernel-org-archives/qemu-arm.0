Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp516591ejr;
        Tue, 10 Oct 2023 18:01:22 -0700 (PDT)
X-Received: by 2002:a05:6122:3193:b0:495:f495:bab1 with SMTP id ch19-20020a056122319300b00495f495bab1mr11941495vkb.0.1696986082020;
        Tue, 10 Oct 2023 18:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696986082; cv=none;
        d=google.com; s=arc-20160816;
        b=nP2owy1AzLr9AylQ8rq+uUr9ym17cOCCuUiRnX8XUoYZfb2DztAryN+1u7ikXJT1KB
         3UWEVWqqOukDCAac4RxjOtDGdhvhWaQc7hdLahJvKK/mhPoyqL14PN84VAbUvyWFUPKX
         LSRZG0vw3DYxCYFmoJ3EycZhrc5nFeuuSAtcCcBOWR2m3//82Fz/lLzXV2VlGsehkH3z
         pXrkvBXWKIxfNmls8nuKGJtlXzO1bihUenbXFbaqrpQ0rjW6M0GT2N3FB0D+IPdIj2kh
         gOg2yULKNC6CZQhZHOzgZbgb6jsJpqw+P1438MuTOw9D0y+oIhEHbpXVo4Uhdboih0au
         3/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qya31W9YBJ8jOwGlDzkTtT3a4oUoppVZSkQ76dfvfI4=;
        fh=cqk238ux3/GdOijP7fp8WGbp8VqG0EAAdwsLvgVM+lA=;
        b=mhihFV57f3hA5+cbfNbyBYxssopo87JTaUyJkY6MQnIZMox27H+Ux3fSsaBacENWai
         37ak8eLrRdzPCNGd+WZGhOCtuPQ3MG/jDHR9ZA0iPLvFX58J/QtY0LGAyrm7DzAp5Hxw
         2+BG7Bqhu3qjAja0RAXERbAMhCvMor5HNBJb2qJgGPIOCzuR/TBJdSKZf9tlgZRIsM5M
         TwpxIGBfigSZCNDfAbrnqKL54owtxVST6WInAkDGDLYUsXZj9tC0pkbnbrxpNf7xFIZo
         zdZyaR0NvvCiGf8zZt2QwPncQV6L8eW8JrZdJa+oVe9zGmL//SsaHp2VavtYmpXeYtVJ
         iUQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+FcXhxj;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gc18-20020a0561221d1200b004962795ccd0sor6244381vkb.0.2023.10.10.18.01.21
        (Google Transport Security);
        Tue, 10 Oct 2023 18:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+FcXhxj;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696986081; x=1697590881; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qya31W9YBJ8jOwGlDzkTtT3a4oUoppVZSkQ76dfvfI4=;
        b=D+FcXhxjqrEO6Snpp1XLYeeLeya4TEO8qcwa40IQCP1iCvTIXeG518p8FQoyh8rvOg
         TfcDVQbnWZd2jsEHQFy49fOuoYorxvCPd7eIuR62HvelzRfIajWaINK/r0gfTfPNQMlU
         btN8UJ6z6/c+qGamvcPO4ji6kfpbdCOnFQltetDcvxeXvtAxv7Tqtj8RlgBH4443tKHB
         bi4LavzwLnrFFG0aMJXwz3B7/QRsEsi9UK7ZWLDynT99B2PVCUGSVmgVmLbRNwciXLq7
         z0uN1HJpRq1yKMjAb1b3Nukf1pJyYGdutPq63Cjl2Yo5Y/XK6mjvXn4p7iHQjjf/U2D1
         YTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696986081; x=1697590881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qya31W9YBJ8jOwGlDzkTtT3a4oUoppVZSkQ76dfvfI4=;
        b=WBxJH/cIUl7Ajjbp2MTDMnshMBdflDypu/Sr/oATIjWT2IEYqby4dCNGKDTUFHZPx4
         J0WwzmP6Z4dtvhs3WWEDijzDxW2fBb30qZgXBCqjgYLzcVYGDAaOtFt+U+oPxw4r4kCs
         PCJ4oZLRMTZj1XSoXoZEfvoGlLR1GCMJ6WaCyqklGeATuWnBhDKrxB0EKuzFADNuSnln
         f/OdtFzkwT+NrV/o6oV2ho3iUUYgpSDfUhKVIdat5fpXi8ZSe32sj5+nj4MwvACuoaEj
         7b67mFcipWGOACwjOrhv59PLWjQoMqKLBQ4nBG7NiKkFA8c/g+YUJqKVKrbCiF3kFuQp
         Wygw==
X-Gm-Message-State: AOJu0YyjdFmSCGTU8XjjcuI/ApteAaVyjuIK76eSCsGEIizkF+QwZkh6
	JCCUgYutXRuzn/Ogi2JrOCFqDYhElFAWqIXtGYCSc4rbmAY91Q==
X-Google-Smtp-Source: AGHT+IGuGBMu+fD2eeIzNW1kyXyJJ68VOmVAx+oSmgAtCubp7HN2WQLRGSI9Xtoi0HeHnLLEfUyvlGbFnInTZH+TSsI=
X-Received: by 2002:a05:6122:3193:b0:495:f495:bab1 with SMTP id
 ch19-20020a056122319300b00495f495bab1mr11941489vkb.0.1696986081169; Tue, 10
 Oct 2023 18:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org> <20231009164104.369749-9-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-9-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 11:00:54 +1000
Message-ID: <CAKmqyKMOSLJ-D2+XPmcYZcBDEFzc+2FypYjb_Kv2qoyeG16oAg@mail.gmail.com>
Subject: Re: [PATCH 08/25] gdbstub: Fix target_xml initialization
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Xiaojuan Yang <yangxiaojuan@loongson.cn>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Brad Smith <brad@comstyle.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
	John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Song Gao <gaosong@loongson.cn>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ekV57Y1wMBq1

On Tue, Oct 10, 2023 at 4:36=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> target_xml is no longer a fixed-length array but a pointer to a
> variable-length memory.
>
> Fixes: 56e534bd11 ("gdbstub: refactor get_feature_xml")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20230912224107.29669-2-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdbstub/softmmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
> index 9f0b8b5497..42645d2220 100644
> --- a/gdbstub/softmmu.c
> +++ b/gdbstub/softmmu.c
> @@ -292,7 +292,7 @@ static int find_cpu_clusters(Object *child, void *opa=
que)
>          assert(cluster->cluster_id !=3D UINT32_MAX);
>          process->pid =3D cluster->cluster_id + 1;
>          process->attached =3D false;
> -        process->target_xml[0] =3D '\0';
> +        process->target_xml =3D NULL;
>
>          return 0;
>      }
> --
> 2.39.2
>
>
