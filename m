Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp478790njc;
        Fri, 21 Mar 2025 10:31:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2dd2:b0:2ff:58b8:5c46 with SMTP id 98e67ed59e1d1-3030fe8f293mr6738992a91.8.1742578281060;
        Fri, 21 Mar 2025 10:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742578281; cv=none;
        d=google.com; s=arc-20240605;
        b=bAWjBekS/WrdSgrmb4Pdt7L8V0XlKzsf+qIPEp9rheG+W0VlntB8pZcOeX4m6OsEvU
         vX6MujZ1opm+Yc5VsBk20TQSCVDAvG6l/bw25I6TqTqbBs44qcU/iS/GWEcxX7CXUc8z
         ZGvKGkqgANTwTgNt03N3gW/dLA7MWXvyrYOVjqAd7HVldLPl2gYfiCy2Le/qQQa95GSx
         +pM6XcqgyxexAcl3vDVxQurSkSUDgWcO6g/PqcwBjYBowsckstR3Qi0+80H/yv8W7x3C
         Vs+ciy9ROgh/urXRk1wWiYX5BI9aEdEOmizJstvrSz2URJuRPn14CrPnVahmhfn+t+Jg
         j3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DrFtCIvaLTzjOWuaWQ6uwsyQfRpw9NZV1uzK6X4bCmM=;
        fh=hp/qT+P4twqo5Z3njWYRnDRGe0gIDcrYs6PN6bd2Ym8=;
        b=kNILp5e0gxykcFcabgKTyWZ8VoQC6pm9gRtjTVncPzWRws1V6/b1Yyu4YuxtD4xgOO
         qmMqMMXmPZWrktISsAMpuqcflZGzEs4b0k3DtyhyH5K6nBJw9j7Klh+vAFz/GfIljdd1
         7Q7/DhU21hP/DRODh/imuTMTpWI9nUcjQK5v2zWQ5aZGZuELlYKMKE1Brloe3rViLmeb
         moIt55ZwmDysuSAADbbiYggdEIP/2q9AkFPJY83YUprsrNN6zMA6KtKn0eloQkcO1+zu
         hjo8qsJ8yawY6nINunlNATh0DLT4wawyuGssqucSL8cwdqTvNEcT3VZRHI85twNBXI2q
         EYYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdffrN6q;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f3fab64sor2245563a91.0.2025.03.21.10.31.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Mar 2025 10:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdffrN6q;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742578280; x=1743183080; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DrFtCIvaLTzjOWuaWQ6uwsyQfRpw9NZV1uzK6X4bCmM=;
        b=pdffrN6qzadDZ7jYJuFHTeEVQTZB1egHBDJJ3rHnSGBtzDOjMoiUDXIjfeAds7Vlcc
         K3BiGDEacCDQR81z7A6MZY5PLm4wonHiXdG8+WFqS4RxA+kpffBIebXEUmA8BauZ6Cev
         70SUwurS64PDuuWFN7kGoqe0MauYysE91i0QsGa1bri+NtFtsApSEr9rM7Hj3HGhpPKK
         gKhqUsSNsW1QMnkFHMNqQPeS4BnWmpW8m1bscjfshxuyKWu0ld32D99vJyLPGO+4PXEG
         +iDNx6k2kMT5mQAo9f8wbtnIf3iNYIZJckgNSPCk40/0c/kwd+kCvZRRz6IYMD98IpCg
         pEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742578280; x=1743183080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrFtCIvaLTzjOWuaWQ6uwsyQfRpw9NZV1uzK6X4bCmM=;
        b=PVcyFX3ryHmV/5KB7RQK5BB4a1LxzeTOrML6d9n5eW7PCqcUmhMtf9vX/rw3Jy+PP+
         pRXxKGQ/skSS4nhdylbCnJ2eE6ylZeXbTmYihU+u09fWRMGXBBfUAslZaN3xz6wc3v9p
         o8A9Kal8RGmqGZvUWux97OH/qlxiuu9/H9BXTOvPpHvuMaTmEwyfYHducXqmIPB1sE1H
         SOXahL0UY2YSynmQabhzG9aqPVjp5XOyPepMX+LekSS2ibyfETVSHplRGmMT/a3lwGoQ
         glFKbubGFP+8znSkmhHic9MxDevQwoq/GPPeoGKVsBdBaR2TmIlDdkv31c4j+vBDw+I3
         AfmQ==
