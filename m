Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3146731njc;
        Tue, 5 Nov 2024 14:20:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmi2jLZ5VSXxR4R4GXsMMGjw4fhRyGuKcMSDgWspXoH7uPPCE/4lOVcP7lMofjBiwKwJ3vOZGzDS5ENw==@linaro.org
X-Google-Smtp-Source: AGHT+IF8n7UcBDf5eLGzWINwbB0Stl4C7tqreg6nBjy1W4a5Eq0Dlhc5iyGXabr9zWDvlfNGVdKu
X-Received: by 2002:a05:600c:1d0a:b0:431:559d:4103 with SMTP id 5b1f17b1804b1-432a9aa0aeemr2855575e9.7.1730845250091;
        Tue, 05 Nov 2024 14:20:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730845250; cv=none;
        d=google.com; s=arc-20240605;
        b=iJM+xVueyEGb0OkFNU93QLjEhTiMEcQENsANwSktmdyJuFt9FoUOF8K5fn6vi4NnvO
         HhS65esGhDjgQ/o5uzTFEQQhKNBwYE84pBG5F1ykxPpkZpSHFTruj5364ZBqYGEPtPfp
         bkTuR0BA+o2/HX/KCth6XDf6iB6EyI+6aqCnz/rkYTkIcyzEIIFHgI6DWcdzdaN2Hcxg
         /jbVQXc5SYkx432l9zjrK6ygDsu1qFh0MWmAvBgTPt8N+OgCc6lsGEEWoCrErn2424Nb
         8l8Li9Dd4VEVTLvUTlrngxSpgQmZa2yGWXYZNUFAvXEGtLAMuwzKpej/ecYN9r2DFAle
         eOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=L/jZSR3YyzQQ0sdjHwFNahx5n+0DLS7ovhx6RL0mWu8=;
        fh=4jM0pxu7pxCVpK7AL387LNDDjPE2wTJtIs4oABiNFig=;
        b=Wut8HyJuplFw9fkVpvCD1WoNQvAYR4bxoXqk9IWv+ce/7BhR7MD5Je+cXBkUp/Knp0
         kc8XJ6YTxcv1cFdUj5aEdTjyqqn/i/u7IWOXL95mVwjGAzd3TZs36TGK1tO9iZJkja16
         T9Wbg9QPzGLSxxVf3YNwB5xkNWaLJP2esdcV2zcntQRYOE6fAVyVAS+wqCBbC+ZhjbXZ
         fCPQF6ElRVvN76X2PQtDu5SXVI+NypUE2S5ggbejgse7++gyfaI993Y2kpKV5/aALvLF
         ezHc7uECf8SK+uG8HYKI5lNJYtwjbGtqM0BcH7qpfV/N8cv/LGQf6qVo0SYd+ifk7IZS
         tQ+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-432aa5b5b66si281805e9.20.2024.11.05.14.20.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2024 14:20:50 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XjjQM4046z6K6RZ;
	Wed,  6 Nov 2024 06:18:03 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
	by mail.maildlp.com (Postfix) with ESMTPS id D588A140517;
	Wed,  6 Nov 2024 06:20:48 +0800 (CST)
Received: from frapeml500007.china.huawei.com (7.182.85.172) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 23:20:48 +0100
Received: from frapeml500007.china.huawei.com ([7.182.85.172]) by
 frapeml500007.china.huawei.com ([7.182.85.172]) with mapi id 15.01.2507.039;
 Tue, 5 Nov 2024 23:20:48 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "gshan@redhat.com"
	<gshan@redhat.com>, "maz@kernel.org" <maz@kernel.org>, "will@kernel.org"
	<will@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com"
	<shahuang@redhat.com>, "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm
	<linuxarm@huawei.com>, "gustavo.romero@linaro.org"
	<gustavo.romero@linaro.org>
Subject: RE: [PATCH] arm/virt: Extract common code to wire GICC<->vCPU IRQs
 for reuse
