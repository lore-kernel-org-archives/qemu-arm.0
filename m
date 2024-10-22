Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3356873njb;
        Tue, 22 Oct 2024 13:32:54 -0700 (PDT)
X-Received: by 2002:a17:902:e890:b0:206:ae39:9f4 with SMTP id d9443c01a7336-20fa9e24882mr5779725ad.20.1729629174257;
        Tue, 22 Oct 2024 13:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729629174; cv=none;
        d=google.com; s=arc-20240605;
        b=fG/4HRsxjBcEW1NfVdTCTTNdv8s0wRpFJ9McOGAKRIz9jeYXqOcIxvFBU+QX6zguk9
         hVI/5UMYMw/YUT4Tzv+FKFkByzlnqMid0eamJ3FHd+9RFYJYwh5M3AbXLsu33OZ4pm31
         t/hCxbnAIwAKzx3N5HDoYRIpAGNK82ZjMeC3DC3qoB2f5qkxLFVY6PL2GQD3FRjdLptj
         b6xNnCXxwJy/8G+UHhjhPW6GU1u2wjfrQxACF0w/uAx/6QhNtqMu9WjD1RWHryXunR97
         DLoJfDxXw9hvb3SVHr2FglCA2PswgzqlAN/RDCp81gT8Spkkm7TaTCCEAYI0zA8fmX2I
         T9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=22iDYg801c8q/L8h63/ZCoe5iOUGaky+8DT+5jhBm58=;
        fh=X8ItXK/eP+lsZpHYO2upAce6PY3lCv88NOwH1uPYlKY=;
        b=Aq4VI+QUroGkmFbP+moprqUfTrliaivqOlj13EG4ZKuq5oeZedyo2Vohoz4V1UWSCb
         Ewz6MxglrTTS+PJpWhzHsXeCcswjFEph1y86bH05YFcQll4pDlk1VYqX69QKgfuuEKv0
         D/Z2Ipp4fyjoFXx4pxIMs/ed1NMgDX6fPXEtBTbYUHZOIy2pg3vZGsSRn2LwinuELC4o
         mSAK+N9NDT3y/Nz4NjSBKzvbtVaMWc1FcTNJxCwfndqgVJp8HzHn/YWW0/XVikfWsXAi
         8zGPSVAVCOEnVMgEj/zSO51kEuJOVSxMJ9TsC9vvodWURA3xFYlAGLGeNSloFDqOF3yg
         YJaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p5GJQtZG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e7f0de3cfsor43996725ad.15.2024.10.22.13.32.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 13:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p5GJQtZG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729629174; x=1730233974; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=22iDYg801c8q/L8h63/ZCoe5iOUGaky+8DT+5jhBm58=;
        b=p5GJQtZG77JAjxXRUb5+dRG3oW+vnz9NUwBsMbPcJFpJDCvZVLolgsyM9L6tY++hOn
         OsWred4W9IrAlJ04rcHwt3diUlWXJJBkAgC7uIoSf4z5GgYtG40f8vOZuIUxoJJ7S7T+
         ThCuy3VLq0QsUvAyNbrJGmRHa4p8NvZm3dSTSqxPH/h0CCsvVFcc1Kd758J8wONSTr2Y
         pcyEwfOzyqD6ZI4bYdMXsimP/pHOLGAS+krA/ssO4uA4lAORcHrWreRbjX0CT5RtgIfT
         nsgGnj7K3dwon8jC9WYCqKwL/8bZExG/eFZ889au5jJnKGBN7/iPwBTOEUCL40JkUNHL
         SufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729629174; x=1730233974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22iDYg801c8q/L8h63/ZCoe5iOUGaky+8DT+5jhBm58=;
        b=VGm0dQIbmY6WcHiNEZmdA44oGtFct/BHa/YLQA1Fcp8DMVKMNxwE1TMUAWZB0cvQvp
         ovXjt7CvWPJUkfoaprhSdJJrL/UXYaEqqT+qWayacElDbb1hVUoPjEibnUBZEhzafrsJ
         DwdWPbsN3xbOwsAGmJglcQlB4d4oxa6WbEgg71LAnzVW+FYBOFOpG0H1XIati48TSZ65
         P5vRxvQoYANJZJCBvYQOiSMirlPTlEmRt0uE5WkkbfnJt878r4I01UEkT51He3s6wU6N
         THo/SO1iG7DnZyAb1CuLEyUGKZE/euYOYy2YuOvxo0k4Vm1hxiVGCWJwQu5BMxekNVWr
         QR4A==
X-Gm-Message-State: AOJu0YxLmCzyOfh1rcjj0lgFWSDsCwrTg7M+OIDEBzJxnfRE4z7J9T4U
	lC9jCcV7I17ncNseD67cXxS/djg1bKJ2aalrhYoVWHefol+l6FpaKlT0LP96hF2EcTL8ZFI2h8E
	hSr4UHJT1
