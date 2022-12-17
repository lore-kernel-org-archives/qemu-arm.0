Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp2175142ejb;
        Sat, 17 Dec 2022 06:17:43 -0800 (PST)
X-Received: by 2002:a05:6a00:1a53:b0:56c:a62f:b9da with SMTP id h19-20020a056a001a5300b0056ca62fb9damr44124244pfv.27.1671286663625;
        Sat, 17 Dec 2022 06:17:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671286663; cv=none;
        d=google.com; s=arc-20160816;
        b=SPVe4T/lg5HSCB3aLnguNW7pLYy064jFh9Kxvz+oqTBQd2nhQpwYQhCAU+pgD1i/5X
         7Xq5xE1vn/t/2dzeNUJOAz2Az1o0HXScGGsyGiYuGobXyLQf6hgrGJ4kh9XwOfm1dLPX
         9ioYG7cv3EllPxqwseO/9V+FKpNhIXOBAb/hO7fniT7stEZiEvG5tx+YxZF9bpIC5Tm8
         O+7lOEfDu3P61tGCGXm9N8qRdu7OK72KA5xXZkd0o26Iu9zqMTZq7Ydf0ULttj8VekIt
         RZVPeTTlHO/MQ3WRg0/Y3i3TnO61tux9DAjcQ8hGnFg7Cpl+05tq0CMwD2kiT+aSwzeh
         0O0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xNfEddRIOphyC/U4i6KaIOkajJ1qtFPwVhN65+71iv4=;
        b=pqG4yWwEXzQ+Be8eO9g2FrDjfdulPm83M04oYkzb1mg4l+FenmCDBeSvrdTbM9EydJ
         +aMmgK7qdVWbfauJdc/hxUKyT8KLHs0vJCb4Enhk83kwB+lfM5HQ/zjEDsmzS1YR+h0Y
         aYEsjHwqStI8hXoPxagsZGrlWzhwyhUnezydoWIplBtOUfyGFyh2Qv/8MklqIrJAkL62
         T2W1CLZbMJfxU0J8hup10CLlrW3TVI07K6OCaUUK2XYB23F9iRKp806FgalKPztCMIGA
         JOW8gvS+Xw1NpH0Lsa2TPzV33/5PWJDFPvbhsqDGRFLfxBT6TNpHHynWKqsxbniCk9vd
         TOyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HTaeci6Q;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 190-20020a6219c7000000b005742da023besor2057179pfz.102.2022.12.17.06.17.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 17 Dec 2022 06:17:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HTaeci6Q;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNfEddRIOphyC/U4i6KaIOkajJ1qtFPwVhN65+71iv4=;
        b=HTaeci6QMzAYrKlkHCibDPNesH6NQaFsq3gt8qsDvuoU81500fdPGn4uv1HcSnY3X5
         CARiaImyTb5o8SkSU+BQl+NzF0t+Yf5o5BHTKAm+WvI7SSD7dotyo4YyIuXvxquAOj4J
         Y20FmGSTG6duP2gemACPkmKXhHtGeVQtXwZ5cmnSnGLRh0UXR6oh/IB1faWQWGLWoSFP
         e9DGkYZOgDvWwgAY0UMXi0XTY9AcpmZZ7xyVezzEFSQNXjx0vFTJbz1C81kB/QNzTYNa
         4xCisy5PiI6ZCMqLfnA8IsVA+12hZj3RqdK6yVrDXzHa7KSd0qTH17/bHLIrOnHcLQ62
         nwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNfEddRIOphyC/U4i6KaIOkajJ1qtFPwVhN65+71iv4=;
        b=caxpqbQTL8PnxYLknmSxYjwUK6AV/0PXGduQ+JonlTJ/J5pahGt+/24p1t1BZyry64
         5U4VXiNTqF7Q1TKjPsc/IhRCAxbE9rPGCQ2RUyUaRBy1ESnsQaGtVwlJHkj3sk2H9eiz
         HGVHEckC08TCfekaH2O6V00mIBers9rwCPQ7lHeLJY3sGlZQlQOsk0ij/IexK7XQo+UX
         pMkUZYGec6oZKMRB1EOTFW3p1VjiIrBc1pj+eBWoEKVTtsWDA0cUNan6E5QyYvHHvvie
         4d1OabxSF/mPKT1JrSZXVujYZggmgqJ+oCuAVuohM8T9BSUdL2bUNuL8QJcRcIEnOkUU
         Kr6Q==
X-Gm-Message-State: ANoB5pmdDa4JiCYsMbFUm6MT5s/iTpqfE7HCmogFWEtR0IMK59paG+kZ
	oC1HoA1WyiX4l6HfdGssA6pD0kuW8dJ5zbSLKWguVxUK
X-Google-Smtp-Source: AA0mqf4sJTQzxVAyuyfPndN+cFfXCetE5MzcyHYxSEjRglGqnXHR5+VpVD1/DTblX0u9sfsC1TWJzqUEUB+Gxw/fd3Q=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr80489363pfe.51.1671286663082; Sat, 17
 Dec 2022 06:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20221216220951.7597-1-philmd@linaro.org>
In-Reply-To: <20221216220951.7597-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Dec 2022 14:17:31 +0000
Message-ID: <CAFEAcA_Foy+k80r=vjXx2JO1T=2qFT-_7uvPhAuoSz-=XDanBQ@mail.gmail.com>
Subject: Re: [PATCH] exec: Rename NEED_CPU_H -> CONFIG_TARGET
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, 
	Richard Henderson <richard.henderson@linaro.org>, haxm-team@intel.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org, 
	Wenchao Wang <wenchao.wang@intel.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org, 
	Cameron Esfahani <dirty@apple.com>, Kamil Rytarowski <kamil@netbsd.org>, Paul Durrant <paul@xen.org>, 
	Reinoud Zandijk <reinoud@netbsd.org>, Yanan Wang <wangyanan55@huawei.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Sunil Muthuswamy <sunilmut@microsoft.com>, Peter Xu <peterx@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: obYhVaNrRGOf

On Fri, 16 Dec 2022 at 22:09, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> 'NEED_CPU_H' guard target-specific code; it is defined by meson
> altogether with the 'CONFIG_TARGET' definition. Since the latter
> name is more meaningful, directly use it.
>
> Inspired-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This feels to me like it's overloading the meaning of CONFIG_TARGET,
which at the moment is "the string which names the header file
with target-specific config definitions". I think I'd rather
we just renamed NEED_CPU_H to something a bit clearer, like
perhaps COMPILING_PER_TARGET (better suggestions welcome).

thanks
-- PMM
