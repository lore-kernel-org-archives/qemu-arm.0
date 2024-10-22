Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3359119njb;
        Tue, 22 Oct 2024 13:37:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:1910:b0:71e:ba5:820e with SMTP id d2e1a72fcca58-72030cd4e20mr583666b3a.27.1729629461864;
        Tue, 22 Oct 2024 13:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729629461; cv=none;
        d=google.com; s=arc-20240605;
        b=kTk5ryqP+RyBT2OL28MPKMAVsqjBNQxQDQ/eYobTGuJ4dvj7M9hn/RYxjfm+vmKbv1
         QhieYu2KmNvyAciI99PhBptuQFHbEZiebj7DwHkqYGsv+vnLmjeNJqTU7kLMjnvVkZYx
         0R4OrpkVACe05JQ0czB6a47HOBh0z5q74yhWgbEJGwhGI0gqZt9RV+/Wj0bT435wwfuh
         slhlT65olGLeGruyGtQPnLATnJsUznMro70YZPh5pvJgjQBibLh6rcCKmbiF83Y1M1fW
         xi4KqQbU6hupd4P9xu2jP9B6Ad3lI21223tnwtmMU9+9+vt/cAlufRlRRTBS4dWRO5JL
         nbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=f5sdSPp62Q75k/UPTlmS2tewvumj3hSalan6FnEOZPk=;
        fh=X8ItXK/eP+lsZpHYO2upAce6PY3lCv88NOwH1uPYlKY=;
        b=N8yOr1Sx6b9PC5dVXXZSA7GSnX5iwnaedxhtTJ9XN1P6g2XSSxCO/2bqbr923oGEUG
         /5Mh6xZ0ynILs1eKWEfZBv/8WikJrMj2h+8dc4g+0iVZadnPjuccOT/nhWlW7/xZ3Wop
         ROq48J8hltbnOUOJg9D4Y3xhGYsWvsLr6jYBOike2j11IMbWqNdb/NXOJVJvVvA/qYa4
         /xpuf6ulezLp2B/iuOISwpF/H6aUo1kg2H85axxaldq4j6XQToo2Yq/91hObZ5D8Qy2X
         TMsqRemZX0xYKc/dZ+mylA1eE3BTNpoBak16+v5fePiW0BLFFfxpS1a9h/Xd68NefS1O
         tGmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/XdiPcn";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71ec13ecce3sor3798949b3a.11.2024.10.22.13.37.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 13:37:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M/XdiPcn";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729629461; x=1730234261; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5sdSPp62Q75k/UPTlmS2tewvumj3hSalan6FnEOZPk=;
        b=M/XdiPcnk22V73CTF7MQB705jgmLHClVIIDTzWySiZH+INuS1neAJeMsO1oHa0jrFT
         G5h9L6HZfw97P/A2giSte05PYbXHJGoJHYdWpGQZD/uBvW2avv4e4ky4Q6dd86nTrqF/
         Av3lFebEFjCLBT4fGlopiJINX7z82H84pLtu73E0zdrP+3Pr0p1iVHG9fGnDfGftTUOv
         hS4G4eEc4GhHaMk92qumPAemM222DPjDOmANc1B8WSI/0bhJIgBjQAf8QVMHbe2EJTL5
         Ax7bfkm5/q3ZxkhhWtuKdrAMKkfz6m1pHYb+Z6cG/yWDYodF1RF8TAcBb4Rd+y8ov6WB
         ZCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729629461; x=1730234261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5sdSPp62Q75k/UPTlmS2tewvumj3hSalan6FnEOZPk=;
        b=iVusslVH/ML6FKfn/az/sOQ28q5gMowOzgkf15+gCfDiX+JAS23XU6PCoX7vwZVWDD
         o8PyT8f6xegMzFBW1oAOss30iR7QXollBL2dC+IVoU0S5Vyl7/V95H5hao1zoHsvd+WP
         lwVdZolJUqAZL4Yf9GGIstvnILPAHqS8DyMrAqTjfesxy2BIACxOmxP+dQr0L5b6VCX5
         MVqj9I3gmzz6y9dtI6J0nx0eL+PAySGBhco4CVUntSrf3lC9YVu7c2SrrRxj900zr7TD
         0NNuC+Ct1kmoMGjGnsDNzitnCfm4m/HA4dsC3EnoJzpT9lclv/W0UuDCYtGu7qQYJUZO
         ZK7g==
