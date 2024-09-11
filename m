Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp204860nji;
        Wed, 11 Sep 2024 08:29:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXh7tvQRpWFyQPfnEUMWNrYAyjGReh8xnpxg6l3lMRggTPUHJTJPRa6Y/PYIw8UMhQ1cmDTJUxWkJs67g==@linaro.org
X-Received: by 2002:a05:6a00:1a87:b0:70d:2cf6:5e6 with SMTP id d2e1a72fcca58-71916e7a914mr4609459b3a.15.1726068590029;
        Wed, 11 Sep 2024 08:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726068590; cv=none;
        d=google.com; s=arc-20160816;
        b=eVhBu+tsX6Sin/m4G+Y1y8GJ41mLZUPl1pfAYNUpTNpYBCSs89qC0IdrLjJTpwn+ol
         sGIpCHrYznSY4NEaF5+R0ITByraE5lBUic4CzdCPRuqbbOACLfCdhZU8pCfR/wAj33hs
         hlaHy1G2stIfHcIK9BAN+THTICvdiZPw2Yq4XcHLOt9+unQm0GBbLgeqJsmoPzLcokf5
         i4oxe8e5UXxfdKP+mP6lZPo1QN9PBMWJzoP9/wI++Ypel/pJiWu7NzXLMl2fh6+loybc
         9ssiwLcXPA3Oou6CSBHHhCaK6ThIeP00AHj52CZxwz3KyjASfqBvy4XNG3wrgSehST4m
         wEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=V6m6vNQT7mJMu+b2f7V4GrIIRmDUGYZa9xv/2BTcLJk=;
        fh=DIh+Y5TMv+30J4RBWveNC9MhONuVodimigjdK9bInTQ=;
        b=C76V7f+ZVEmzz5qjolDnU2xEy544962fg1f4p71/pyVBYPp/s2bIQ39zlHQnM2f3pX
         +3PTjj49Ei3OVBGnbh4wXU/rA+Mvo0V+6TTf1b31aPiSsyFMmEVomVHNXOjdODRYwQtn
         l74apQWe+Egn5CqZTe9z0NFlPIFMh1+8VCBaBl2IbNEbz8OjT6x13Dv/4MAVOfDdr135
         tLOqwx5j9cAEA9JhE8CQPTpOl0dHoSV43Be/3csZtNHJUo7oftoSAX1OP+H6xslVldr1
         WVd1D4QAXtpVIJLAiNi1lqIBQjtHqGq4aYhiuwQ1ewlFyFvBykNrg2CDYGL93MhFwXJY
         eEMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFXE4BYh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598b8c9sor4976657b3a.9.2024.09.11.08.29.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2024 08:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFXE4BYh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726068589; x=1726673389; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6m6vNQT7mJMu+b2f7V4GrIIRmDUGYZa9xv/2BTcLJk=;
        b=QFXE4BYhJwpMAmMpqH0Zh7LlOGlOQZvLaCavyoYrXYp0xMCAdjeu+hpvhIl4+w86tn
         KA2dV/16EJ5zBY2EZ5iZZDepmDbp8vExtIFy/Y4oDUlYnMOOTDYAGxUqSS07mLbSvLBD
         Pv909rdgF4eSh+7ECJ09lzyZ7NtSUajikSrBq3nCs+OcLa7+LKo0yfgb4/8taLZVIHZB
         6nl8kmCnqrg6AEdGzDUL0p7tlaE05vkJnQ1bWNic71ATaBOB1I3URTwNv3yvcslqi68I
         VP9fh8EOCPsBKuTxBh+wSNfextSHK12JKdORAeFj9qpShsnvXS4V8Hcm5xM9LFwwXCQD
         pfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726068589; x=1726673389;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6m6vNQT7mJMu+b2f7V4GrIIRmDUGYZa9xv/2BTcLJk=;
        b=nbAfJC1S5+CdCSmn2JwlOexpR+FJ555XKCIoCh+/3oqlfkgdX8zQsxNB+kpAVMfvO7
         k4Sb/3XpP0WLrBtY5OYTcgm33pvof6V6VHO+KmxTAnPumpXiMjGCp+e0gMjnht+j3SEv
         jEtB7NtE1V+QHEBj5UJ5NHqdl8PWk7ZZ6pqE5sMBJus5Usni2ot6DmLblIWm7AhDRMvM
         NOhXS8RzNXOawXQKblY01pBMmUOJL7sar7Vro2Oziu2CkocGOsgwwbzxS/Odjwg6T/dp
         qGEJO1eZs3fSw3cRNepOGWfPFEX6195OmURAQKgwlKu/PoV+4EnruyGlGoU9nTN69+g3
         8nIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7kLcm4b1HwonIRJVPSLA6JF1DmoSutFvFzbYPzO6H3TverN2CcdL2qgLCLKZidX+CR8ois+wh3k5spA==@linaro.org
X-Gm-Message-State: AOJu0Yxk+hiKk3RqpDNDJBOpqdjMPHxpAmYhltkMXC4x1KbFT9pDpJMK
	Ogf6zo6E4d1K3ZefMPnynNvzlFYDMmKywm/RZUEI6FpYTEy2DLP6noTorJzCi0YeLA==
