Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2823617njc;
        Tue, 15 Apr 2025 10:32:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPMgAeklNrByKBRl/bhYpznHzdOr395RfkmgikM0Uhv9ZydZ6zWZsg0sQIt8F+J2oN2zeIHVoclKDWCA==@linaro.org
X-Google-Smtp-Source: AGHT+IHFnn/zIFnbM//aOS9+S/s2gxGgNHn8rhk+DEzawtU0BsYFEieZXsJg2FrNZcRXbAAckHTv
X-Received: by 2002:a05:6122:2202:b0:50a:c70b:9453 with SMTP id 71dfb90a1353d-527c35ec812mr10690280e0c.10.1744738368676;
        Tue, 15 Apr 2025 10:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744738368; cv=none;
        d=google.com; s=arc-20240605;
        b=cXmZJlgUmiN1I5jtIjl94NRd7BvYXAZIDJEcM+TpQJzXoHPFFsYA46PEUygQI81qtb
         R3kUAMegxkzerFL5VdImRlbzgapiVX6+41ZGUVc5gL1nhQQe3Ei+pWQ1cndIrxmXZxOU
         OQpDSLIms5N6XH2KFSXTkwMpO2aT0nE/IAa+4MQTXnyX5FoG37XI4hOQjLCE0bYZevBB
         khyqmrdOaKYtSGOWjAYFYWdRfwaGYnEAphMogPcIaG+eshCGt6xF/dAyuAxXnpbem22o
         W9e+dtKe8k2hVrHt1LzxqzZ1QRe8SXlEP2Uy17mXoRDhQcW+zUCXZNVD027AXGCWss7G
         L3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bCmVMDVljO40oRkPaHY3BRhSfb9wLUefJVNXmI0711A=;
        fh=HPz6dvc5x9HI+rxPx1Z7XfF1q/3Fv4iZd3d/6Yt/gkY=;
        b=aDlL7XT87DEDKik52iml3Yk28D47z8Ak6bp50kJTch73n/RpuWxPFXnkJbYMxwKtse
         sTBW7Lhgcogv8rEuV4Zhvd7fhrHzCZPUPbKgs4+52QuSJL4XZVmxfP7/4A6bvMz/idkj
         N1Oxa30PYd3/KDh/BBILejkD18q+TIFMqoQZNW2ZMlpb/ShbqvWeMoAw28rSwNJrLEGp
         j47V1rtLHEfXgbwDWNswbfuW2n9Np95+MH2RgaK+Kfy8cwCyviWSHZ/KRoCa/e773UXF
         DlQAi6sSm6qXsc8609eQPVZD8fBKJsg+qHEjZIdUFnImYmN7XywOnN1Ahb983hHBQF6X
         9oKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgzWFHtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-527abeae1e8si4409232e0c.265.2025.04.15.10.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 10:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgzWFHtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4k9I-0004vw-JN; Tue, 15 Apr 2025 13:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u4k8T-0004rN-5L
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 13:31:53 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u4k8Q-0000hQ-Nf
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 13:31:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-224171d6826so82494435ad.3
 for <qemu-arm@nongnu.org>; Tue, 15 Apr 2025 10:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744738303; x=1745343103; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bCmVMDVljO40oRkPaHY3BRhSfb9wLUefJVNXmI0711A=;
 b=OgzWFHtB7APy+NVyyHHOSQCiJb/d1aeQzyLCNRE717r2HGV23J13DOaccHeL7OoQJa
 xhHdPqxo9DPfh7DF3CCuocIIspEnioxSgEapg1sqqtDHHThYF6vGvo1egL8gerGNl5e3
 FsMsbUbUjpVnCbWoFCC/ES7rDb8lmQ6PqNafzBLq23yvQb9UYu7h6KMKxBzcW+E2A0Hk
 SljFqbgfEU/1dsxQZWQqTvPjsAdpqyQyzWr1B10RZGiBL30GM1ilXIp149bE+jXugZQe
 JtGEdR/lyrQZoDLZyuLi4u8HNLAyaa/Z11Sr6X75qmJiPAPQxuC3ObZR3t1qTrE8M0+z
 F1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744738303; x=1745343103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bCmVMDVljO40oRkPaHY3BRhSfb9wLUefJVNXmI0711A=;
 b=S4UYkel+BVtgU6Q0R03NndZkiY8Tl1OsmOfeSHQQrz8MmXTFh+AU8N/2IfLYM9RnG8
 urXlcW7wruKfxmuZSMzvizqQP7kPZZTNS9REkXpBPgj0Jd4eEj+8z6f7CRraEHJvoNF7
 ZLJHoVtF9sYTqyeiNUo5yP8y5BvD1btlilXh7D1ug6lLHiUpH2ZdMHI5L83kfNuCAGhK
 IXlLlAnO0i6j06YxRT+4SWbGQSwxHLPdGD/5tg5g0T/9mg74jaXXFvFeOQ+878dqH13q
 romy9PRmWoRvRNy13Lg7Oy1vGxgwbggNQq00o3dXHfJbNX0gCOLeXsAPbUt8ksPshYkS
 5wIw==
