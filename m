Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3363246njb;
        Tue, 22 Oct 2024 13:47:45 -0700 (PDT)
X-Received: by 2002:a05:6e02:168a:b0:3a0:c88c:e674 with SMTP id e9e14a558f8ab-3a4d592f374mr5202245ab.1.1729630065260;
        Tue, 22 Oct 2024 13:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729630065; cv=none;
        d=google.com; s=arc-20240605;
        b=C/JnhdPA2RbGH9XyuyBtzzmqgarCsYyB/V+ITrv5JhWozE5pWyxOgLLiFFg2CtjP+J
         GQ2c4qxJAemhmZIwaHyrUpr8BvFjaYLFxJsbU9f83ooBVYtFzBa7S+94cK8c3Hlb2kL8
         dGjMgzG63sB4cqUEN0Dwbu5dsSN2liX7omDhUm9v4GK0i/oCLgx6nuinaK/LI17PMJyO
         jvmkoyIilOPoiFnaqknUA1X6OieF92jZkkrW7DdlfYa4jtFP92VE7zsZOI9fr4qICwK6
         fZTi4Ih7lkxR0hNehccDtWgyocD29ifjdS/U9oejQZPhANZlmYbK81pAG1Y5DfPt0qzw
         F7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=a+fJJ9Dp7W30zg+3qfy30Ox8HtY5P7RX0q7uwfWJoF4=;
        fh=X8ItXK/eP+lsZpHYO2upAce6PY3lCv88NOwH1uPYlKY=;
        b=PwTHWkJ4UDt7dFUm+eQM2dfiXgWtTiEUF3jitB1NO+K/gQtn+H4lY05Obhc9QhCbzs
         7LtGDCzBFdbzOcHm/ahX67c0+RnocDS4pg94nEUbHIVnvmrWu8jwy+gCyO8CgGeNPVdR
         0gDv1k4r2mxsWkOhx7ToUOe0fa/XXexTFD4ks1kSkA0uRTZzOxJvBY4Gli2hH6OOPYlQ
         vR8LiGUx2VkRB/dGCfPT8B10BADSk8+hczq3mjk8Tq7kk7+YXPNRSIyCjyHQ92eRzEVc
         SVcG5Mz90NFMnDKfnvDiAQ+3Unmxld2jDoUIaZWRJj4RKdnigJSTt1IHvc9sTGFJrNw7
         758w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IVwowgv/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e9e14a558f8ab-3a400b64951sor18245235ab.17.2024.10.22.13.47.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 13:47:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="IVwowgv/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729630065; x=1730234865; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+fJJ9Dp7W30zg+3qfy30Ox8HtY5P7RX0q7uwfWJoF4=;
        b=IVwowgv/pSqr4csW/98Buhd4S9VPX0SRpCaziWAhl/XbljgUNFZTCBZVg/KCdsPTbc
         cQD106MY/zjMuPnZcuIKPcim0m4NKHq1PspP0kMos4jHhIrKFlBKLUxB2mAlQ7s2tN7z
         QkzctKZe4GRkLtQUXUXAln99zLxfvsxUABF0fdTqy8g5s/f/2/uaGKlvU/VS9yPQi9Jk
         tRKV8YnMd9gPke6anRvCiFEox/eue3dkRv71826kte8UioVREPwF9peOklaqLxaWov6Z
         NvlOlVFA+HYiWTyVrlryhwMMgB/l35+/c47vRcCokrfiQW0Le+rVf87BE4dIkCgGaRkh
         0JuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729630065; x=1730234865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+fJJ9Dp7W30zg+3qfy30Ox8HtY5P7RX0q7uwfWJoF4=;
        b=A3kKkvVvkP+1f/KoZ3wyeVqA6UH19CEO1sgs8WXKh0jAWuqsp7Eg6zS7BLcSiFm7Pa
         nCz9l4HpPNjO5bfRTY79grNCApwGJ0p9eY6dOS2XjrhMibK4zo7DPG6NtGnj7nCITiRC
         IvL65zHo2UWpyCH/yNKvXnOlx/iCUCgjCJmT2S8WXziUp4pPY2Q5klC78YFwGqtwPclX
         uMjTNwyVaI8PFjh5e0Ics74MIRhLE1dbijW1HnJp5TWWNZjK+qGiGbrl2prWwPF8+t/A
         oBjIo7hYgcRY/VzfpR9pOj27+orY27IA5CYzoMkPKpNiejQMDEIKoi6e3QjLaj3xO4hD
         VFEQ==
