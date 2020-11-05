Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp300762lfb;
        Thu, 5 Nov 2020 02:21:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkTC33YkP/8L0ei4b4SVviBcxb1U69vHFFtFZm0M00FD+PecWVvDB+twPFlQTOiFQaGrQ+
X-Received: by 2002:a25:424b:: with SMTP id p72mr2721941yba.50.1604571683670;
        Thu, 05 Nov 2020 02:21:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604571683; cv=none;
        d=google.com; s=arc-20160816;
        b=skLNSsyEok6rLl/jGWe4u+V2HTxWKErM/2NZgHdBti6WF/MQteQCJgkUHHF8WeoGAe
         BHP5g/PXXSaCNO523xSzhRv1C90UJlzvNHI1IRr7J7qv5tyvkcgaawojwjmHHSAmY/Ea
         GhHuVdGk6fxLszDF2E0EjyxS8xxzKzhxI7rhyLOebMY6lQt8XtxqQAZ8v1uwBe1+ZWx7
         74FrN0D4wiTHGE8MX2tPom3wD0+5Eq+fMNJ3P7STaVHxxRTpWUpgnnxixziN9OTtZht3
         VqX7iogaHv4XTdtbgqpJG3h87bptqc97Fx6socj0mI9CT2LobdMgS861Gqsvxuig3FUq
         gYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=/KtjZPxrEIlH66B5UoDgb9nR/YKcqKnBxjRGTRCNC5k=;
        b=L9j/JPWBkH7aoYX6riZBxKVUJtoIl8fJHhKQvKhhzTEtaFdu1RIyCPa8yRNDELhcAR
         lUROBlw5Kivh8Pkoe7vmUzKBgI61MyvTQfytw/AcCbbmifHFeNHS7sSAULTd3+1QQJDD
         zw+K9+NJ5EJdC1TQ+KxRdH18JfncW49pVENN+rA2NTWavjVaF7YR5uvTx/5bewJa1/7C
         9p5nLjyjpoK1UdPrbQmvT942AOFfiL2UwY3hlSBho4cO+qIEtJwya4w0fEtGT1bmiVJ8
         2jgClC97VpAk/Wk5mJDt7s8OLKCU8hJ/SYGkv3zxFU6E0Pag2B+4Vk6T5RychDh5T2sD
         3OnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si880344ybr.216.2020.11.05.02.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 02:21:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kacOQ-0006IU-W4
	for alex.bennee@linaro.org; Thu, 05 Nov 2020 05:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kacOH-0006IE-5g; Thu, 05 Nov 2020 05:21:14 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kacOD-0000ty-Hx; Thu, 05 Nov 2020 05:21:12 -0500
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4CRfg31rcVz13MHC;
 Thu,  5 Nov 2020 18:20:47 +0800 (CST)
Received: from DGGEML522-MBX.china.huawei.com ([169.254.7.57]) by
 DGGEML401-HUB.china.huawei.com ([fe80::89ed:853e:30a9:2a79%31]) with mapi id
 14.03.0487.000; Thu, 5 Nov 2020 18:20:51 +0800
From: zhangxinhao <zhangxinhao1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMS8zXSB0YXJnZXQvYXJtOiBhZGQgc3BhY2VzIGFy?=
 =?utf-8?Q?ound_operator?=
Thread-Topic: [PATCH 1/3] target/arm: add spaces around operator
Thread-Index: AQHWstUOGWV9G+sfy0aP7wHas2aSuKm5UmJQ
Date: Thu, 5 Nov 2020 10:20:51 +0000
Message-ID: <1B402B07BB975145B1A42DB3F40A115D013F94DB@DGGEML522-MBX.china.huawei.com>
References: <20201103114529.638233-1-zhangxinhao1@huawei.com>
 <CAFEAcA-EXS2czmGNePYcTPT+qJSp7jjHjECdaVRbwSda-zQOcg@mail.gmail.com>
