Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1513448njc;
        Sun, 23 Mar 2025 10:32:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHvitOaxzyG88M/Fbc2+dSOkHnVYWIK3ZT/hxQye6NJL2NGxPpEGGXdRZXadVb3UVITGL7+dJZrXYOQw==@linaro.org
X-Received: by 2002:a17:90a:d008:b0:2fe:b735:87da with SMTP id 98e67ed59e1d1-3030fd621b8mr21376135a91.0.1742751147843;
        Sun, 23 Mar 2025 10:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742751147; cv=none;
        d=google.com; s=arc-20240605;
        b=QkDwMuxMHlrNPdMjMz/STg3nd8Sp1EXAUti/guh2sJwdhGqrRbVJcdD9sSan2hdgwR
         VrzqATGRrY75rzm4R79w0akoE48khQbpQdkARPDALlHbejPUmwdBDHMG/Opv8diGFKMB
         /sDgcFj5X4T6DrCuFQHDGH9UeuXfg/zV158nFrEv0XaZj0St5SNgbe0RC2IpVjogBr1s
         VTDm+rs+LXF6KESjzPIhPyzfcJIJTarnwhGY+3BHqPQ3Z512TfhOe6lM4nwTSngy6qA/
         M8Fhp+BzBGh8Ly9b5mK8KioJBqLul7RR+CRY3qstqb6kFXc+Rh4553B/Mugkg/Fbq+NL
         gxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QN0GHYm7ARKHsVaSIzGzewxESAN/2OxGoKlMgVhc8Ig=;
        fh=Og9PRza5Z/lyAQvC9RUEq3do83fEc2mpi7livOimauI=;
        b=UO2uFLN2Zne0hLHCW+wk0ABK4bHe2nsLbS1NX37c3z/XF63qOSB6KXTFTrUY3t+KPy
         gU7QBLtV0hIjNwmbh6YtJau4+pO3qebD4inhJ/285Ly2oKHnyRpFEL+t1qQJE6AriEnS
         2cjSqn2iWAKGz1OWihs2RYmQcFoFVHl40fC+Us5AgFlWF6Hay5bA8ejE97VFF/YdWDuL
         Np0u3wgIBClSAgzVEcGb0WIdsBob+eXMCahvxA3vzdZ8MeSfvPhfp3scO2treyUpH6hl
         CzlIzKDIJlDrzW9ZcpGyq3PkEENeaRE1QFKIHumBNVEHejr2D4KRjuSn7AqDONSig8va
         zXdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1xLnYch;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811dd59asor45089145ad.16.2025.03.23.10.32.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Mar 2025 10:32:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y1xLnYch;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742751147; x=1743355947; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QN0GHYm7ARKHsVaSIzGzewxESAN/2OxGoKlMgVhc8Ig=;
        b=Y1xLnYchyV1JRj8cWyVtsl4d9Y0+tqHFOHUdd1omcUlhsleTaD0N/C6ixBnAuKtBMc
         ix+qHoF8OExrCJ3FpUR/W2zasaJTn1yeideMKdR1B7Hj59cxLWwfm0Oq5hL3rmJdP4FG
         cFgU4EX6vXxOP3P86UZ/BqK3nO8+sJvioaFT0lfy+fDT+2WyM+GkkxlAdUYfcotsw98Y
         EqCBShEmWUqX1pnU9iVVR792cjpa2ibSqfYUF3j8HEpNM78Gp1MMPAm+o3I4ij9vcKb4
         VMuPH3QtR5yz9ZFyx5yUVawOMaEdWxuue6LwaxRvEtcaSwUOsZ3WABHEHisXFv0sXF//
         fwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742751147; x=1743355947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QN0GHYm7ARKHsVaSIzGzewxESAN/2OxGoKlMgVhc8Ig=;
        b=RBOofnvxJ70FYJ2yk+/2kjdd7sirL0B+6N15Sk9CaK0jBhvVRA+BYpIYadUxl668+9
         i5qz93xB2+yMJJvp3X8qCu02vSYZLv7fF4IEFU21S7DXyuL4KaZ0LL5sCdrOjXqJlcyC
         FqHTlS+dsmdGs80C6DMA6enbpnFrIwzIq46bjiYLTBnd8W3phXEZ9POhp+AKrox4C0Tr
         cadjoZysqR4Izy2tv/vVNLn9IxcpIaBAqqxUpVjrAlS4WybzuJJuHAJgLZjjIqPCPpGt
         TiJq0ca1mwUFXkQ2WTBQMGcbrdAwu9ROK84FJSbeokcTZvqYpooSgM9WH3CgPLWguPlV
         3b9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVp+/RVcUGaPhIKL3t6OV8Gj5Gdw3DVsGthNdAOX+QsdTgcONTRl98YVdpMTilg4ekr8BjMlFsQe+RUig==@linaro.org
