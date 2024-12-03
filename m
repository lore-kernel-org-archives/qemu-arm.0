Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3963280njk;
        Tue, 3 Dec 2024 11:37:06 -0800 (PST)
X-Received: by 2002:a05:6a20:8426:b0:1db:e3a2:ea47 with SMTP id adf61e73a8af0-1e1653b95d8mr5245768637.14.1733254626076;
        Tue, 03 Dec 2024 11:37:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733254626; cv=none;
        d=google.com; s=arc-20240605;
        b=H5SzNtxIjzWTAxAuIonAGIashZbBcL/auoIDRRbluBuKkpwDW+tMKTM7P8v1JD9c99
         ERHnEoRuCfd+6tjQXmvvigEDiD8ftIU+HQuAhBla+VMzG+TvQPntvGzapeXUy+dPc8VZ
         4KbQZPTfeOvi8WGUW+SNKPBmRRzH3ZCqd7ijRqjOd/DAOoXUpJ7NVbjnxT13ahmrpNSV
         K29CwI3Kr2nWNoyjwfgNYpRFv1zgibL7T8Eh5v7p4qjW67JjCJ4ubvoJa/p3tG5c4yZZ
         /NISggNqExaGggKjV6hoHy40zh10DBn4ypgulki7Mwfe6HtY19l5H+MKg4aD+BquE5tA
         fR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Pb8a5IwBeghZqzjXLfbY9pB3bbFhIIwjqTPBLorbw1A=;
        fh=ApajURxjkguju9JaTfxeXBhRNXjoxpuzjR8K2nvN4eI=;
        b=YRwpP+Cowgog4DgLac58p+EgdMxcN1pTZewg3VtSRi5ApuZALuQZk0LOGabiydfjfi
         kAzuL7PQ+x9X4O4su1VsrNA1hZd2J5WGl2+IdtrZVi+JmUb5AiLPPXJFENBg0nhijbWP
         R4boK6644gehBw23kTTI+vMrG9M8cwERfoMZgniwbNX3KS+8UJkh+6eYDkXCycljBWOI
         8ROx0aYNcSRIYbFZeOh7qDLr1K03EqGFELtPkqDJsYUxui2dqgPiJVCzOkq0TguDDEp1
         OrjHgyIWivGsWFIMtF0+kUsFQr8xC6yJ2AzVOHh8L1ltof1Xc/P+aWL9cjETPxe1ETAn
         PNwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KjKP79XX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7fc9c30fd5bsor8514801a12.4.2024.12.03.11.37.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 11:37:06 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KjKP79XX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733254625; x=1733859425; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pb8a5IwBeghZqzjXLfbY9pB3bbFhIIwjqTPBLorbw1A=;
        b=KjKP79XXAquB7cKUyNHt3V9nRg1O2ILSEpwllJT2aMaW7jMAJKzvUZcJdG3T4b7hKf
         YR5o3TjP5jeplFTUeGJ/iEPvO2cclhafGZ2Na8y2Bxj9bESWl7sWyvHgzzepJd3AMJzD
         CvIUC7nHiS60ov/ZoXE6OXonI3H79WEI9LJFmNqGaL36I8iZ+HZPywdP+sWVJcDt0iFC
         fu4BxIGxxQ+A0tCJ27mDgxMUW2ZUv29vxjV1Vlwlvqcz6Z+HFgeYymY0og0LUXXT/x9F
         elioLeCQqAj/aw5BZIH0Y4x11D4H0zb13h3q2gqboJshHITJ6SRp1rzEWQcfNT6wJW3U
         fYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733254625; x=1733859425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pb8a5IwBeghZqzjXLfbY9pB3bbFhIIwjqTPBLorbw1A=;
        b=dUfYFUCVzqWWFxYrR6Rt0at0uPEyseovzb6vDaeFSuvYDGuOg4QZjDpiNASPX3L7O1
         lgc69P/JHOZEZo8TyKk+sSq4tFaNM0Eiof2hD/+eiNuvA0cGeEXrencSAn9qy3QMg6/t
         YDAxxkeYXCpyHOCTr/2lPboZ/QMN2ZoAi2hCqOMT8ScG4dfYGXvv4lacH04EqaHHumlt
         10kafKrlQk5hpQdsP/frQd4dT1y/anj+9pkSMAww+iB7BwYjr86o18bXVsKb1rTXyUR8
         RKBbdPt7QbGYH/zqkARgcouBMSlUd8xCg0qlmi6mKVTqawLUdxKz2xWynMqZ2JKLlGaI
         ACLA==