In-Reply-To: <CAFEAcA-EXS2czmGNePYcTPT+qJSp7jjHjECdaVRbwSda-zQOcg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.250]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga08-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 05:21:03
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "dengkai \(A\)" <dengkai1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a7RMz11Cj3Ql

VGhhbmtzIGZvciBhZHZpc2UuIEkgd2lsbCBzdHVkeSB0aGUgZG9jdW1lbnRzIGFuZCBpbmNsdWRl
IGEgY292ZXIgbGV0dGVyIGluIG5leHQgcGF0Y2ggc2VyaWVzIHN1Ym1pc3Npb25zIDopDQoNCi0t
LS0t6YKu5Lu25Y6f5Lu2LS0tLS0NCuWPkeS7tuS6ujogUGV0ZXIgTWF5ZGVsbCBbbWFpbHRvOnBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZ10gDQrlj5HpgIHml7bpl7Q6IDIwMjDlubQxMeaciDXml6Ug
MjowNQ0K5pS25Lu25Lq6OiB6aGFuZ3hpbmhhbyA8emhhbmd4aW5oYW8xQGh1YXdlaS5jb20+DQrm
ioTpgIE6IFFFTVUgRGV2ZWxvcGVycyA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgcWVtdS1hcm0g
PHFlbXUtYXJtQG5vbmdudS5vcmc+OyBkZW5na2FpIChBKSA8ZGVuZ2thaTFAaHVhd2VpLmNvbT47
IENoZW56aGVuZG9uZyAoYWxleCkgPGFsZXguY2hlbkBodWF3ZWkuY29tPjsgUUVNVSBUcml2aWFs
IDxxZW11LXRyaXZpYWxAbm9uZ251Lm9yZz4NCuS4u+mimDogUmU6IFtQQVRDSCAxLzNdIHRhcmdl
dC9hcm06IGFkZCBzcGFjZXMgYXJvdW5kIG9wZXJhdG9yDQoNCk9uIFR1ZSwgMyBOb3YgMjAyMCBh
dCAxMTo0NywgWGluaGFvIFpoYW5nIDx6aGFuZ3hpbmhhbzFAaHVhd2VpLmNvbT4gd3JvdGU6DQo+
DQo+IEZpeCBjb2RlIHN0eWxlLiBPcGVyYXRvciBuZWVkcyBzcGFjZXMgYm90aCBzaWRlcy4NCg0K
VGhhbmtzOyBJIGhhdmUgYXBwbGllZCB0aGlzIHNlcmllcyB0byB0YXJnZXQtYXJtLm5leHQuDQoN
CkZvciBmdXR1cmUgcGF0Y2ggc3VibWlzc2lvbnMsIHBsZWFzZSBjb3VsZCB5b3UgaW5jbHVkZSBh
IGNvdmVyIGxldHRlciBpZiB5b3UncmUgc3VibWl0dGluZyBhIHNlcmllcyB3aXRoIG1vcmUgdGhh
biBvbmUgcGF0Y2ggaW4gaXQ/IChTaW5nbGUgcGF0Y2hlcyBkb24ndCBuZWVkIGEgY292ZXIgbGV0
dGVyKS4gVGhlIGluZGl2aWR1YWwgcGF0Y2hlcyBzaG91bGQgYWxsIHRoZW4gYmUgZm9sbG93LXVw
cyB0byB0aGUgY292ZXIgbGV0dGVyIChpbiB0aGUgdXN1YWwgd2F5IHRoYXQgZ2l0IGZvcm1hdC1w
YXRjaCAtLWNvdmVyLWxldHRlciBzZXRzIHVwKS4NCg0KKFdlIGRvY3VtZW50IHRoaXMgYW5kIG90
aGVyIGNvbnZlbnRpb25zIGZvciBvdXIgY29kZSBzdWJtaXNzaW9uIHByb2Nlc3MgYXQ6DQpodHRw
czovL3dpa2kucWVtdS5vcmcvQ29udHJpYnV0ZS9TdWJtaXRBUGF0Y2ggKQ0KDQp0aGFua3MNCi0t
IFBNTQ0K
