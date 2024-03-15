Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp704330eju;
        Thu, 14 Mar 2024 18:17:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW++5/nzNETbL6W878gZOp4EQcS7nKHe/A2k6/BxhyQ4xjYsfx2ijr9ODB87WfKyHLF4zgtpMVpQQIKPEY69igntcWaySUn
X-Google-Smtp-Source: AGHT+IGSytKgh4nR0xSQZX/nhV5GiW7I51RJMDL3fLU8XluFH6IbegECKTb1Q6z4nEXRiKwkEZiS
X-Received: by 2002:adf:8b59:0:b0:33e:7938:9e65 with SMTP id v25-20020adf8b59000000b0033e79389e65mr2457162wra.18.1710465438935;
        Thu, 14 Mar 2024 18:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710465438; cv=none;
        d=google.com; s=arc-20160816;
        b=VyJDXIgwh8/NqHOlBNAQxP4z69R0pA5vLCGgLZUaB1zk87CRj5GmavDawUNItsp74h
         T3/bOW/4G9rfYTjmYGGSey5PvViFI7sTt86BJEgyDW5XBk6Xd0sEgj5jHSKrIhRWyDw3
         TdSCJ/edHYd1KLjsAct3NZ+PrbIn/3aDxE85fRZMQco+ken6KWArkUSueMZ4D4GjXJIe
         0zNmTTy7+BzViHRxw6pn6lhy0CvRH1PG5QPIBlnyvPSazAtEF8QDtFnUFfeXCGIbWcCY
         FaxOiMHTTW+kLC45OOKOHJAI2lqrB03wULXHqFQTEdphrSJYH1ZM7vAHYKpuXMWSwy8/
         FGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=MiM+GUYjSFm1C/Y3QKN/kEszhsjgD3/6OU9mVTS4XXg=;
        fh=2xkj+qmowNA6/lOEvAFRf4W7XDgo5cxjVf9VWef9hM0=;
        b=zTlfLxug0N98KeGyETvlQXJeP4sIizaiphk5xN0QO73aoofAXCKwYa6arOYP2uTSKS
         tqjP2E5ntsf/cMe6s6o3uHiBIaFw477Fs3PIYzSeLb+PSlSYfiSaRx9sc+SFiy7NPpFw
         2/GKn20qbYL9fK1P307ylxRgrPthrolX6mY4eyELPG8G0mmj2XN8sSUGptADN7OxGsnH
         6wjiw+01ATTFKX0qcNv7u8ZdZtn63UUEwWwaJnzg5MUWAZqEhwcSsu9K9F/Uedb1bK7N
         XemxOaApRm6GBHV9BwRVTU5YgHm4aiQQGmz8c/KdzqNJXIy3Q6Myd/ockWlyozMYqR2Z
         smsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhukeqian1@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=zhukeqian1@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <zhukeqian1@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id f10-20020adffcca000000b0033e7377bd2bsi984209wrs.878.2024.03.14.18.17.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Mar 2024 18:17:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhukeqian1@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of zhukeqian1@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=zhukeqian1@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TwmYq1S60z6K6Sd;
	Fri, 15 Mar 2024 09:17:03 +0800 (CST)
Received: from lhrpeml100003.china.huawei.com (unknown [7.191.160.210])
	by mail.maildlp.com (Postfix) with ESMTPS id AAF92140A36;
	Fri, 15 Mar 2024 09:16:57 +0800 (CST)
Received: from kwepemi500026.china.huawei.com (7.221.188.247) by
 lhrpeml100003.china.huawei.com (7.191.160.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 01:16:41 +0000
Received: from kwepemi500026.china.huawei.com ([7.221.188.247]) by
 kwepemi500026.china.huawei.com ([7.221.188.247]) with mapi id 15.01.2507.035;
 Fri, 15 Mar 2024 09:16:39 +0800
From: zhukeqian <zhukeqian1@huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)"
	<wangyanan55@huawei.com>, "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
	"Wanghaibin (D)" <wanghaibin.wang@huawei.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>, yuzenghui <yuzenghui@huawei.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIFY4IDYvOF0gcGh5c21lbTogQWRkIGhlbHBlciBmdW5j?=
 =?gb2312?Q?tion_to_destroy_CPU_AddressSpace?=
Thread-Topic: [PATCH V8 6/8] physmem: Add helper function to destroy CPU
 AddressSpace
Thread-Index: AQHadCFYAMQRhS7fMEqlDm9aYjar8rE4AmeQ
Date: Fri, 15 Mar 2024 01:16:39 +0000
Message-ID: <7bccde5479f044dc87679236b736b861@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-7-salil.mehta@huawei.com>
In-Reply-To: <20240312020000.12992-7-salil.mehta@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.174.187.224]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: /Kyt76TtK58b

