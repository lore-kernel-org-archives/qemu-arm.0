Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp518703njb;
        Wed, 4 Dec 2024 13:19:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVZISBH23iDhOXTRDrIAnSr8ukX//ruzvRB36x+kxSkxx2rnOZvITbHrRJYvExjBdsxEdNtNddBC1mZeg==@linaro.org
X-Google-Smtp-Source: AGHT+IFPzDVjd7ebrlGwwRcdVmQ8W7DOSI198q8HydE//Jq0P2fd4LuaS8/OwdbZMjUEvurMUZCk
X-Received: by 2002:a05:620a:4095:b0:7a9:c333:c559 with SMTP id af79cd13be357-7b6a61d679fmr879314985a.48.1733347183032;
        Wed, 04 Dec 2024 13:19:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733347183; cv=none;
        d=google.com; s=arc-20240605;
        b=cSG+pAWEdjS8+nFkl0iH3bVORegJCGQji0g9bNUygdFsIRHIq2fRcm0iwhql9vrFik
         OXBcvqGprRv0pJitkke1vZI6DHUgYf6eH5FOgTddO1nVBCfHCHfo0pYAizC5MUdy1W5Y
         4vFSkOX35fSGtfaS9pr+BVkL8T8F0PekMcE6keQuKQUS6NbZfKKvHUiG/n5qSbxurftr
         DwZbdlO60SThfblCwfApLjwikTdOK5ITkWfjK4poM1YIlPaTi4Fc+nqK6mZgpJEQREUY
         LXkQzS2/I8GM39EoLLo1GbYhhgEOm6FJoMbu0PvOY6RP9wFjskHyH524c0YJIaSspdI3
         C3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KTI/9IucZaFGkqc/5+leBrgyKsFBq4ZbaCj+m4V8J4g=;
        fh=iOh/ex4p5xs+zVjEy+qNnM+cB2Lu21VtYfEoWhDZ/NA=;
        b=celIw67+ZN367L/x4Hcus4t5U2fPxPIx7+qvlAJxvWZ1GYOIVO8denHJ/psNATZEfA
         QcEvnDY0XLfBH2SUzjQluE+r26MU6lzm6TCsPLITL262vt3Xp7X+8XkJYOrsxbYP+kAg
         kPRun+xOnDtMLrvnQEqytGAZdHkyNsR3Zf08Dv6AKhTUvDVZUTBkbDqxLB2Bq+srgmjj
         QYiPzT/EbNK113fJbqcXJMaYu0NZw25B+hI2cWYA50Cua3CuQh9XnWVTUK6QEAgifMgp
         u+9I7HUaqig+7i0vOYx8eijyaQd0217AQi5wOXIGcwBfRbJHcHhiuqwTdod35CDzviFa
         VMFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xyim2TqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684923f15si1787585285a.38.2024.12.04.13.19.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 13:19:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xyim2TqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIwmA-00011Q-BD; Wed, 04 Dec 2024 16:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tIwlz-00010g-DZ
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 16:19:03 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1tIwlx-0001fP-I8
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 16:19:03 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-215b4681c94so1636215ad.0
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 13:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733347140; x=1733951940; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KTI/9IucZaFGkqc/5+leBrgyKsFBq4ZbaCj+m4V8J4g=;
 b=xyim2TqZJbVNGYfvFh/umAACy6DbTCcph3eSvczVcj6znbMbHV58szeJimeKnvaJ2M
 4h140WGhq2DfirFyNO2SJJ7xPK3CcIjfHSjTl/U2uRKA2T7Y2ExIdxLVaclXEzGzq5Fx
 e8gwQStE64Mj246bT8SBHUCYGIIrKBeqsP8kv7HTJ/rJvmOOgcKMWgcDU8TymakEGfVo
 evGYNxfY7epSqgycWCuMg6mA4SMVrke5gf8Aemh2RWrrpKB80/zs4AVIuXlgSLTFzS7C
 5CoRfebhHXfPtX913vt1lNgafIl7o3uG0LDI/yP4Vy/bn1j01cO+ciW+ukFfWU1bG+UV
 UbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733347140; x=1733951940;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KTI/9IucZaFGkqc/5+leBrgyKsFBq4ZbaCj+m4V8J4g=;
 b=c71NyDDjzyb6GFa8F+k1JYa+y3ywbVIeNNd36yTtLG6/MjTFOPW0hff0nkhGQHIadk
 rPQ3Fc1uyMYRHQ9CMjsB7VewkFwMs6qNHihzMy7T9tVZxL3znIstI0o+dBe2iAbTV9Ft
 l85iKFsqerM5e3N4gfywuHM8qwB5lTu47hrDqur00NtEK97xcFJRQPDlukBVLe0U8e7C
 JzePM+ApFsFKf/85ST9lLXvmZVxmouDZ9J2tP8Uj2OE/zpdSPSko7+qI2gUASmI0EsJ9
 IsV1vW/g7/nU0KMyhZnVFGhWcvCmV49v0aUa/PiyavglxxnuFbs6DQyrVaICiBDaAf0i
 rXLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkUM1NpSUmRZyKbmUkpLrU7NjlFb7nHMN00k21LGME1DAAxrczMForAuyt2mV2m6gCkTzdNrYP8A==@nongnu.org
