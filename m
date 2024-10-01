Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp316476njl;
        Tue, 1 Oct 2024 09:50:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU53iAlxP/sfXM9XOYrdscHbW0uaXoaFkbTMXOtGTe4Yha7scVn7SmP6Fxr8fStmtNEKMiQdBF0OcTcbg==@linaro.org
X-Received: by 2002:a17:903:22d2:b0:20b:a9b2:b558 with SMTP id d9443c01a7336-20ba9f39ca4mr66673705ad.28.1727801455485;
        Tue, 01 Oct 2024 09:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727801455; cv=none;
        d=google.com; s=arc-20240605;
        b=JGGrpbBNx4AXHMDnlbA0AgHFHhf6T0r0JzZvbOMl2WSN1jvVt/9+oX/L1c3f8Ppjiz
         tO/KydgOi67BR5OLQDC1aEmkhTcveQcjwT5SsmRr/Je2tPIIioxgynYBkC0KG4JK8Xc3
         YxFi3qPQokiw2S6EM48N3tbZjvitYBbjTgmIfSfcgpw6cbPjqNxQTD+E7c7Hc4qgb4as
         CfKEKMUkr20X2Ooi5ZWNEASpEWrpQ8q6TdK893FWEEpTZft2SYZkNbsLKOn8xREXh8/D
         f1eWGvTyrvnYOHqpcDayAOzl7Pz6WcyURnA6licwJ/aIs7DlXQg5pYQ8/2vLNY7da24Z
         msqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MjsCRjwKwbWJrZPAmtn9mOW+dG68XD+K3d1r1VdPqTM=;
        fh=X1Qu82eUOq24PHGl8sjeurLWuPBxdnxNTgbdsp+eK10=;
        b=AZftZrJGsov97xqiZepnRLOgqOsLg/WMSikejMdUhj9QHfqhLEd2Cb2vM4PcxgO2Lf
         ZCEd7f1Ie3WhWBAtBS6KQqT8K6QITuIv493EruIEKVkhxuLiAzktgLvS1DpjiLrZd00M
         F6KBCxJS5lhX5/keiCY0Qm3HyeEr7mdLbAbV+Y+6XubZSEKpO/+PX+z0yc2bjaQMiKcH
         2/bDRGJQcMwAKwnHqhVclLeCWXCKHj5D4KFbdO5cG1uJ8myJIAQnGjAS3+l9KKvCSjoj
         mYR22tAIsLJm63Mn1mDcbldq+xkT6yw9lFpaMRL2o1uc1Ra1CrKC2wIHUsp3/OV3ctkQ
         EvNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zjPUmJ6p;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20b3645f5d6sor46853525ad.10.2024.10.01.09.50.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2024 09:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zjPUmJ6p;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727801455; x=1728406255; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjsCRjwKwbWJrZPAmtn9mOW+dG68XD+K3d1r1VdPqTM=;
        b=zjPUmJ6p7pUdTXoA789GqsXYMiWRdzN9+0sSAcb1KBUQW13lJyuABnJ1biDRO8eMUg
         bfsKQZHjQzcIjC7kZrJvoOH5VkVkaWdhENXP7p332ufaMckJsVWNDq6dwQe035LUvrn4
         YRynFkViTfy7a82JVoe5E06gD4rJabPnwFCLUUBBdsWqP2OSOGvPkqDrRC23PHL94JF5
         ebRbzpv3frdcxsnwiwKbvbo3mYtYQT9xW6tAi1foGN/Un5d0bwrRHaUqE0KGM/7QLuQW
         0aQvetE1k3THeaUzqIIcIfZ2c5GepoL9Hq0i2MZkjlf5NBOwNNMCx8pV71kikzbAGn5q
         bG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801455; x=1728406255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjsCRjwKwbWJrZPAmtn9mOW+dG68XD+K3d1r1VdPqTM=;
        b=LSPcBszbAfdCkEJNfDPurJUAdpjArtmGeAgaqqodLvbweRQssfmBST00qX19ockFD/
         eF8cbfDN00TnkrT98EIl8p9Lk5E+qu8z+2sKCINQZ4vCILqBe7Pp/JoXdBE7PyrsB0jT
         90RhTK8jF9fUp42BS+cPYddRcyqW7WayzMciM59PaKa8R2LLvsx0bam5Gtx4Vasd6IWt
         7hHRLygEbCYGHBC+eLiB4qv5Jy6jiXHEznIz1IhckV7pVSBYLWel23xL7DBNJAs16vlA
         hG4KwQuCqaVHeQ0pg+Mujo6zoVYvVyBE6vCjcoO0K65Zza5D9ESGuWEsMrLZeBna/Qkv
         thEw==
