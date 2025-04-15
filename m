Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2824829njc;
        Tue, 15 Apr 2025 10:34:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvyywmGEn6aHZnuPIr7Z8nu8GG3zCNqmdNguCpV5w5MyTpQl/MoZC6zFWMJrwU0TmfADFvRIGf0FYNyA==@linaro.org
X-Google-Smtp-Source: AGHT+IF/6G9T2wq+G9kuKV6nXATVYkaosYvF6Zq1RQr+B7GtPCqycwpjH11bL8P0N+Pam6grjv0o
X-Received: by 2002:a05:622a:114:b0:476:8cef:4f0e with SMTP id d75a77b69052e-47ad3a3b807mr2407551cf.29.1744738480379;
        Tue, 15 Apr 2025 10:34:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744738480; cv=none;
        d=google.com; s=arc-20240605;
        b=ZSQ1FO+NwuNqr+4oAz+hur/9L7zW3PZpO9/ecQ9MUKrN0ZGfTqEd4HpCjBQp4Jy4a4
         kqalOiXAWXFze/o0xs5NgMqsY3CwCa9MBwECpVaXhiiwiHmxHa6dv/f/9Ea7EZ5boKHK
         VTILppWop+BKDymR0NK3Q6WIu2EZthUP4ojjFI1+ola124nqsd5gmCj2Te3biPTvFdLq
         3dVGEj0UZq8tdjMZNQ86fwO4BGLRWYOxgRI7jkMIwrym8H4O+4MA2g45XL3CQnI4LdpS
         2pKlmIAsfqhXe8EovWevNh0tZlZ5Ha+3gmQTBUVUKaN+kbJjfG/wMTiUwrYJl4M021/c
         /xqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Iw7U8LkCps6BV/SLXTPygAsXSQHAsbinizmQdDwiW8E=;
        fh=HPz6dvc5x9HI+rxPx1Z7XfF1q/3Fv4iZd3d/6Yt/gkY=;
        b=eYuBDgI8o9FVctLOJsbVxa0VibNxq3Ig6tG+X6zm1L2JEBw3IPRBkeVsn39WJhUL2M
         nA4uXQlqRPs7f8yriLSuYCuAlOxxXyTvKGZudXkTilDlC9Y1ULLgPI+Djm4qV7Tz6zbk
         zfZRi0I7Fe/xN9+3jc6vn2Ywe81KhLX/hg4f82ezE8h5HcVyBD98V4Euwo1la7fJdItS
         9qSNsDJELhu44WpKcQmlSj5fFfJqUKr/du0hfVZT/qO1dKSGh+X1N9Y3Fl4w2p5Vtfli
         hySBEaDxe95YDAVGQvr8WPWW1siWsdloUMhxGPb6qTzuF6YtMtfNshLDL4qLoPaTe2un
         WK6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9s50cVY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796ede5951si115144191cf.497.2025.04.15.10.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 10:34:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9s50cVY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4kAp-0005Sj-Q2; Tue, 15 Apr 2025 13:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u4kAT-0005NB-Me
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 13:33:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u4kAR-0000rN-PQ
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 13:33:53 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so1012483b3a.2
 for <qemu-arm@nongnu.org>; Tue, 15 Apr 2025 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744738429; x=1745343229; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Iw7U8LkCps6BV/SLXTPygAsXSQHAsbinizmQdDwiW8E=;
 b=P9s50cVYj2j4/ULvDsvwglCJK6QyCMm9ddTzpHv4yjI0mC2m+Pi7y+Ew4TEpY5aos4
 0USDxrkYbiD5PXhZwRzk2u66v/cikzI5XN1TYIvzHjXBOwJD14ryy2YexlzMGwPksGip
 9gCGZTRtzb8CA0ggzr94TEtE1z+Yjosw/qpmluO4BpBNp+yKXxYtgwzoMVQsdKrpB3CY
 ad9tVIEhtWDb256Z4lfh8WNN9mUqTWon/fQvh5++DfaY9XDIkWlx8vJUtunOxzeg9yTv
 YXUPO/Do0M01nQolQHKEBXhXWVwhnG86GKjnCEEfva7zlNlP5TIycsAMCewXJk6V4lvm
 i2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744738429; x=1745343229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iw7U8LkCps6BV/SLXTPygAsXSQHAsbinizmQdDwiW8E=;
 b=Xcdk7+wDD6yRgdtxf6DKMgFqQK8ECMaW3iSHe0TTsooKyKgRmsozSu4SSQwj3HxK38
 tDsaOL9Lx7N9lU1FvWnChFPFGZtYiqEfcTnxYcIOfBZETVJAZ7eSsiA4WK8j5KKx+lvP
 JnRzRQyhdFTsQP1/ubNbgfOw+WbUa+WGSmP0/1DtGrpLVZRVEr2ij9P+eKD3kZJOWrHO
 /CxjBD5X8Q7kht8ImWa4GCD7VcHXxQBFIJ3sdF5V/vFWkOeGD5D0ezv5DFKblYfcBRyg
 VYDHV2CwFTY4yeW2CNpQ+d4VI9pqopSBcsT2tp59jc49FYn+bOS44PklbhforIwB2KWS
 2HtQ==
