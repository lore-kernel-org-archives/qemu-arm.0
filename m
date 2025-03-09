Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp736828njc;
        Sun, 9 Mar 2025 11:55:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURHH3gYAvjdtzkxN0rM+rh964/mUQakwHeydm0IZbGxm7WmueXSIOysMhfUALih2h5rSdscVaq+LLidw==@linaro.org
X-Received: by 2002:a05:6a20:d487:b0:1f5:78eb:eaa6 with SMTP id adf61e73a8af0-1f578ebedbdmr2728462637.31.1741546545917;
        Sun, 09 Mar 2025 11:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741546545; cv=none;
        d=google.com; s=arc-20240605;
        b=VyLojiaM4rXagGciV6Fy90lKEQVmkS9+j9qvl4yekx116HXjzDEbdqUtHDVMMzF6sp
         FXqROWWmCCKKH/WajWetEMA5DgAfk0BL6T8bkYgkABISYDdP337MPFkDzlI0kWewnC8l
         7rI/Uce5tMYcfdew73upK8QIg8sVS3FxjXnzaVAu4fETS79RvoxQwshgcEhdZHbyFinl
         iNaGnh809qkAiLqFR9yreBvo7zVUqujYMHqjGF+IF5Pub3JC/YHW5Ue2P15h5Oijb+BR
         jDHUvNszfCrD3JloCa/Qp7g2o6EQfmYCI44cE14gJ/lSFAX0CVslpmjZm9LyiaJj4IrJ
         bHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4gU4h4sxcrlsUKGAX1YrS3hwxdA8CQEkt2CJElxmWaE=;
        fh=w78nNxqDBJAEd1JWrfoCRpUS8poZiI+zYOY531YIM44=;
        b=ZK28fxwWYYoKmLpm8scnzV8F+/zyYr4Bq/P+6eCPrn8i4wGNWN8Eqx5UUz2QopS5wA
         IlwWlCkptp9Uxx05jYDByN4r45sG6h7mKJv3o9dk24/0Ki+IUWA94oB4ivWuohX9rZap
         HlUeylECQwK7bt+EODriZNM4SHZJqzLf+aPMOnBDxRsLbQELQpZtCrlSd2uGq241TFc0
         XHSqmkHLHrGPcx0fubqijkRgRGhvkcn5wgbpBS6ZPpnmSgb1mRtrCRutsNwaYY6znwvy
         KQSIc9G/tTVGc46iPWa/iuk4UGLSQ5RyyOuF1L8ANTCSQ/bRTSRobsxlPGQEpnmKKeGu
         9y/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckr3VpCL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af537a2cbd2sor144306a12.8.2025.03.09.11.55.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 09 Mar 2025 11:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ckr3VpCL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546545; x=1742151345; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gU4h4sxcrlsUKGAX1YrS3hwxdA8CQEkt2CJElxmWaE=;
        b=ckr3VpCLbQQ0MFnzJLYBP0edsk85VsVt3YT79qhaWf/nOjwWEQGX8T6nHuyaKYV29d
         rDS7yc68xRTI7cFmfSOhGfPv1S4Sq9pgr+2BSpfGZDKIVZqw9so8BYmdL3ylARdIEYXV
         +xCpdtmb+AkUZKj8BXEPNJ5GUVZavMMnvgn3H7EZfBecaIpqFyZOdQ57AYa9E8fAkBbe
         rBCfM7l0YJZulhVxE84hFQ3Czr2IKmGAOZEPTSGYd5BZcfyR3SU7zJLn7hIBgPcM+dOM
         5NUQ0RJEQWBA8E7C4oyAhlZBWmuaqJoPAsqfwyla7elXyzU+sqldaGMSoZK8b4854DBP
         TYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546545; x=1742151345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gU4h4sxcrlsUKGAX1YrS3hwxdA8CQEkt2CJElxmWaE=;
        b=R8BKkzRjXoTziqR//oOYfhdTueLmr6sPxyyJfPIFqDZ0ADpcYQNRlvimVgNSt9KYKJ
         cFf5H+C+Sdp2FcE5a1Kmk0VjW/N3lPJcGKhq9Xs69QMUY4Z0b+BjpXugjkuKF3VDOkK7
         RsMHbn7SqZD6MBSfThPK58LIIMvuBTxuoGnYS9mxNi9M4MYr3S+gJ1pSe7qA3L/o2crY
         PVuISVeOPvkq1dLg+y1HdBNNP35X1Hpe8uhH/MX3rdnqSj4BSNDPpUyhLxBVScVCz9b5
         uha/iTWhqJfj3IUJ5xhNlQDA16hkpFWMyHQVdoIcTjKHfg7nwA4rzEgrimmbaBIw7qaC
         7aGg==
X-Forwarded-Encrypted: i=1; AJvYcCXysSr7sqCxWf+a0waO0yiooQUL5uFU49MLJXp9+Lq0MqTXyUtO+wRyXWqOA+n0zBumeNm0YEyYlOSjCg==@linaro.org
X-Gm-Message-State: AOJu0YyangHnpSFIFgYmuWziPv/SmAM8+yqJjMXtE88MJ4SjJDbMY152
	l5M76Uy90e6wvDcx8Xng0cB3YHvqnrgJSslpu4/9s8H+K3kzf2M5AFaGjZNwzVORqQ==
