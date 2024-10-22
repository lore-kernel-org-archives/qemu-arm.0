Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3356321njb;
        Tue, 22 Oct 2024 13:31:46 -0700 (PDT)
X-Received: by 2002:a17:903:244e:b0:20c:a055:9f07 with SMTP id d9443c01a7336-20fa9e5ec65mr4331605ad.26.1729629106223;
        Tue, 22 Oct 2024 13:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729629106; cv=none;
        d=google.com; s=arc-20240605;
        b=cKO37DyMR62UaWuieQzYeQL+kfOjfMzL88MKcaeFprQDn8giqzk6Bcr7haQeY20u50
         /I6r1XPqp59yz3QjKZW/Mit9ukbaz9FRoZJpdKx5q5X4S+aT3I8rD5mQSTZyKJrtEFCc
         YNBy0nU9At0ZH25D4MbKUBntc+sHU8647agRyUAzAHMQdZjnhrOAAxd6s607NXhVarBi
         HHvqsLUN1TYLVd0JAT2Mf4jBg4n6v0GcvVRxNGHqXDPDuNefERsZT9Qy+j2RgaK0z5KG
         mevx+NTtP/q36VzR4ezSySYoAHtaAnnQSVBME59rPTD1AiZ7JSa5F72Aj0xHGnP1CPkr
         yTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oB483hQexTEaOWDvU61A56qrwM7YWeWBfyueGHYezvc=;
        fh=X8ItXK/eP+lsZpHYO2upAce6PY3lCv88NOwH1uPYlKY=;
        b=MMGO/DSNCWMYzOVo9gENC90zlXQthJguEqCyyabA27qtPyGHhCHRsIoVwBifjcY5L1
         4Du8R310QEO14o717vvkF2rHMN2rbE/CJaSxMnbmumoG0zluyuwuExC/8fr9Yx2WlO5h
         Uuv+VPBTjz/fvzGkiLfNzG4Y9wXDJWLIu/0k1+oODxkxw1weMsLu6i2v6MIGIDj/9HS0
         PtzoV/JjnRDdVaktv4kf+lZ7M+9LxOgWcbhhqs+GItLcikd9AUE43PCeZbnT0vmAAtLI
         /JbVYzgx2umduY1TI1xWog/+9BkCAUbMmapQqOZOOVm5BtBtbLE0zp0ynQP0IJSUXnmT
         2ETA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=My+9k0uz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e7ef0cfabsor36263725ad.1.2024.10.22.13.31.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 13:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=My+9k0uz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729629106; x=1730233906; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oB483hQexTEaOWDvU61A56qrwM7YWeWBfyueGHYezvc=;
        b=My+9k0uzxB6NpCSrYFOmRUMwI9oTuDoS03FiidL9521bXylSeq+wU4+s9QxzxOxKKo
         EgI/AEYpT8NJdzCpmGnKop/BkkMoqWtUKEwnQUjG53jsn8vNqTXnnR4kGXk4c+IMtFJV
         8/HkX1eXNm9/PaLDuRK7iWJ4X38XyIhFjlgoP3XKAiNvzOSBTfBw8U1JNJgXly23oQl3
         kLnpnbV7OMnjOSYtA89pTizRazcLTmCm6mPSEVtNimo4fNTofURzg0XYX3TD2zh/rn7U
         Pf+0lLTOJB9jknIMh2aenmfGunz44y7L6XheZjBq5hxTBGxMJLDKz7RmyyqHAwkHAUjW
         Kl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729629106; x=1730233906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oB483hQexTEaOWDvU61A56qrwM7YWeWBfyueGHYezvc=;
        b=sgp2mdoQtrW94sAtYjcgqliAz2ZRYw/k0reevxAUyeFvPbdJX5zxllkrI0oUf0jrR5
         N98PtgP3qqOJR/V0yExJr25DRB1W4174qNxUeuvEHuoOogFFStIRtOUXUpuko7DNrL7O
         l7uGJmP6hRnvblcGXa/sufzuW+h5LqpNJw32xyZT6Iy7H1ucGjQ/AP4j01psGS+a77F8
         hSQ8DDRS+9EMu80nt2kjCnVSmtYYo/nsmXGdmgaBhH/eksTDcnpOdFljUqD4IK8lUYjK
         Hyct3XAoIG6nACD4cMReG37DRqqpFaHnnwcLmwcGvDzoNiUsrxIbhojdvbB0TZblwxx7
         DRoA==
X-Gm-Message-State: AOJu0YzD/vGLrU/dPqnoEZjq5DfgIUqpvgX9PxAHDqM54gZrS9+FaFI7
	ooWsbvMqcc1YlhP7w58A0jPW+Av0LlFDOIj94ZD9cwPTbNjjquU78bmR7RLbDNdRp+WHK8DX789
	hYaRbPRmv
X-Google-Smtp-Source: AGHT+IHOfhvheXJxw9in5Rg8Qqoc4W+j3iF1Z8mFQAoMgSmn+ZFqHHEv4hP0+Rc5vNRAQag4kQezkA==
X-Received: by 2002:a17:90b:4c4b:b0:2e2:d15c:1a24 with SMTP id 98e67ed59e1d1-2e76b618c40mr223184a91.23.1729629105804;
        Tue, 22 Oct 2024 13:31:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad388ea9sm6722471a91.29.2024.10.22.13.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 13:31:45 -0700 (PDT)
