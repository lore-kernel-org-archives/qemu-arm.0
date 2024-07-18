Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1553503njk;
        Thu, 18 Jul 2024 09:37:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:218b:b0:706:6bf8:bd7 with SMTP id d2e1a72fcca58-70cfc9a87edmr44883b3a.21.1721320639406;
        Thu, 18 Jul 2024 09:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721320639; cv=none;
        d=google.com; s=arc-20160816;
        b=UKHhw2tDfbG+fCu5RLGTsOT5avuvrXN+AE2Dya0IXwrH/mvQyL5N2vcz4pa7AOK68F
         wellXwXWKgB6YW0T+aWfPmyKLadWw5bwWXX6xbes/s11Fd630zHZz7aHxk58fze7UKx7
         OIzR/27NfSqhr2LAAVfqdtnRrZRM+rxExV96E2lGVnn9P6Mg9THoKK1NHMInhriE40cx
         Ih7n2/LZrELAYFetSw0A6FFElRdost4HNQtVZGWrMx7QJJJo4zohBF9yBfDdZWOuLp58
         D7+Jcke5J6UJY5RqHAyCuh54OSd75WGHqF0wP6kwDIqHPRUwesMpXD5ohogOWEsj4GIK
         XjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eqdi2BHBpEuI4VyEbfEKSvh1dxk1gfu947ZuFjPUVH8=;
        fh=rAdFhVXCg/cKovISjpW1ttYQ6f5FA18LCHFOB4fdVdc=;
        b=sePZwgHIs1Gu0Tgr+kpsW6jtOe5ZwKHBYEfIeVtv8iwgRpx5iyyuFYneyVmsPJhFMb
         n2/8v5sDBz/Jj03x/5PIQ0z97dxicATEHpHyVN7jMtLoDvK2Ng/cnThKkBRRn/233IJS
         nMESGSB2pLDYMkLa4Y9l+m8ETZYWSwS6B+xk7/QXCmOqcXGrd1b/SuQjmhpqUC/5HlMR
         cC0ZoUM8YJlpZFcBzcAOnjyqX8ArPJPRK1okOM7I7jWCuDdxAlz6uNpXYBYCBEMIfRMn
         qnSjRKMg3bRjjYKkdua19lE1BRdyOPJ5jV8902yUsjbQQ/n9jHeaNBT7D07w/c9WrF7L
         bX0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXdRsRiv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-70cfc7190f3sor47063b3a.5.2024.07.18.09.37.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Jul 2024 09:37:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXdRsRiv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721320638; x=1721925438; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqdi2BHBpEuI4VyEbfEKSvh1dxk1gfu947ZuFjPUVH8=;
        b=LXdRsRiv2SwmoDZizXWIcbLdeiQ7t225v6JQuHXNHy54jfUjHLfhsQh01wfiQsr5tK
         cBxFbpdpY+yBiL2yaFLv1qHZdr563keBoD8FukY2eWrqS/xO3knFcpVY1ypWEyunXDmh
         hwZCJuZkDi2JYH6r0Ac8CyGAWJZh9GN9/gyAc6tfiG6R7gWhkgu1vAvIfQOzbnA8d+VR
         5LWv1Q3b6huHd2mBu29aiTrMujUBVr8/RGogweR4c0LL9VRrPkCx9tFuSlCAkQ/jAubz
         BuvHZPzrjXrDuI6aYwIP2K3iPm22xM2GQj9kgCR6HVZtyaMY6/9PSmPaTE43OFBp7tVk
         89lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721320638; x=1721925438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eqdi2BHBpEuI4VyEbfEKSvh1dxk1gfu947ZuFjPUVH8=;
        b=p8HzVksHjdFL2nhvwQobhOmV/Bd08hSikCRYNiOVCy7lBLfdm3GPZ5+c2htLn0rM66
         1Cvzn45JHZ50Dap2awTBjxe0yhAe5AXnM1XeE1ljdrHZb8Et2E0NIQczzDyTdLmor9Xd
         61g16cKoM12MTfsFqqFVmbZdj4lWHkuwrUzZD8ObqjJrO/nsqm/A15QbiVhm4JqY8o3k
         Kz5SNTCB4qpv38ufXvQf8wvHiLzXLU2uyjJN7y660hLlIQsvNw0Hh+b87qizhWXODzHt
         c0RMaTiu5F4wP3Qpd54Zp1v8QKhDMXLmAv+h9bv3ny9ldEnWz70Dpfjamh/WwGCByFXY
         wBVQ==
