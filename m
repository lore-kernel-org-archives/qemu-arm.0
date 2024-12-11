Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4181271njb;
        Wed, 11 Dec 2024 08:21:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmvZsXpwObiLKLFywh3AmH5Bk88Eb6m+FpZEFiqLg7z3PNCL4MIpoDXMSp0+JWTWzhQBazv6luxjGv7Q==@linaro.org
X-Received: by 2002:a05:6a20:d98:b0:1e0:c6c0:1e08 with SMTP id adf61e73a8af0-1e1cdac87a3mr764530637.25.1733934069129;
        Wed, 11 Dec 2024 08:21:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934069; cv=none;
        d=google.com; s=arc-20240605;
        b=BxNnqbJOfyLlmHhEuJVWKaFXrR6oxDirSeyIuKdbkuQrVQu+Ejnn+q4ea2KUZkrEWU
         L86fOf5e0iyCOFP1BLkBqIs0Vol1Uhn8N9I7cNBcCjwLu/WbkDh29v6croKJL/Rwv9gF
         mMIjhG30qK5WiyWLxOAgRZNmK0sXVOIpqMReM2rMAvGFFQy7GgGsPflGZuns0IfqE/O+
         kD98G4nwPv1pRqQZkoHpPX6qCsvRa9qEkBvt5X1aEp1XvUy2mtexm5gRmr5Q3Oj+yeiw
         airSSgIx8Ejkso5AybYns9G4tb0bGqniGrNKigPOAI6Qgt2M1vZHLPs6KHPaExgG28Av
         LXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=R/8rIeF0TDteUXFj/RITr0ALWgOxAOP826Or7EBLfgI=;
        fh=N9TM7UblUgPCKZbDbNAQL6v/01cw8hI+sqvh9e7ap58=;
        b=ljItHv3aTF8w6forh87/TgNslrQmI5MnQqzTn0BsVI1DZxdylldaKlBZTj3Pd2isTl
         Ds1V+7LBeFyM4xi05qG6Auq42s7FGPm5VTS//X/zWz0H6tIn+WTSeRbAgytRDfAxaxdX
         215s2tvFLkqaLtPmyOs8hCR52k5g+RakHg9RBUehfXU64W171gVD4ATHOPX1T8N+ei3+
         KouZ0QtwWOnauzk6Zsx/LCSLvaLmqSS1XtZ/WrT+xG1Amu0JTJGHatHVyyUPAR8u1zM/
         VBgcE/UMwPVNzn2El/+ZblhBcuPcz8Z5uktpL4NG3WvHbb8Ilz4S7saHIRdrzF2bTCc1
         b4kA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crHS6wn7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-728e945d358sor2755095b3a.11.2024.12.11.08.21.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Dec 2024 08:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crHS6wn7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733934069; x=1734538869; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/8rIeF0TDteUXFj/RITr0ALWgOxAOP826Or7EBLfgI=;
        b=crHS6wn7AUTG9Y3mUn1yHqopPcnJV0oEdjkQ583zpqR5PZlr71wB1hRp/PARThOAx2
         4URSXQ5Iuq9Lz9TL8IeRno8fLtnEdoCetSd4J7FTX8pkYPWqfurf2u/f32pDWlqWrPuE
         uZXAf/U6lZIQitARW8CQGcPWkqHhjjvVSh1dfExYWQJZAa72WVXxUVX+5Bmpnajal1m4
         fADtkpF9RyxBB9NXMgSj/98lkXccJ7MUX/3/p6xEND7gaTT37PpGLPKNiQoFBRA/Y/1o
         ImOBBf+cjzIaKaaNbRt6jzipBUKh9huNp4gssNsxsn7gOLIi/ob39i+D5UoOZo9H5cIX
         4Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733934069; x=1734538869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/8rIeF0TDteUXFj/RITr0ALWgOxAOP826Or7EBLfgI=;
        b=C6vhE1ExAJZkwRJ9WXmjn11MpfsKTshmof2MrDXAgIOQ1B0KEs/iSEuizye96eRBcW
         XZrWVyEstJgl9fvoIppDiUBKelnIFg6wI84rSG1qd5VJufcYfmN0pYzshqUQf6UZR1dk
         N7zp0RShe+FGagbboc4PzMg0wEqko0S+6SzEnlV4h4m/O0qDxE0ePqyooW6Wh/rl9wxA
         sEUuuYBJFltcR8wFr4FPnwp9QYpXpMOuL90ZRkILigviHX3GLSv/uxySnuTTitR+jhEZ
         6fCeMjImVottg6ANLGCKZmqPnayw+bg2Ps/ta4RX5zxcj6W6cHlvgj6QzCxqx5pL7DXu
         p0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXABHQPeibp5D148oAIlNi44nDf2sWf5/rtQZpXniu8ikM0jik8EY0WmGnfS23RGk6T7/yQP0md/gLMIA==@linaro.org
