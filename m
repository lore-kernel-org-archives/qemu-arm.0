Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1252879dlb;
        Tue, 10 Sep 2024 07:45:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:3946:b0:1cc:cdb6:c116 with SMTP id adf61e73a8af0-1cf5e118a51mr1632946637.24.1725979538381;
        Tue, 10 Sep 2024 07:45:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725979538; cv=none;
        d=google.com; s=arc-20160816;
        b=qvnno4IVuCjzSV2J3m0tQW0H2LPJrm9qo1UeKFeMG0SNKIet9xUk6/aGxyCA68Sn8b
         1KI9Qus4jrIfqu08kG0ggFGHXo8EYgiDENABxFsTzPc7aDxlMc50fgN3one1mcd91z29
         4uHLVRQTF1HBU9HqV/a1gc6Av2rLg1wowoHHCtjEJ05+mIlSbiskIBM89N2SgeYrkly+
         RCph16Dk5vvlFHDL6T9NishCIETNft8kFZ5ceNYnuf15SxWq9YCgzr1WBjXw6B+k2mvE
         dRKv/2Bv/NvAKknFCZXigJk8HheitwJqHKbaqEKTYOtWFdeRZ7ET8RTPCSpJd6KLfCQX
         3EDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bS1uaeiA2qzCfufSwt86f2yxHhL6VkmwiCgjK4QoTfE=;
        fh=FLkZ1UhBvtv+NiZhvZkAdPJmE6xJU+OCqlRQdD0wjog=;
        b=nSXHMuWFoB1KrARrszn27hNaae81J+ZeMk3wONSMxACiwoTJMZNAFHYoctSuDOPSID
         +ugQ/8J4QHLx2AelS9KcQP4HC7NMXyZyP/6X3ip1OND9+OmiFkKMo67BVQyYhZgF4uUQ
         R7iMtMM1VCAz2EL4moO6I21WzDtizMEIqho6X+7BZLcRs7QBL2yeDADaZ2X7ZgxTjWGy
         sQyY2SAzszs/ahSVjFJ/AcMcVPQ29MjjzodpJUuEODZ3smtEFfgjynzOWyLqapf1C/To
         5jqsBFoB8Jij86okm2d3Toi/Egcu2aRyJ9hwQEj+/Xa1GC8wPvcxcX3YQWMYoJBlXebc
         SIIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rjuZu8Ia;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e57dcc5esor3572173b3a.0.2024.09.10.07.45.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 07:45:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rjuZu8Ia;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725979538; x=1726584338; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bS1uaeiA2qzCfufSwt86f2yxHhL6VkmwiCgjK4QoTfE=;
        b=rjuZu8IaJX3jfnpBvWxHHtCiuBU6lA3Lg9FaOafsFxjHashJ/X7I3nIsKhUl41WCac
         pNGBIugno8PqVYKUMVskyFDUw3FIJ99RuAfyl6AmPxEljHfU46H8TBTD+msVnYp6vQzt
         Xnwigi8+xMDBJ3WD1WSUrX5C3ZbhoHf/q8NTrb4DCYcgayLEPkK7cBdI/cNAGhihGZi7
         8N7CLdImiWlQfpEOzM25mZSBZWHkRGNgZWqqCetgma2K8PIy28HcY6/NSlOwILxF4v/W
         FMeqc3YTjCmJggAFWEmj8aFWgGsavUquBkvYBQ1ysTFFnSwGgG1U6B3CIWRNLqZnu+Oh
         RcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979538; x=1726584338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bS1uaeiA2qzCfufSwt86f2yxHhL6VkmwiCgjK4QoTfE=;
        b=g2Hn7Z2pqZdIjJ/kHTIcMwbeQ2jQBN5Qm7+CEbeGs7/aIaqVwf2g7wWz7kcFJhL0zJ
         +gllzm0qm9J8bbLt+ZhThUFK83h9E+JGCivbRRcF+0vT/qbjKDDy5SrfH08TXb663Qsu
         R9EvxTGjy05kDI4M9REJ7ZmqUJHS2HQ0IHrPub4QTc7NHzC//jQQaK0ZkGEEj61uyVyy
         h04Z0+twtnAtnGsItUp45DxHSe6omFLe+918hTEhF1V2DaCvsVE+NmD2brmIP9YjzqKS
         y/J+GLnZinVXPG4tBfMHKB/y+9Drzeye3EUl/FRWXr/AAtO08AwZQd+1jfF+cb5WzIJp
         uHvw==
X-Gm-Message-State: AOJu0YwhR0dBPY2vgyiO1IJK4UoGJjAmVRHSdhI9kp9fosFEzi/hBN5O
	PDPo58YoO5/Q2GNGYUyyHqmHm9EDuejSqpnhpnYXxUTUtp9VnUwtO7GUeQRXb9iPWFmLVeMMxGB
	TCC7h65Jb
