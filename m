Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp546905njd;
        Fri, 18 Apr 2025 18:20:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3ZFT33its/DOPF8UIdyNqnYtvIos/DBicjpoBepVUjsuj0ECghVbcRwzc/HYXlXPqtybGnuv6/ZEbWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IElTFsC4R5WXuSubDbeCx4ZECwz6dVaMqmZznsB6af6/ImG1s7n2c3wAWp7+5/BnyCozghR
X-Received: by 2002:a05:6214:5185:b0:6f2:b0a7:397e with SMTP id 6a1803df08f44-6f2c4674e02mr71637316d6.43.1745025635525;
        Fri, 18 Apr 2025 18:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745025635; cv=none;
        d=google.com; s=arc-20240605;
        b=cuIur0yvrwzn3Hg4TVVH2jcmT5S4lbCayXSECTdTVaGzzk4JtFnCb9xkBVOxZZsHCR
         9WG9yxw8vBujhW40CXRSxyr01XV2HUVxCk0AZfztwa6QwSijsAHSSyT17EeC6NqJuUo5
         29a7Lhe8nQLL7RGJyCY8m1JPv3iyqx6O/DxWD8/9JCl7wYCBrrZ046/6HBhUK+lLOGE3
         5QnCle5w4bnhyCdZnN9Kj6RHs0uZRr9Tu88IbTlH5Dr50CuMvGlDdJuSlFLdI2yGuk4h
         fWYvUBRZqX2k44MvTB1T2jDI8aClvdwtdXpUC9m1b+4w7e6KdNZimzaO7O7z/vOJYyk2
         W6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iZ8/wSsMhmFEE8Gv+XmGEdU0huSrlJ9jJYhq099bov4=;
        fh=XMdktKCZrDC5aWrMPnS23kt9v8OIMwyGt8u2TyM0fUY=;
        b=fn1beLW9Nn9qH90iKPdmsMHVW24LXOrugDIhYhmojJ/9asWWjuNk5vJLo4GrXmhiz5
         4/SpOlqkjfBXfQlovyTY9FLZXKL1HVQiKZzot2Csj9O9Vyvb/CClo/KgLh965lVIz0Pk
         gkNNbFtbdlKGpRTc9H7UWLTHWxjf47uod2NgB/GN42vgFJsC6FVig8gSQJvul2JZRgXK
         0hcOXkNWIYC9gelNLK7+4U47P0RLn2iDKxizkxQ4+9UbsAdjUdywpjJsUc3v5/FjtMXs
         3nIr3JW4tFoAsWTaA7xCz2geKrXkhgDDX06pOT1ISlgV6+CT/RC4nT0ZWOocx7qNNBau
         TAhQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRE9VbLT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2b207a7si34735956d6.112.2025.04.18.18.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Apr 2025 18:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRE9VbLT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5wsf-0007Bh-Qh; Fri, 18 Apr 2025 21:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u5wsd-0007BK-5R
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 21:20:27 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u5wsb-00041m-5O
 for qemu-arm@nongnu.org; Fri, 18 Apr 2025 21:20:26 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2264aefc45dso39458675ad.0
 for <qemu-arm@nongnu.org>; Fri, 18 Apr 2025 18:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745025624; x=1745630424; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iZ8/wSsMhmFEE8Gv+XmGEdU0huSrlJ9jJYhq099bov4=;
 b=TRE9VbLT5lQS0q1osS4l/jZ2ifIEjq5Yl8IgozJmuH3rZJeugpGuA2rnESFZEwyi4m
 SSiyM2OTaD97Pj2sMdd5eyxpGpk1GVrk9eMN3EMWH4KRFYEbzfgqI43JSJFZfNvE2Hsf
 r6L7oREHogDTmpeXt6xdGqAgxScrxSnkIxbme2ykMz6X5l8HikZ5LbuuJsFCqTE6DnrQ
 ISUCXcqKgPcxw/l2cwKORs1koYOTDdg8dt+bcwIDPo+FbcxUyX3XE7cwk/MWU/+43t1c
 du+DAGwTRLLH19s/+V/u7z1N0CNL4KpH4ozeeNP8W2ReD/BeO3nEk3aYSXVN3m8efjB+
 U3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745025624; x=1745630424;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iZ8/wSsMhmFEE8Gv+XmGEdU0huSrlJ9jJYhq099bov4=;
 b=Ah3AOGTakBSfHwkFlgBBMK8i3eC7sFkyMlQiSlsnPAO9TVhLf6Awe76B4DTf6KN3UA
 WMuydT2Xep9AsCj3QWl3jywbfhr7Mw/5Kwl4WFm14W+WySm7SR1KnL+CgpvUiHs6FLcP
 s9/yoGkQdAuz0r7Xos3XLvK9S3ro40LMJBgHSrc1QJLX/NEABrCR8kgU4HdNco433u/I
 21lDK3i8ZbtSrIJymUJWMqqHLiwnX3HzaURigWlnSKpvIq2eYg5v5hd9UqwMdf8DauQ+
 dLDDeb0YtcMdhGrJ6OeRifcAUgOogkhpzafcs1HXuMYi9IfnG/4QTLkSh4jBTyzIq6qY
 wQVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0cCPspRND0AzUVyV8sZ9zn3U0133rffgNdqbimjZuO0nKczrUD3bSFZ5GYCz/MIrgvjeh3On9VA==@nongnu.org
