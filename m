Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp665188lfg;
        Wed, 24 Feb 2021 07:39:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuqgBo8mNmVWZNNkUj+WATRoEwkYs3f4gh4apUIj9Ly7teqjkL1Tdvv6icgmi0XSji/1yo
X-Received: by 2002:a6b:5b0f:: with SMTP id v15mr24850027ioh.78.1614181181775;
        Wed, 24 Feb 2021 07:39:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614181181; cv=none;
        d=google.com; s=arc-20160816;
        b=CGqgHDBv8qziCzSj1qQ3/KU73BU8H/9x44jFNL2X3XMkQk+DW4phGmBSNlxvcQV6jB
         lnKEljpzRYRuZGgkXwPgGq78O3SXdGid5gQeoqbobPdCkfpP3qVJZJufXlBaYlTq+IS9
         wgQEzV0tohsiSO3po6DJYSoNFdLAeBmIQjSjAoe6PMHMrryWpwmYi8NncruCCrUlxWpd
         by9jPnh8jnSF2Ce1Er3Jz/48GuIk7PLLrC/sjFWH1lp8wpsNCwCPRQAQvWLtK004NmE/
         EGo/JpkPaNNSKOKjqaYnTu50NstAebEb2w63lwyoR5r6KJJMOcDxgUrqQ7q3HdVWK0Is
         qRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=wcvO80PB4Mm9eVNcFCpfntalBgZqOcSgRtKUaMTOGgE=;
        b=mfigPOAveJsNb4vA5+upbcthNtjQQ+C4syEMlMgQ7nmVMGCgeaAbMEhDCl+i++6hEh
         MCPE+emOOSbHiu4rwoUdPCGixS0LwQHp4AjizLXozrN2Up9XV6kXhZHdCD1oQO0+cUUV
         ZZiJL897FRAqWRA1SmW4x3QD8IvaVKidOB+XQy1/B0T75zhFzJtji50Nw6PINJVyZ99u
         eDKSvEfdd4iGVFJIxIbL6H09cq6U1F9ZQfe/XzZhF5P//XX7/7F+hiC3ijCWWU+o1oCu
         CQxa6iVMcv1/zNm54EZHvWy/ikm6qm/zhdm40b/fT4iUI6h+WznsQhFs5F4AkCvF+y97
         0w9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si2228562ilu.92.2021.02.24.07.39.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 07:39:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEwGL-0000gs-2W
	for alex.bennee@linaro.org; Wed, 24 Feb 2021 10:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1lEwG0-0000fV-Jw; Wed, 24 Feb 2021 10:39:21 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1lEwFw-0002rJ-Bg; Wed, 24 Feb 2021 10:39:20 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Dm0Qf6N5sz5Vhc;
 Wed, 24 Feb 2021 23:36:58 +0800 (CST)
Received: from dggpemm100012.china.huawei.com (7.185.36.212) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 24 Feb 2021 23:38:59 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggpemm100012.china.huawei.com (7.185.36.212) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 23:38:58 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2106.006; Wed, 24 Feb 2021 15:38:56 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [RFC v7 26/26] vfio/pci: Implement return_page_response page
 response callback
Thread-Topic: [RFC v7 26/26] vfio/pci: Implement return_page_response page
 response callback
Thread-Index: AQHWvEUTUiE9WTe+7E+ovBX+zyeIRqpeRGbwgAAIYwCAAA9WoIAAIHCAgAlxCQCAAB3dwA==
Date: Wed, 24 Feb 2021 15:38:56 +0000
Message-ID: <0c74eadade7b45c7b59cf38a205af396@huawei.com>
References: <20201116181349.11908-1-eric.auger@redhat.com>
 <20201116181349.11908-27-eric.auger@redhat.com>
 <494e4bdf5ecd4b528a016d4545d45f71@huawei.com>
 <f11ef533-da64-3d6a-24f5-79d5e7a205da@redhat.com>
 <5f85d8999c0c40a29c32ac63b8730fa8@huawei.com>
 <679c5696-c73f-517d-f555-90ec2c767fbb@redhat.com>
 <41b9d3a2-1199-5dad-876b-10efa51638bb@redhat.com>
In-Reply-To: <41b9d3a2-1199-5dad-876b-10efa51638bb@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.95.44]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=szxga03-in.huawei.com
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "tn@semihalf.com" <tn@semihalf.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "vivek.gautam@arm.com" <vivek.gautam@arm.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "zhangfei.gao@gmail.com" <zhangfei.gao@gmail.com>,
 yuzenghui <yuzenghui@huawei.com>, qubingbing <qubingbing@hisilicon.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GGriHuP3wFB3

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiAyNCBGZWJydWFyeSAy
MDIxIDEzOjQ0DQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtv
bG90aHVtLnRob2RpQGh1YXdlaS5jb20+Ow0KPiBlcmljLmF1Z2VyLnByb0BnbWFpbC5jb207IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1Abm9uZ251Lm9yZzsNCj4gYWxleC53aWxsaWFt
c29uQHJlZGhhdC5jb20NCj4gQ2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgamFjb2IuanVu
LnBhbkBsaW51eC5pbnRlbC5jb207DQo+IHpoYW5nZmVpLmdhb0BnbWFpbC5jb207IGplYW4tcGhp
bGlwcGVAbGluYXJvLm9yZzsgdG5Ac2VtaWhhbGYuY29tOw0KPiBwZXRlcnhAcmVkaGF0LmNvbTsg
bmljb2xlb3RzdWthQGdtYWlsLmNvbTsgdml2ZWsuZ2F1dGFtQGFybS5jb207DQo+IHlpLmwubGl1
QGludGVsLmNvbTsgWmVuZ3RhbyAoQikgPHByaW1lLnplbmdAaGlzaWxpY29uLmNvbT47IHl1emVu
Z2h1aQ0KPiA8eXV6ZW5naHVpQGh1YXdlaS5jb20+OyBxdWJpbmdiaW5nIDxxdWJpbmdiaW5nQGhp
c2lsaWNvbi5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkZDIHY3IDI2LzI2XSB2ZmlvL3BjaTogSW1w
bGVtZW50IHJldHVybl9wYWdlX3Jlc3BvbnNlIHBhZ2UNCj4gcmVzcG9uc2UgY2FsbGJhY2sNCj4g
DQo+IEhpIFNoYW1lZXIsDQpbLi4uXQ0KIA0KPiBJIHNlbnQgdGhlIHJlc3BpbiBvbiB0b3Agb2Yg
bWFzdGVyIGJyYW5jaCArIEplYW4tUGhpbGlwcGUncw0KPiBbUEFUQ0ggdjEyIDAwLzEwXSBpb21t
dTogSS9PIHBhZ2UgZmF1bHRzIGZvciBTTU1VdjMuDQo+IGJlY2F1c2UgSSB0aG91Z2h0IGl0IG1h
a2VzIG1vcmUgc2Vuc2UgdG8gcG9zdCBvbiBtYXN0ZXIgKyBzb21lIG5lYXJseQ0KPiAicmVhZHkg
dG8gZ28iIHN0dWZmLg0KDQpZZXMuIEkgc2VlIHRoYXQuIFRoYW5rcyBmb3IgdGhlIHJlc3Bpbi4g
V2lsbCB0YWtlIGEgbG9vayBhdCB0aGlzIHNvb24uDQoNCj4gDQo+IE5ldmVydGhlbGVzcyBJIHdp
bGwgZG8gbXkgYmVzdCB0byBwcmVwYXJlIGFzYXAgYSBicmFuY2ggYmFzZWQgb24gSmVhbidzDQo+
IHN2YS9jdXJyZW50IGJyYW5jaCAoYmFzZWQgb24gNS4xMS1yYzUpDQoNCk9rLg0KDQpDaGVlcnMs
DQpTaGFtZWVyDQoNCg0K
