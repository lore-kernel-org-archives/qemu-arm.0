Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp90987njc;
        Wed, 13 Nov 2024 20:16:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUe4YflW57iXy5QxysT8m6dDQTSd62b/olU1WNyyYpf2VRvItqolEyPFqtKVw31tntB8cWu5U0EZXgAUA==@linaro.org
X-Received: by 2002:a05:6a21:84:b0:1dc:2365:4d7d with SMTP id adf61e73a8af0-1dc70380af7mr5035476637.16.1731557769784;
        Wed, 13 Nov 2024 20:16:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731557769; cv=none;
        d=google.com; s=arc-20240605;
        b=A7iuYETncLoWw6g0WTq/AGP5XbG86zEH3G3oSbKkP1JSHD9KGLx9kqJzg1yMK79PfA
         Npj0m5d+W1bNMLqIBchhSug4/ZpaFCxYleNhbArNU8wJpq2dkuIr2Cbr5Foj0HJ+3PZs
         zAmN8b68eQh4ttt1NSjYTYCoKsNPsMb06NI6XZX5Qz4B+cFR0yT4Jz9fwinJG3gBfMbI
         BOtbWKki+0g29wYcEsbNGY4MMJqFcPZhCaIGCR50SxIJb2dPYH8BkEGptvSuOrgHfipm
         ZCfJ80vZobbQWyotewndW+njctrooPJURo39G0AWNzHDMDmaZcyyn+qRWxeGNSQP/SSk
         JDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lezMPJwXytMzlLaQtK2wi8F3Fr7eDH5mRsOKafMawOU=;
        fh=wo4q3a93wjz9rMcg7raHZaKSLIZDwAV3JDek4ji7wyk=;
        b=WNkD5imqaqLs4ZTrhBkDXhrX4ftAC2HdP1DVn54IRFIJwKJ/VJ3Ryda2SBGmILFKn8
         MMdYwhZdD28spuY5HLnPc56Ec1V9QMGb3WuQgi8ZNBEeDVCeTvtFC9FjE2WsvJfFz4ob
         irPtwz7ecAQrhLLlZaAGfrRcWS9g6rK6oelCXJcCamza9Bu1v2uzQaF2u6UgCnWGmcsm
         GZapOUWvGK+JkfonQKsZfNFfQLSdiDfVJMksRUC0tTCE3u5pEXwQ2WTEc4TOyXPfZmXL
         g/+IcADjTGO9xoAW9AN8zmZ2jYS4F+Z82f0rkop04/zJqIP0/wJ0XV93NkzkGcAVL7GC
         C+rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U28GzLC6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7246a6f5ec3sor330925b3a.5.2024.11.13.20.16.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 20:16:09 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U28GzLC6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557769; x=1732162569; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lezMPJwXytMzlLaQtK2wi8F3Fr7eDH5mRsOKafMawOU=;
        b=U28GzLC6iuisr1rNc7ied/BDdYdiJDSZoqOv7209rKt2zYJEWiUI82xDGhYXON+xvx
         kMcdKIGrIvGvLcdSOoc09ItuYc6saZe8f6Wfcf3+ezI9PwekPzpsuyL/yT2HKvYl/GlH
         BzyPzT+MPMF4F+kDqMiSJJYfbSbfmjChBSQ5R9m2kkWUbsIGv0opGcl2VRAq30EsCdOG
         D1TUw35AUdK1UVBcPkbjFo99rsH8mdVzKlf7WXmz/KW0kuYJawP123rH7sIHeW0dLE5k
         wIFncp+CkTlEiKe6oDeJUAZgVbyqCNMuOLunpyccgpDO/Nf+GjnubU3734HNHNJvqIwl
         p3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557769; x=1732162569;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lezMPJwXytMzlLaQtK2wi8F3Fr7eDH5mRsOKafMawOU=;
        b=ntTRbKagJ/BGL7Nxx7FD+bcEgoHUfYVQ3fCYis4dwHP6wjYPOwrhYlZrKnDTHBLpWv
         pgfJZc4ODRsbUyzKztoTkZLgrHcB51yH44GY0fkuhucjRVn2vViW3pSHhWYqUs00Oiec
         qMx6kN1E/G01ZQAYkfo2kA6D82ZfAlvLoFvlCo9CfNDiNL+N4ZHaullGHW2JpHaTaYoo
         bQjwICbVloF6PXYEwa829Hp1ym6k6J364Gvte+jhRZxv3k8jA/QZM/anY32TqYLASONt
         C0p3duYJF6BZC0iFAwJnvQhSTvL7OmxrWjNJORx0Bz78XHSsjCLbGA3W7tcH6QOqZJlo
         NF7g==
X-Forwarded-Encrypted: i=1; AJvYcCXk3oBide1JQGUTi4eWEe8TFFbm6D+3J6i18SXw4Mz/9IAzdU0Lsm9ucIFSor9fI3qqFE+RJSyr3cFoTA==@linaro.org
X-Gm-Message-State: AOJu0Yzotbk49OraBBrL+x3QecFUnbI6hx6BJCoswz6gIvbv50Eu4eC7
	zoZB3P/zuL1KFl5h9DemcV4QQZyDoU5KK4lexcTfWpzQcN/WhPn2mVGAZp4jhuWMmw==
