Received: by 2002:a05:6214:430:0:0:0:0 with SMTP id a16csp1977806qvy;
        Mon, 14 Feb 2022 06:17:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxorgkf/kwSezeQ72d7LmUgzAD+E1NvlEf+FlO/ogXAixn2Y/XrxSa1lYi7PKTJKAZfMFF3
X-Received: by 2002:a05:6830:1142:: with SMTP id x2mr3899362otq.25.1644848268711;
        Mon, 14 Feb 2022 06:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644848268; cv=none;
        d=google.com; s=arc-20160816;
        b=SEK4TMFzAwVVj0JUVzfZSMf0aI4SgobcMnFJhoNTB+2gYeIiDy1NuL/sQg5RJIg+9n
         ljhEiIYdIk59kbEFPXH5Qbh5Gp4JKCWQEADCC9RI+aoLEkHP10/0hJwm3WXn0eSLMU4G
         MdRnHwC/npk0uaxw1h6m8aEeG5hnF7okX107nvd/R1g3ZbkFQmkuJsaeiTY6YhVU2r5w
         uT96o21vh0I8zNwic691h7D0AsdZ+RFUIFix0I8SieclxWuPsXs4ExjfV1yb7YTMpuoH
         otbr/etEdpKCOvBPtxMdyEMBp6QpZoJgi2Fc1TR2BXqICT4o5mHowq6J8PKXxW5seutk
         L7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=kAeS57JUrjV7pkqSmOnnFo4M0/YuDwbwuvI7oz0YwYo=;
        b=sQgCOrufTclh99Fl+eZQc86fy1vjd7FyFIVDg8aGJhF53ZIylnifGIqgd7aUJyp5Qv
         TdKMyelB6nX/dP5FgkzhmULHmOBVEHPGuSEYhrd4fi7JUbPy/wC5SI5UyEoAUDJ/T4Ma
         H7bYAh5zidvkgb8r9pPDqnhXoYv2XwosojCH0Jv2Q28cg18kDdPnz90lU22cMSpmxMsP
         xem4qSprQzIcXDQ0D0gsnxW8myF8h5rmIrDwYhBt2RV7CEW6+BNLlLfCwvTydhbn0Ymd
         nElaUmIT9grFJz0lx2W3rliJ+NmaZ93+5HZvGQPyDpeaSTtDublnuLRtxV4CIEdog85N
         z/pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of matheus.ferst@eldorado.org.br designates 187.72.171.209 as permitted sender) smtp.mailfrom=matheus.ferst@eldorado.org.br
Return-Path: <matheus.ferst@eldorado.org.br>
Received: from outlook.eldorado.org.br ([187.72.171.209])
        by mx.google.com with ESMTP id eb44si11383121oab.58.2022.02.14.06.17.47;
        Mon, 14 Feb 2022 06:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of matheus.ferst@eldorado.org.br designates 187.72.171.209 as permitted sender) client-ip=187.72.171.209;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of matheus.ferst@eldorado.org.br designates 187.72.171.209 as permitted sender) smtp.mailfrom=matheus.ferst@eldorado.org.br
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384);
	 Mon, 14 Feb 2022 11:17:46 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
	by p9ibm (Postfix) with ESMTP id 7C65C800059;
	Mon, 14 Feb 2022 11:17:45 -0300 (-03)
Message-ID: <f8164a77-80d1-86fa-7fc9-6089d6b4f34b@eldorado.org.br>
Date: Mon, 14 Feb 2022 11:17:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 11/11] tests/tcg: add vectorised sha512 versions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Eduardo Habkost <eduardo@habkost.net>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-12-alex.bennee@linaro.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
In-Reply-To: <20220211160309.335014-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Return-Path: matheus.ferst@eldorado.org.br
X-OriginalArrivalTime: 14 Feb 2022 14:17:46.0037 (UTC) FILETIME=[A34F4650:01D821AD]
X-TUID: zkLTW5vJqC24

