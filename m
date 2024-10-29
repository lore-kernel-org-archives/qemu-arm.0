Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp390765njj;
        Tue, 29 Oct 2024 09:55:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5T/HSe5gdRyy//HMgAclYr2wwaHF4gNnRUTBFmJVnRTKd52RdZOG2HoASpQV6tlMuzDlKv22bwq32YA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZec+zyo0ebhDlfeGxZIlJfgU5TS4/TWgpk1GEeAMAfxq4wuhc3ErVgvgwL20x59QGLqNt
X-Received: by 2002:a05:6122:2226:b0:50a:cb38:31d5 with SMTP id 71dfb90a1353d-5101511cefemr10261225e0c.12.1730220911619;
        Tue, 29 Oct 2024 09:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730220911; cv=none;
        d=google.com; s=arc-20240605;
        b=OnvYBpdG0VIZ1IYcmY8+2BwSTkxWMwiWvdJY/7WzNws9QOECQr7bwh7k0kOJ4it9OU
         6D6cOFKE1u3EsaiNN04JxLO7f6koJxrDxFfJcpij99SwQb2kqhOskkgvDeoYzjP2JhVj
         a7uRO/np3UYlu/NXjDr0v2m1LkM/c9o1v+oVM4q0ekpw1Tzg9SMpd1HuZtacnVa+aIZv
         xWJOeiJluuuiyFEinmNETUgXOTyUFe/wvOkYegH9pc2w1NXODm9rYv6btQC0cmmYPmvM
         /7oOo2P51rSGir2C7eKwfiux66BUePbvIkyDc86b3L8Np6iWxut2vY1P45If0zvNKArA
         c5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q6yJ6bEqQS0ShyIaPTylVb6oevprVC/BuMW8lPKV1hI=;
        fh=CVjI828JK1ERWJmDL5l77/zkfrTk9Jgzfxjk1QD2qUg=;
        b=VRlmfvQr3NRnLs2QFa4nNgoWj6T/4Yz2ysGwfikmVQ0EYYcGUa3IhV9hsxUrR1Glzk
         cWEXVumjS7cgU4Rjuk+JWIDWXCwRceZBvOLia1Ow2wbx8/XvDOYvyuhDrfZ/66geTvQu
         tJzbN0BHA+/p0tuuW9HOLGWY53A8f9cUos90aRLFevJ0p/TJ9T/1WFLeYX5ETMoH8RBI
         Hbliihc4L5jUyWr7WFVudQZHxUq0UN2uLhsyYORkgChtu2joJb448CmuJpYmxgZsvgMm
         auD1XI8ddRYgPQ/RuwecdJOYm1NnoNTUaNj57NjCwmkkiIUGnTZA9/bod7zNBygDt5m2
         /XRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wJW0QMCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d265b62si1150736785a.26.2024.10.29.09.55.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 09:55:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wJW0QMCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5pUq-0006Rz-Ly; Tue, 29 Oct 2024 12:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t5pUf-0006Ny-8G
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 12:54:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1t5pUa-0003MZ-Qx
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 12:54:54 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-20c714cd9c8so59327475ad.0
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 09:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730220891; x=1730825691; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q6yJ6bEqQS0ShyIaPTylVb6oevprVC/BuMW8lPKV1hI=;
 b=wJW0QMCMbBxgRLovxKZa2WinyyvPNiJJPogatspBj8+FHOxEdSTi2Ao1dG9DCaUkPC
 vmEeecK7QEwJmOS734978cQQWw7ENu7V/PEugJXP75ptUpKko/yLDdKvcR10wQuuHy70
 GqDF+xkDzVJrqQq2dsOtmd7XDA7B4gwyRp1iLC/caryYlUKxc6Y49sHpn7dGGavOeZfW
 FEKIVwjxbJr86d6xU5KuqWk4EzqkddeJTHsbTvEye4FZsG1kxcel+1i5K5K8QH9gW+GC
 Ut1FDN5BR+PF69E4T4f/IpfvBMb7TksqjeCu3l08CnxgUWOgDbm0K6jYd3qtdOAM+RMo
 heLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730220891; x=1730825691;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q6yJ6bEqQS0ShyIaPTylVb6oevprVC/BuMW8lPKV1hI=;
 b=VL36Ixp0NhHAS5hce0XEI8C5ta0uJErGFbNZ1KSgNUiCziwlM7MGMIU/ZR4qmGJdKA
 XctosBjLHnbIL/7UYTFBtT7cqsnwGk3UEX7ZhDJpeDly6UCbQdQMGleC8FlrEiv1+XAu
 jFNa29RfhaMuR9q2PBCH6bzmNlb128JZJT4vrcypVEfCfFVZC39korhY+p4WBgRhLX/Q
 dijw6X/TNpkBM7jAS+9JVFtA3lBY0GEZwOrcHk6Lwj7DXN0ZH2dX8IG/H92nZK9hC6wh
 /DiwO0CCaqJR7fUOpipqsTgvO0OThbbun2BVLA3RCmZGTRoPSI2I6dh5bVz8N8ksgavw
 uMQg==