X-Gm-Message-State: AOJu0YxMgomplzEd0oqPb0Ik18M4hKbspNxJ6IA1mX44ElZ0A3N9HABT
 dq0k+WnQ/zN60KwG2KqHAXUwOnI1iXRQ0+JtN98KFXaPzXvCQXFYlQYcdr/qOM0=
X-Gm-Gg: ASbGncs7R2zWUXYM+Q4JPrUxIshf20aP7RfprLOsroJZMHMtQC2czsnS33KwPMLfXfE
 jvCWgwZcYJaLps9sVxoPs0yRFUGGei79EIraxmvJguOlQxCy0bOJUFY/pCaBqLQp15m7vYFX1ct
 61BETL3SY1ZPyvzM7MDPaiNdNRwLaPKjV6ZCFwDn5ZPQUwXp3KdgJc3iyQP6mpsj3XhTo+oUPzT
 YCRkRZI85m5BeYAzA7vKKYbeckKi0E4wAu1AXWVcv0aW+9XLAI3/TlXOxytUZSkKToQwtUpX+at
 3mTp2eICyH4w/DTZ5eBZrw==
X-Received: by 2002:a17:903:1790:b0:215:96bc:b681 with SMTP id
 d9443c01a7336-215bd17a9c8mr109614425ad.52.1733347139960; 
 Wed, 04 Dec 2024 13:18:59 -0800 (PST)
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net.
 [216.180.64.156]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254176f77dsm12805278b3a.53.2024.12.04.13.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 13:18:59 -0800 (PST)
Message-ID: <e1e78252-4f6f-4a2e-a980-f5fcd9a5f783@linaro.org>
Date: Wed, 4 Dec 2024 13:18:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/sbsa-ref: Require at least 2 GiB of RAM when
 RME feature enabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
References: <20241204205607.62592-1-philmd@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20241204205607.62592-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: wPF5BkFr5ilU