SGkgU2FsaWwsDQoNClsuLi5dDQoNCit2b2lkIGNwdV9hZGRyZXNzX3NwYWNlX2Rlc3Ryb3koQ1BV
U3RhdGUgKmNwdSwgaW50IGFzaWR4KSB7DQorICAgIENQVUFkZHJlc3NTcGFjZSAqY3B1YXM7DQor
DQorICAgIGFzc2VydChjcHUtPmNwdV9hc2VzKTsNCisgICAgYXNzZXJ0KGFzaWR4ID49IDAgJiYg
YXNpZHggPCBjcHUtPm51bV9hc2VzKTsNCisgICAgLyogS1ZNIGNhbm5vdCBjdXJyZW50bHkgc3Vw
cG9ydCBtdWx0aXBsZSBhZGRyZXNzIHNwYWNlcy4gKi8NCisgICAgYXNzZXJ0KGFzaWR4ID09IDAg
fHwgIWt2bV9lbmFibGVkKCkpOw0KKw0KKyAgICBjcHVhcyA9ICZjcHUtPmNwdV9hc2VzW2FzaWR4
XTsNCisgICAgaWYgKHRjZ19lbmFibGVkKCkpIHsNCisgICAgICAgIG1lbW9yeV9saXN0ZW5lcl91
bnJlZ2lzdGVyKCZjcHVhcy0+dGNnX2FzX2xpc3RlbmVyKTsNCisgICAgfQ0KKw0KKyAgICBhZGRy
ZXNzX3NwYWNlX2Rlc3Ryb3koY3B1YXMtPmFzKTsNCisgICAgZ19mcmVlX3JjdShjcHVhcy0+YXMs
IHJjdSk7DQoNCkluIGFkZHJlc3Nfc3BhY2VfZGVzdHJveSgpLCBpdCBjYWxscyBjYWxsX3JjdTEo
KSBvbiBjcHVhcy0+YXMgd2hpY2ggd2lsbCBzZXQgZG9fYWRkcmVzc19zcGFjZV9kZXN0cm95KCkg
YXMgdGhlIHJjdSBmdW5jLg0KQW5kIGdfZnJlZV9yY3UoKSBhbHNvIGNhbGxzIGNhbGxfcmN1MSgp
IG9uIGNwdWFzLT5hcyB3aGljaCB3aWxsIG92ZXJ3cml0ZSB0aGUgcmN1IGZ1bmMgYXMgZ19mcmVl
KCkuDQoNClRoZW4gSSB0aGluayB0aGUgZ19mcmVlKCkgbWF5IGJlIGNhbGxlZCB0d2ljZSBpbiBy
Y3UgdGhyZWFkLCBwbGVhc2UgdmVyaWZ5IHRoYXQuDQoNClRoZSBzb3VyY2UgY29kZSBvZiBjYWxs
X3JjdTE6DQoNCnZvaWQgY2FsbF9yY3UxKHN0cnVjdCByY3VfaGVhZCAqbm9kZSwgdm9pZCAoKmZ1
bmMpKHN0cnVjdCByY3VfaGVhZCAqbm9kZSkpDQp7DQogICAgbm9kZS0+ZnVuYyA9IGZ1bmM7DQog
ICAgZW5xdWV1ZShub2RlKTsNCiAgICBxYXRvbWljX2luYygmcmN1X2NhbGxfY291bnQpOw0KICAg
IHFlbXVfZXZlbnRfc2V0KCZyY3VfY2FsbF9yZWFkeV9ldmVudCk7DQp9DQoNClRoYW5rcywNCktl
cWlhbg0KDQorDQorICAgIGlmIChhc2lkeCA9PSAwKSB7DQorICAgICAgICAvKiByZXNldCB0aGUg
Y29udmVuaWVuY2UgYWxpYXMgZm9yIGFkZHJlc3Mgc3BhY2UgMCAqLw0KKyAgICAgICAgY3B1LT5h
cyA9IE5VTEw7DQorICAgIH0NCisNCisgICAgaWYgKC0tY3B1LT5jcHVfYXNlc19jb3VudCA9PSAw
KSB7DQorICAgICAgICBnX2ZyZWUoY3B1LT5jcHVfYXNlcyk7DQorICAgICAgICBjcHUtPmNwdV9h
c2VzID0gTlVMTDsNCisgICAgfQ0KK30NCisNCiBBZGRyZXNzU3BhY2UgKmNwdV9nZXRfYWRkcmVz
c19zcGFjZShDUFVTdGF0ZSAqY3B1LCBpbnQgYXNpZHgpICB7DQogICAgIC8qIFJldHVybiB0aGUg
QWRkcmVzc1NwYWNlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIHNwZWNpZmllZCBpbmRleCAqLw0KLS0N
CjIuMzQuMQ0KDQo=
