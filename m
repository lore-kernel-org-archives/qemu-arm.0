Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1223662njf;
        Mon, 2 Sep 2024 13:23:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVblyEc6HJXj2Nrfu2yuAUlKe+cMIA8UknxXK2L+MdhfX20cLqEuVHbHy7QjN0/Jk2NDxTZekPlZEVdaA==@linaro.org
X-Google-Smtp-Source: AGHT+IH/b0w5nZi6auwPFDFfEueD+LNbQkgmfPZmCFwJrtRUXLPOp0O/KUcnLex4FpBfV6XsgIGK
X-Received: by 2002:a05:6214:2387:b0:6b7:923c:e0b7 with SMTP id 6a1803df08f44-6c33f3a4170mr286711876d6.21.1725308606665;
        Mon, 02 Sep 2024 13:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725308606; cv=none;
        d=google.com; s=arc-20160816;
        b=GNDms7hYt42B0dqXfS9o8Gk3fim0RSB1ioSZkvz8BhdpR6g/fsfioJUBYFda9q43sw
         UhN0ViVLafoUlC42VPCiJLTsIAx7qGco0y2TS7y73DYt3YUPBDSIPpLAM9hJHrHFFgFa
         Lch0Ps7qYW++3IYZg/l4hIr2NTzdpqkcGJ4awc9DItKMATEHBlP4kQq2SFLQVCPyL1+X
         8AlEDzADNRYA5Npn1daD8Ot0sVGx7O1Sv/7iitrrR0t0gYSFVj9JdKq85YNzEH6KTPNW
         uxb84Dqw08njDgO0Pqxtu3vkjMeB9odPMuVz6Ck3WQPCg/b4rL6h5m0iLISkmhUJtuN2
         Zu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CPEZ0a2RlylhBOf26JwZ2btTS0DE53cOy4pZ0+bVA6U=;
        fh=4CyQR304CVfoK6Xm0f+lZ9c5J8PXroxeoRCB5Lv2U1c=;
        b=KZNaDjTKG3Ue9qnSfi0sUEb04vAUIHuJApTqImj7LC/Ra4S1YkNN1d1ZI6mqBchoHT
         HfZotA/HjmjX0kch1snc0dMKQPetlaXCDvFpihln5Y+95qL2aJJt6eYPnop89x4ctapK
         oPYfDLf5Qei/U+sJ1c8nMAlBaZpgdqIfFQi4/tqAhkE8Pdp4AApSaDCEqdkHsb0g0nrY
         ex3JRPJWCcSsnUjBg6mrM8TKKXMwNS5PITMMUJtFFh9QJApPrAUjjiODsfkM/qNkHJRz
         pWoKbkrh3aaeTN6GhV49tYyUBEo/MdLn6OSm9gMTvoE2iGDJpIB0v5927FwZ+MJ3N5Z4
         zh7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=urZxopOl;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c36c85ab3fsi20661666d6.443.2024.09.02.13.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 13:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=urZxopOl;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces@nongnu.org>)
	id 1slDZy-0005XI-0Q; Mon, 02 Sep 2024 16:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1slDZw-0005WJ-2W
 for qemu-discuss@nongnu.org; Mon, 02 Sep 2024 16:23:12 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1slDZu-0000fu-0Y
 for qemu-discuss@nongnu.org; Mon, 02 Sep 2024 16:23:11 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7176645e440so427981b3a.1
 for <qemu-discuss@nongnu.org>; Mon, 02 Sep 2024 13:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725308588; x=1725913388; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CPEZ0a2RlylhBOf26JwZ2btTS0DE53cOy4pZ0+bVA6U=;
 b=urZxopOlPwizKSSRWfkfOGOBbKbgyCxm4d/AaWYjYUaI9I31jR+C1UdxeHuPJHVU/7
 HznTT1tLhGL7ENkBY67cHwK/01pQ71b9oRjsL+iYvF4qYkrNXIWI7eTgSoXSsY+a6ErB
 Bvg6sjZgnV6ySfOKGUL0vtmkA2fv/UtEWsHPsibWhq9HFVnKn7jtJsf7nYDswqifEgMf
 zhs/mSX9eRu/wnaI3faW04h0QDmevs64uHLrw+DQ/Awm3N0Dy3yUqvGrJT9sIJnh+mBW
 naQjpqkcxxGD+oFfQ+5zeQ+xbuIZ4nWnt1R252F7sWcFoBNXb6pe7cAi7Gw07JAwKn9W
 AJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725308588; x=1725913388;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CPEZ0a2RlylhBOf26JwZ2btTS0DE53cOy4pZ0+bVA6U=;
 b=Bo+BxC13AB3Ea86Ca/xyRuNL/xKe+QUS9OfUEsNdRzKODnIzm6WFzkoPb7R62rQVBA
 j/aGIzzdpBE5OVx1rSDOjol0r52R14akB4xZCMKpASLtGonkJXgspQSSiwOPZu2/LOEn
 d6krKedYlDUdrB9wLe8v0XqTacQnriT6zRHfn2X2dGxRI/26JLuIazxxtoQQWjrhW+KC
 PpcVxdMRbcrEdyur3frVYnFnwmczfcP8aEx0ZJD/Xq+U9Pgt3xuUk/53LNwM72yCrEqX
 p0A/L5px0iXwPZUdzfn6h0LVZwaOgH8B1Ea+rKHEXRTYGS+Se7QM+AqpNY8OL/YZTxIW
 vq6Q==
