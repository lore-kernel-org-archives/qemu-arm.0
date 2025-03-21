Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp474929njc;
        Fri, 21 Mar 2025 10:24:43 -0700 (PDT)
X-Received: by 2002:a17:902:ce0c:b0:21f:5063:d3ca with SMTP id d9443c01a7336-2265e743fd5mr146526275ad.16.1742577883432;
        Fri, 21 Mar 2025 10:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742577883; cv=none;
        d=google.com; s=arc-20240605;
        b=dtIAyMgpinCJdO92To/OwPWdTpG/60U7iAkbXIF1dBi5hCJjt75BWxUXE4f7K2tsiQ
         GTa0uT+gPW6ptkhA7/fODAUDpTLjyQ2zOsoXE4XZLvYfwv66kt5OwVXNuuqiPuUvNPg8
         pjIFvqZ00zCs7kcxgnF/kHEwo8VuccLzvXoiy1va1+kcceX83IK6l3Av6Yndk682TlR/
         9lS/zgV4D5mwyqkjq/kP3EsDasNgUiQgpBRTziMAPtILiXYxoBFCvX+ug22cwPNGTWyX
         31s+xnVWWLRoKhjbY2TT3ffhKAYmmC+tMKUEmtMJHAx8J7qic5eWQ/WRdPgWJb8SoO45
         27VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iGkWGKEcyLrBkC2DRsuZHUvYNpY928YoawSZq7leLW4=;
        fh=hp/qT+P4twqo5Z3njWYRnDRGe0gIDcrYs6PN6bd2Ym8=;
        b=DzIEXT/26mKjHp4xfb3Cr7LC3kyGKKmdmYB81iHe1yZSoNjYJdStHPo1JyzCMe26/Z
         XOP/gIJsdjhJTlAfYM62PJQtiDOPSwP2rRFpG1ZsUMlY3RxNmuAVIgpw9ahgKkm3Ypbe
         CWRB+HGB5g1FKjjJ62Zar6HPaWgvw9Ni1wXReCbdmf5G6+Aob6b+SpYFIW9LPha6VRhY
         HSMf9TNZGouSaA1eXLRdHPYemQKDT65nv+4hw56ADhnZxt/MemhpLxVnEpdHTIBv4GZm
         OUI8FdMnNEp4n9rNWKg1mw/cYlQ04EO5ubXgbol4Pv1qiUW3JcSDp029AF80ZfV7UAkZ
         Tojw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jte/FuGi";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f5b910sor14506015ad.3.2025.03.21.10.24.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 10:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jte/FuGi";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742577883; x=1743182683; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGkWGKEcyLrBkC2DRsuZHUvYNpY928YoawSZq7leLW4=;
        b=jte/FuGiTGPxDQb/5kgZ8UQK9mVVdb/6f1xwMeJ7zeZtWkIbRSXmN1vTfjs/JCYr46
         hj1wgcbw3Zj9baedOX0I7JCGzdw6czue0mObmllfwCsWXPAc+RDM3540PFwu+IFHaZgI
         OzBQ9Et3jh0Ba2kslfqiVN8hsz7IcBmdT0DA5zHG4440T04P77BEO7n6tYkpzoe4xtGL
         GVdAKkZnfXEzhf45wTjHwvwdfltCJcx0DlasEfDnlL44l1XygycRnQ9c66W7RGJfpJMX
         k5RJJZe073GQiwSHU5clFV0BFh0/atzlaRhDo92rTSjSvQ8f6ErE+zH2K6CfMi8zjnmX
         gkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577883; x=1743182683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGkWGKEcyLrBkC2DRsuZHUvYNpY928YoawSZq7leLW4=;
        b=AmYVpFZ0simFg76VNvZXhx194ICyDjjZx1D3VMHhwbBcAvZXpxi55ZPXQlX4GgwqZi
         5v+ZEhvyvFU4wA+DSNXehfDOdotHnw64BdKQt2VCbzhktyxhtR7+uKcjnSF8e84QTwzw
         NuFDi11LMzd/hRIw1QpsfZBcIFdDDfc6YmJlNsBZeDIavr9spbYBu37eB5afGN71fs+u
         JRq9Og8oq25WXwHAYCbj/EAMUD9pGSYVxMjNfDxc3BUKoCxP17GvSsCGT3yCKwhyBrnB
         chW5KUrjIMafJIrn16lr/fr/FvF964G8WVoJzBqD9/fIDvDMyaqQ2UiEh0XitBODe3i+
         6h2Q==
