Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2261898njk;
        Sun, 1 Dec 2024 10:09:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVH3S0V6e5Y6Y+PsEmZhDt5Y1Kh2MdFAqO6cwVlHpm5EDbUf6ReL9uZNsUOFWJYLsf6Z/9k9W91q99zVQ==@linaro.org
X-Received: by 2002:a17:903:94d:b0:20c:ecca:432b with SMTP id d9443c01a7336-21501c60adamr308924495ad.35.1733076591950;
        Sun, 01 Dec 2024 10:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733076591; cv=none;
        d=google.com; s=arc-20240605;
        b=drHVEirFtW/rhjOIG/rSeuDusN+KCAyjevHPSO/L9XbpF4DH6B296qQ6M4PuB01guS
         yX5angp4e2m/ZO8pw9pN+eOrFaRZFerBCWNHDnQW6ZzYqvEba49jxOwQmkTSBFwnMoqp
         ReHqO1KRjHw7w0Xm1T8EdIia05ynfuNZE1I+9kYH4+ivR2IiLOeIKSE+Sw8a6NAIcXhf
         zyiLagAwMfVvWT/fs7Vw5rRzEGKIDF3aJHK2xQdMDq79ydz7by59PWQ52IS+xd5rKCLb
         dlm3Vo0EzgW2zCvNC7+7O4vkEwkS/jT6piiJe4xNlsR56rdbSfiCIcLoYmqBvLHFNQs/
         OLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=n9Vkf4VpTjxNdTnHmUl8ymEfzbkbXtr5XEawODDydQ4=;
        fh=8fuTSV2sc3MbAzKh+xJ5rEBW/T//YSljZZkHuDQS4b4=;
        b=dIyUJ3WGnvNQy3Wa2Zq7GMthyID+LTfw7mXXHz36Wi8/rAtRr9+HZE7XqeMOx4PZHZ
         J0IBXd14IesZGQjHEYVP4WbwjK2A8RQ7eLqbS/uqNk9nhxhZommPDhDB2IFvB7qsHthP
         e372bi3D+6TkD/fmVLyhvLMk3X4g2QiddKoeiEPk9QbQQcZnCLmu3s5REJOU0mCixArE
         mN9/UTGVffAdz/PebgYar6QFarJ/ijCUqeozNDfrFtecKnjJ8+SVFAI38ws6vpaS4f+e
         89OF1TLEkxpq9ZDJCJ4KWIO7RZbTkfMl1eceTCdf9fhiE9MhU+VSEo/s+c8FxSlELoI/
         knHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XR/kpTpF";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215543afacasor20858715ad.1.2024.12.01.10.09.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Dec 2024 10:09:51 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XR/kpTpF";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733076591; x=1733681391; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n9Vkf4VpTjxNdTnHmUl8ymEfzbkbXtr5XEawODDydQ4=;
        b=XR/kpTpFlTiWb1huc6I7F4SxLahT9fbI6STZgspO7zMR61bOkbodGdoHhvdz2fqErB
         djjwr/Eukefkz5YH7vbPeQhtsIFq24NhAYN3onYzdZ8yOkkk0Jhw6mxvq/BpJtEjk6y5
         C+QwpnnuSe9CXCL7FvSOKzzTSeLU4tpzGJiT3n3qId5sNzhqswedd/8cHsPIjl5Ec+YM
         AECTHLAurMbdRx3Xr1YTSrYx1rQcqdzZXDC8TYwQHNXqZy0agDk6SEh2SvUU+LlgmRH0
         GkueYdjxczDEWMlxTUkk+EMtbumfJDEFNipIpuzTzyA4agP+aq50zGTPbF4C1vpVrS5v
         xAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733076591; x=1733681391;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n9Vkf4VpTjxNdTnHmUl8ymEfzbkbXtr5XEawODDydQ4=;
        b=kPhSyI7Z7//ImRTl1UrRw0pP3Rev0wO4ZLBfLNI7o7d+sAhE0xLXrWGcNP31KT0XhV
         86kHfjLLATOU8gM3p+XiXmZkS9Am25DRiFBYXPC+3GcGkJtTOcs1kydwjUZ5M5k2VDl4
         QTzk31wUH3JnXvPE8Bnw0eOrDLqJPhUDhwZDumyhGkR4JfU9Ewap+Q9EGAkcgJtqaEf/
         WzGOOPUAcQT9qiaJrzvM5UvGpMIdp51hAjP39KTbmSnI1Z0IwV2lnl55SUlXsVV5Qk0j
         yOUlCseHWbCjbxrOeyVy1/4nRAHKSlkym3mtNwMfUXXhkOrodfIE5ymw+W2GU6N5fzQm
         tUHA==