X-Forwarded-Encrypted: i=1; AJvYcCWOK4lcQA/oHSO444BQ3qT+oWdTdxJbn2XejgrKlWZzI+d/F844YrHX6YVJ0qF1/C6B0h4C/QtA7T/KEQ==@linaro.org
X-Gm-Message-State: AOJu0YyWLg4qMZfzgANN3jzCTHRGDRy72+XaojhiEqFhlmaeYQfzVxp9
	1XiguRkp/KsqWcFv6wZlAscfP2AOQVmR7TCbFZbda+YitJp9dXa87LeI91o9FmaZnQ==
X-Google-Smtp-Source: AGHT+IH32s7bEl5N2cWi1wWENI0Ov6yAdQrBVEKK/IeDM2+oaSZ9s/KDcfNBRSLG3ADn/pvKSnuqxw==
X-Received: by 2002:a17:902:f688:b0:206:892c:b758 with SMTP id d9443c01a7336-20ba9ed2162mr60636445ad.13.1727801454993;
        Tue, 01 Oct 2024 09:50:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37da676fsm71883605ad.108.2024.10.01.09.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:50:54 -0700 (PDT)
Message-ID: <1daf5428-cbc6-4949-90c9-8aa01f60a9ee@linaro.org>
Date: Tue, 1 Oct 2024 09:50:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] tests/tcg/plugins: Use the ld/st_endian_p() API
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
 <20240930073450.33195-7-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240930073450.33195-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: +rH4Ab5s14d0