X-Gm-Message-State: AOJu0YwJMMoEIJNodwovSxbQ27q8fgYB0S6Mla4Vw7ebXUDUh4VTmpTH
	PUrVWP74jy0ViUNif137POhe8NBwJl/R6L2Ycm9mgpQ0DpDvW3z5UtJnvskCRskm/+xf0cDn3Bo
	cxsWntA==
X-Gm-Gg: ASbGncucPuekUSyCPtBsqkGTu1JGbOysO8Oq0LD7sfWJkx8VBTwT61/joq1Sk0F63WR
	WYoXadMg+dMz2+QXnhEYKIZlXy8Fw/o4OZEDyixlv5Skh2ffTx2wVGJs1WRdMU0tuMgy7+q3ndP
	bVZbV13w9rOJyaAHd0ts/GsQyzF8XaHXdVs0mq8N8pqEf4P4M9ndSAI8ISMHu9qtAnD7Ag5qXlf
	qYmM08c4Ro1PuTOdS8z3lvXf9Vq2fZUjNKn7uUA1mNNrarQ/1cNNHQZhCWMdM//Abpy+ezI7xbL
	EQxyoKoN64pyPg0YiEMqZ32B/g==
X-Google-Smtp-Source: AGHT+IHVEtZAk+HzNzF2+zrLOq2c1LiYiL0X2EinosbU0WqAKvQRBhnLix7+bf2/ztLjZteojuXsRw==
X-Received: by 2002:a05:6a21:e92:b0:1db:eff0:6ae7 with SMTP id adf61e73a8af0-1e1cdb2359emr637538637.33.1733934068701;
        Wed, 11 Dec 2024 08:21:08 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d36e66e1sm7811131b3a.178.2024.12.11.08.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 08:21:08 -0800 (PST)
Message-ID: <41bb7f1a-35b7-4f38-b8cc-9b40bb3da1ed@linaro.org>
Date: Wed, 11 Dec 2024 08:21:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] tests/functional/aarch64: add tests for FEAT_RME
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-16-alex.bennee@linaro.org>
 <ba91b0da-ea60-4802-b336-f3a650d06ae4@redhat.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ba91b0da-ea60-4802-b336-f3a650d06ae4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: mvKIPyMwffQw

