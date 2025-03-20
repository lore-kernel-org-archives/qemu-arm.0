Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1192993njc;
        Thu, 20 Mar 2025 12:37:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:130f:b0:736:a8db:93b4 with SMTP id d2e1a72fcca58-739059566fbmr1097374b3a.2.1742499433818;
        Thu, 20 Mar 2025 12:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742499433; cv=none;
        d=google.com; s=arc-20240605;
        b=KGMIu3sPhena+rQnrl/81ik5NHfSxvyerivpLwrYQu/yc/Tehgdhd8yt4VmkvHrdxX
         Qi6+TITHW81OL/mJUE0hKJDYyT7m2vAYV8JvEnXnx3uNasX22wXGV5eMc9XJYZZiN5CC
         TfRs6fG+Q4RdQFc9Xyz/CnVFMxyemm2PlGXnuyQfk3oMwhn7bIYj2lW8q3QCUxCG9EIJ
         t9v39XgKPf3WySd6kjFnG6hxzBk48yMozISbx0oALGRqRZUe+OOn5x5CaE74l35HFaZ5
         YK3EyK4E/tD3gmvUvzZLS2cQAsom4j3HRFN5DsW1Ghk72jVmIXXXJz/0N3mfqQHMx/fy
         1yTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pxoi1cxH7cqoTKJk/DMMUrTd9x5TTW/12K/9Wy5+Zig=;
        fh=EhMBeZB0kaVgKHqiTKwkIbzSpyIX4IfWsATf26EX9uw=;
        b=McmjQ7012p1XqzSjXZVav6uZAEaCSGwHD8lUYVvL+dZhZatWxdD3gUiCsyubopb9wi
         66qnmJKPWBoO27PmArNwjsrdl7EJN/RYfHkX0mlb3V0up9U827LPNjHWek8IiHStqg5c
         ocDYw44Yx8Ox299NGP4LQnI1RV7S9EuFrZeCt8jwlULbsmiGXjWzdFhRbZ0PwKml3cK/
         Yl/rGx1Pigi2asOBB7mKzoEzbMMKeHHidX8dP+xEXLyVkKXt5LSqtD9W09UqApeQE/dZ
         6ZHbZ14K7Vl/i7I/ofQb+/m5UTJTBtRGsbje9P2DsfmSPjVt+A/ICc6l44cC90Jk2ZMI
         DNKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kglqNBvC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73905f9257csor275973b3a.1.2025.03.20.12.37.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 12:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kglqNBvC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742499433; x=1743104233; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pxoi1cxH7cqoTKJk/DMMUrTd9x5TTW/12K/9Wy5+Zig=;
        b=kglqNBvC+Nna+jYrg/AKiXmoRA96fgHVnuqv2lr3xZW/oDwV6JqqnF1ztUDymfyBPr
         YHkRPsaKvSUK90FRw3ibOQmGWGjuFHj1O59gYXoKIUdhEI4urL+o1SA0QDvfvCMDHyFi
         I6BI4psQ6ZBDJhGwkURcPpi7xzx77MoK7xgBO1LRdI6rFI4H+W/kNbA0nv/BqxozR+Di
         v/bLLsgMehAfQ7VrPGB1CCmwt5u6c+MJ+NdhW/XBjUjxx+EJwiYxpEUq6RMjDpCKkb+f
         vZv4GhMNazdAWgickP0Y3A4OCKPF0jGe5k0WNa+53VfYRmY2iiYibx9VGum5aCyjMC1c
         2TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742499433; x=1743104233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxoi1cxH7cqoTKJk/DMMUrTd9x5TTW/12K/9Wy5+Zig=;
        b=d9E/hJppoyRoBenIPDXmUkoS3+i5/SJrVpPCyt+epdTi3kPDkf7z/GGM4qK0f/V59C
         QyYgSv/6y6XFBr+r3Tq25x5lFpnlH8Zr/rgHeKpxrTkvHXkDyLLBqQF9AH3Nlu7LKsCk
         hC0viWiZZIckbYyULpq/JSjlF0unyrp4ZZrASQfSl2LOdtDxMzNZ54jHmCX9dix5rHY7
         0XqJvkVPbkRJa1Bx+9ffDxzvjEpW1aKJedME4gsihlwhgyAMfJI8mLStG5CTFebqPD7J
         bQ/Y0m5klxiWNO6NWY27FGC1GboKa5wJgQb4rnkUv8iT8wvjnvLk4RsLqO8FShg8Vw5F
         5rBw==