X-Google-Smtp-Source: AGHT+IFOkNi5En1U6atzM/outL/IcTJ5jnm+OY7uZvi8WoE+fRnOsRoNmau22JwZlSN5pOufV3D+eQ==
X-Received: by 2002:a05:6a00:8584:b0:717:9296:b45f with SMTP id d2e1a72fcca58-71916e47608mr4240873b3a.8.1726068589407;
        Wed, 11 Sep 2024 08:29:49 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::9633? ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fc8253sm3115128b3a.37.2024.09.11.08.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 08:29:48 -0700 (PDT)
Message-ID: <4a965b71-0c58-4e55-a78b-7df8195f495c@linaro.org>
Date: Wed, 11 Sep 2024 08:29:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/39] hw/pci: replace assert(false) with
 g_assert_not_reached()
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
 <20240910221606.1817478-20-pierrick.bouvier@linaro.org>
 <3a7fc1f2-1468-46a8-9075-7b1bf1bd6149@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <3a7fc1f2-1468-46a8-9075-7b1bf1bd6149@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: /ZkpTdfggmw/

T24gOS8xMC8yNCAyMjo1MCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IEhp
IFBpZXJyaWNrLA0KPiANCj4gT24gMTEvOS8yNCAwMDoxNSwgUGllcnJpY2sgQm91dmllciB3
cm90ZToNCj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJv
dXZpZXJAbGluYXJvLm9yZz4NCj4+IC0tLQ0KPj4gICAgaHcvcGNpL3BjaS1zdHViLmMgfCA0
ICsrLS0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2h3L3BjaS9wY2ktc3R1Yi5jIGIvaHcvcGNp
L3BjaS1zdHViLmMNCj4+IGluZGV4IGYwNTA4NjgyZDJiLi5jNjk1MGUyMWJkNCAxMDA2NDQN
Cj4+IC0tLSBhL2h3L3BjaS9wY2ktc3R1Yi5jDQo+PiArKysgYi9ody9wY2kvcGNpLXN0dWIu
Yw0KPj4gQEAgLTQ2LDEzICs0NiwxMyBAQCB2b2lkIGhtcF9wY2llX2Flcl9pbmplY3RfZXJy
b3IoTW9uaXRvciAqbW9uLCBjb25zdCBRRGljdCAqcWRpY3QpDQo+PiAgICAvKiBrdm0tYWxs
IHdhbnRzIHRoaXMgKi8NCj4+ICAgIE1TSU1lc3NhZ2UgcGNpX2dldF9tc2lfbWVzc2FnZShQ
Q0lEZXZpY2UgKmRldiwgaW50IHZlY3RvcikNCj4+ICAgIHsNCj4+IC0gICAgZ19hc3NlcnQo
ZmFsc2UpOw0KPj4gKyAgICBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpOw0KPj4gICAgICAgIHJl
dHVybiAoTVNJTWVzc2FnZSl7fTsNCj4gDQo+IFRoZSB0YWlsIG9mIHRoaXMgc2VyaWVzIHJl
bW92ZSB0aGUgdW5yZWFjaGFibGUgJ2JyZWFrJyBsaW5lcy4NCj4gV2h5ICdyZXR1cm4nIGxp
bmVzIGFyZW4ndCBwcm9ibGVtYXRpYz8gSXMgdGhhdCBhIEdDQyBUU2FuIGJ1Zz8NCj4gDQoN
Ckl0J3MgcmVsYXRlZCB0byBob3cgY29udHJvbCBmbG93IGFuYWx5c2lzIHdvcmtzLCBidXQg
SSBkb24ndCBoYXZlIGEgDQpkZWVwZXIgYW5zd2VyLiBJIHJlcG9ydGVkIHRoZSBpc3N1ZSB3
aXRoICdicmVhaycgZm9yIGdjYyBhbmQgdGhlIHNhbWUgDQpidWcgd2FzIGNyZWF0ZWQgc2V2
ZXJhbCB5ZWFycyBhZ28sIHNvIGl0IHdhcyBqdXN0IG1hcmtlZCBhcyBkdXBsaWNhdGUuDQoN
CkknbGwgY2xlYW4gdGhlIGV4dHJhIHJldHVybiB3aXRoIGhhdmUgdGhvdWdoLCBhcyBwYXJ0
IG9mIHYyLg0KDQo+PiAgICB9DQo+PiAgICANCj4+ICAgIHVpbnQxNl90IHBjaV9yZXF1ZXN0
ZXJfaWQoUENJRGV2aWNlICpkZXYpDQo+PiAgICB7DQo+PiAtICAgIGdfYXNzZXJ0KGZhbHNl
KTsNCj4+ICsgICAgZ19hc3NlcnRfbm90X3JlYWNoZWQoKTsNCj4+ICAgICAgICByZXR1cm4g
MDsNCj4+ICAgIH0NCj4+ICAgIA0KPiANCg==