T24gMTIvMTEvMjQgMDA6MDQsIFRob21hcyBIdXRoIHdyb3RlOg0KPiBPbiAxMC8xMi8yMDI0
IDIxLjQzLCBBbGV4IEJlbm7DqWUgd3JvdGU6DQo+PiBGcm9tOiBQaWVycmljayBCb3V2aWVy
IDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+Pg0KPj4gVGhpcyBib290IGFuIE9Q
LVRFRSBlbnZpcm9ubWVudCwgYW5kIGxhdW5jaCBhIG5lc3RlZCBndWVzdCBWTSBpbnNpZGUg
aXQNCj4+IHVzaW5nIHRoZSBSZWFsbXMgZmVhdHVyZS4gV2UgZG8gaXQgZm9yIHZpcnQgYW5k
IHNic2EtcmVmIHBsYXRmb3Jtcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBC
b3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo+Pg0KPj4gLS0tLS0NCj4+
DQo+PiB2MjoNCj4+IC0gbW92ZSB0ZXN0IHRvIGl0cyBvd24gZmlsZQ0KPj4gLSBhZGQgc2Jz
YSB0ZXN0DQo+PiAtIGNoZWNrIG91dHB1dCBvZiBgY2NhLXdvcmtsb2FkLWF0dGVzdGF0aW9u
IHJlcG9ydGANCj4+DQo+PiB2MzoNCj4+IC0gYnVpbGQgYW5kIHJ1biB0ZXN0IHdpdGggY2Nh
LXY0IGltYWdlcw0KPj4gLSBmYWN0b3JpemUgbmVzdGVkIGd1ZXN0IHRlc3QgYmV0d2VlbiBi
b3RoIHRlc3RzDQo+PiAtIHJlbW92ZSBhY2NlbCB0Y2cgb3B0aW9uIGFzIGl0IGlzIHRoZSBk
ZWZhdWx0IHdoZW4gcnVubmluZyB0ZXN0cw0KPj4gTm90ZTogSXQncyBhIGxvbmcgdGVzdCBh
bmQgdGhlcmUgaXMgYSB3b3JrIGluIHByb2dyZXNzIHRvIHVuZGVyc3RhbmQgd2h5DQo+PiBk
ZWJ1ZyBidWlsZCBpcyBzbyBzbG93ICh4MTIgdnMgb3B0aW1pemVkKS4NCj4+DQo+PiB2NDoN
Cj4+IC0gdXNlIHBhdXRoLWltcGRlZj1vbiB0byBzcGVlZCB1cCBidWlsZCB0aW1lIGV4ZWN1
dGlvbiAoeDIuNSBmYXN0ZXIpDQo+PiAtIGluY3JlYXNlIHRpbWVvdXQgdmFsdWUNCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmc+DQo+PiBNZXNzYWdlLUlkOiA8MjAyNDEyMDMyMTM2MjkuMjQ4MjgwNi0xLXBp
ZXJyaWNrLmJvdXZpZXJAbGluYXJvLm9yZz4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVu
bsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4+IC0tLQ0KPj4gICAgdGVzdHMvZnVu
Y3Rpb25hbC9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgfCAgIDQgKw0KPj4gICAgdGVz
dHMvZnVuY3Rpb25hbC90ZXN0X2FhcmNoNjRfcm1lX3Nic2FyZWYucHkgfCAgNzAgKysrKysr
KysrKysrKw0KPj4gICAgdGVzdHMvZnVuY3Rpb25hbC90ZXN0X2FhcmNoNjRfcm1lX3ZpcnQu
cHkgICAgfCAxMDAgKysrKysrKysrKysrKysrKysrKw0KPj4gICAgMyBmaWxlcyBjaGFuZ2Vk
LCAxNzQgaW5zZXJ0aW9ucygrKQ0KPj4gICAgY3JlYXRlIG1vZGUgMTAwNzU1IHRlc3RzL2Z1
bmN0aW9uYWwvdGVzdF9hYXJjaDY0X3JtZV9zYnNhcmVmLnB5DQo+PiAgICBjcmVhdGUgbW9k
ZSAxMDA3NTUgdGVzdHMvZnVuY3Rpb25hbC90ZXN0X2FhcmNoNjRfcm1lX3ZpcnQucHkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvZnVuY3Rpb25hbC9tZXNvbi5idWlsZCBiL3Rlc3Rz
L2Z1bmN0aW9uYWwvbWVzb24uYnVpbGQNCj4+IGluZGV4IDBhNzZiZDk5NTQuLjRlMjA3YzUz
ZDUgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0cy9mdW5jdGlvbmFsL21lc29uLmJ1aWxkDQo+PiAr
KysgYi90ZXN0cy9mdW5jdGlvbmFsL21lc29uLmJ1aWxkDQo+PiBAQCAtMTMsNiArMTMsOCBA
QCBlbmRpZg0KPj4gICAgdGVzdF90aW1lb3V0cyA9IHsNCj4+ICAgICAgJ2FhcmNoNjRfYXNw
ZWVkJyA6IDYwMCwNCj4+ICAgICAgJ2FhcmNoNjRfcmFzcGk0JyA6IDQ4MCwNCj4+ICsgICdh
YXJjaDY0X3JtZV92aXJ0JyA6IDEyMDAsDQo+PiArICAnYWFyY2g2NF9ybWVfc2JzYXJlZicg
OiAxMjAwLA0KPiANCj4gSSB3YXMgYSBsaXR0bGUgYml0IHdvcnJpZWQgd2hlbiBJIHNhdyB0
aGUgYmlnIHRpbWVvdXQgdmFsdWVzIGhlcmUsIGJ1dA0KPiB0aGF0J3Mgb25seSBmb3IgZGVi
dWcgYnVpbGRzLCByaWdodD8gSSBnYXZlIGl0IGEgdHJ5IGluIGEgc3RhbmRhcmQgYnVpbGQs
DQo+IHRoZSB0ZXN0cyBib3RoIGZpbmlzaGVkIHdpdGhpbiA1IG1pbnV0ZXMsIHNvIHRoZSBz
dGFuZGFyZCBydW50aW1lIHN0aWxsDQo+IHNlZW1zIHRvIGJlIG9rLg0KPiANCg0KWWVzLCBp
dCdzIGZvciBkZWJ1ZyBvbmx5Lg0KDQo+IFRlc3RlZC1ieTogVGhvbWFzIEh1dGggPHRodXRo
QHJlZGhhdC5jb20+DQo+IA0KPiAgID4gKyAgICAjIFRoaXMgdGVzdHMgdGhlIEZFQVRfUk1F
IGNwdSBpbXBsZW1lbnRhdGlvbiwgYnkgYm9vdGluZyBhIFZNDQo+IHN1cHBvcnRpbmcgaXQs
DQo+ICAgPiArICAgICMgYW5kIGxhdW5jaGluZyBhIG5lc3RlZCBWTSB1c2luZyBpdC4NCj4g
ICA+ICsgICAgZGVmIHRlc3RfYWFyY2g2NF9ybWVfc2JzYXJlZihzZWxmKToNCj4gICA+ICsg
ICAgICAgIHN0YWNrX3BhdGhfdGFyX2d6ID0gc2VsZi5BU1NFVF9STUVfU1RBQ0tfU0JTQS5m
ZXRjaCgpDQo+ICAgPiArICAgICAgICBhcmNoaXZlX2V4dHJhY3Qoc3RhY2tfcGF0aF90YXJf
Z3osIHNlbGYud29ya2RpcikNCj4gICA+ICsNCj4gICA+ICsgICAgICAgIHNlbGYuc2V0X21h
Y2hpbmUoJ3Nic2EtcmVmJykNCj4gICA+ICsgICAgICAgIHNlbGYudm0uc2V0X2NvbnNvbGUo
KQ0KPiAgID4gKyAgICAgICAgc2VsZi5yZXF1aXJlX2FjY2VsZXJhdG9yKCd0Y2cnKQ0KPiAN
Cj4gUGxlYXNlIG1vdmUgdGhlIHNldF9tYWNoaW5lIGFuZCByZXF1aXJlX2FjY2VsZXJhdG9y
IHRvIHRoZSBiZWdpbm5pbmcgb2YgdGhlDQo+IGZ1bmN0aW9uIHNpbmNlIHRoZXkgY2FuIHNr
aXAgdGhlIHRlc3QgaW4gY2FzZSB0aGUgcHJlcmVxdWlzaXRlIGlzIG5vdA0KPiBhdmFpbGFi
bGUuIE90aGVyd2lzZSB5b3UndmUgZXh0cmFjdGVkIHRoZSBhc3NldCBpbiB2YWluLg0KPg0K
DQpBbGV4LCBjb3VsZCB5b3UgcGxlYXNlIGtpbmRseSB1cGRhdGUgaXQsIGFzIGl0J3MgcGFy
dCBvZiB5b3VyIHNlcmllcyBub3c/DQoNCj4gICAgVGhvbWFzDQo+IA0KDQpUaGFua3MsDQpQ
aWVycmljaw0K