X-Google-Smtp-Source: AGHT+IG+TjhcgpBQzdG682QzQHjM9xCXeHO9pUyCcyNxFg1IaKiuRJgWF33XTc1WRzTmKT8PAh4D9w==
X-Received: by 2002:a05:6a20:c703:b0:1cf:590f:ddbc with SMTP id adf61e73a8af0-1cf5e0b7845mr1420892637.18.1725979537868;
        Tue, 10 Sep 2024 07:45:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003c57sm1450130b3a.89.2024.09.10.07.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:45:37 -0700 (PDT)
Message-ID: <b3de06df-3f90-4e71-b923-f9f7a4fa0584@linaro.org>
Date: Tue, 10 Sep 2024 07:45:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/26] deprecation: don't enable TCG plugins by default on
 32 bit hosts
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
 <20240910140733.4007719-12-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240910140733.4007719-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: uChC5u/h10Gv

T24gOS8xMC8yNCAwNzowNywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGUgZXhpc3Rpbmcg
cGx1Z2lucyBhbHJlYWR5IGxpYmVyYWxseSB1c2UgaG9zdCBwb2ludGVyIHN0dWZmaW5nIGZv
cg0KPiBwYXNzaW5nIHVzZXIgZGF0YSB3aGljaCB3aWxsIGZhaWwgd2hlbiBkb2luZyA2NCBi
aXQgZ3Vlc3RzIG9uIDMyIGJpdA0KPiBob3N0cy4gV2Ugc2hvdWxkIGRpc2NvdXJhZ2UgdGhp
cyBieSBvZmZpY2lhbGx5IGRlcHJlY2F0aW5nIHN1cHBvcnQgYW5kDQo+IGFkZGluZyBhbm90
aGVyIG5haWwgdG8gdGhlIDMyIGJpdCBob3N0IGNvZmZpbi4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gDQo+IC0tLQ0K
PiB2Mg0KPiAgICAtIGRvbid0IG1hbnVhbGx5IHNldCBiYXNlZCBvbiBDUFUgdHlwZSwgdXNl
IF9fU0laRU9GX1BPSU5URVJfXw0KPiAtLS0NCj4gICBkb2NzL2Fib3V0L2RlcHJlY2F0ZWQu
cnN0IHwgMTEgKysrKysrKysrKysNCj4gICBjb25maWd1cmUgICAgICAgICAgICAgICAgIHwg
MjEgKysrKysrKysrKysrKysrKysrKystDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZG9jcy9hYm91
dC9kZXByZWNhdGVkLnJzdCBiL2RvY3MvYWJvdXQvZGVwcmVjYXRlZC5yc3QNCj4gaW5kZXgg
ODhmMGYwMzc4Ni4uZjdjN2MzM2QzOSAxMDA2NDQNCj4gLS0tIGEvZG9jcy9hYm91dC9kZXBy
ZWNhdGVkLnJzdA0KPiArKysgYi9kb2NzL2Fib3V0L2RlcHJlY2F0ZWQucnN0DQo+IEBAIC0x
ODQsNiArMTg0LDE3IEBAIGJlIGFuIGVmZmVjdGl2ZSB1c2Ugb2YgaXRzIGxpbWl0ZWQgcmVz
b3VyY2VzLCBhbmQgdGh1cyBpbnRlbmRzIHRvIGRpc2NvbnRpbnVlDQo+ICAgaXQuIFNpbmNl
IGFsbCByZWNlbnQgeDg2IGhhcmR3YXJlIGZyb20gdGhlIHBhc3QgPjEwIHllYXJzIGlzIGNh
cGFibGUgb2YgdGhlDQo+ICAgNjQtYml0IHg4NiBleHRlbnNpb25zLCBhIGNvcnJlc3BvbmRp
bmcgNjQtYml0IE9TIHNob3VsZCBiZSB1c2VkIGluc3RlYWQuDQo+ICAgDQo+ICtUQ0cgUGx1
Z2luIHN1cHBvcnQgbm90IGVuYWJsZWQgYnkgZGVmYXVsdCBvbiAzMi1iaXQgaG9zdHMgKHNp
bmNlIDkuMikNCj4gKycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycnJycn
JycnJycnJycnJycnJycnJycnJycnJycnJycnJw0KPiArDQo+ICtXaGlsZSBpdCBpcyBzdGls
bCBwb3NzaWJsZSB0byBlbmFibGUgVENHIHBsdWdpbiBzdXBwb3J0IGZvciAzMi1iaXQNCj4g
K2hvc3RzIHRoZXJlIGFyZSBhIG51bWJlciBvZiBwb3RlbnRpYWwgcGl0ZmFsbHMgd2hlbiBp
bnN0cnVtZW50aW5nDQo+ICs2NC1iaXQgZ3Vlc3RzLiBUaGUgcGx1Z2luIEFQSXMgdHlwaWNh
bGx5IHBhc3MgbW9zdCBhZGRyZXNzZXMgYXMNCj4gK3VpbnQ2NF90IGJ1dCBwcmFjdGljZXMg
bGlrZSBlbmNvZGluZyB0aGF0IGFkZHJlc3MgaW4gYSBob3N0IHBvaW50ZXINCj4gK2ZvciBw
YXNzaW5nIGFzIHVzZXItZGF0YSB3aWxsIGxvc2UgZGF0YS4gQXMgbW9zdCBzb2Z0d2FyZSBh
bmFseXNpcw0KPiArYmVuZWZpdHMgZnJvbSBoYXZpbmcgcGxlbnR5IG9mIGhvc3QgbWVtb3J5
IGl0IHNlZW1zIHJlYXNvbmFibGUgdG8NCj4gK2VuY291cmFnZSB1c2VycyB0byB1c2UgNjQg
Yml0IGJ1aWxkcyBvZiBRRU1VIGZvciBhbmFseXNpcyB3b3JrDQo+ICt3aGF0ZXZlciB0YXJn
ZXRzIHRoZXkgYXJlIGluc3RydW1lbnRpbmcuDQo+ICAgDQo+ICAgU3lzdGVtIGVtdWxhdG9y
IENQVXMNCj4gICAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBkaWZmIC0tZ2l0IGEvY29uZmln
dXJlIGIvY29uZmlndXJlDQo+IGluZGV4IDQwMTg2ZDg2NWUuLjE0NTgxYzFiOWEgMTAwNzU1
DQo+IC0tLSBhL2NvbmZpZ3VyZQ0KPiArKysgYi9jb25maWd1cmUNCj4gQEAgLTUxNiw2ICs1
MTYsMjUgQEAgY2FzZSAiJGNwdSIgaW4NCj4gICAgICAgOzsNCj4gICBlc2FjDQo+ICAgDQo+
ICsjIE5vdyB3ZSBoYXZlIG91ciBDUFVfQ0ZMQUdTIHdlIGNhbiBjaGVjayBpZiB3ZSBhcmUg
dGFyZ2V0aW5nIGEgMzIgb3INCj4gKyMgNjQgYml0IGhvc3QuDQo+ICsNCj4gK2NoZWNrXzY0
Yml0X2hvc3QoKSB7DQo+ICtjYXQgPiAkVE1QQyA8PEVPRg0KPiArI2lmIF9fU0laRU9GX1BP
SU5URVJfXyAhPSA4DQo+ICsjZXJyb3Igbm90IDY0IGJpdCBzeXN0ZW0NCj4gKyNlbmRpZg0K
PiAraW50IG1haW4odm9pZCkgeyByZXR1cm4gMDsgfQ0KPiArRU9GDQo+ICsgIGNvbXBpbGVf
b2JqZWN0ICIkMSINCj4gK30NCj4gKw0KPiAraWYgY2hlY2tfNjRiaXRfaG9zdCAiJENQVV9D
RkxBR1MiOyB0aGVuDQo+ICsgICAgaG9zdF9iaXRzPTY0DQo+ICtlbHNlDQo+ICsgICAgaG9z
dF9iaXRzPTMyDQo+ICtmaQ0KPiArDQo+ICAgaWYgdGVzdCAtbiAiJGhvc3RfYXJjaCIgJiYg
ew0KPiAgICAgICAhIHRlc3QgLWQgIiRzb3VyY2VfcGF0aC9saW51eC11c2VyL2luY2x1ZGUv
aG9zdC8kaG9zdF9hcmNoIiB8fA0KPiAgICAgICAhIHRlc3QgLWQgIiRzb3VyY2VfcGF0aC9j
b21tb24tdXNlci9ob3N0LyRob3N0X2FyY2giOyB9OyB0aGVuDQo+IEBAIC0xMDI4LDcgKzEw
NDcsNyBAQCBpZiB0ZXN0ICIkc3RhdGljIiA9ICJ5ZXMiIDsgdGhlbg0KPiAgICAgZmkNCj4g
ICAgIHBsdWdpbnM9Im5vIg0KPiAgIGZpDQo+IC1pZiB0ZXN0ICIkcGx1Z2lucyIgIT0gIm5v
IjsgdGhlbg0KPiAraWYgdGVzdCAiJHBsdWdpbnMiICE9ICJubyIgJiYgdGVzdCAkaG9zdF9i
aXRzIC1lcSA2NDsgdGhlbg0KPiAgICAgcGx1Z2lucz15ZXMNCj4gICAgIHN1YmRpcnM9IiRz
dWJkaXJzIGNvbnRyaWIvcGx1Z2lucyINCj4gICBmaQ0KDQpUaGFua3MsIGl0IHNob3VsZCBv
cGVuIHRoZSBkb29yIHRvIGJlIGFibGUgdG8gYnVpbGQgcGx1Z2lucyB3aXRoIG1lc29uLg0K
UmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJv
Lm9yZz4NCg==
