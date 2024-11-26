Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp169444njb;
        Tue, 26 Nov 2024 08:03:23 -0800 (PST)
X-Received: by 2002:a17:90b:3883:b0:2ea:712c:981c with SMTP id 98e67ed59e1d1-2eb0e52d061mr19159668a91.22.1732637002615;
        Tue, 26 Nov 2024 08:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732637002; cv=none;
        d=google.com; s=arc-20240605;
        b=GvYZWeoHNYYPKIn2LwiKKpX4dZfLEEzVQbDvxLhi5l7jMoNg/hJaTQXEocOZfdxAAh
         NsuIx6y1ga0+XjRI8jVTK2rEfisnIZrB79mQoRGx1IFZ9f2noO1c+MplhdBCj+bREb4D
         78YghT2ZFQA6IOLmOYGxI9ktEbfpdyjgkOtItBIZl+nMHXXCkqYnxDnYqrgPyeltK9X+
         pjPoL8u/EhP0vJ69ZflBTJl4ecFyOhES0Y01xXVenWI61z50658K4gamJhhGCv7eqJgE
         6yIiMSdA4Joe52OyCzOZRN03hDzSwmzG/FX4OsptgxGbu2JRn6ixLiWrLhbpuGLcrZig
         ZeCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gnxHQM3+J4u3+zJdYqpLicUp6H+JHaDXdGzu5dXB/pk=;
        fh=OzCCcSemt4cggwfEOuFlHLxcao5YkuImRsb4Ytvep5g=;
        b=SEOh8fxNHX+uEa2ZM8NNV0By8gKIXScbj2jRJqErT7ZeEAth/PVSzO8tpRJiH7Ja8f
         dBhIObir8T7dmducXmZXbGedO/7b1yrt39zKPi2nnBC5abDIg7J5sGVZQVjfUZTFRm30
         47UyNltyQSW6ZSVA7m4nfFsysLzBgReVm1jxCqUxFptAtgdzfkuQ62LYOv9HoLDpjNPi
         me+28IdS1t3sRIGMD9X6XmRGSi0hIFM8FSaCDabJCCMQfPvkpYU9iz6cw4yoDQPv9tI5
         1dWToDalmW01FYvln2drdbKv7+vvy+A5kP6C8HCykDph0pFQpmvvU1TToRzSb2ZvRb/u
         r2Qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUjtfYXz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2ed8ff90d1bsor5610215a91.0.2024.11.26.08.03.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Nov 2024 08:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUjtfYXz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732637002; x=1733241802; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gnxHQM3+J4u3+zJdYqpLicUp6H+JHaDXdGzu5dXB/pk=;
        b=GUjtfYXzBEIoFs9EM27M+WTkoh/iGvngreeQxQdfefS6rp9xh2Bxbp5L8i/4UXHSkR
         BPGpdaKblQhR2qVOCAYCPdJgraZ2oZTp7kGFLP7Ek770iXKnb8dZprJMpDUZdBdFtMxD
         LwKeXwcNhVfQk7M6wY1jnTVmZtVDREmU9CggXkA1B/S1Mh/PpFzTc9wYFPsTyFiaGQPW
         50eRbqjtclF1OVTmpFc2rhleZtuKSVRSEjHb49fNt9HsdFwDN6Ad5+t6IGcf3ewSZTOl
         FIXHlF+kxV5YND/b4TzKMmQ/79bh3H/y5+OeKR4IyCQBw4xdtBRPH7eAPnbPB5/7hxRG
         +y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732637002; x=1733241802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnxHQM3+J4u3+zJdYqpLicUp6H+JHaDXdGzu5dXB/pk=;
        b=UQRe8GlH9YGqPoYEPr9eAgfftyWgaXliMfwDSq3Zuhez03/Vrnb8SWL0Mnj/HaK3Xj
         se6y6YSkGo2MFNC1q4klFEizqrphgxa+bLp9woqJLh+Fn8umUW6RO12LUcLa5o3R3OWk
         X/R2Iwu8rqG/6PF2mMBjYRGKXA9Q8xuWj14CxtTkdVn77eI9JUe5srNLP4ai2Oi25Sxx
         kA0YIrv1WVBuEtI7OtXr95k7p5eJV6diceVlo+oCNBoir9+aDt1t+M2G1bVb/cwdZVx2
         1sE4UX0T7+/C+phcsYwta9ebH0ftIhN+nuvIq/idbVQrpjr5W0xRV7l4I7yFL2uRxoFk
         IKCA==
