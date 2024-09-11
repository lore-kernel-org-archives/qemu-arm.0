Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp206416nji;
        Wed, 11 Sep 2024 08:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvf4FOBAQoVTIQbkWBq9ihmj01+PRA7EAZgv8A+P67iTN5xNX54O74GUKCWJIiUINLC6YMNfSePP8vZA==@linaro.org
X-Received: by 2002:a05:6a00:b011:b0:717:83bc:6df3 with SMTP id d2e1a72fcca58-71907f55c44mr9607261b3a.11.1726068852028;
        Wed, 11 Sep 2024 08:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726068851; cv=none;
        d=google.com; s=arc-20160816;
        b=SCZWeGAY9J4NYVVhbnoR39E1+89HmITElWStfi+Q6B0yQ6PaRne6nv/jTTNjTV8g50
         WuX1JsavSVRxRkKYr6TqnZJvNsAlKIdIHBAafHBwJ+Q1ZqN2jnqOhnMPNfs4rGdcsPWF
         7p398RAifZN/frolXOoqH6Uf5V66Jfjz+mEN720ao8c1aiy7Ju9cpAvw1dLI6UI1eR9p
         mV+/iM1qaOiGCmZPdX5mPIcsA+XRwnMVvdbVnCCpnRx9wB1UtgiKB5e6Ne4SVggH0RUC
         02ycjnjd1+KcITp+YWVM9DI5TOBzZsYw+lkxtH8wVoRvWNXxDtYBcBhK2jH2w1g54xJS
         20pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eA+709nEJaGWuuqo4euF6T+QcJULW+fZtN6qnIYUmcY=;
        fh=viS89apP1tAIvpaLXmgggiT3Rpc1ObwhANoFPMSPpKc=;
        b=Sf7svWrGG1bWZHgXppdLhZW5YEIcpYbn6tmGxkYpglgYbiF7JnPOdqV6vbvJS2Iu2c
         tdS9WkPm4LaTmXMzPpTN/cZnTsutiHU1mDwHotNZZXmzmBwdi0ixyJ6pekQYK4KuLZsO
         5ZwCc1UCV0+3s6TVtBqluRZpdAHU7YA6b7ZwqTJBG/F9ST1WjXLSLit2b6g9saJQ9RwU
         2M1UvI1u2jO1a+Njs47aSolvkbvJLm8Iq9g+QHe4q80BpjiWe9mrwW3CZ6MTCjSFIfYQ
         iColpuZx7d6nCeHJkRKhG1V59whpVqVTFKCKoCjYEFnRXn7ZFHIzRpaTj91q3DlLnKm3
         Rg4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAL94lCL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e571b037sor5008172b3a.1.2024.09.11.08.34.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 08:34:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mAL94lCL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726068851; x=1726673651; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eA+709nEJaGWuuqo4euF6T+QcJULW+fZtN6qnIYUmcY=;
        b=mAL94lCL4Ppk8zlmwUmMP02TyacpUl5Fq3LmpMYzIQv2mGrGHRbv8XIZb1HY5EZlSm
         cJmmtoN103ynU0iZRjT4fEYNx2iy12aXq4nbLdKnj+dEsuJlUJPq59Ajn1rG8KDhfmaF
         n4YaZGI0brCQnPQ52lF34IXBZ43Ep1EMC8gTKc7Jw110apESk2gpiJzUv4AqeKU3ap9L
         VsuKcdMKrTDuHBeHs9lrihKWY5RnX4/PBSmYf9iD6jIywtZyfNVnniU76ihNGJA7l1bd
         sZqbze00QoHgrJiGKcLaGJCqBVuHoZP1sS+cg/e3VSTxDu+HQKBSQlh38Nsa1y9rNcfe
         0zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726068851; x=1726673651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eA+709nEJaGWuuqo4euF6T+QcJULW+fZtN6qnIYUmcY=;
        b=uVCcPa+VmCI4yQMXFq74unwz/may4Oo4yj9ILnU/6wSj+WMc542+ntvxmhg27pi5JD
         ReEyFYVqGTQCL7Ls232MyMGg5mJ4g/+9YLgl/tYYWHhl0Bfp+5mVH9O1fLkVnDp9iQBE
         hKsFl7/QzyiDG3em/PNjuqFO4GDo1Snw3477GC6MCFGCJr2hjSGrpcUXsACQ/ujVqWUA
         VgQYOej+3T+1/NtWL7VS52ISJ4z/u3O+gX/mpx9w1W520lS+cAYiUC5WaTrwgzN0V3ve
         C+ledRdeWdyE0+w2v5W/JPLBgpzjdXn0hVZOJLKCpdpRcEq2eO7o1waH0ohh93wfdUlW
         IFnw==
