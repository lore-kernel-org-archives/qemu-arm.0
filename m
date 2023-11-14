Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2128067ejc;
        Tue, 14 Nov 2023 07:44:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFlBrNUUpa2Ow+Z/cCd7aGjSjKTIdYS3I4pORgKSk5R0s0y3fCbU9zu32lxL9ULaYfJbkH
X-Received: by 2002:a5d:6c61:0:b0:32d:b906:40a7 with SMTP id r1-20020a5d6c61000000b0032db90640a7mr7594897wrz.1.1699976681514;
        Tue, 14 Nov 2023 07:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699976681; cv=none;
        d=google.com; s=arc-20160816;
        b=K+35mD1AkfDy48xhPog37D/Z1YqI16Zm3nvxIHYDYyLYqC/0wFvuaUs87TGgp/6YJw
         nxQJlgK6a/430f4KNYikt5ihCk9IIATGku4isn9vEO4uZiPSq36P7rrPHgqZLomJlinw
         wsEyiqeSwWDtQxPTvzAuoLAXPGIoLTqnYkgVfEHTlJ5FkjhY20wCdP4K8Ys2OkTLbJUK
         KtWOPdReWVFqlsCig6pH4KaanfNXu2Uv7brAHErgWqWOgTRsMhQG8gl502q3CkVUXT6p
         67O03Nou7BzOKNHkpI3nJBUcwDuLasfoeYE6tcI6oXmbPl3hxjLjROyflZsSH3SZHBP0
         EVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=bYqSajk3DW7Yh+DFyVrS+kyF4H8z8qvad3x82sz2aaI=;
        fh=UGl2gZHviwJddJsIY/8G6LA++RPCZrDIc+OGig//6Ng=;
        b=vycFQYhQXqxULSd4W0yudNKnMZBcSoUwcMF8/TXpukUKlIC+hJLl8doHPdJQqhPdo/
         etDuaZ+dFjX3eCCYCJ+L1QIzWkv9IxD6qvOaCyHiNrXoJTgf/DpCDDN7m9GDZhjP1Brb
         r41fdVcDJC0RMV/3UB6PCa6s/VX3birGJGRY3bn9setbZU5ZDC5wdzujDHwh/VOW2Ak4
         efZEEF6l1c17vOxv/6iQTizlUkxvlXLexNIkIgmnD/YBlfYojrJ+CRJJiig0bgcJz7xS
         fLALJ32t+Fgyd465NN8BihXNCRWBHshyf4gPJCh6mL9tQ3iwBan7dTXNN0P5eBP9W/4G
         59dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=YqW3uEi2;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
Return-Path: <BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org>
Received: from desiato.infradead.org (desiato.infradead.org. [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by mx.google.com with ESMTPS id x3-20020a5d60c3000000b0032327b0eac2si4500049wrt.352.2023.11.14.07.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:44:41 -0800 (PST)
Received-SPF: none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=desiato.20200630 header.b=YqW3uEi2;
       spf=none (google.com: desiato.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+c0bb53cb81094deeb936+7387+infradead.org+dwmw2@desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bYqSajk3DW7Yh+DFyVrS+kyF4H8z8qvad3x82sz2aaI=; b=YqW3uEi2vQw3DjRK/dfzLFXO0i
	ol0JQCjTOY9WyrZiohnqK3oywKuX7QRJMv9c/r0/H1GhU4soKQE4pX546b0pOJe41eqPvQyMdlS9D
	JjZnUsoEflQBaPcSmVeZUNC6gFb/F/AHvBgGbG45q8dq2bY/HuxOsYSn1gkamlBDPKj5PLzkQCqDV
	uuRw94+TJstDMEwSJOdHSAZ/eg0fNDrCCSNDKnSVzYqIP5ATArH/AmuIAmdAFZxiZ3DzSlvU2j59z
	28GUp13EJ0Phexm3TkBaux2CJfoeKPQLkCZ3AuIEn5VUs5Vc0vPfWlCWlKWTyF5ofP/H+o4pxyRJK
	eLup9QTQ==;
Received: from [12.186.190.2] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r2vag-002XCO-0y;
	Tue, 14 Nov 2023 15:44:38 +0000
Date: Tue, 14 Nov 2023 10:44:30 -0500
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
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_06/19=5D_hw/pci/msi?= =?US-ASCII?Q?=3A_Restrict_xen=5Fis=5Fpirq=5Fmsi=28=29_call_to_Xen?=
User-Agent: K-9 Mail for Android
In-Reply-To: <7fd25b34-6fd9-4f7c-90b4-e44338b2b09e@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-7-philmd@linaro.org> <EEC18CA6-88F2-4F18-BDE5-5E9AAE5778A7@infradead.org> <7fd25b34-6fd9-4f7c-90b4-e44338b2b09e@linaro.org>
Message-ID: <87CD61D3-D862-45C6-9DBC-2765D747EA58@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: N5V4BLRxtZKL

On 14 November 2023 10:22:23 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>On 14/11/23 16:13, David Woodhouse wrote:
>> On 14 November 2023 09:38:02 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg> wrote:
>>> Similarly to the restriction in hw/pci/msix=2Ec (see commit
>>> e1e4bf2252 "msix: fix msix_vector_masked"), restrict the
>>> xen_is_pirq_msi() call in msi_is_masked() to Xen=2E
>>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>=20
>> Hm, we do also support the Xen abomination of snooping on MSI table wri=
tes to see if they're targeted at a Xen PIRQ, then actually unmasking the M=
SI from QEMU when the guest binds the corresponding event channel to that P=
IRQ=2E
>>=20
>> I think this is going to break in CI as kvm_xen_guest=2Epy does deliber=
ately exercise that use case, doesn't it?
>
>Hmmm I see what you mean=2E
>
>So you mentioned these checks:
>
>- host Xen accel
>- Xen accel emulated to guest via KVM host accel
>
>Maybe we need here:
>
>- guest expected to run Xen
>
>  Being (
>                Xen accel emulated to guest via KVM host accel
>	OR
>                host Xen accel
>        )
>
>If so, possibly few places incorrectly check 'xen_enabled()'
>instead of this 'xen_guest()'=2E

I think xen_is_pirq_msi() had that test built in, didn't it? Adding a 'xen=
_enabled() &&' prefix was technically redundant?=20

What's the actual problem we're trying to solve here? That we had two sepa=
rate implementations of xen_is_pirq_msi() (three if you count an empty stub=
?) which are resolved at link time and prevent you from running Xen-accel a=
nd KVM-accel VMs within the same QEMU process?

>"Xen on KVM" is a tricky case=2E=2E=2E
>
>> I deliberately *didn't* switch to testing the Xen PV net device, with a=
 comment that testing MSI and irqchip permutations was far more entertainin=
g=2E So I hope it should catch this?
>
>=C2=AF\_(=E3=83=84)_/=C2=AF

I believe that if you push your branch to a gitlab tree with the right CI =
variables defined, it'll run all the CI? And I *hope* it fails with this pa=
tch=2E It's precisely the kind of thing I was *intending* to catch with the=
 testing!
