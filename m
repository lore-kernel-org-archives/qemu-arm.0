Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2111239ejc;
        Tue, 14 Nov 2023 07:20:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCZd3LVXVBfiiKZ47oek+l9YJr+6is5km96RZr83XrBJlZeRSUsUG5GJPnk9FSFfrrNvZB
X-Received: by 2002:a05:600c:4689:b0:406:53f1:d629 with SMTP id p9-20020a05600c468900b0040653f1d629mr7848587wmo.5.1699975201125;
        Tue, 14 Nov 2023 07:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699975201; cv=none;
        d=google.com; s=arc-20160816;
        b=KwNht/ThYQVWJqwQj0LtRD/QtLXCu/NMXGiuWIac84/BFgG4fx8JztgnOqQbdsdjzV
         gz+r7FttZcA+6DMeHApBgYfdgzKdc3XPO5MDac+H5wpfWtEp+oknvmha62vWR3nhNGNF
         /ucQQONdhyO5exLQpcEUj3LbIm2At5djseZLccu4QSdp2UycDbVfbZG8tde+tEiKFH8N
         govUEEHXhLF/stuFaID9FhY5wcojOsEnEv7EibvXm42SaCfQV1qtkUag/KaVFUPWOgkU
         7nCSSaGVtq+F1OJSqmVKY9TvpC9rO9RHfem35GwtbU7zYH7cTGzNdWcMlfATQdE648bu
         T1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=8oHKIB2Z25t55M8rg997hmml2qBzYjJja9p3MLoID9Q=;
        fh=7l+2fUZ4veeachM1eTcF5T4tmHnLCGR+DiUCgWvIH8I=;
        b=ouE4NLEiKh3hpGJcCrRA08psKILG57IUHHdQdDZsg4entq79yyvn+Q0bYsEPoj/VC4
         tp2hmAhCzq1joXdS69JDtpjuWw9o0W8uWgYNJwHKOdMw6Y8HufDcCjyxMdP2miPtCBEu
         ZG+Hy0SpVb8Cz+PqmnPBgl1+POvcYFhiStwIemeMqW3GU+I1mP+msLsq5cySkoaAWj4u
         0C7of58eyxMod+HZJezwJTz0ivQGhYjhVXfOmcHEf9qTUXlpD2+SAYJIAOXZFe5pMuMG
         /O/GAsXRIQQAOaZaez5LeS3mAuEKkjpktVtOctfdxS2UrJ2nIerdBMjN20gJPH9wHPtT
         a4AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=MGoU06Rd;
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
Return-Path: <BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org>
Received: from casper.infradead.org (casper.infradead.org. [2001:8b0:10b:1236::1])
        by mx.google.com with ESMTPS id r18-20020a05600c35d200b003fbef8ad8f5si4904265wmq.40.2023.11.14.07.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:20:01 -0800 (PST)
Received-SPF: none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) client-ip=2001:8b0:10b:1236::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@infradead.org header.s=casper.20170209 header.b=MGoU06Rd;
       spf=none (google.com: casper.srs.infradead.org does not designate permitted sender hosts) smtp.mailfrom=BATV+a8e905033730cff805ca+7387+infradead.org+dwmw2@casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8oHKIB2Z25t55M8rg997hmml2qBzYjJja9p3MLoID9Q=; b=MGoU06Rd2CU4tijjS4zit7AS2o
	EK5W2DNxSaap5vdRgr4lcPo4zGcIOq4atxzna3eoqsGisnNIWyNGw93pjsrw6oaP0WFFFgVLYBQZz
	ClKfV7KrSJ1t1EoRo2xxMOh1jnYJshbl0jbHkjAa9cxj5rwxiL2k2+h7xbdzuUF4pLtlgUmOSkME0
	Uq+kwwckEVCRyY9c0wqtGkbt3pl09tWIQNEMt3G1DMKTQtlMxIhdejhXq5Fe0Y7D6jA34FrWF434P
	xU+RMJD/6Br8s11hd/K1O0XHW4bEY9r2voia+3nEj2IVrY/SvDOKzxr05FZJRtBMRX8gdRMisqfgH
	oej8JDZQ==;
Received: from [12.186.190.2] (helo=[127.0.0.1])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r2vCn-008fhY-Fa; Tue, 14 Nov 2023 15:19:57 +0000
Date: Tue, 14 Nov 2023 10:19:51 -0500
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
In-Reply-To: <04917b57-d778-41a2-b320-c8c0afbe9ffb@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org> <20231114143816.71079-2-philmd@linaro.org> <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org> <407f32ee-e489-4c05-9c3d-fa6c29bb1d99@linaro.org> <074BCACF-C8D0-440A-A805-CDB0DB21C416@infradead.org> <04917b57-d778-41a2-b320-c8c0afbe9ffb@linaro.org>
Message-ID: <37D11113-662D-49FD-B1F1-757217EAFEEA@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-TUID: 5fnK3j0d8Uyu

On 14 November 2023 10:13:14 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg> wrote:
>On 14/11/23 16:08, David Woodhouse wrote:
>> On 14 November 2023 10:00:09 GMT-05:00, "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg> wrote:
>>> On 14/11/23 15:50, David Woodhouse wrote:
>>>> On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg> wrote:
>>>>> Add a tag to run all Xen-specific tests using:
>>>>>=20
>>>>>    $ make check-avocado AVOCADO_TAGS=3D'guest:xen'
>>>>>=20
>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>>>> ---
>>>>> tests/avocado/boot_xen=2Epy      | 3 +++
>>>>> tests/avocado/kvm_xen_guest=2Epy | 1 +
>>>>> 2 files changed, 4 insertions(+)
>>>>=20
>>>> Those two are very different=2E One runs on Xen, the other on KVM=2E =
Do we want to use the same tag for both?
>>>=20
>>> My understanding is,
>>> - boot_xen=2Epy runs Xen on TCG
>>> - kvm_xen_guest=2Epy runs Xen on KVM
>>> so both runs Xen guests=2E
>>=20
>> Does boot_xen=2Epy actually boot *Xen*? And presumably at least one Xen=
 guest *within* Xen?
>
>I'll let Alex confirm, but yes, I expect Xen guest within Xen guest withi=
n TCG=2E So the tags "accel:tcg" (already present) and "guest:xen"=2E
>
>> kvm_xen_guest=2Epy boots a "Xen guest" under KVM directly without any r=
eal Xen being present=2E It's *emulating* Xen=2E
>
>Yes, so the tag "guest:xen" is correct=2E
>
>> They do both run Xen guests (or at least guests which use Xen hypercall=
s and *think* they're running under Xen)=2E But is that the important class=
ification for lumping them together?
>
>The idea of AVOCADO_TAGS is to restrict testing to what you want to cover=
=2E So here this allow running 'anything that can run Xen guest'
>in a single command, for example it is handy on my macOS aarch64 host=2E

Ok, that makes sense then=2E Thanks for your patience=2E

Reviewed-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
