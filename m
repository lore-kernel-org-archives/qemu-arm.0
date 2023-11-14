Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2134523ejc;
        Tue, 14 Nov 2023 07:55:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeExx7Xne7U49kqydmdkbyatO9cPyfO/+Mljry+UjPnJdspxs9tggdB2VAlNb+pGB2yMOq
X-Received: by 2002:a05:600c:1d9b:b0:409:67bc:e1cc with SMTP id p27-20020a05600c1d9b00b0040967bce1ccmr8038521wms.36.1699977306864;
        Tue, 14 Nov 2023 07:55:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699977306; cv=none;
        d=google.com; s=arc-20160816;
        b=NG4umeI441UqKAdlLWH3lP0B2nbUbpKDWFK+ZBQjSU4LXKbBVz+FQL7x+abA2BhUvE
         Y/O3m3Z9Uu9123cgND3kSKBydXWo1/1MKmZUKW9UUawdkDiHBd4W7kygCbiqe70+MCSm
         wl3yCFzXKA+ffI3CqMQDeq4u50RYhqyg0WrWiqY8s5KlpGfHsKqrZl5IQfVLl1tmIWzz
         TiWoKplvvbxJ4AZRbtPV+4uJAVCZ8XalvXzliK0w0vRAh6tZi4aOOR38PrAtoPE4GKBE
         X5qXfnoeFf3Gk3zBVJteM2ZSUFLK0pyfyW02XSTgZeqzfRMisSW3c9zNvh6nJGskQKu1
         4kyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=/dnm/wFvk/yv7xaMVVCi4UNXjRYnVLcTr44nudqfiig=;
        fh=7JhNqaM1Mp0687uOFl7YXgBivNCe7ij7R1FacKyuXcU=;
        b=WxhtPdr1b3KacXKL+zw4XNkZUZsQxtt/iNqL9+1zm6tj8BvHd8QEjCp689aLEkeJjc
         peL47zIydG4rEuVBRCPMwuTSsIrRnzr+umCCLFPkb16s82WRPls1VV07dt6NqBIe195j
         wUHd+kd8uskg8dxQwzsF5b/T0FLuJ91l5KkqDk892lvFi5E99mW7+CZTI013DLdvINf0
         3spAk6sYlTTyjBIBSzordGlYQjTQvlRCVc+UkjRS79ru7WTqRx7iL5l32EmK3cepNJjA
         CMAehNujVmcyNw+sdZ7RLS5Gy8Pf+o0WC+pYpvsIcyFElTBfg9u141Z+Bhy/Vn/pSW79
         DmVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=CrvEHaLu;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
Return-Path: <BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org>
Received: from desiato.infradead.org (desiato.infradead.org. [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by mx.google.com with ESMTPS id 12-20020a05600c024c00b004075c57bae7si4815996wmj.132.2023.11.14.07.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:55:06 -0800 (PST)
Received-SPF: none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=CrvEHaLu;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/dnm/wFvk/yv7xaMVVCi4UNXjRYnVLcTr44nudqfiig=; b=CrvEHaLu3ghKko6qCLNKnbyNbO
	H0HaiBWEDEqhiYXOyWq6L5fPwjkEEuFM/hPjw0DdPgdVBxI+hfbT8DDMqqG32wfgapci6OUoR+GwG
	LWXFGfKFNSpfzi7W13vkvR1Qk9iNGPwbn/ZvEhT0U/TFVXS1dCcIHK9YwgL7NXv7izHrZkaWioseY
	o2/3wuKNJ5fI/LnE0O+1GLlCXwFBTOIob05/Tt0QVIQ3fhqoeH6os7jaqbRUQXvuthfMe+J+5R2My
	36DqwE1AyHONfjQ2p9p3mJ2mXSIPNVvkoPDkUya1YBWKOoVp6qb5x1u+SdwdorOgU1Od+9cvf/1Ly
	pfoeq3TQ==;
Received: from [12.186.190.2] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vkj-002YFc-1l;
	Tue, 14 Nov 2023 15:55:05 +0000
Date: Tue, 14 Nov 2023 10:54:57 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH-for-9.0 v2 16/19] hw/xen/xen_pt: Add missing license
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-17-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-17-philmd@linaro.org>
Message-ID: <533319AD-DC12-4E44-8C95-D7A85D8E4241@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: SwIu0QSFEl4d

On 14 November 2023 09:38:12 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Commit eaab4d60d3 ("Introduce Xen PCI Passthrough, qdevice")
>introduced both xen_pt=2E[ch], but only added the license to
>xen_pt=2Ec=2E Use the same license for xen_pt=2Eh=2E
>
>Suggested-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>


Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
