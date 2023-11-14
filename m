Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2131069ejc;
        Tue, 14 Nov 2023 07:49:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGix0BY2p94Qtz5Mz7hijFARxLkezd9YyDVZgPwu34itrUNo6VOaUezMpYOVDBpAOYnHnUy
X-Received: by 2002:a1c:4b02:0:b0:408:37aa:774a with SMTP id y2-20020a1c4b02000000b0040837aa774amr2923464wma.17.1699976952990;
        Tue, 14 Nov 2023 07:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699976952; cv=none;
        d=google.com; s=arc-20160816;
        b=hdoIsjZQ+siNfxNG/Ybho1YSy8+dmizbmqWwGyXIFznoN3UmnG7sSvH+yuMvXKdtF6
         ZPmghNNu5hWnw/mdK0pGK6q/a8C5/6lMaQUsIs/GZ/PPWKtvLXVyxj9nwMruVbf5Gxdn
         KgrmHdnUH+Hl4qid7Ww+7xEiN8qYPTYRZjWt7VRRcHgplyTuOs/yTnYtgN1otZXAXcM7
         KA1raUkYBdJCNLWDiwPIBvxbpkK3Jv7EH1mkcAm4tJ1sGQHXOtGCRDuL4bwX/npprJLd
         OuLUAFkE+sGhJ+5BrWKsVHBSpObvajBMOyxXOm3GSysNgns5kAszqW9KxZ55gmmiM1Ap
         jgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=wtURPiisGS2Hb9OQNj9FuNG7UceqKqAuVLVYS7MTruU=;
        fh=ydMKaWiQZHFVAQxW7b3fSIwruvmw7ZbVQwYlGKOZJF8=;
        b=kBv2cNhpikwKvQlaKPGvMkhsnm0NldScdozoqBasmBsMb25Ku9Fgd6y4/XhXBss3Fh
         GE9qnICbHUdtGv89hCM3Vp1OQJbj5HGCWtLxZSju3m1iyFpIgconinBwkeLjlge5wAzc
         8FgaWJCyG+5hJxrWulzQVZiIufb5e39Rg5TPinYYIjspMfu1crSSGXf4opzAKahMyAsM
         T9gL1PUO+aMb7m6mOD08lTjASiDNchDp2yNxddkmBYyieGOuSdO/gMzFlbNPLTuJDt/1
         ShimacoASvONhS1SMDzksJkJtqwCXf3MD3488vkq34MWgJGnHYvwh3y7ZFxdh+0+YFD0
         UCoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=g+J9KwGd;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
Return-Path: <BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org>
Received: from desiato.infradead.org (desiato.infradead.org. [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by mx.google.com with ESMTPS id r8-20020a05600c458800b0040a5e693cc7si935211wmo.85.2023.11.14.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:49:12 -0800 (PST)
Received-SPF: none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=g+J9KwGd;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wtURPiisGS2Hb9OQNj9FuNG7UceqKqAuVLVYS7MTruU=; b=g+J9KwGdZRYI4g0BjPhX3Wej4V
	qgf4G1p2wAcN0ZPSKlJTDLbDa6XzWqI79m4La+5Xg542iql0TG4Aa2bBhd1bNXq47iauucD6/Ws01
	q39MFSqTiOOKtNXKYVedMaF39zDxCwXjwSxbPqoJ4wo8wyGRIa0FUIS6KScaI3gUS1ZE8683oG0xC
	0ZZCj6wcHEVFbZshtzBfxKDTM3DRbHiSS4qoRs2Ik4XoXV5MhW23iSr5JRBMh6eY5DSxYJppv7H+a
	5/rO5817qfDyFhoFlUiiNymrxo7+awx/ceo7QpxfhIdD7b6B72zUl9AqNCaLHNVbi24MNccaGsAPq
	Ah78wSow==;
Received: from [12.186.190.2] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vf5-002XJc-28;
	Tue, 14 Nov 2023 15:49:12 +0000
Date: Tue, 14 Nov 2023 10:49:07 -0500
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
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_10/19=5D_hw/xen=3A_Rename_?= =?US-ASCII?Q?=27ram=5Fmemory=27_global_variable_as_=27xen=5Fmemory=27?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-11-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-11-philmd@linaro.org>
Message-ID: <84F1C2D8-4963-4815-8079-B44081234D41@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: xTXftQDv2zwX

On 14 November 2023 09:38:06 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>To avoid a potential global variable shadow in
>hw/i386/pc_piix=2Ec::pc_init1(), rename Xen's
>"ram_memory" as "xen_memory"=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Well OK, but aren't you going to be coming back later to eliminate global =
variables which are actually per-VM?

Or is that the point, because *then* the conflicting name will actually ma=
tter?

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