X-Gm-Message-State: AOJu0YzuTJZqFPfXeRJvTOvAO8bwv6BTpSxRckTou2rh0xXb4/Hb8LT+
	E0O3L3KAwd/HbpI84bJgNtRH9YJzWUBdMfUGny5j027hzbo59IFFzyWyMvndnHFVVB3dH8VYu4Q
	6cjpCIQ==
X-Gm-Gg: ASbGncu78nEa8xg+GNvBe6JmrwfNyf1DiyfM4TTY0FGoskKlutKcM+OYM8D3Kcosxza
	M1AG8UV4CvhMcOXjo/pOZ+JuaN71iBZFf8VZmrbARMmOI07R6/2cfxuD+0mY6HzgJlzgUtrAnLv
	L3xj1xLa3mbFtu+sr7NNVut7csug/m4c6TfczVnjpTzR9TYS06txr7vSak2UvdiLHJ+ELnkMOmf
	YH8sIfWkbjfaBOatBZ6x+SJgQ3pt8gQQM3LX1UI3GUeJoa76hkKKYRo7Lr4FqB/RkUdH1+Zt7Oa
	whwudj5kRGsd6+9gwQ8ovg==
X-Google-Smtp-Source: AGHT+IGKiZyIsHpoHSZUy0WAc2GaFHnZW+m1L2U8O+BZgQ9FcvpaoJH4kFQsA4nFq3Gf47ak1QRLTg==
X-Received: by 2002:a17:90b:4b84:b0:2ea:4578:46de with SMTP id 98e67ed59e1d1-2eb0e52845cmr22231038a91.20.1732637001998;
        Tue, 26 Nov 2024 08:03:21 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb12636f1esm8773857a91.9.2024.11.26.08.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 08:03:21 -0800 (PST)
Message-ID: <c0ecec92-c786-4e49-ad9b-f0b05c4c8220@linaro.org>
Date: Tue, 26 Nov 2024 08:03:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/aarch64_virt: add test for FEAT_RME
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mathieu.poirier@linaro.org,
 gustavo.romero@linaro.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241125065950.1179068-1-pierrick.bouvier@linaro.org>
 <8734jfchxe.fsf@draig.linaro.org>
 <01d49b94-c341-4311-88fe-f7962c117336@linaro.org>
 <87r06yb73k.fsf@draig.linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <87r06yb73k.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 0RXeTZKfnxRu