X-Gm-Message-State: AOJu0Yw01ZvWiwDjpwdSkZbtpXbY4E5I6XLYGpduXdYyqb8Yh00eFjkV
 d5DBouk/X4VSbJFnT+j6twOwVOxwS8xm98+gnd3osoQfaCURakCNym/uqekp1pc=
X-Gm-Gg: ASbGncusL3ckMXyfY4SVGzS89XHWC3qawJ88iDPzar+AWEeqqinvtg6wh5+6VyV38Zu
 wTqLs1XMxxBiQxqizRjvI3buhpcJFuGpL1Fmm50zj5dlgAjv4Zz3FnzaKrPSVSFYdxJnyCKChpE
 dch6GbK4p+ONpfW2Q6tGjBVvMmHt6Xj0omq2Am2rogz4batq0CQOb5EB1d/689luhtz2/0U0pJB
 mbyfpX3/vJs3GOvL2wzdbCWu/+I1ipTTV68usGkSYZZGsNSAgZXy461oOFDQXxw6CxMrfmGbGdM
 LiKsP2cS+BkgtzZK65mr7qCfsX9Wtn52aOAkDiDTgEB3GedJVDOxz/fOWOBH7in2
X-Received: by 2002:a17:902:f552:b0:223:5c33:56a8 with SMTP id
 d9443c01a7336-22bea4ff1f5mr264413265ad.35.1744738302944; 
 Tue, 15 Apr 2025 10:31:42 -0700 (PDT)
Received: from [192.168.1.87] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22ac7b6284dsm121065315ad.38.2025.04.15.10.31.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 10:31:42 -0700 (PDT)
Message-ID: <4fdcd3ae-71ac-42f3-94e7-c6d767448597@linaro.org>
Date: Tue, 15 Apr 2025 10:31:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] target/arm: Replace target_ulong -> hwaddr in
 ARMMMUFaultInfo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>
References: <20250415172246.79470-1-philmd@linaro.org>
 <20250415172246.79470-2-philmd@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250415172246.79470-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: SA8k1kVE9IpA

T24gNC8xNS8yNSAxMDoyMiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFNp
Z25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9y
Zz4NCj4gLS0tDQo+ICAgdGFyZ2V0L2FybS9pbnRlcm5hbHMuaCB8IDUgKysrLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL3RhcmdldC9hcm0vaW50ZXJuYWxzLmggYi90YXJnZXQvYXJtL2ludGVy
bmFscy5oDQo+IGluZGV4IDI4NTg1YzA3NTU1Li4xNzVmYjc5MjM3NSAxMDA2NDQNCj4gLS0t
IGEvdGFyZ2V0L2FybS9pbnRlcm5hbHMuaA0KPiArKysgYi90YXJnZXQvYXJtL2ludGVybmFs
cy5oDQo+IEBAIC0yNSw2ICsyNSw3IEBADQo+ICAgI2lmbmRlZiBUQVJHRVRfQVJNX0lOVEVS
TkFMU19IDQo+ICAgI2RlZmluZSBUQVJHRVRfQVJNX0lOVEVSTkFMU19IDQo+ICAgDQo+ICsj
aW5jbHVkZSAiZXhlYy9od2FkZHIuaCINCj4gICAjaW5jbHVkZSAiZXhlYy9icmVha3BvaW50
LmgiDQo+ICAgI2luY2x1ZGUgImh3L3JlZ2lzdGVyZmllbGRzLmgiDQo+ICAgI2luY2x1ZGUg
InRjZy90Y2ctZ3ZlYy1kZXNjLmgiDQo+IEBAIC03MjQsOCArNzI1LDggQEAgdHlwZWRlZiBz
dHJ1Y3QgQVJNTU1VRmF1bHRJbmZvIEFSTU1NVUZhdWx0SW5mbzsNCj4gICBzdHJ1Y3QgQVJN
TU1VRmF1bHRJbmZvIHsNCj4gICAgICAgQVJNRmF1bHRUeXBlIHR5cGU7DQo+ICAgICAgIEFS
TUdQQ0YgZ3BjZjsNCj4gLSAgICB0YXJnZXRfdWxvbmcgczJhZGRyOw0KPiAtICAgIHRhcmdl
dF91bG9uZyBwYWRkcjsNCj4gKyAgICBod2FkZHIgczJhZGRyOw0KPiArICAgIGh3YWRkciBw
YWRkcjsNCj4gICAgICAgQVJNU2VjdXJpdHlTcGFjZSBwYWRkcl9zcGFjZTsNCj4gICAgICAg
aW50IGxldmVsOw0KPiAgICAgICBpbnQgZG9tYWluOw0KDQpSZXZpZXdlZC1ieTogUGllcnJp
Y2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0KDQo=
