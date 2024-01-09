Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp417124ejs;
        Tue, 9 Jan 2024 06:25:56 -0800 (PST)
X-Received: by 2002:a05:600c:4e06:b0:40e:4a7f:fffd with SMTP id b6-20020a05600c4e0600b0040e4a7ffffdmr893510wmq.87.1704810356489;
        Tue, 09 Jan 2024 06:25:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704810356; cv=none;
        d=google.com; s=arc-20160816;
        b=Fg2KTFmOzZhv4p1Lh39GoLjT410EZznNCLV6ARsvebpryYJWcfcN14tJGiwawsBTIJ
         pN9pyrS99p8lqPIQH15tKc8DYVM/6vBPbTaHlYmdKlDBF4NS8cBABeU939Ed63iKqzYN
         aCekpv8n6Kao1f0wXFR4cdOoL1cCvKFSKqy285ZYpXgoN4/AJoZFEQh5cjqfReZjMx/i
         Exq/CKtgh+0ZpWS+G29odO0Z1Hij6W4JSAMPa7cw+aKxGepw1WHVTcu0pN7gigr8+d5G
         hJ5h+jR/Ipz9xyWcXDp+Afk9iLjzFdcvf6ePQNKFzYFxPFBvLT1oZwiaOvL6BOpxWFWv
         VFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=u1AEBceW3yFlpwPWlgM2E0KSqURLnKs6XEX+Lp2G+N4=;
        fh=+yscWfoYtRt+nWdTJ8NLSezXs+470IiCapUYceYFI/k=;
        b=R0jEL9oiQAjgfdGSI4If/biMH56EuCoQp3BQ89NBG748AB5IrBW/YTf6HCWzQC+UhK
         DpAmE9uyQePysNiyENfapTqg6kQN0Dx/WrFeubAe6mkLH6YCHrkWDC8NuRw9Mg4k5WZW
         4wlSSsNI6tc3DMe3rN+hQ6qxmXGLSv3MZV3tJuvoMdVDNfqPb9sOBv1Picom1IBUkQIy
         Ey+xKuHFbNQKSXVYky67mTtBXNVEt1a5MX72l4bqHVjHmpMDMQ+8gPXNLFxL5t5pCl3V
         yRIFoIyQvVX1jmaw1RC46NjQF11Bq1X81KFwaBtSiZJt2sMFAk85lOLJqfuHVW5DUo6L
         bUCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aoQ3iiGz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k24-20020a7bc318000000b0040b3d6de46dsor893096wmj.7.2024.01.09.06.25.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 06:25:56 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aoQ3iiGz;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704810355; x=1705415155; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1AEBceW3yFlpwPWlgM2E0KSqURLnKs6XEX+Lp2G+N4=;
        b=aoQ3iiGzHYVsK2MjzvO/yN3kbWKANhMflys9oexi9+2nvhGiRqmvXOByRgqUw6LP9b
         c+hfUjG2u6Z2dJrGt6AFJpb9OqRpcj2KaotuXTzuiffU3UUJ+KfEFLPhNRg1dlCiYRAp
         J4XdH1Y9fg+q4D1NY81p4ZrWQVSPcYpEBYmb8fneK2w8/BeX/eHrdfO2iRoSLqel7L2N
         Kf2eshE7eoqMqzFh4nI0Vo9IkQqPY+W+yS6Ak4QceFjT7emuTlqAYQM0euhgNGUCDHyT
         xjFARuYbz835qSX1yVRvxiyCs2iQhU5khrrngebIuec38FZLuPMS7YO/qm+aPKJIGl6o
         7/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704810355; x=1705415155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1AEBceW3yFlpwPWlgM2E0KSqURLnKs6XEX+Lp2G+N4=;
        b=MTjsQCHFmuzEqH4EgcymCz/p1mUZb10YUllR0NiDQ2X030t/X0bieHJs9/Tq0J6x3k
         05aJ7zmB1DI/N2kEAR213yEu50qe+c/8VeSUedFg+0Ef7U3iyrK5SlkgL7p1GzWdbuyc
         wetv49FWyNmMkXKtkiIvf1SxkH9bcAycewkeUtAabevKZ13iqXTAS3Mt9B+yyDjYbKRl
         w/k3h73uCJaRtSTN3sIEHYQXWEQW46/28Yisg36FaWcY0Rp08Uzdondx6q0nEjPVhLBZ
         hMepNAhHFbAJ7HyWyThv52ILFYaa7fKoytDCXuw51o0HhCY1N3JRIENnwbLXzqwXtVOK
         IeyA==
X-Gm-Message-State: AOJu0Yw9chKJQga0Z0IhygYE3WHpz+tAZqXreomWyHLC7jxNURKxpL5A
	tgfheqeVxZVSdF6lhWkZNqf7eHcubQGX6Msn907ycMkc1YdxEzgOKUg=
