Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp319769njl;
        Tue, 1 Oct 2024 09:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjs2TBntE5eY9D9VqYtifUedgtk7b8shLQ/90nYI2532bznblgePr28fRg+EGe5cIS1pd7rVqk1cqCKQ==@linaro.org
X-Received: by 2002:a17:902:e74c:b0:20b:8ef2:c84a with SMTP id d9443c01a7336-20bc5aa3709mr3480485ad.53.1727801815212;
        Tue, 01 Oct 2024 09:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801815; cv=none;
        d=google.com; s=arc-20240605;
        b=ZVQHSNCCO9bNn2alnALXUtRJd4LALgX0pyutbPBbUrOI69K0oNjPDikkq8HzOAHpyP
         4VDkgvrNXnA1MHN6f8Qbh16yFr264+p6xEgocmOJ6Y+bHDsj8T/YHYMY9c1X2+xjzDyn
         9LobTxe43SB/gyEZDSBxJFRlQYIyE1SIPtMrUv9ql5WAhKuMuTbu5WfKr5qwIUY+oHW0
         V54qIb8KXgT/f8KzIDuUJviWxHoz8Vchd2/OrXXq3shGKp2zrBx/KffvM4Sl6h+cVgBG
         TJJNV8V0lAdQdXpRSY/U6Z0soY6yNYdA2385zVZg/Nf6gNdMBmMS60Vo04KZPYUxqVjT
         zXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pi3dvg6ZaeE5oQ9Te2cnzQ7jFHxC8EMgsyWm5nwTG4w=;
        fh=ybZYTOgQFRDLi8XHYkXrwLkT4ci8dTPZYV0Gvl/7VbI=;
        b=FMKCtVMKoxtsAnfF9H48DiuJW0iJn7ALujAZGJwGsStvYDW0VBdcTyV90w4mOEWcM4
         Dy9WJwWe8kxG5LQ+Bc5/fTlPoiJxvPyKoe3ZdzsM4HnNlKrkLcn1dMmHX9Z7BDjVxgUz
         MNtcQH/sOn19howmc4HoUXZFgb5UGwybCa9paX9njdlMqVTFvcG1PkgiU7bxqzCELbN4
         9ayXqwk4/S/KZ3mPKSpSoJg3598uqtXIAfaMbiV3Vnl/YrE72ahlaVgaGU4qZiQaylbJ
         aNMZ32jRCCyV8EEJ24Snp4lP0h5jlmzI/D/Pcza8SkzIT4211QGk0zNAOCTsmurE3/Ju
         JaNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVs8c+V7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20b37d99f3csor50626205ad.1.2024.10.01.09.56.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:56:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVs8c+V7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801815; x=1728406615; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pi3dvg6ZaeE5oQ9Te2cnzQ7jFHxC8EMgsyWm5nwTG4w=;
        b=DVs8c+V7yIuizpMfUk4bJ1WF0Ah/oXRUwLGVQQbCLWKm0ADFkdngW4vVjuE7gQHKDw
         KLdHSiNvM11y+rOebfVvuJIHAEN6Y9jNsCGC07tK9GoG9g8xb09akwdonLFpuc7cVpHi
         3OO7HgqgNmTewrDc6rfTj8GtaeQhL7g94JRz2iCWLRfflCC/rXonivD3hdziNmA0l5/2
         31RhHyESuWF/8yrAykauv1wx029xQyIo+jeKmcXUdnfDvUr2+V1Zq+BPcFCkymldskbB
         uYJid9azZ9zRN614FQ3+5VdbDWr01rBzJ87tUcUwaLRHxkn4THgKZHa+UoR7HXxqQaWg
         zOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801815; x=1728406615;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pi3dvg6ZaeE5oQ9Te2cnzQ7jFHxC8EMgsyWm5nwTG4w=;
        b=t86GZkxHX8ChyC0Jo47E36aEQa6h9wkSVZ4c8eM+Q8ENMqEoBaWQDuL0FulibA+ZQ5
         69vL3wQRFcWM3hCxgfYvZPSP2gP4MF6d1ZTdhXSqXQPCJcUJDJ1kQOqxc3LIW4isBogt
         +MJyxv2k3Ra2C26BkfH/EWJCI3krM2INVkp8vE89EZ1UEdEiMHAafYWCzqaEI09pIr6+
         AxkRKksIuH2otFdwHCkJyXJPGE88TUC7piTWCo5dGCEmvbsIxlf3xB2SYdR8Yybs0D2/
         CCbFCYSrKbsbdUPdf0b92Zw5VIRpqOw4avBqodTfJzUZbapq+N96LpmMK4or50nJkssr
         TUuA==
X-Forwarded-Encrypted: i=1; AJvYcCXpD8q7xf7NFH4GVmVD3kNkKA9oC7jun9Lm3W5/LqMk99MVOcydwm9NlBsRSAseguZ3nnY/ZKQjXM0tOg==@linaro.org
X-Gm-Message-State: AOJu0YzvEa5e/wdWnsOATXQkIdyB2xMtHvHtTwakxFLq+ZjsP9zUyy8A
	JGaMQsmMjTi4ObCl53BIC+R7UmYHAGxMW9mB+vJYjmsvIFkQyvc/ETiAbodJJxZL6g==