X-Gm-Message-State: AOJu0Ywjo6akdz6TVkxfgmmmEpZ7E1xOeTcmQw+fl86DE6zoDuc34JTl
	s7pI5NSGHa9k4jBfpzeZ8Fv7NsfnqvEKse0Wsx5U3lFnQAA1YDudtpTurgQbShrfu9xpQI/vV7R
	7HP8=
X-Gm-Gg: ASbGncux7qt8MQgib9SOkTI3TsjVnsYfhVh3cJdzB6mHLjr9rMN5uQ7ERrd58HoobG/
	S8MAYd1gU7J2TsjXAQDKIqjqCrkuH2FS+ulGCUi/wYVN1crAoWeuYG4XUxSklaDv8slZSdyX2RY
	4ulliZrTqEuGH/D9HkBvrv0QSpnr2J/reF9xZi0iAoI4Pfv+hKOupStOgt/ut/fRwvoB8U0MyXO
	84YT0qqWpK5jN8MM8cjYJ5OE8mIV5DZdy8N+9l3FoHy3P3R96s3OhDeKJbT5Q8fuDd7mp/Sjekt
	X29Z3jWt7+r23MydsvoSRC0IIAqvEDMgQB8ZQc2iSLoDgpvQxIgWaFaE/aKhUaGZm2rd
X-Google-Smtp-Source: AGHT+IH1lpebtKCd0+yKJ8dIHs0gB7TfcagCkHawaZJtflaRzg+5Y61b5gt9mjCE3n2LzHet+2omcA==
X-Received: by 2002:a05:6a21:496:b0:1f5:6c94:2cc9 with SMTP id adf61e73a8af0-1fe42f9c5c7mr1092824637.22.1742499433346;
        Thu, 20 Mar 2025 12:37:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a652a2sm273421a12.76.2025.03.20.12.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 12:37:12 -0700 (PDT)
Message-ID: <1b26f846-0e0a-425b-96c8-bf2a8b489421@linaro.org>
Date: Thu, 20 Mar 2025 12:37:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] gdbstub: introduce target independent gdb register
 helper
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
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
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250319182255.3096731-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 2a81Ktv0v2SP