X-Gm-Message-State: AOJu0Yx0QYwzlEoIQcAge9vtwRvL0jKzlBctP8WTi0gRxEFx2yOe5lx3
	T53KusukKn24PfDr/YZV4l2/lCZb0IUpK8S81yIeYJ/uyfl2nGci66ext15jm9+Fkw==
X-Gm-Gg: ASbGncsL0GJZ0Rvfm8QG1eFXccO0cVKL0FoUbiCxrhTkAnDr9shu1svlU4iUnA4W9Mv
	aT4PiteM+hiuoVGNYOV+mQTW1Me8XBlchwn0nkgtfihOgGn1kWC7fIonhG6sQbv/qUk5TVTvICQ
	OLWz293baZxLyyH1+1C9V2iiu0a6E0uJ4b2WtAsFFQggkOWxWPOo0VcIVouWZLvzAKddgR52qOl
	AYrgZy7BQuPLghcSQ1TfHQv0hq2+fi1iQZGwORY0NLVPKg9/yyxqrLC8VB/6R+lYt6e43rx95uL
	0AHVYJGUpOeFf0eEEqsyl3FpHJD5QajOsAOvAu926nyb61tn4pE3ttS2zA==
X-Google-Smtp-Source: AGHT+IGwnwcaX2ssWP0FvqI3mw/RLSqk3B8/HVXK8zY51t0taTc5yPC+uD4q61HWQx+YrwuvWBwFzA==
X-Received: by 2002:a17:902:c411:b0:224:1ec0:8a1a with SMTP id d9443c01a7336-22780e1a8demr154590515ad.51.1742751147223;
        Sun, 23 Mar 2025 10:32:27 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5d4f0asm6273658a91.17.2025.03.23.10.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 10:32:26 -0700 (PDT)
Message-ID: <4dd676bf-3b33-42cb-8054-3e06e3ac656a@linaro.org>
Date: Sun, 23 Mar 2025 10:32:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] gdbstub: conversion to runtime endianess helpers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <0bc36324-4fb7-41ee-a9f1-3a7de4ad7fa4@linaro.org>
 <87a59eli7m.fsf@draig.linaro.org>
 <3e1c7b60-18cf-4ca6-b853-02203954fc3a@linaro.org>
 <8b8bf1e1-ebcb-4779-ab09-c208da910630@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <8b8bf1e1-ebcb-4779-ab09-c208da910630@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: YsXwLlztVE8A