X-Gm-Message-State: AOJu0YyglO2+jjBLKtm9BcDULI6nwHKZ/fBYkALxWezBPJ+I1A+BUvg2
 st2B2dwQPmdVEyggUVNxyyvG5VIMfEakXJvYRtPTtmDUD5uLpjGIHqIqcvJF92I=
X-Received: by 2002:a17:902:f790:b0:20f:b54f:400e with SMTP id
 d9443c01a7336-210c6cde236mr147446705ad.61.1730220890736; 
 Tue, 29 Oct 2024 09:54:50 -0700 (PDT)
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net.
 [216.180.64.156]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc045774sm68572665ad.242.2024.10.29.09.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 09:54:50 -0700 (PDT)
Message-ID: <ba2ee186-4b13-47ec-822a-23a4735a8b54@linaro.org>
Date: Tue, 29 Oct 2024 09:54:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Convert the BananaPi and OrangePi Avacodo tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Joel Stanley <joel@jms.id.au>
References: <20241029092440.25021-1-thuth@redhat.com>
 <c5ff463d-c5fb-4d00-95fc-f3c3ce9178d5@linaro.org>
 <c95b7e5f-0345-4648-bae7-285ecde8dfd8@redhat.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <c95b7e5f-0345-4648-bae7-285ecde8dfd8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: jI6sHaD+4OCD