X-Gm-Message-State: AOJu0YyF9pDB/wiLPILMxZWX7Ab3p721eZmiFZw3oIpFygDUe4yCMFlU
	W9BNSBHqLi15v9b8PDtwejs/ADthRtVHWGnndOg++u9h7oyPNqgIR8Go33e6UR98K88AKylZ+Pb
	pG4ad7sh7
X-Gm-Gg: ASbGncuZQmP0RCZ3EmCGpDtAOPQON1YZ0KJgQ6JwiMMT4fAmxgAUi7tD2W5WOkYd0gi
	yy5KH6nKqNTKn04MFMax+K85kjDq5fvUaguHPGLMixdf0/FJwak5gLy+ZorfKp4zjedjZG1pi/g
	LfBRx8UvtMtNTJikBLa+XMr0N3Up/E3Q2PtgmVbl3QqqsNURmkaa8MSTZvWfhuMzPVPWMV576vl
	HPYTxKX8shebmqmANRWE1UCKWe49VPn8fJntpb5TjlfI/i6KmC2wHZ98tsNMyvBttRiBaNpP6PF
	vE7ayyooauc9gsgHIIYTVQ==
X-Google-Smtp-Source: AGHT+IFlwe7xaxPr0ocE/L2TmmL6VY8/U+WOkCjJamNBezJeL3NlJsQ7wWktyE7+A+WKJH1n8+/VIA==
X-Received: by 2002:a05:6a20:72a1:b0:1db:e508:cf68 with SMTP id adf61e73a8af0-1e1653c8392mr4988756637.24.1733254625607;
        Tue, 03 Dec 2024 11:37:05 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417725e9sm10824148b3a.80.2024.12.03.11.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 11:37:05 -0800 (PST)
Message-ID: <29b57af5-2fdb-4f5d-9dee-2be271767025@linaro.org>
Date: Tue, 3 Dec 2024 11:37:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] docs: add a glossary
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-7-pierrick.bouvier@linaro.org>
 <CAFEAcA9JdLxi5cr-Z2-YX6Q8nv=j0O3k=f9u6gS-CzSf5BH7Ug@mail.gmail.com>
 <87ttbkbpsr.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87ttbkbpsr.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: cdfSiRwwvrcu