T24gMy8yMy8yNSAwODo0MSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDIxLzMvMjUgMTg6MzEsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+Pg0KPj4gQWRkaW5n
IHByb3BlciBmdW5jdGlvbnMgZGVmaW5pdGlvbiBpbnN0ZWFkIG9mIG1hY3JvcywgYW5kIGVs
aW1pbmF0aW5nDQo+PiBpZmRlZnMgaXMgbm90IHJlYWxseSBib2lsZXJwbGF0ZS4NCj4gDQo+
IEluIGFub3RoZXIgdGhyZWFkIFJpY2hhcmQgc2FpZCBmb3IgdGhlc2UgY2FzZXMgd2Ugc2hv
dWxkIHVzZSBfR2VuZXJpYygpDQo+IG1vcmUuDQo+IA0KDQpJIHdhcyB0aGlua2luZyBhYm91
dCBzdWdnZXN0aW5nIGl0IHdoZW4gSSBmaXJzdCBhbnN3ZXJlZCBvbiB0aGlzIHRocmVhZC4g
DQpIb3dldmVyLCBJIHJlYWxpemVkIGl0IGRvZXNuJ3QgcmVhbGx5IGhlbHAgdXMgdG93YXJk
cyBvdXIgZW5kIGdvYWwgdG8gDQp1bmlmeSB2YXJpYW50cyBvZiBhIGNvbXBpbGF0aW9uIHVu
aXQuDQoNCl9HZW5lcmljIGlzIGp1c3QgYSB3YXkgdG8gaGF2ZSBhIGNvbXBpbGUgdGltZQ0K
c3dpdGNoKHR5cGVvZih4KSkgew0KICAgY2FzZSB0eXBlX2E6IC4uLg0KICAgY2FzZSB0eXBl
X2I6IC4uLg0KfQ0KDQpUaGlzIGlzLCBpbiBzb21lIHdheXMsIHdoYXQgb3VyIGV4aXN0aW5n
IG1hY3JvcyBkbyBoZXJlLCBiYXNlZCBvbiANClRBUkdFVF9MT05HX0JJVFMuIFNvbWUgQyBj
b21waWxlcnMgdGFyZ2V0dGluZyBlbWJlZGRlZCBzeXN0ZW1zIHN1cHBvcnQgDQpzaXplb2Yg
b24gaW50ZWdyYWwgdHlwZXMgaW4gdGhlIHByZXByb2Nlc3NvciB0byBzdXBwb3J0IHRoaXMg
a2luZCBvZiANCmNhc2UgYmVmb3JlIF9HZW5lcmljIGV4aXN0ZWQuDQoNCkl0IGNhbiByZXBs
YWNlIG1hY3JvcyBiYXNlZCBvbiBzdGF0aWMgdHlwZXMsIGJ1dCBpdCBkb2Vzbid0IG1ha2Ug
bXVjaCANCm1vcmUgdG93YXJkcyBlbGltaW5hdGluZyB0YXJnZXQgdHlwZSBkZXBlbmRlbmN5
Lg0KDQpJdCBjb3VsZCBzdGlsbCBiZSB1c2VkIGhlcmUgdGhvdWdoLCB0byBhdm9pZCB0aGUg
bmVlZCB0byBwYXRjaCBhbGwgDQp0YXJnZXRzIHVzaW5nIGdkYiByZWdpc3RlciBtYWNyb3Ms
IHRoYXQgYWxyZWFkeSB1c2VkIGZpeGVkIHR5cGVzLg0KDQpCdXQgc2luY2Ugb3VyIGxpc3Qg
b2YgY2FsbCBzaXRlcyBpcyBub3Qgc28gaHVnZSwgSSB3b3VsZCBiZSBpbiBmYXZvciB0byAN
CmZpeCB0aGUgY29kZSBkaXJlY3RseSwgaW5zdGVhZCBvZiByZWx5aW5nIG9uIF9HZW5lcmlj
LiBCdXQgSSdtIG9wZW4gdG8gDQp0aGF0IGlmIHdlIGNvbGxlY3RpdmVseSB0aGluayBpdCdz
IGEgYmV0dGVyIHdheS4NCg0KPj4gQWRkaW5nIGNhc3RzIHRvIGxvb3NlbiB0eXBlIHN5c3Rl
bSBpcyBub3QgYSB3aW4gdmVyc3VzIHRoYXQuDQo+IA0KPiBBZ3JlZWQuDQoNCg==