X-Forwarded-Encrypted: i=1; AJvYcCURiE5MRO78N9WvRQ6eA953wglz4MlZZwV5aDTnbbPuvO3kST+ew/UO+AjRg+/YUBFq9Bc62UP51IGwfA==@linaro.org
X-Gm-Message-State: AOJu0Yw2lIwJ2xhEaxYGmd+TNohiNYOE3PqtjQA6Evsz+jKpcCOT32kN
	bf4DWMoiDNbM4gOwlP6TfUc2JCjWvSb4VyiFOItNMMO9A0lCHWHASGrvldMMM8U0SA==
X-Google-Smtp-Source: AGHT+IFppOMwSoql1QLOJ+22ancIMUpNoJdbhH59Q3aBWEWte2FEb8Yn5UIVH+O8hp1Oz/TnqhIL4A==
X-Received: by 2002:a05:6a00:2f9b:b0:718:d4e4:a10a with SMTP id d2e1a72fcca58-71907ea941emr10052359b3a.4.1726068850740;
        Wed, 11 Sep 2024 08:34:10 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm3222002b3a.93.2024.09.11.08.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 08:34:10 -0700 (PDT)
Message-ID: <b58a2188-3652-4a7a-af10-c7f32b2c6f62@linaro.org>
Date: Wed, 11 Sep 2024 08:34:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] Use g_assert_not_reached instead of
 (g_)assert(0,false)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <cd6c5970-9a1c-4d58-b8af-483909c3c0ca@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <cd6c5970-9a1c-4d58-b8af-483909c3c0ca@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: ZV8D7W5tYmsJ

