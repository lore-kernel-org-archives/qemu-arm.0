Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1819182dlb;
        Thu, 20 Jun 2024 11:40:04 -0700 (PDT)
X-Received: by 2002:aa7:8505:0:b0:705:a7a6:6d11 with SMTP id d2e1a72fcca58-70629ccda1cmr6977745b3a.24.1718908803933;
        Thu, 20 Jun 2024 11:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718908803; cv=none;
        d=google.com; s=arc-20160816;
        b=exV5JJ38ePic6Wtm1v3LGzBGuFL98CLegRJpnfbL+nme1yr0+/XuRVwN7HXVxh+elO
         gFL27IaqKnTCCK8Z3DCURgty7/Oe/Un2jieKCJgTZZ7dS9gVmZyOhwSW6cnIMJ62pP+4
         xIvCNPncFDrEZoTYuQCW4N8J9Cy4WYMPjEtKW0TVU5+Z9F66U/FKbja9W6FkRRIAiC3u
         U16OB79ESEvXoIULKyRR4rQXdCXRcqhUWSXoXtaOhvBTXwqGLZiIVc+8F97Lwu6iJXrG
         YOQ8oqT2IQqeN2mY5Zu6Q4E6oMz4DzrrMzX1mKBIa0sMROKdDVtnYTaKW9+vOuYy1og9
         CFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=t7ugR8LyJ4yhjJE6jRVvqgPt4wBlmHq1ns/6Tho+3ic=;
        fh=y9kGj9eUlVNiJLTHhsSuWfPjjDoh7BKtS0/oVyfkOWk=;
        b=NfDm7iNGeyZDIE3HxuMd1W/UCp7AhD7iin3bSsaqNjMSqjO4EQgQ8NTO8bd/N9exDe
         TFmijw8iTlYNN0XSmS/yTqWFYlmDOdACnAL8SdYqdExehY6chd9CR80CWcUePgN2XYuz
         IQasNlIrgRFiKnIRQDQ4/GdLI7LiEBHOl2WvplcKq4eWhge/cE2KdJVnoV1CK8Y3rV7J
         lzHu6aUrqpAIBKQLiEJzhgJnMxC5X9kN0aNMxaGc8S4ZbQL3t1zoqLjFmjzcQ0cSB7z+
         aVcCHDxidWpI/cgrX6+b+cWokrBJjTFr9qMNCY9G6ieo3ctdzCCMCSSIoG0/hT6eIfR+
         qKqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxElp8si;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-705cfc23094sor12965615b3a.7.2024.06.20.11.40.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Jun 2024 11:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxElp8si;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718908803; x=1719513603; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7ugR8LyJ4yhjJE6jRVvqgPt4wBlmHq1ns/6Tho+3ic=;
        b=mxElp8sisWPG1vl1w9kPgt8JbnuT1jbmZkEFz75yWVONod6xOX8gzVONnTtHrbmfbg
         jmU3demll2ruLuI/EP8/+8JI13yxBaXyVQw9UInqC80cbZfbAaTDRBvx08ITNeHSGlVf
         MvLhKu5dIqJimVWGhVQ6LxTJtTUWWkIF9Q05BKAwBvGb6XuyR5Kzw9G8oTswGTeJQ3MQ
         HRRB+RHKfvD1KRqqx6fx3nvDs6lPXrkNilzoREUNTRY8KY5K1toNGFUMoCCqTsXm3dhk
         C4lXUz+dcC0pRHr6ROMpJXyJT2tYztTqJRvUaQkiT+1Q+j10Mx+T/YOk7fs1DD3ukGyf
         l2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718908803; x=1719513603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7ugR8LyJ4yhjJE6jRVvqgPt4wBlmHq1ns/6Tho+3ic=;
        b=Cfar3ALQMCG7oA94XGHRF+lqZXlTWa/lxbwL4xaIPEwfTENwe26LZ30+o+OzF2zKf5
         I0zsua9/YvB60UZ4TZ5fHqfuDzNWjCr1UI2QcBw0EGh38HFcf+5RR+ydPWX4/8xcRNod
         l42jeP7uZ4qgdiTHm9dbZhUki2cSEfDsaACS/SkkuZ9+WucyCQlqU/6ofsLCy3Es0UMc
         BVXwm0bnnQ5xIemWlwGXsbBlUVWtbIwntdvMNXVtT53M4EN5DsBgMIoYaegJJn5MFyEJ
         HpT79CxogRZsSxxYtXCkaW16q/TGwDuDqyPXchRyo95cODkWRYMIR6fPyf8oJxK0PFel
         PHrA==
