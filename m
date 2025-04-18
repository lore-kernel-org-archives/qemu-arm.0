Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1170795njk;
        Thu, 17 Apr 2025 19:53:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3tb925asaSEiK0ZBKoVUq6WuQkMIYN7VtojmXoQB2H9vF3a4LXiUwvmOM0hoXGoOmUNK0J+6LtfblVA==@linaro.org
X-Google-Smtp-Source: AGHT+IFVfeDPbU4Ss3h6nasHtZJ8d58E5mnc5womuMjFDYGEKj44XECipqrAPnlNnKeuBo8VO5BP
X-Received: by 2002:a05:622a:14e:b0:474:e255:db2c with SMTP id d75a77b69052e-47aec3e2b1amr21291331cf.26.1744944834377;
        Thu, 17 Apr 2025 19:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744944834; cv=none;
        d=google.com; s=arc-20240605;
        b=Ajhk2f6moHXG25vekrBmvMKo1N9gcrT25x4q44DOovxUBfoAxZEsIEbUFKeodpyP+Z
         rb1VIL3Rxd66M+oZxSaVWcjm3oOcKM+3jc10H4yYKuaAdo5HEfgSvtPX32xMnYjFPFl9
         iFAm7kq/gD3V3IWUIYehY0I8RqgcI7XlrqfYZ/PrxhebV83VQTIPipyaxROyC/J98Yud
         aAx76RwaJKGAz0sikqAqLppt4WYUc/loRvrZbhXl1QJaG85FQetxkGum/xY9aOi/Y/Jg
         hsGvTvydF9jmBAfm/l1xsPOZ8AUtqSVGgKqR0uBxSY6f//7yyozZ95yGMjesfIRVg6Q2
         393A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CmN8ODSf2l/vao7gZkwOIQrPU/Wqb0fF8TtdpzfR1Xw=;
        fh=U5LYKudzoot77LMrm/ZZt4famc/jwFqpFtDKMjwH15Y=;
        b=Oh0HnhOsw5Qe/Udld9bx7riKO5eYn7ifnGE8i/m/rbPcHJ2i6y74AhoPyhnkesgphh
         45yEA0Cj0p11crfX6CLR/EVmlF6K5XpLljrNctmMUlZh7AAYXDk9BuJtNIZhE9lhPcpp
         aDa3sIkSZJH18+cZY0pN9QGSMVupMTHIm4i/qUVx1R7UHpQdwEL9rFnd7l7yLzB0NbVX
         LvTIpJUJh8fhfkCDRCvme+Y0LbLTWXXDifzOUFH67xfLboX1edrrkP6pE+sLR/CBwEk9
         +zOCs1sCUpiI5maFJqc6ZQ60dWCDC3SVHMRp+Habqi1FszBfVlbqQwHIpskrQe7vvE4m
         BYcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COzLqhoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9cd880fsi12302591cf.572.2025.04.17.19.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 19:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COzLqhoQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5br4-00079j-DW; Thu, 17 Apr 2025 22:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u5br3-00079O-9e
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 22:53:25 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1u5br1-000848-J2
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 22:53:25 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-736ad42dfd6so1267523b3a.3
 for <qemu-arm@nongnu.org>; Thu, 17 Apr 2025 19:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744944801; x=1745549601; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmN8ODSf2l/vao7gZkwOIQrPU/Wqb0fF8TtdpzfR1Xw=;
 b=COzLqhoQNZiYyO3U9MOlIrksxt0q5VgXcuo0t1T8kwGi1eEM54+PaBCCOFAAwAavwg
 yTAxdWGzCyH+9upRSWg33sVo2h3egoEp++ykIjq/q9f47plCkXOd4oV45spT2jhwRF2u
 g0fm2a+5dlIJE40ub/f1RvgXoWa+qllebycVvuiBh01nmH1fV098nr8Xo47yaj4G1JDr
 0LUUXUv5xqb3LGy40z5ehOWGUsmGw7ly/od/0QIH5xikkNFa+NTbPTxRFupEwfRJgg8E
 NIwMmjgGeDCMZAVAq6WxcoyDY0AmlArGLPhVmpZOwgT/dVtWGmM13jjRgUv1j+SmlcP4
 D3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744944801; x=1745549601;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmN8ODSf2l/vao7gZkwOIQrPU/Wqb0fF8TtdpzfR1Xw=;
 b=C2aIHSrFRllBlEMmLPideJMk+EFIDt62MCQ0BLghipklSi3Zp2FP0gGXjc/cv5Nti9
 xIoyTNQMfHA/xaG/654ZI56JcYMPPwaac4Y6vio8V4aFPIOB+exMDdBsIKgjizEw3ike
 EfCnzWK5pyCFdRA8xR5653nfEsz4AfJ/pKwzxfepEdXQ2nT9TAbCr5EqhU0UHsCw84nR
 oEbcHuZyaJ67eZT6WtKyBVwG/gAIC+lNFm0y2HOlXJyzpzRIjDpFT63gIh3gsMaJFeTH
 LboZBeKLs+EnEP7oF+duO6dhNKzCHDwXgGkoZFvavjgEimS3zFnv3ghNNiUxf5qHAih7
 yHCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0MlonqIOAfwv6hDTMEyZWCopts4h+fLA4Py/raM13OLWSjpvwX0uMI4EG9T0/PKM4Ibl02wbmzw==@nongnu.org
