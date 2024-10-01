Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp318293njl;
        Tue, 1 Oct 2024 09:54:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLFHLsCcqSMz9f3kkVYTW9Rv4N9vNU8tONZtGkmVx8eB0Z6KWL6gJufRBvLkhdWGU+XHPx1cdveAL73g==@linaro.org
X-Received: by 2002:a17:902:db0e:b0:20b:9698:a220 with SMTP id d9443c01a7336-20bc5a4eacfmr3507585ad.40.1727801657187;
        Tue, 01 Oct 2024 09:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801657; cv=none;
        d=google.com; s=arc-20160816;
        b=l74CChBiFB3yMARGPI7bIyH6HoF6Eee/osB3YkSZYWBR7JxhcDftwIng3VBJOH04Q6
         y+9zOEswHaSXWXhNucEh7CbcRh5dSgf7r9xZM+ucQEagYxqZbkVsRDo4DUEQ2hSv0dwc
         FpKi9e8Ycz33ke4I37m4vgrp+NcnGBh7XPAFJgHMiQE7DwL4JVFYHz+lA85mtbNCqm27
         nHddwwbptN+dyqO1d+DVsCe3/hpdWEkhWNBUPd1kV5kTyJqjKStCOSmzasrG1UrQkwMa
         CvEUTd30cfTf1sXAHJ93vxwQg2+GFi2//xPoXXcF9Pt7BuDg2TdcKRl2r7xhKNwCSLn6
         iJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=n8WZYo/smvGOwt0dJrtZi25lZ2Ge2hAEjMAzmHYif+I=;
        fh=C6ZMyfis+umg1H5AzoDYZOiHYVG36SnHz8946dBQnAs=;
        b=WFOATERfaQZu6pPGuJLJXddQ2hIfKeJ5hhUGxVU2xrK8JerHS3ui0HGvh4WTMxnmS9
         yQBH0TrPUsothZ/csSc8kzNah5AMnNzRk3sSZkMwRY169YO4LvwOQsDOU6wbwu5iTFeH
         HW/xep73ci3S+cWVIT3mKxwjwPxHiFdWiu5BjbGA0rksu5sSdlLv0tduZqQkLIAlSgvi
         mn7bSxmBETQTyPRvhaXN4P06lcdWt7atEgxXa8SazqybrLR5Lfro9SPceB6QSuYm6w6v
         wHvCKUr++LJUynEX8Z52JtN+59QwJ4Bl4NKlRbfwcTYIiGqSmV+hORLuDtUlGpgmyL+6
         fa6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwHrGiN6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20b84be73b6sor30317195ad.10.2024.10.01.09.54.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwHrGiN6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801657; x=1728406457; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8WZYo/smvGOwt0dJrtZi25lZ2Ge2hAEjMAzmHYif+I=;
        b=wwHrGiN6ogK2RZkTdfGv081JWnKIxRUYccwbfX67+Yjl3v3Pvv09g1kDHD6V30SPa/
         nOw6SgF4v2F0xIyN/3Ze30o7PpFUGXeSolzyel0l9klA+0bTcaYnA3llit57e0D7hOVR
         o7zApCaGIj0PimNayjdssxrJgZfwjFoQxEORMN623JJzabqkxUc63BfcP6vYj5ow7VNM
         DmA6UpGrmJSZo6VZVeA57zY4YYR4UCBYsiIVVOQB5TAyVp8xbrPMewFeJu7F4mYnd2gh
         viiV1HdAvhi5GbYDaZfUwliEoLnDHW+sIptlqjCniqJdA7K9YcpGvlaBtNIx8AHtwje5
         QsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801657; x=1728406457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8WZYo/smvGOwt0dJrtZi25lZ2Ge2hAEjMAzmHYif+I=;
        b=rup3WcjUzoSLVpwtte10y4m2NBIKj6Pi+zyr8UeWFbMNnbXIr50vSxgSdkg1d32ph+
         Xjir90tfruP27BtE2KfuTfrCwE+Y/wgtzlJDrEidEcaCI0Xv9etmn+M28Myd5zUFwE9Z
         tlWcwAVMLRM3+G+QcjT9jSR3HPNNo6iRL7WexGLbfaR15EVY8tLz2GzVbMyjOjzcAnYp
         kxIpDfl0j50y+LnRFsYhpzrzZvsNuWhX62SHWSs+8a5XMgmsQVH6aj2BoyVGuJuSP/qs
         72YHGd9RC/iqfG+rAJK5dwajgd8ol4w39d2ekhu+Qu5R0vC/JQ0BZx+Ft1ccPIeqJrlw
         XmAg==