X-Google-Smtp-Source: AGHT+IFaD76bQqjYlx7C1qxfp6VbhP5GE48tnyBe+LWy7d4tLOyRp3pZwxtrqk+0RelB7tsR0TfiQA==
X-Received: by 2002:a17:902:d2c6:b0:20b:6f04:486a with SMTP id d9443c01a7336-20fa9e785a8mr5423175ad.35.1729629173598;
        Tue, 22 Oct 2024 13:32:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bd42asm46422095ad.165.2024.10.22.13.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 13:32:53 -0700 (PDT)
Message-ID: <fdea845b-d38a-4cd8-b87f-098dd7a7adbb@linaro.org>
Date: Tue, 22 Oct 2024 13:32:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/20] scripts/ci: remove architecture checks for
 build-environment updates
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
 <20241022105614.839199-7-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241022105614.839199-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: it+JWnj+69to

T24gMTAvMjIvMjQgMDM6NTYsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gV2Ugd2VyZSBtaXNz
aW5nIHMzOTB4IGhlcmUuIFRoZXJlIGlzbid0IG11Y2ggcG9pbnQgdGVzdGluZyBmb3IgdGhl
DQo+IGFyY2hpdGVjdHVyZSBoZXJlIGFzIHdlIHdpbGwgZmFpbCBhbnl3YXkgaWYgdGhlIGFw
cHJvcHJpYXRlIHBhY2thZ2UNCj4gbGlzdCBpcyBtaXNzaW5nLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiAtLS0NCj4g
ICBzY3JpcHRzL2NpL3NldHVwL3VidW50dS9idWlsZC1lbnZpcm9ubWVudC55bWwgfCAyIC0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvc2NyaXB0cy9jaS9zZXR1cC91YnVudHUvYnVpbGQtZW52aXJvbm1lbnQueW1sIGIvc2Ny
aXB0cy9jaS9zZXR1cC91YnVudHUvYnVpbGQtZW52aXJvbm1lbnQueW1sDQo+IGluZGV4IGVk
ZjE5MDBiM2UuLjU2YjUxNjA5ZTMgMTAwNjQ0DQo+IC0tLSBhL3NjcmlwdHMvY2kvc2V0dXAv
dWJ1bnR1L2J1aWxkLWVudmlyb25tZW50LnltbA0KPiArKysgYi9zY3JpcHRzL2NpL3NldHVw
L3VidW50dS9idWlsZC1lbnZpcm9ubWVudC55bWwNCj4gQEAgLTM5LDcgKzM5LDYgQEANCj4g
ICAgICAgICB3aGVuOg0KPiAgICAgICAgICAgLSBhbnNpYmxlX2ZhY3RzWydkaXN0cmlidXRp
b24nXSA9PSAnVWJ1bnR1Jw0KPiAgICAgICAgICAgLSBhbnNpYmxlX2ZhY3RzWydkaXN0cmli
dXRpb25fdmVyc2lvbiddID09ICcyMi4wNCcNCj4gLSAgICAgICAgLSBhbnNpYmxlX2ZhY3Rz
WydhcmNoaXRlY3R1cmUnXSA9PSAnYWFyY2g2NCcgb3IgYW5zaWJsZV9mYWN0c1snYXJjaGl0
ZWN0dXJlJ10gPT0gJ3g4Nl82NCcNCj4gICANCj4gICAgICAgLSBuYW1lOiBJbnN0YWxsIHBh
Y2thZ2VzIGZvciBRRU1VIG9uIFVidW50dSAyMi4wNA0KPiAgICAgICAgIHBhY2thZ2U6DQo+
IEBAIC00Nyw3ICs0Niw2IEBADQo+ICAgICAgICAgd2hlbjoNCj4gICAgICAgICAgIC0gYW5z
aWJsZV9mYWN0c1snZGlzdHJpYnV0aW9uJ10gPT0gJ1VidW50dScNCj4gICAgICAgICAgIC0g
YW5zaWJsZV9mYWN0c1snZGlzdHJpYnV0aW9uX3ZlcnNpb24nXSA9PSAnMjIuMDQnDQo+IC0g
ICAgICAgIC0gYW5zaWJsZV9mYWN0c1snYXJjaGl0ZWN0dXJlJ10gPT0gJ2FhcmNoNjQnIG9y
IGFuc2libGVfZmFjdHNbJ2FyY2hpdGVjdHVyZSddID09ICd4ODZfNjQnDQo+ICAgDQo+ICAg
ICAgIC0gbmFtZTogSW5zdGFsbCBhcm1oZiBjcm9zcy1jb21waWxlIHBhY2thZ2VzIHRvIGJ1
aWxkIFFFTVUgb24gQUFyY2g2NCBVYnVudHUgMjIuMDQNCj4gICAgICAgICBwYWNrYWdlOg0K
DQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5h
cm8ub3JnPg0K
