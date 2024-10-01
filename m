Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp319890njl;
        Tue, 1 Oct 2024 09:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURQD7XXAFXvc4lthKq4Uf6TLucbO6NTsseqEKGYdxU9/9ttGmQVDKeoJtGVic9LQ0VmgpUSU0Jjk39jg==@linaro.org
X-Received: by 2002:a05:6808:3091:b0:3e0:6a7f:4752 with SMTP id 5614622812f47-3e3b41874d2mr400404b6e.41.1727801825253;
        Tue, 01 Oct 2024 09:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801825; cv=none;
        d=google.com; s=arc-20240605;
        b=JcRRXt9OFKC0VfvogMG4+G6shMnx4wUTXvx8EwaovvPZAm663gZdHQQ+7CKIYVyNm7
         epfKq5eiWfpUoeQ2GvtBMCK89oWUYH4ckn6AXS472iprLhbXPVSlHLXfr91pVQYbISbt
         t/J84zpI032io1R89oR6t/lCdvapmSwxjwWSnn3fJLHER99uRC93pH/B4/PW+s3/HVqy
         6GyV3azpHIFS2XPYQmw4/FCce4+5rzTHeISJD6yeadon6AC+ZRAP9RO/sPu34BuP4zSM
         CfzzmdXfqTRos6HrP5Fd+vonrYP5Sb/zJw27uJsgav/4LVIElc8MGwDopef0NSasJod8
         BAaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9K26eAWpFzCtgx7TP1tqa2ef3xpXuNU688WzvLxpEM4=;
        fh=b8Il+VRx2cPh7Rl19zcfPnk4/lCtvHwJSYHdfQUuvd0=;
        b=h5ZUfVHu5XE/r0DDbey4R36de7cDGGQqHiJr17OuqdrhBJlVR3lUJmSCmOz0Hy+COQ
         C8xZuWRiz8/2KK1obeBrfFtlBXP+wzYis6lbSnLAnadjwHGrCY2xYQbmGwBH7904FfP+
         RWuNMk0v+bBtqrRhf55qgMa6WIluqEIrwfXwP0xk+zdQlCw/yr1EPvR8dZJ850UrBmuD
         pDijOa+Mf5GEgo8KXpxdVhJxh936kBVlfEpS3ByryxbG5+Hg5wUef7ce9r6VIAyKSru1
         gUmWqjgBtDIWnt/EKY8a9GIWXD5O1i3w84ikia4slOGIJLTP4ePDrtS/sXHHq5NMN28K
         UAAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PQic2bpQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e39a752d2esor1582423b6e.14.2024.10.01.09.57.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PQic2bpQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801825; x=1728406625; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9K26eAWpFzCtgx7TP1tqa2ef3xpXuNU688WzvLxpEM4=;
        b=PQic2bpQnMGOl44VW+F60QyQ86lxb35BtaZEVp+dbvNxvjtmVZPyVRX9dx0qKzaN14
         do90AgvCueANJU0BkPy4YECCoVWavVhKqjzPfachGxI4IRx2A3t8NMFR5i9g6HcwcDL9
         XW3AvXmUY7PO6SicJ0iRFfpmIqXc5Iu4Dafv+NaQtjcIcJN0dL+wdzCmb6hzX/qvUYkl
         s7qxhK5m00syiaWCfTT50Io5zo6cEhTrRQn4CEU4jsyEyTWCAppASlhUGilvxwlGOatJ
         jW5Y/VVo+4K6o58rPWN4OxtwcW3ZztqFRWzlcyNUUWJe7mxc8WnPFyngCiofL6c2A7qc
         HPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801825; x=1728406625;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9K26eAWpFzCtgx7TP1tqa2ef3xpXuNU688WzvLxpEM4=;
        b=viKNJfvfywGDrIiF34f5a+x1O7uCcCdvK38g+ybusMYzw4heV9Rg6QI8DZEZq9UINJ
         SZ+03Aj8tThJOB8Dggzwdgwvj7XNEsnYgVff3cpYNBH8RJaySUq9jCTKPasklg7BNxoE
         8i4jyX3pdPG5dMaYIdJ6waHp508Rgi9Jzfz+n3ldh/fFBuGjvMH/Dp4aC8sj80tblKYz
         LxVW7mOTSdA2rnvubuXpbf8qOSQpY28fNDG/0v3XIWn32CsWAFIMB9zdhKQT9C47LkjD
         zd8iORx7yvpyfaZXS9Eaj4A82CTo2CZSxUOHHK9lMZcrxNhdLZfeRNiofryKvevbLO0N
         PVUg==
X-Forwarded-Encrypted: i=1; AJvYcCWxeHXedHNZ4INt1i+Kb75LypPoH0JiHshTFU90/PWKCa8qEHNc6HnO/X66/3zFLTNL/XkdmINDZHy1lw==@linaro.org
X-Gm-Message-State: AOJu0Yz2SJuP9QBW9jNnDuKTf54eKiQN7pQejHnLQCFRg/PDP5CuD00G
	+AhC/ag6AbAEVvijjM9APzYaJT1mqBMZxaWqDEr7RRWiyxB8S8uHAVMnrnWykAdfbw==
X-Google-Smtp-Source: AGHT+IH2dp9fdxumN68lPcohwDx3nAiFYxoJAwviJ80Zmiizg+2nuaO5niRJhroAqpwVoJsn2YneaQ==
X-Received: by 2002:a05:6808:22ac:b0:3e2:8698:5a74 with SMTP id 5614622812f47-3e3b40e8c17mr579037b6e.5.1727801824712;
        Tue, 01 Oct 2024 09:57:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db17c3b8sm8734994a12.0.2024.10.01.09.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:57:04 -0700 (PDT)