X-Forwarded-Encrypted: i=1; AJvYcCUgknnsEpCCA/+LBZTEWmftydW4nsCxV3cUtAo0+OocwJmuYI8997Qy6aQXWDr6fZvV9ditKehp8usoeQ==@linaro.org
X-Gm-Message-State: AOJu0YwZT65gyZWnjBbEkLMbtjhaCK4gsFjEXgsdvG+Qpy3y3QSFJkFY
	Fwx4tbS49QS5TfQrt0GAztuWl1tcKLk6UUkR6FSfNybz7j9bLKICLuJStjpFeGRuAQ==
X-Google-Smtp-Source: AGHT+IGXpMi8lppIctK9eUZN9dYd+tHZ9l0HdoI5wWXECb2atWSCvRZAMEC3F0C4Z8+mOgcoBD4nSw==
X-Received: by 2002:a17:902:f543:b0:20b:7094:8d14 with SMTP id d9443c01a7336-20bc5999061mr2565645ad.5.1727801656645;
        Tue, 01 Oct 2024 09:54:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0d733sm71423635ad.122.2024.10.01.09.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:54:16 -0700 (PDT)
Message-ID: <ac7bde34-8c7a-4841-b8c2-94eb1bb1c724@linaro.org>
Date: Tue, 1 Oct 2024 09:54:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] exec/memory_ldst_phys: Introduce
 ld/st_endian_phys() API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-10-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: UXCWj2dp4cmM