T24gMTIvMy8yNCAxMDoxMCwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQZXRlciBNYXlkZWxs
IDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiBNb24sIDE4
IE5vdiAyMDI0IGF0IDE3OjI0LCBQaWVycmljayBCb3V2aWVyDQo+PiA8cGllcnJpY2suYm91
dmllckBsaW5hcm8ub3JnPiB3cm90ZToNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJy
aWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+PiAtLS0NCj4+
PiAgIGRvY3MvZGV2ZWwvY29udHJvbC1mbG93LWludGVncml0eS5yc3QgfCAgIDIgKw0KPj4+
ICAgZG9jcy9kZXZlbC9tdWx0aS10aHJlYWQtdGNnLnJzdCAgICAgICB8ICAgMiArDQo+Pj4g
ICBkb2NzL2dsb3NzYXJ5L2luZGV4LnJzdCAgICAgICAgICAgICAgIHwgMjM4ICsrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+Pj4gICBkb2NzL2luZGV4LnJzdCAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsNCj4+PiAgIGRvY3Mvc3lzdGVtL2FybS92aXJ0LnJzdCAgICAg
ICAgICAgICAgfCAgIDIgKw0KPj4+ICAgZG9jcy9zeXN0ZW0vaW1hZ2VzLnJzdCAgICAgICAg
ICAgICAgICB8ICAgMiArDQo+Pj4gICBkb2NzL3Rvb2xzL3FlbXUtbmJkLnJzdCAgICAgICAg
ICAgICAgIHwgICAyICsNCj4+PiAgIDcgZmlsZXMgY2hhbmdlZCwgMjQ5IGluc2VydGlvbnMo
KykNCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2dsb3NzYXJ5L2luZGV4LnJzdA0K
Pj4NCj4+IEkgdGhpbmsgdGhpcyBpcyBhIGdvb2QgaWRlYTsgd2UndmUgaGFkIGF0IGxlYXN0
IG9uZSBidWcNCj4+IHJlcG9ydCBmcm9tIGEgdXNlciBwb2ludGluZyBvdXQgdGhhdCB3ZSBo
YWQgYSB0ZXJtIGluDQo+PiBvdXIgZG9jcyB3aGljaCB3ZSBkaWRuJ3QgZGVmaW5lICgiYmxv
Y2sgZHJpdmVyIik6DQo+PiBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUv
LS9pc3N1ZXMvMjYxMQ0KPj4gSSBoYXZlIHNvbWUgY29tbWVudHMgb24gc3BlY2lmaWMgZW50
cmllcyBiZWxvdy4NCj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvZGV2ZWwvY29udHJvbC1m
bG93LWludGVncml0eS5yc3QgYi9kb2NzL2RldmVsL2NvbnRyb2wtZmxvdy1pbnRlZ3JpdHku
cnN0DQo+Pj4gaW5kZXggZTZiNzNhNGZlMWEuLjNkNTcwMmZhNGNjIDEwMDY0NA0KPj4+IC0t
LSBhL2RvY3MvZGV2ZWwvY29udHJvbC1mbG93LWludGVncml0eS5yc3QNCj4gPHNuaXA+DQo+
Pj4gKw0KPj4+ICtEZXZpY2UNCj4+PiArLS0tLS0tDQo+Pj4gKw0KPj4+ICtRRU1VIGlzIGFi
bGUgdG8gZW11bGF0ZSBhIENQVSwgYW5kIGFsbCB0aGUgaGFyZHdhcmUgaW50ZXJhY3Rpbmcg
d2l0aCBpdCwNCj4+PiAraW5jbHVkaW5nIG1hbnkgZGV2aWNlcy4gV2hlbiBRRU1VIHJ1bnMg
YSB2aXJ0dWFsIG1hY2hpbmUgdXNpbmcgYSBoYXJkd2FyZS1iYXNlZA0KPj4+ICthY2NlbGVy
YXRvciwgaXQgaXMgcmVzcG9uc2libGUgZm9yIGVtdWxhdGluZywgdXNpbmcgc29mdHdhcmUs
IGFsbCBkZXZpY2VzLg0KPj4NCj4+IFRoaXMgZGVmaW5pdGlvbiBkb2Vzbid0IGFjdHVhbGx5
IGRlZmluZSB3aGF0IGEgZGV2aWNlIGlzIDotKQ0KPiANCj4gQWxzbyB3ZSBjYW4geHJlZiB0
bzoNCj4gDQo+ICAgIGh0dHBzOi8vcWVtdS5yZWFkdGhlZG9jcy5pby9lbi92OS4xLjAvc3lz
dGVtL2RldmljZS1lbXVsYXRpb24uaHRtbA0KPiANCj4gd2hlcmUgd2UgZ28gaW50byBhIGJp
dCBtb3JlIGRldGFpbCBhYm91dCB3aGF0IGEgZGV2aWNlLCBidXMsIGZyb250ZW5kDQo+IGFu
ZCBiYWNrZW5kIGFyZS4NCj4gDQoNCkdvb2QgcG9pbnQsIEknbGwgYWRkIGl0Lg0KDQo+Pg0K
Pj4+ICsNCj4+PiArRURLMg0KPj4+ICstLS0tDQo+Pj4gKw0KPj4+ICtFREsyLCBhcyBrbm93
biBhcyBgVGlhbm9Db3JlIDxodHRwczovL3d3dy50aWFub2NvcmUub3JnLz5gXywgaXMgYW4g
b3BlbiBzb3VyY2UNCj4+PiAraW1wbGVtZW50YXRpb24gb2YgVUVGSSBzdGFuZGFyZC4gSXQn
cyByYW4gYnkgUUVNVSB0byBzdXBwb3J0IFVFRkkgZm9yIHZpcnR1YWwNCj4+PiArbWFjaGlu
ZXMuDQo+Pg0KPj4gUmVwbGFjZSBsYXN0IHNlbnRlbmNlIHdpdGgNCj4+ICJRRU1VIHZpcnR1
YWwgbWFjaGluZXMgdGhhdCBib290IGEgVUVGSSBCSU9TIHVzdWFsbHkgdXNlIEVESzIuIg0K
Pj4gPw0KPj4NCj4gPHNuaXA+DQo+IA0KDQo=