X-Gm-Message-State: AOJu0YzZdGADiZoGu/8X/AQ4uP/7jYQTCELMMM4pRpqqPE1qBTDQDnFT
	N65qwJIo8FWrVkwjIf66Az1z+Cl66KMlyCz/wBz14Gt337Ql6L8rOzjgPC0HScUP4Z/Xs0WusHo
	Mz6gNbn1P
X-Google-Smtp-Source: AGHT+IH9ViMIWfbt0h1UCKQ/eJd8MvZzPCQ22Cxn984MQSLtU3vwcXljPn1bCtC/O7uwoBqYxsye6Q==
X-Received: by 2002:a05:6a20:b202:b0:1b8:6ed5:a70 with SMTP id adf61e73a8af0-1bcbb5d5116mr6437613637.49.1718908802848;
        Thu, 20 Jun 2024 11:40:02 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::2193? ([2604:3d08:9384:1d00::2193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70649012058sm939903b3a.35.2024.06.20.11.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 11:40:02 -0700 (PDT)
Message-ID: <59ef28a2-7a29-4214-893c-67d27bea8377@linaro.org>
Date: Thu, 20 Jun 2024 11:40:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] accel/tcg: Avoid unnecessary call overhead from
 qemu_plugin_vcpu_mem_cb
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jamie Iles <quic_jiles@quicinc.com>,
 David Hildenbrand <david@redhat.com>, Mark Burton
 <mburton@qti.qualcomm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Nicholas Piggin <npiggin@gmail.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Max Chou <max.chou@sifive.com>, Frank Chang <frank.chang@sifive.com>
References: <20240620152220.2192768-1-alex.bennee@linaro.org>
 <20240620152220.2192768-13-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240620152220.2192768-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: WyFRvSmFo63g

T24gNi8yMC8yNCAwODoyMiwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBGcm9tOiBNYXggQ2hv
dSA8bWF4LmNob3VAc2lmaXZlLmNvbT4NCj4gDQo+IElmIHRoZXJlIGFyZSBub3QgYW55IFFF
TVUgcGx1Z2luIG1lbW9yeSBjYWxsYmFjayBmdW5jdGlvbnMsIGNoZWNraW5nDQo+IGJlZm9y
ZSBjYWxsaW5nIHRoZSBxZW11X3BsdWdpbl92Y3B1X21lbV9jYiBmdW5jdGlvbiBjYW4gcmVk
dWNlIHRoZQ0KPiBmdW5jdGlvbiBjYWxsIG92ZXJoZWFkLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWF4IENob3UgPG1heC5jaG91QHNpZml2ZS5jb20+DQo+IFJldmlld2VkLWJ5OiBSaWNo
YXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gUmV2aWV3
ZWQtYnk6IEZyYW5rIENoYW5nIDxmcmFuay5jaGFuZ0BzaWZpdmUuY29tPg0KPiBNZXNzYWdl
LUlkOiA8MjAyNDA2MTMxNzUxMjIuMTI5OTIxMi0yLW1heC5jaG91QHNpZml2ZS5jb20+DQo+
IC0tLQ0KPiAgIGFjY2VsL3RjZy9sZHN0X2NvbW1vbi5jLmluYyB8IDggKysrKysrLS0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FjY2VsL3RjZy9sZHN0X2NvbW1vbi5jLmluYyBiL2FjY2VsL3Rj
Zy9sZHN0X2NvbW1vbi5jLmluYw0KPiBpbmRleCBjODIwNDhlMzc3Li44N2NlYjk1NDg3IDEw
MDY0NA0KPiAtLS0gYS9hY2NlbC90Y2cvbGRzdF9jb21tb24uYy5pbmMNCj4gKysrIGIvYWNj
ZWwvdGNnL2xkc3RfY29tbW9uLmMuaW5jDQo+IEBAIC0xMjUsNyArMTI1LDkgQEAgdm9pZCBo
ZWxwZXJfc3RfaTEyOChDUFVBcmNoU3RhdGUgKmVudiwgdWludDY0X3QgYWRkciwgSW50MTI4
IHZhbCwgTWVtT3BJZHggb2kpDQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgcGx1Z2luX2xvYWRf
Y2IoQ1BVQXJjaFN0YXRlICplbnYsIGFiaV9wdHIgYWRkciwgTWVtT3BJZHggb2kpDQo+ICAg
ew0KPiAtICAgIHFlbXVfcGx1Z2luX3ZjcHVfbWVtX2NiKGVudl9jcHUoZW52KSwgYWRkciwg
b2ksIFFFTVVfUExVR0lOX01FTV9SKTsNCj4gKyAgICBpZiAoY3B1X3BsdWdpbl9tZW1fY2Jz
X2VuYWJsZWQoZW52X2NwdShlbnYpKSkgew0KPiArICAgICAgICBxZW11X3BsdWdpbl92Y3B1
X21lbV9jYihlbnZfY3B1KGVudiksIGFkZHIsIG9pLCBRRU1VX1BMVUdJTl9NRU1fUik7DQo+
ICsgICAgfQ0KPiAgIH0NCj4gICANCj4gICB1aW50OF90IGNwdV9sZGJfbW11KENQVUFyY2hT
dGF0ZSAqZW52LCBhYmlfcHRyIGFkZHIsIE1lbU9wSWR4IG9pLCB1aW50cHRyX3QgcmEpDQo+
IEBAIC0xODgsNyArMTkwLDkgQEAgSW50MTI4IGNwdV9sZDE2X21tdShDUFVBcmNoU3RhdGUg
KmVudiwgYWJpX3B0ciBhZGRyLA0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIHBsdWdpbl9zdG9y
ZV9jYihDUFVBcmNoU3RhdGUgKmVudiwgYWJpX3B0ciBhZGRyLCBNZW1PcElkeCBvaSkNCj4g
ICB7DQo+IC0gICAgcWVtdV9wbHVnaW5fdmNwdV9tZW1fY2IoZW52X2NwdShlbnYpLCBhZGRy
LCBvaSwgUUVNVV9QTFVHSU5fTUVNX1cpOw0KPiArICAgIGlmIChjcHVfcGx1Z2luX21lbV9j
YnNfZW5hYmxlZChlbnZfY3B1KGVudikpKSB7DQo+ICsgICAgICAgIHFlbXVfcGx1Z2luX3Zj
cHVfbWVtX2NiKGVudl9jcHUoZW52KSwgYWRkciwgb2ksIFFFTVVfUExVR0lOX01FTV9XKTsN
Cj4gKyAgICB9DQo+ICAgfQ0KPiAgIA0KPiAgIHZvaWQgY3B1X3N0Yl9tbXUoQ1BVQXJjaFN0
YXRlICplbnYsIGFiaV9wdHIgYWRkciwgdWludDhfdCB2YWwsDQoNCllvdSBtaWdodCB3YW50
IHRvIGFkZCB0aGUgc2FtZSB0aGluZyBpbjogYWNjZWwvdGNnL2F0b21pY19jb21tb24uYy5p
bmMNCg0KUGllcnJpY2sNCg==