X-Gm-Gg: ASbGncuHciQYUEHNNhLadKn03Ca/brqRL5UZqUawW/8SJGq3G3xUagugqkbLFX/v4Hl
	430aFNW4Ek5yUetULx+vbop4xFHyS9LEsD9vihZ7VuAb+prqePKheT1dkUtFZXeiJlP223uuIbk
	GrFiBglSBiwB48VUgetmUsTAB51wLWqyD76Im6LaijWnHk4N5hoCOuCRt34FxAgRObHm84ap9n1
	nfoPkvbUy5j/xaz8/i8/YCYkpjkaKaia+ZK/Mn7+G5/1VSd3TlkDNy59F7doXq4mjXdP3xL0juY
	V76GRS+7L7olRTLIkmCgHy2otnof/2o1jfpK4cHQsKiUPVXWXRZzoYA11Q==
X-Google-Smtp-Source: AGHT+IFuL76FqajmwOwPA/lhZq1uLDKviZaMHpKL2JQchDhkvmUXqbkX8QrlCr25XZ1XI1w/UYn5IQ==
X-Received: by 2002:a05:6300:6713:b0:1f3:29a9:6197 with SMTP id adf61e73a8af0-1f544aef521mr19743222637.18.1741546545470;
        Sun, 09 Mar 2025 11:55:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af2812887b3sm5259148a12.71.2025.03.09.11.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 11:55:45 -0700 (PDT)
Message-ID: <fda186da-2e31-42d6-8dd6-0ea3141a73e6@linaro.org>
Date: Sun, 9 Mar 2025 11:55:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-s390x@nongnu.org, devel@lists.libvirt.org,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
 <Zl20rAjHLJlZkwxE@redhat.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <Zl20rAjHLJlZkwxE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: FsbSsJoIW48O