X-Gm-Message-State: AOJu0YyXY24EAsqskXQ2R9vG2oYky/0kwC2WIpNoww43VQ/tLT2xECbe
	8xV8kg+I19f4NnCuYgmXnGlvnHjmvCwcYKl/BXSK6zw+H6lxQkwFPt27seHRfWBeJfof4vwYtU3
	0p9A=
X-Gm-Gg: ASbGncs8howDQoSis6MA1T/ncJSdsXBektiaQ9W8Lo8PgGep4NFJY04mFoG335SvFFG
	aXqn9mt30GkmKcsx8JLrV2WAqRN0aUWBUd/la/lecbwwrSmpq9JeNjEhn/4dJXxjE/nMuyJBRqO
	SCIm8ryRFcs4WYuObzp5D25Z2XTSjMkXVMttx0LeF5c06JBC7VPhjeMYPNeJwMapQ2YRL1lPoX6
	v8miPU+Z1OXpfUUZwHtEzROvAZrXSxBaOXFcXWNNvp4JATJqjJXigFbs1Acx6NuH+Sp20vRnCtm
	KYiwVN4iIfR5Bzgf59ht4oqTnS9bdeEzPYEQIrH2c71RLwbt9HM6XbMKSdI=
X-Google-Smtp-Source: AGHT+IGhpyHCmI/3taDycuWv8sDIj0LwxBuh86+pYdB1wXiPhAPz5+TYLNZkGtY2HJKB4Pf2GYeKSQ==
X-Received: by 2002:a17:902:e5c5:b0:226:194f:48ef with SMTP id d9443c01a7336-2265e6bbbc8mr114271965ad.13.1742577882745;
        Fri, 21 Mar 2025 10:24:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [172.16.224.217] ([209.53.90.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da347sm19717125ad.161.2025.03.21.10.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 10:24:42 -0700 (PDT)
Message-ID: <f938d297-8593-4ff9-a41d-b8811f537d05@linaro.org>
Date: Fri, 21 Mar 2025 10:24:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] gdbstub: introduce target independent gdb register
 helper
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
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
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
 <20250319182255.3096731-3-alex.bennee@linaro.org>
 <2c441f75-8fd8-4792-a4e4-1ae7c78754ba@linaro.org>
 <1bc5463d-1e37-4a92-b43d-2d4b61cc19ff@linaro.org>
 <87ldsylins.fsf@draig.linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87ldsylins.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: prBUq1YWm2xp

T24gMy8yMS8yNSAwNDozNiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiAz
LzIwLzI1IDEyOjMwLCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4+IE9uIDMvMTkvMjUg
MTE6MjIsIEFsZXggQmVubsOpZSB3cm90ZToNCj4+Pj4gVGhlIGN1cnJlbnQgaGVscGVyLmgg
ZnVuY3Rpb25zIHJlbHkgb24gaGFyZCBjb2RlZCBhc3N1bXB0aW9ucyBhYm91dA0KPj4+PiB0
YXJnZXQgZW5kaWFuZXNzIHRvIHVzZSB0aGUgdHN3YXAgbWFjcm9zLiBXZSBhbHNvIGVuZCB1
cCBkb3VibGUNCj4+Pj4gc3dhcHBpbmcgYSBidW5jaCBvZiB2YWx1ZXMgaWYgdGhlIHRhcmdl
dCBjYW4gcnVuIGluIG11bHRpcGxlIGVuZGlhbmVzcw0KPj4+PiBtb2Rlcy4gQXZvaWQgdGhp
cyBieSBnZXR0aW5nIHRoZSB0YXJnZXQgdG8gcGFzcyB0aGUgZW5kaWFuZXNzIGFuZCBzaXpl
DQo+Pj4+IHZpYSBhIE1lbU9wIGFuZCBmaXhpbmcgdXAgYXBwcm9wcmlhdGVseS4NCj4+Pj4N
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8u
b3JnPg0KPj4+PiAtLS0NCj4+Pj4gICAgIGluY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMuaCB8
IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiAgICAgZ2Ric3R1Yi9n
ZGJzdHViLmMgICAgICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiAg
ICAgMiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspDQo+Pj4+ICAgICBjcmVhdGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9nZGJzdHViL3JlZ2lzdGVycy5oDQo+Pj4+DQo+Pj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2dkYnN0dWIvcmVnaXN0ZXJzLmggYi9pbmNsdWRlL2dkYnN0
dWIvcmVnaXN0ZXJzLmgNCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4gaW5kZXgg
MDAwMDAwMDAwMC4uNGFiYzdhNmFlNw0KPj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+ICsrKyBi
L2luY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMuaA0KPj4+PiBAQCAtMCwwICsxLDMwIEBADQo+
Pj4+ICsvKg0KPj4+PiArICogR0RCIENvbW1vbiBSZWdpc3RlciBIZWxwZXJzDQo+Pj4+ICsg
Kg0KPj4+PiArICogQ29weXJpZ2h0IChjKSAyMDI1IExpbmFybyBMdGQNCj4+Pj4gKyAqDQo+
Pj4+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcg0KPj4+
PiArICovDQo+Pj4+ICsNCj4+Pj4gKyNpZm5kZWYgR0RCX1JFR0lTVEVSU19IDQo+Pj4+ICsj
ZGVmaW5lIEdEQl9SRUdJU1RFUlNfSA0KPj4+PiArDQo+Pj4+ICsjaW5jbHVkZSAiZXhlYy9t
ZW1vcC5oIg0KPj4+PiArDQo+Pj4+ICsvKioNCj4+Pj4gKyAqIGdkYl9nZXRfcmVnaXN0ZXJf
dmFsdWUoKSAtIGdldCByZWdpc3RlciB2YWx1ZSBmb3IgZ2RiDQo+Pj4+ICsgKiBtbzogc2l6
ZSBhbmQgZW5kaWFuIE1lbU9wDQo+Pj4+ICsgKiBidWY6IEdCeXRlQXJyYXkgdG8gc3RvcmUg
aW4gdGFyZ2V0IG9yZGVyDQo+Pj4+ICsgKiB2YWw6IHBvaW50ZXIgdG8gdmFsdWUgaW4gaG9z
dCBvcmRlcg0KPj4+PiArICoNCj4+Pj4gKyAqIFRoaXMgcmVwbGFjZXMgdGhlIHByZXZpb3Vz
IGxlZ2FjeSByZWFkIGZ1bmN0aW9ucyB3aXRoIGEgc2luZ2xlDQo+Pj4+ICsgKiBmdW5jdGlv
biB0byBoYW5kbGUgYWxsIHNpemVzLiBQYXNzaW5nIEBtbyBhbGxvd3MgdGhlIHRhcmdldCBt
b2RlIHRvDQo+Pj4+ICsgKiBiZSB0YWtlbiBpbnRvIGFjY291bnQgYW5kIGF2b2lkcyB1c2lu
ZyBoYXJkIGNvZGVkIHRzd2FwKCkgbWFjcm9zLg0KPj4+PiArICoNCj4+Pj4gKyAqIFJldHVy
bnMgdGhlIG51bWJlciBvZiBieXRlcyB3cml0dGVuIHRvIHRoZSBhcnJheS4NCj4+Pj4gKyAq
Lw0KPj4+PiAraW50IGdkYl9nZXRfcmVnaXN0ZXJfdmFsdWUoTWVtT3Agb3AsIEdCeXRlQXJy
YXkgKmJ1ZiwgdWludDhfdCAqdmFsKTsNCj4+Pj4gKw0KPj4+PiArI2VuZGlmIC8qIEdEQl9S
RUdJU1RFUlNfSCAqLw0KPj4+PiArDQo+Pj4+ICsNCj4+Pj4gZGlmZiAtLWdpdCBhL2dkYnN0
dWIvZ2Ric3R1Yi5jIGIvZ2Ric3R1Yi9nZGJzdHViLmMNCj4+Pj4gaW5kZXggMjgyZTEzZTE2
My4uM2Q3YjEwMjhlNCAxMDA2NDQNCj4+Pj4gLS0tIGEvZ2Ric3R1Yi9nZGJzdHViLmMNCj4+
Pj4gKysrIGIvZ2Ric3R1Yi9nZGJzdHViLmMNCj4+Pj4gQEAgLTMyLDYgKzMyLDcgQEANCj4+
Pj4gICAgICNpbmNsdWRlICJleGVjL2dkYnN0dWIuaCINCj4+Pj4gICAgICNpbmNsdWRlICJn
ZGJzdHViL2NvbW1hbmRzLmgiDQo+Pj4+ICAgICAjaW5jbHVkZSAiZ2Ric3R1Yi9zeXNjYWxs
cy5oIg0KPj4+PiArI2luY2x1ZGUgImdkYnN0dWIvcmVnaXN0ZXJzLmgiDQo+Pj4+ICAgICAj
aWZkZWYgQ09ORklHX1VTRVJfT05MWQ0KPj4+PiAgICAgI2luY2x1ZGUgImFjY2VsL3RjZy92
Y3B1LXN0YXRlLmgiDQo+Pj4+ICAgICAjaW5jbHVkZSAiZ2Ric3R1Yi91c2VyLmgiDQo+Pj4+
IEBAIC00NSw2ICs0Niw3IEBADQo+Pj4+ICAgICAjaW5jbHVkZSAic3lzdGVtL3J1bnN0YXRl
LmgiDQo+Pj4+ICAgICAjaW5jbHVkZSAiZXhlYy9yZXBsYXktY29yZS5oIg0KPj4+PiAgICAg
I2luY2x1ZGUgImV4ZWMvaHdhZGRyLmgiDQo+Pj4+ICsjaW5jbHVkZSAiZXhlYy9tZW1vcC5o
Ig0KPj4+PiAgICAgICAgI2luY2x1ZGUgImludGVybmFscy5oIg0KPj4+PiAgICAgQEAgLTU1
MSw2ICs1NTMsMjYgQEAgc3RhdGljIGludCBnZGJfd3JpdGVfcmVnaXN0ZXIoQ1BVU3RhdGUN
Cj4+Pj4gKmNwdSwgdWludDhfdCAqbWVtX2J1ZiwgaW50IHJlZykNCj4+Pj4gICAgICAgICBy
ZXR1cm4gMDsNCj4+Pj4gICAgIH0NCj4+Pj4gICAgICsvKg0KPj4+PiArICogVGFyZ2V0IGhl
bHBlciBmdW5jdGlvbiB0byByZWFkIHZhbHVlIGludG8gR0J5dGVBcnJheSwgdGFyZ2V0DQo+
Pj4+ICsgKiBzdXBwbGllcyB0aGUgc2l6ZSBhbmQgdGFyZ2V0IGVuZGlhbmVzcyB2aWEgdGhl
IE1lbU9wLg0KPj4+PiArICovDQo+Pj4+ICtpbnQgZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShN
ZW1PcCBvcCwgR0J5dGVBcnJheSAqYnVmLCB1aW50OF90ICp2YWwpDQo+Pj4+ICt7DQo+Pj4+
ICsgICAgc2l6ZV90IGJ5dGVzID0gbWVtb3Bfc2l6ZShvcCk7DQo+Pj4+ICsNCj4+Pj4gKyAg
ICBpZiAob3AgJiBNT19CU1dBUCkgew0KPj4+PiArICAgICAgICBmb3IgKCBpbnQgaSA9IGJ5
dGVzIDsgaSA+IDA7IGktLSkgew0KPj4+PiArICAgICAgICAgICAgZ19ieXRlX2FycmF5X2Fw
cGVuZChidWYsICZ2YWxbaSAtIDFdLCAxKTsNCj4+Pj4gKyAgICAgICAgfTsNCj4+Pj4gKyAg
ICB9IGVsc2Ugew0KPj4+PiArICAgICAgICBnX2J5dGVfYXJyYXlfYXBwZW5kKGJ1ZiwgdmFs
LCBieXRlcyk7DQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgcmV0dXJuIGJ5dGVz
Ow0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICsNCj4+Pj4gICAgIHN0YXRpYyB2b2lkIGdkYl9y
ZWdpc3Rlcl9mZWF0dXJlKENQVVN0YXRlICpjcHUsIGludCBiYXNlX3JlZywNCj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdkYl9nZXRfcmVnX2NiIGdldF9y
ZWcsIGdkYl9zZXRfcmVnX2NiIHNldF9yZWcsDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBHREJGZWF0dXJlICpmZWF0dXJlKQ0KPj4+IEl0IGNv
dWxkIGJlIHByZWZlcmFibGUgdG8gc2V0IGJ1ZiB3aXRoIHRoZSB2YWx1ZSwgaW5zdGVhZCBv
ZiBzaW1wbHkNCj4+PiBhcHBlbmRpbmcgdGhlIHZhbHVlLiBUaGlzIHdheSwgdGhlcmUgaXMg
bm8gbmVlZCB0byByZXR1cm4gdGhlIHNpemUsIGFzDQo+Pj4gaXQncyBjb250YWluZWQgaW4g
YnVmZmVyIHNpemUgaXRzZWxmLg0KPj4+IElmIHdlIGluc2lzdCBvbiByZXR1cm5pbmcgdGhl
IHNpemUsIGl0J3MgYmV0dGVyIHRvIG1ha2UgaXQgYQ0KPj4+IHBhcmFtZXRlcg0KPj4+IChh
bmQgdXNlIGEgdm9pZCBwYXJhbWV0ZXIgdHlwZSksIGJlY2F1c2UgYXQgdGhlIG1vbWVudCwg
aXQgZ2l2ZXMgdGhlDQo+Pj4gaW1wcmVzc2lvbiB0aGUgZnVuY3Rpb24gaXRzZWxmIHJldHVy
bnMgdGhlIHZhbHVlLCB3aGljaCBtYXkgYmUgY29uZnVzaW5nLg0KPj4NCj4+IFNlZW1zIGxp
a2UgaXQncyB0aGUgZXhpc3RpbmcgY29udmVudGlvbiB0aHJvdWdoDQo+PiBnZGJfc2V0X3Jl
Z19jYi9nZGJfZ2V0X3JlZ19jYiwgc28gd2UgaGF2ZSB0byBmb2xsb3cgdGhpcy4NCj4gDQo+
IEZvciB0aGUgImciIHBhY2tldCB3ZSBhcHBlbmQgbXVsdGlwbGUgcmVnaXN0ZXJzIHNvIHRo
ZSBidWZmZXIgc2l6ZSBncm93cw0KPiBhcyB3ZSBhcHBlbmQgZWFjaCBvbmUuDQo+IA0KDQpU
aGFua3MgZm9yIHNoYXJpbmcgdGhlIHJhdGlvbmFsZSBiZWhpbmQgdGhpcy4NCg==
