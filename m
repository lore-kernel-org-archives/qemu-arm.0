Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3510856ejb;
        Mon, 19 Dec 2022 06:10:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuKotF65pGeQI1DhCMZK97KFk/s0zwqmvBwGlqp6nqizgivForuOyQUfOCcdeESRYVtMOfW
X-Received: by 2002:a05:6a20:b723:b0:af:8e92:3eeb with SMTP id fg35-20020a056a20b72300b000af8e923eebmr17073107pzb.9.1671459012898;
        Mon, 19 Dec 2022 06:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671459012; cv=none;
        d=google.com; s=arc-20160816;
        b=sTc0S+EoG3hzA0UKuPJV1ZZAfTJrQcFOkyyhU0RU95WZmmUmivywqRd+1t5I//zmrk
         qKOTu4U7cqGNBFbsCCf5BfLdErGNdEC+sMwn+Oz7s9pzIZTBQBVc7c4Y2Fo6de3RMc19
         Sh+0t0slW1cbJDtJeqfPhZVgoCSndsM9360pQ/yeDgycg/jGmIfKhddecrvV7yTMiAUy
         8oxYRZJS46dlOYmtByf92L1voCMzQjN7ou0/onGulxwrbAm2QT3+AyyxY6sCTbCbg4Qr
         1A0gYbGyxMBzPh/kfntrd1BxkQzd8MJKeTXuT9bZZqq4m01i/ymO81nygwkUpfpYS3Ia
         +2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :ironport-hdrordr:ironport-data:dkim-signature;
        bh=lGGfYliuBO5iuGtYyjNs7KqVA+hKeECPqJ/GasuP+is=;
        b=mOiaDSRLejEAUcwvxYvMjjjv6LjX+2V9e8E23Sr0vAh8z3yh3xNgNbbwQB/vCThu/N
         qtKYFAX5zg0+XND+VNOJmai4deucwQA6V1b9NUkpZwJ+2GOEdU5oHTzfVtFF9byaqQY3
         C9ndcIHSJ+t+y1SoshvwM0c/xfxfCtwoiGWnWzBYwBt1SFk4/Oj2+aselCWJ+S+Zy+2T
         THEqznQs7wnMdpoKEIzdY3Ms8Lw2E/dIyha9kqLPVBNCdipgDVn6RWMdkby7KKqQanYd
         F+zU456zAocrNEWowKW/6wPPQOpvViMqqPzGbdWavsnRi+1oUaw9IHpg/ROyWKjwy/lV
         Yyow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=courl6+X;
       spf=pass (google.com: domain of prvs=3454adc0d=anthony.perard@citrix.com designates 216.71.145.155 as permitted sender) smtp.mailfrom="prvs=3454adc0d=anthony.perard@citrix.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=citrix.com
Return-Path: <prvs=3454adc0d=anthony.perard@citrix.com>
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com. [216.71.145.155])
        by mx.google.com with ESMTPS id u11-20020a6540cb000000b0046e9da9ac40si10049281pgp.556.2022.12.19.06.10.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Dec 2022 06:10:12 -0800 (PST)