Message-ID: <20d8ac14-d920-4a21-a5cc-432acc7d582f@linaro.org>
Date: Tue, 22 Oct 2024 13:31:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/20] tests/docker: add NOFETCH env variable for
 testing
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
 <20241022105614.839199-3-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241022105614.839199-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 5/9tmYgK78QA

T24gMTAvMjIvMjQgMDM6NTUsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gVGVzdGluZyBub24t
YXV0byBidWlsdCBkb2NrZXIgY29udGFpbmVycyAoaS5lLiBjdXN0b20gYnVpbHQgY29tcGls
ZXJzKQ0KPiBpcyBhIGJpdCBmaWRkbHkgYXMgeW91IGNvdWxkbid0IGNvbnRpbnVlIGEgYnVp
bGQgd2l0aCBhIHByZXZpb3VzbHkNCj4gbG9jYWxseSBidWlsdCBjb250YWluZXIuIFdoaWxl
IHlvdSBjYW4gcGxheSBnYW1lcyB3aXRoIFJFR0lTVFJZIGl0cw0KPiBzaW1wbGVyIHRvIGFs
bG93IGEgTk9GRVRDSCB0aGF0IHdpbGwgZ28gdGhyb3VnaCB0aGUgY2FjaGVkIGJ1aWxkDQo+
IHByb2Nlc3Mgd2hlbiB5b3UgcnVuIHRoZSB0ZXN0cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgdGVz
dHMvZG9ja2VyL01ha2VmaWxlLmluY2x1ZGUgfCA1ICsrKy0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS90ZXN0cy9kb2NrZXIvTWFrZWZpbGUuaW5jbHVkZSBiL3Rlc3RzL2RvY2tlci9NYWtlZmls
ZS5pbmNsdWRlDQo+IGluZGV4IDY4MWZlYWU3NDQuLmZlYWQ3ZDNhYmUgMTAwNjQ0DQo+IC0t
LSBhL3Rlc3RzL2RvY2tlci9NYWtlZmlsZS5pbmNsdWRlDQo+ICsrKyBiL3Rlc3RzL2RvY2tl
ci9NYWtlZmlsZS5pbmNsdWRlDQo+IEBAIC05MiwxMCArOTIsMTAgQEAgZW5kaWYNCj4gICBk
b2NrZXItaW1hZ2UtYWxwaW5lOiBOT1VTRVI9MQ0KPiAgIA0KPiAgIGRlYmlhbi10b29sY2hh
aW4tcnVuID0gXA0KPiAtCSQoaWYgJChOT0NBQ0hFKSwgCQkJCQkJXA0KPiArCSQoaWYgJChO
T0NBQ0hFKSQoTk9GRVRDSCksCQkJCQlcDQo+ICAgCQkkKGNhbGwgcXVpZXQtY29tbWFuZCwJ
CQkJCVwNCj4gICAJCQkkKERPQ0tFUl9TQ1JJUFQpIGJ1aWxkIC10IHFlbXUvJDEgLWYgJDwg
CVwNCj4gLQkJCSQoaWYgJFYsLC0tcXVpZXQpIC0tbm8tY2FjaGUgCQkJXA0KPiArCQkJJChp
ZiAkViwsLS1xdWlldCkgJChpZiAkKE5PQ0FDSEUpLC0tbm8tY2FjaGUpCVwNCj4gICAJCQkt
LXJlZ2lzdHJ5ICQoRE9DS0VSX1JFR0lTVFJZKSAtLWV4dHJhLWZpbGVzCVwNCj4gICAJCQkk
KERPQ0tFUl9GSUxFU19ESVIpLyQxLmQvYnVpbGQtdG9vbGNoYWluLnNoLAlcDQo+ICAgCQkJ
IkJVSUxEIiwgJDEpLAkJCQkgICAgICAgIFwNCj4gQEAgLTE3Nyw2ICsxNzcsNyBAQCBkb2Nr
ZXI6DQo+ICAgCUBlY2hvICcgICAgTkVUV09SSz0kJEJBQ0tFTkQgICAgIEVuYWJsZSB2aXJ0
dWFsIG5ldHdvcmsgaW50ZXJmYWNlIHdpdGggJCRCQUNLRU5ELicNCj4gICAJQGVjaG8gJyAg
ICBOT1VTRVI9MSAgICAgICAgICAgICBEZWZpbmUgdG8gZGlzYWJsZSBhZGRpbmcgY3VycmVu
dCB1c2VyIHRvIGNvbnRhaW5lcnMgcGFzc3dkLicNCj4gICAJQGVjaG8gJyAgICBOT0NBQ0hF
PTEgICAgICAgICAgICBJZ25vcmUgY2FjaGUgd2hlbiBidWlsZCBpbWFnZXMuJw0KPiArCUBl
Y2hvICcgICAgTk9GRVRDSD0xICAgICAgICAgICAgRG8gbm90IGZldGNoIGZyb20gdGhlIHJl
Z2lzdHJ5LicNCj4gICAJQGVjaG8gJyAgICBFWEVDVVRBQkxFPTxwYXRoPiAgICBJbmNsdWRl
IGV4ZWN1dGFibGUgaW4gaW1hZ2UuJw0KPiAgIAlAZWNobyAnICAgIEVYVFJBX0ZJTEVTPSI8
cGF0aD4gWy4uLiA8cGF0aD5dIicNCj4gICAJQGVjaG8gJyAgICAgICAgICAgICAgICAgICAg
ICAgICBJbmNsdWRlIGV4dHJhIGZpbGVzIGluIGltYWdlLicNCg0KUmV2aWV3ZWQtYnk6IFBp
ZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