X-Gm-Message-State: AOJu0Yzs0LMfcbfTOtnmSTOrcrnT60pp7Y8TWDsL98SKpzEbN424cx8w
 qTryDAeBjO7n6Fqv0Mb/u35i0HPc8vnhkupnpmELyv/fwx33SwzhRHU/iejfpIw=
X-Gm-Gg: ASbGncuADlH0BQiHw/ds8/3Lyx3KVjoovrYbrgKNr9A+f2FYjhGOFDKIPKYhaDQpU5t
 IKpGRigTEVYRscuHunpg0X6fGnMCaQPOVKLzK8BbCz71EENdUEpCD6ITNdgAGoTXbg7XeRy8HLU
 jBHOcyXcp6vGqDmh/6SxGJpgiiL1GoaWa7wLsDCjhDADQb/nQZBtBAM+bQY3uB8Y8D3f7h8ElvV
 1X0ReOkERfAE+N9/6b5UvO5lqmTYY1zfD3Y//QQn5sYNMag04DZCKhSeTtnHjtbcYQsfBe74VWz
 /FdZuB9NIoLjNOm3gZ0lFv9w/v9oMvTaDkWaOLltL77u3iJO6CZg3A==
X-Received: by 2002:a05:6a21:2d0b:b0:1f5:7e57:501c with SMTP id
 adf61e73a8af0-201799978damr22327197637.39.1744738428967; 
 Tue, 15 Apr 2025 10:33:48 -0700 (PDT)
Received: from [192.168.1.87] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b02a0cf374asm11192444a12.26.2025.04.15.10.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 10:33:48 -0700 (PDT)
Message-ID: <cc88f38e-d08a-4d2f-925f-03061b44b516@linaro.org>
Date: Tue, 15 Apr 2025 10:33:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] target/arm: Replace target_ulong -> uint64_t for
 HWBreakpoint
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>
References: <20250415172246.79470-1-philmd@linaro.org>
 <20250415172246.79470-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250415172246.79470-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: igx9ACPRp1Pj