X-Gm-Message-State: AOJu0YxjVNYLK5jR0EkoGm5+gI7KtqQRPu+aBiVRWrTQh5F4hc7EdSL0
 eNGn+hyvMa1iE+hnNRvG6NbNQvjd3dy00MBqZZ5YlXPUwlsSmXAYn63uCCHpjMM=
X-Gm-Gg: ASbGncvoIpQKAS9++ZyaMxs08FL43rG25rEOQprFTe7YRtHPUl5UM/c+MxQ72gjMRwd
 PBm5yU4R90vTzJTBvQ0GQTJ26E8amoBxZNVOOHfN4CwhdZ9C8hG3Sfrkwx2Qkbh4yr6D86KKYXn
 R7orZu5hEascuvo4oiHoFokPaOIzdIjIi8pJj3++ZLjkjXTPmjeejD1OIo4DS0FgD88/seArPjY
 7YbL1HoNojAb30W7I9duJrHj1ka18dhcdNAplFutL6Qm1hhTMsp1ThG3hDqUrMb8fqQiebvddXJ
 zryYkhbur8fTTSv08y8qihOHvAIs5l+ddhKKxwpnEf+aZQ7muwVOA6waKL1bgtUv
X-Received: by 2002:a05:6a00:21c4:b0:736:ab48:5b0 with SMTP id
 d2e1a72fcca58-73dc147c2a5mr1457508b3a.2.1744944801182; 
 Thu, 17 Apr 2025 19:53:21 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbfae9e77sm623362b3a.160.2025.04.17.19.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 19:53:20 -0700 (PDT)
Message-ID: <29beabe0-15ed-4af3-87f3-c3a32bf44dc1@linaro.org>
Date: Thu, 17 Apr 2025 19:53:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] hw/arm: Define machines as generic QOM types
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Felipe Balbi
 <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20250417235814.98677-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: prI7gYVhPL2D