T24gMTAvMjkvMjQgMDk6NTAsIFRob21hcyBIdXRoIHdyb3RlOg0KPiBPbiAyOS8xMC8yMDI0
IDE3LjMxLCBQaWVycmljayBCb3V2aWVyIHdyb3RlOg0KPj4gSGkgVGhvbWFzLA0KPj4NCj4+
IE9uIDEwLzI5LzI0IDAyOjI0LCBUaG9tYXMgSHV0aCB3cm90ZToNCj4+PiBTb21lIG9mIHRo
ZSBVUkxzIGluIHRoZSBBdm9jYWRvIHRlc3RzIHN0b3BwZWQgd29ya2luZyBzaW5jZSB0aGUN
Cj4+PiBvcmlnaW5hbCBhc3NldHMgaGF2ZSBiZWVuIHJlbW92ZWQgZnJvbSB0aGUgc2VydmVy
cyBvciBtb3ZlZCBsb2NhdGlvbiwNCj4+PiBzZWU6DQo+Pj4NCj4+PiAgwqAgaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC9DQUNQSzhYYz1qc3o1aVRfV1I3cy0NCj4+PiBy
Y3UxY1J6cnlpSystMG89NnZVS19EX3FNTXJQM0FAbWFpbC5nbWFpbC5jb20vDQo+Pj4NCj4+
PiBTaW5jZSB3ZSBhcmUgY3VycmVudGx5IGluIHByb2dyZXNzIG9mIGNvbnZlcnRpbmcgdGhl
IEF2b2NhZG8gdGVzdHMNCj4+PiB0byB0aGUgbmV3IGZ1bmN0aW9uYWwgZnJhbWV3b3JrLCB0
aGlzIGlzIGEgZ29vZCBvcHBvcnR1bml0eSB0byBjb252ZXJ0DQo+Pj4gdGhlc2UgdGVzdHMg
YW5kIGFkanVzdCB0aGUgVVJMcyAoYW5kIGhhc2hzdW1zKSBhbG9uZyB0aGUgd2F5IHRvIG1h
a2UNCj4+PiB0aGVzZSB0ZXN0cyB3b3JrIGFnYWluLg0KPj4+DQo+Pj4gVGhvbWFzIEh1dGgg
KDIpOg0KPj4+ICDCoMKgIHRlc3RzL2Z1bmN0aW9uYWw6IENvbnZlcnQgQmFuYW5hUGkgdGVz
dHMgdG8gdGhlIGZ1bmN0aW9uYWwgZnJhbWV3b3JrDQo+Pj4gIMKgwqAgdGVzdHMvZnVuY3Rp
b25hbDogQ29udmVydCB0aGUgT3JhbmdlUGkgdGVzdHMgdG8gdGhlIGZ1bmN0aW9uYWwNCj4+
PiAgwqDCoMKgwqAgZnJhbWV3b3JrDQo+Pj4NCj4+PiAgwqAgTUFJTlRBSU5FUlPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEg
Kw0KPj4+ICDCoCB0ZXN0cy9hdm9jYWRvL2Jvb3RfbGludXhfY29uc29sZS5wecKgwqAgfCA0
MTEgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+PiAgwqAgdGVzdHMvZnVuY3Rpb25h
bC9tZXNvbi5idWlsZMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICsNCj4+PiAgwqAgdGVz
dHMvZnVuY3Rpb25hbC9xZW11X3Rlc3QvdXRpbHMucHnCoMKgIHzCoCAyMSArKw0KPj4+ICDC
oCB0ZXN0cy9mdW5jdGlvbmFsL3Rlc3RfYXJtX2JwaW0ydS5wecKgwqAgfCAyMDYgKysrKysr
KysrKysrKw0KPj4+ICDCoCB0ZXN0cy9mdW5jdGlvbmFsL3Rlc3RfYXJtX29yYW5nZXBpLnB5
IHwgMjcwICsrKysrKysrKysrKysrKysrDQo+Pj4gIMKgIDYgZmlsZXMgY2hhbmdlZCwgNTAy
IGluc2VydGlvbnMoKyksIDQxMSBkZWxldGlvbnMoLSkNCj4+PiAgwqAgY3JlYXRlIG1vZGUg
MTAwNzU1IHRlc3RzL2Z1bmN0aW9uYWwvdGVzdF9hcm1fYnBpbTJ1LnB5DQo+Pj4gIMKgIGNy
ZWF0ZSBtb2RlIDEwMDc1NSB0ZXN0cy9mdW5jdGlvbmFsL3Rlc3RfYXJtX29yYW5nZXBpLnB5
DQo+Pj4NCj4+DQo+PiBJIGhhdmUgYSBnZW5lcmFsIHF1ZXN0aW9uIHJlZ2FyZGluZyB0ZXN0
cyBpbiBRRU1VLg0KPj4gSXMgdGhlIGN1cnJlbnQgZ29hbCB0byBjb252ZXJ0IGFsbCBhdm9j
YWRvIHRlc3RzIHRvIGZ1bmN0aW9uYWwgb25lcywgYW5kDQo+PiB0aGVuIHJlbW92ZSBhdm9j
YWRvIGZyb20gY29kZWJhc2U/DQo+IA0KPiBZZXMsIEkgdGhpbmsgdGhhdCdzIHRoZSBiZXN0
IHdheSB0byBtb3ZlIGZvcndhcmQuIEl0J3Mgd2VpcmQgdG8gaGF2ZSB0d28NCj4gdGVzdCBy
dW5uZXJzIGluIFFFTVUgZm9yIHRoZSB0ZXN0cywgYW5kIHNpbmNlIHdlJ3JlIGFscmVhZHkg
dXNpbmcgdGhlIG1lc29uDQo+IHRlc3QgcnVubmVyIGZvciBhbG1vc3QgZXZlcnl0aGluZyBl
bHNlLCB3ZSBzaG91bGQgY29udGludWUgdGhpcyB0cmFuc2l0aW9uLg0KPiANCg0KU291bmRz
IGdvb2QuIEluIG15IGV4cGVyaWVuY2UsIGl0J3MgYSBiaXQgYW5ub3lpbmcgdG8gbm90IGJl
IGFibGUgdG8gDQpwcmVjYWNoZSBlYXNpbHkgYXNzZXRzIGZvciBhdm9jYWRvIHRlc3RzLg0K
DQo+ICAgIFRob21hcw0KPiANCg==
