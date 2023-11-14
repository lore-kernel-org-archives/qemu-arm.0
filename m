Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2118842ejc;
        Tue, 14 Nov 2023 07:31:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu7GZFuIX+lEO4IzZYHUyW9V7JPLpGW8X3wLqSR81xJIV2peZMlbK2ywNowTGid6LS3sWh
X-Received: by 2002:a05:6000:1887:b0:32d:d7a8:33c2 with SMTP id a7-20020a056000188700b0032dd7a833c2mr8252430wri.49.1699975862036;
        Tue, 14 Nov 2023 07:31:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699975862; cv=none;
        d=google.com; s=arc-20160816;
        b=BW8PIlckmlPwxa6HJPf/4hspxgvtRzVHSaG4XyD/cu/fpya53ACm4GmWZp+Poq5d4Y
         KRR6ZPpfxIV1RquFWkxKS13Tf8orSHPACQ0u4UbAJwY+qGmZmx2eojMP9jRskcNyZSjp
         x4TTsg+stV7W4C2KmNhaN67otOTOw5+Kz+dxMiyI06beKBjEtlFNx//jRxG6atfL88yp
         y9s/fSVpKyNYUSQbC8Y4gE/zYlqAkQM4hGHpfnwDFV4c/crLvQNwrSF5rhmWUDRcr3oj
         ltae+3H5IEO32GQfusyU5u2bwDlBjoCL7feJlV777WTcs6nP4MaxtcNiOH4UnqcokmDa
         iPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=kI8asQVhOaGuY/UltcD2EIrkJh3iOIJyA9g6wBOXluk=;
        fh=5VuFUb01VvzUekwr98DOOVLMXUGQY8GnpkXuqMr71rc=;
        b=RTqZOmVRG5TpJJvIGpCebRgtjPiz627g7GxPgXL9DUu/AVnKEohPP65g5N4FC8pmr4
         j+MGWSqxJ6HF4ToLj7pTQ2GTuY76hqn2YqkeL0UILWejvRqYwud+JQaOriWgZp8QguMz
         l0vn3hafuscEuBFvGLaeQ5mvqn2+htN/I2jhHwRTzOg17Pjw/Zr7CYO10H14C7xO7M5C
         Dt9Fg2jPNgnUkptTzhVo2claB3pxZy9faDlMP5wIpxKJHzjzA/8UefnI1h9ZBOqoBa2n
         5ckdZSWj/FgU93Twt2GKZI9ZYH4ugpLzE9dSOrnObUBy6zPB5laZVfPq3cYblqCUyWw4
         bysA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=R37YxD+2;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
Return-Path: <BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org>
Received: from desiato.infradead.org (desiato.infradead.org. [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by mx.google.com with ESMTPS id a3-20020adffac3000000b003247ca2d1f6si4579182wrs.356.2023.11.14.07.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:31:01 -0800 (PST)
Received-SPF: none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=R37YxD+2;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kI8asQVhOaGuY/UltcD2EIrkJh3iOIJyA9g6wBOXluk=; b=R37YxD+21q3rf7xOFOp0slG+f9
	+xj/jKvNgv2ak6vgeuM+oEd2TkBIrpwWMJy0gnQcercjtVz0+mTVGvTGDNWhjq4sdt8mS8vT2l7kc
	cCVXqCeU4NDM74DxDlIgJqP/GLCUxRQSTOl+PT+Z35apucO6sEy7bPEf49aVglTMc2pLE3I+kOydB
	J4App7NzjOK0V0Snxpc2LLxYHcNIJDg0zhJ6Coc8TLNESIe2d73wUUsvlMLbUNqirlTy35l/Zljmx
	PjXYgavZnBmkovcuK4k/jZK6a20DhrEPQC04p8avEnhGf2OC45ZjGUXflE0pqgHzZwBJEKOjwrhXB
	zZOQGefw==;
Received: from [31.94.7.206] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vNT-002WtI-0X;
	Tue, 14 Nov 2023 15:30:59 +0000
Date: Tue, 14 Nov 2023 10:30:48 -0500
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
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH-for-9=2E0_v2_?= =?US-ASCII?Q?09/19=5D_hw/block/xen=5Fblkif=3A?= =?US-ASCII?Q?_Align_structs_with_QEMU=5FA?= =?US-ASCII?Q?LIGNED=28=29_instead_of_=23pragma?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-10-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-10-philmd@linaro.org>
Message-ID: <292FEC54-80CC-4C17-8027-F1CB3609FDF5@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: tSbyUivq/+hh

On 14 November 2023 09:38:05 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Except imported source files, QEMU code base uses
>the QEMU_ALIGNED() macro to align its structures=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Can we have a BUILD_BUG_ON(sizeof=3D=3D) for these please?