X-Forwarded-Encrypted: i=1; AJvYcCV3g5IEebHk66+jEzv1EJPr8vkLjsbnONyArXZMF/FMVFdqUhikQcPdlWmdAWISdU4E9Xai3iDIA/a3DQ==@linaro.org
X-Gm-Message-State: AOJu0YxdEROQ3FzDoZjKSMFGb0/+BFQSmKQNJrpIvcE09efWsjnLoDHC
	ah65W9Yf88W3IZazWSjsiJXLHd32o4LvjAYj+YX3fmtZykOAdj4LMWOLKj+YV6bVAA==
X-Gm-Gg: ASbGncsu3PjXPibA671bouNTGwYBBSQ7QMEm/iXjjQSUcPOQ4J2teEcuNA6yqqhgyhM
	o7NsCRE/mwqK9sFKNdBSfMJl4SyW1QUd+Vhq96lUawI4GGZnRoGM+pPzhFlH+ccsYazY99+Ga/r
	EQVUtL4A7XgUKohQNdYVB7EaQznG7T9didY22bVWlONf8KNh5kJ+qXR4YT8PqV4ASQtROcf6DJI
	kJiRhE7C389DfhNASigOls2BtQYN6+QZsMSDN/FTPkTsmvrPaEZDLrnCJODZTDxL95sfuVzW5yy
	6th36F+QyvxD79d5Vb6nUw==
X-Google-Smtp-Source: AGHT+IFwMHlT7+qpfrlTZFCrtuyJIrNP01U7im6VCLuOYP209+ovTVwo+5uWDAseSrmGIvTk59sb+g==
X-Received: by 2002:a17:902:ec90:b0:215:603e:214a with SMTP id d9443c01a7336-215603e2398mr104659985ad.1.1733076591477;
        Sun, 01 Dec 2024 10:09:51 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154704346asm41225055ad.18.2024.12.01.10.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2024 10:09:51 -0800 (PST)
Message-ID: <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
Date: Sun, 1 Dec 2024 10:09:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, alex.bennee@linaro.org,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: uNvhMxs4voDx