X-Google-Smtp-Source: AGHT+IHY3kSZpB9bUQ9rZCp+7ar1YHv+53ISVHQsGVm43Q5eEUUT+WQeFBsEeK9v7TycA/Mni84MDQ==
X-Received: by 2002:a05:600c:1c16:b0:40e:470a:d867 with SMTP id j22-20020a05600c1c1600b0040e470ad867mr1263182wms.222.1704810355230;
        Tue, 09 Jan 2024 06:25:55 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.24] ([102.35.208.160])
        by smtp.gmail.com with ESMTPSA id ay26-20020a05600c1e1a00b0040e53f24ceasm7614wmb.16.2024.01.09.06.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 06:25:54 -0800 (PST)
Message-ID: <e7896134-bf88-4742-bd89-9a80f701206a@linaro.org>
Date: Tue, 9 Jan 2024 18:25:44 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 42/43] docs/devel: lift example and plugin API sections
 up
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
 <20240103173349.398526-43-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240103173349.398526-43-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Ek5ujX7bGSQ4

UmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJv
Lm9yZz4NCg0KT24gMS8zLzI0IDIxOjMzLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+IFRoaXMg
bWFrZXMgdGhlbSBhIGJpdCBtb3JlIHZpc2libGUgaW4gdGhlIFRDRyBlbXVsYXRpb24gbWVu
dSByYXRoZXINCj4gdGhhbiBoaWRpbmcgdGhlbSBhd2F5IGJlbGxvdyB0aGUgVG9DIGxpbWl0
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5h
cm8ub3JnPg0KPiAtLS0NCj4gICBkb2NzL2RldmVsL3RjZy1wbHVnaW5zLnJzdCB8IDYgKysr
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kb2NzL2RldmVsL3RjZy1wbHVnaW5zLnJzdCBiL2Rv
Y3MvZGV2ZWwvdGNnLXBsdWdpbnMucnN0DQo+IGluZGV4IGZhNzQyMTI3OWY1Li41MzVhNzQ2
ODRjNSAxMDA2NDQNCj4gLS0tIGEvZG9jcy9kZXZlbC90Y2ctcGx1Z2lucy5yc3QNCj4gKysr
IGIvZG9jcy9kZXZlbC90Y2ctcGx1Z2lucy5yc3QNCj4gQEAgLTE0Myw3ICsxNDMsNyBAQCBy
ZXF1ZXN0ZWQuIFRoZSBwbHVnaW4gaXNuJ3QgY29tcGxldGVseSB1bmluc3RhbGxlZCB1bnRp
bCB0aGUgc2FmZSB3b3JrDQo+ICAgaGFzIGV4ZWN1dGVkIHdoaWxlIGFsbCB2Q1BVcyBhcmUg
cXVpZXNjZW50Lg0KPiAgIA0KPiAgIEV4YW1wbGUgUGx1Z2lucw0KPiAtLS0tLS0tLS0tLS0t
LS0tDQo+ICs9PT09PT09PT09PT09PT0NCj4gICANCj4gICBUaGVyZSBhcmUgYSBudW1iZXIg
b2YgcGx1Z2lucyBpbmNsdWRlZCB3aXRoIFFFTVUgYW5kIHlvdSBhcmUNCj4gICBlbmNvdXJh
Z2VkIHRvIGNvbnRyaWJ1dGUgeW91ciBvd24gcGx1Z2lucyBwbHVnaW5zIHVwc3RyZWFtLiBU
aGVyZSBpcyBhDQo+IEBAIC01OTEsOCArNTkxLDggQEAgVGhlIHBsdWdpbiBoYXMgYSBudW1i
ZXIgb2YgYXJndW1lbnRzLCBhbGwgb2YgdGhlbSBhcmUgb3B0aW9uYWw6DQo+ICAgICBjb25m
aWd1cmF0aW9uIGFyZ3VtZW50cyBpbXBsaWVzIGBgbDI9b25gYC4NCj4gICAgIChkZWZhdWx0
OiBOID0gMjA5NzE1MiAoMk1CKSwgQiA9IDY0LCBBID0gMTYpDQo+ICAgDQo+IC1BUEkNCj4g
LS0tLQ0KPiArUGx1Z2luIEFQSQ0KPiArPT09PT09PT09PQ0KPiAgIA0KPiAgIFRoZSBmb2xs
b3dpbmcgQVBJIGlzIGdlbmVyYXRlZCBmcm9tIHRoZSBpbmxpbmUgZG9jdW1lbnRhdGlvbiBp
bg0KPiAgIGBgaW5jbHVkZS9xZW11L3FlbXUtcGx1Z2luLmhgYC4gUGxlYXNlIGVuc3VyZSBh
bnkgdXBkYXRlcyB0byB0aGUgQVBJDQo=