X-Gm-Message-State: AOJu0YzPWKo9uyyLoVzK9j9D6eHrsrI1SQHl8+N6WV0Z9bmJD2Npd9Aw
	rJRoIJKJ8ADcFxmTfNRD5OdQsLv5IRz8gn/KmJb/T7u0vFU/1yT4RPVhA7DNbArWSKsAfBuQvwg
	7u+WuGQ==
X-Google-Smtp-Source: AGHT+IFJ+eZLrDTkGJvBiJm9OBAX0l1vKuJDb/lsh3rnxcuBr6/FV5EcJKeBL35tVlwgZh6InfgfsA==
X-Received: by 2002:a05:6a20:8423:b0:1c0:f6d5:be9a with SMTP id adf61e73a8af0-1c3fddc4176mr7580639637.36.1721320638318;
        Thu, 18 Jul 2024 09:37:18 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::b861? ([2604:3d08:9384:1d00::b861])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-790c3ac9811sm5693865a12.52.2024.07.18.09.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 09:37:17 -0700 (PDT)
Message-ID: <0d515c6c-c046-4704-b69a-4b3cf535577c@linaro.org>
Date: Thu, 18 Jul 2024 09:37:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] tests/plugins: use qemu_plugin_outs for inline
 stats
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Bin Meng <bmeng.cn@gmail.com>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Beraldo Leal <bleal@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
 <20240718094523.1198645-7-alex.bennee@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240718094523.1198645-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: uMlc1f/WymNJ

