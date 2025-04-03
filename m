Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4227472njd;
        Thu, 3 Apr 2025 09:18:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWd7sIBzUovvpHbe3U1e3NIIZ5KwEUnzb1JgsbozTXO1a4M98WInCUEwjxUMO4Qyi+sg07EIN7scTVWUg==@linaro.org
X-Received: by 2002:a17:903:1a23:b0:223:5187:a886 with SMTP id d9443c01a7336-2297661b4ddmr63060655ad.22.1743697115035;
        Thu, 03 Apr 2025 09:18:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743697115; cv=none;
        d=google.com; s=arc-20240605;
        b=d1lIXq7hqoVPCultxEFSTTzU78TLcyKBxIbByZ/KMMWFzu5racJPbMkO0EDpsfnsWM
         xXv6bpVKNGYyULltI88tEvEats8EbWG/fXS62rQYp7yFmyekx27Jcsa9BVFkhpzt3Xkv
         6VX/GUHQaqHsl7NyNOIhjrOO1+FqgV8+PTW7/qTdSNGs8a/qwKwKzdeGEncBnZxp6OkB
         cheMR6xb/C8d887kql1f9k8MSu4Gah63QJBFnFWo7hH3HJrS0gt772CWWGQzHusn/O0M
         tPCWAMrAa8zLSgDydRkM2yzXZokBiw0QqRn5RtmiuCMRbo44bYQM+cgNPsd/32GX/+3D
         HO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x39luPc+dOXIM+x6bbOzkYde6vN7LjcapekMw7Cuda8=;
        fh=Bi4SzlqqWEMaEQGPf7/2LAznwb3TAXqGNH93QhzQ8lQ=;
        b=LTddV1vnEAM3odPbNUyD43xJ0YMtunSjKxQ+K7ja6ZfhbkEpAixBkB+zhR3OLpo7T5
         CmNtr9P90MXRAaflWza4B1Yi/9BPmvrBor2DLfandkOA2sdEib369C4+gmZvsOYH+/Sh
         TgQOzpz3/QKT8jcSz3jWSMnSvxdSyxTBBR46mMHF3Kw9UrSD/tYtmMjf1Ur99/+Br5cq
         GvTE6zIcMExWFv7xLwgtD9KaA/W8wjni6eKKazak+BAJTqo5aXfyWk4cLFAUS1FOBIEt
         9j02ZfLceLlmatgZ+WbK+V3U+yXIMVifMDtEYS+DGHa3UIA4+nqR+JOPJ9/Kfdabe4aK
         MK3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMnVlvzY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2297862fcd5sor10902805ad.6.2025.04.03.09.18.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 09:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMnVlvzY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743697114; x=1744301914; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x39luPc+dOXIM+x6bbOzkYde6vN7LjcapekMw7Cuda8=;
        b=eMnVlvzYJiixuJanYK35kk4ROYmh0m4rvkxuHiTZyhtIGOAjVd6v7gWDK8pGJT8hOC
         dSPem+zO2X4zp7XPIzTiE1OutbwTlAxfiMFhRaCZEvOE+X37XI0fwGcCcNHhwJUwMlCz
         ba63m7tKNgRFAJOdK/vjswCwGkP5FmJDeydSl0e6nilngw8Rh1Ejf3WIKFqHYkr+aa4G
         DJVFGC+Euq1GjlNdRm7DGr4KbPLq4YJt2bt+1xcJo0m+mtGBUiU0KWIvwG+Eh3JWoGHX
         FCdzWJxGD8+fFnYDDmVzusfGgqXbLKzJg5qTHPUlBcPiO2TXvg9OVwFj0q9dGB+wzyzc
         BACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697114; x=1744301914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x39luPc+dOXIM+x6bbOzkYde6vN7LjcapekMw7Cuda8=;
        b=FHSLtL1o4dnQ7wiUSiOV4kB501LF2OLKRwjGBSM5gI+MOjA5hRcwkgyHwrsGsbc7Nm
         EAn1F+YYSzQNCaLqc5pC75DMbsmfgioFvov50SxzrFWDWbzZ62RUBm87fVd1+d/VLJoN
         YqDo2c51aPHoNSTtkYH2KaKaoRaiX21I2DXKs2fdTuK7Sljr888wQOKmtdkEHnFtIIfH
         O2Pv4Ou0072WB1T/yPuoPajhknBYheItl0X4FvNtMaISNWXi0T0Chs42GQNxbiTVbFa5
         ktoPJXDfWq9DmtJz2pd3oDkNO0HGxw170SggonKDjcjcHlLJx+ljfF4GEinkY1NkAY4q
         0gdg==