T24gNC8xNy8yNSAxNjo1OCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFdo
aWxlIERFRklORV9NQUNISU5FKCkgaXMgYSBzdWNjaW5jdCBtYWNybywgaXQgZG9lc24ndA0K
PiBhbGxvdyByZWdpc3RlcmluZyBRT00gaW50ZXJmYWNlcyB0byB0aGUgZGVmaW5lZCBtYWNo
aW5lLg0KPiBDb252ZXJ0IHRvIHRoZSBnZW5lcmljIERFRklORV9UWVBFUygpIGluIHByZXBh
cmF0aW9uIHRvDQo+IHJlZ2lzdGVyIGludGVyZmFjZXMuDQo+IA0KPiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSAoMTEpOg0KPiAgICBody9jb3JlL251bGwtbWFjaGluZTogRGVmaW5lIG1h
Y2hpbmUgYXMgZ2VuZXJpYyBRT00gdHlwZQ0KPiAgICBody9hcm0vYmFuYW5hcGk6IERlZmlu
ZSBtYWNoaW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4gICAgaHcvYXJtL2N1YmllYm9hcmQ6
IERlZmluZSBtYWNoaW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4gICAgaHcvYXJtL2RpZ2lj
OiBEZWZpbmUgbWFjaGluZSBhcyBnZW5lcmljIFFPTSB0eXBlDQo+ICAgIGh3L2FybS9pbXg6
IERlZmluZSBtYWNoaW5lcyBhcyBnZW5lcmljIFFPTSB0eXBlcw0KPiAgICBody9hcm0vaW50
ZWdyYXRvcmNwOiBEZWZpbmUgbWFjaGluZSBhcyBnZW5lcmljIFFPTSB0eXBlDQo+ICAgIGh3
L2FybS9rem06IERlZmluZSBtYWNoaW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4gICAgaHcv
YXJtL21zZjI6IERlZmluZSBtYWNoaW5lIGFzIGdlbmVyaWMgUU9NIHR5cGUNCj4gICAgaHcv
YXJtL211c2ljcGFsOiBEZWZpbmUgbWFjaGluZSBhcyBnZW5lcmljIFFPTSB0eXBlDQo+ICAg
IGh3L2FybS9vcmFuZ2VwaTogRGVmaW5lIG1hY2hpbmUgYXMgZ2VuZXJpYyBRT00gdHlwZQ0K
PiAgICBody9hcm0vc3RtMzI6IERlZmluZSBtYWNoaW5lcyBhcyBnZW5lcmljIFFPTSB0eXBl
cw0KPiANCj4gICBody9hcm0vYmFuYW5hcGlfbTJ1LmMgICAgICB8IDEzICsrKysrKysrKysr
LS0NCj4gICBody9hcm0vY3ViaWVib2FyZC5jICAgICAgICB8IDEzICsrKysrKysrKysrLS0N
Cj4gICBody9hcm0vZGlnaWNfYm9hcmRzLmMgICAgICB8IDE0ICsrKysrKysrKysrKy0tDQo+
ICAgaHcvYXJtL2lteDI1X3Bkay5jICAgICAgICAgfCAxNCArKysrKysrKysrKystLQ0KPiAg
IGh3L2FybS9pbXg4bXAtZXZrLmMgICAgICAgIHwgMTUgKysrKysrKysrKysrKy0tDQo+ICAg
aHcvYXJtL2ludGVncmF0b3JjcC5jICAgICAgfCAxNiArKysrKysrKysrKysrLS0tDQo+ICAg
aHcvYXJtL2t6bS5jICAgICAgICAgICAgICAgfCAxNCArKysrKysrKysrKystLQ0KPiAgIGh3
L2FybS9tY2lteDZ1bC1ldmsuYyAgICAgIHwgMTUgKysrKysrKysrKysrKy0tDQo+ICAgaHcv
YXJtL21jaW14N2Qtc2FicmUuYyAgICAgfCAxNSArKysrKysrKysrKysrLS0NCj4gICBody9h
cm0vbXNmMi1zb20uYyAgICAgICAgICB8IDEzICsrKysrKysrKysrLS0NCj4gICBody9hcm0v
bXVzaWNwYWwuYyAgICAgICAgICB8IDE2ICsrKysrKysrKysrKystLS0NCj4gICBody9hcm0v
bmV0ZHVpbm8yLmMgICAgICAgICB8IDEzICsrKysrKysrKysrLS0NCj4gICBody9hcm0vbmV0
ZHVpbm9wbHVzMi5jICAgICB8IDEzICsrKysrKysrKysrLS0NCj4gICBody9hcm0vb2xpbWV4
LXN0bTMyLWg0MDUuYyB8IDEzICsrKysrKysrKysrLS0NCj4gICBody9hcm0vb3JhbmdlcGku
YyAgICAgICAgICB8IDEzICsrKysrKysrKysrLS0NCj4gICBody9hcm0vc2FicmVsaXRlLmMg
ICAgICAgICB8IDE0ICsrKysrKysrKysrKy0tDQo+ICAgaHcvYXJtL3N0bTMydmxkaXNjb3Zl
cnkuYyAgfCAxMyArKysrKysrKysrKy0tDQo+ICAgaHcvY29yZS9udWxsLW1hY2hpbmUuYyAg
ICAgfCAxNCArKysrKysrKysrKystLQ0KPiAgIDE4IGZpbGVzIGNoYW5nZWQsIDIxMyBpbnNl
cnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkNCj4gDQoNClNvdW5kcyBnb29kLCBmb3IgdGhl
IHdob2xlIHNlcmllczoNClJldmlld2VkLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmlj
ay5ib3V2aWVyQGxpbmFyby5vcmc+DQoNCg==