SGkgTWFyY2luLA0KDQpPbiAxMi8xLzI0IDA1OjM0LCBNYXJjaW4gSnVzemtpZXdpY3ogd3Jv
dGU6DQo+IFcgZG5pdSAyOC4xMS4yMDI0IG/CoDIyOjM3LCBQaWVycmljayBCb3V2aWVyIHBp
c3plOg0KPj4gVGhpcyBib290IGFuIE9QLVRFRSBlbnZpcm9ubWVudCwgYW5kIGxhdW5jaCBh
IG5lc3RlZCBndWVzdCBWTSBpbnNpZGUgaXQNCj4+IHVzaW5nIHRoZSBSZWFsbXMgZmVhdHVy
ZS4gV2UgZG8gaXQgZm9yIHZpcnQgYW5kIHNic2EtcmVmIHBsYXRmb3Jtcy4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFy
by5vcmc+DQo+IA0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2Z1bmN0aW9uYWwvbWVzb24uYnVp
bGQgYi90ZXN0cy9mdW5jdGlvbmFsL21lc29uLmJ1aWxkDQo+PiBpbmRleCA1YzA0OGNmYWM2
ZC4uYjk3NWExNTYwZGYgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0cy9mdW5jdGlvbmFsL21lc29u
LmJ1aWxkDQo+PiArKysgYi90ZXN0cy9mdW5jdGlvbmFsL21lc29uLmJ1aWxkDQo+PiBAQCAt
MTMsNiArMTMsOCBAQCBlbmRpZg0KPj4gICAgdGVzdF90aW1lb3V0cyA9IHsNCj4+ICAgICAg
J2FhcmNoNjRfYXNwZWVkJyA6IDYwMCwNCj4+ICAgICAgJ2FhcmNoNjRfcmFzcGk0JyA6IDQ4
MCwNCj4gDQo+PiArICAnYWFyY2g2NF9ybWVfdmlydCcgOiA3MjAsDQo+IA0KPiBUb29rIDI5
NzQuOTVzIG9uIE0xIFBybyBtYWNib29rLg0KPiANCj4+ICsgICdhYXJjaDY0X3JtZV9zYnNh
cmVmJyA6IDcyMCwNCj4gDQo+IFRoaXMgb25lIG5lZWRlZCAyMjg4LjI5cy4NCj4gDQo+PiAg
ICAgICdhYXJjaDY0X3Nic2FyZWZfYWxwaW5lJyA6IDcyMCwNCj4gDQo+IEhhdmUgdG8gY2hl
Y2sgY2F1c2UgdGltZWQgb3V0Lg0KPiANCj4+ICAgICAgJ2FhcmNoNjRfc2JzYXJlZl9mcmVl
YnNkJyA6IDcyMCwNCj4gDQo+IDMzMS42NXMNCj4gDQo+IFNvIFJNRSB0ZXN0cyBwcm9iYWJs
eSBuZWVkIGxvbmdlciB0aW1lb3V0cyBvciB3b3VsZCBub3QgcnVuIGF0IGFsbC4NCj4gDQoN
CkJ5IGFueSBjaGFuY2UsIGFyZSB5b3UgcnVubmluZyB0aG9zZSB0ZXN0cyBpbiBkZWJ1ZyBt
b2RlPw0KSXQgc2VlbXMgdG8gbWUgdGhhdCBDSSBpcyBydW5uaW5nIGZ1bmN0aW9uYWwgdGVz
dHMgd2l0aCBvcHRpbWl6ZWQgDQpidWlsZHMsIHNvIEknbSBub3Qgc3VyZSB3ZSB3YW50IHRv
IHN1cHBvcnQgZGVidWcgInRpbWVzIiBoZXJlLg0KDQo+IA0KPj4gKysrIGIvdGVzdHMvZnVu
Y3Rpb25hbC90ZXN0X2FhcmNoNjRfcm1lX3Nic2FyZWYucHkNCj4gDQo+PiArICAgICAgICBz
ZWxmLnZtLmFkZF9hcmdzKCctYWNjZWwnLCAndGNnJykNCj4gDQo+IFRoYXQncyBkZWZhdWx0
IHZhbHVlIHNvIGNhbiBiZSBza2lwcGVkLg0KPiANCg0KT2suDQoNCj4+ICsgICAgICAgIHNl
bGYudm0uYWRkX2FyZ3MoJy1jcHUnLCAnbWF4LHgtcm1lPW9uJykNCj4gDQo+PiArICAgICAg
ICBzZWxmLnZtLmFkZF9hcmdzKCctbScsICcyRycpDQo+IA0KPiBJIHNlbnQgcGF0Y2ggdG8g
YnVtcCBkZWZhdWx0IG1lbXNpemUgdG8gMkcgcmVjZW50bHkuDQo+IA0KDQpJcyB0aGF0IG1l
cmdlZCBhbHJlYWR5LCBvciB3aWxsIGJlIGxhdGVyPw0KDQo+PiArICAgICAgICBzZWxmLnZt
LmFkZF9hcmdzKCctTScsICdzYnNhLXJlZicpDQo+PiArICAgICAgICBzZWxmLnZtLmFkZF9h
cmdzKCctZHJpdmUnLCBmJ2ZpbGU9e3BmbGFzaDB9LGZvcm1hdD1yYXcsaWY9cGZsYXNoJykN
Cj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1kcml2ZScsIGYnZmlsZT17cGZsYXNo
MX0sZm9ybWF0PXJhdyxpZj1wZmxhc2gnKQ0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJn
cygnLWRyaXZlJywgZidmaWxlPWZhdDpydzp7dmlydHVhbH0sZm9ybWF0PXJhdycpDQo+IA0K
Pj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWRyaXZlJywgZidmb3JtYXQ9cmF3LGlm
PW5vbmUsZmlsZT17ZHJpdmV9LGlkPWhkMCcpDQo+PiArICAgICAgICBzZWxmLnZtLmFkZF9h
cmdzKCctZGV2aWNlJywgJ3ZpcnRpby1ibGstcGNpLGRyaXZlPWhkMCcpDQo+IA0KPiBzYnNh
LXJlZiBpcyBmdWxseSBlbXVsYXRlZCB0YXJnZXQuIFRoZXJlIGlzIEFIQ0kgY29udHJvbGxl
ciBidWlsdC1pbiBzbw0KPiBvbmx5ICItZHJpdmUiIGFyZ3VtZW50IHNob3VsZCBiZSBuZWVk
ZWQgKG5vICItZGV2aWNlIiBvbmUpLg0KPiANCg0KSSBmb2xsb3dlZCBvZmZpY2lhbCBpbnN0
cnVjdGlvbnMgZnJvbSBKZWFuIFBoaWxpcHBlIHRvIGJ1aWxkIFJNRSBzdGFjaywgDQphbmQg
SSB0aGluayBpdCdzIGJldHRlciB0byBrZWVwIHRoZW0gaW4gc3luYy4NCg0KPj4gKyAgICAg
ICAgc2VsZi52bS5hZGRfYXJncygnLWRldmljZScsICd2aXJ0aW8tOXAtcGNpLGZzZGV2PXNo
cjAsbW91bnRfdGFnPXNocjAnKQ0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWZz
ZGV2JywgZidsb2NhbCxzZWN1cml0eV9tb2RlbD1ub25lLHBhdGg9e3JtZV9zdGFja30saWQ9
c2hyMCcpDQo+IA0KPj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJncygnLWRldmljZScsICd2
aXJ0aW8tbmV0LXBjaSxuZXRkZXY9bmV0MCcpDQo+PiArICAgICAgICBzZWxmLnZtLmFkZF9h
cmdzKCctbmV0ZGV2JywgJ3VzZXIsaWQ9bmV0MCcpDQo+IA0KPiBlMTAwMGUgaXMgYnVpbHQt
aW4gYWxyZWFkeQ0KPiANCg0KVGhpcyBpcyBuZWVkZWQsIGJlY2F1c2Ugd2l0aG91dCB0aGlz
LCB0aGVyZSBpcyBhbiBleHBsaWNpdCB3YWl0IGZvciBhIA0KbmV0d29yayBpbnRlcmZhY2Ug
d2hlbiBib290aW5nLiBBZGRpbmcgdGhpcyBkZXZpY2UgYWxsb3dzIHRvIHNraXAgaXQuDQoN
Cj4gDQo+IEFzIGJvdGggdmlydCBhbmQgc2JzYS1yZWYgdGVzdHMgZG8gIm1vcmUgb3IgbGVz
cyIgdGhlIHNhbWUgc3R1ZmYgdGhlbiBpdA0KPiB3b3VsZCBiZSBnb29kIHRvIG1ha2UgY29t
bW9uIGZpbGUvY2xhc3MgYW5kIHJldXNlIGl0IGJvdGggdGVzdHMgYnkNCj4gYWRkaW5nIGhh
cmR3YXJlIGRpZmZlcmVuY2VzLg0KDQpJIHdhcyB0aGlua2luZyB0aGF0IGF0IHRoZSBiZWdp
bm5pbmcsIGJ1dCBtb3N0IG9mIHRoZSBjb25maWcgaXMgDQpkaWZmZXJlbnQuIFRoZSBvbmx5
IGNvbW1vbiBwYXJ0IGlzIHRoZSBuZXN0ZWQgZ3Vlc3QgdGVzdC4NCg0KSG93ZXZlciwgSSBk
aWRuJ3Qgc2VlIGFueSBvdGhlciB0ZXN0cyB0aGF0IHdlcmUgaW1wb3J0aW5nIGZ1bmN0aW9u
cyBmcm9tIA0Kb3RoZXIgZmlsZXMsIGFuZCBzaW5jZSB3ZSB3YW50IHRvIGtlZXAgdGhvc2Ug
dHdvIHRlc3RzIGluIHNlcGFyYXRlIGZpbGVzIA0KKHRvIGFsbG93IHBhcmFsbGVsaXNtKSwg
dGhlIG1vc3QgcHJhZ21hdGljIHNvbHV0aW9uIHdhcyB0byBkdXBsaWNhdGUuDQpPdmVyYWxs
LCB0ZXN0cyBmaWxlcyBzaG91bGQgYmUgYXMgc2ltcGxlIGFzIHBvc3NpYmxlLCBldmVuIGlm
IHRoZSBwcmljZSANCmlzIHRvIHJlcGVhdCBhIGZldyBsaW5lcy4NCklmIHlvdSBoYXZlIGEg
Y2xlYW5lciBzb2x1dGlvbiwgSSdtIG9wZW4gdG8gaW1wbGVtZW50IGl0Lg0KDQpUaGFua3Ms
DQpQaWVycmljaw0K