Message-ID: <8cade88a-ec3b-43f0-8445-48846ece5e0f@linaro.org>
Date: Tue, 1 Oct 2024 09:57:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] hw/pci/pci_device: Introduce ld/st_endian_pci_dma()
 API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-13-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: fZeI9SlzNqAV

T24gOS8zMC8yNCAwMDozNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IElu
dHJvZHVjZSB0aGUgbGQvc3RfZW5kaWFuX3BjaV9kbWEoKSBBUEksIHdoaWNoIHRha2VzIGFu
IGV4dHJhDQo+IGJvb2xlYW4gYXJndW1lbnQgdG8gZGlzcGF0Y2ggdG8gbGQvc3Rfe2JlLGxl
fV9wY2lfZG1hKCkgbWV0aG9kcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+IFRPRE86IFVwZGF0
ZSBkb2NzdHJpbmcgcmVnZXhwDQo+IC0tLQ0KPiAgIGluY2x1ZGUvaHcvcGNpL3BjaV9kZXZp
Y2UuaCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9ody9wY2kvcGNpX2RldmljZS5oIGIvaW5jbHVkZS9ody9wY2kvcGNpX2Rldmlj
ZS5oDQo+IGluZGV4IGZmNjE5MjQxYTQuLmRjOWIxN2RkZWQgMTAwNjQ0DQo+IC0tLSBhL2lu
Y2x1ZGUvaHcvcGNpL3BjaV9kZXZpY2UuaA0KPiArKysgYi9pbmNsdWRlL2h3L3BjaS9wY2lf
ZGV2aWNlLmgNCj4gQEAgLTMwMCw3ICszMDAsMjkgQEAgc3RhdGljIGlubGluZSBNZW1UeFJl
c3VsdCBwY2lfZG1hX3dyaXRlKFBDSURldmljZSAqZGV2LCBkbWFfYWRkcl90IGFkZHIsDQo+
ICAgDQo+ICAgI2RlZmluZSBQQ0lfRE1BX0RFRklORV9MRFNUX0VORChfbCwgX3MsIF9iaXRz
KSBcDQo+ICAgICAgIFBDSV9ETUFfREVGSU5FX0xEU1QoX2wjI19sZSwgX3MjI19sZSwgX2Jp
dHMpIFwNCj4gLSAgICBQQ0lfRE1BX0RFRklORV9MRFNUKF9sIyNfYmUsIF9zIyNfYmUsIF9i
aXRzKQ0KPiArICAgIFBDSV9ETUFfREVGSU5FX0xEU1QoX2wjI19iZSwgX3MjI19iZSwgX2Jp
dHMpIFwNCj4gKyAgICBzdGF0aWMgaW5saW5lIE1lbVR4UmVzdWx0IGxkIyNfbCMjX2VuZGlh
bl9wY2lfZG1hKGJvb2wgaXNfYmlnX2VuZGlhbiwgXA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJRGV2aWNlICpkZXYsIFwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRtYV9hZGRyX3QgYWRkciwgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludCMjX2JpdHMjI190ICp2YWwsIFwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE1lbVR4QXR0cnMgYXR0cnMpIFwNCj4gKyAgICB7IFwNCj4gKyAgICAgICAgQWRkcmVzc1Nw
YWNlICpwY2lfYXMgPSBwY2lfZ2V0X2FkZHJlc3Nfc3BhY2UoZGV2KTsgXA0KPiArICAgICAg
ICByZXR1cm4gaXNfYmlnX2VuZGlhbiBcDQo+ICsgICAgICAgICAgICAgICA/IGxkIyNfbCMj
X2JlX2RtYShwY2lfYXMsIGFkZHIsIHZhbCwgYXR0cnMpIFwNCj4gKyAgICAgICAgICAgICAg
IDogbGQjI19sIyNfbGVfZG1hKHBjaV9hcywgYWRkciwgdmFsLCBhdHRycyk7IFwNCj4gKyAg
ICB9IFwNCj4gKyAgICBzdGF0aWMgaW5saW5lIE1lbVR4UmVzdWx0IHN0IyNfcyMjX2VuZGlh
bl9wY2lfZG1hKGJvb2wgaXNfYmlnX2VuZGlhbiwgXA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJRGV2aWNlICpkZXYsIFwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRtYV9hZGRyX3QgYWRkciwgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludCMjX2JpdHMjI190IHZhbCwgXA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
TWVtVHhBdHRycyBhdHRycykgXA0KPiArICAgIHsgXA0KPiArICAgICAgICBBZGRyZXNzU3Bh
Y2UgKnBjaV9hcyA9IHBjaV9nZXRfYWRkcmVzc19zcGFjZShkZXYpOyBcDQo+ICsgICAgICAg
IHJldHVybiBpc19iaWdfZW5kaWFuIFwNCj4gKyAgICAgICAgICAgICAgID8gc3QjI19zIyNf
YmVfZG1hKHBjaV9hcywgYWRkciwgdmFsLCBhdHRycykgXA0KPiArICAgICAgICAgICAgICAg
OiBzdCMjX3MjI19sZV9kbWEocGNpX2FzLCBhZGRyLCB2YWwsIGF0dHJzKTsgXA0KPiArICAg
IH0NCj4gICANCj4gICBQQ0lfRE1BX0RFRklORV9MRFNUKHViLCBiLCA4KTsNCj4gICBQQ0lf
RE1BX0RFRklORV9MRFNUX0VORCh1dywgdywgMTYpDQoNClJldmlld2VkLWJ5OiBQaWVycmlj
ayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