X-Gm-Message-State: AOJu0YzC5ghpIb9s8xRl00ZDsvP2WmPHjcK2Xofs4wXgx5hzvUp6yd0J
 Dp3kItzDLRMdJhGgepR7aKtphIrtUedGl20erb0ptjRwgzNFBcwBQWwAtKiAva4=
X-Gm-Gg: ASbGncsPxO2/XiFwYeT5r2wqccg1A88J0Nrd7C9p8n7AsZaf5xTFP2t8YjxhyiRlsLj
 aVj6kQq5pFebPPgZZWW7AXHJuaR4QzJ+VBXmhR7SRZHWQ1vy6VPnXOk3UWNUkl351WayXTD1Z4Y
 dhSKmk5vuhxQ25eJx0le5bg3l2uQ2NCGeCcoEchLJ8ViUby4yLvoO+8ssci9nqhfIEvMY84VGOe
 zFjJOZE6b/SUfVsWofvH0zEqXklpvUD/mbrGRxVfNjBgYIICiMlFeTb/pd1Eg5irby4ecJgIwIm
 Hn9WdQRNEtT5fRMerIGLAYTCRFklKBftxVBOYIW352gkUPQtoZPB/g==
X-Received: by 2002:a17:903:2f81:b0:223:4b88:780f with SMTP id
 d9443c01a7336-22c53582679mr78594005ad.17.1745025623695; 
 Fri, 18 Apr 2025 18:20:23 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50bf5425sm23463575ad.98.2025.04.18.18.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 18:20:23 -0700 (PDT)
Message-ID: <bb505862-a65e-4d83-b6bd-066c1281daf4@linaro.org>
Date: Fri, 18 Apr 2025 18:20:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] hw/arm: Define machines as generic QOM types
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Felipe Balbi
 <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20250417235814.98677-1-philmd@linaro.org>
 <a302fb91-e2d8-ef36-ac53-5e460476c2d0@eik.bme.hu>
 <25a82a76-cd63-4a42-bb68-5dcf826bd948@linaro.org>
 <26c2b844-dc96-448e-8978-e536ed1e61f6@linaro.org>
 <401c58d2-adda-81ec-eeec-0ddbcf3e4926@eik.bme.hu>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <401c58d2-adda-81ec-eeec-0ddbcf3e4926@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pn6CehclH2tQ