Thread-Topic: [PATCH] arm/virt: Extract common code to wire GICC<->vCPU IRQs
 for reuse
Thread-Index: AQHbLgSbwU64kgKDNkuiSDBIJV8mp7KnDaaAgAI3n/A=
Date: Tue, 5 Nov 2024 22:20:48 +0000
Message-ID: <7d27ceab963441dc8355d06e6bc4b88d@huawei.com>
References: <20241103152455.202462-1-salil.mehta@huawei.com>
 <CAFEAcA91DoU4dAHYy6OOeMjEQ+0LGZX8KM-rKsCh89UnFS4yTQ@mail.gmail.com>
In-Reply-To: <CAFEAcA91DoU4dAHYy6OOeMjEQ+0LGZX8KM-rKsCh89UnFS4yTQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.170.66]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: 9W/rZIGoEWuZ

SEkgUGV0ZXIsDQoNCj4gIEZyb206IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJv
Lm9yZz4NCj4gIFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgNCwgMjAyNCAxOjI3IFBNDQo+ICBUbzog
U2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+ICANCj4gIE9uIFN1biwgMyBO
b3YgMjAyNCBhdCAxNToyNSwgU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+IHdy
b3RlOg0KPiAgPg0KPiAgPiBFeHRyYWN0IGNvbW1vbiBHSUMgYW5kIENQVSBpbnRlcnJ1cHQgd2ly
aW5nIGNvZGUgdG8gaW1wcm92ZSBjb2RlDQo+ICA+IHJlYWRhYmlsaXR5IGFuZCBtb2R1bGFyaXR5
LCBzdXBwb3J0aW5nIHJldXNlIGluIGZ1dHVyZSBwYXRjaCBzZXRzLg0KPiAgPiBUaGlzIHJlZmFj
dG9yIGlzIGJlbmlnbiBhbmQgaW50cm9kdWNlcyAqbm8qIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4g
ID4NCj4gID4gTm90ZTogVGhpcyBwYXRjaCBoYXMgYmVlbiBpc29sYXRlZCBmcm9tIGEgbGFyZ2Vy
IHBhdGNoIHNldCB0bw0KPiAgPiBmYWNpbGl0YXRlIGVhcmx5IG1lcmdpbmcgYW5kIHJlZHVjZSB0
aGUgY29tcGxleGl0eSBvZiB0aGUgb3JpZ2luYWwNCj4gID4gc2V0LCBhcyBpdCBvcGVyYXRlcyBp
bmRlcGVuZGVudGx5LiBBbGwgb3JpZ2luYWwgdGFncyBhbmQgYXV0aG9yDQo+ICA+IGNvbnRyaWJ1
dGlvbnMgYXJlIHJldGFpbmVkLg0KPiAgDQo+ICBJIHdvdWxkIHByZWZlciB0byBzZWUgcmVmYWN0
b3JpbmcgcGF0Y2hlcyBpbiB0aGUgY29udGV4dCBvZiB0aGUgc2VyaWVzIHRoYXQNCj4gIG1ha2Vz
IHRoZW0gbmVjZXNzYXJ5LiBBcyBpdCBzdGFuZHMsIHRoZXJlIGRvZXNuJ3QgcmVhbGx5IHNlZW0g
dG8gYmUgbXVjaA0KPiAgYmVuZWZpdCB0byB0aGlzIGNoYW5nZS4NCg0KDQpPayBubyBpc3N1ZXMu
IEp1c3QgdG8gY29uZmlybSwgeW91ciBhYm92ZSBjb21tZW50IGlzIGp1c3Qgc3BlY2lmaWMgdG8g
dGhpcyBwYXRjaA0Kb3IgYWxsIHRoZSAzIGluZGl2aWR1YWwgcGF0Y2hlcyBJIGhhZCBzZW50IGZv
ciByZXZpZXc/DQoNClRoYW5rcw0KU2FsaWwuDQo+ICANCj4gIHRoYW5rcw0KPiAgLS0gUE1NDQo=
