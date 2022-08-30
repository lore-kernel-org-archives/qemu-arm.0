Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2170793ejh;
        Mon, 29 Aug 2022 23:47:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uq/2ovYMRM6cu2C+tDorBLvGEShJ+I2LIyPRiZ9UzEO9nSqVYKDrWgo85gWCyYsMsL32Y
X-Received: by 2002:a05:622a:608:b0:344:a856:c24 with SMTP id z8-20020a05622a060800b00344a8560c24mr13377023qta.678.1661842036852;
        Mon, 29 Aug 2022 23:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661842036; cv=none;
        d=google.com; s=arc-20160816;
        b=J+8D+/pnJuM3LzLE8fh6HVKGQw752/m05G9oYdRo84fHC7M7TpudySsQq+Nqz6rcBp
         RzHTOknT1ayGf6kk31qKz5GLf/UZAXmLsUhAeTfYKg2xOcc/keV9cTWD2hHQ1E06C2FT
         3GX7QSkOVG7uhN8QWZrUYhBXa4OJO51ysAx33CsYPTVh0SlJdh6PWVrx1zn+Mp3ER6ne
         UNlYDDD40FIQa8JWUzgPj/v92VsI/zQyZe/HbMJJrVrYBkWTEQOnfhi2vExftWG9NdO+
         KBMcUXn80d5fs8QkvP+Xjvsjrgi+/cJ+wKJWbr23FywaQqc5m5kajLryKILksfQffi2M
         M6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :references:message-id:date:thread-index:thread-topic:subject:cc:to;
        bh=ftKlQ0oWHExdmjv4ywiTaTYbkT1V9Dj2Say041Mkzjs=;
        b=EoSEhZiMlRH/vMvewSSZ7Db85TXSEbf4mP+yLd9nm3JulseX4JU+cjPQcg07sxQsP3
         oATWf07wSVGAcGgFIGcoTREkU8TmwgXudCZpNa8KN6JxFrAfWkgdoeqdml1gB1iqlZD1
         scdw6Nl86K6rdjA4TTUla3fG1UXL0jgYPShYb56c4gOFX4dw7IYj2wsPrJCmcVxBaqBr
         ONIuuaZy3cNiVXY+kbscS5LxJKYqcYq3cD3U6oK393/Ry5oHYgpuywYX2sgTd2wnJLOF
         tMYEol1yuUDIIHiTMXsfeC+2k5viyyj6SwSNUCUvfySJQzlP1sl3J6s+Eeyz5PMJlXb6
         iDLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020ac85406000000b00342f955de38si4829144qtq.339.2022.08.29.23.47.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Aug 2022 23:47:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oSv1o-0004Tg-AU
	for alex.bennee@linaro.org; Tue, 30 Aug 2022 02:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1oSuyz-0003yi-La; Tue, 30 Aug 2022 02:44:23 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1oSuyu-000497-UR; Tue, 30 Aug 2022 02:44:19 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4MGyMr50ynzPrsR;
 Tue, 30 Aug 2022 14:39:36 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 30 Aug 2022 14:43:58 +0800
Received: from lhrpeml500005.china.huawei.com ([7.191.163.240]) by
 lhrpeml500005.china.huawei.com ([7.191.163.240]) with mapi id 15.01.2375.024; 
 Tue, 30 Aug 2022 07:43:56 +0100
To: Laszlo Ersek <lersek@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: "imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Linuxarm <linuxarm@huawei.com>, "chenxiang (M)"
 <chenxiang66@hisilicon.com>, "Ard Biesheuvel (kernel.org address)"
 <ardb@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, "Christian A. Ehrhardt"
 <lk@c--e.de>