X-Google-Smtp-Source: AGHT+IFyz5dEST757I7gGbQVm+j0sU0JM/WJadpM0ElN+axYMMau5mm2TAJbUMT9XonwqZ75gKG35A==
X-Received: by 2002:a05:6a00:b85:b0:71e:64fe:965f with SMTP id d2e1a72fcca58-72457a2a382mr7723917b3a.20.1731557769306;
        Wed, 13 Nov 2024 20:16:09 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7246a9a8260sm256068b3a.122.2024.11.13.20.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 20:16:08 -0800 (PST)
Message-ID: <cb3640c3-97e8-4da7-9d01-0189adfd4e9a@linaro.org>
Date: Wed, 13 Nov 2024 20:16:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] exec/memory: Move qemu_map_ram_ptr() declaration to
 'exec/ram_addr.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-24-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241114011310.3615-24-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: R3uI9Y0f7IfZ

T24gMTEvMTMvMjQgMTc6MTMsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5v
cmc+DQo+IC0tLQ0KPiAgIGluY2x1ZGUvZXhlYy9tZW1vcnkuaCAgIHwgMiArLQ0KPiAgIGlu
Y2x1ZGUvZXhlYy9yYW1fYWRkci5oIHwgMSArDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2V4ZWMvbWVtb3J5LmggYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgNCj4gaW5kZXggOTQ1OGUy
ODAxZC4uNThmYWEzZWIwOCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9leGVjL21lbW9yeS5o
DQo+ICsrKyBiL2luY2x1ZGUvZXhlYy9tZW1vcnkuaA0KPiBAQCAtMjgsNiArMjgsNyBAQA0K
PiAgICNpbmNsdWRlICJxZW11L25vdGlmeS5oIg0KPiAgICNpbmNsdWRlICJxb20vb2JqZWN0
LmgiDQo+ICAgI2luY2x1ZGUgInFlbXUvcmN1LmgiDQo+ICsjaW5jbHVkZSAiZXhlYy9yYW1f
YWRkci5oIg0KPiAgIA0KPiAgICNkZWZpbmUgUkFNX0FERFJfSU5WQUxJRCAofihyYW1fYWRk
cl90KTApDQo+ICAgDQo+IEBAIC0yOTczLDcgKzI5NzQsNiBAQCBNZW1UeFJlc3VsdCBmbGF0
dmlld19yZWFkX2NvbnRpbnVlKEZsYXRWaWV3ICpmdiwgaHdhZGRyIGFkZHIsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNZW1UeEF0dHJzIGF0dHJzLCB2b2lk
ICpidWYsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIg
bGVuLCBod2FkZHIgYWRkcjEsIGh3YWRkciBsLA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTWVtb3J5UmVnaW9uICptcik7DQo+IC12b2lkICpxZW11X21hcF9y
YW1fcHRyKFJBTUJsb2NrICpyYW1fYmxvY2ssIHJhbV9hZGRyX3QgYWRkcik7DQo+ICAgDQo+
ICAgLyogSW50ZXJuYWwgZnVuY3Rpb25zLCBwYXJ0IG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBv
ZiBhZGRyZXNzX3NwYWNlX3JlYWRfY2FjaGVkDQo+ICAgICogYW5kIGFkZHJlc3Nfc3BhY2Vf
d3JpdGVfY2FjaGVkLiAgKi8NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9yYW1fYWRk
ci5oIGIvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgNCj4gaW5kZXggZTA2MjBkZGIwMy4uYzRm
MjIwYWU5MyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgNCj4gKysr
IGIvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgNCj4gQEAgLTczLDYgKzczLDcgQEAgdm9pZCBx
ZW11X3JhbV9zZXRfbWlncmF0YWJsZShSQU1CbG9jayAqcmIpOw0KPiAgIHZvaWQgcWVtdV9y
YW1fdW5zZXRfbWlncmF0YWJsZShSQU1CbG9jayAqcmIpOw0KPiAgIGJvb2wgcWVtdV9yYW1f
aXNfbmFtZWRfZmlsZShSQU1CbG9jayAqcmIpOw0KPiAgIGludCBxZW11X3JhbV9nZXRfZmQo
UkFNQmxvY2sgKnJiKTsNCj4gK3ZvaWQgKnFlbXVfbWFwX3JhbV9wdHIoUkFNQmxvY2sgKnJh
bV9ibG9jaywgcmFtX2FkZHJfdCBhZGRyKTsNCj4gICANCj4gICBzaXplX3QgcWVtdV9yYW1f
cGFnZXNpemUoUkFNQmxvY2sgKmJsb2NrKTsNCj4gICBzaXplX3QgcWVtdV9yYW1fcGFnZXNp
emVfbGFyZ2VzdCh2b2lkKTsNCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBp
ZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCg0K
