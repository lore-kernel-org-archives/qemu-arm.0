Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp455109ejb;
        Thu, 16 Mar 2023 09:51:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:49af:b0:d6:d880:dcc6 with SMTP id fs47-20020a056a2049af00b000d6d880dcc6mr44991pzb.19.1678985465095;
        Thu, 16 Mar 2023 09:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678985465; cv=none;
        d=google.com; s=arc-20160816;
        b=mbBlK6n4fbss/zJ/SXiYTlrRHHIqMCq2sLRBec7xeyD2pMsmm/Q+vySxGSVLW9wfNw
         ytIVe7Ge2OKrSaAqP+52WVVvQ67Te1I4s3ZetqcUznD2bNx5cTcI2F7zNToXZGSE+b/h
         9abRUJCaMBEZUcPPq79CtHsEHFHhdXeM0UoMa+OJGoipH2JfVVrmJbu3tJnr9NJlnxoa
         wUTZQQsBINdBWOM6Hr3NGS/xoIjb3SIPxxgx6a17QX9WMB7RcUEAbTm0I50tWQQrnKj3
         Q2asxMLxVH0Cv2Iz1bWtaUY98FdouIHvhcebrB0LKCc0LBdJNYhSQCnRdI75wIlayVBs
         4xuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7AgjnkZ2ngDrnmfTbD/UWVVgINk3vM6fF6Eu3gWYAfQ=;
        b=axPDIR9D13Piz+lN/BgvBCit/Rsj9+jffC2Norb5hG0P/eM1883kGU1fFdOabD31vy
         7RKJtG99ne+xn/4+XYngQoGcmqr4/lK+0PGikTk7YaAmDBl7aWxueK0YuA48gvUzNqOu
         QPjAdPlxGrObnSspPTNtmCv2KqgK7TaD4KIAp7erbXmu3kUGKHxYyoFm6h66oX9937ax
         4OyFPZ5UwVqxQW5pIAXvu2nX5eK6+ToXe11+/l34Ganfz9a1DvEnBz9qQATtEZ8WzS0H
         jygWHvL8guU2MP7k3cwV6meAFN2WUddSO7F+1w1rCZb5halrI9DPWXjqt/axZwFtUH1O
         9DIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rV2RPyNV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l1-20020a654481000000b005030ad58e19sor3036920pgq.61.2023.03.16.09.51.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Mar 2023 09:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rV2RPyNV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678985464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AgjnkZ2ngDrnmfTbD/UWVVgINk3vM6fF6Eu3gWYAfQ=;
        b=rV2RPyNV7i7XCEgyngu2kJfmH7H5NqrndfnfhE49dCw6eCf5wgkaWB7FL53P1xto5g
         C7hHhuXvlhE9/3HnJHgCB8HRiOoLjlmGwiqllTjFUhkOYeMJwTrq77w4aAqkpHK1iFG0
         OZvmaJOWw467AWUs/CeDr5be5c+F3DUw+eL09eXkjZgI32YGx0vxvljstwfr1vMEaoBl
         qcUvBQA0CIolEZPqvBrmgNEop2iOe1fQOgRT7WC4WIAOyJ2S6k5I/37mdHrXnJZXPljX
         AvKX3jzTpR9Rmu0xCOQHE2k5QT1uFG7GWGD5GoXxq755If4B+/MkPNKoyTXsIB9sPX/y
         PYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AgjnkZ2ngDrnmfTbD/UWVVgINk3vM6fF6Eu3gWYAfQ=;
        b=BtOZGpJQ4/6gysXHdT1OS/LMw6VyDQ7A+WocQmiOyfyCmEwgRAl4bQYJjlZ8pjPxm6
         1TcGUC15wpiA+noHZtgm5l4dVCFIj8QHop3luAr3HmxNRZScXX9t1NhQry2LLimPB8zv
         pjrL/q6Xw52Y2rKwWn5mkfsncYO7v6NBSAlPaSiFJ5D+JERI55Kqo4hXZuJGYy8lmSzZ
         T8ChuT4Hi2USnBr9JnYjmrgc2plnH+RvneWGNYrtrXmqfjlmburWGhgL7UTVQc8PgFzE
         BaZObA3qmH6vN9ikVir3IC+vxAU4X5S9BCJN6mGqqzVDyBSzLK4psPUuAsTNRy6d3e7/
         B9gg==
X-Gm-Message-State: AO0yUKWRrQFpyXjGP0rihD6vHDAWof8PXAc/vpIGpuekbGQusX4n7ZqB
	X5oifFXHHdt3S1jrv9np/CzzAFb1uKVph2GGy851TbMTrMEfVNPoNz0=
X-Google-Smtp-Source: AK7set+yMtUwfJnUezoj1siuD4khSSeqSY4t45K8vxDk+2zyPdUA99HNtW02GHb5+PDoyOx8835cM428WnOYhAeHdZA=
X-Received: by 2002:a65:4183:0:b0:503:913f:77b9 with SMTP id
 a3-20020a654183000000b00503913f77b9mr1063888pgq.6.1678985464567; Thu, 16 Mar
 2023 09:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230315174331.2959-1-alex.bennee@linaro.org> <20230315174331.2959-10-alex.bennee@linaro.org>
In-Reply-To: <20230315174331.2959-10-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 16:50:53 +0000
Message-ID: <CAFEAcA_EMVs5gPm6MYKOCYyMXfeJ4whKg0Q8WUNYmVk7fY3+Fg@mail.gmail.com>
Subject: Re: [PATCH v2 09/32] include/exec: fix kerneldoc definition
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	qemu-riscv@nongnu.org, Riku Voipio <riku.voipio@iki.fi>, 
	Igor Mammedov <imammedo@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>, 
	Thomas Huth <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Alex Williamson <alex.williamson@redhat.com>, 
	Hao Wu <wuhaotsh@google.com>, Cleber Rosa <crosa@redhat.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org, 
	Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Alexandre Iooss <erdnaxe@crans.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>, qemu-ppc@nongnu.org, 
	Juan Quintela <quintela@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Darren Kenny <darren.kenny@oracle.com>, kvm@vger.kernel.org, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Stafford Horne <shorne@gmail.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, Sunil V L <sunilvl@ventanamicro.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <huth@tuxfamily.org>, 
	Vijai Kumar K <vijai@behindbytes.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Song Gao <gaosong@loongson.cn>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>, 
	Laurent Vivier <laurent@vivier.eu>, Qiuhao Li <Qiuhao.Li@outlook.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Xiaojuan Yang <yangxiaojuan@loongson.cn>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Alexander Bulekov <alxndr@bu.edu>, Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org, 
	Yanan Wang <wangyanan55@huawei.com>, David Woodhouse <dwmw2@infradead.org>, qemu-s390x@nongnu.org, 
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, Bandan Das <bsd@redhat.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Tyrone Ting <kfting@nuvoton.com>, Kevin Wolf <kwolf@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Paul Durrant <paul@xen.org>, Bin Meng <bin.meng@windriver.com>, 
	Sunil Muthuswamy <sunilmut@microsoft.com>, Hanna Reitz <hreitz@redhat.com>, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Y5OxoSbCxpOw

On Wed, 15 Mar 2023 at 17:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The kerneldoc processor complains about the mismatched variable name.
> Fix it.
>
> Message-Id: <20230310103123.2118519-11-alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Note that Laurent has picked up a different variant of this
fix into the -trivial tree...

-- PMM