Subject: RE: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
Thread-Topic: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
Thread-Index: AQHYuJ5p23rvTq/DF0St1dy35YWrx63BBLQAgAAB6oCAABHCkIAF7EsQ
Date: Tue, 30 Aug 2022 06:43:56 +0000
Message-ID: <ab49a753129e48bd96cb44d876ddf1cf@huawei.com>
References: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
 <43c62060-7a5d-25cf-91a3-1c391d3a58f9@redhat.com>
 <ab43b53b-546a-4056-0e91-31691f716109@redhat.com> 
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.195.34.255]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-arm@nongnu.org>
X-TUID: 6H/IjMNE5n1G

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhbWVlcmFsaSBLb2xv
dGh1bSBUaG9kaQ0KPiBTZW50OiAyNiBBdWd1c3QgMjAyMiAxMzoxNQ0KPiBUbzogJ0xhc3psbyBF
cnNlaycgPGxlcnNla0ByZWRoYXQuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOw0KPiBxZW11
LWFybUBub25nbnUub3JnDQo+IENjOiBpbWFtbWVkb0ByZWRoYXQuY29tOyBwZXRlci5tYXlkZWxs
QGxpbmFyby5vcmc7IExpbnV4YXJtDQo+IDxsaW51eGFybUBodWF3ZWkuY29tPjsgY2hlbnhpYW5n
IChNKSA8Y2hlbnhpYW5nNjZAaGlzaWxpY29uLmNvbT47IEFyZA0KPiBCaWVzaGV1dmVsIChrZXJu
ZWwub3JnIGFkZHJlc3MpIDxhcmRiQGtlcm5lbC5vcmc+OyBHZXJkIEhvZmZtYW5uDQo+IDxrcmF4
ZWxAcmVkaGF0LmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZndfY2ZnOiBEb24ndCBzZXQg
Y2FsbGJhY2tfb3BhcXVlIE5VTEwgaW4NCj4gZndfY2ZnX21vZGlmeV9ieXRlc19yZWFkKCkNCj4g
DQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IExhc3ps
byBFcnNlayBbbWFpbHRvOmxlcnNla0ByZWRoYXQuY29tXQ0KPiA+IFNlbnQ6IDI2IEF1Z3VzdCAy
MDIyIDEzOjA3DQo+ID4gVG86IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkNCj4gPHNoYW1lZXJh
bGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT47DQo+ID4gcWVtdS1kZXZlbEBub25nbnUub3Jn
OyBxZW11LWFybUBub25nbnUub3JnDQo+ID4gQ2M6IGltYW1tZWRvQHJlZGhhdC5jb207IHBldGVy
Lm1heWRlbGxAbGluYXJvLm9yZzsgTGludXhhcm0NCj4gPiA8bGludXhhcm1AaHVhd2VpLmNvbT47
IGNoZW54aWFuZyAoTSkgPGNoZW54aWFuZzY2QGhpc2lsaWNvbi5jb20+Ow0KPiBBcmQNCj4gPiBC
aWVzaGV1dmVsIChrZXJuZWwub3JnIGFkZHJlc3MpIDxhcmRiQGtlcm5lbC5vcmc+OyBHZXJkIEhv
ZmZtYW5uDQo+ID4gPGtyYXhlbEByZWRoYXQuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGZ3X2NmZzogRG9uJ3Qgc2V0IGNhbGxiYWNrX29wYXF1ZSBOVUxMIGluDQo+ID4gZndfY2ZnX21v
ZGlmeV9ieXRlc19yZWFkKCkNCj4gPg0KPiA+ICtBcmQgK0dlcmQsIG9uZSBwb2ludGVyIGF0IHRo
ZSBib3R0b20NCj4gPg0KPiA+IE9uIDA4LzI2LzIyIDEzOjU5LCBMYXN6bG8gRXJzZWsgd3JvdGU6
DQo+ID4gPiBPbiAwOC8yNS8yMiAxODoxOCwgU2hhbWVlciBLb2xvdGh1bSB3cm90ZToNCj4gPiA+
PiBIaQ0KPiA+ID4+DQo+ID4gPj4gT24gYXJtL3ZpcnQgcGxhdGZvcm0sIENoZW4gWGlhbmcgcmVw
b3J0ZWQgYSBHdWVzdCBjcmFzaCB3aGlsZQ0KPiA+ID4+IGF0dGVtcHRpbmcgdGhlIGJlbG93IHN0
ZXBzLA0KPiA+ID4+DQo+ID4gPj4gMS4gTGF1bmNoIHRoZSBHdWVzdCB3aXRoIG52ZGltbT1vbg0K
PiA+ID4+IDIuIEhvdC1hZGQgYSBOVkRJTU0gZGV2DQo+ID4gPj4gMy4gUmVib290DQo+ID4gPj4g
NC4gR3Vlc3QgYm9vdHMgZmluZS4NCj4gPiA+PiA1LiBSZWJvb3QgYWdhaW4uDQo+ID4gPj4gNi4g
R3Vlc3QgYm9vdCBmYWlscy4NCj4gPiA+Pg0KPiA+ID4+IFFFTVVfRUZJIHJlcG9ydHMgdGhlIGJl
bG93IGVycm9yOg0KPiA+ID4+IFByb2Nlc3NDbWRBZGRQb2ludGVyOiBpbnZhbGlkIHBvaW50ZXIg
dmFsdWUgaW4gImV0Yy9hY3BpL3RhYmxlcyINCj4gPiA+PiBPblJvb3RCcmlkZ2VzQ29ubmVjdGVk
OiBJbnN0YWxsQWNwaVRhYmxlczogUHJvdG9jb2wgRXJyb3INCj4gPiA+Pg0KPiA+ID4+IERlYnVn
Z2luZyBzaG93cyB0aGF0IG9uIGZpcnN0IHJlYm9vdChhZnRlciBob3QtYWRkaW5nIE5WRElNTSks
DQo+ID4gPj4gUWVtdSB1cGRhdGVzIHRoZSBldGMvdGFibGUtbG9hZGVyIGxlbiwNCj4gPiA+Pg0K
PiA+ID4+IHFlbXVfcmFtX3Jlc2l6ZSgpDQo+ID4gPj4gwqAgZndfY2ZnX21vZGlmeV9maWxlKCkN
Cj4gPiA+PiDCoCDCoCDCoGZ3X2NmZ19tb2RpZnlfYnl0ZXNfcmVhZCgpDQo+ID4gPj4NCj4gPiA+
PiBBbmQgaW4gZndfY2ZnX21vZGlmeV9ieXRlc19yZWFkKCkgd2Ugc2V0IHRoZSAiY2FsbGJhY2tf
b3BhcXVlIiBmb3INCj4gPiA+PiB0aGUgImtleSIgZW50cnkgdG8gTlVMTC4gQmVjYXVzZcKgb2Yg
dGhpcywgb24gdGhlIHNlY29uZCByZWJvb3QsDQo+ID4gPj4gdmlydF9hY3BpX2J1aWxkX3VwZGF0
ZSgpIGlzIGNhbGxlZCB3aXRoIGEgTlVMTCAiYnVpbGRfc3RhdGUiIGFuZA0KPiA+ID4+IHJldHVy
bnMgd2l0aG91dCB1cGRhdGluZyB0aGUgQUNQSSB0YWJsZXMuIFRoaXMgc2VlbXMgdG8gYmUNCj4g
PiA+PiB1cHNldHRpbmcgdGhlIGZpcm13YXJlLg0KPiA+ID4+DQo+ID4gPj4gVG8gZml4IHRoaXMs
IGRvbid0IGNoYW5nZSB0aGUgY2FsbGJhY2tfb3BhcXVlIGluDQo+ID4gZndfY2ZnX21vZGlmeV9i
eXRlc19yZWFkKCkuDQo+ID4gPj4NCj4gPiA+PiBSZXBvcnRlZC1ieTogY2hlbnhpYW5nIDxjaGVu
eGlhbmc2NkBoaXNpbGljb24uY29tPg0KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IFNoYW1lZXIgS29s
b3RodW0NCj4gPiA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPg0KPiA+ID4+
IC0tLQ0KPiA+ID4+IEkgYW0gc3RpbGwgbm90IHZlcnkgY29udmluY2VkIHRoaXMgaXMgdGhlIHJv
b3QgY2F1c2Ugb2YgdGhlIGlzc3VlLg0KPiA+ID4+IFRob3VnaCBpdCBsb29rcyBsaWtlIHNldHRp
bmcgY2FsbGJhY2tfb3BhcXVlIHRvIE5VTEwgd2hpbGUgdXBkYXRpbmcNCj4gPiA+PiB0aGUgZmls
ZSBzaXplIGlzIHdyb25nLCB3aGF0IHB1enpsZXMgbWUgaXMgdGhhdCBvbiB0aGUgc2Vjb25kIHJl
Ym9vdA0KPiA+ID4+IHdlIGRvbid0IGhhdmUgYW55IEFDUEkgdGFibGUgc2l6ZSBjaGFuZ2VzIGFu
ZCBpZGVhbGx5IGZpcm13YXJlIHNob3VsZA0KPiA+ID4+IHNlZSB0aGUgdXBkYXRlZCB0YWJsZXMg
ZnJvbSB0aGUgZmlyc3QgcmVib290IGl0c2VsZi4NCj4gPiA+Pg0KPiA+ID4+IFBsZWFzZSB0YWtl
IGEgbG9vayBhbmQgbGV0IG1lIGtub3cuDQo+ID4gPj4NCj4gPiA+PiBUaGFua3MsDQo+ID4gPj4g
U2hhbWVlcg0KPiA+ID4+DQo+ID4gPj4gLS0tDQo+ID4gPj4gIGh3L252cmFtL2Z3X2NmZy5jIHwg
MSAtDQo+ID4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+ID4gPj4NCj4gPiA+
PiBkaWZmIC0tZ2l0IGEvaHcvbnZyYW0vZndfY2ZnLmMgYi9ody9udnJhbS9md19jZmcuYw0KPiA+
ID4+IGluZGV4IGQ2MDVmM2Y0NWEuLmRmZTg0MDRjMDEgMTAwNjQ0DQo+ID4gPj4gLS0tIGEvaHcv
bnZyYW0vZndfY2ZnLmMNCj4gPiA+PiArKysgYi9ody9udnJhbS9md19jZmcuYw0KPiA+ID4+IEBA
IC03MjgsNyArNzI4LDYgQEAgc3RhdGljIHZvaWQNCj4gPiAqZndfY2ZnX21vZGlmeV9ieXRlc19y
ZWFkKEZXQ2ZnU3RhdGUgKnMsIHVpbnQxNl90IGtleSwNCj4gPiA+PiAgICAgIHB0ciA9IHMtPmVu
dHJpZXNbYXJjaF1ba2V5XS5kYXRhOw0KPiA+ID4+ICAgICAgcy0+ZW50cmllc1thcmNoXVtrZXld
LmRhdGEgPSBkYXRhOw0KPiA+ID4+ICAgICAgcy0+ZW50cmllc1thcmNoXVtrZXldLmxlbiA9IGxl
bjsNCj4gPiA+PiAtICAgIHMtPmVudHJpZXNbYXJjaF1ba2V5XS5jYWxsYmFja19vcGFxdWUgPSBO
VUxMOw0KPiA+ID4+ICAgICAgcy0+ZW50cmllc1thcmNoXVtrZXldLmFsbG93X3dyaXRlID0gZmFs
c2U7DQo+ID4gPj4NCj4gPiA+PiAgICAgIHJldHVybiBwdHI7DQo+ID4gPj4NCj4gPiA+DQo+ID4g
PiBJIHZhZ3VlbHkgcmVjYWxsIHNlZWluZyB0aGUgc2FtZSBpc3N1ZSByZXBvcnQgeWVhcnMgYWdv
IChhbHNvIGluDQo+ID4gPiByZWxhdGlvbiB0byBob3QtYWRkaW5nIE5WRElNTSkuIEhvd2V2ZXIs
IEkgaGF2ZSBubyBjYXBhY2l0eSB0bw0KPiA+ID4gcGFydGljaXBhdGUgaW4gdGhlIGRpc2N1c3Np
b24uIE1ha2luZyB0aGlzIHJlbWFyayBqdXN0IGZvciBjbGFyaXR5Lg0KPiA+DQo+ID4gVGhlIGVh
cmxpZXIgcmVwb3J0IEkndmUgaGFkIGluIG1pbmQgd2FzIGZyb20gU2hhbWVlciBhcyB3ZWxsOg0K
PiA+DQo+ID4NCj4gaHR0cDovL21pZC5tYWlsLWFyY2hpdmUuY29tLzVGQzMxNjNDRkQzMEMyNDZB
QkFBOTk5NTRBMjM4RkE4M0YzRg0KPiA+IEIzMjhAbGhyZW1sNTI0LW1icy5jaGluYS5odWF3ZWku
Y29tDQo+IA0KPiBSaWdodC4gVGhhdCB3YXMgYSBzbGlnaHRseSBkaWZmZXJlbnQgaXNzdWUgdGhv
dWdoLiBJdCB3YXMgYmFzaWNhbGx5IEFDUEkgdGFibGUNCj4gc2l6ZSBub3QNCj4gZ2V0dGluZyB1
cGRhdGVkIG9uIHRoZSBmaXJzdCByZWJvb3Qgb2YgR3Vlc3QgYWZ0ZXIgd2UgaG90LWFkZCBOVkRJ
TU0gZGV2Lg0KPiBUaGUgZXJyb3INCj4gZnJvbSBmaXJtd2FyZSB3YXMgZGlmZmVyZW50IGluIHRo
YXQgY2FzZSwNCj4gDQo+IFByb2Nlc3NDbWRBZGRDaGVja3N1bTogaW52YWxpZCBjaGVja3N1bSBy
YW5nZSBpbiAiZXRjL2FjcGkvdGFibGVzIg0KPiBPblJvb3RCcmlkZ2VzQ29ubmVjdGVkOiBJbnN0
YWxsQWNwaVRhYmxlczogUHJvdG9jb2wgRXJyb3INCj4gDQo+IEFuZCBpdCB3YXMgZml4ZWQgd2l0
aCB0aGlzIHNlcmllcyBoZXJlLA0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvcWVtdS1kZXZlbC9jb3Zlci8yMDIwMDQwMzEwMTgyNy4zDQo+IDA2NjQtMS1zaGFtZWVyYWxp
LmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20vDQo+IA0KPiBUaGUgY3VycmVudCBpc3N1ZSBvbmx5
IGhhcHBlbnMgb24gdGhlIHNlY29uZCByZWJvb3Qgb2YgdGhlIEd1ZXN0IGFzDQo+IGRlc2NyaWJl
ZCBpbg0KPiB0aGUgc3RlcHMgYWJvdmUuDQo+IA0KDQpbK0NocmlzdGlhbl0NCg0KSSBqdXN0IGZv
dW5kIHRoYXQgYSBzaW1pbGFyIGlzc3VlIHdhcyByZXBvcnRlZCBoZXJlIHNvbWV0aW1lIGJhY2sg
b24gUTM1L1dpbmRvd3MNCnNldHVwLA0KaHR0cHM6Ly9wYXRjaGV3Lm9yZy9RRU1VL1lsZEZNVGJG
TFVjZEZJZmFAY2FlLmluLXVsbS5kZS8NCg0KQnV0IHRoZXJlIGFyZSBubyBmdXJ0aGVyIGRpc2N1
c3Npb25zIG9uIHRoYXQgdGhyZWFkLg0KDQpUaGFua3MsDQpTaGFtZWVyDQoNCg==