T24gOS8zMC8yNCAwMDozNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IFJl
ZmFjdG9yIHRvIHVzZSB0aGUgcmVjZW50bHkgaW50cm9kdWNlZCBsZC9zdF9lbmRpYW5fcCgp
IEFQSQ0KPiBObyBsb2dpY2FsIGNoYW5nZSBpbnRlbmRlZC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gLS0t
DQo+ICAgdGVzdHMvdGNnL3BsdWdpbnMvbWVtLmMgfCAyNCArKysrKystLS0tLS0tLS0tLS0t
LS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy90Y2cvcGx1Z2lucy9tZW0uYyBiL3Rl
c3RzL3RjZy9wbHVnaW5zL21lbS5jDQo+IGluZGV4IGIwZmE4YTlmMjcuLjM1ODZkMDU1ODcg
MTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL3RjZy9wbHVnaW5zL21lbS5jDQo+ICsrKyBiL3Rlc3Rz
L3RjZy9wbHVnaW5zL21lbS5jDQo+IEBAIC0xNjMsMTMgKzE2Myw5IEBAIHN0YXRpYyB2b2lk
IHVwZGF0ZV9yZWdpb25faW5mbyh1aW50NjRfdCByZWdpb24sIHVpbnQ2NF90IG9mZnNldCwN
Cj4gICAgICAgew0KPiAgICAgICAgICAgdWludDE2X3QgKnAgPSAodWludDE2X3QgKikgJnJp
LT5kYXRhW29mZnNldF07DQo+ICAgICAgICAgICBpZiAoaXNfc3RvcmUpIHsNCj4gLSAgICAg
ICAgICAgIGlmIChiZSkgew0KPiAtICAgICAgICAgICAgICAgIHN0d19iZV9wKHAsIHZhbHVl
LmRhdGEudTE2KTsNCj4gLSAgICAgICAgICAgIH0gZWxzZSB7DQo+IC0gICAgICAgICAgICAg
ICAgc3R3X2xlX3AocCwgdmFsdWUuZGF0YS51MTYpOw0KPiAtICAgICAgICAgICAgfQ0KPiAr
ICAgICAgICAgICAgc3R3X2VuZGlhbl9wKGJlLCBwLCB2YWx1ZS5kYXRhLnUxNik7DQo+ICAg
ICAgICAgICB9IGVsc2Ugew0KPiAtICAgICAgICAgICAgdWludDE2X3QgdmFsID0gYmUgPyBs
ZHV3X2JlX3AocCkgOiBsZHV3X2xlX3AocCk7DQo+ICsgICAgICAgICAgICB1aW50MTZfdCB2
YWwgPSBsZHV3X2VuZGlhbl9wKGJlLCBwKTsNCj4gICAgICAgICAgICAgICB1bnNlZW5fZGF0
YSA9IHZhbCAhPSB2YWx1ZS5kYXRhLnUxNjsNCj4gICAgICAgICAgIH0NCj4gICAgICAgICAg
IGJyZWFrOw0KPiBAQCAtMTc4LDEzICsxNzQsOSBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcmVn
aW9uX2luZm8odWludDY0X3QgcmVnaW9uLCB1aW50NjRfdCBvZmZzZXQsDQo+ICAgICAgIHsN
Cj4gICAgICAgICAgIHVpbnQzMl90ICpwID0gKHVpbnQzMl90ICopICZyaS0+ZGF0YVtvZmZz
ZXRdOw0KPiAgICAgICAgICAgaWYgKGlzX3N0b3JlKSB7DQo+IC0gICAgICAgICAgICBpZiAo
YmUpIHsNCj4gLSAgICAgICAgICAgICAgICBzdGxfYmVfcChwLCB2YWx1ZS5kYXRhLnUzMik7
DQo+IC0gICAgICAgICAgICB9IGVsc2Ugew0KPiAtICAgICAgICAgICAgICAgIHN0bF9sZV9w
KHAsIHZhbHVlLmRhdGEudTMyKTsNCj4gLSAgICAgICAgICAgIH0NCj4gKyAgICAgICAgICAg
IHN0bF9lbmRpYW5fcChiZSwgcCwgdmFsdWUuZGF0YS51MzIpOw0KPiAgICAgICAgICAgfSBl
bHNlIHsNCj4gLSAgICAgICAgICAgIHVpbnQzMl90IHZhbCA9IGJlID8gbGRsX2JlX3AocCkg
OiBsZGxfbGVfcChwKTsNCj4gKyAgICAgICAgICAgIHVpbnQzMl90IHZhbCA9IGxkbF9lbmRp
YW5fcChiZSwgcCk7DQo+ICAgICAgICAgICAgICAgdW5zZWVuX2RhdGEgPSB2YWwgIT0gdmFs
dWUuZGF0YS51MzI7DQo+ICAgICAgICAgICB9DQo+ICAgICAgICAgICBicmVhazsNCj4gQEAg
LTE5MywxMyArMTg1LDkgQEAgc3RhdGljIHZvaWQgdXBkYXRlX3JlZ2lvbl9pbmZvKHVpbnQ2
NF90IHJlZ2lvbiwgdWludDY0X3Qgb2Zmc2V0LA0KPiAgICAgICB7DQo+ICAgICAgICAgICB1
aW50NjRfdCAqcCA9ICh1aW50NjRfdCAqKSAmcmktPmRhdGFbb2Zmc2V0XTsNCj4gICAgICAg
ICAgIGlmIChpc19zdG9yZSkgew0KPiAtICAgICAgICAgICAgaWYgKGJlKSB7DQo+IC0gICAg
ICAgICAgICAgICAgc3RxX2JlX3AocCwgdmFsdWUuZGF0YS51NjQpOw0KPiAtICAgICAgICAg
ICAgfSBlbHNlIHsNCj4gLSAgICAgICAgICAgICAgICBzdHFfbGVfcChwLCB2YWx1ZS5kYXRh
LnU2NCk7DQo+IC0gICAgICAgICAgICB9DQo+ICsgICAgICAgICAgICBzdHFfZW5kaWFuX3Ao
YmUsIHAsIHZhbHVlLmRhdGEudTY0KTsNCj4gICAgICAgICAgIH0gZWxzZSB7DQo+IC0gICAg
ICAgICAgICB1aW50NjRfdCB2YWwgPSBiZSA/IGxkcV9iZV9wKHApIDogbGRxX2xlX3AocCk7
DQo+ICsgICAgICAgICAgICB1aW50NjRfdCB2YWwgPSBsZHFfZW5kaWFuX3AoYmUsIHApOw0K
PiAgICAgICAgICAgICAgIHVuc2Vlbl9kYXRhID0gdmFsICE9IHZhbHVlLmRhdGEudTY0Ow0K
PiAgICAgICAgICAgfQ0KPiAgICAgICAgICAgYnJlYWs7DQoNClJldmlld2VkLWJ5OiBQaWVy
cmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxpbmFyby5vcmc+DQo=