T24gMTIvNC8yNCAxMjo1NiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFdl
IGFyZSB3b3JraW5nIG9uIGFkZGluZyBSTUUgc3VwcG9ydCB0byBTQlNBIFJlZmVyZW5jZSBQ
bGF0Zm9ybS4NCj4gV2hlbiBSTUUgaXMgZW5hYmxlZCB0aGVuIFJNTSAoUmVhbG0gTWFuYWdt
ZW50IE1vbml0b3IpIHRha2VzIDEwNzJNQiBvZg0KPiBtZW1vcnkgZm9yIG93biB1c2UuIFdo
aWNoIGVuZHMgd2l0aCBmaXJtd2FyZSBwYW5pYyBvbiAxR0IgbWFjaGluZS4NCj4gDQo+IFJl
cG9ydCBhbiBlcnJvciBzbyB1c2VycyBkaXJlY3RseSBzdGFydCB3aXRoIG1vcmUgUkFNIGlu
IHRoaXMgY2FzZToNCj4gDQo+ICAgICQgcWVtdS1zeXN0ZW0tYWFyY2g2NCAtTSBzYnNhLXJl
ZiAtbSAxRyAtY3B1IG1heCx4LXJtZT1vbg0KPiAgICBxZW11LXN5c3RlbS1hYXJjaDY0OiBz
YnNhLXJlZjogUk1FIGZlYXR1cmUgcmVxdWlyZXMgYXQgbGVhc3QgMkdCIG9mIFJBTQ0KPiAN
Cj4gUmVwb3J0ZWQtYnk6IE1hcmNpbiBKdXN6a2lld2ljeiA8bWFyY2luLmp1c3praWV3aWN6
QGxpbmFyby5vcmc+DQo+IFN1Z2dlc3RlZC1ieTogTGVpZiBMaW5kaG9sbSA8bGVpZi5saW5k
aG9sbUBvc3MucXVhbGNvbW0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiB2MTogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDI0MTEyNjA4NDkyOC4yNTIwNjctMS1tYXJj
aW4uanVzemtpZXdpY3pAbGluYXJvLm9yZy8NCj4gLS0tDQo+ICAgaHcvYXJtL3Nic2EtcmVm
LmMgfCA3ICsrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3Nic2EtcmVmLmMgYi9ody9hcm0vc2JzYS1yZWYu
Yw0KPiBpbmRleCBlMzE5NWQ1NDQ5Ny4uNjY3NTFkMDgwNmMgMTAwNjQ0DQo+IC0tLSBhL2h3
L2FybS9zYnNhLXJlZi5jDQo+ICsrKyBiL2h3L2FybS9zYnNhLXJlZi5jDQo+IEBAIC01MSw2
ICs1MSw3IEBADQo+ICAgI2luY2x1ZGUgInFhcGkvcW1wL3FsaXN0LmgiDQo+ICAgI2luY2x1
ZGUgInFvbS9vYmplY3QuaCINCj4gICAjaW5jbHVkZSAidGFyZ2V0L2FybS9jcHUtcW9tLmgi
DQo+ICsjaW5jbHVkZSAidGFyZ2V0L2FybS9jcHUtZmVhdHVyZXMuaCINCj4gICAjaW5jbHVk
ZSAidGFyZ2V0L2FybS9ndGltZXIuaCINCj4gICANCj4gICAjZGVmaW5lIFJBTUxJTUlUX0dC
IDgxOTINCj4gQEAgLTc5NSw2ICs3OTYsMTIgQEAgc3RhdGljIHZvaWQgc2JzYV9yZWZfaW5p
dChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpDQo+ICAgICAgICAgICBvYmplY3RfdW5yZWYoY3B1
b2JqKTsNCj4gICAgICAgfQ0KPiAgIA0KPiArICAgIGlmIChjcHVfaXNhcl9mZWF0dXJlKGFh
NjRfcm1lLCBBUk1fQ1BVKHFlbXVfZ2V0X2NwdSgwKSkpDQo+ICsgICAgICAgICAgICAmJiBt
YWNoaW5lLT5yYW1fc2l6ZSA8IDIgKiBHaUIpIHsNCj4gKyAgICAgICAgZXJyb3JfcmVwb3J0
KCJzYnNhLXJlZjogUk1FIGZlYXR1cmUgcmVxdWlyZXMgYXQgbGVhc3QgMkdCIG9mIFJBTSIp
Ow0KPiArICAgICAgICBleGl0KDEpOw0KPiArICAgIH0NCj4gKw0KPiAgICAgICBtZW1vcnlf
cmVnaW9uX2FkZF9zdWJyZWdpb24oc3lzbWVtLCBzYnNhX3JlZl9tZW1tYXBbU0JTQV9NRU1d
LmJhc2UsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYWNoaW5lLT5y
YW0pOw0KPiAgIA0KDQpSZXZpZXdlZC1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2su
Ym91dmllckBsaW5hcm8ub3JnPg0KDQo=
