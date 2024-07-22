Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2141790njc;
        Mon, 22 Jul 2024 14:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgmiNIxKrjlGsSTQKPHpmEihkRgATRT6aieEZOXlIJu3ifEi0TrzVqNhOA0gB9UydDanGhoj9CEwq4izdby3ogfNgouiJ1
X-Received: by 2002:a05:6e02:1b01:b0:396:f026:b0b3 with SMTP id e9e14a558f8ab-39a0c8e4c14mr11707065ab.15.1721682325793;
        Mon, 22 Jul 2024 14:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721682325; cv=none;
        d=google.com; s=arc-20160816;
        b=zw9vyzDF2GgDBYzFb/uvSSKta7px3UfZbRxGyfp9Y3uAJMOhEOAlwjb249+3PO05hb
         3JkT1cYtUXXPsMzSNwhpH+0gOoDLpu9v5KJ1g43icblCIIK57jDdAHiGYA8E4QmoZzKL
         TQ11Bto0BtbcStoCxu8yxdACweYlSCrB785cUdkCsy2lYdqE3mqAZa2UjCNQKYLBTGAv
         /56ywt7B43OVLah7OeA3BFGG7SWf2q4A1+cPL/d77LMw/RDs7XaUNECjaGZVL4BPNZi9
         8nZ9HUZA80aNqlzgakKxuyBLhZiKh5gSyQElpvGNzvHcYcdx+hnG2XLynSbosFEd7v2K
         FIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=p57gHNEc+Diy3vqo+XrGYGAFCFErHX9o3DSc6BeeICw=;
        fh=xVdCL6VpXxKGqnNre1QCrtIeW2OlStonpEAmMnwVyXQ=;
        b=nyncZ21NlIqsm+pLYKix20BqEHLpHVYrqYDpxJKKXyNq2XbjFMLpHLn/SCLMScfhxE
         zV50IYzxFG5HxLApEmn4PvNz5SiEmFnSChiTXXKAI6/u7Gpd1XTLtV7KpySea37iwYU3
         GwDLAvo9DrEAzHZS3xfpYOKd17Qe7v1dJAdO/JtZfSP1Tv1FMJSBTHBtWw5VwNPB3ctS
         Z9eLpi/2CgATTH8pAr73IciSJYUrudpOcB7tPTCUY4Q+E+q2FtF69TnKPjqzIEZYIKXF
         Fiv0CX48v6QRhiAssEDhGm2/32YqquNTlOjoeEGn6S25p0IdHfNr80/JKrxpr6Eiat/q
         qTeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uh5omeY1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70cff6dcdc6sor4442708b3a.10.2024.07.22.14.05.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2024 14:05:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uh5omeY1;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721682325; x=1722287125; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p57gHNEc+Diy3vqo+XrGYGAFCFErHX9o3DSc6BeeICw=;
        b=uh5omeY1UcyzOh4+I0RXXIJ2C9BWL4jzQ6lMkAm+WA7y0iaXtx8qKD2JBz8nr4cRYn
         JiVz/qawzlen5Vu2tPjrOXM1sgKIOJtEY2v81sXRdRK1dEDD2wPdoegV1M+YtghWqeUc
         V80y7b2QYWUr3Kp1Bw547+j5v97U8hgBYthgDzjYbQIs1tSI13Us/cv8Amb3jS3E+WhL
         qNYIpg5maCo8BSfouhKV9KB2E513+8Q6Bh+nNo1m0lzLJRbn1PVw4ZpVNEc9dlKaNp3M
         nqSW5dW9WO1xhFno6KBm1k+2t+Z4vDaf5Vz54rIkV8+mPqqQgvx8xqc/9kNvaxKLHxo5
         9Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721682325; x=1722287125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p57gHNEc+Diy3vqo+XrGYGAFCFErHX9o3DSc6BeeICw=;
        b=eUsHFzmND60d7lAv3XhnthyKq5O7VUWgE2qy/D8xjKoddBOpnSArAQYxzoMpCPGCSU
         1uQqfw5PSMtZb3zs+0BZm+6OG2fn+HHiCnu4UREXkuwMVsEBkVL1ch4qvejWWfd0cP1h
         lCeJ9SOtb9usDfwiZVrANnpHTVTknEoDtDl8lGgmoJ3xWkm7uD7SAp7/37HCoVY3fVM3
         8SHYbhegbkNM7m1Pr4lNAden1FRahFX5SQlcrpdOPRkKcntTJsIJvCeaZF9EWFJtau+8
         J/BV9YVdQ6Heh2NtOEIzIrER4/FPLAs4Nsbvcy7uQoOUyLzbpS40fmHRrXELEPWsX964
         HAjw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9w1953P8b2ynz9hpOYRUotM8mD44MesyoHCoW5SLAhM3f9DVZwvYPA/IUtN3eaeAlz8IIFXxmvmo2bTCX/1h+ZeDg01Q
