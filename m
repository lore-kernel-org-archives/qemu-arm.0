Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3360139njb;
        Tue, 22 Oct 2024 13:40:13 -0700 (PDT)
X-Received: by 2002:a17:903:2283:b0:20c:6bff:fc84 with SMTP id d9443c01a7336-20fa7077478mr6944975ad.0.1729629612957;
        Tue, 22 Oct 2024 13:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729629612; cv=none;
        d=google.com; s=arc-20240605;
        b=felXrOxEzway9jzVujQtnMD+CayEItA4R0QjnYW7nk/qVPbR/sf+KseUHvHjatB1J4
         ikB7GgLGqaxJfdqXWPy4LdVRjErnxfl1Xqnc1heUn1giHNI8cXaWGuZdNJdgvhtxfa1K
         VlW013lnRRQeSO1pckKy0eF04jmhTeSVytE4SVjVdgzD4b1pY7v8YbGZqDfKEM7YBJpm
         KXIeKvqEcSofFlHKBGfCYYl9QDHNTZo6spij0VVI5PrDCzIhLdPsWx6xnMIup1P0tlsr
         z8dZ/m3TgrV+N3Mu5tJygSHJkn+nJ8COiwwuU8UE+SBKw2oG893Vxx+jwOpx96bzEHQJ
         xULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qvG9H2rQCuMb8g+05Ev4U0/JOsAKRwDrwfS8a4lVJN4=;
        fh=X8ItXK/eP+lsZpHYO2upAce6PY3lCv88NOwH1uPYlKY=;
        b=L2U454/Ow6wDD9EZWWoO1xyAmncDyvni7DxPKVQvrVktyKSoYAtTwOSDJTGBOHDcsu
         JJRSq48nzqmIVQNpEzOsN67h76CIMdjua9iagt0SaBRddnbCe73TPobgIPm248p6RQ7k
         BG3pyRxX4dmzlRVR2BZj3iboRS+L1oJFXU+j8AgmJlbToMhJUTvD0ywCirE/l/bi+CM7
         HW/H0CWJHcnzlfGVZJFgzZhFIOJET4s28WJ+qXGJOGf8uBWBTQIpJLx8LpcqfEUykLBv
         QSs9EjVzaznKSeCS31meOqUeWcC0+Fte602b1+7WGSZXTneAfRHbyiEbp3G7lN09yw2N
         Q+TA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a8kf/R9N";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e991d67c0sor15169565ad.6.2024.10.22.13.40.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Oct 2024 13:40:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a8kf/R9N";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729629612; x=1730234412; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qvG9H2rQCuMb8g+05Ev4U0/JOsAKRwDrwfS8a4lVJN4=;
        b=a8kf/R9NJK8/O9w7wYStzKZsMxcvj7g9WWZfuAHwkxvcnKLvEVQBIJm9GeKcqtLqKY
         o9lqKKo2CJMZuI7FHPyVCHPGZjigjSVVRbJY7oMVJyK0NUYPLeHOru1pST4IBou8h4qQ
         uliDj9roeu2wVeH/+bGH0TYWJ4fucQxVYfd3olYoCMKW/BHLsNxH7pSjH1rg6i6lYU5B
         u3VDRDTlFO94BJScG6OJ2Av0wKbYTAU5AL6tjnOtU2eOknNKPwODo59IpJDQW3gskmzK
         XSlDWqlVpkYFJsc2VkC4XrT+EjbffEV4EqzkXX/UwBcNO10ci+eKaW3ZN3B63E1EQkvg
         fWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729629612; x=1730234412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvG9H2rQCuMb8g+05Ev4U0/JOsAKRwDrwfS8a4lVJN4=;
        b=ZBVyyAWMeVlOmTHu5g1CYrgoGojF0E8vHxDYs+2p2eO3cSbvCWabmRNCIDqnBiTFnF
         RmVIPpT6ZhVj6T4RyL5Tck8BhCM2BjZs8zdTNPn3K9WpGLUMO8gSlesjGt1THgO5BBPO
         XUy7yPCms1yLuQytJM1F4tTfPjfWYpD0z1YfzYOk+6t5JS5E6qcQ1NILbWA5isHYImZY
         6qsD/A02ejH9pmyqeoKU4TYy6OtI2oLhmityScN51O4bM8pyaPi+5BkgYMmUKa26bt/I
         jDYezaO2tTH+N7k8OgqdH4/ft0pWVHPdAYDMSgQ09z21rwWOw9aIapOee75U77QbGysT
         U1UQ==
X-Gm-Message-State: AOJu0YxqLA/AhW5NrkMfIx8alhJMmLreBvOPai/lkzgeVSX9mwk/5Ym0
	zuckzjZpMvgFuHFUzjctR6pp81O5C8K5TpgVNQ+5nIrFHJ2m/18Q3C9en4SjE2ORoBpXADvYBGf
	MtKRzleM2
X-Google-Smtp-Source: AGHT+IGhsr68xM+2DHDRmM+aLh7jGtiUs902lD0R0BSuVY69oA/h0YUu892mfTNoYvuF23qCg4Pcxg==
X-Received: by 2002:a17:902:ecc5:b0:20c:e6e4:9daf with SMTP id d9443c01a7336-20fa9e48be4mr5302095ad.13.1729629612404;
        Tue, 22 Oct 2024 13:40:12 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0d9a67sm46441425ad.185.2024.10.22.13.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 13:40:11 -0700 (PDT)
Message-ID: <78c6f080-7722-48dc-a4c7-a7345155f2cf@linaro.org>
Date: Tue, 22 Oct 2024 13:40:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/20] MAINTAINERS: mention my plugins/next tree
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 devel@lists.libvirt.org, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>, Zhao Liu <zhao1.liu@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-17-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241022105614.839199-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: UYqmwJ6fCMSs

T24gMTAvMjIvMjQgMDM6NTYsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gTWFrZSBpdCBlYXNp
ZXIgdG8gZmluZCB3aGVyZSBwbHVnaW4gcGF0Y2hlcyBhcmUgYmVpbmcgc3RhZ2VkLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3Jn
Pg0KPiAtLS0NCj4gICBNQUlOVEFJTkVSUyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRB
SU5FUlMNCj4gaW5kZXggODEzOTZjOWYxNS4uMDJiOGIyZGZkNiAxMDA2NDQNCj4gLS0tIGEv
TUFJTlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4gQEAgLTM3MDIsNiArMzcwMiw3
IEBAIEY6IGluY2x1ZGUvdGNnLw0KPiAgIA0KPiAgIFRDRyBQbHVnaW5zDQo+ICAgTTogQWxl
eCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiArVDogZ2l0IGh0dHBzOi8v
Z2l0bGFiLmNvbS9zdHNxdWFkL3FlbXUgcGx1Z2lucy9uZXh0DQo+ICAgUjogQWxleGFuZHJl
IElvb3NzIDxlcmRuYXhlQGNyYW5zLm9yZz4NCj4gICBSOiBNYWhtb3VkIE1hbmRvdXIgPG1h
Lm1hbmRvdXJyQGdtYWlsLmNvbT4NCj4gICBSOiBQaWVycmljayBCb3V2aWVyIDxwaWVycmlj
ay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVy
IDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
