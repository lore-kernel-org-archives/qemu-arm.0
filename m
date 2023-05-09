Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2587808ejq;
        Tue, 9 May 2023 02:28:08 -0700 (PDT)
X-Received: by 2002:a17:907:c1b:b0:94f:31da:8c38 with SMTP id ga27-20020a1709070c1b00b0094f31da8c38mr11261317ejc.24.1683624488431;
        Tue, 09 May 2023 02:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683624488; cv=none;
        d=google.com; s=arc-20160816;
        b=obPOUMtvmXS/JxMMHpTdK+fxeZXx8aBkWkLUv3+uygfIfXDkmSswGJprL/sn3PJYGE
         +fdLpbHKTrSyC1UnL1Aqt6ukaDK+/2fWpvX5tNNdxYC/TNGbWmMcjoLlcAGs9VOEa1Q1
         6yLRwBSa16MTE1kz/4qzSRFSco2TXtzQU3z5NRoImr+SUHkZVQPaI5L0+amtkirID8OL
         6xWmX/umdKVHUWqI5kY2PFlcnye66QDgCvdGkTQWOZXGUCHZk88hbQKTQu4af4QbgHn6
         ABaT0JvVw/Uz17AzPSRWNNV1AjzBnv243ct6HZTH+N+y8ySAknyseVbUl9Z/a2gJ7My+
         Xh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H/9g1Ix0VvfWcms4RMR1WpCwyCH/rl1hW82mqXVJe0I=;
        b=j4GS5taowPhGRaecfUySfIolaS7qEBxsWK4SnZGnqpyO2CEgBf7MI6KpTxknFLYGLh
         J5gf2K54MZBvPoGMu4FhgeAd8y5tYaV5rz/BK1pGUx9gyq+bRytbDmW3PE0TdekApzN/
         VUXz/9cmWG4amc2rCZzdSqc7UXurQ9Ua/tc1DLrTy5gjiQf7jHgDCBqbm6y5DhgJgMqQ
         zAS7151pSPmac4bZUC+G6Bx5+Po/ASXb9fdx2/dXCp9eVS4OXZsF+9PdCS7RfinyG1P/
         dtodiwUrKqTNRgBIUcY0tRe8A0WlvU7F8EqHhLJndt36gg/DxHgl0Hb2rHul8d2NBBoN
         sMSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnATFZwO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q23-20020a50c357000000b0050d8b5b39adsor617189edb.0.2023.05.09.02.28.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 May 2023 02:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UnATFZwO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683624488; x=1686216488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H/9g1Ix0VvfWcms4RMR1WpCwyCH/rl1hW82mqXVJe0I=;
        b=UnATFZwO1K8G14VYNVgqa1H0g6GLGcWgsUK1BGondXIdNdV5XlEmPmpnuIpoKcwf+k
         x90j6TKB4J3zQqDspgUo/dAbi4jBx+j3ILaHKBo6Pn7zR5LMmf/Wb50uegSjCIj6Tgz5
         zO6g6ljwHunuW9JX3jjlSaB3xGFVl99OxrpKgL7LNINUT0dIpF+09VXSnBZSuBISU6v9
         U5U5PR9TCqe+Mu8Q5aH7iB1Z8IfjiXg+eChi+iIYysa61xmMVnWJ8dgxMCbJDBbJsSMn
         hyl7t9fVU7Ey2ABCo/NK1IaBm5rFpzl6JMMQeEcr21KuHboJ3lOa4O3GWggwPenLDFoK
         KmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683624488; x=1686216488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/9g1Ix0VvfWcms4RMR1WpCwyCH/rl1hW82mqXVJe0I=;
        b=Tjdk1tVBZMUIM80LrL59/fJydUnBG2dmH/9zlSZoAXKCHUvkivJMbC+g3E7EQYX7qQ
         Y0jPGvo/tsVZ+mUQJVzRyDRrcX9IvC3v9qADz2XBWV6t1ralymm534WcfBWnsNIGERlI
         L7/9nz5VkK+TM31GrgaCr8y1CZLgomMnTKU+g//WxEwNsbTu71ItcAU6Mvros17xOmf/
         9bavLuTCkMvzZY/olWbUfcTFvj2RSev23RTkWgja3Ze3uUkpGKGDzoN9dDaty7x77Pra
         9qFNGpeur4Mnn4T3qCBKYO0gacfxienUNyCwATwpRhSYibjHJAcEAMMFbU2olU7/iqRQ
         IC5w==
X-Gm-Message-State: AC+VfDw0cGG812yWGeGqurn9KaJ8FYA76MP2Ldv24SaM+CUOMZzciEEz
	H5zyLYT3G8d8x3niwwvaLQbvTVtqLV/PvoeHjcHVlpok
X-Google-Smtp-Source: ACHHUZ7fzwEDnpHzH6zTGaVIKQ0959Ds1y56Ppeatv6jbSo0SvmdBwFyAEhe/QY9GFPnLle13rAU7smEEPjxwFqeZu4=
X-Received: by 2002:a05:6402:3456:b0:50c:cde7:285b with SMTP id
 l22-20020a056402345600b0050ccde7285bmr11851376edc.29.1683624488080; Tue, 09
 May 2023 02:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org> <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com>
 <87y1m5s9yl.fsf@linaro.org> <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de> <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
In-Reply-To: <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 10:27:57 +0100
Message-ID: <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Andrew Jeffery <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Beraldo Leal <bleal@redhat.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>, 
	Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: y7gTkcA0/Kbl

On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
> --without-default-devices is not about choosing to not build
> some devices; it is about making non-selected devices opt-in
> rather than opt-out.

Hmm, so it's basically "the person doing the configuration needs
to know what they're doing, the Kconfig system will give them
no hints about what devices might or might not be needed to
make machine type M functional" ?

-- PMM