X-Gm-Message-State: AOJu0YwWC4zNcGfdr0wUxkjUOPeH1x+ReeJTor9+EGTv94XGKTK3JarZ
	f1mEhQUeStSyq6b1497nmawl39O8jt0vbgOx7B4w5GhJIYTKUJsvr2gLZO0E+AoSzw==
X-Google-Smtp-Source: AGHT+IF0lPy23dTp689Omr58zjjDsbWNS7hh3c/G3KkjqawubsttnPArxRxfA9jp8KZQQDdPYPdGOw==
X-Received: by 2002:a05:6a00:1792:b0:70d:2556:2b1 with SMTP id d2e1a72fcca58-70d3a8aa24dmr1439376b3a.13.1721682325109;
        Mon, 22 Jul 2024 14:05:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::b861? ([2604:3d08:9384:1d00::b861])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d272fd4f5sm2338552b3a.164.2024.07.22.14.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 14:05:24 -0700 (PDT)
Message-ID: <758b3aa3-8f82-4fc2-a705-3f7896ebd83a@linaro.org>
Date: Mon, 22 Jul 2024 14:05:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] util/fifo8: Rename fifo8_pop_buf() ->
 fifo8_pop_constbuf()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20240722160745.67904-1-philmd@linaro.org>
 <20240722160745.67904-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240722160745.67904-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: NqrHOFWYmdwj