T24gNC8xOC8yNSAxMTo0OCwgQkFMQVRPTiBab2x0YW4gd3JvdGU6DQo+IE9uIEZyaSwgMTgg
QXByIDIwMjUsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPj4gT24gMTgvNC8y
NSAxODozMywgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4+PiBPbiA0LzE4LzI1IDAxOjUz
LCBCQUxBVE9OIFpvbHRhbiB3cm90ZToNCj4+Pj4gT24gRnJpLCAxOCBBcHIgMjAyNSwgUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+Pj4+PiBXaGlsZSBERUZJTkVfTUFDSElO
RSgpIGlzIGEgc3VjY2luY3QgbWFjcm8sIGl0IGRvZXNuJ3QNCj4+Pj4+IGFsbG93IHJlZ2lz
dGVyaW5nIFFPTSBpbnRlcmZhY2VzIHRvIHRoZSBkZWZpbmVkIG1hY2hpbmUuDQo+Pj4+PiBD
b252ZXJ0IHRvIHRoZSBnZW5lcmljIERFRklORV9UWVBFUygpIGluIHByZXBhcmF0aW9uIHRv
DQo+Pj4+PiByZWdpc3RlciBpbnRlcmZhY2VzLg0KPj4+Pj4NCj4+Pj4+IFBoaWxpcHBlIE1h
dGhpZXUtRGF1ZMOpICgxMSk6DQo+Pj4+PiAgwqAgaHcvY29yZS9udWxsLW1hY2hpbmU6IERl
ZmluZSBtYWNoaW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4+Pj4+ICDCoCBody9hcm0vYmFu
YW5hcGk6IERlZmluZSBtYWNoaW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4+Pj4+ICDCoCBo
dy9hcm0vY3ViaWVib2FyZDogRGVmaW5lIG1hY2hpbmUgYXMgZ2VuZXJpYyBRT00gdHlwZQ0K
Pj4+Pj4gIMKgIGh3L2FybS9kaWdpYzogRGVmaW5lIG1hY2hpbmUgYXMgZ2VuZXJpYyBRT00g
dHlwZQ0KPj4+Pj4gIMKgIGh3L2FybS9pbXg6IERlZmluZSBtYWNoaW5lcyBhcyBnZW5lcmlj
IFFPTSB0eXBlcw0KPj4+Pj4gIMKgIGh3L2FybS9pbnRlZ3JhdG9yY3A6IERlZmluZSBtYWNo
aW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4+Pj4+ICDCoCBody9hcm0va3ptOiBEZWZpbmUg
bWFjaGluZSBhcyBnZW5lcmljIFFPTSB0eXBlDQo+Pj4+PiAgwqAgaHcvYXJtL21zZjI6IERl
ZmluZSBtYWNoaW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4+Pj4+ICDCoCBody9hcm0vbXVz
aWNwYWw6IERlZmluZSBtYWNoaW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4+Pj4+ICDCoCBo
dy9hcm0vb3JhbmdlcGk6IERlZmluZSBtYWNoaW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4+
Pj4+ICDCoCBody9hcm0vc3RtMzI6IERlZmluZSBtYWNoaW5lcyBhcyBnZW5lcmljIFFPTSB0
eXBlcw0KPj4+Pj4NCj4+Pj4+IGh3L2FybS9iYW5hbmFwaV9tMnUuY8KgwqDCoMKgwqAgfCAx
MyArKysrKysrKysrKy0tDQo+Pj4+PiBody9hcm0vY3ViaWVib2FyZC5jwqDCoMKgwqDCoMKg
wqAgfCAxMyArKysrKysrKysrKy0tDQo+Pj4+PiBody9hcm0vZGlnaWNfYm9hcmRzLmPCoMKg
wqDCoMKgIHwgMTQgKysrKysrKysrKysrLS0NCj4+Pj4+IGh3L2FybS9pbXgyNV9wZGsuY8Kg
wqDCoMKgwqDCoMKgwqAgfCAxNCArKysrKysrKysrKystLQ0KPj4+Pj4gaHcvYXJtL2lteDht
cC1ldmsuY8KgwqDCoMKgwqDCoMKgIHwgMTUgKysrKysrKysrKysrKy0tDQo+Pj4+PiBody9h
cm0vaW50ZWdyYXRvcmNwLmPCoMKgwqDCoMKgIHwgMTYgKysrKysrKysrKysrKy0tLQ0KPj4+
Pj4gaHcvYXJtL2t6bS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0ICsrKysr
KysrKysrKy0tDQo+Pj4+PiBody9hcm0vbWNpbXg2dWwtZXZrLmPCoMKgwqDCoMKgIHwgMTUg
KysrKysrKysrKysrKy0tDQo+Pj4+PiBody9hcm0vbWNpbXg3ZC1zYWJyZS5jwqDCoMKgwqAg
fCAxNSArKysrKysrKysrKysrLS0NCj4+Pj4+IGh3L2FybS9tc2YyLXNvbS5jwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTMgKysrKysrKysrKystLQ0KPj4+Pj4gaHcvYXJtL211c2ljcGFsLmPC
oMKgwqDCoMKgwqDCoMKgwqAgfCAxNiArKysrKysrKysrKysrLS0tDQo+Pj4+PiBody9hcm0v
bmV0ZHVpbm8yLmPCoMKgwqDCoMKgwqDCoMKgIHwgMTMgKysrKysrKysrKystLQ0KPj4+Pj4g
aHcvYXJtL25ldGR1aW5vcGx1czIuY8KgwqDCoMKgIHwgMTMgKysrKysrKysrKystLQ0KPj4+
Pj4gaHcvYXJtL29saW1leC1zdG0zMi1oNDA1LmMgfCAxMyArKysrKysrKysrKy0tDQo+Pj4+
PiBody9hcm0vb3JhbmdlcGkuY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDEzICsrKysrKysrKysr
LS0NCj4+Pj4+IGh3L2FybS9zYWJyZWxpdGUuY8KgwqDCoMKgwqDCoMKgwqAgfCAxNCArKysr
KysrKysrKystLQ0KPj4+Pj4gaHcvYXJtL3N0bTMydmxkaXNjb3ZlcnkuY8KgIHwgMTMgKysr
KysrKysrKystLQ0KPj4+Pj4gaHcvY29yZS9udWxsLW1hY2hpbmUuY8KgwqDCoMKgIHwgMTQg
KysrKysrKysrKysrLS0NCj4+Pj4+IDE4IGZpbGVzIGNoYW5nZWQsIDIxMyBpbnNlcnRpb25z
KCspLCAzOCBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gVGhpcyBpcyBtdWNoIGxvbmdlciBh
bmQgZXhwb3NpbmcgYm9pbGVyIHBsYXRlIGNvZGUuIElzIGl0IHBvc3NpYmxlIGluc3RlYWQN
Cj4+Pj4gdG8gY2hhbmdlIERFRklORV9NQUNISU5FIG9yIGFkZCBhbm90aGVyIHNpbWlsYXIg
bWFjcm8gdGhhdCBhbGxvd3MNCj4+Pj4gc3BlY2lmeWluZyBtb3JlIGRldGFpbHMgc3VjaCBh
cyBjbGFzcyBzdGF0ZSB0eXBlIGFuZCBpbnRlcmZhY2VzIGxpa2Ugd2UNCj4+Pj4gYWxyZWFk
eSBoYXZlIGZvciBPQkpFQ1RfREVGSU5FIG1hY3JvcyB0byBrZWVwIHRoZSBib2lsZXIgcGxh
dGUgY29kZSBoaWRkZW4NCj4+Pj4gYW5kIG5vdCBicmluZyBpdCBiYWNrPw0KPj4+Pg0KPj4+
DQo+Pj4gV2UgY2FuIGV2ZW50dWFsbHkgbW9kaWZ5IERFRklORV9NQUNISU5FUywgdG8gdGFr
ZSBhbiBhZGRpdGlvbmFsIGludGVyZmFjZXMNCj4+PiBwYXJhbWV0ZXIsIGFuZCByZXBsYWNl
IGFsbCBjYWxsIHNpdGVzLCB3aXRoIGFuIGVtcHR5IGxpc3QgZm9yIGFsbCBib2FyZHMNCj4+
PiBvdXQgb2YgaHcvYXJtLg0KPj4+DQo+Pj4gQXMgbG9uZyBhcyB3ZSBhdm9pZCBzb21ldGhp
bmcgbGlrZToNCj4+PiBERUZJTkVfTUFDSElORVNfV0lUSF9JTlRFUkZBQ0VfMSguLi4pDQo+
Pj4gREVGSU5FX01BQ0hJTkVTX1dJVEhfSU5URVJGQUNFXzIoLi4uKQ0KPj4+IERFRklORV9N
QUNISU5FU19XSVRIX0lOVEVSRkFDRV8zKC4uLikNCj4+PiBJJ20gb2sgd2l0aCBrZWVwaW5n
IHRoZSBtYWNyby4NCj4+Pg0KPj4+IFdvdWxkIHRoYXQgd29yayBmb3IgeW91IGZvbGtzPw0K
Pj4NCj4+IEJ1dCB0aGVuIHdlJ2xsIHdhbnQgREVGSU5FX1BQQzMyX01BQ0hJTkUoKSAtPg0K
Pj4gREVGSU5FX01BQ0hJTkVTX1dJVEhfSU5URVJGQUNFXzEoKSBldGMuLi4NCj4+DQo+PiBX
ZSB3YW50IHRvIGV2ZW50dWFsbHkgdXNlIGRlY2xhcmF0aXZlIGZpbGUgdG8gc3RydWN0dXJl
IG1vc3Qgb2YgdGhlDQo+PiBtYWNoaW5lIGJvaWxlciBwbGF0ZSBjb2RlLiBNYXliZSBiZWlu
ZyBtb21lbnRhcmlseSB2ZXJib3NlIGlzDQo+PiBhY2NlcHRhYmxlLi4uDQo+IA0KPiBNb21l
bnRzIGluIFFFTVUgY2FuIGxhc3QgeWVhcnMuLi4gSSB3YXMgdGhpbmtpbmcgYWJvdXQgc2lt
aWxhciB0bw0KPiBPQkpFQ1RfREVGSU5FX1NJTVBMRV9UWVBFX1dJVEhfSU5URVJGQUNFUy4g
V291bGQgc29tZXRoaW5nIGxpa2UgdGhhdCBiZQ0KPiBwb3NzaWJsZSBmb3IgREVGSU5FX01B
Q0hJTkUgdG9vPw0KPiANCg0KV2UgY2FuIGp1c3QgYWRkIHRoZSBsaXN0IG9mIGludGVyZmFj
ZXMgdGhlIG1hY2hpbmUgaXMgaW1wbGVtZW50aW5nIGFzIGFuIA0KYWRkaXRpb25hbCBwYXJh
bWV0ZXIgdG8gREVGSU5FX01BQ0hJTkUsIGFuZCB0aGlzIHNvbHZlcyB0aGUgcHJvYmxlbSAN
CndpdGhvdXQgYWRkaW5nIGFueSBib2lsZXJwbGF0ZS4NCg0KVWx0aW1hdGVseSwgd2UnbGwg
bmVlZCB0byB0YWcgYWxsIG1hY2hpbmVzIHRvIG1lbnRpb24gdGFyZ2V0cyBzdXBwb3J0ZWQs
IA0Kc28gdGhpcyBpbmZvcm1hdGlvbiBoYXMgdG8gYmUgd3JpdHRlbiBzb21ld2hlcmUuDQoN
Cj4gUmVnYXJkcywNCj4gQkFMQVRPTiBab2x0YW4NCg0K