Received-SPF: pass (google.com: domain of prvs=3454adc0d=anthony.perard@citrix.com designates 216.71.145.155 as permitted sender) client-ip=216.71.145.155;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@citrix.com header.s=securemail header.b=courl6+X;
       spf=pass (google.com: domain of prvs=3454adc0d=anthony.perard@citrix.com designates 216.71.145.155 as permitted sender) smtp.mailfrom="prvs=3454adc0d=anthony.perard@citrix.com";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=citrix.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671459012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bkhL5i1Zpu2u0dNJ8rDflE68+bM9GeYGaMZ8cE7WyBg=;
  b=courl6+Xv7T1/vDKOTdvRSG+FuJoQ9FkeKPrZYgVcJn8j49zdpMBUaxD
   dC0vEMBfrxZzpMS9hu9wmpoTB67ESl7dGEWnB9mSNTKhhqdtmuJD6MC0I
   +YYsPYlqFddWTA/bP9M4MgmrN6qEOzk5TDLTo7p3+jihi+HraCc6KYW/F
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89102970
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:REAz26uKIQm+B1lLID8TiCsKKOfnVB9YMUV32f8akzHdYApBsoF/q
 tZmKWyCaPrcMWunf98laIri9UhUuJTdmt4yTQRqpCgzF3sR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWHxiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdhMTYyCOgfiNmr+pcrB8n4MBBcSzFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27I9
 zuepTWmWnn2MvSi0Dq77SOutNaWsiP1ZrATTIKe17l11Qj7Kms7V0RNCArTTeOCokK3XdNSL
 0wepnN1hac3/U2vCNL6WnWQqWSBtAQBc8BdH+0z9EeGza+8ywKHB3YFQyRpctEqtMYqAzct0
 zehltfkFXplvbuTRH+18raSpCm1fy8PIgcqYC4PTQII55/5p50zphvKQpBoF6vdpsP0Ay3xx
 HWEtwAkirkThNJN3KK+lXjejjex45TEUAMxzgPQWG2j80V+foHNT4Oy7kXUxfVJK4rfSUOO1
 FAYm9WC7MgUAJ2NnTDLS+IIdJm56vDAPDDCjFpHG5g66y/r63OlZZpX4jx1OAFuKMlsUSbkZ
 VKWoRtazJlUOnSscOlweY3ZI8glzKzqGM75furZYtpHft56cwrv1DlkYkiC3mbsuFIhnaE2J
 dGQdsPEJW0GBKpuyjq/b/0Q3b8i2mY1wma7bZLgyRO4+aCTaH6cVfEON17mRuo09rmNpgrY2
 8xSO8uD11NUV+iWSirN+J4eKXgQIHQ7DIywoMtSHsaYORZvEmwlD/7XwJsidpZjkqATkf3Hl
 lmkV0pFjVPlgFXBLgOFbG0lb6ngNb5noG42J2opNEek1nwnSYKu6q4FcN0wZ7ZP3PVuyOMxR
 f0CcMaoBPNJRTLavTMHYvHVp4htXBeigg7IODCqCBAzdoBhSyTG+9X/eQ2p+DMJFiC6vNF4o
 rHm3x6zaYIKWgBKHMvQLvW1wDuMUWM1wbwoGRGSe58KJRuqoNMCxzHNYuEffeISJCXOwCGhj
 QuEOU4IvK7vioJt2Yyc7UyblLuBH+x7F0tcOmDU67eqKCXXllaeLZ98vPWgJm6ECj6tkEm2T
 aAMlqynbqVb9Lpfm9Ake4uH257S8DcGS1Vy6g1/VEvGYF2wYl+LCinXhJIf3kGhK1IwhOdXZ
 q5t0oMBUVlqEJm/eLL0GObCRrrr6B3ssmOOhcnZ2W2jjMONwJKJUF9JIz6HgzFHIb1+PesNm
 Ll+4ZVGu1fh1Ep7Y75qaxy4EEzVchQ9v1gP7MlGUOcHdCJwor29XXAsInCvu8zeAzm9GkIrP
 iWVlML/ulio/WKbKyBbPSGUjYJgaWEm5EgiIKkqew7YxbIoR5YfgHVszNjAZl8On0gYjb4uZ
 zAD2o8cDfzmwgqETfNrBwiEczytzjXDkqAt4zPlTFHkcnQ=
IronPort-HdrOrdr: A9a23:UTs5kqCJzyLV3uflHemA55DYdb4zR+YMi2TDgXoBLiC9Ffb1qy
 nOppsmPHrP4wr5N0tPpTntAsi9qBHnhP1ICPgqXYtKNTOO0AHEEGgF1/qG/9SKIVydygcy79
 YZT0FWMqyVMXFKyer8/QmkA5IB7bC8gduVbD7lvhFQpNdRGthd0zs=
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="89102970"
Date: Mon, 19 Dec 2022 14:10:04 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
CC: <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	<qemu-ppc@nongnu.org>, <xen-devel@lists.xenproject.org>, Laurent Vivier
	<lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Daniel Henrique
 Barboza" <danielhb413@gmail.com>, <virtio-fs@redhat.com>, Michael Roth
	<michael.roth@amd.com>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, <qemu-block@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, Paul Durrant
	<paul@xen.org>, David Gibson <david@gibson.dropbear.id.au>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, John Snow
	<jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>, Thomas Huth
	<thuth@redhat.com>
Subject: Re: [PATCH 2/6] hw/xen: use G_GNUC_PRINTF/SCANF for various functions
Message-ID: <Y6BwvATqB0ka7qys@perard.uk.xensource.com>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-3-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221219130205.687815-3-berrange@redhat.com>
Return-Path: anthony.perard@citrix.com
X-TUID: RKQpRL29BDso

On Mon, Dec 19, 2022 at 08:02:01AM -0500, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD
