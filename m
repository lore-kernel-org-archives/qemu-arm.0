Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp184804ejy;
        Fri, 23 Sep 2022 01:59:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4IURZWygt1kfRLafHl86Z6hPGQzxK7bqNGsdqkoXydiDKc2dC4fVaE5KWOKyRYA6YPImiq
X-Received: by 2002:a05:620a:1254:b0:6cd:4e36:481d with SMTP id a20-20020a05620a125400b006cd4e36481dmr4753619qkl.661.1663923564019;
        Fri, 23 Sep 2022 01:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663923564; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6jB1STedZQdEYgihINe2GiwddNpw13f3pZhAML9YyUqdRX6/dXoM3cB96sVnyHw6E
         CgYSnGL6oqhByuU9kfX5NGVfH1lKQNiWCTVAkXYI4KZ9aYXK78rf8f0/Jlfqp2xP+/H5
         0YaYtwg4PIUWkCFLAy/Mn/MY2osw5AmIClQ4NwYKCfxDJmeUSxhE60HBlp8fmZ4/97ZD
         feaJlkHQZwZIr9Wn3lHhFWh24GduEAFcCPhJgwW3DDKGOytS6v0NKmg5nMxy0Iit8Ki9
         w6mVKVZHeKaBK3OaWxLjkLR0/pM+kO7zdzPGka3sXgnPQnW/UHsd6OiHpXk5+HLJQtP5
         ceFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:cc:to;
        bh=ehHzURrTPmXNyvonnfwxhkHLRLQD+EWE7JEb54D9ZwU=;
        b=tJWaBqqKIAHs1ht3y5c7nhVE+ojDGqdIuX/f0w4H7vq2RJNGO3HM+tNrXADrPBdtwV
         1alOl8045dpU4tlVEicRn7FFLf6W52SjqoDatsUDhzfahtF72X3SO7Zf2SR42TTbqEL+
         wwpNhdT2kKfwJUqvP7TrM5hOXsspel9oKOHHo7lNffDS23vMngE9cRa0hn30WjaQw/qj
         woUi/28prEetwy76T1XeR1ojLPVeVKTJzXeUbCvygTEnz0q3+rGkEFwZyMcZfz5F8KC/
         hLI43qNurVk1t2P8czlolnW1RjqpNVOSQ8CCc0tNEUjWMB/pXYV1vD7CyiPlRGPcHQvD
         /cDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cg3-20020a05622a408300b003445ee73e18si3881706qtb.685.2022.09.23.01.59.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Sep 2022 01:59:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:42382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obeWn-0005Yn-KM
	for alex.bennee@linaro.org; Fri, 23 Sep 2022 04:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1obeWI-0005WB-Sz; Fri, 23 Sep 2022 04:58:51 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1obeWG-0001sM-5g; Fri, 23 Sep 2022 04:58:50 -0400
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYmFt2C8dzpTsc;
 Fri, 23 Sep 2022 16:55:46 +0800 (CST)
Received: from dggpeml100021.china.huawei.com (7.185.36.148) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 16:58:37 +0800
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 dggpeml100021.china.huawei.com (7.185.36.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 16:58:36 +0800
Received: from kwepemm600016.china.huawei.com ([7.193.23.20]) by
 kwepemm600016.china.huawei.com ([7.193.23.20]) with mapi id 15.01.2375.031;
 Fri, 23 Sep 2022 16:58:36 +0800
To: Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>, "Wanghaibin
 (D)" <wanghaibin.wang@huawei.com>
Subject: Re: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
Thread-Topic: [PATCH v2] hw/acpi: Add ospm_status hook implementation for
 acpi-ged
Thread-Index: AdjPKnJtqSBn4jhsHkm9jn/UrlgR8g==
Date: Fri, 23 Sep 2022 08:58:36 +0000
Message-ID: <521edea5d2894a50874463ba812b0169@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.224]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=zhukeqian1@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  zhukeqian <zhukeqian1@huawei.com>
From:  zhukeqian via <qemu-arm@nongnu.org>
X-TUID: 1c0M/BMgT4Ss

Pj4gPiBJIG5vdGljZSB0aGlzIGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGdvbmUgaW4geWV0IC0tIHdo
b3NlIHRyZWUgaXMgaXQgDQo+PiA+IGdvaW5nIHRvIGdvIHZpYT8NCj4+DQo+PiBJJ2QgZ3Vlc3Mg
QVJNIHRyZWUgKGR1ZSB0byBhbG1vc3Qgc29sZSB1c2VyIHZpcnQtYXJtKS4NCj4+ICh0aGVyZSBh
cmUgdG95IHVzZXJzIGxpa2UgbWljcm92bSBhbmQgbmV3IGxvb25nYXJjaCkNCj4NCj5PSzsgYXBw
bGllZCB0byB0YXJnZXQtYXJtLm5leHQsIHRoYW5rcy4NCg0KVGhhbmtzLCBQZXRlci4NCg0KS2Vx
aWFuLg0K
