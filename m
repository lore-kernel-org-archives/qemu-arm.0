Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2170309njc;
        Mon, 24 Mar 2025 12:11:22 -0700 (PDT)
X-Received: by 2002:a17:903:182:b0:224:c47:cb7 with SMTP id d9443c01a7336-22780b9dbc5mr221991025ad.0.1742843482610;
        Mon, 24 Mar 2025 12:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742843482; cv=none;
        d=google.com; s=arc-20240605;
        b=jxGoFyG/A5KIf8y/Ec6Lk69sKplqKPrlno7yi1bxfncbI5ckLI1pQpK4aMWQ4b/lKj
         9Gd8r0hC39wMUsmbTNewy9o2vM4kNrEjnLEKH8gLO+lzbYSb1wJKf/FEcbXVsN53Ltr2
         zFRopzPf0lzlc3SxX8lc0vBR6GJSMDappVT5XM2Cq/9mE15CP0EPYqWXD1DLK089X5xQ
         NCYnPvyrEfwcV2ijs/KkJ8f6pHUhRKyETBETaKWN6HYx1giahW0jEFio7peF+WjgYGAC
         gtnVmi9T4ii1yrJQR7HdDy2ymJduG7wrIHgqq1B25PqQk6uWdj6bp9jnoU4Cajl7odae
         X5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZF7cFjujuaPFgbJpTgzr5t/+46fAwSRjELo50X3QZuo=;
        fh=BTdOLXdl/ITl2fQmWwPYUSiN4GxXPB8sZ0vt1b6PrrE=;
        b=ZE4kFFfPcp7LYxlCyYMTORo+TliBvQmh8ePikkB+VC+HjsdG+PoXqzC0kO2tLI22jp
         1uX4lSW3CHD7V9agFqQVX9pQ67wbDK9rconXn4Mhd4AA3DUu3Rtp4nU0ckooedQw8JJ6
         mD/ZfPJyEuZE2JWZ0DGCb5xnWyey3N6MIAW6QqjpA68sRR45b3zxdkgK0n7yhKCTJCnl
         XWDeorcEYfJCK/0tFTGVE0NiqeAjWpwa2ynx7HqrpKUmYXr/MQjU07zJxvMNDv/6vI06
         ZlQlXQnbKHbkWfO7+686URJgBuheRhwxIWfNdEzz8td9WXTi4KqYUCIt/sS2xcam3c15
         Z19w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCykxiFA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f990b0sor49129115ad.16.2025.03.24.12.11.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 12:11:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCykxiFA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742843482; x=1743448282; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZF7cFjujuaPFgbJpTgzr5t/+46fAwSRjELo50X3QZuo=;
        b=yCykxiFAgS8PEFaUoyw3k/jg3ZVO3LMimz0xVLq2bU12F8EfC827TFB58g3ZAQp0uR
         AEQ7vG9xDICqqD0Lg/1t22ION/YyPW+CRYBaZ4UQlw3prgQvt0qK6gK3Mg88lXcMad1n
         MzDfVWTShfRkoAwQ0yvmYq5UmZ2Z+kqQpzdhc/96AI8lwcaNZwVMeNl3TEjTvBootwo1
         X67s6UoscvZpfdIHYsC57zgrBo9nkaa7WESDrwvm7L8CqL5JVgBe+I9sni0M9ZGxynGF
         o3i7+JTS0tbKldMMZfnhV1tJLZBWjMQw3G1FHOS+xnCjoxj85aRzzprZVahZr73jkK1w
         s/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742843482; x=1743448282;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF7cFjujuaPFgbJpTgzr5t/+46fAwSRjELo50X3QZuo=;
        b=X19KMpQQOHILiLZL5r0FucaR97QJQkoKJq17PFDuZHLzcxo/pPBDssDioTisYQf4qE
         3qoF4gaNBldtJWKlWq5aaosgPlgsWKT9suKT1jrx/XYaHIv/sSI4x69Lg6xKjSDI0Jps
         /XHICKmOaxkoYwCwq2IFXeNliR12hzaanLu8pOl+ZaRgOTszGMCQVp0Qaljg4EgCD+XN
         tW6+EjcoOR1ihV6KAVwy0pQwIYwvCdAHGzIf4Wtagy3SHJy4LnG6yLBQamOawj1WkhBm
         ozwJhL4Nqu4ev/2QnK5U/HpkrOBrUauwG5Wk024u0p5/3BUtDAVbcclomo7cL9oFYKyd
         t5Vg==