X-Gm-Message-State: AOJu0YwBBIqOxx5mSwNIeesyJPNMqUAfTXk9BzsR+awjyT2REEpbXTn/
	W+LIm42tdCv20kH4TnH0l6lxn4RYuGTlIXNY2eLgylFmMR+gXQTOk27M7uEb+8V+a3hZ5DO4tip
	pePI=
X-Gm-Gg: ASbGncv6VL0WfpXvIEKcbRpJsyP5khJh/EOY28lVi0Qc5DTpWAoo1hNrZR1RV+Y42RD
	lpXrOV03GmFiMjZRFq1v4pEgIUax6oKeatZBmJEWM0gFLNqBSqUh8ilBR+yxDoY1Zfp5EZuRLTx
	164R2sOEOZkFYs+IL+FU1i679eYTTk5pr/B/ZL534XkpCgAeVAoUwkvHUpBLZuM26SeMfgMUKjt
	yjRqN2TSVrVaTMD67xmMaAJiCnjzF2FSU0Ku9HY/f/9DvNXbG9luhoLrniclVFJQqN/uvhQvs1r
	JRZUwNfJOY7VIp7w2RVvK7qvCUkkXbDh759A2Spa2fwRJMe12DwA+yWvQ9g=
X-Google-Smtp-Source: AGHT+IGMSU5WqluuG/BPPkgn0Ar0vFGm7RggxiwfwyziOE0QM1xCSHvgb+XffBGa+Xm5vNowiYuvFA==
X-Received: by 2002:a17:90b:2f4d:b0:2ff:6aa6:47a3 with SMTP id 98e67ed59e1d1-3030fef7703mr6748783a91.25.1742578280440;
        Fri, 21 Mar 2025 10:31:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [172.16.224.217] ([209.53.90.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm6968337a91.13.2025.03.21.10.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 10:31:19 -0700 (PDT)
Message-ID: <3e1c7b60-18cf-4ca6-b853-02203954fc3a@linaro.org>
Date: Fri, 21 Mar 2025 10:31:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] gdbstub: conversion to runtime endianess helpers
Content-Language: en-US
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
 <0bc36324-4fb7-41ee-a9f1-3a7de4ad7fa4@linaro.org>
 <87a59eli7m.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87a59eli7m.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Fr3/l5sjrb2d

T24gMy8yMS8yNSAwNDo0NiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4gDQo+PiBPbiAz
LzE5LzI1IDExOjIyLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+Pj4gVGhlIGFpbSBvZiB0aGlz
IHdvcmsgaXMgdG8gZ2V0IHJpZCBvZiB0aGUgZW5kaWFuIGF3YXJlIGhlbHBlcnMgaW4NCj4+
PiBnZGJzdHViL2hlbHBlcnMuaCB3aGljaCBkdWUgdG8gdGhlaXIgdXNlIG9mIHRzd2FwKCkg
bWVhbiB0YXJnZXQNCj4+PiBnZGJzdHVicyBuZWVkIHRvIGJlIGJ1aWx0IG11bHRpcGxlIHRp
bWVzLiBXaGlsZSB0aGlzIHNlcmllcyBkb2Vzbid0DQo+Pj4gYWN0dWFsbHkgYnVpbGQgZWFj
aCBzdHViIG9uY2UgaXQgaW50cm9kdWNlcyBhIG5ldyBoZWxwZXIgLQ0KPj4+IGdkYl9nZXRf
cmVnaXN0ZXJfdmFsdWUoKSB3aGljaCB0YWtlcyBhIE1lbU9wIHdoaWNoIGNhbiBkZXNjcmli
ZSB0aGUNCj4+PiBjdXJyZW50IGVuZGlhbiBzdGF0ZSBvZiB0aGUgc3lzdGVtLiBUaGlzIHdp
bGwgYmUgYSBsb3QgZWFzaWVyIHRvDQo+Pj4gZHluYW1pY2FsbHkgZmVlZCBmcm9tIGEgaGVs
cGVyIGZ1bmN0aW9uLg0KPj4+IFRoZSBtb3N0IGNvbXBsZXggZXhhbXBsZSBpcyBQUEMgd2hp
Y2ggaGFzIGEgaGVscGVyIGNhbGxlZA0KPj4+IHBwY19tYXliZV9ic3dhcF9yZWdpc3Rlcigp
IHdoaWNoIHdhcyBkb2luZyB0aGlzLg0KPj4+IFRoaXMgaXMgc3RpbGwgYW4gUkZDIHNvIEkn
bSBpbnRlcmVzdGVkIGluIGZlZWRiYWNrOg0KPj4+ICAgICAtIGlzIHRoZSBBUEkgc2FuZQ0K
Pj4+ICAgICAtIGNhbiB3ZSBhdm9pZCBsb3RzIG9mICh1aW50OF90ICopIGNhc3Rpbmc/DQo+
Pg0KPj4gRXZlbiB0aG91Z2ggdGhlIHNlcmllcyBoYXMgYSBnb29kIGludGVudCwgdGhlIGZh
Y3Qgd2UgbWFrZSBldmVyeXRoaW5nDQo+PiAiZ2VuZXJpYyIgbWFrZXMgdGhhdCB3ZSBsb3Nl
IGFsbCBndWFyYW50ZWVzIHdlIGNvdWxkIGdldCBieSByZWx5aW5nIG9uDQo+PiBzdGF0aWMg
dHlwaW5nLCBhbmQgdGhhdCB3ZSBoYWQgcG9zc2liaWxpdHkgb2YgbWlzdGFrZXMgd2hlbiBw
YXNzaW5nDQo+PiBzaXplICh3aGljaCBoYXBwZW5lZCBpbiBwYXRjaCA0IGlmIEknbSBjb3Jy
ZWN0KS4gQW5kIGV4cGxpY2l0IGNhc3RpbmcNCj4+IGNvbWVzIGFzIGEgKnN0cm9uZyogd2Fy
bmluZyBhYm91dCB0aGF0Lg0KPj4NCj4+IEJ5IHBhdGNoIDcsIEkgd2FzIHJlYWxseSBmZWVs
aW5nIGl0J3Mgbm90IGEgd2luIHZzIGV4cGxpY2l0IGZ1bmN0aW9ucw0KPj4gcGVyIHNpemUu
DQo+Pg0KPj4gSWYgdGhlIGdvYWwgb2YgdGhlIHNlcmllcyBpcyB0byBnZXQgcmlkIG9mIGVu
ZGlhbiBhd2FyZSBoZWxwZXJzLCB3ZWxsLA0KPj4gdGhpcyBjYW4gYmUgZml4ZWQgaW4gdGhl
IGhlbHBlcnMgdGhlbXNlbHZlcywgd2l0aG91dCBuZWVkaW5nIHRvDQo+PiBpbnRyb2R1Y2Ug
YSAiZ2VuZXJpYyIgc2l6ZSBoZWxwZXIuIE1heWJlIHdlIGFyZSB0cnlpbmcgdG8gc29sdmUg
dHdvDQo+PiBkaWZmZXJlbnQgcHJvYmxlbXMgaGVyZT8NCj4gDQo+IEl0IGRpZCBzZWVtIG5h
dHVyYWwgdGhhdCBpZiB5b3Ugd2VyZSBkZWZpbmluZyBhIE1lbU9wIHlvdSB3b3VsZCB1c2Ug
YWxsDQo+IG9mIGl0IHJhdGhlciB0aGFuIG9ubHkgaXRzIGVuZGlhbiBkZWZpbml0aW9uLiBC
dXQgeW91IGFyZSByaWdodCB3ZSBjb3VsZA0KPiBpbnRyb2R1Y2UgdGhlIHNhbWUgaGVscGVy
cyB3aXRoIGEgYm9vbCBmbGFnIGZvciBlbmRpYW5lc3MuDQo+IA0KDQpEZWZpbmluZyBNZW1P
cCBhbmQgcGFzc2luZyBpcyBvaywgYnV0IGxvb3Npbmcgc3RhdGljIHR5cGluZyBndWFyYW50
ZWVzIA0KaXMgd3JvbmcgaW4gbXkgb3Bpbmlvbi4gQyBpcyBhbHJlYWR5IG9uIHRoZSB3ZWFr
IHNpZGUgcmVnYXJkaW5nIHR5cGluZywgDQp3ZSBkb24ndCBuZWVkIHRvICJ2b2lkKiJpemUg
dGhpbmdzIG1vcmUgaW5zdGVhZCBvZiByZXBsYWNpbmcgdGhlIGNhbGxzIA0Kd2l0aCBjb3Jy
ZWN0IHZhcmlhbnRzLg0KDQo+IE1heWJlIHdlIHNob3VsZCBoYXZlIGZ1bGx5IGZvcm1lZCBt
b3BzIGFuZCBqdXN0IGFzc2VydCBpbiB0aGUgaGVscGVyOg0KPiANCj4gICAgZ2RiX2dldF9y
ZWczMihNZW1PcCBvcCwgR0J5dGVBcnJheSAqYnVmLCB1aW50MzJfdCB2YWwpIHsNCj4gICAg
ICAgIGdfYXNzZXJ0KG9wICYgTU9fU0laRSA9PSBNT18zMik7DQo+ICAgICAgICBnZGJfZ2V0
X3JlZ2lzdGVyX3ZhbHVlKG9wLCBidWYsICZ2YWwpOw0KPiAgICB9DQo+IA0KPiBJIHdhcyBh
bHNvIHRyeWluZyB0byBhdm9pZCBvdmVyIGJvaWxlcnBsYXRpbmcgdGhlIGNvZGUuDQo+DQoN
CkFkZGluZyBwcm9wZXIgZnVuY3Rpb25zIGRlZmluaXRpb24gaW5zdGVhZCBvZiBtYWNyb3Ms
IGFuZCBlbGltaW5hdGluZyANCmlmZGVmcyBpcyBub3QgcmVhbGx5IGJvaWxlcnBsYXRlLg0K
QWRkaW5nIGNhc3RzIHRvIGxvb3NlbiB0eXBlIHN5c3RlbSBpcyBub3QgYSB3aW4gdmVyc3Vz
IHRoYXQuDQoNCj4+DQo+Pj4gICAgIC0gc2hvdWxkIHdlIGhhdmUgYSByZXZlcnNlIGhlbHBl
ciBmb3Igc2V0dGluZyByZWdpc3RlcnMNCj4+PiBJZiB0aGlzIHNlZW1zIGxpa2UgdGhlIHJp
Z2h0IGFwcHJvYWNoIEkgY2FuIGhhdmUgYSBnbyBhdCBtb3JlIG9mIHRoZQ0KPj4+IGZyb250
ZW5kcyBsYXRlci4NCj4+PiBUaGVyZSBhcmUgYSBmZXcgb3RoZXIgbWlzYyBjbGVhbi11cHMg
SSBkaWQgb24gdGhlIHdheSB3aGljaCBtaWdodCBiZQ0KPj4+IHdvcnRoIGNoZXJyeSBwaWNr
aW5nIGZvciAxMC4wIGJ1dCBJJ2xsIGxlYXZlIHRoYXQgdXAgdG8gbWFpbnRhaW5lcnMuDQo+
Pj4gQWxleC4NCj4+PiBBbGV4IEJlbm7DqWUgKDEwKToNCj4+PiAgICAgaW5jbHVkZS9nZGJz
dHViOiBmaXggaW5jbHVkZSBndWFyZCBpbiBjb21tYW5kcy5oDQo+Pj4gICAgIGdkYnN0dWI6
IGludHJvZHVjZSB0YXJnZXQgaW5kZXBlbmRlbnQgZ2RiIHJlZ2lzdGVyIGhlbHBlcg0KPj4+
ICAgICB0YXJnZXQvYXJtOiBjb252ZXJ0IDMyIGJpdCBnZGJzdHViIHRvIG5ldyBoZWxwZXIN
Cj4+PiAgICAgdGFyZ2V0L2FybTogY29udmVydCA2NCBiaXQgZ2Ric3R1YiB0byBuZXcgaGVs
cGVyDQo+Pj4gICAgIHRhcmdldC9wcGM6IGV4cGFuZCBjb21tZW50IG9uIEZQL1ZNWC9WU1gg
YWNjZXNzIGZ1bmN0aW9ucw0KPj4+ICAgICB0YXJnZXQvcHBjOiBtYWtlIHBwY19tYXliZV9i
c3dhcF9yZWdpc3RlciBzdGF0aWMNCj4+PiAgICAgdGFyZ2V0L3BwYzogY29udmVydCBnZGJz
dHViIHRvIG5ldyBoZWxwZXIgKCFoYWNreSkNCj4+PiAgICAgZ2Ric3R1YjogYXNzZXJ0IGVh
cmxpZXIgaW4gaGFuZGxlX3JlYWRfYWxsX3JlZ3MNCj4+PiAgICAgaW5jbHVkZS9leGVjOiBm
aXggYXNzZXJ0IGluIHNpemVfbWVtb3ANCj4+PiAgICAgdGFyZ2V0L21pY3JvYmxhemU6IGNv
bnZlcnQgZ2Ric3R1YiB0byBuZXcgaGVscGVyDQo+Pj4gICAgaW5jbHVkZS9leGVjL21lbW9w
LmggICAgICAgIHwgICA0ICstDQo+Pj4gICAgaW5jbHVkZS9nZGJzdHViL2NvbW1hbmRzLmgg
IHwgICAyICstDQo+Pj4gICAgaW5jbHVkZS9nZGJzdHViL3JlZ2lzdGVycy5oIHwgIDMwICsr
KysrKw0KPj4+ICAgIHRhcmdldC9wcGMvY3B1LmggICAgICAgICAgICB8ICAgOCArLQ0KPj4+
ICAgIGdkYnN0dWIvZ2Ric3R1Yi5jICAgICAgICAgICB8ICAyNCArKysrLQ0KPj4+ICAgIHRh
cmdldC9hcm0vZ2Ric3R1Yi5jICAgICAgICB8ICA1NyArKysrKysrLS0tLQ0KPj4+ICAgIHRh
cmdldC9hcm0vZ2Ric3R1YjY0LmMgICAgICB8ICA1MyArKysrKystLS0tDQo+Pj4gICAgdGFy
Z2V0L21pY3JvYmxhemUvZ2Ric3R1Yi5jIHwgIDQ0ICsrKystLS0tDQo+Pj4gICAgdGFyZ2V0
L3BwYy9nZGJzdHViLmMgICAgICAgIHwgMTk0ICsrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQ0KPj4+ICAgIDkgZmlsZXMgY2hhbmdlZCwgMjU3IGluc2VydGlvbnMoKyks
IDE1OSBkZWxldGlvbnMoLSkNCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9n
ZGJzdHViL3JlZ2lzdGVycy5oDQo+Pj4NCj4gDQoNCg==