X-Forwarded-Encrypted: i=1; AJvYcCU59tlqQE4DTBXoLZivyQ2OiPWkhTpbGM9hhFYYPd+ON+gZhNcc+wb2f21oCIQCAKoyXljJVrFsmX58Ew==@linaro.org
X-Gm-Message-State: AOJu0YycMFm3Dj1YDlXrPOkscODomq7SJ6/KK93hEkdrsYUJK8zKKy5u
	IFcsk+uRPBkvWOSgZmYQYun2OBTt9mZiH6Zhhq44L74EYca6i+OWadetwC08QuRalA==
X-Gm-Gg: ASbGncvB5UWTjc/QS6XDGEQZvt8hgZzbShj73+OHsK9igtdBlNTXA8QfpPdPPyIGhe3
	lOUQrPUlD286VyFkDKbSmgb9y40WPmyh/d00FO6oWcjF0e92PegoO32izBVshqvMT46rsQT73Ez
	6FS8FEt11GgFdABtF/WTq/kJa6cDBCQDyrUj13A6LH5XoN3NHHZHRZFiv9uj6oKwPMRAZRbMT2v
	opfqT7m9Ari01KSHE7D7H50XB23NRwXiYZJECCzFmA57J3OkdN1cyK3KRGYCk3tlNEyhWHIbzaW
	tyNmcDkdV5paTf918oMFp4T3ofKcbZzNQXpgeTEiEFcnCTFWWLIisXytBQ==
X-Google-Smtp-Source: AGHT+IF4q7/kri8teKMRY/8jyeWsH+vGxnupu4MuBAEpCr3j4cu/OyriJ+IN91ryNnKreauAlaARJQ==
X-Received: by 2002:a17:903:3b84:b0:21f:53a5:19e0 with SMTP id d9443c01a7336-229765d1a02mr56269955ad.12.1743697114494;
        Thu, 03 Apr 2025 09:18:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877266fsm16560025ad.215.2025.04.03.09.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 09:18:34 -0700 (PDT)
Message-ID: <72224ba2-2d6a-4d84-99c9-83af5a47efce@linaro.org>
Date: Thu, 3 Apr 2025 09:18:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/29] include/exec/cpu-all: move compile time check
 for CPUArchState to cpu-target.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
 <20250325045915.994760-4-pierrick.bouvier@linaro.org>
 <e11f5f2e-0838-4f28-88c1-a7241504d28a@linaro.org>
 <319fd6a2-93c1-42ec-866b-86e4d01b4b39@linaro.org>
 <1d13c66a-e932-48c4-801c-9b14890679c5@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <1d13c66a-e932-48c4-801c-9b14890679c5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 5Uf3XzEJenv+

T24gNC8yLzI1IDEzOjA2LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4gT24gNC8yLzI1
IDA4OjI1LCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4gT24gNC8xLzI1IDIwOjMxLCBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4+PiBXaXRoICJjcHUuaCIgaW5jbHVk
ZToNCj4+PiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBs
aW5hcm8ub3JnPg0KPj4+IFRlc3RlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBo
aWxtZEBsaW5hcm8ub3JnPg0KPj4+DQo+Pg0KPj4gSSBjYW4ndCByZXByb2R1Y2UgdGhpcyBl
cnJvci4NCj4+IFdpdGggdGhpcyBzZXJpZXMsIGNwdS5oIGlzIHB1bGxlZCB0cmFuc2l0aXZl
bHkgZnJvbSAiYWNjZWwvYWNjZWwtY3B1LXRhcmdldC5oIi4gSWRlYWxseSwNCj4+IGl0IHdv
dWxkIGJlIGJldHRlciB0byBhZGQgaXQgZXhwbGljaXRlbHkgeWVzLg0KPj4NCj4+IEBSaWNo
YXJkLCBjb3VsZCB5b3UgcGxlYXNlIGFtZW5kIHRoaXMgY29tbWl0IG9uIHRjZy1uZXh0IGFu
ZCBhZGQgYSBkaXJlY3QgaW5jbHVkZSB0byBjcHUuaD8NCj4gDQo+IERvbmUuDQo+IA0KDQpU
aGFua3MgUmljaGFyZCENCg0KPiANCj4gcn4NCg0K