T24gNC8xNS8yNSAxMDoyMiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IENQ
VUFSTVN0YXRlOjpwYyBpcyBvZiB0eXBlIHVpbnQ2NF90Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiAtLS0N
Cj4gICB0YXJnZXQvYXJtL2ludGVybmFscy5oICAgfCA2ICsrKy0tLQ0KPiAgIHRhcmdldC9h
cm0vaHlwX2dkYnN0dWIuYyB8IDYgKysrLS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0
L2FybS9pbnRlcm5hbHMuaCBiL3RhcmdldC9hcm0vaW50ZXJuYWxzLmgNCj4gaW5kZXggMTc1
ZmI3OTIzNzUuLjA1Y2ViOWJjZjVkIDEwMDY0NA0KPiAtLS0gYS90YXJnZXQvYXJtL2ludGVy
bmFscy5oDQo+ICsrKyBiL3RhcmdldC9hcm0vaW50ZXJuYWxzLmgNCj4gQEAgLTE5NDIsOSAr
MTk0Miw5IEBAIGV4dGVybiBHQXJyYXkgKmh3X2JyZWFrcG9pbnRzLCAqaHdfd2F0Y2hwb2lu
dHM7DQo+ICAgI2RlZmluZSBnZXRfaHdfYnAoaSkgICAgKCZnX2FycmF5X2luZGV4KGh3X2Jy
ZWFrcG9pbnRzLCBIV0JyZWFrcG9pbnQsIGkpKQ0KPiAgICNkZWZpbmUgZ2V0X2h3X3dwKGkp
ICAgICgmZ19hcnJheV9pbmRleChod193YXRjaHBvaW50cywgSFdXYXRjaHBvaW50LCBpKSkN
Cj4gICANCj4gLWJvb2wgZmluZF9od19icmVha3BvaW50KENQVVN0YXRlICpjcHUsIHRhcmdl
dF91bG9uZyBwYyk7DQo+IC1pbnQgaW5zZXJ0X2h3X2JyZWFrcG9pbnQodGFyZ2V0X3Vsb25n
IHBjKTsNCj4gLWludCBkZWxldGVfaHdfYnJlYWtwb2ludCh0YXJnZXRfdWxvbmcgcGMpOw0K
PiArYm9vbCBmaW5kX2h3X2JyZWFrcG9pbnQoQ1BVU3RhdGUgKmNwdSwgdWludDY0X3QgcGMp
Ow0KPiAraW50IGluc2VydF9od19icmVha3BvaW50KHVpbnQ2NF90IHBjKTsNCj4gK2ludCBk
ZWxldGVfaHdfYnJlYWtwb2ludCh1aW50NjRfdCBwYyk7DQo+ICAgDQo+ICAgYm9vbCBjaGVj
a193YXRjaHBvaW50X2luX3JhbmdlKGludCBpLCB0YXJnZXRfdWxvbmcgYWRkcik7DQo+ICAg
Q1BVV2F0Y2hwb2ludCAqZmluZF9od193YXRjaHBvaW50KENQVVN0YXRlICpjcHUsIHRhcmdl
dF91bG9uZyBhZGRyKTsNCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9hcm0vaHlwX2dkYnN0dWIu
YyBiL3RhcmdldC9hcm0vaHlwX2dkYnN0dWIuYw0KPiBpbmRleCAxZTg2MTI2M2IzZC4uNGU1
MmQzN2VkODAgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9hcm0vaHlwX2dkYnN0dWIuYw0KPiAr
KysgYi90YXJnZXQvYXJtL2h5cF9nZGJzdHViLmMNCj4gQEAgLTU0LDcgKzU0LDcgQEAgR0Fy
cmF5ICpod19icmVha3BvaW50cywgKmh3X3dhdGNocG9pbnRzOw0KPiAgICAqIGhlcmUgc28g
ZnV0dXJlIFBDIGNvbXBhcmlzb25zIHdpbGwgd29yayBwcm9wZXJseS4NCj4gICAgKi8NCj4g
ICANCj4gLWludCBpbnNlcnRfaHdfYnJlYWtwb2ludCh0YXJnZXRfdWxvbmcgYWRkcikNCj4g
K2ludCBpbnNlcnRfaHdfYnJlYWtwb2ludCh1aW50NjRfdCBhZGRyKQ0KPiAgIHsNCj4gICAg
ICAgSFdCcmVha3BvaW50IGJyayA9IHsNCj4gICAgICAgICAgIC5iY3IgPSAweDEsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiBCQ1IgRT0xLCBlbmFibGUgKi8NCj4gQEAgLTgw
LDcgKzgwLDcgQEAgaW50IGluc2VydF9od19icmVha3BvaW50KHRhcmdldF91bG9uZyBhZGRy
KQ0KPiAgICAqIERlbGV0ZSBhIGJyZWFrcG9pbnQgYW5kIHNodWZmbGUgYW55IGFib3ZlIGRv
d24NCj4gICAgKi8NCj4gICANCj4gLWludCBkZWxldGVfaHdfYnJlYWtwb2ludCh0YXJnZXRf
dWxvbmcgcGMpDQo+ICtpbnQgZGVsZXRlX2h3X2JyZWFrcG9pbnQodWludDY0X3QgcGMpDQo+
ICAgew0KPiAgICAgICBpbnQgaTsNCj4gICAgICAgZm9yIChpID0gMDsgaSA8IGh3X2JyZWFr
cG9pbnRzLT5sZW47IGkrKykgew0KPiBAQCAtMjI2LDcgKzIyNiw3IEBAIGludCBkZWxldGVf
aHdfd2F0Y2hwb2ludCh0YXJnZXRfdWxvbmcgYWRkciwgdGFyZ2V0X3Vsb25nIGxlbiwgaW50
IHR5cGUpDQo+ICAgICAgIHJldHVybiAtRU5PRU5UOw0KPiAgIH0NCj4gICANCj4gLWJvb2wg
ZmluZF9od19icmVha3BvaW50KENQVVN0YXRlICpjcHUsIHRhcmdldF91bG9uZyBwYykNCj4g
K2Jvb2wgZmluZF9od19icmVha3BvaW50KENQVVN0YXRlICpjcHUsIHVpbnQ2NF90IHBjKQ0K
PiAgIHsNCj4gICAgICAgaW50IGk7DQo+ICAgDQoNClJldmlld2VkLWJ5OiBQaWVycmljayBC
b3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==
