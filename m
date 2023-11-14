Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2107171ejc;
        Tue, 14 Nov 2023 07:14:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFD6u2YAKDddapTtdCC1tcUOerOTYg90e0hWXbwPvJsdzltSpR6qGeQ1nvlJMIzIvjP24po
X-Received: by 2002:adf:ecc9:0:b0:32d:baf4:e572 with SMTP id s9-20020adfecc9000000b0032dbaf4e572mr6587203wro.23.1699974858537;
        Tue, 14 Nov 2023 07:14:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699974858; cv=none;
        d=google.com; s=arc-20160816;
        b=h+7bLwlSI4g82okj+j6bcxn0sohnV6rA1UuPkJ+uaqm37mp/znmAYkIKGhefR4VO9z
         K5AmQaFSGspK4xDQAuxGPgjiEJl6TNpxFn8rKUbmta+H9FME2VOrcjFNAg2wYNUW51kt
         FfDGvTUwOqPJoptvmGUo3kxnDvS6Bbw405KXrzmCzThXVr2wLWbpdCA4enhpkMIdtZmZ
         Zc0C2tnTL5rStLN9Z+7Ey2ZMmqoV7WxMs4ZLiJ7eT4rW89JRTRhFlbOWrGiF5+Km/I3U
         1iW95anqFn5jiKE1FOZN0lYgQ2zjUlE6fv4jcNxU1bCNiwLCQuws+MEgNkNww64CM285
         7NHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=zLWRl6fuh+QlAq2JcSTCgSqOD3rW63ZP4Laj6regjn0=;
        fh=UGl2gZHviwJddJsIY/8G6LA++RPCZrDIc+OGig//6Ng=;
        b=hk5JJpqX6wT7vbBY+DEZDIQPiuT10GqA/kMXfJNGWmhkCKx44Mmmt2bBoMNmY/V4Gj
         ei1ptSdNHOQGvdrvjx9pfOnZTd5o1lHaINcWv7MJScnTGTkANcXMAno5JgQO2WOK3+Hm
         +Z5O8FkF2tPlnUaISYh1PALff9JXGvtHyQUpmlhYjWizcIc72WBz9tfSDvej4TUhtRBG
         EiLtPyA72vmWKVVFuC+yJ5M36+7bNkr8p0uYEhpZo4gcxGyfkrSB2rpMmMB527oUMbn3
         CMpmcb6MmNLzMJNV5Nes5tDE9MNKCKE60GvfCFykRoS2EnBSrtAwUYYlhhS/d8RVmqF5
         kNGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=CDbCkxBO;
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
Return-Path: <BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org>
Received: from casper.infradead.org (casper.infradead.org. [2001:8b0:10b:1236::1])
        by mx.google.com with ESMTPS id co18-20020a0560000a1200b0032f7d67baf8si4936956wrb.1057.2023.11.14.07.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:14:18 -0800 (PST)
Received-SPF: none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1236::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=CDbCkxBO;
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=zLWRl6fuh+QlAq2JcSTCgSqOD3rW63ZP4Laj6regjn0=; b=CDbCkxBOGqoE0okEs41cvDk5fY
	avC36PbcnvrY2oGlWB+RQPF4liPIPZGR3EmI5Av83WCkoqFq/6JecFkFY7vUWsvo7/8BmYzi44D1g
	Ws5geOrtzOEM5Q+9dgkqYhjuO8CCj0m7FwKXRyGH/otFSxezkrYf7thCJcuan3UovTroWWy1VVTp0
	pnd+C2RYiX9iD91nqIjI4v94iVedb61DZAmiijnR8rGW40PapOik1v9uw6WmF0h27udRo7vUsUI+/
	CdQBeD4lSkTeDsX/DqpzXtj+VzppGTN+wtPUM4BmDuIgnKf9HDMxmYUNaj5vpn46oYHJTmkvPF/K5
	uuDkjPBA==;
Received: from [12.186.190.2] (helo=[127.0.0.1])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r2v73-008dEf-2f; Tue, 14 Nov 2023 15:14:01 +0000
Date: Tue, 14 Nov 2023 10:13:58 -0500
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
In-Reply-To: <20231114143816.71079-7-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-7-philmd@linaro.org>
Message-ID: <EEC18CA6-88F2-4F18-BDE5-5E9AAE5778A7@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: qSylvsCUrWx7

On 14 November 2023 09:38:02 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Similarly to the restriction in hw/pci/msix=2Ec (see commit
>e1e4bf2252 "msix: fix msix_vector_masked"), restrict the
>xen_is_pirq_msi() call in msi_is_masked() to Xen=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

Hm, we do also support the Xen abomination of snooping on MSI table writes=
 to see if they're targeted at a Xen PIRQ, then actually unmasking the MSI =
from QEMU when the guest binds the corresponding event channel to that PIRQ=
=2E

I think this is going to break in CI as kvm_xen_guest=2Epy does deliberate=
ly exercise that use case, doesn't it?

I deliberately *didn't* switch to testing the Xen PV net device, with a co=
mment that testing MSI and irqchip permutations was far more entertaining=
=2E So I hope it should catch this?