T24gMTEvMjYvMjQgMDI6NTEsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gUGllcnJpY2sgQm91
dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPiB3cml0ZXM6DQo+IA0KPj4gT24g
MTEvMjUvMjQgMTA6MDAsIEFsZXggQmVubsOpZSB3cm90ZToNCj4+PiBQaWVycmljayBCb3V2
aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+IHdyaXRlczoNCj4+Pg0KPj4+PiBU
aGlzIGJvb3QgYW4gT1AtVEVFIGVudmlyb25tZW50LCBhbmQgbGF1bmNoIGEgbmVzdGVkIGd1
ZXN0IFZNIGluc2lkZSBpdA0KPj4+PiB1c2luZyB0aGUgUmVhbG1zIGZlYXR1cmUuDQo+Pj4+
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZp
ZXJAbGluYXJvLm9yZz4NCj4+Pj4gLS0tDQo+Pj4+ICAgIHRlc3RzL2Z1bmN0aW9uYWwvdGVz
dF9hYXJjaDY0X3ZpcnQucHkgfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+
Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlm
ZiAtLWdpdCBhL3Rlc3RzL2Z1bmN0aW9uYWwvdGVzdF9hYXJjaDY0X3ZpcnQucHkgYi90ZXN0
cy9mdW5jdGlvbmFsL3Rlc3RfYWFyY2g2NF92aXJ0LnB5DQo+Pj4+IGluZGV4IDMwYmFiNWE2
NzdjLi4zZThmOTM3MjEzMiAxMDA3NTUNCj4+Pj4gLS0tIGEvdGVzdHMvZnVuY3Rpb25hbC90
ZXN0X2FhcmNoNjRfdmlydC5weQ0KPj4+PiArKysgYi90ZXN0cy9mdW5jdGlvbmFsL3Rlc3Rf
YWFyY2g2NF92aXJ0LnB5DQo+Pj4+IEBAIC0xOCw2ICsxOCw3IEBADQo+Pj4+ICAgIGZyb20g
cWVtdV90ZXN0IGltcG9ydCBRZW11U3lzdGVtVGVzdCwgQXNzZXQNCj4+Pj4gICAgZnJvbSBx
ZW11X3Rlc3QgaW1wb3J0IGV4ZWNfY29tbWFuZCwgd2FpdF9mb3JfY29uc29sZV9wYXR0ZXJu
DQo+Pj4+ICAgIGZyb20gcWVtdV90ZXN0IGltcG9ydCBnZXRfcWVtdV9pbWcsIHJ1bl9jbWQN
Cj4+Pj4gK2Zyb20gcWVtdV90ZXN0LnV0aWxzIGltcG9ydCBhcmNoaXZlX2V4dHJhY3QNCj4+
Pj4gICAgICAgIGNsYXNzIEFhcmNoNjRWaXJ0TWFjaGluZShRZW11U3lzdGVtVGVzdCk6DQo+
Pj4+IEBAIC0xMjksNiArMTMwLDY3IEBAIGRlZiB0ZXN0X2FhcmNoNjRfdmlydF9naWN2Mihz
ZWxmKToNCj4+Pj4gICAgICAgICAgICByZXR1cm4NCj4+Pj4gICAgICAgICAgICBzZWxmLmNv
bW1vbl9hYXJjaDY0X3ZpcnQoInZpcnQsZ2ljLXZlcnNpb249MiIpDQo+Pj4+ICAgICsgICAg
IyBTdGFjayBpcyBidWlsdCB3aXRoIE9QLVRFRSBidWlsZCBlbnZpcm9ubWVudCBmcm9tIHRo
b3NlDQo+Pj4+IGluc3RydWN0aW9uczoNCj4+Pj4gKyAgICAjIGh0dHBzOi8vbGluYXJvLmF0
bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdlcy8yOTA1MTAyNzQ1OS8NCj4+Pj4g
KyAgICAjIGh0dHBzOi8vZ2l0aHViLmNvbS9wYm8tbGluYXJvL3FlbXUtcm1lLXN0YWNrDQo+
Pj4+ICsgICAgQVNTRVRfUk1FX1NUQUNLID0gQXNzZXQoDQo+Pj4+ICsgICAgICAgICgnaHR0
cHM6Ly9maWxlc2VydmVyLmxpbmFyby5vcmcvcy9KWDdvTmdmRGVHWFN4Y1kvJw0KPj4+PiAr
ICAgICAgICAgJ2Rvd25sb2FkL3JtZS1zdGFjay1vcC10ZWUtNC4yLjAudGFyLmd6JyksDQo+
Pj4+ICsgICAgICAgICAnMWYyNDBmNTVlOGE3YTY2NDg5YzJiN2RiNWQ0MDM5MWU1ZGNmZGQ1
NGM4MjYwMGJkMGQ0YjIxNDViOWEwZmJmYicpDQo+Pj4+ICsNCj4+Pj4gKyAgICAjIFRoaXMg
dGVzdHMgdGhlIEZFQVRfUk1FIGNwdSBpbXBsZW1lbnRhdGlvbiwgYnkgYm9vdGluZyBhIFZN
IHN1cHBvcnRpbmcgaXQsDQo+Pj4+ICsgICAgIyBhbmQgbGF1bmNoaW5nIGEgbmVzdGVkIFZN
IHVzaW5nIGl0Lg0KPj4+PiArICAgIGRlZiB0ZXN0X2FhcmNoNjRfdmlydF9ybWUoc2VsZik6
DQo+Pj4+ICsgICAgICAgIHN0YWNrX3BhdGhfdGFyX2d6ID0gc2VsZi5BU1NFVF9STUVfU1RB
Q0suZmV0Y2goKQ0KPj4+PiArICAgICAgICBhcmNoaXZlX2V4dHJhY3Qoc3RhY2tfcGF0aF90
YXJfZ3osIHNlbGYud29ya2RpcikNCj4+Pj4gKw0KPj4+PiArICAgICAgICBzZWxmLnNldF9t
YWNoaW5lKCd2aXJ0JykNCj4+Pj4gKyAgICAgICAgc2VsZi52bS5zZXRfY29uc29sZSgpDQo+
Pj4+ICsgICAgICAgIHNlbGYucmVxdWlyZV9hY2NlbGVyYXRvcigndGNnJykNCj4+Pj4gKw0K
Pj4+PiArICAgICAgICBybWVfc3RhY2sgPSBvcy5wYXRoLmpvaW4oc2VsZi53b3JrZGlyLCAn
cm1lLXN0YWNrJykNCj4+Pj4gKyAgICAgICAga2VybmVsID0gb3MucGF0aC5qb2luKHJtZV9z
dGFjaywgJ291dCcsICdiaW4nLCAnSW1hZ2UnKQ0KPj4+PiArICAgICAgICBiaW9zID0gb3Mu
cGF0aC5qb2luKHJtZV9zdGFjaywgJ291dCcsICdiaW4nLCAnZmxhc2guYmluJykNCj4+Pj4g
KyAgICAgICAgZHJpdmUgPSBvcy5wYXRoLmpvaW4ocm1lX3N0YWNrLCAnb3V0LWJyJywgJ2lt
YWdlcycsICdyb290ZnMuZXh0NCcpDQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgc2VsZi52bS5h
ZGRfYXJncygnLWFjY2VsJywgJ3RjZycpDQo+Pj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2Fy
Z3MoJy1jcHUnLCAnbWF4LHgtcm1lPW9uJykNCj4+Pj4gKyAgICAgICAgc2VsZi52bS5hZGRf
YXJncygnLW0nLCAnMjA0OCcpDQo+Pj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1N
JywgJ3ZpcnQsYWNwaT1vZmYsJw0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICd2
aXJ0dWFsaXphdGlvbj1vbiwnDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgJ3Nl
Y3VyZT1vbiwnDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgJ2dpYy12ZXJzaW9u
PTMnKQ0KPj4+PiArICAgICAgICBzZWxmLnZtLmFkZF9hcmdzKCctYmlvcycsIGJpb3MpDQo+
Pj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1rZXJuZWwnLCBrZXJuZWwpDQo+Pj4+
ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1kcml2ZScsIGYnZm9ybWF0PXJhdyxpZj1u
b25lLGZpbGU9e2RyaXZlfSxpZD1oZDAnKQ0KPj4+PiArICAgICAgICBzZWxmLnZtLmFkZF9h
cmdzKCctZGV2aWNlJywgJ3ZpcnRpby1ibGstcGNpLGRyaXZlPWhkMCcpDQo+Pj4+ICsgICAg
ICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1kZXZpY2UnLCAndmlydGlvLTlwLWRldmljZSxmc2Rl
dj1zaHIwLG1vdW50X3RhZz1zaHIwJykNCj4+Pj4gKyAgICAgICAgc2VsZi52bS5hZGRfYXJn
cygnLWZzZGV2JywgZidsb2NhbCxzZWN1cml0eV9tb2RlbD1ub25lLHBhdGg9e3JtZV9zdGFj
a30saWQ9c2hyMCcpDQo+Pj4+ICsgICAgICAgIHNlbGYudm0uYWRkX2FyZ3MoJy1kZXZpY2Un
LCAndmlydGlvLW5ldC1wY2ksbmV0ZGV2PW5ldDAnKQ0KPj4+PiArICAgICAgICBzZWxmLnZt
LmFkZF9hcmdzKCctbmV0ZGV2JywgJ3VzZXIsaWQ9bmV0MCcpDQo+Pj4+ICsgICAgICAgIHNl
bGYudm0uYWRkX2FyZ3MoJy1hcHBlbmQnLCAncm9vdD0vZGV2L3ZkYScpDQo+Pj4+ICsNCj4+
Pj4gKyAgICAgICAgc2VsZi52bS5sYXVuY2goKQ0KPj4+PiArICAgICAgICBzZWxmLndhaXRf
Zm9yX2NvbnNvbGVfcGF0dGVybignV2VsY29tZSB0byBCdWlsZHJvb3QnKQ0KPj4+PiArICAg
ICAgICB0aW1lLnNsZWVwKDAuMSkNCj4+Pj4gKyAgICAgICAgZXhlY19jb21tYW5kKHNlbGYs
ICdyb290JykNCj4+Pj4gKyAgICAgICAgdGltZS5zbGVlcCgwLjEpDQo+Pj4+ICsNCj4+Pj4g
KyAgICAgICAgIyBXZSBub3cgYm9vdCB0aGUgKG5lc3RlZCkgZ3Vlc3QgVk0NCj4+Pj4gKyAg
ICAgICAgZXhlY19jb21tYW5kKHNlbGYsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAn
cWVtdS1zeXN0ZW0tYWFyY2g2NCAtTSB2aXJ0LGdpYy12ZXJzaW9uPTMgJw0KPj4+PiArICAg
ICAgICAgICAgICAgICAgICAgJy1jcHUgaG9zdCAtZW5hYmxlLWt2bSAtbSA1MTJNICcNCj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICctTSBjb25maWRlbnRpYWwtZ3Vlc3Qtc3VwcG9y
dD1ybWUwICcNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICctb2JqZWN0IHJtZS1ndWVz
dCxpZD1ybWUwLG1lYXN1cmVtZW50LWFsZ289c2hhNTEyICcNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICctZGV2aWNlIHZpcnRpby1uZXQtcGNpLG5ldGRldj1uZXQwLHJvbWZpbGU9
ICcNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICctbmV0ZGV2IHVzZXIsaWQ9bmV0MCAn
DQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAnLWtlcm5lbCAvbW50L291dC9iaW4vSW1h
Z2UgJw0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgJy1pbml0cmQgL21udC9vdXQtYnIv
aW1hZ2VzL3Jvb3Rmcy5jcGlvICcNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICctc2Vy
aWFsIHN0ZGlvJykNCj4+Pj4gKyAgICAgICAgIyBEZXRlY3QgUmVhbG0gYWN0aXZhdGlvbiBk
dXJpbmcgYm9vdC4NCj4+Pj4gKyAgICAgICAgc2VsZi53YWl0X2Zvcl9jb25zb2xlX3BhdHRl
cm4oJ1NNQ19STUlfUkVBTE1fQUNUSVZBVEUnKQ0KPj4+PiArICAgICAgICAjIFdhaXQgZm9y
IGJvb3QgdG8gY29tcGxldGUuDQo+Pj4+ICsgICAgICAgIHNlbGYud2FpdF9mb3JfY29uc29s
ZV9wYXR0ZXJuKCdXZWxjb21lIHRvIEJ1aWxkcm9vdCcpDQo+Pj4gVGhpcyBpcyB0aGUgc2Ft
ZSBhcyBhYm92ZT8gT3IgdGhlIGNvbnNvbGUgb2YgdGhlIGd1ZXN0Pw0KPj4+DQo+Pg0KPj4g
SXQncyB0aGUgZ3Vlc3QgeWVzLCBhcyB0aGUgY29tbWVudCB0cnkgdG8gZXhwbGFpbi4NCj4+
IEkgY2hvc2UgdG8gaW1wbGVtZW50IGl0IHRoaXMgd2F5LCBpbnN0ZWFkIG9mIGdvaW5nIHdp
dGggYSBzZXBhcmF0ZQ0KPj4gc29ja2V0LCBiZWNhdXNlIGl0IHdvdWxkIG1ha2UgdGhlIHRl
c3QgY29kZSBtdWNoIG1vcmUgY29tcGxpY2F0ZWQgd2l0aA0KPj4gbm8gcmVhbCBiZW5lZml0
Lg0KPiANCj4gQ2FuIHlvdSBpbnRlcmFjdCB3aXRoIHRoYXQgY29uc29sZT8gSSdtIHdvbmRl
cmluZyBpZiB3ZSBjYW4gc3RpbXVsYXRlDQo+IHRoZSByZWFsbSB0byBkbyBzb21ldGhpbmcg
YSBiaXQgbW9yZSB0aGFuIHRvIGdldCB0byB0aGUgbG9naW4gcHJvbXB0Lg0KPg0KDQpZZXMs
IHdlIGNhbiBsb2dpbiBhbmQgcnVuIGFueXRoaW5nLCBvciBldmVuIHBvd2Vyb2ZmIHRoZSBW
TS4gQXQgdGhpcyANCnBvaW50IG9mIHRoZSB0ZXN0LCB0aGUgdGVybWluYWwgKmlzKiB0aGUg
KG5lc3RlZCkgZ3Vlc3QuIFdlIHdvdWxkIG5lZWQgDQp0byBwb3dlcm9mZiBiZWZvcmUgYWNj
ZXNzaW5nIHRoZSBob3N0IGFnYWluLCBvciBzZW5kIGEgY3RybC16Lg0KDQpJIGFza2VkIHRv
IEplYW4tUGhpbGlwcGUgc3VnZ2VzdGlvbnMgdG8gcnVuIGEgc3BlY2lmaWMgY29tbWFuZCB0
byBzdHJlc3MgDQp0aGUgaW1wbGVtZW50YXRpb24gYSBiaXQgbW9yZSB0aGFuIHNpbXBseSBi
b290aW5nLg0KDQo+IEkgYWdyZWUgc2lua2luZyBtdWx0aXBsZSBzZXJpYWwgcG9ydHMgd291
bGQgbWFrZSB0aGUgdGVzdCBtb3JlIGNvbXBsZXgNCj4gYW5kIHdlIHNob3VsZG4ndCBkbyBp
dCBpZiB3ZSBjYW4gcHJvdmUgZXZlcnl0aGluZyB3b3JrcyB2aWEgdGhlIGd1ZXN0cw0KPiBp
bnRlcmFjdGlvbi4NCj4gDQo+Pj4gQ291bGQgd2UgYWxzbyBjaGVjayB0aGUgb3V0cHV0IG9m
IHRoZSBvdGhlciBzZXJpYWwgcG9zdHM/DQo+Pj4NCj4+DQo+PiBIb3N0IGRvZXMgbm90IHBy
aW50IGFueXRoaW5nLg0KPj4gV2UgYWxyZWFkeSBjaGVjayBndWVzdC4NCj4+IE1lc3NhZ2Ug
J1NNQ19STUlfUkVBTE1fQUNUSVZBVEUnIGNvbWVzIGZyb20gdGhlIGZpcm13YXJlLg0KPj4g
U2VjdXJlIHRlcm1pbmFsIGlzIGNvbXBsZXRlbHkgc2lsZW50Lg0KPj4NCj4+IFdlcmUgeW91
IHRoaW5raW5nIHRvIHNvbWV0aGluZyBlbHNlPw0KPj4NCj4+IEZlZWwgZnJlZSB0byB0cnkg
WzFdLCB5b3UgY2FuIGJ1aWxkIGFuZCBsYXVuY2ggdGhlIHZtIGluIHR3byBjb21tYW5kcw0K
Pj4gd2l0aG91dCBoYXZpbmcgdG8gaW5zdGFsbCBhbnl0aGluZyBvbiB5b3VyIG1hY2hpbmUu
DQo+Pg0KPj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9wYm8tbGluYXJvL3FlbXUtcm1lLXN0
YWNrDQo+IA0KPiBOaWNlIDstKQ0KPg0KDQpLdWRvcyB0byBKZWFuLVBoaWxpcHBlIGZvciB0
aGUgY2xlYXIgYW5kIHNpbXBsZSBpbnN0cnVjdGlvbnMgdG8gYnVpbGQgaXQhDQoNCj4+DQo+
Pj4+ICAgICAgaWYgX19uYW1lX18gPT0gJ19fbWFpbl9fJzoNCj4+Pj4gICAgICAgIFFlbXVT
eXN0ZW1UZXN0Lm1haW4oKQ0KPj4+DQo+IA0KDQo=