T24gOS8zMC8yNCAwMDozNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IElu
dHJvZHVjZSB0aGUgbGQvc3RfZW5kaWFuX3BoeXMoKSBBUEksIHdoaWNoIHRha2VzIGFuIGV4
dHJhDQo+IGJvb2xlYW4gYXJndW1lbnQgdG8gZGlzcGF0Y2ggdG8gbGQvc3Rfe2JlLGxlfV9w
aHlzKCkgbWV0aG9kcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0tDQo+IFRPRE86IFVwZGF0ZSBkb2Nz
dHJpbmcgcmVnZXhwDQo+IC0tLQ0KPiAgIGluY2x1ZGUvZXhlYy9tZW1vcnlfbGRzdF9waHlz
LmguaW5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZXhlYy9tZW1vcnlfbGRzdF9waHlzLmguaW5jIGIvaW5jbHVkZS9leGVjL21lbW9yeV9sZHN0
X3BoeXMuaC5pbmMNCj4gaW5kZXggZWNkNjc4NjEwZC4uOGVhMTYyYjQwZCAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9leGVjL21lbW9yeV9sZHN0X3BoeXMuaC5pbmMNCj4gKysrIGIvaW5j
bHVkZS9leGVjL21lbW9yeV9sZHN0X3BoeXMuaC5pbmMNCj4gQEAgLTc0LDYgKzc0LDE2IEBA
IHN0YXRpYyBpbmxpbmUgdWludDE2X3QgZ2x1ZShsZHV3X2JlX3BoeXMsIFNVRkZJWCkoQVJH
MV9ERUNMLCBod2FkZHIgYWRkcikNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsIE5VTEwpOw0KPiAg
IH0NCj4gICANCj4gK3N0YXRpYyBpbmxpbmUgdWludDE2X3QgZ2x1ZShsZHV3X2VuZGlhbl9w
aHlzLCBTVUZGSVgpKGJvb2wgYmlnX2VuZGlhbiwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFSRzFfREVDTCwgaHdhZGRyIGFk
ZHIpDQo+ICt7DQo+ICsgICAgcmV0dXJuIGJpZ19lbmRpYW4NCj4gKyAgICAgICAgICAgPyBn
bHVlKGFkZHJlc3Nfc3BhY2VfbGR1d19sZSwgU1VGRklYKShBUkcxLCBhZGRyLA0KPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1FTVRYQVRU
UlNfVU5TUEVDSUZJRUQsIE5VTEwpDQo+ICsgICAgICAgICAgIDogZ2x1ZShhZGRyZXNzX3Nw
YWNlX2xkdXdfYmUsIFNVRkZJWCkoQVJHMSwgYWRkciwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVE
LCBOVUxMKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbmxpbmUgdWludDMyX3QgZ2x1ZShs
ZGxfbGVfcGh5cywgU1VGRklYKShBUkcxX0RFQ0wsIGh3YWRkciBhZGRyKQ0KPiAgIHsNCj4g
ICAgICAgcmV0dXJuIGdsdWUoYWRkcmVzc19zcGFjZV9sZGxfbGUsIFNVRkZJWCkoQVJHMSwg
YWRkciwNCj4gQEAgLTg2LDYgKzk2LDE2IEBAIHN0YXRpYyBpbmxpbmUgdWludDMyX3QgZ2x1
ZShsZGxfYmVfcGh5cywgU1VGRklYKShBUkcxX0RFQ0wsIGh3YWRkciBhZGRyKQ0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJT
X1VOU1BFQ0lGSUVELCBOVUxMKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIHVp
bnQzMl90IGdsdWUobGRsX2VuZGlhbl9waHlzLCBTVUZGSVgpKGJvb2wgYmlnX2VuZGlhbiwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgQVJHMV9ERUNMLCBod2FkZHIgYWRkcikNCj4gK3sNCj4gKyAgICByZXR1cm4gYmlnX2Vu
ZGlhbg0KPiArICAgICAgICAgICA/IGdsdWUoYWRkcmVzc19zcGFjZV9sZGxfbGUsIFNVRkZJ
WCkoQVJHMSwgYWRkciwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsIE5VTEwpDQo+ICsgICAgICAg
ICAgIDogZ2x1ZShhZGRyZXNzX3NwYWNlX2xkbF9iZSwgU1VGRklYKShBUkcxLCBhZGRyLA0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVN
VFhBVFRSU19VTlNQRUNJRklFRCwgTlVMTCk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW5s
aW5lIHVpbnQ2NF90IGdsdWUobGRxX2xlX3BoeXMsIFNVRkZJWCkoQVJHMV9ERUNMLCBod2Fk
ZHIgYWRkcikNCj4gICB7DQo+ICAgICAgIHJldHVybiBnbHVlKGFkZHJlc3Nfc3BhY2VfbGRx
X2xlLCBTVUZGSVgpKEFSRzEsIGFkZHIsDQo+IEBAIC05OCw2ICsxMTgsMTYgQEAgc3RhdGlj
IGlubGluZSB1aW50NjRfdCBnbHVlKGxkcV9iZV9waHlzLCBTVUZGSVgpKEFSRzFfREVDTCwg
aHdhZGRyIGFkZHIpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsIE5VTEwpOw0KPiAgIH0NCj4gICAN
Cj4gK3N0YXRpYyBpbmxpbmUgdWludDMyX3QgZ2x1ZShsZHFfZW5kaWFuX3BoeXMsIFNVRkZJ
WCkoYm9vbCBiaWdfZW5kaWFuLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBBUkcxX0RFQ0wsIGh3YWRkciBhZGRyKQ0KPiArew0K
PiArICAgIHJldHVybiBiaWdfZW5kaWFuDQo+ICsgICAgICAgICAgID8gZ2x1ZShhZGRyZXNz
X3NwYWNlX2xkcV9sZSwgU1VGRklYKShBUkcxLCBhZGRyLA0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNVFhBVFRSU19VTlNQRUNJRklF
RCwgTlVMTCkNCj4gKyAgICAgICAgICAgOiBnbHVlKGFkZHJlc3Nfc3BhY2VfbGRxX2JlLCBT
VUZGSVgpKEFSRzEsIGFkZHIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBOVUxMKTsNCj4gK30N
Cj4gKw0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBnbHVlKHN0Yl9waHlzLCBTVUZGSVgpKEFS
RzFfREVDTCwgaHdhZGRyIGFkZHIsIHVpbnQ4X3QgdmFsKQ0KPiAgIHsNCj4gICAgICAgZ2x1
ZShhZGRyZXNzX3NwYWNlX3N0YiwgU1VGRklYKShBUkcxLCBhZGRyLCB2YWwsDQo+IEBAIC0x
MTYsNiArMTQ2LDE4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnbHVlKHN0d19iZV9waHlzLCBT
VUZGSVgpKEFSRzFfREVDTCwgaHdhZGRyIGFkZHIsIHVpbnQxNl90IHZhDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNVFhBVFRSU19VTlNQRUNJRklF
RCwgTlVMTCk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIGlubGluZSB2b2lkIGdsdWUoc3R3
X2VuZGlhbl9waHlzLCBTVUZGSVgpKGJvb2wgYmlnX2VuZGlhbiwgQVJHMV9ERUNMLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh3YWRk
ciBhZGRyLCB1aW50MTZfdCB2YWwpDQo+ICt7DQo+ICsgICAgaWYgKGJpZ19lbmRpYW4pIHsN
Cj4gKyAgICAgICAgZ2x1ZShhZGRyZXNzX3NwYWNlX3N0d19iZSwgU1VGRklYKShBUkcxLCBh
ZGRyLCB2YWwsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTUVNVFhBVFRSU19VTlNQRUNJRklFRCwgTlVMTCk7DQo+ICsgICB9IGVsc2Ugew0KPiAr
ICAgICAgICBnbHVlKGFkZHJlc3Nfc3BhY2Vfc3R3X2xlLCBTVUZGSVgpKEFSRzEsIGFkZHIs
IHZhbCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBN
RU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBOVUxMKTsNCj4gKyAgICB9DQo+ICt9DQo+ICsNCj4g
ICBzdGF0aWMgaW5saW5lIHZvaWQgZ2x1ZShzdGxfbGVfcGh5cywgU1VGRklYKShBUkcxX0RF
Q0wsIGh3YWRkciBhZGRyLCB1aW50MzJfdCB2YWwpDQo+ICAgew0KPiAgICAgICBnbHVlKGFk
ZHJlc3Nfc3BhY2Vfc3RsX2xlLCBTVUZGSVgpKEFSRzEsIGFkZHIsIHZhbCwNCj4gQEAgLTEy
OCw2ICsxNzAsMTggQEAgc3RhdGljIGlubGluZSB2b2lkIGdsdWUoc3RsX2JlX3BoeXMsIFNV
RkZJWCkoQVJHMV9ERUNMLCBod2FkZHIgYWRkciwgdWludDMyX3QgdmENCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVE
LCBOVUxMKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZ2x1ZShzdGxf
ZW5kaWFuX3BoeXMsIFNVRkZJWCkoYm9vbCBiaWdfZW5kaWFuLCBBUkcxX0RFQ0wsDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaHdhZGRy
IGFkZHIsIHVpbnQzMl90IHZhbCkNCj4gK3sNCj4gKyAgICBpZiAoYmlnX2VuZGlhbikgew0K
PiArICAgICAgICBnbHVlKGFkZHJlc3Nfc3BhY2Vfc3RsX2JlLCBTVUZGSVgpKEFSRzEsIGFk
ZHIsIHZhbCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBNRU1UWEFUVFJTX1VOU1BFQ0lGSUVELCBOVUxMKTsNCj4gKyAgIH0gZWxzZSB7DQo+ICsg
ICAgICAgIGdsdWUoYWRkcmVzc19zcGFjZV9zdGxfbGUsIFNVRkZJWCkoQVJHMSwgYWRkciwg
dmFsLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1F
TVRYQVRUUlNfVU5TUEVDSUZJRUQsIE5VTEwpOw0KPiArICAgIH0NCj4gK30NCj4gKw0KPiAg
IHN0YXRpYyBpbmxpbmUgdm9pZCBnbHVlKHN0cV9sZV9waHlzLCBTVUZGSVgpKEFSRzFfREVD
TCwgaHdhZGRyIGFkZHIsIHVpbnQ2NF90IHZhbCkNCj4gICB7DQo+ICAgICAgIGdsdWUoYWRk
cmVzc19zcGFjZV9zdHFfbGUsIFNVRkZJWCkoQVJHMSwgYWRkciwgdmFsLA0KPiBAQCAtMTM5
LDYgKzE5MywxOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2x1ZShzdHFfYmVfcGh5cywgU1VG
RklYKShBUkcxX0RFQ0wsIGh3YWRkciBhZGRyLCB1aW50NjRfdCB2YQ0KPiAgICAgICBnbHVl
KGFkZHJlc3Nfc3BhY2Vfc3RxX2JlLCBTVUZGSVgpKEFSRzEsIGFkZHIsIHZhbCwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNRU1UWEFUVFJTX1VOU1BF
Q0lGSUVELCBOVUxMKTsNCj4gICB9DQo+ICsNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBnbHVl
KHN0cV9lbmRpYW5fcGh5cywgU1VGRklYKShib29sIGJpZ19lbmRpYW4sIEFSRzFfREVDTCwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBo
d2FkZHIgYWRkciwgdWludDY0X3QgdmFsKQ0KPiArew0KPiArICAgIGlmIChiaWdfZW5kaWFu
KSB7DQo+ICsgICAgICAgIGdsdWUoYWRkcmVzc19zcGFjZV9zdHFfYmUsIFNVRkZJWCkoQVJH
MSwgYWRkciwgdmFsLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIE1FTVRYQVRUUlNfVU5TUEVDSUZJRUQsIE5VTEwpOw0KPiArICAgfSBlbHNlIHsN
Cj4gKyAgICAgICAgZ2x1ZShhZGRyZXNzX3NwYWNlX3N0cV9sZSwgU1VGRklYKShBUkcxLCBh
ZGRyLCB2YWwsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTUVNVFhBVFRSU19VTlNQRUNJRklFRCwgTlVMTCk7DQo+ICsgICAgfQ0KPiArfQ0KPiAg
ICNlbmRpZg0KPiAgIA0KPiAgICN1bmRlZiBBUkcxX0RFQ0wNCg0KUmV2aWV3ZWQtYnk6IFBp
ZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