T24gOS8xMS8yNCAwMTozOSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDExLzkvMjQgMDA6MTUsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+IA0KPj4gUGllcnJp
Y2sgQm91dmllciAoMzkpOg0KPj4gICAgIGRvY3Mvc3BpbjogcmVwbGFjZSBhc3NlcnQoMCkg
d2l0aCBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpDQo+PiAgICAgaHcvYWNwaTogcmVwbGFjZSBh
c3NlcnQoMCkgd2l0aCBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpDQo+PiAgICAgaHcvYXJtOiBy
ZXBsYWNlIGFzc2VydCgwKSB3aXRoIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkNCj4+ICAgICBo
dy9jaGFyOiByZXBsYWNlIGFzc2VydCgwKSB3aXRoIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkN
Cj4+ICAgICBody9jb3JlOiByZXBsYWNlIGFzc2VydCgwKSB3aXRoIGdfYXNzZXJ0X25vdF9y
ZWFjaGVkKCkNCj4+ICAgICBody9uZXQ6IHJlcGxhY2UgYXNzZXJ0KDApIHdpdGggZ19hc3Nl
cnRfbm90X3JlYWNoZWQoKQ0KPj4gICAgIGh3L3dhdGNoZG9nOiByZXBsYWNlIGFzc2VydCgw
KSB3aXRoIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkNCj4+ICAgICBtaWdyYXRpb246IHJlcGxh
Y2UgYXNzZXJ0KDApIHdpdGggZ19hc3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4gICAgIHFvYmpl
Y3Q6IHJlcGxhY2UgYXNzZXJ0KDApIHdpdGggZ19hc3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4g
ICAgIHN5c3RlbTogcmVwbGFjZSBhc3NlcnQoMCkgd2l0aCBnX2Fzc2VydF9ub3RfcmVhY2hl
ZCgpDQo+PiAgICAgdGFyZ2V0L3BwYzogcmVwbGFjZSBhc3NlcnQoMCkgd2l0aCBnX2Fzc2Vy
dF9ub3RfcmVhY2hlZCgpDQo+PiAgICAgdGVzdHMvcXRlc3Q6IHJlcGxhY2UgYXNzZXJ0KDAp
IHdpdGggZ19hc3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4gICAgIHRlc3RzL3VuaXQ6IHJlcGxh
Y2UgYXNzZXJ0KDApIHdpdGggZ19hc3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4gICAgIGluY2x1
ZGUvaHcvczM5MHg6IHJlcGxhY2UgYXNzZXJ0KGZhbHNlKSB3aXRoIGdfYXNzZXJ0X25vdF9y
ZWFjaGVkKCkNCj4+ICAgICBibG9jazogcmVwbGFjZSBhc3NlcnQoZmFsc2UpIHdpdGggZ19h
c3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4gICAgIGh3L2h5cGVydjogcmVwbGFjZSBhc3NlcnQo
ZmFsc2UpIHdpdGggZ19hc3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4gICAgIGh3L25ldDogcmVw
bGFjZSBhc3NlcnQoZmFsc2UpIHdpdGggZ19hc3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4gICAg
IGh3L252bWU6IHJlcGxhY2UgYXNzZXJ0KGZhbHNlKSB3aXRoIGdfYXNzZXJ0X25vdF9yZWFj
aGVkKCkNCj4+ICAgICBody9wY2k6IHJlcGxhY2UgYXNzZXJ0KGZhbHNlKSB3aXRoIGdfYXNz
ZXJ0X25vdF9yZWFjaGVkKCkNCj4+ICAgICBody9wcGM6IHJlcGxhY2UgYXNzZXJ0KGZhbHNl
KSB3aXRoIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkNCj4+ICAgICBtaWdyYXRpb246IHJlcGxh
Y2UgYXNzZXJ0KGZhbHNlKSB3aXRoIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkNCj4+ICAgICB0
YXJnZXQvaTM4Ni9rdm06IHJlcGxhY2UgYXNzZXJ0KGZhbHNlKSB3aXRoIGdfYXNzZXJ0X25v
dF9yZWFjaGVkKCkNCj4+ICAgICB0ZXN0cy9xdGVzdDogcmVwbGFjZSBhc3NlcnQoZmFsc2Up
IHdpdGggZ19hc3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4gICAgIGFjY2VsL3RjZzogcmVtb3Zl
IGJyZWFrIGFmdGVyIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkNCj4+ICAgICBibG9jazogcmVt
b3ZlIGJyZWFrIGFmdGVyIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkNCj4+ICAgICBody9hY3Bp
OiByZW1vdmUgYnJlYWsgYWZ0ZXIgZ19hc3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4gICAgIGh3
L2dwaW86IHJlbW92ZSBicmVhayBhZnRlciBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpDQo+PiAg
ICAgaHcvbWlzYzogcmVtb3ZlIGJyZWFrIGFmdGVyIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkN
Cj4+ICAgICBody9uZXQ6IHJlbW92ZSBicmVhayBhZnRlciBnX2Fzc2VydF9ub3RfcmVhY2hl
ZCgpDQo+PiAgICAgaHcvcGNpLWhvc3Q6IHJlbW92ZSBicmVhayBhZnRlciBnX2Fzc2VydF9u
b3RfcmVhY2hlZCgpDQo+PiAgICAgaHcvc2NzaTogcmVtb3ZlIGJyZWFrIGFmdGVyIGdfYXNz
ZXJ0X25vdF9yZWFjaGVkKCkNCj4+ICAgICBody90cG06IHJlbW92ZSBicmVhayBhZnRlciBn
X2Fzc2VydF9ub3RfcmVhY2hlZCgpDQo+PiAgICAgdGFyZ2V0L2FybTogcmVtb3ZlIGJyZWFr
IGFmdGVyIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCkNCj4+ICAgICB0YXJnZXQvcmlzY3Y6IHJl
bW92ZSBicmVhayBhZnRlciBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpDQo+PiAgICAgdGVzdHMv
cXRlc3Q6IHJlbW92ZSBicmVhayBhZnRlciBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpDQo+PiAg
ICAgdWk6IHJlbW92ZSBicmVhayBhZnRlciBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpDQo+PiAg
ICAgZnB1OiByZW1vdmUgYnJlYWsgYWZ0ZXIgZ19hc3NlcnRfbm90X3JlYWNoZWQoKQ0KPj4g
ICAgIHRjZy9sb29uZ2FyY2g2NDogcmVtb3ZlIGJyZWFrIGFmdGVyIGdfYXNzZXJ0X25vdF9y
ZWFjaGVkKCkNCj4+ICAgICBzY3JpcHRzL2NoZWNrcGF0Y2gucGw6IGVtaXQgZXJyb3Igd2hl
biB1c2luZyBhc3NlcnQoZmFsc2UpDQo+IA0KPiBJJ20gcXVldWluZyByZXZpZXdlZCBwYXRj
aGVzIDQsNSw3LDEwLDI3LDI4LDMwLDM2IHNvIHlvdSBkb24ndA0KPiBoYXZlIHRvIGNhcnJ5
IHRoZW0gaW4gdjIuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gUGhpbC4NCg0KSnVzdCBmb3Ig
dGhlIHNha2Ugb2Ygc2ltcGxpY2l0eSwgYW5kIHRvIG5vdCBtaXNzIGFueXRoaW5nIChvbiBt
eSBzaWRlKSwgDQpJJ2xsIGtlZXAgdGhvc2UgaW4gdjIuIFdoZW4gcmViYXNpbmcsIG9uY2Ug
bWVyZ2VkIG9uIG1hc3RlciwgdGhleSB3aWxsIA0KYmUgc2tpcHBlZCBhdXRvbWF0aWNhbGx5
Lg0KDQpUaGFua3MsDQpQaWVycmljaw0K
