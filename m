Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2090603ejc;
        Tue, 14 Nov 2023 06:52:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbJLs337NEfbXljI/wGEGtrjBFz/wnwwvk8sFYVQNC6HatKPJPjQBC7cbx0YrG/l0sk+sM
X-Received: by 2002:a05:6000:222:b0:32d:819d:ec75 with SMTP id l2-20020a056000022200b0032d819dec75mr6018561wrz.60.1699973542458;
        Tue, 14 Nov 2023 06:52:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699973542; cv=none;
        d=google.com; s=arc-20160816;
        b=TuqkEyS/dovj5070Lzf+cuoby1oP8Of2tlwd5alnmrpcO9+m51pOntsEMDXxK7VKq5
         h8yo5fhew4xdj7lLoaFjwyKp1s0jLnhUdV9fEWBcWIq80wLtzDzic5eL5Wcq/Gs9+U36
         gc63ZSCyGZQGn2hjcciOcP6ydiw3B1HiN2jldyib7gEp0WNLcKdwOCEFkfPFx6Rncy/X
         0RIyxvd8TupHzPhlq8l35r2hXPIC3AfmBnLvjkQJcygHXqveOD6xQv1+KXMD5g0et525
         tOiqyyUBfe8j0Q3Q+fjGltBKHwS4UBP7qbWkhY3MyhfzLKlijvVZEblcZV3UUtFh16D5
         xxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=ICHewS3Ac/ijiK+ks360OQMk79lzoLRKl9is1vU3rIo=;
        fh=7l+2fUZ4veeachM1eTcF5T4tmHnLCGR+DiUCgWvIH8I=;
        b=VDyUflZAruR2hwC9EfN0NfIbqc57+8fTj1Djerx3PKw1Ndzhrqrsqql40npiTK5Yfj
         4dl2TWtiFij6M5pZC/qQCmwywz7YokDcdhDL8v7WbIq3KO9AZ9AH+s0hoRyZfsm8QH0W
         CY/rA8ErSOvQ2yozN1eiZAclz1HYhA4sJmrxCLL80+LsnGtXluVgYE1lTku1lF/RJWIn
         N7mkrn3dqk0HvPTOxQBIXr5e5EK0uOWW1jxRvv98ztO4QQ2pGHjqUFyn/Yt3NBHFg/FP
         Llh++JugxlI5UQybBBFYfAxLKGOrzF0styWqQ664U1MCEaUwfnRTi3qjcBrk3v2AT9zM
         XPtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b="U/CUMp0T";
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
Return-Path: <BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org>
Received: from casper.infradead.org (casper.infradead.org. [2001:8b0:10b:1236::1])
        by mx.google.com with ESMTPS id j15-20020adff00f000000b0032f7c4d874bsi4685354wro.986.2023.11.14.06.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:52:22 -0800 (PST)
Received-SPF: none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1236::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b="U/CUMp0T";
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ICHewS3Ac/ijiK+ks360OQMk79lzoLRKl9is1vU3rIo=; b=U/CUMp0TGxLvfnFsfS6JM/cNfY
	5wmBRW+E/1KIVJf20V5+jE5hpQoIcX1ntDj6CtV56TFeY35OnTNbWKI5T7TT0iusmxdyY4RQCoN6O
	8Ip7i0xzvikC5ImMhtcy/PdvZnNB5arsCne2k1TIYXV4PWFX0AcSsCK4OejpSHOklM/U3JvNlk9AJ
	xbs4LlptfNvnJtxX2h0FDT7d05kYqCiqBpVerZMMBj2s115qnRA9XGkM+p4HCMOticwQ/2VpprjWX
	iM+ol5pmxESEpBoFUrpDzg9qUko74mhma5Oy7pNE6vKjBY94rSAmlpK6Q+HDrf3aHgarnsIvOzmlR
	YMNWRmZQ==;
Received: from [12.186.190.2] (helo=[127.0.0.1])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r2um4-008XpM-3f; Tue, 14 Nov 2023 14:52:20 +0000
Date: Tue, 14 Nov 2023 09:50:06 -0500
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
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH-for-9=2E0_v2_01/19=5D_tests/avocado=3A_A?= =?US-ASCII?Q?dd_=27guest=3Axen=27_tag_to_tests_running_Xen_guest?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20231114143816.71079-2-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-2-philmd@linaro.org>
Message-ID: <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: VL1oACZQcoc1

On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>Add a tag to run all Xen-specific tests using:
>
>  $ make check-avocado AVOCADO_TAGS=3D'guest:xen'
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> tests/avocado/boot_xen=2Epy      | 3 +++
> tests/avocado/kvm_xen_guest=2Epy | 1 +
> 2 files changed, 4 insertions(+)

Those two are very different=2E One runs on Xen, the other on KVM=2E Do we=
 want to use the same tag for both?