X-Gm-Message-State: AOJu0Yy2HgcqAPLdVcrI3F+ube/JOrSFs7eJIaRWIayKkpRSBBz9+IUN
	uO5wD1TZZRRlc6+XPUd4Ql5mkyfoMolTfLAPx+UWTXo5OYOD2Erz0xuJaTgAfQ6S6mJ6h7oTW59
	6x1ZhhOYz
X-Google-Smtp-Source: AGHT+IGxtWaz02ZWX8eAHev4FK0z46I0Gwxm/LOeADOTtssrl9I9F89zPgSp/kIzlDM7RPtwF9Tk3w==
X-Received: by 2002:a05:6e02:1a6d:b0:3a0:8eb3:5154 with SMTP id e9e14a558f8ab-3a4d592f29amr4864485ab.4.1729630064737;
        Tue, 22 Oct 2024 13:47:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeaafd36esm5597691a12.6.2024.10.22.13.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 13:47:44 -0700 (PDT)
Message-ID: <565ef8bd-2f32-4e89-9444-7016ceae9d3f@linaro.org>
Date: Tue, 22 Oct 2024 13:47:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/20] plugins: add ability to register a GDB triggered
 callback
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
 <20241022105614.839199-18-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241022105614.839199-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: SjMiKK7xzHpZ