X-Gm-Message-State: AOJu0Yzt+jE0QpFr3m+TArLspgv3AV4UHPQ92pH17MbbbLOrSzQJL1Yt
	y9RJmJ15onlc/yCMnr1+bS1c8QoRLdNYYspHa0UhtH9eyly7gq6lbIXM3hOdLg2JBvIrNlOjAkF
	yVKOo1I8E
X-Google-Smtp-Source: AGHT+IHBgvymnZDA1aAIEhXx4lrpTcO5QXRmbjHef4foA8M1Uym7OgXgjk3rpWC2gUn74uJXA5Ecbw==
X-Received: by 2002:a05:6a00:8c3:b0:71e:a3:935b with SMTP id d2e1a72fcca58-72030cd2654mr594674b3a.25.1729629461420;
        Tue, 22 Oct 2024 13:37:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec141507csm5125532b3a.215.2024.10.22.13.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 13:37:41 -0700 (PDT)
Message-ID: <10600e67-2d97-4cfb-829f-34e740e47e2b@linaro.org>
Date: Tue, 22 Oct 2024 13:37:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/20] config/targets: update aarch64_be-linux-user gdb
 XML list
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 devel@lists.libvirt.org, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Zhao Liu <zhao1.liu@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-13-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241022105614.839199-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: R7l1ncDqTpAR

T24gMTAvMjIvMjQgMDM6NTYsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gQXR0ZW1wdGluZyB0
byBydW4gdGhlIGJpbmFyeSBhc3NlcnRzIHdoZW4gaXQgY2FuJ3QgZmluZCB0aGUgWE1MIGVu
dHJ5Lg0KPiBXZSBjYW4gZml4IGl0IHNvIHdlIGRvbid0IGFsdGhvdWdoIEkgc3VzcGVjdCBv
dGhlciBzdHVmZiBpcyBicm9rZW4uDQo+IA0KPiBGaXhlczogaHR0cHM6Ly9naXRsYWIuY29t
L3FlbXUtcHJvamVjdC9xZW11Ly0vaXNzdWVzLzI1ODANCj4gU2lnbmVkLW9mZi1ieTogQWxl
eCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4gICBjb25maWdz
L3RhcmdldHMvYWFyY2g2NF9iZS1saW51eC11c2VyLm1hayB8IDIgKy0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9jb25maWdzL3RhcmdldHMvYWFyY2g2NF9iZS1saW51eC11c2VyLm1hayBiL2NvbmZp
Z3MvdGFyZ2V0cy9hYXJjaDY0X2JlLWxpbnV4LXVzZXIubWFrDQo+IGluZGV4IDc3OGQyMmIy
YTkuLmRjZWY1OTdhODAgMTAwNjQ0DQo+IC0tLSBhL2NvbmZpZ3MvdGFyZ2V0cy9hYXJjaDY0
X2JlLWxpbnV4LXVzZXIubWFrDQo+ICsrKyBiL2NvbmZpZ3MvdGFyZ2V0cy9hYXJjaDY0X2Jl
LWxpbnV4LXVzZXIubWFrDQo+IEBAIC0xLDcgKzEsNyBAQA0KPiAgIFRBUkdFVF9BUkNIPWFh
cmNoNjQNCj4gICBUQVJHRVRfQkFTRV9BUkNIPWFybQ0KPiAgIFRBUkdFVF9CSUdfRU5ESUFO
PXkNCj4gLVRBUkdFVF9YTUxfRklMRVM9IGdkYi14bWwvYWFyY2g2NC1jb3JlLnhtbCBnZGIt
eG1sL2FhcmNoNjQtZnB1LnhtbCBnZGIteG1sL2FhcmNoNjQtcGF1dGgueG1sDQo+ICtUQVJH
RVRfWE1MX0ZJTEVTPSBnZGIteG1sL2FhcmNoNjQtY29yZS54bWwgZ2RiLXhtbC9hYXJjaDY0
LWZwdS54bWwgZ2RiLXhtbC9hYXJjaDY0LXBhdXRoLnhtbCBnZGIteG1sL2FhcmNoNjQtbXRl
LnhtbA0KPiAgIFRBUkdFVF9IQVNfQkZMVD15DQo+ICAgQ09ORklHX1NFTUlIT1NUSU5HPXkN
Cj4gICBDT05GSUdfQVJNX0NPTVBBVElCTEVfU0VNSUhPU1RJTkc9eQ0KDQpSZXZpZXdlZC1i
eTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0K
