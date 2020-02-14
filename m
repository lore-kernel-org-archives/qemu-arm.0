Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2304753lfp;
        Fri, 14 Feb 2020 11:42:08 -0800 (PST)
X-Received: by 2002:a05:6512:284:: with SMTP id j4mr2428400lfp.109.1581709328682;
        Fri, 14 Feb 2020 11:42:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581709328; cv=none;
        d=google.com; s=arc-20160816;
        b=xebGE/mdJZ/A3FPuflBRvpVveMYlazCE8+Q6M1IWeMu0QFSJ87IH5ELMY10GnChhvK
         q7Y9soeFzr2NSo30vnTTd8n1euHyTnoYUxw9Drw9gRwpQr1kH0iq2DxKohwZHFY0Uth3
         GwHYMkRV3uVNIBfJ4piIyYq9rzIZDkDQWe4nb5co4AyeyHksMdiWILyu9EGXpzuv9ZgU
         0oBHZJWhh9kmF3IN4+248yqenvpWQ2Ttu5EuWXJxa1so1r5ACYvHKygxllsFuXQnxXKU
         N3LbXMaGubGlXh/tqWp0d0Pxkp3EYg9gveTi5dVc6s2HXDnx6+yUxHvdjbH9/rCeDagT
         3qAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGTKqS/xS5Mxn+8PaEFwzNVUAx7Bg2gmWFKAnPfPbko=;
        b=Qpawr4QIAaanVw2GqmGhZqLJTBRQUQLGD+lB2vBuwQVlXcPsDb9/JsOqEzNjVTyUNK
         L58n0oaUMDvMpLM0PIFf2lVg7f8fbxR3PMXDjDZQr//cZgDXuX4jrSug/VzHen6WcD2P
         WTgdanjEwnSPhy44yGAO36I24qijeEkYxLjNhOUGhjOghpp8qc6ZmqEm1RdJ3Kt/xuEQ
         g40Ve0BBemzj9DflO/IW35URlI6RIUUclXZismdd/ZptAhRX/VqHT7iSpp18tmj0ElHZ
         mjZpNt/87bV7mLLZUT0nk2jq6tjtHxUU8Ef55gPi91OAcpplz8Zj64ZYY6IpyYx7ZHi1
         WFIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKTB+Ig2;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f1sor5082684ljf.31.2020.02.14.11.42.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Feb 2020 11:42:08 -0800 (PST)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QKTB+Ig2;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GGTKqS/xS5Mxn+8PaEFwzNVUAx7Bg2gmWFKAnPfPbko=;
        b=QKTB+Ig2wXGNvFTZnJ77+K5C0x/VObnH8x8I8OH/6gQT8tab25RJ+k0EjDwT7C64n6
         asw5XLFVHSn06LwF7LosuI1LSJq6wsSRL6RBOGjyNaWTWzuuL+qcjxlVOOWaJY2xp9d0
         oLrp+WnDmn/jGA5EsoGJqD3qIDiAK/dk7nhh5kK4Gm+ALPq68mjNNALC9Td7hR1jLHxr
         UTFmkLZu5py9Y482Z47fRrdD3vMKZaPh28dB+DZ9hlxd+HuloM+1HBFrGjSqgUAsxbTK
         BAwx9tCiq7nLbWkPtGZ6j2MtUtDNSUlF4YLIYwJEnyFAiguTPd1VeiWFfW/AD4cbURQc
         zlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GGTKqS/xS5Mxn+8PaEFwzNVUAx7Bg2gmWFKAnPfPbko=;
        b=HO2DfGtzRg8K929m68eBa3EcOj0Mz5Id9O3+QYx/HTPi0lgcrdEHnqtO4DnJR6V9qp
         vRSas+DvmSGRI3sptWJB6Ez13aFSp8qWXCGzsdmwDVX09bTqkKYqDIp04QG539EzNs2I
         /uJFIYVTchla3g2vcAP+spvD485v8cDJ8yVQGDVct5uRsr3rbqykghg3ZRQiFV5AZiOc
         bXBvzxOOkRUi8cvs1gWdsm+Ddtx3DmKW974cHT4zZR1cYU9DS8iwM8aJ1ePyZt1h8uqD
         7EMNgRycm7plVyLhsjaIGqjSUp1oY+76mJe6JWL8SQIqw2/mn5/1a55SHzR7sLer3P5r
         sJ8g==
X-Gm-Message-State: APjAAAWJKwt4eLx5Znef/E9KBfbuf9qzFRoU8lxzsc5WwUPEPyOmgVGx
	RrXVtkxnUym+Ajpy9XLflNvhA1hoY9teWprQWl6+PaOuLq3wzQ==
X-Google-Smtp-Source: APXvYqzDV0T0h92cdH6Ps3TRQXP998I3zk7aSYyuYWF8WcwcCRRrCn0+MDAlelFWkRurirYe0e1rQrsjVtcRwKg7hwA=
X-Received: by 2002:a2e:9955:: with SMTP id r21mr2953139ljj.283.1581709328252;
 Fri, 14 Feb 2020 11:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20200213225109.13120-1-alex.bennee@linaro.org> <20200213225109.13120-2-alex.bennee@linaro.org>
In-Reply-To: <20200213225109.13120-2-alex.bennee@linaro.org>
From: Robert Foley <robert.foley@linaro.org>
Date: Fri, 14 Feb 2020 14:41:33 -0500
Message-ID: <CAEyhzFuhCG0F+GOmQsAVb8USyTPTtF6me4vMALRYpMhS-8t7tQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tests/tcg: include a skip runner for pauth3 with plugins
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, cota@braap.org, aaron@os.amperecomputing.com, 
	Peter Puhov <peter.puhov@linaro.org>, kuhn.chenqun@huawei.com, robhenry@microsoft.com, 
	fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, 
	Richard Henderson <richard.henderson@linaro.org>, balrogg@gmail.com, aurelien@aurel32.net, 
	pbonzini@redhat.com, stefanha@redhat.com, stefanb@linux.vnet.ibm.com, 
	marcandre.lureau@redhat.com, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /XtLwzEAeQNp

On Thu, 13 Feb 2020 at 17:51, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> If we have plugins enabled we still need to have built the test to be
> able to run it.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Robert Foley <robert.foley@linaro.org>