T24gNi8zLzI0IDA1OjE4LCBEYW5pZWwgUC4gQmVycmFuZ8OpIHdyb3RlOg0KPiBPbiBGcmks
IE1heSAzMSwgMjAyNCBhdCAwNjo0Nzo0NUFNICswMjAwLCBUaG9tYXMgSHV0aCB3cm90ZToN
Cj4+IE9uIDMwLzA1LzIwMjQgMDkuNDUsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3Rl
Og0KPj4+IFdlIGFyZSB0cnlpbmcgdG8gdW5pZnkgYWxsIHFlbXUtc3lzdGVtLUZPTyB0byBh
IHNpbmdsZSBiaW5hcnkuDQo+Pj4gSW4gb3JkZXIgdG8gZG8gdGhhdCB3ZSBuZWVkIHRvIHJl
bW92ZSBRQVBJIHRhcmdldCBzcGVjaWZpYyBjb2RlLg0KPj4+DQo+Pj4gQGR1bXAtc2tleXMg
aXMgb25seSBhdmFpbGFibGUgb24gcWVtdS1zeXN0ZW0tczM5MHguIFRoaXMgc2VyaWVzDQo+
Pj4gcmVuYW1lIGl0IGFzIEBkdW1wLXMzOTAtc2tleSwgbWFraW5nIGl0IGF2YWlsYWJsZSBv
biBvdGhlcg0KPj4+IGJpbmFyaWVzLiBXZSB0YWtlIGNhcmUgb2YgYmFja3dhcmQgY29tcGF0
aWJpbGl0eSB2aWEgZGVwcmVjYXRpb24uDQo+Pj4NCj4+PiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSAoNCk6DQo+Pj4gICAgIGh3L3MzOTB4OiBJbnRyb2R1Y2UgdGhlIEBkdW1wLXMzOTAt
c2tleXMgUU1QIGNvbW1hbmQNCj4+PiAgICAgaHcvczM5MHg6IEludHJvZHVjZSB0aGUgJ2R1
bXBfczM5MF9za2V5cycgSE1QIGNvbW1hbmQNCj4+PiAgICAgaHcvczM5MHg6IERlcHJlY2F0
ZSB0aGUgSE1QICdkdW1wX3NrZXlzJyBjb21tYW5kDQo+Pj4gICAgIGh3L3MzOTB4OiBEZXBy
ZWNhdGUgdGhlIFFNUCBAZHVtcC1za2V5cyBjb21tYW5kDQo+Pg0KPj4gV2h5IGRvIHdlIGhh
dmUgdG8gcmVuYW1lIHRoZSBjb21tYW5kPyBKdXN0IGZvciB0aGUgc2FrZSBvZiBpdD8gSSB0
aGluaw0KPj4gcmVuYW1pbmcgSE1QIGNvbW1hbmRzIGlzIG1heWJlIG9rLCBidXQgYnJlYWtp
bmcgdGhlIEFQSSBpbiBRTVAgaXMgc29tZXRoaW5nDQo+PiB5b3Ugc2hvdWxkIGNvbnNpZGVy
IHR3aWNlLg0KPiANCj4gVGhhdCB3YXMgZ29pbmcgdG8gYmUgbXkgcXVlc3Rpb24gdG9vLiBT
ZWVtcyBsaWtlIGl0cyBwb3NzaWJsZSB0byBzaW1wbHkNCj4gc3R1YiBvdXQgdGhlIGV4aXN0
aW5nIGNvbW1hbmQgZm9yIG90aGVyIHRhcmdldHMuDQo+IA0KPiBUaGUgcmVuYW1pbmcgaXMg
anVzdCB3aW5kb3cgZHJlc3NpbmcuDQo+IA0KDQpXb3JraW5nIG9uIHNpbmdsZS1iaW5hcnkg
dG9waWMgbWVhbnMgc3BlY2lmaWNpdGllcyBmcm9tIGV2ZXJ5IHFlbXUgDQpiaW5hcnkvYXJj
aGl0ZWN0dXJlIGhhcyB0byBiZSBtZXJnZWQgdG9nZXRoZXIuIERlc3BpdGUgYXBwZWFyaW5n
IGhhcyBhIA0KYmFkIHRoaW5nIG5vdywgaXQncyBkZWZpbml0ZWx5IGEgc3RlcCBmb3J3YXJk
IGZvciBRRU1VLCBhbmQgd2lsbCBhbGxvdyANCnRvIGVuYWJsZSBuZXcgdXNhZ2VzLg0KDQpU
aGUgaGFyZCB3YXkgaXMgdG8gdHJpZ2dlciBhIGRlZXAgcmVmYWN0b3JpbmcsIGludm9sdmlu
ZyBsZW5ndGh5IA0KY29udmVyc2F0aW9ucyB3aGVyZSBjb21wcm9taXNlcyBoYXZlIHRvIGJl
IGZvdW5kICgibGV0J3MgaW1wbGVtZW50IHRoaXMgDQpmb3IgYWxsIGFyY2giKS4gVGhlIHBy
YWdtYXRpYyB3YXkgaXMgdG8gZWxpbWluYXRlIG9idmlvdXMgc3R1ZmYuDQoNClRoaXMgY29t
bWFuZCBpcyBzcGVjaWZpYyB0byBhbiBhcmNoLCBzbyByZW5hbWluZyBpcyBhIGdvb2QgYW5k
IG9idmlvdXMgDQpzdHJhdGVneS4gRm9yIHRoZSBiYWNrd2FyZCBjb21wYXRpYmxlIGFueGlv
dXMgZGV2ZWxvcGVyLCBhbm90aGVyIA0Kc3RyYXRlZ3kgd291bGQgYmUgdG8gc2ltcGx5IGRl
Y2xhcmUgdGhpcyBjb21tYW5kIGlmIHRoZSBydW5uaW5nIHRhcmdldCANCmlzIHMzOTB4LiBC
dXQgdGhlbiwgeW91IGNyZWF0ZSBhIHByZWNlZGVudCB0byBkbyBzb21ldGhpbmcgdGhhdCBz
aG91bGQgDQpub3QgaGF2ZSBleGlzdGVkIGluIHRoZSBmaXJzdCBwbGFjZS4NCg0KKzEgZm9y
IHRoZSByZW5hbWluZywgYW5kIGhvcGUgdGhhdCB1c2VycyBvZiB0aGlzIGNvbW1hbmQgYXJl
IGFibGUgdG8gDQpjaGFuZ2UgYSBsaW5lIGluIHRoZWlyIHNjcmlwdCB0byBhZGFwdCB0byB0
aGUgbmV3IGNvbW1hbmQuDQoNCj4+DQo+PiBBbmQgZXZlbiBpZiB3ZSBkZWNpZGUgdG8gcmVu
YW1lIC4uLiBtYXliZSB3ZSBzaG91bGQgZGlzY3VzcyB3aGV0aGVyIGl0IG1ha2VzDQo+PiBz
ZW5zZSB0byBjb21lIHVwIHdpdGggYSBnZW5lcmljIGNvbW1hbmQgaW5zdGVhZDogQXMgZmFy
IGFzIEkga25vdywgQVJNIGFsc28NCj4+IGhhcyBzb21ldGhpbmcgc2ltaWxhciwgY2FsbGVk
IE1URS4gTWF5YmUgd2UgYWxzbyB3YW50IHRvIGR1bXAgTVRFIGtleXMgb25lDQo+PiBkYXk/
IFNvIHRoZSBuZXcgY29tbWFuZCBzaG91bGQgbWF5YmUgYmUgY2FsbGVkICJkdW1wLW1lbW9y
eS1rZXlzIiBpbnN0ZWFkPw0KPj4gT3Igc2hvdWxkIGl0IG1heWJlIHJhdGhlciBiZSBhbiBv
cHRpb24gdG8gdGhlIGV4aXN0aW5nICJkdW1wLWd1ZXN0LW1lbW9yeSINCj4+IGNvbW1hbmQg
aW5zdGVhZD8NCj4gDQo+IFdpdGggcmVnYXJkcywNCj4gRGFuaWVsDQoNCg==