X-Gm-Message-State: AOJu0Yx9PflDk3y+bR6OmeJ2oIl+G8eX3rfAcDcZYZBotd9w1EIavJTR
 lSeqA5WBkdn9jXdIDfdM8KharohwJJ9GTbAS8IWwDABMAa6m4SZk6CERktSyAHQ=
X-Received: by 2002:a05:6a00:2d1c:b0:70d:26cd:9741 with SMTP id
 d2e1a72fcca58-7170a85aaafmr17841366b3a.12.1725308588369; 
 Mon, 02 Sep 2024 13:23:08 -0700 (PDT)
Received: from ?IPV6:2604:3d08:9384:1d00::27bd? ([2604:3d08:9384:1d00::27bd])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-715e575c422sm7237844b3a.198.2024.09.02.13.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 13:23:07 -0700 (PDT)
Message-ID: <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
Date: Mon, 2 Sep 2024 13:23:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Mario Marietto <marietto2008@gmail.com>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
In-Reply-To: <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rEYRdhdq4Mf5

DQoNCk9uIDkvMi8yNCAxMzoyMCwgUGllcnJpY2sgQm91dmllciB3cm90ZToNCj4gT24gOS8y
LzI0IDEyOjUzLCBNYXJpbyBNYXJpZXR0byB3cm90ZToNCj4+IEhlbGxvIFBpZXJyaWNrLg0K
Pj4NCj4+IFdpdGggQ3V0dGxlZmlzaCBjYW4gSSBlbXVsYXRlIEFuZHJvaWQgMTQgZm9yIGFy
bTY0ID8gSSBhc2sgYmVjYXVzZSBpbg0KPj4geW91ciBzY3JpcHQgSSByZWFkIDoNCj4+DQo+
PiAifC9ob21lL3VzZXIvLndvcmsvcWVtdS9idWlsZC9xZW11LXN5c3RlbS14ODZfNjQiLCBz
byxJIHN1c3BlY3QgdGhhdCB5b3UNCj4+IGhhdmUgZW11bGF0ZWQgQW5kcm9pZCB4NjQgYml0
LGJ1dCBJIG5lZWQgYXJtNjQuIHwNCj4+DQo+IA0KPiBZZXMsIGl0IHdvcmtzIGZvciBib3Ro
IGFyY2hpdGVjdHVyZS4gVGhlIG9ubHkgdGhpbmcgSSBkaWRuJ3QgdHJ5IGlzIGFuDQo+IGFy
bTY0IHZtIGFjY2VsZXJhdGVkIHdpdGgga3ZtIChJIGRvbid0IGhhdmUgdGhpcyBhIGxpbnV4
LWFhcmNoNjQNCj4gbWFjaGluZSksIGJ1dCBpdCBzaG91bGQgd29yay4NCg0KQW5kIG9mIGNv
dXJzZSwgaWYgeW91IHdhbnQgdG8gd3JpdGUgYSBjdXN0b20gd3JhcHBlciBmb3IgcWVtdSwg
bmFtZSBpdCANCnFlbXUtc3lzdGVtLWFhcmNoNjQsIGFuZCBjYWxsIHRoZSBzYW1lIGJpbmFy
eSBpbnN0ZWFkIG9mIHg4Nl82NCB2YXJpYW50cy4NCg0KPiANCj4+IEkgYWxzbyByZWFkICJm
b3IgYWFyY2g2NCBpbWFnZXM6IHNlbGVjdA0KPj4gfGFvc3BfY2ZfYXJtNjRfb25seV9waG9u
ZS10cnVua19zdGFnaW5nLXVzZXJkZWJ1ZyIgOiBJJ20gbm90IGFibGUgdG8NCj4+IGRvd25s
b2FkIHRoaXMga2luZCBvZiBpbWFnZXMuIEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdGhlIEJy
YW5jaCBHcmlkDQo+PiB3b3Jrcy4gQ2FuIHlvdSBleHBsYWluIHRvIG1lIGEgbGl0dGxlIGJp
dCBtb3JlID8NCj4+IHwNCj4gDQo+IFlvdSBoYXZlIGEgbGluayBqdXN0IG5leHQgdG8gaXQg
KCJCcmFuY2ggZ3JpZCIpIG9uIHRoZSB3aWtpIHBhZ2UuDQo+IE9uY2Ugb24gY2kgYW5kcm9p
ZCBwYWdlLCBjbGljayBvbiBmaWx0ZXIgYnV0dG9uICh0aHJlZSBiYXJzLCBpbnZlcnRlZA0K
PiBweXJhbWlkKSwgYW5kIHNlbGVjdCBhb3NwX2NmX2FybTY0X29ubHlfcGhvbmUtdHJ1bmtf
c3RhZ2luZy11c2VyZGVidWcuDQo+IFRoZW4gZ28gdG8gYXJ0aWZhY3RzLCBhbmQgZG93bmxv
YWQgaW1hZ2UgYW5kIGN2ZF9ob3N0X3g4Nl82NCBwYWNrYWdlLCBhcw0KPiB3aWtpIG1lbnRp
b25zLg0KPiANCj4gRG9uJ3QgaGVzaXRhdGUgdG8gYXNrIG1vcmUgcXVlc3Rpb25zIG9uIHRo
aXMuIEkgaW1hZ2luZSB0aGlzIHRvcGljIG1pZ2h0DQo+IGludGVyZXN0IHNvbWUgcGVvcGxl
IHdobyB0cnkgdG8gZG8gdGhlIHNhbWUgdGhpbmcuDQo+IA0KPiBQaWVycmljaw0KPiANCj4+
IHwNCj4+IHwNCj4+DQo+Pg0KPj4gT24gTW9uLCBTZXAgMiwgMjAyNCBhdCA4OjQ34oCvUE0g
UGllcnJpY2sgQm91dmllcg0KPj4gPHBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZyA8bWFp
bHRvOnBpZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4+IHdyb3RlOg0KPj4NCj4+ICAgICAg
SGVsbG8gTWFyaW8sDQo+Pg0KPj4gICAgICB2ZXJ5IHJlY2VudGx5LCBJIGhhZCB0byBpbnZl
c3RpZ2F0ZSBib290aW5nIHRpbWUgb2YgQW5kcm9pZCB3aGVuIHVzaW5nDQo+PiAgICAgIFFF
TVUuIFlvdSBjYW4gcHJvYmFibHkgbWFuYWdlIHRvIGJvb3QgdGhpcyB3aXRoIG9ubHkgUUVN
VSBhbG9uZSwgYnV0IGluDQo+PiAgICAgIG15IGV4cGVyaWVuY2UsIHVzaW5nIEN1dHRsZWZp
c2ggdG9vbGluZyBpcyBhbiBlYXNpZXIgYXBwcm9hY2guDQo+Pg0KPj4gICAgICBJZiB5b3Ug
cmVhbGx5IHdhbnQgdG8gdXNlIG9ubHkgUUVNVSwgeW91IGNhbiB1c2UgQ3V0dGxlZmlzaCB0
byBnZXQNCj4+ICAgICAgZXhhY3QNCj4+ICAgICAgY29tbWFuZCBsaW5lIHVzZWQgKHdoaWNo
IGRpc2sgZ29lcyB3aGVyZSksIGFuZCBpdGVyYXRlIGZyb20gdGhhdC4NCj4+DQo+PiAgICAg
IEluc3RydWN0aW9uczoNCj4+ICAgICAgaHR0cHM6Ly9saW5hcm8uYXRsYXNzaWFuLm5ldC93
aWtpL3NwYWNlcy9RRU1VL3BhZ2VzLzI5NDY0MDY4MDk3L1J1bitBbmRyb2lkK3VzaW5nK1FF
TVUgPGh0dHBzOi8vbGluYXJvLmF0bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMvUUVNVS9wYWdl
cy8yOTQ2NDA2ODA5Ny9SdW4rQW5kcm9pZCt1c2luZytRRU1VPg0KPj4NCj4+ICAgICAgQXMg
eW91J2xsIHNlZSwgSSBjb3VsZCBub3QgZ2V0IGEgZGlyZWN0IGdyYXBoaWMgb3V0cHV0LCBi
dXQgdXNpbmcNCj4+ICAgICAgc2NyY3B5LCBpdCB3b3JrZWQgd2VsbCBmb3IgbWUuIEhvcGUg
aXQgY2FuIGZpdCB5b3VyIHVzZSBjYXNlLg0KPj4NCj4+ICAgICAgUmVnYXJkcywNCj4+ICAg
ICAgUGllcnJpY2sNCj4+DQo+PiAgICAgIE9uIDkvMi8yNCAwNjo0OSwgTWFyaW8gTWFyaWV0
dG8gd3JvdGU6DQo+PiAgICAgICA+IEhlbGxvLg0KPj4gICAgICAgPg0KPj4gICAgICAgPiBJ
IHdvdWxkIGxpa2UgdG8gZW11bGF0ZSBBbmRyb2lkIDE0IG9uIG15IFVidW50dSAyNC4wNCBP
UyBYNjQgYml0DQo+PiAgICAgIHVzaW5nDQo+PiAgICAgICA+IHFlbXUtc3lzdGVtLWFhcmNo
NjQuIEkgdHJpZWQgdXNpbmcgdGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzIDoNCj4+ICAgICAg
ID4NCj4+ICAgICAgID4gcWVtdS1zeXN0ZW0tYWFyY2g2NCBcDQo+PiAgICAgICA+wqAgwqAg
wqAgwqAgwqAgLXNtcCA0IFwNCj4+ICAgICAgID7CoCDCoCDCoCDCoCDCoCAtbSAyMDQ4IFwN
Cj4+ICAgICAgID7CoCDCoCDCoCDCoCDCoCAtY3B1IGNvcnRleC1hNzIgXA0KPj4gICAgICAg
PsKgIMKgIMKgIMKgIMKgIC1NIHZpcnQgXA0KPj4gICAgICAgPsKgIMKgIMKgIMKgIMKgIC1k
ZXZpY2UgdmlydGlvLWdwdS1wY2kseHJlcz0xMDI0LHlyZXM9NzY4IFwNCj4+ICAgICAgID7C
oCDCoCDCoCDCoCDCoCAtZGlzcGxheSBzZGwsZ2w9b24gXA0KPj4gICAgICAgPsKgIMKgIMKg
IMKgIMKgIC1kZXZpY2UgdXNiLWVoY2kgXA0KPj4gICAgICAgPsKgIMKgIMKgIMKgIMKgIC1k
ZXZpY2UgdXNiLWtiZCBcDQo+PiAgICAgICA+wqAgwqAgwqAgwqAgwqAgLWRldmljZSB2aXJ0
aW8tdGFibGV0LXBjaSBcDQo+PiAgICAgICA+wqAgwqAgwqAgwqAgwqAgLXVzYiBcDQo+PiAg
ICAgICA+wqAgwqAgwqAgwqAgwqAgLXNlcmlhbCBzdGRpbyBcDQo+PiAgICAgICA+wqAgwqAg
wqAgwqAgwqAgLWtlcm5lbCAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9ycGk0L0ltYWdl
IFwNCj4+ICAgICAgID7CoCDCoCDCoCDCoCDCoCAtaW5pdHJkIC9tbnQvenJvb3QtMTMzL19P
Uy9BbmRyb2lkL3JwaTQvcmFtZGlzay5pbWcgXA0KPj4gICAgICAgPsKgIMKgIMKgIMKgwqDC
oCAtZHJpdmUNCj4+ICAgICAgID4NCj4+ICAgICAgaW5kZXg9MCxpZj1ub25lLGlkPXN5c3Rl
bSxmaWxlPS9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvYm9vdC5pbWcgXA0KPj4g
ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1kZXZpY2UgdmlydGlvLWJsay1wY2ksZHJpdmU9Ym9v
dCBcDQo+PiAgICAgICA+wqAgwqDCoMKgwqDCoMKgwqAgLWRyaXZlDQo+PiAgICAgICA+DQo+
PiAgICAgIGluZGV4PTEsaWY9bm9uZSxpZD1zeXN0ZW0sZmlsZT0vbW50L3pyb290LTEzMy9f
T1MvQW5kcm9pZC9ycGk0L3N5c3RlbS5pbWcgXA0KPj4gICAgICAgPsKgIMKgIMKgIMKgIMKg
IC1kZXZpY2UgdmlydGlvLWJsay1wY2ksZHJpdmU9c3lzdGVtIFwNCj4+ICAgICAgID7CoCDC
oCDCoCDCoCDCoCAtZHJpdmUNCj4+ICAgICAgID4NCj4+ICAgICAgaW5kZXg9MixpZj1ub25l
LGlkPXZlbmRvcixmaWxlPS9tbnQvenJvb3QtMTMzL19PUy9BbmRyb2lkL3JwaTQvdmVuZG9y
LmltZyBcDQo+PiAgICAgICA+wqAgwqAgwqAgwqAgwqAgLWRldmljZSB2aXJ0aW8tYmxrLXBj
aSxkcml2ZT12ZW5kb3IgXA0KPj4gICAgICAgPiAtYXBwZW5kICJjb25zb2xlPXR0eUFNQTAs
Mzg0MDAgZHJtLmRlYnVnPTB4MCByb290d2FpdCByb290ZGVsYXk9NQ0KPj4gICAgICAgPiBy
b290PS9kZXYvbW1jYmxrMHAyIGFuZHJvaWRib290LmhhcmR3YXJlPXJwaTQNCj4+ICAgICAg
ID4gYW5kcm9pZGJvb3Quc2VsaW51eD1wZXJtaXNzaXZlIHNlY3VyaXR5PXNlbGludXggc2Vs
aW51eD0xDQo+PiAgICAgICA+IGFuZHJvaWRib290LnFlbXUuaHcubWFpbmtleXM9MCBhbmRy
b2lkYm9vdC5sY2QuZGVuc2l0eT0xNjAiDQo+PiAgICAgICA+DQo+PiAgICAgICA+IFRoZSBl
cnJvciBJIGdldCBpbiBzaG9ydCBpcyA6DQo+PiAgICAgICA+DQo+PiAgICAgICA+IFsgMS45
OTM2NjhdIGluaXQ6IGJvb2wNCj4+ICAgICAgID4NCj4+ICAgICAgYW5kcm9pZDo6aW5pdDo6
QmxvY2tEZXZJbml0aWFsaXplcjo6SW5pdERldmljZXMoc3RkOjpzZXQ8c3RkOjpzdHJpbmc+
KToNCj4+ICAgICAgID4gcGFydGl0aW9uKHMpIG5vdCBmb3VuZCBpbiAvc3lzLCB3YWl0aW5n
IGZvciB0aGVpciB1ZXZlbnQocyk6DQo+PiAgICAgIG1tY2JsazBwMiwNCj4+ICAgICAgID4g
bW1jYmxrMHAzDQo+PiAgICAgICA+DQo+PiAgICAgICA+DQo+PiAgICAgICA+IE9uZSB1c2Vy
IHN1Z2dlc3RlZCB0byA6DQo+PiAgICAgICA+DQo+PiAgICAgICA+DQo+PiAgICAgICA+DQo+
PiAgICAgICA+DQo+PiAgICAgICA+DQo+PiAgICAgICA+IEhpISEhIFRoZSAiL3N5cyIgaXMg
YSAiZHluYW1pYyBmcyIgY3JlYXRlZCBhdCByYW0gZnJvbSB0aGUNCj4+ICAgICAga2VybmVs
LCB0bw0KPj4gICAgICAgPiBleHBvcnQgYSBsb3Qgb2YgdGhpbmdzLi4uc28gbW9zdCBvZiB0
aGUgZmlsZXMgb25seSBleGlzdCBhdCBydW50aW1lLg0KPj4gICAgICAgPiBOb3JtYWxseSwg
dGhlIHBhcnRpdGlvbnMgZnJvbSB0aGUgYmxvY2sgZGV2aWNlIGhhdmUgYSBzeW1saW5rIGF0
DQo+PiAgICAgICA+IC9zeXMvPHNvbWV0aGluZz4vPC4uLj4gdGhhdCBwb2ludHMgdG8gL2Rl
di8gYmxvY2sgbm9kZS4gSXQgc2VlbXMNCj4+ICAgICAgdGhhdA0KPj4gICAgICAgPiB0aGVy
ZSBhcmUgbm8gc3VjaCBmaWxlcyB1bmRlciAvc3lzIGFjY29yZGluZyB0byB3aGF0IGluaXQg
aXMgbG9va2luZw0KPj4gICAgICAgPiBmb3IuIFlvdSBjYW4gZG91YmxlIGNoZWNrIHRoaXMg
YXQgaW5pdCBzb3VyY2UgY29kZSB0byBjaGVjayB0aGUNCj4+ICAgICAgZXhhY3QNCj4+ICAg
ICAgID4gcGF0aCBidXQgSSdtIGd1ZXNzaW5nIHRoYXQgeW91J2xsIGhhdmUgdG8gY2hhbmdl
IHRoZSBxZW11IGFyZ3VtZW50cw0KPj4gICAgICAgPiByZWdhcmRpbmcgdGhlIGJsb2NrIGRl
dmljZS4NCj4+ICAgICAgID4NCj4+ICAgICAgID4gQWJvdXQgdXNlcmRhdGEuaW1nIEkgdGhp
bmsgaXQncyBub3JtYWwgc2luY2UgaW4gdGhlIG9sZCBkYXlzLCB0aGUNCj4+ICAgICAgaW1h
Z2UNCj4+ICAgICAgID4gd2FzIGEgImVtcHR5IHNwYXJzZSBpbWFnZSIsIHRoYXQgbWVhbnMs
IGF0IHRoZSBmaXJzdCBmbGFzaGluZw0KPj4gICAgICBwcm9jZXNzLA0KPj4gICAgICAgPiB0
aGVyZSBpc24ndCB1c2VyZGF0YSBpbmZvcm1hdGlvbiwgd2UncmUganVzdCAiZmxhc2hpbmcg
dGhlDQo+PiAgICAgIHBhcnRpdGlvbiINCj4+ICAgICAgID4gd2l0aCBlbXB0eSBkYXRhLg0K
Pj4gICAgICAgPiBUa3MhISENCj4+ICAgICAgID4NCj4+ICAgICAgID4NCj4+ICAgICAgID4N
Cj4+ICAgICAgID4gU28saW4gc2hvcnQgSSBzaG91bGQgY2hhbmdlIHRoZSBxZW11IGFyZ3Vt
ZW50cyByZWdhcmRpbmcgdGhlIGJsb2NrDQo+PiAgICAgICA+IGRldmljZS4gSSB0cmllZCBp
biB0aGlzIHdheSA6DQo+PiAgICAgICA+DQo+PiAgICAgICA+DQo+PiAgICAgICA+IHFlbXUt
c3lzdGVtLWFhcmNoNjQgXA0KPj4gICAgICAgPsKgIMKgIMKgIMKgIMKgIC1zbXAgNCBcDQo+
PiAgICAgICA+wqAgwqAgwqAgwqAgwqAgLW0gMjA0OCBcDQo+PiAgICAgICA+wqAgwqAgwqAg
wqAgwqAgLWNwdSBjb3J0ZXgtYTcyIFwNCj4+ICAgICAgID7CoCDCoCDCoCDCoCDCoCAtTSB2
aXJ0IFwNCj4+ICAgICAgID7CoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHZpcnRpby1ncHUtcGNp
LHhyZXM9MTAyNCx5cmVzPTc2OCBcDQo+PiAgICAgICA+wqAgwqAgwqAgwqAgwqAgLWRpc3Bs
YXkgc2RsLGdsPW9uIFwNCj4+ICAgICAgID7CoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHVzYi1l
aGNpIFwNCj4+ICAgICAgID7CoCDCoCDCoCDCoCDCoCAtZGV2aWNlIHVzYi1rYmQgXA0KPj4g
ICAgICAgPsKgIMKgIMKgIMKgIMKgIC1kZXZpY2UgdmlydGlvLXRhYmxldC1wY2kgXA0KPj4g
ICAgICAgPsKgIMKgIMKgIMKgIMKgIC11c2IgXA0KPj4gICAgICAgPsKgIMKgIMKgIMKgIMKg
IC1zZXJpYWwgc3RkaW8gXA0KPj4gICAgICAgPsKgIMKgIMKgIMKgIMKgIC1rZXJuZWwgL21u
dC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC9JbWFnZSBcDQo+PiAgICAgICA+wqAgwqAg
wqAgwqAgwqAgLWluaXRyZCAvbW50L3pyb290LTEzMy9fT1MvQW5kcm9pZC9ycGk0L3JhbWRp
c2suaW1nIFwNCj4+ICAgICAgID7CoCDCoMKgwqDCoMKgwqDCoCAtaGRhIC9tbnQvenJvb3Qt
MTMzL19PUy9BbmRyb2lkL3JwaTQvYm9vdC5pbWcgXA0KPj4gICAgICAgPsKgIMKgIMKgIMKg
IMKgIC1oZGIgL21udC96cm9vdC0xMzMvX09TL0FuZHJvaWQvcnBpNC9zeXN0ZW0uaW1nIFwN
Cj4+ICAgICAgID7CoCDCoCDCoCDCoCDCoCAtaGRjIC9tbnQvenJvb3QtMTMzL19PUy9BbmRy
b2lkL3JwaTQvdmVuZG9yLmltZyBcDQo+PiAgICAgICA+wqAgwqAgwqAgwqAgLWFwcGVuZCAi
Y29uc29sZT10dHlBTUEwLDM4NDAwIGRybS5kZWJ1Zz0weDAgcm9vdHdhaXQNCj4+ICAgICAg
cm9vdGRlbGF5PTUNCj4+ICAgICAgID4gcm9vdD0vZGV2L21tY2JsazBwMiBhbmRyb2lkYm9v
dC5oYXJkd2FyZT1ycGk0DQo+PiAgICAgICA+IGFuZHJvaWRib290LnNlbGludXg9cGVybWlz
c2l2ZSBzZWN1cml0eT1zZWxpbnV4IHNlbGludXg9MQ0KPj4gICAgICAgPiBhbmRyb2lkYm9v
dC5xZW11Lmh3Lm1haW5rZXlzPTAgYW5kcm9pZGJvb3QubGNkLmRlbnNpdHk9MTYwIg0KPj4g
ICAgICAgPg0KPj4gICAgICAgPg0KPj4gICAgICAgPiBidXQgdGhlIGVycm9yIGlzIHN0aWxs
IHRoZXJlLiBEbyB5b3Uga25vdyBzb21lIGRpZmZlcmVudCBhbHRlcm5hdGl2ZQ0KPj4gICAg
ICAgPiBibG9jayBkZXZpY2VzIHRvIHRyeSA/IHRoYW5rcy4NCj4+ICAgICAgID4NCj4+ICAg
ICAgID4NCj4+ICAgICAgID4gLS0NCj4+ICAgICAgID4gTWFyaW8uDQo+Pg0KPj4NCj4+DQo+
PiAtLSANCj4+IE1hcmlvLg0K