X-Gm-Message-State: AOJu0YxY9LGWu5WQw9mD2pG/Hd7n6azFKJkK4IyNhLbJnsgmzsaI8tqN
	QusVKRycIrCJlpbw2tn16UA359HaqzdPEf87TGD8ijVrHp3050XdHF0yC6fW+Gtw7wYv38arzE0
	TcEPt+g==
X-Gm-Gg: ASbGncsbFHMzMJtXLII7gwQs3dTQMZJ9DWBQEVEXkuVVLnVelgPVUeZiWZ7BAXtmilE
	R7joqjDz00lrK1/WkEitg7RRr6zP2ab1W1iAPikiQklzqwIJ+FFZUGsVd7OFmm3aa8PZnUOG9aU
	kVWjqjOpHqEforcd80+H17n7R8/iy0O6iSiTRN/pOYdeB4KPhPKTD9zr5XTUBTAbse3b8Ijkl38
	7Mf8+E4uKs55nfb88pwak7n9kHMC8Z8wz77HoTBTuCeTAqq3hZ8s3YtUX9irDvkjkjSMd7CcpkT
	ZQETkQiMTfbqI/XK0tbABT7AuJdS9wrRHOZd9YbDtx/3DefQVCqH5ugcZw==
X-Google-Smtp-Source: AGHT+IHo/bFh1epFIxjsdzZJ4OtwVqGaV8c13D1qM/aJgfZk1lts3p3dEmFiHF5pDmaKUgVdwU+bTg==
X-Received: by 2002:a17:90b:3d8b:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-3030fe813afmr26433744a91.14.1742843481996;
        Mon, 24 Mar 2025 12:11:21 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61a68dsm12655450a91.39.2025.03.24.12.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:11:21 -0700 (PDT)
Message-ID: <778db1f3-58b7-4f4d-9ae5-661c4a67574d@linaro.org>
Date: Mon, 24 Mar 2025 12:11:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] gdbstub: assert earlier in handle_read_all_regs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-4-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250324102142.67022-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: 4CI7CJxmlpdi

T24gMy8yNC8yNSAwMzoyMSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBXaGVuIHRoaW5ncyBn
byB3cm9uZyB3ZSB3YW50IHRvIGFzc2VydCBvbiB0aGUgcmVnaXN0ZXIgdGhhdCBmYWlsZWQg
dG8NCj4gYmUgYWJsZSB0byBmaWd1cmUgb3V0IHdoYXQgd2VudCB3cm9uZy4NCj4gDQo+IFJl
dmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+
DQo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4NCj4gLS0tDQo+ICAgZ2Ric3R1Yi9nZGJzdHViLmMgfCAyICstDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZ2Ric3R1Yi9nZGJzdHViLmMgYi9nZGJzdHViL2dkYnN0dWIuYw0KPiBpbmRleCAyODJl
MTNlMTYzLi5iNmQ1ZTExZTAzIDEwMDY0NA0KPiAtLS0gYS9nZGJzdHViL2dkYnN0dWIuYw0K
PiArKysgYi9nZGJzdHViL2dkYnN0dWIuYw0KPiBAQCAtMTMyOCw4ICsxMzI4LDggQEAgc3Rh
dGljIHZvaWQgaGFuZGxlX3JlYWRfYWxsX3JlZ3MoR0FycmF5ICpwYXJhbXMsIHZvaWQgKnVz
ZXJfY3R4KQ0KPiAgICAgICAgICAgbGVuICs9IGdkYl9yZWFkX3JlZ2lzdGVyKGdkYnNlcnZl
cl9zdGF0ZS5nX2NwdSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBn
ZGJzZXJ2ZXJfc3RhdGUubWVtX2J1ZiwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZWdfaWQpOw0KPiArICAgICAgICBnX2Fzc2VydChsZW4gPT0gZ2Ric2VydmVy
X3N0YXRlLm1lbV9idWYtPmxlbik7DQo+ICAgICAgIH0NCj4gLSAgICBnX2Fzc2VydChsZW4g
PT0gZ2Ric2VydmVyX3N0YXRlLm1lbV9idWYtPmxlbik7DQo+ICAgDQo+ICAgICAgIGdkYl9t
ZW10b2hleChnZGJzZXJ2ZXJfc3RhdGUuc3RyX2J1ZiwgZ2Ric2VydmVyX3N0YXRlLm1lbV9i
dWYtPmRhdGEsIGxlbik7DQo+ICAgICAgIGdkYl9wdXRfc3RyYnVmKCk7DQoNClJldmlld2Vk
LWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQoN
Cg==