T24gMy8xOS8yNSAxMToyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBUaGUgY3VycmVudCBo
ZWxwZXIuaCBmdW5jdGlvbnMgcmVseSBvbiBoYXJkIGNvZGVkIGFzc3VtcHRpb25zIGFib3V0
DQo+IHRhcmdldCBlbmRpYW5lc3MgdG8gdXNlIHRoZSB0c3dhcCBtYWNyb3MuIFdlIGFsc28g
ZW5kIHVwIGRvdWJsZQ0KPiBzd2FwcGluZyBhIGJ1bmNoIG9mIHZhbHVlcyBpZiB0aGUgdGFy
Z2V0IGNhbiBydW4gaW4gbXVsdGlwbGUgZW5kaWFuZXNzDQo+IG1vZGVzLiBBdm9pZCB0aGlz
IGJ5IGdldHRpbmcgdGhlIHRhcmdldCB0byBwYXNzIHRoZSBlbmRpYW5lc3MgYW5kIHNpemUN
Cj4gdmlhIGEgTWVtT3AgYW5kIGZpeGluZyB1cCBhcHByb3ByaWF0ZWx5Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiAt
LS0NCj4gICBpbmNsdWRlL2dkYnN0dWIvcmVnaXN0ZXJzLmggfCAzMCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCj4gICBnZGJzdHViL2dkYnN0dWIuYyAgICAgICAgICAgfCAy
MiArKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNl
cnRpb25zKCspDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZ2Ric3R1Yi9yZWdp
c3RlcnMuaA0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMu
aCBiL2luY2x1ZGUvZ2Ric3R1Yi9yZWdpc3RlcnMuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwLi40YWJjN2E2YWU3DQo+IC0tLSAvZGV2L251bGwNCj4g
KysrIGIvaW5jbHVkZS9nZGJzdHViL3JlZ2lzdGVycy5oDQo+IEBAIC0wLDAgKzEsMzAgQEAN
Cj4gKy8qDQo+ICsgKiBHREIgQ29tbW9uIFJlZ2lzdGVyIEhlbHBlcnMNCj4gKyAqDQo+ICsg
KiBDb3B5cmlnaHQgKGMpIDIwMjUgTGluYXJvIEx0ZA0KPiArICoNCj4gKyAqIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyDQo+ICsgKi8NCj4gKw0KPiArI2lm
bmRlZiBHREJfUkVHSVNURVJTX0gNCj4gKyNkZWZpbmUgR0RCX1JFR0lTVEVSU19IDQo+ICsN
Cj4gKyNpbmNsdWRlICJleGVjL21lbW9wLmgiDQo+ICsNCj4gKy8qKg0KPiArICogZ2RiX2dl
dF9yZWdpc3Rlcl92YWx1ZSgpIC0gZ2V0IHJlZ2lzdGVyIHZhbHVlIGZvciBnZGINCj4gKyAq
IG1vOiBzaXplIGFuZCBlbmRpYW4gTWVtT3ANCj4gKyAqIGJ1ZjogR0J5dGVBcnJheSB0byBz
dG9yZSBpbiB0YXJnZXQgb3JkZXINCj4gKyAqIHZhbDogcG9pbnRlciB0byB2YWx1ZSBpbiBo
b3N0IG9yZGVyDQo+ICsgKg0KPiArICogVGhpcyByZXBsYWNlcyB0aGUgcHJldmlvdXMgbGVn
YWN5IHJlYWQgZnVuY3Rpb25zIHdpdGggYSBzaW5nbGUNCj4gKyAqIGZ1bmN0aW9uIHRvIGhh
bmRsZSBhbGwgc2l6ZXMuIFBhc3NpbmcgQG1vIGFsbG93cyB0aGUgdGFyZ2V0IG1vZGUgdG8N
Cj4gKyAqIGJlIHRha2VuIGludG8gYWNjb3VudCBhbmQgYXZvaWRzIHVzaW5nIGhhcmQgY29k
ZWQgdHN3YXAoKSBtYWNyb3MuDQo+ICsgKg0KPiArICogUmV0dXJucyB0aGUgbnVtYmVyIG9m
IGJ5dGVzIHdyaXR0ZW4gdG8gdGhlIGFycmF5Lg0KPiArICovDQo+ICtpbnQgZ2RiX2dldF9y
ZWdpc3Rlcl92YWx1ZShNZW1PcCBvcCwgR0J5dGVBcnJheSAqYnVmLCB1aW50OF90ICp2YWwp
Ow0KPiArDQo+ICsjZW5kaWYgLyogR0RCX1JFR0lTVEVSU19IICovDQo+ICsNCj4gKw0KPiBk
aWZmIC0tZ2l0IGEvZ2Ric3R1Yi9nZGJzdHViLmMgYi9nZGJzdHViL2dkYnN0dWIuYw0KPiBp
bmRleCAyODJlMTNlMTYzLi4zZDdiMTAyOGU0IDEwMDY0NA0KPiAtLS0gYS9nZGJzdHViL2dk
YnN0dWIuYw0KPiArKysgYi9nZGJzdHViL2dkYnN0dWIuYw0KPiBAQCAtMzIsNiArMzIsNyBA
QA0KPiAgICNpbmNsdWRlICJleGVjL2dkYnN0dWIuaCINCj4gICAjaW5jbHVkZSAiZ2Ric3R1
Yi9jb21tYW5kcy5oIg0KPiAgICNpbmNsdWRlICJnZGJzdHViL3N5c2NhbGxzLmgiDQo+ICsj
aW5jbHVkZSAiZ2Ric3R1Yi9yZWdpc3RlcnMuaCINCj4gICAjaWZkZWYgQ09ORklHX1VTRVJf
T05MWQ0KPiAgICNpbmNsdWRlICJhY2NlbC90Y2cvdmNwdS1zdGF0ZS5oIg0KPiAgICNpbmNs
dWRlICJnZGJzdHViL3VzZXIuaCINCj4gQEAgLTQ1LDYgKzQ2LDcgQEANCj4gICAjaW5jbHVk
ZSAic3lzdGVtL3J1bnN0YXRlLmgiDQo+ICAgI2luY2x1ZGUgImV4ZWMvcmVwbGF5LWNvcmUu
aCINCj4gICAjaW5jbHVkZSAiZXhlYy9od2FkZHIuaCINCj4gKyNpbmNsdWRlICJleGVjL21l
bW9wLmgiDQo+ICAgDQo+ICAgI2luY2x1ZGUgImludGVybmFscy5oIg0KPiAgIA0KPiBAQCAt
NTUxLDYgKzU1MywyNiBAQCBzdGF0aWMgaW50IGdkYl93cml0ZV9yZWdpc3RlcihDUFVTdGF0
ZSAqY3B1LCB1aW50OF90ICptZW1fYnVmLCBpbnQgcmVnKQ0KPiAgICAgICByZXR1cm4gMDsN
Cj4gICB9DQo+ICAgDQo+ICsvKg0KPiArICogVGFyZ2V0IGhlbHBlciBmdW5jdGlvbiB0byBy
ZWFkIHZhbHVlIGludG8gR0J5dGVBcnJheSwgdGFyZ2V0DQo+ICsgKiBzdXBwbGllcyB0aGUg
c2l6ZSBhbmQgdGFyZ2V0IGVuZGlhbmVzcyB2aWEgdGhlIE1lbU9wLg0KPiArICovDQo+ICtp
bnQgZ2RiX2dldF9yZWdpc3Rlcl92YWx1ZShNZW1PcCBvcCwgR0J5dGVBcnJheSAqYnVmLCB1
aW50OF90ICp2YWwpDQo+ICt7DQo+ICsgICAgc2l6ZV90IGJ5dGVzID0gbWVtb3Bfc2l6ZShv
cCk7DQo+ICsNCj4gKyAgICBpZiAob3AgJiBNT19CU1dBUCkgew0KPiArICAgICAgICBmb3Ig
KCBpbnQgaSA9IGJ5dGVzIDsgaSA+IDA7IGktLSkgew0KPiArICAgICAgICAgICAgZ19ieXRl
X2FycmF5X2FwcGVuZChidWYsICZ2YWxbaSAtIDFdLCAxKTsNCj4gKyAgICAgICAgfTsNCj4g
KyAgICB9IGVsc2Ugew0KPiArICAgICAgICBnX2J5dGVfYXJyYXlfYXBwZW5kKGJ1ZiwgdmFs
LCBieXRlcyk7DQo+ICsgICAgfQ0KPiArDQo+ICsgICAgcmV0dXJuIGJ5dGVzOw0KPiArfQ0K
PiArDQo+ICsNCj4gICBzdGF0aWMgdm9pZCBnZGJfcmVnaXN0ZXJfZmVhdHVyZShDUFVTdGF0
ZSAqY3B1LCBpbnQgYmFzZV9yZWcsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZ2RiX2dldF9yZWdfY2IgZ2V0X3JlZywgZ2RiX3NldF9yZWdfY2Igc2V0X3JlZywN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBHREJGZWF0dXJl
ICpmZWF0dXJlKQ0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2su
Ym91dmllckBsaW5hcm8ub3JnPg0KDQo=