T24gMTAvMjIvMjQgMDM6NTYsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gTm93IGdkYnN0dWIg
aGFzIGdhaW5lZCB0aGUgYWJpbGl0eSB0byBleHRlbmQgaXRzIGNvbW1hbmQgdGFibGVzIHdl
IGNhbg0KPiBhbGxvdyBpdCB0byB0cmlnZ2VyIHBsdWdpbiBjYWxsYmFja3MuIFRoaXMgaXMg
cHJvYmFibHkgbW9zdCB1c2VmdWwgZm9yDQo+IFFFTVUgZGV2ZWxvcGVycyBkZWJ1Z2dpbmcg
cGx1Z2lucyB0aGVtc2VsdmVzIGJ1dCBtaWdodCBiZSB1c2VmdWwgZm9yDQo+IG90aGVyIHN0
dWZmLg0KPiANCj4gVHJpZ2dlciB0aGUgY2FsbGJhY2sgYnkgc2VuZGluZzoNCj4gDQo+ICAg
IG1haW50ZW5hbmNlIHBhY2tldCBRcWVtdS5wbHVnaW5fY2INCj4gDQo+IEkndmUgZXh0ZW5k
ZWQgdGhlIG1lbW9yeSBwbHVnaW4gdG8gcmVwb3J0IG9uIHRoZSBwYWNrZXQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+
IC0tLQ0KPiAgIGluY2x1ZGUvcWVtdS9wbHVnaW4tZXZlbnQuaCAgfCAgMSArDQo+ICAgaW5j
bHVkZS9xZW11L3FlbXUtcGx1Z2luLmggICB8IDE2ICsrKysrKysrKysrKysrKysNCj4gICBw
bHVnaW5zL3BsdWdpbi5oICAgICAgICAgICAgIHwgIDkgKysrKysrKysrDQo+ICAgcGx1Z2lu
cy9hcGkuYyAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKw0KPiAgIHBs
dWdpbnMvY29yZS5jICAgICAgICAgICAgICAgfCAzNyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gICB0ZXN0cy90Y2cvcGx1Z2lucy9tZW0uYyAgICAgIHwgMTEg
KysrKysrKysrLS0NCj4gICBwbHVnaW5zL3FlbXUtcGx1Z2lucy5zeW1ib2xzIHwgIDEgKw0K
PiAgIDcgZmlsZXMgY2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3FlbXUvcGx1Z2luLWV2ZW50LmggYi9pbmNs
dWRlL3FlbXUvcGx1Z2luLWV2ZW50LmgNCj4gaW5kZXggNzA1NmQ4NDI3Yi4uZDlhYTU2Y2Y0
ZiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9xZW11L3BsdWdpbi1ldmVudC5oDQo+ICsrKyBi
L2luY2x1ZGUvcWVtdS9wbHVnaW4tZXZlbnQuaA0KPiBAQCAtMjAsNiArMjAsNyBAQCBlbnVt
IHFlbXVfcGx1Z2luX2V2ZW50IHsNCj4gICAgICAgUUVNVV9QTFVHSU5fRVZfVkNQVV9TWVND
QUxMX1JFVCwNCj4gICAgICAgUUVNVV9QTFVHSU5fRVZfRkxVU0gsDQo+ICAgICAgIFFFTVVf
UExVR0lOX0VWX0FURVhJVCwNCj4gKyAgICBRRU1VX1BMVUdJTl9FVl9HREJTVFVCLA0KPiAg
ICAgICBRRU1VX1BMVUdJTl9FVl9NQVgsIC8qIHRvdGFsIG51bWJlciBvZiBwbHVnaW4gZXZl
bnRzIHdlIHN1cHBvcnQgKi8NCj4gICB9Ow0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9xZW11L3FlbXUtcGx1Z2luLmggYi9pbmNsdWRlL3FlbXUvcWVtdS1wbHVnaW4uaA0KPiBp
bmRleCA2MjJjOWEwMjMyLi45OWMzYjM2NWFhIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3Fl
bXUvcWVtdS1wbHVnaW4uaA0KPiArKysgYi9pbmNsdWRlL3FlbXUvcWVtdS1wbHVnaW4uaA0K
PiBAQCAtODAyLDYgKzgwMiwyMiBAQCBRRU1VX1BMVUdJTl9BUEkNCj4gICB2b2lkIHFlbXVf
cGx1Z2luX3JlZ2lzdGVyX2F0ZXhpdF9jYihxZW11X3BsdWdpbl9pZF90IGlkLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHFlbXVfcGx1Z2luX3VkYXRhX2Ni
X3QgY2IsIHZvaWQgKnVzZXJkYXRhKTsNCj4gICANCj4gKw0KPiArLyoqDQo+ICsgKiBxZW11
X3BsdWdpbl9yZWdpc3Rlcl9nZGJfY2IoKSAtIHJlZ2lzdGVyIGEgZ2RiIGNhbGxiYWNrDQo+
ICsgKiBAaWQ6IHBsdWdpbiBJRA0KPiArICogQGNiOiBjYWxsYmFjaw0KPiArICogQHVzZXJk
YXRhOiB1c2VyIGRhdGEgZm9yIGNhbGxiYWNrDQo+ICsgKg0KPiArICogV2hlbiB1c2luZyB0
aGUgZ2Ric3R1YiB0byBkZWJ1ZyBhIGd1ZXN0IHlvdSBjYW4gc2VuZCBhIGNvbW1hbmQgdGhh
dA0KPiArICogd2lsbCB0cmlnZ2VyIHRoZSBjYWxsYmFjay4gVGhpcyBpcyB1c2VmdWwgaWYg
eW91IHdhbnQgdGhlIHBsdWdpbiB0bw0KPiArICogcHJpbnQgb3V0IGNvbGxlY3RlZCBzdGF0
ZSBhdCBwYXJ0aWN1bGFyIHBvaW50cyB3aGVuIGRlYnVnZ2luZyBhDQo+ICsgKiBwcm9ncmFt
Lg0KPiArICovDQo+ICtRRU1VX1BMVUdJTl9BUEkNCj4gK3ZvaWQgcWVtdV9wbHVnaW5fcmVn
aXN0ZXJfZ2RiX2NiKHFlbXVfcGx1Z2luX2lkX3QgaWQsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBxZW11X3BsdWdpbl91ZGF0YV9jYl90IGNiLCB2b2lkICp1c2Vy
ZGF0YSk7DQo+ICsNCj4gICAvKiByZXR1cm5zIGhvdyBtYW55IHZjcHVzIHdlcmUgc3RhcnRl
ZCBhdCB0aGlzIHBvaW50ICovDQo+ICAgaW50IHFlbXVfcGx1Z2luX251bV92Y3B1cyh2b2lk
KTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL3BsdWdpbnMvcGx1Z2luLmggYi9wbHVnaW5zL3Bs
dWdpbi5oDQo+IGluZGV4IDMwZTIyOTlhNTQuLmYzNzY2N2M5ZmIgMTAwNjQ0DQo+IC0tLSBh
L3BsdWdpbnMvcGx1Z2luLmgNCj4gKysrIGIvcGx1Z2lucy9wbHVnaW4uaA0KPiBAQCAtMTE4
LDQgKzExOCwxMyBAQCBzdHJ1Y3QgcWVtdV9wbHVnaW5fc2NvcmVib2FyZCAqcGx1Z2luX3Nj
b3JlYm9hcmRfbmV3KHNpemVfdCBlbGVtZW50X3NpemUpOw0KPiAgIA0KPiAgIHZvaWQgcGx1
Z2luX3Njb3JlYm9hcmRfZnJlZShzdHJ1Y3QgcWVtdV9wbHVnaW5fc2NvcmVib2FyZCAqc2Nv
cmUpOw0KPiAgIA0KPiArLyoqDQo+ICsgKiBwbHVnaW5fcmVnaXN0ZXJfZ2Ric3R1Yl9jb21t
YW5kcyAtIHJlZ2lzdGVyIGdkYnN0dWIgY29tbWFuZHMNCj4gKyAqDQo+ICsgKiBUaGlzIHNo
b3VsZCBvbmx5IGJlIGNhbGxlZCBvbmNlIHRvIHJlZ2lzdGVyIGdkYnN0dWIgY29tbWFuZHMg
c28gd2UNCj4gKyAqIGNhbiB0cmlnZ2VyIGNhbGxiYWNrcyBpZiBuZWVkZWQuDQo+ICsgKi8N
Cj4gK3ZvaWQgcGx1Z2luX3JlZ2lzdGVyX2dkYnN0dWJfY29tbWFuZHModm9pZCk7DQo+ICsN
Cj4gKw0KPiAgICNlbmRpZiAvKiBQTFVHSU5fSCAqLw0KPiBkaWZmIC0tZ2l0IGEvcGx1Z2lu
cy9hcGkuYyBiL3BsdWdpbnMvYXBpLmMNCj4gaW5kZXggMjRlYTY0ZTJkZS4uNjIxNDE2MTZm
NCAxMDA2NDQNCj4gLS0tIGEvcGx1Z2lucy9hcGkuYw0KPiArKysgYi9wbHVnaW5zL2FwaS5j
DQo+IEBAIC02ODEsMyArNjgxLDIxIEBAIHZvaWQgcWVtdV9wbHVnaW5fdXBkYXRlX25zKGNv
bnN0IHZvaWQgKmhhbmRsZSwgaW50NjRfdCBuZXdfdGltZSkNCj4gICAgICAgfQ0KPiAgICNl
bmRpZg0KPiAgIH0NCj4gKw0KPiArLyoNCj4gKyAqIGdkYnN0dWIgaG9va3MNCj4gKyAqLw0K
PiArDQo+ICtzdGF0aWMgYm9vbCBnZGJzdHViX2NhbGxiYWNrczsNCj4gKw0KPiArdm9pZCBx
ZW11X3BsdWdpbl9yZWdpc3Rlcl9nZGJfY2IocWVtdV9wbHVnaW5faWRfdCBpZCwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHFlbXVfcGx1Z2luX3VkYXRhX2NiX3Qg
Y2IsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICp1ZGF0YSkN
Cj4gK3sNCj4gKyAgICBwbHVnaW5fcmVnaXN0ZXJfY2JfdWRhdGEoaWQsIFFFTVVfUExVR0lO
X0VWX0dEQlNUVUIsIGNiLCB1ZGF0YSk7DQo+ICsNCj4gKyAgICBpZiAoIWdkYnN0dWJfY2Fs
bGJhY2tzKSB7DQo+ICsgICAgICAgIHBsdWdpbl9yZWdpc3Rlcl9nZGJzdHViX2NvbW1hbmRz
KCk7DQo+ICsgICAgICAgIGdkYnN0dWJfY2FsbGJhY2tzID0gdHJ1ZTsNCj4gKyAgICB9DQo+
ICt9DQo+IGRpZmYgLS1naXQgYS9wbHVnaW5zL2NvcmUuYyBiL3BsdWdpbnMvY29yZS5jDQo+
IGluZGV4IGJiMTA1ZThlNjguLmU3ZmNlMDg3OTkgMTAwNjQ0DQo+IC0tLSBhL3BsdWdpbnMv
Y29yZS5jDQo+ICsrKyBiL3BsdWdpbnMvY29yZS5jDQo+IEBAIC0yMyw2ICsyMyw3IEBADQo+
ICAgI2luY2x1ZGUgInFlbXUveHhoYXNoLmgiDQo+ICAgI2luY2x1ZGUgInFlbXUvcmN1Lmgi
DQo+ICAgI2luY2x1ZGUgImh3L2NvcmUvY3B1LmgiDQo+ICsjaW5jbHVkZSAiZ2Ric3R1Yi9j
b21tYW5kcy5oIg0KPiAgIA0KPiAgICNpbmNsdWRlICJleGVjL2V4ZWMtYWxsLmgiDQo+ICAg
I2luY2x1ZGUgImV4ZWMvdGItZmx1c2guaCINCj4gQEAgLTE0Nyw2ICsxNDgsNyBAQCBzdGF0
aWMgdm9pZCBwbHVnaW5fY2JfX3VkYXRhKGVudW0gcWVtdV9wbHVnaW5fZXZlbnQgZXYpDQo+
ICAgDQo+ICAgICAgIHN3aXRjaCAoZXYpIHsNCj4gICAgICAgY2FzZSBRRU1VX1BMVUdJTl9F
Vl9BVEVYSVQ6DQo+ICsgICAgY2FzZSBRRU1VX1BMVUdJTl9FVl9HREJTVFVCOg0KPiAgICAg
ICAgICAgUUxJU1RfRk9SRUFDSF9TQUZFX1JDVShjYiwgJnBsdWdpbi5jYl9saXN0c1tldl0s
IGVudHJ5LCBuZXh0KSB7DQo+ICAgICAgICAgICAgICAgcWVtdV9wbHVnaW5fdWRhdGFfY2Jf
dCBmdW5jID0gY2ItPmYudWRhdGE7DQo+ICAgDQo+IEBAIC03NjgsMyArNzcwLDM4IEBAIHZv
aWQgcGx1Z2luX3Njb3JlYm9hcmRfZnJlZShzdHJ1Y3QgcWVtdV9wbHVnaW5fc2NvcmVib2Fy
ZCAqc2NvcmUpDQo+ICAgICAgIGdfYXJyYXlfZnJlZShzY29yZS0+ZGF0YSwgVFJVRSk7DQo+
ICAgICAgIGdfZnJlZShzY29yZSk7DQo+ICAgfQ0KPiArDQo+ICsvKg0KPiArICogZ2Ric3R1
YiBpbnRlZ3JhdGlvbg0KPiArICovDQo+ICsNCj4gK3N0YXRpYyB2b2lkIGhhbmRsZV9wbHVn
aW5fY2IoR0FycmF5ICpwYXJhbXMsIHZvaWQgKnVzZXJfY3R4KQ0KPiArew0KPiArICAgIHBs
dWdpbl9jYl9fdWRhdGEoUUVNVV9QTFVHSU5fRVZfR0RCU1RVQik7DQo+ICsgICAgZ2RiX3B1
dF9wYWNrZXQoIk9LIik7DQo+ICt9DQo+ICsNCj4gK2VudW0gQ29tbWFuZCB7DQo+ICsgICAg
UGx1Z2luQ2FsbGJhY2ssDQo+ICsgICAgTlVNX0dEQl9DTURTDQo+ICt9Ow0KPiArDQo+ICtz
dGF0aWMgY29uc3QgR2RiQ21kUGFyc2VFbnRyeSBjbWRfaGFuZGxlcl90YWJsZVtOVU1fR0RC
X0NNRFNdID0gew0KPiArICAgIFtQbHVnaW5DYWxsYmFja10gPSB7DQo+ICsgICAgICAgIC5o
YW5kbGVyID0gaGFuZGxlX3BsdWdpbl9jYiwNCj4gKyAgICAgICAgLmNtZF9zdGFydHN3aXRo
ID0gdHJ1ZSwNCj4gKyAgICAgICAgLmNtZCA9ICJxZW11LnBsdWdpbl9jYiIsDQo+ICsgICAg
ICAgIC5zY2hlbWEgPSAicz8iLA0KPiArICAgIH0sDQo+ICt9Ow0KPiArDQo+ICt2b2lkIHBs
dWdpbl9yZWdpc3Rlcl9nZGJzdHViX2NvbW1hbmRzKHZvaWQpDQo+ICt7DQo+ICsgICAgZ19h
dXRvcHRyKEdQdHJBcnJheSkgc2V0X3RhYmxlID0gZ19wdHJfYXJyYXlfbmV3KCk7DQo+ICsN
Cj4gKyAgICBmb3IgKGludCBpID0gMDsgaSA8IE5VTV9HREJfQ01EUzsgaSsrKSB7DQo+ICsg
ICAgICAgIGdfcHRyX2FycmF5X2FkZChzZXRfdGFibGUsIChncG9pbnRlcikgJmNtZF9oYW5k
bGVyX3RhYmxlW1BsdWdpbkNhbGxiYWNrXSk7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgZ2Ri
X2V4dGVuZF9zZXRfdGFibGUoc2V0X3RhYmxlKTsNCj4gK30NCj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL3RjZy9wbHVnaW5zL21lbS5jIGIvdGVzdHMvdGNnL3BsdWdpbnMvbWVtLmMNCj4gaW5k
ZXggYjBmYThhOWYyNy4uZDQxNmQ5MmZjMiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvdGNnL3Bs
dWdpbnMvbWVtLmMNCj4gKysrIGIvdGVzdHMvdGNnL3BsdWdpbnMvbWVtLmMNCj4gQEAgLTc1
LDggKzc1LDcgQEAgc3RhdGljIGdpbnQgYWRkcl9vcmRlcihnY29uc3Rwb2ludGVyIGEsIGdj
b25zdHBvaW50ZXIgYikNCj4gICAgICAgcmV0dXJuIG5hLT5yZWdpb25fYWRkcmVzcyA+IG5i
LT5yZWdpb25fYWRkcmVzcyA/IDEgOiAtMTsNCj4gICB9DQo+ICAgDQo+IC0NCj4gLXN0YXRp
YyB2b2lkIHBsdWdpbl9leGl0KHFlbXVfcGx1Z2luX2lkX3QgaWQsIHZvaWQgKnApDQo+ICtz
dGF0aWMgdm9pZCBwbHVnaW5fcmVwb3J0KHFlbXVfcGx1Z2luX2lkX3QgaWQsIHZvaWQgKnAp
DQo+ICAgew0KPiAgICAgICBnX2F1dG9wdHIoR1N0cmluZykgb3V0ID0gZ19zdHJpbmdfbmV3
KCIiKTsNCj4gICANCj4gQEAgLTkwLDYgKzg5LDcgQEAgc3RhdGljIHZvaWQgcGx1Z2luX2V4
aXQocWVtdV9wbHVnaW5faWRfdCBpZCwgdm9pZCAqcCkNCj4gICAgICAgfQ0KPiAgICAgICBx
ZW11X3BsdWdpbl9vdXRzKG91dC0+c3RyKTsNCj4gICANCj4gKyAgICBnX211dGV4X2xvY2so
JmxvY2spOw0KPiAgIA0KPiAgICAgICBpZiAoZG9fcmVnaW9uX3N1bW1hcnkpIHsNCj4gICAg
ICAgICAgIEdMaXN0ICpjb3VudHMgPSBnX2hhc2hfdGFibGVfZ2V0X3ZhbHVlcyhyZWdpb25z
KTsNCj4gQEAgLTExNCw2ICsxMTQsMTIgQEAgc3RhdGljIHZvaWQgcGx1Z2luX2V4aXQocWVt
dV9wbHVnaW5faWRfdCBpZCwgdm9pZCAqcCkNCj4gICAgICAgICAgIHFlbXVfcGx1Z2luX291
dHMob3V0LT5zdHIpOw0KPiAgICAgICB9DQo+ICAgDQo+ICsgICAgZ19tdXRleF91bmxvY2so
JmxvY2spOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBwbHVnaW5fZXhpdChxZW11X3Bs
dWdpbl9pZF90IGlkLCB2b2lkICpwKQ0KPiArew0KPiArICAgIHBsdWdpbl9yZXBvcnQoaWQs
IHApOw0KPiAgICAgICBxZW11X3BsdWdpbl9zY29yZWJvYXJkX2ZyZWUoY291bnRzKTsNCj4g
ICB9DQo+ICAgDQo+IEBAIC00MDAsNiArNDA2LDcgQEAgUUVNVV9QTFVHSU5fRVhQT1JUIGlu
dCBxZW11X3BsdWdpbl9pbnN0YWxsKHFlbXVfcGx1Z2luX2lkX3QgaWQsDQo+ICAgICAgICAg
ICBjb3VudHMsIENQVUNvdW50LCBtZW1fY291bnQpOw0KPiAgICAgICBpb19jb3VudCA9IHFl
bXVfcGx1Z2luX3Njb3JlYm9hcmRfdTY0X2luX3N0cnVjdChjb3VudHMsIENQVUNvdW50LCBp
b19jb3VudCk7DQo+ICAgICAgIHFlbXVfcGx1Z2luX3JlZ2lzdGVyX3ZjcHVfdGJfdHJhbnNf
Y2IoaWQsIHZjcHVfdGJfdHJhbnMpOw0KPiArICAgIHFlbXVfcGx1Z2luX3JlZ2lzdGVyX2dk
Yl9jYihpZCwgcGx1Z2luX3JlcG9ydCwgTlVMTCk7DQo+ICAgICAgIHFlbXVfcGx1Z2luX3Jl
Z2lzdGVyX2F0ZXhpdF9jYihpZCwgcGx1Z2luX2V4aXQsIE5VTEwpOw0KPiAgICAgICByZXR1
cm4gMDsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS9wbHVnaW5zL3FlbXUtcGx1Z2lucy5zeW1i
b2xzIGIvcGx1Z2lucy9xZW11LXBsdWdpbnMuc3ltYm9scw0KPiBpbmRleCAwMzI2NjFmOWVh
Li5kMjcyZThlMGYzIDEwMDY0NA0KPiAtLS0gYS9wbHVnaW5zL3FlbXUtcGx1Z2lucy5zeW1i
b2xzDQo+ICsrKyBiL3BsdWdpbnMvcWVtdS1wbHVnaW5zLnN5bWJvbHMNCj4gQEAgLTI1LDYg
KzI1LDcgQEANCj4gICAgIHFlbXVfcGx1Z2luX3JlYWRfcmVnaXN0ZXI7DQo+ICAgICBxZW11
X3BsdWdpbl9yZWdpc3Rlcl9hdGV4aXRfY2I7DQo+ICAgICBxZW11X3BsdWdpbl9yZWdpc3Rl
cl9mbHVzaF9jYjsNCj4gKyAgcWVtdV9wbHVnaW5fcmVnaXN0ZXJfZ2RiX2NiOw0KPiAgICAg
cWVtdV9wbHVnaW5fcmVnaXN0ZXJfdmNwdV9leGl0X2NiOw0KPiAgICAgcWVtdV9wbHVnaW5f
cmVnaXN0ZXJfdmNwdV9pZGxlX2NiOw0KPiAgICAgcWVtdV9wbHVnaW5fcmVnaXN0ZXJfdmNw
dV9pbml0X2NiOw0KDQpUaGlzIGlzIGEgdmVyeSBuaWNlIGFkZGl0aW9uIQ0KQmV5b25kIGRl
dmVsb3BlcnMsIGl0IGNhbiBiZSB2ZXJ5IHVzZWZ1bCBmb3IgcGx1Z2lucyBiZWNhdXNlIHlv
dSBjYW4gDQpzdGFydCB0byBzY3JpcHQgaW5zdHJ1bWVudGF0aW9uIHVzaW5nIGdkYi4NCg0K
V291bGQgdGhhdCBiZSBwb3NzaWJsZSB0byByZWdpc3RlciBzZXZlcmFsIGNvbW1hbmRzLCB3
aXRoIGRpZmZlcmVudCANCm5hbWVzPyBJdCBzZWVtcyBhIGJpdCBhcmJpdHJhcnkgdG8gYmUg
YWJsZSB0byByZWdpc3RlciBvbmx5IG9uZSBjb21tYW5kLCANCndpdGggYSBmaXhlZCBuYW1l
LCB3aGVuIHdlIGNvdWxkIGhhdmUgc2V2ZXJhbC4NCg0KSW4gbW9yZSwgaXQgY291bGQgYmUg
bmljZSB0byBiZSBhYmxlIHRvIHBhc3MgYSBsaXN0IG9mIHBhcmFtZXRlcnMgKGFzIGEgDQpz
aW1wbGUgc3RyaW5nIG9yIHN0cmluZyBhcnJheSkgdG8gdGhlIGNhbGxiYWNrIG9uIHBsdWdp
biBzaWRlLg0K