T24gMTEvMDIvMjAyMiAxMzowMywgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGlzIGJ1aWxk
cyB2ZWN0b3Jpc2VkIHZlcnNpb25zIG9mIHNoYTUxMiB0byBleGVyY2lzZSB0aGUgdmVjdG9y
IGNvZGU6DQo+IA0KPiAgICAtIGFhcmNoNjQgKEFkdlNpbWQpDQo+ICAgIC0gaTM4NiAoU1NF
KQ0KPiAgICAtIHMzOTB4IChNVlgpDQo+ICAgIC0gcHBjNjQgKHZlY3RvcikNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4g
UmV2aWV3ZWQtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5h
cm8ub3JnPg0KPiBNZXNzYWdlLUlkOiA8MjAyMjAyMDIxOTEyNDIuNjUyNjA3LTUtYWxleC5i
ZW5uZWVAbGluYXJvLm9yZz4NCj4gDQo+IC0tLQ0KPiB2Mg0KPiAgICAtIHVzZSAtbXNzZTQu
MSAtTzMgaW5zdGVhZCBvZiAtcGVudGl1bTQgZm9yIGkzODYgYnVpbGQNCj4gLS0tDQo+ICAg
dGVzdHMvdGNnL211bHRpYXJjaC9zaGE1MTIuYyAgICAgIHwgMiArLQ0KPiAgIHRlc3RzL3Rj
Zy9hYXJjaDY0L01ha2VmaWxlLnRhcmdldCB8IDcgKysrKysrKw0KPiAgIHRlc3RzL3RjZy9h
cm0vTWFrZWZpbGUudGFyZ2V0ICAgICB8IDggKysrKysrKysNCj4gICB0ZXN0cy90Y2cvaTM4
Ni9NYWtlZmlsZS50YXJnZXQgICAgfCA2ICsrKysrKw0KPiAgIHRlc3RzL3RjZy9wcGM2NGxl
L01ha2VmaWxlLnRhcmdldCB8IDUgKysrKy0NCj4gICB0ZXN0cy90Y2cvczM5MHgvTWFrZWZp
bGUudGFyZ2V0ICAgfCA5ICsrKysrKysrKw0KPiAgIHRlc3RzL3RjZy94ODZfNjQvTWFrZWZp
bGUudGFyZ2V0ICB8IDcgKysrKysrKw0KPiAgIDcgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQoNCjxzbmlwPg0KDQo+IGRpZmYgLS1naXQg
YS90ZXN0cy90Y2cvcHBjNjRsZS9NYWtlZmlsZS50YXJnZXQgYi90ZXN0cy90Y2cvcHBjNjRs
ZS9NYWtlZmlsZS50YXJnZXQNCj4gaW5kZXggNDgwZmYwODk4ZC4uNGYxZDAzZGZjZiAxMDA2
NDQNCj4gLS0tIGEvdGVzdHMvdGNnL3BwYzY0bGUvTWFrZWZpbGUudGFyZ2V0DQo+ICsrKyBi
L3Rlc3RzL3RjZy9wcGM2NGxlL01ha2VmaWxlLnRhcmdldA0KPiBAQCAtNSwxMCArNSwxMyBA
QA0KPiAgIFZQQVRIICs9ICQoU1JDX1BBVEgpL3Rlc3RzL3RjZy9wcGM2NGxlDQo+IA0KPiAg
IGlmbmVxICgkKERPQ0tFUl9JTUFHRSkkKENST1NTX0NDX0hBU19QT1dFUjhfVkVDVE9SKSwp
DQo+IC1QUEM2NExFX1RFU1RTPWJjZHN1YiBub25fc2lnbmFsbGluZ194c2N2DQo+ICtQUEM2
NExFX1RFU1RTPWJjZHN1YiBub25fc2lnbmFsbGluZ194c2N2IHNoYTUxMi12ZWN0b3INCj4g
ICBlbmRpZg0KPiAgICQoUFBDNjRMRV9URVNUUyk6IENGTEFHUyArPSAtbXBvd2VyOC12ZWN0
b3INCj4gDQoNClNpbmNlIHRoaXMgdGVzdCBkb2VzIG5vdCB0YXJnZXQgYSBzcGVjaWZpYyBp
bnN0cnVjdGlvbiwgbWF5YmUgaXQgc2hvdWxkIA0KdXNlIC1tdnN4Ly1tYWx0aXZlYyB0byBh
bGxvdyB0aGUgY29tcGlsZXIgdG8gdXNlIG5ld2VyIGluc3RydWN0aW9ucy4NCg0KPiArc2hh
NTEyLXZlY3Rvcjogc2hhNTEyLmMNCj4gKyAgICAgICAkKENDKSAkKENGTEFHUykgJChFWFRS
QV9DRkxBR1MpICQ8IC1vICRAICQoTERGTEFHUykNCj4gKw0KDQpDYW4gd2UgaGF2ZSB0aGlz
IHRlc3QgZm9yIGJpZy1lbmRpYW4gdG9vPw0KDQpUaGFua3MsDQpNYXRoZXVzIEsuIEZlcnN0
DQpJbnN0aXR1dG8gZGUgUGVzcXVpc2FzIEVMRE9SQURPIDxodHRwOi8vd3d3LmVsZG9yYWRv
Lm9yZy5ici8+DQpBbmFsaXN0YSBkZSBTb2Z0d2FyZQ0KQXZpc28gTGVnYWwgLSBEaXNjbGFp
bWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1lci5odG1sPg0K