T24gNy8yMi8yNCAwOTowNywgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFNp
bmNlIGZpZm84X3BvcF9idWYoKSByZXR1cm4gYSBjb25zdCBidWZmZXIgKHdoaWNoIHBvaW50
cw0KPiBkaXJlY3RseSBpbnRvIHRoZSBGSUZPIGJhY2tpbmcgc3RvcmUpLCByZW5hbWUgaXQg
dXNpbmcgdGhlDQo+ICdjb25zdGJ1Zicgc3VmZml4LiBUaGlzIHdpbGwgaGVscCBkaWZmZXJl
bnRpYXRlIHdpdGggbWV0aG9kcw0KPiAqY29weWluZyogdGhlIEZJRk8gZGF0YS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJv
Lm9yZz4NCj4gLS0tDQo+ICAgaW5jbHVkZS9xZW11L2ZpZm84LmggICAgfCA0ICsrLS0NCj4g
ICBjaGFyZGV2L21zbW91c2UuYyAgICAgICB8IDIgKy0NCj4gICBody9jaGFyL2dvbGRmaXNo
X3R0eS5jICB8IDQgKystLQ0KPiAgIGh3L25ldC9hbGx3aW5uZXJfZW1hYy5jIHwgMiArLQ0K
PiAgIGh3L3Njc2kvZXNwLmMgICAgICAgICAgIHwgNCArKy0tDQo+ICAgdWkvY29uc29sZS12
Yy5jICAgICAgICAgfCAyICstDQo+ICAgdWkvZ3RrLmMgICAgICAgICAgICAgICAgfCAyICst
DQo+ICAgdXRpbC9maWZvOC5jICAgICAgICAgICAgfCAyICstDQo+ICAgOCBmaWxlcyBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3FlbXUvZmlmbzguaCBiL2luY2x1ZGUvcWVtdS9maWZvOC5oDQo+IGlu
ZGV4IDc5NDUwZjQ1ODMuLjY4NjkxOGEzYTQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvcWVt
dS9maWZvOC5oDQo+ICsrKyBiL2luY2x1ZGUvcWVtdS9maWZvOC5oDQo+IEBAIC02Myw3ICs2
Myw3IEBAIHZvaWQgZmlmbzhfcHVzaF9hbGwoRmlmbzggKmZpZm8sIGNvbnN0IHVpbnQ4X3Qg
KmRhdGEsIHVpbnQzMl90IG51bSk7DQo+ICAgdWludDhfdCBmaWZvOF9wb3AoRmlmbzggKmZp
Zm8pOw0KPiAgIA0KPiAgIC8qKg0KPiAtICogZmlmbzhfcG9wX2J1ZjoNCj4gKyAqIGZpZm84
X3BvcF9jb25zdGJ1ZjoNCj4gICAgKiBAZmlmbzogRklGTyB0byBwb3AgZnJvbQ0KPiAgICAq
IEBtYXg6IG1heGltdW0gbnVtYmVyIG9mIGJ5dGVzIHRvIHBvcA0KPiAgICAqIEBudW1wdHI6
IHBvaW50ZXIgZmlsbGVkIHdpdGggbnVtYmVyIG9mIGJ5dGVzIHJldHVybmVkIChjYW4gYmUg
TlVMTCkNCj4gQEAgLTg2LDcgKzg2LDcgQEAgdWludDhfdCBmaWZvOF9wb3AoRmlmbzggKmZp
Zm8pOw0KPiAgICAqDQo+ICAgICogUmV0dXJuczogQSBwb2ludGVyIHRvIHBvcHBlZCBkYXRh
Lg0KPiAgICAqLw0KPiAtY29uc3QgdWludDhfdCAqZmlmbzhfcG9wX2J1ZihGaWZvOCAqZmlm
bywgdWludDMyX3QgbWF4LCB1aW50MzJfdCAqbnVtcHRyKTsNCj4gK2NvbnN0IHVpbnQ4X3Qg
KmZpZm84X3BvcF9jb25zdGJ1ZihGaWZvOCAqZmlmbywgdWludDMyX3QgbWF4LCB1aW50MzJf
dCAqbnVtcHRyKTsNCj4gICANCj4gICAvKioNCj4gICAgKiBmaWZvOF9wZWVrX2NvbnN0YnVm
OiByZWFkIHVwdG8gbWF4IGJ5dGVzIGZyb20gdGhlIGZpZm8NCj4gZGlmZiAtLWdpdCBhL2No
YXJkZXYvbXNtb3VzZS5jIGIvY2hhcmRldi9tc21vdXNlLmMNCj4gaW5kZXggYTc3NGMzOTdi
NC4uMDg4MzZkOTJlOCAxMDA2NDQNCj4gLS0tIGEvY2hhcmRldi9tc21vdXNlLmMNCj4gKysr
IGIvY2hhcmRldi9tc21vdXNlLmMNCj4gQEAgLTgxLDcgKzgxLDcgQEAgc3RhdGljIHZvaWQg
bXNtb3VzZV9jaHJfYWNjZXB0X2lucHV0KENoYXJkZXYgKmNocikNCj4gICAgICAgICAgIGNv
bnN0IHVpbnQ4X3QgKmJ1ZjsNCj4gICAgICAgICAgIHVpbnQzMl90IHNpemU7DQo+ICAgDQo+
IC0gICAgICAgIGJ1ZiA9IGZpZm84X3BvcF9idWYoJm1vdXNlLT5vdXRidWYsIE1JTihsZW4s
IGF2YWlsKSwgJnNpemUpOw0KPiArICAgICAgICBidWYgPSBmaWZvOF9wb3BfY29uc3RidWYo
Jm1vdXNlLT5vdXRidWYsIE1JTihsZW4sIGF2YWlsKSwgJnNpemUpOw0KPiAgICAgICAgICAg
cWVtdV9jaHJfYmVfd3JpdGUoY2hyLCBidWYsIHNpemUpOw0KPiAgICAgICAgICAgbGVuID0g
cWVtdV9jaHJfYmVfY2FuX3dyaXRlKGNocik7DQo+ICAgICAgICAgICBhdmFpbCAtPSBzaXpl
Ow0KPiBkaWZmIC0tZ2l0IGEvaHcvY2hhci9nb2xkZmlzaF90dHkuYyBiL2h3L2NoYXIvZ29s
ZGZpc2hfdHR5LmMNCj4gaW5kZXggZjhmZjA0M2MzOS4uMmM1MDA0ODUxZCAxMDA2NDQNCj4g
LS0tIGEvaHcvY2hhci9nb2xkZmlzaF90dHkuYw0KPiArKysgYi9ody9jaGFyL2dvbGRmaXNo
X3R0eS5jDQo+IEBAIC02OSw3ICs2OSw3IEBAIHN0YXRpYyB1aW50NjRfdCBnb2xkZmlzaF90
dHlfcmVhZCh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLA0KPiAgIHN0YXRpYyB2b2lkIGdv
bGRmaXNoX3R0eV9jbWQoR29sZGZpc2hUVFlTdGF0ZSAqcywgdWludDMyX3QgY21kKQ0KPiAg
IHsNCj4gICAgICAgdWludDMyX3QgdG9fY29weTsNCj4gLSAgICB1aW50OF90ICpidWY7DQo+
ICsgICAgY29uc3QgdWludDhfdCAqYnVmOw0KPiAgICAgICB1aW50OF90IGRhdGFfb3V0W0dP
TEZJU0hfVFRZX0JVRkZFUl9TSVpFXTsNCj4gICAgICAgaW50IGxlbjsNCj4gICAgICAgdWlu
dDY0X3QgcHRyOw0KPiBAQCAtMTA5LDcgKzEwOSw3IEBAIHN0YXRpYyB2b2lkIGdvbGRmaXNo
X3R0eV9jbWQoR29sZGZpc2hUVFlTdGF0ZSAqcywgdWludDMyX3QgY21kKQ0KPiAgICAgICAg
ICAgbGVuID0gcy0+ZGF0YV9sZW47DQo+ICAgICAgICAgICBwdHIgPSBzLT5kYXRhX3B0cjsN
Cj4gICAgICAgICAgIHdoaWxlIChsZW4gJiYgIWZpZm84X2lzX2VtcHR5KCZzLT5yeF9maWZv
KSkgew0KPiAtICAgICAgICAgICAgYnVmID0gKHVpbnQ4X3QgKilmaWZvOF9wb3BfYnVmKCZz
LT5yeF9maWZvLCBsZW4sICZ0b19jb3B5KTsNCj4gKyAgICAgICAgICAgIGJ1ZiA9IGZpZm84
X3BvcF9jb25zdGJ1Zigmcy0+cnhfZmlmbywgbGVuLCAmdG9fY29weSk7DQo+ICAgICAgICAg
ICAgICAgYWRkcmVzc19zcGFjZV9ydygmYWRkcmVzc19zcGFjZV9tZW1vcnksIHB0ciwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNVFhBVFRSU19VTlNQRUNJRklFRCwg
YnVmLCB0b19jb3B5LCAxKTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL2h3L25ldC9hbGx3aW5u
ZXJfZW1hYy5jIGIvaHcvbmV0L2FsbHdpbm5lcl9lbWFjLmMNCj4gaW5kZXggOTg5ODM5Nzg0
YS4uM2IwYTJlZTA3ZSAxMDA2NDQNCj4gLS0tIGEvaHcvbmV0L2FsbHdpbm5lcl9lbWFjLmMN
Cj4gKysrIGIvaHcvbmV0L2FsbHdpbm5lcl9lbWFjLmMNCj4gQEAgLTM0OSw3ICszNDksNyBA
QCBzdGF0aWMgdm9pZCBhd19lbWFjX3dyaXRlKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIG9mZnNl
dCwgdWludDY0X3QgdmFsdWUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ImFsbHdpbm5lcl9lbWFjOiBUWCBsZW5ndGggPiBmaWZvIGRhdGEgbGVuZ3RoXG4iKTsNCj4g
ICAgICAgICAgICAgICB9DQo+ICAgICAgICAgICAgICAgaWYgKGxlbiA+IDApIHsNCj4gLSAg
ICAgICAgICAgICAgICBkYXRhID0gZmlmbzhfcG9wX2J1ZihmaWZvLCBsZW4sICZyZXQpOw0K
PiArICAgICAgICAgICAgICAgIGRhdGEgPSBmaWZvOF9wb3BfY29uc3RidWYoZmlmbywgbGVu
LCAmcmV0KTsNCj4gICAgICAgICAgICAgICAgICAgcWVtdV9zZW5kX3BhY2tldChuYywgZGF0
YSwgcmV0KTsNCj4gICAgICAgICAgICAgICAgICAgYXdfZW1hY190eF9yZXNldChzLCBjaGFu
KTsNCj4gICAgICAgICAgICAgICAgICAgLyogUmFpc2UgVFggaW50ZXJydXB0ICovDQo+IGRp
ZmYgLS1naXQgYS9ody9zY3NpL2VzcC5jIGIvaHcvc2NzaS9lc3AuYw0KPiBpbmRleCA1MjZl
ZDkxYmVmLi42NDM4NGY5YjBlIDEwMDY0NA0KPiAtLS0gYS9ody9zY3NpL2VzcC5jDQo+ICsr
KyBiL2h3L3Njc2kvZXNwLmMNCj4gQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgdWludDMy
X3QgZXNwX2ZpZm84X3BvcF9idWYoRmlmbzggKmZpZm8sIHVpbnQ4X3QgKmRlc3QsIGludCBt
YXhsZW4pDQo+ICAgICAgIH0NCj4gICANCj4gICAgICAgbGVuID0gbWF4bGVuOw0KPiAtICAg
IGJ1ZiA9IGZpZm84X3BvcF9idWYoZmlmbywgbGVuLCAmbik7DQo+ICsgICAgYnVmID0gZmlm
bzhfcG9wX2NvbnN0YnVmKGZpZm8sIGxlbiwgJm4pOw0KPiAgICAgICBpZiAoZGVzdCkgew0K
PiAgICAgICAgICAgbWVtY3B5KGRlc3QsIGJ1Ziwgbik7DQo+ICAgICAgIH0NCj4gQEAgLTIx
Nyw3ICsyMTcsNyBAQCBzdGF0aWMgdWludDMyX3QgZXNwX2ZpZm84X3BvcF9idWYoRmlmbzgg
KmZpZm8sIHVpbnQ4X3QgKmRlc3QsIGludCBtYXhsZW4pDQo+ICAgICAgIGxlbiAtPSBuOw0K
PiAgICAgICBsZW4gPSBNSU4obGVuLCBmaWZvOF9udW1fdXNlZChmaWZvKSk7DQo+ICAgICAg
IGlmIChsZW4pIHsNCj4gLSAgICAgICAgYnVmID0gZmlmbzhfcG9wX2J1ZihmaWZvLCBsZW4s
ICZuMik7DQo+ICsgICAgICAgIGJ1ZiA9IGZpZm84X3BvcF9jb25zdGJ1ZihmaWZvLCBsZW4s
ICZuMik7DQo+ICAgICAgICAgICBpZiAoZGVzdCkgew0KPiAgICAgICAgICAgICAgIG1lbWNw
eSgmZGVzdFtuXSwgYnVmLCBuMik7DQo+ICAgICAgICAgICB9DQo+IGRpZmYgLS1naXQgYS91
aS9jb25zb2xlLXZjLmMgYi91aS9jb25zb2xlLXZjLmMNCj4gaW5kZXggODk5ZmExMWM5NC4u
ZTk5MDZhYWU1OSAxMDA2NDQNCj4gLS0tIGEvdWkvY29uc29sZS12Yy5jDQo+ICsrKyBiL3Vp
L2NvbnNvbGUtdmMuYw0KPiBAQCAtMjg3LDcgKzI4Nyw3IEBAIHN0YXRpYyB2b2lkIGtiZF9z
ZW5kX2NoYXJzKFFlbXVUZXh0Q29uc29sZSAqcykNCj4gICAgICAgICAgIGNvbnN0IHVpbnQ4
X3QgKmJ1ZjsNCj4gICAgICAgICAgIHVpbnQzMl90IHNpemU7DQo+ICAgDQo+IC0gICAgICAg
IGJ1ZiA9IGZpZm84X3BvcF9idWYoJnMtPm91dF9maWZvLCBNSU4obGVuLCBhdmFpbCksICZz
aXplKTsNCj4gKyAgICAgICAgYnVmID0gZmlmbzhfcG9wX2NvbnN0YnVmKCZzLT5vdXRfZmlm
bywgTUlOKGxlbiwgYXZhaWwpLCAmc2l6ZSk7DQo+ICAgICAgICAgICBxZW11X2Nocl9iZV93
cml0ZShzLT5jaHIsIGJ1Ziwgc2l6ZSk7DQo+ICAgICAgICAgICBsZW4gPSBxZW11X2Nocl9i
ZV9jYW5fd3JpdGUocy0+Y2hyKTsNCj4gICAgICAgICAgIGF2YWlsIC09IHNpemU7DQo+IGRp
ZmYgLS1naXQgYS91aS9ndGsuYyBiL3VpL2d0ay5jDQo+IGluZGV4IGJjMjlmN2ExYjQuLmE0
ZGI5MGU4Y2IgMTAwNjQ0DQo+IC0tLSBhL3VpL2d0ay5jDQo+ICsrKyBiL3VpL2d0ay5jDQo+
IEBAIC0xODIwLDcgKzE4MjAsNyBAQCBzdGF0aWMgdm9pZCBnZF92Y19zZW5kX2NoYXJzKFZp
cnR1YWxDb25zb2xlICp2YykNCj4gICAgICAgICAgIGNvbnN0IHVpbnQ4X3QgKmJ1ZjsNCj4g
ICAgICAgICAgIHVpbnQzMl90IHNpemU7DQo+ICAgDQo+IC0gICAgICAgIGJ1ZiA9IGZpZm84
X3BvcF9idWYoJnZjLT52dGUub3V0X2ZpZm8sIE1JTihsZW4sIGF2YWlsKSwgJnNpemUpOw0K
PiArICAgICAgICBidWYgPSBmaWZvOF9wb3BfY29uc3RidWYoJnZjLT52dGUub3V0X2ZpZm8s
IE1JTihsZW4sIGF2YWlsKSwgJnNpemUpOw0KPiAgICAgICAgICAgcWVtdV9jaHJfYmVfd3Jp
dGUodmMtPnZ0ZS5jaHIsIGJ1Ziwgc2l6ZSk7DQo+ICAgICAgICAgICBsZW4gPSBxZW11X2No
cl9iZV9jYW5fd3JpdGUodmMtPnZ0ZS5jaHIpOw0KPiAgICAgICAgICAgYXZhaWwgLT0gc2l6
ZTsNCj4gZGlmZiAtLWdpdCBhL3V0aWwvZmlmbzguYyBiL3V0aWwvZmlmbzguYw0KPiBpbmRl
eCAyMTk0M2M2MDMyLi4zMWYwZDM0YzBjIDEwMDY0NA0KPiAtLS0gYS91dGlsL2ZpZm84LmMN
Cj4gKysrIGIvdXRpbC9maWZvOC5jDQo+IEBAIC05Nyw3ICs5Nyw3IEBAIGNvbnN0IHVpbnQ4
X3QgKmZpZm84X3BlZWtfY29uc3RidWYoRmlmbzggKmZpZm8sIHVpbnQzMl90IG1heCwgdWlu
dDMyX3QgKm51bXB0cikNCj4gICAgICAgcmV0dXJuIGZpZm84X3BlZWtwb3BfYnVmKGZpZm8s
IG1heCwgbnVtcHRyLCBmYWxzZSk7DQo+ICAgfQ0KPiAgIA0KPiAtY29uc3QgdWludDhfdCAq
ZmlmbzhfcG9wX2J1ZihGaWZvOCAqZmlmbywgdWludDMyX3QgbWF4LCB1aW50MzJfdCAqbnVt
cHRyKQ0KPiArY29uc3QgdWludDhfdCAqZmlmbzhfcG9wX2NvbnN0YnVmKEZpZm84ICpmaWZv
LCB1aW50MzJfdCBtYXgsIHVpbnQzMl90ICpudW1wdHIpDQo+ICAgew0KPiAgICAgICByZXR1
cm4gZmlmbzhfcGVla3BvcF9idWYoZmlmbywgbWF4LCBudW1wdHIsIHRydWUpOw0KPiAgIH0N
Cg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGlu
YXJvLm9yZz4NCg==