T24gNy8xOC8yNCAwMjo0NSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBVc2luZyBiYXJlIHBy
aW50ZidzIGluIHBsdWdpbnMgaXMgcGVyZmVjdGx5IGFjY2VwdGFibGUgYnV0IHRoZXkgZG8N
Cj4gcmF0aGVyIG1lc3MgdXAgdGhlIG91dHB1dCBvZiAibWFrZSBjaGVjay10Y2ciLiBDb252
ZXJ0IHRoZSBwcmludGZzIHRvDQo+IHVzZSBnX3N0cmluZyBhbmQgdGhlbiBvdXRwdXQgd2l0
aCB0aGUgcGx1Z2luIG91dHB1dCBoZWxwZXIgd2hpY2ggd2lsbA0KPiBhbHJlYWR5IGJlIGNh
cHR1cmVkIHRvIC5wb3V0IGZpbGVzIGJ5IHRoZSB0ZXN0IGhhcm5lc3MuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IC0t
LQ0KPiAgIHRlc3RzL3BsdWdpbi9pbmxpbmUuYyB8IDU4ICsrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0
aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcGx1
Z2luL2lubGluZS5jIGIvdGVzdHMvcGx1Z2luL2lubGluZS5jDQo+IGluZGV4IGNkNjM4Mjdi
N2QuLjczZGRlOTk1NzggMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL3BsdWdpbi9pbmxpbmUuYw0K
PiArKysgYi90ZXN0cy9wbHVnaW4vaW5saW5lLmMNCj4gQEAgLTcxLDEwICs3MSwxMiBAQCBz
dGF0aWMgdm9pZCBzdGF0c19pbnNuKHZvaWQpDQo+ICAgICAgIGNvbnN0IHVpbnQ2NF90IGNv
bmRfdHJhY2tfbGVmdCA9IHFlbXVfcGx1Z2luX3U2NF9zdW0oaW5zbl9jb25kX3RyYWNrX2Nv
dW50KTsNCj4gICAgICAgY29uc3QgdWludDY0X3QgY29uZGl0aW9uYWwgPQ0KPiAgICAgICAg
ICAgY29uZF9udW1fdHJpZ2dlciAqIGNvbmRfdHJpZ2dlcl9saW1pdCArIGNvbmRfdHJhY2tf
bGVmdDsNCj4gLSAgICBwcmludGYoImluc246ICUiIFBSSXU2NCAiXG4iLCBleHBlY3RlZCk7
DQo+IC0gICAgcHJpbnRmKCJpbnNuOiAlIiBQUkl1NjQgIiAocGVyIHZjcHUpXG4iLCBwZXJf
dmNwdSk7DQo+IC0gICAgcHJpbnRmKCJpbnNuOiAlIiBQUkl1NjQgIiAocGVyIHZjcHUgaW5s
aW5lKVxuIiwgaW5sX3Blcl92Y3B1KTsNCj4gLSAgICBwcmludGYoImluc246ICUiIFBSSXU2
NCAiIChjb25kIGNiKVxuIiwgY29uZGl0aW9uYWwpOw0KPiArICAgIGdfYXV0b3B0cihHU3Ry
aW5nKSBzdGF0cyA9IGdfc3RyaW5nX25ldygiIik7DQo+ICsgICAgZ19zdHJpbmdfYXBwZW5k
X3ByaW50ZihzdGF0cywgImluc246ICUiIFBSSXU2NCAiXG4iLCBleHBlY3RlZCk7DQo+ICsg
ICAgZ19zdHJpbmdfYXBwZW5kX3ByaW50ZihzdGF0cywgImluc246ICUiIFBSSXU2NCAiIChw
ZXIgdmNwdSlcbiIsIHBlcl92Y3B1KTsNCj4gKyAgICBnX3N0cmluZ19hcHBlbmRfcHJpbnRm
KHN0YXRzLCAiaW5zbjogJSIgUFJJdTY0ICIgKHBlciB2Y3B1IGlubGluZSlcbiIsIGlubF9w
ZXJfdmNwdSk7DQo+ICsgICAgZ19zdHJpbmdfYXBwZW5kX3ByaW50ZihzdGF0cywgImluc246
ICUiIFBSSXU2NCAiIChjb25kIGNiKVxuIiwgY29uZGl0aW9uYWwpOw0KPiArICAgIHFlbXVf
cGx1Z2luX291dHMoc3RhdHMtPnN0cik7DQo+ICAgICAgIGdfYXNzZXJ0KGV4cGVjdGVkID4g
MCk7DQo+ICAgICAgIGdfYXNzZXJ0KHBlcl92Y3B1ID09IGV4cGVjdGVkKTsNCj4gICAgICAg
Z19hc3NlcnQoaW5sX3Blcl92Y3B1ID09IGV4cGVjdGVkKTsNCj4gQEAgLTkxLDEwICs5Mywx
MiBAQCBzdGF0aWMgdm9pZCBzdGF0c190Yih2b2lkKQ0KPiAgICAgICBjb25zdCB1aW50NjRf
dCBjb25kX3RyYWNrX2xlZnQgPSBxZW11X3BsdWdpbl91NjRfc3VtKHRiX2NvbmRfdHJhY2tf
Y291bnQpOw0KPiAgICAgICBjb25zdCB1aW50NjRfdCBjb25kaXRpb25hbCA9DQo+ICAgICAg
ICAgICBjb25kX251bV90cmlnZ2VyICogY29uZF90cmlnZ2VyX2xpbWl0ICsgY29uZF90cmFj
a19sZWZ0Ow0KPiAtICAgIHByaW50ZigidGI6ICUiIFBSSXU2NCAiXG4iLCBleHBlY3RlZCk7
DQo+IC0gICAgcHJpbnRmKCJ0YjogJSIgUFJJdTY0ICIgKHBlciB2Y3B1KVxuIiwgcGVyX3Zj
cHUpOw0KPiAtICAgIHByaW50ZigidGI6ICUiIFBSSXU2NCAiIChwZXIgdmNwdSBpbmxpbmUp
XG4iLCBpbmxfcGVyX3ZjcHUpOw0KPiAtICAgIHByaW50ZigidGI6ICUiIFBSSXU2NCAiIChj
b25kaXRpb25hbCBjYilcbiIsIGNvbmRpdGlvbmFsKTsNCj4gKyAgICBnX2F1dG9wdHIoR1N0
cmluZykgc3RhdHMgPSBnX3N0cmluZ19uZXcoIiIpOw0KPiArICAgIGdfc3RyaW5nX2FwcGVu
ZF9wcmludGYoc3RhdHMsICJ0YjogJSIgUFJJdTY0ICJcbiIsIGV4cGVjdGVkKTsNCj4gKyAg
ICBnX3N0cmluZ19hcHBlbmRfcHJpbnRmKHN0YXRzLCAidGI6ICUiIFBSSXU2NCAiIChwZXIg
dmNwdSlcbiIsIHBlcl92Y3B1KTsNCj4gKyAgICBnX3N0cmluZ19hcHBlbmRfcHJpbnRmKHN0
YXRzLCAidGI6ICUiIFBSSXU2NCAiIChwZXIgdmNwdSBpbmxpbmUpXG4iLCBpbmxfcGVyX3Zj
cHUpOw0KPiArICAgIGdfc3RyaW5nX2FwcGVuZF9wcmludGYoc3RhdHMsICJ0YjogJSIgUFJJ
dTY0ICIgKGNvbmRpdGlvbmFsIGNiKVxuIiwgY29uZGl0aW9uYWwpOw0KPiArICAgIHFlbXVf
cGx1Z2luX291dHMoc3RhdHMtPnN0cik7DQo+ICAgICAgIGdfYXNzZXJ0KGV4cGVjdGVkID4g
MCk7DQo+ICAgICAgIGdfYXNzZXJ0KHBlcl92Y3B1ID09IGV4cGVjdGVkKTsNCj4gICAgICAg
Z19hc3NlcnQoaW5sX3Blcl92Y3B1ID09IGV4cGVjdGVkKTsNCj4gQEAgLTEwNyw5ICsxMTEs
MTEgQEAgc3RhdGljIHZvaWQgc3RhdHNfbWVtKHZvaWQpDQo+ICAgICAgIGNvbnN0IHVpbnQ2
NF90IHBlcl92Y3B1ID0gcWVtdV9wbHVnaW5fdTY0X3N1bShjb3VudF9tZW0pOw0KPiAgICAg
ICBjb25zdCB1aW50NjRfdCBpbmxfcGVyX3ZjcHUgPQ0KPiAgICAgICAgICAgcWVtdV9wbHVn
aW5fdTY0X3N1bShjb3VudF9tZW1faW5saW5lKTsNCj4gLSAgICBwcmludGYoIm1lbTogJSIg
UFJJdTY0ICJcbiIsIGV4cGVjdGVkKTsNCj4gLSAgICBwcmludGYoIm1lbTogJSIgUFJJdTY0
ICIgKHBlciB2Y3B1KVxuIiwgcGVyX3ZjcHUpOw0KPiAtICAgIHByaW50ZigibWVtOiAlIiBQ
Ukl1NjQgIiAocGVyIHZjcHUgaW5saW5lKVxuIiwgaW5sX3Blcl92Y3B1KTsNCj4gKyAgICBn
X2F1dG9wdHIoR1N0cmluZykgc3RhdHMgPSBnX3N0cmluZ19uZXcoIiIpOw0KPiArICAgIGdf
c3RyaW5nX2FwcGVuZF9wcmludGYoc3RhdHMsICJtZW06ICUiIFBSSXU2NCAiXG4iLCBleHBl
Y3RlZCk7DQo+ICsgICAgZ19zdHJpbmdfYXBwZW5kX3ByaW50ZihzdGF0cywgIm1lbTogJSIg
UFJJdTY0ICIgKHBlciB2Y3B1KVxuIiwgcGVyX3ZjcHUpOw0KPiArICAgIGdfc3RyaW5nX2Fw
cGVuZF9wcmludGYoc3RhdHMsICJtZW06ICUiIFBSSXU2NCAiIChwZXIgdmNwdSBpbmxpbmUp
XG4iLCBpbmxfcGVyX3ZjcHUpOw0KPiArICAgIHFlbXVfcGx1Z2luX291dHMoc3RhdHMtPnN0
cik7DQo+ICAgICAgIGdfYXNzZXJ0KGV4cGVjdGVkID4gMCk7DQo+ICAgICAgIGdfYXNzZXJ0
KHBlcl92Y3B1ID09IGV4cGVjdGVkKTsNCj4gICAgICAgZ19hc3NlcnQoaW5sX3Blcl92Y3B1
ID09IGV4cGVjdGVkKTsNCj4gQEAgLTExOCw2ICsxMjQsNyBAQCBzdGF0aWMgdm9pZCBzdGF0
c19tZW0odm9pZCkNCj4gICBzdGF0aWMgdm9pZCBwbHVnaW5fZXhpdChxZW11X3BsdWdpbl9p
ZF90IGlkLCB2b2lkICp1ZGF0YSkNCj4gICB7DQo+ICAgICAgIGNvbnN0IHVuc2lnbmVkIGlu
dCBudW1fY3B1cyA9IHFlbXVfcGx1Z2luX251bV92Y3B1cygpOw0KPiArICAgIGdfYXV0b3B0
cihHU3RyaW5nKSBzdGF0cyA9IGdfc3RyaW5nX25ldygiIik7DQo+ICAgICAgIGdfYXNzZXJ0
KG51bV9jcHVzID09IG1heF9jcHVfaW5kZXggKyAxKTsNCj4gICANCj4gICAgICAgZm9yIChp
bnQgaSA9IDA7IGkgPCBudW1fY3B1cyA7ICsraSkgew0KPiBAQCAtMTM1LDIwICsxNDIsMjEg
QEAgc3RhdGljIHZvaWQgcGx1Z2luX2V4aXQocWVtdV9wbHVnaW5faWRfdCBpZCwgdm9pZCAq
dWRhdGEpDQo+ICAgICAgICAgICAgICAgcWVtdV9wbHVnaW5fdTY0X2dldChpbnNuX2NvbmRf
bnVtX3RyaWdnZXIsIGkpOw0KPiAgICAgICAgICAgY29uc3QgdWludDY0X3QgaW5zbl9jb25k
X2xlZnQgPQ0KPiAgICAgICAgICAgICAgIHFlbXVfcGx1Z2luX3U2NF9nZXQoaW5zbl9jb25k
X3RyYWNrX2NvdW50LCBpKTsNCj4gLSAgICAgICAgcHJpbnRmKCJjcHUgJWQ6IHRiICglIiBQ
Ukl1NjQgIiwgJSIgUFJJdTY0DQo+IC0gICAgICAgICAgICAgICAiLCAlIiBQUkl1NjQgIiAq
ICUiIFBSSXU2NCAiICsgJSIgUFJJdTY0DQo+IC0gICAgICAgICAgICAgICAiKSB8ICINCj4g
LSAgICAgICAgICAgICAgICJpbnNuICglIiBQUkl1NjQgIiwgJSIgUFJJdTY0DQo+IC0gICAg
ICAgICAgICAgICAiLCAlIiBQUkl1NjQgIiAqICUiIFBSSXU2NCAiICsgJSIgUFJJdTY0DQo+
IC0gICAgICAgICAgICAgICAiKSB8ICINCj4gLSAgICAgICAgICAgICAgICJtZW0gKCUiIFBS
SXU2NCAiLCAlIiBQUkl1NjQgIikiDQo+IC0gICAgICAgICAgICAgICAiXG4iLA0KPiAtICAg
ICAgICAgICAgICAgaSwNCj4gLSAgICAgICAgICAgICAgIHRiLCB0Yl9pbmxpbmUsDQo+IC0g
ICAgICAgICAgICAgICB0Yl9jb25kX3RyaWdnZXIsIGNvbmRfdHJpZ2dlcl9saW1pdCwgdGJf
Y29uZF9sZWZ0LA0KPiAtICAgICAgICAgICAgICAgaW5zbiwgaW5zbl9pbmxpbmUsDQo+IC0g
ICAgICAgICAgICAgICBpbnNuX2NvbmRfdHJpZ2dlciwgY29uZF90cmlnZ2VyX2xpbWl0LCBp
bnNuX2NvbmRfbGVmdCwNCj4gLSAgICAgICAgICAgICAgIG1lbSwgbWVtX2lubGluZSk7DQo+
ICsgICAgICAgIGdfc3RyaW5nX3ByaW50ZihzdGF0cywgImNwdSAlZDogdGIgKCUiIFBSSXU2
NCAiLCAlIiBQUkl1NjQNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICIsICUiIFBSSXU2
NCAiICogJSIgUFJJdTY0ICIgKyAlIiBQUkl1NjQNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICIpIHwgIg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgImluc24gKCUiIFBSSXU2
NCAiLCAlIiBQUkl1NjQNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICIsICUiIFBSSXU2
NCAiICogJSIgUFJJdTY0ICIgKyAlIiBQUkl1NjQNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICIpIHwgIg0KPiArICAgICAgICAgICAgICAgICAgICAgICAgIm1lbSAoJSIgUFJJdTY0
ICIsICUiIFBSSXU2NCAiKSINCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICJcbiIsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICBpLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgdGIsIHRiX2lubGluZSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHRiX2NvbmRf
dHJpZ2dlciwgY29uZF90cmlnZ2VyX2xpbWl0LCB0Yl9jb25kX2xlZnQsDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICBpbnNuLCBpbnNuX2lubGluZSwNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIGluc25fY29uZF90cmlnZ2VyLCBjb25kX3RyaWdnZXJfbGltaXQsIGluc25f
Y29uZF9sZWZ0LA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgbWVtLCBtZW1faW5saW5l
KTsNCj4gKyAgICAgICAgcWVtdV9wbHVnaW5fb3V0cyhzdGF0cy0+c3RyKTsNCj4gICAgICAg
ICAgIGdfYXNzZXJ0KHRiID09IHRiX2lubGluZSk7DQo+ICAgICAgICAgICBnX2Fzc2VydChp
bnNuID09IGluc25faW5saW5lKTsNCj4gICAgICAgICAgIGdfYXNzZXJ0KG1lbSA9PSBtZW1f
aW5saW5lKTsNCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJv
dXZpZXJAbGluYXJvLm9yZz4NCg==