X-Google-Smtp-Source: AGHT+IFeCsSLqm3NJncFYAB1f+41eZ1ZsX4d45KKhqS52K/sfespom6SNYtfTN4ghzRlBQLVorHBGQ==
X-Received: by 2002:a17:903:240a:b0:20b:983c:f095 with SMTP id d9443c01a7336-20bc5aa3877mr3285525ad.51.1727801814752;
        Tue, 01 Oct 2024 09:56:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d6717fsm72062295ad.14.2024.10.01.09.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:56:54 -0700 (PDT)
Message-ID: <353265a0-cef8-4a01-863a-5c9495263acb@linaro.org>
Date: Tue, 1 Oct 2024 09:56:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] hw/pci/pci_device: Add PCI_DMA_DEFINE_LDST_END()
 macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-12-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: Tt2sSuDkaIIA

DQoNCk9uIDkvMzAvMjQgMDA6MzQsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOg0K
PiBEZWZpbmUgYm90aCBlbmRpYW5uZXNzIHZhcmlhbnRzIHdpdGggYSBzaW5nbGUgbWFjcm8u
DQo+IFVzZWZ1bCB0byBhZGQgeWV0IG90aGVyIGVuZGlhbiBzcGVjaWZpYyBkZWZpbml0aW9u
cw0KPiBpbiB0aGUgbmV4dCBjb21taXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIGluY2x1
ZGUvaHcvcGNpL3BjaV9kZXZpY2UuaCB8IDEzICsrKysrKystLS0tLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvaHcvcGNpL3BjaV9kZXZpY2UuaCBiL2luY2x1ZGUvaHcvcGNpL3Bj
aV9kZXZpY2UuaA0KPiBpbmRleCA5MWRmNDBmOTg5Li5mZjYxOTI0MWE0IDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL2h3L3BjaS9wY2lfZGV2aWNlLmgNCj4gKysrIGIvaW5jbHVkZS9ody9w
Y2kvcGNpX2RldmljZS5oDQo+IEBAIC0yOTgsMTMgKzI5OCwxNCBAQCBzdGF0aWMgaW5saW5l
IE1lbVR4UmVzdWx0IHBjaV9kbWFfd3JpdGUoUENJRGV2aWNlICpkZXYsIGRtYV9hZGRyX3Qg
YWRkciwNCj4gICAgICAgICAgIHJldHVybiBzdCMjX3MjI19kbWEocGNpX2dldF9hZGRyZXNz
X3NwYWNlKGRldiksIGFkZHIsIHZhbCwgYXR0cnMpOyBcDQo+ICAgICAgIH0NCj4gICANCj4g
KyNkZWZpbmUgUENJX0RNQV9ERUZJTkVfTERTVF9FTkQoX2wsIF9zLCBfYml0cykgXA0KPiAr
ICAgIFBDSV9ETUFfREVGSU5FX0xEU1QoX2wjI19sZSwgX3MjI19sZSwgX2JpdHMpIFwNCj4g
KyAgICBQQ0lfRE1BX0RFRklORV9MRFNUKF9sIyNfYmUsIF9zIyNfYmUsIF9iaXRzKQ0KPiAr
DQo+ICAgUENJX0RNQV9ERUZJTkVfTERTVCh1YiwgYiwgOCk7DQo+IC1QQ0lfRE1BX0RFRklO
RV9MRFNUKHV3X2xlLCB3X2xlLCAxNikNCj4gLVBDSV9ETUFfREVGSU5FX0xEU1QobF9sZSwg
bF9sZSwgMzIpOw0KPiAtUENJX0RNQV9ERUZJTkVfTERTVChxX2xlLCBxX2xlLCA2NCk7DQo+
IC1QQ0lfRE1BX0RFRklORV9MRFNUKHV3X2JlLCB3X2JlLCAxNikNCj4gLVBDSV9ETUFfREVG
SU5FX0xEU1QobF9iZSwgbF9iZSwgMzIpOw0KPiAtUENJX0RNQV9ERUZJTkVfTERTVChxX2Jl
LCBxX2JlLCA2NCk7DQo+ICtQQ0lfRE1BX0RFRklORV9MRFNUX0VORCh1dywgdywgMTYpDQo+
ICtQQ0lfRE1BX0RFRklORV9MRFNUX0VORChsLCAgbCwgMzIpDQo+ICtQQ0lfRE1BX0RFRklO
RV9MRFNUX0VORChxLCAgcSwgNjQpDQo+ICAgDQo+ICAgI3VuZGVmIFBDSV9ETUFfREVGSU5F
X0xEU1QNCj4gICANCg0KUmV2aWV3ZWQtYnk6IFBpZXJyaWNrIEJvdXZpZXIgPHBpZXJyaWNr
LmJvdXZpZXJAbGluYXJvLm9yZz4NCg==
