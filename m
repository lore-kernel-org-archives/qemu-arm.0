Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp7907908wrp;
        Tue, 1 Oct 2019 01:39:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzGlsoX3lGN3rj+umy+B9R0hkbwMRO7e6nrFwysLqaQytIcWi5t8ODCOs4jIXlPcG3Z4vZ
X-Received: by 2002:a17:906:d797:: with SMTP id pj23mr23166589ejb.70.1569919175200;
        Tue, 01 Oct 2019 01:39:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569919175; cv=pass;
        d=google.com; s=arc-20160816;
        b=GV+VHlRKY50JqS8rlu52hyhoZBMQ4YB25caeYQxebS+5pf2DPKWqGut2+mjjM/CY9n
         y9gzYTIzZA0yuiF9Iq0u+wHrTUP2OBsWRviL1p6c3OQR60K8vZFWTYNKaWBdW5z/n2GX
         N3eWpcVDCe9nn8gQNvuoTEqtVtS06oxSQXkw6qjuh+eErxpfZQldAxLgRlssDxdjpmTc
         si4tC+sAgesh8FFat1Q/W4EgUDudPRtkBp992p5oVDTeyGo2Du+g50zoDO8MW9J37mdh
         FO4FFBoaruBeZIl5H7PfUE/ArkltI2LaQJIXvKY36c3XsYGBaCI89eLgp4REf7lqdrtt
         Y1Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=XYZxFYvk1ElGcLTIZMbyWmQjazVlgp+onA6TnXt6/rU=;
        b=lrjfQV94PrNVpOeKgTFtSxxJGftoGTWiuoPUlHgOQl0x0Vmii8V/cejrmihNpdEfTg
         zuyDk1Ugz9Ln71151hihVr/2KZHhMzLGHfCasAp0l/Cd8imJI/Xncnf8GwHG9/ZRREBW
         Ur7aCDj8lEzyExVjxO1skAH9Fhmo7GZ9htyd0ARGO/XlRhchHKjYuGlj3C88E0ksQx6u
         vl/pCVJ8RVF5ZV0Cwnnr3vw5J9/rFB6zL/k+dTqBPJvmFyXsDZSeycSdUbAGMEiEtsbq
         7EhXuYHEJkFtgUkymYobCPoYmF5EU7nCD1thkhr6LZLBWbLrrYHvR9CTGnuYW3knIFoV
         MrKg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@virtuozzo.com header.s=selector2 header.b=lptlq7gm;
       arc=pass (i=1 spf=pass spfdomain=virtuozzo.com dkim=pass dkdomain=virtuozzo.com dmarc=pass fromdomain=virtuozzo.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h50si8543434ede.423.2019.10.01.01.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 01:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@virtuozzo.com header.s=selector2 header.b=lptlq7gm;
       arc=pass (i=1 spf=pass spfdomain=virtuozzo.com dkim=pass dkdomain=virtuozzo.com dmarc=pass fromdomain=virtuozzo.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFDh0-0003mY-4o
	for alex.bennee@linaro.org; Tue, 01 Oct 2019 04:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFDgm-0003kC-LF
 for qemu-arm@nongnu.org; Tue, 01 Oct 2019 04:39:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFDgl-0001QW-HV
 for qemu-arm@nongnu.org; Tue, 01 Oct 2019 04:39:20 -0400
Received: from mail-eopbgr70103.outbound.protection.outlook.com
 ([40.107.7.103]:26946 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iFDgf-0001LY-Ia; Tue, 01 Oct 2019 04:39:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ahv8btqKIZaI/Pu2V3uKVjf93U4vEObnCDCBVIRga5in+WtM8dqZ2E4fuhdY5IHZ6X4/2HBMDXwedh23ddCnrYLE1P1TYreH7aYmyO/5mmTlm+GEDuSeQMdDymRamSvgYHYjFPraLuShokXrdf6kite0yoZywUoJFs7p6NnyQIoWUc4vEC1+PBplUz93RRTgRtz3M1EvDL0dckEHBihoa7fozW+pSxkiKM4mxOzCDjtqhLhY6S/bVbOyBfj/zhntweb9LSJhxFDCf7n5I67ocJyUnkBEy4PVHZNRvxCbSdShA4hYTvj7N2xta0gkVkOa5Wsguryo2kA/OE4on5dBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYZxFYvk1ElGcLTIZMbyWmQjazVlgp+onA6TnXt6/rU=;
 b=X62xdiByBGTFlAkY/cywKEk9s9VcjrfdNoMSQdTBfLnP+ZS9YGwrbpAh0iSoqmFtSiR7J3h8Oj6rekCNBztRdHdL56OWszJqCC8Hu3bwJuktcIPH4RfgH6qOL++dDQq58ClWYtfRDHXZsAYBr0MrxLDTZWriikFhK3YvDk66dipYmy8mU9ZYtt+tvnyZqbOn47wnj4kgt9BVikG15fjoR3c66laKoP7A+NB/H7wbWNrxVchFqzywGHZugR1Q4TI+y/ZAdx5QowMY03Shyp5c8YOSYoNIXEuh8TH3TY9g6/olbB70NnWEjw55SLpZhSHK87glXkIiK7aXDTS5+VskMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYZxFYvk1ElGcLTIZMbyWmQjazVlgp+onA6TnXt6/rU=;
 b=lptlq7gmjzBu2/fq09KLebawTtJjAa6PHJ6nCAZBVCIDvoIw8iIwLNq0lqd5HjU/CHvXhGU252FkwDG6sNI5eNA1G2YW015/nWtuB/+q2N/fV5KBmTQhHtuEDbSWPV4ci7LjBVQFzbYG916K4kuyfEEcuOJ3OMzi0lqSCD+diTw=
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com (52.133.242.216) by
 DB8PR08MB5180.eurprd08.prod.outlook.com (10.255.18.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 08:39:09 +0000
Received: from DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f]) by DB8PR08MB5498.eurprd08.prod.outlook.com
 ([fe80::2856:990a:197a:288f%2]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 08:39:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 04/25] error: auto propagated local_err
Thread-Topic: [PATCH v3 04/25] error: auto propagated local_err
Thread-Index: AQHVcxQEcKETnqqn7ky5xEykJfDDyadEXLqAgAA0NoD//9lQgIAABzEAgAADkICAAQwzAA==
Date: Tue, 1 Oct 2019 08:39:09 +0000
Message-ID: <8d55df7a-abe6-bebc-a6bd-a1a2db4b8946@virtuozzo.com>
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
 <20190924200902.4703-5-vsementsov@virtuozzo.com>
 <20190930151215.GB12777@linux.fritz.box>
 <ca629ae8-15c5-1685-1cbb-99283d37b0a1@virtuozzo.com>
 <20190930160039.GC12777@linux.fritz.box>
 <495102b2-5d1a-f659-4387-5733ae34b3e2@virtuozzo.com>
 <20190930163909.GD12777@linux.fritz.box>
In-Reply-To: <20190930163909.GD12777@linux.fritz.box>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0301CA0021.eurprd03.prod.outlook.com
 (2603:10a6:3:76::31) To DB8PR08MB5498.eurprd08.prod.outlook.com
 (2603:10a6:10:11c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsementsov@virtuozzo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191001113904763
x-originating-ip: [185.231.240.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c8d002b-ff47-41a2-f903-08d7464ad3d1
x-ms-traffictypediagnostic: DB8PR08MB5180:
x-microsoft-antispam-prvs: <DB8PR08MB5180F287D2939B38A17AD4D3C19D0@DB8PR08MB5180.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(376002)(346002)(136003)(366004)(396003)(189003)(199004)(52314003)(66066001)(486006)(2616005)(476003)(7416002)(3846002)(6116002)(26005)(186003)(478600001)(446003)(4326008)(229853002)(6512007)(5660300002)(31696002)(11346002)(7406005)(102836004)(66446008)(66476007)(66556008)(66946007)(305945005)(25786009)(6246003)(64756008)(81156014)(71200400001)(14444005)(71190400001)(256004)(6486002)(99286004)(8936002)(14454004)(86362001)(6436002)(7736002)(2906002)(8676002)(36756003)(316002)(386003)(6506007)(31686004)(81166006)(54906003)(6916009)(76176011)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB8PR08MB5180;
 H:DB8PR08MB5498.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: virtuozzo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qKT1jj4gNcj1YO6OMYBAseOu01TB/100Rwq7pyrJCPSkHxWODARQJXUqBHKpm/xhcyszmE5dlKIC+TKjB3qv3PBy/sRc+IjK650/xCdC5dxrEmIs+i0B2E9B1KLSeNBJdxjS9PsDzZ8gZftVPSvIKSCT2UJB5GNSVKF/6xcVZXj66DThJfxcbs31rEgAh7lIo6NEkyC3+QlEzbre4ELs9UeYekXuDMTlxCTLCc89KntT4SUOpZNW49dckeP53AkDUxV/+n22QEliag7BEStI8aNdM6xiOdnKAN7em2+5zuAIJsd0uNp1xFVmZ7J3DPEa0EPHo/5PCvlVzEwHAolN4v9qfFhgYJSiXautZui9Fl+UWBkF9GsvGGc6KN/x7SbX8wMAynblg5TNNzUgpW42I9BPcJ1Yse+aKIZO1cyHlnI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E733348B01B3384D89D834B07A3B4BC9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c8d002b-ff47-41a2-f903-08d7464ad3d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 08:39:09.4794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vj2QC8M+rgaogH7KNhIr39n2yZTibsSwOnA8bhpErlxV9+0iXpRvzTGKrUBffnGSzUeE/RC9jSaNAsKcOmLTcV7XSpWLnbPmDAJsjNIV5R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5180
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.7.103
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Paul Burton <pburton@wavecomp.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "integration@gluster.org" <integration@gluster.org>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9NsN7S0aS1sa

MzAuMDkuMjAxOSAxOTozOSwgS2V2aW4gV29sZiB3cm90ZToNCj4gQW0gMzAuMDkuMjAxOSB1bSAx
ODoyNiBoYXQgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSBnZXNjaHJpZWJlbjoNCj4+IDMw
LjA5LjIwMTkgMTk6MDAsIEtldmluIFdvbGYgd3JvdGU6DQo+Pj4gQW0gMzAuMDkuMjAxOSB1bSAx
NzoxOSBoYXQgVmxhZGltaXIgU2VtZW50c292LU9naWV2c2tpeSBnZXNjaHJpZWJlbjoNCj4+Pj4g
MzAuMDkuMjAxOSAxODoxMiwgS2V2aW4gV29sZiB3cm90ZToNCj4+Pj4+IEFtIDI0LjA5LjIwMTkg
dW0gMjI6MDggaGF0IFZsYWRpbWlyIFNlbWVudHNvdi1PZ2lldnNraXkgZ2VzY2hyaWViZW46DQo+
Pj4+Pj4gSGVyZSBpcyBpbnRyb2R1Y2VkIEVSUlBfRlVOQ1RJT05fQkVHSU4gbWFjcm8sIHRvIGJl
IHVzZWQgYXQgc3RhcnQgb2YNCj4+Pj4+PiBmdW5jdGlvbnMgd2l0aCBlcnJwIHBhcmFtZXRlci4N
Cj4+Pj4+DQo+Pj4+PiBBIGJpdCBvZiBiaWtlIHNoZWRkaW5nLCBidXQgRk9PX0JFR0lOIHN1Z2dl
c3RzIHRvIG1lIHRoYXQgYSBGT09fRU5EIHdpbGwNCj4+Pj4+IGZvbGxvdy4gQ2FuIHdlIGZpbmQg
YSBkaWZmZXJlbnQgbmFtZSwgZXNwZWNpYWxseSBub3cgdGhhdCB3ZSB3b24ndCB1c2UNCj4+Pj4+
IHRoaXMgbWFjcm8gaW4gZXZlcnkgZnVuY3Rpb24gdGhhdCB1c2VzIGFuIGVycnAsIHNvIGV2ZW4g
dGhlICJlcnJwDQo+Pj4+PiBmdW5jdGlvbiIgcGFydCBpc24ndCByZWFsbHkgY29ycmVjdCBhbnkg
bW9yZT8NCj4+Pj4+DQo+Pj4+PiBIb3cgYWJvdXQgRVJSUF9BVVRPX1BST1BBR0FURT8NCj4+Pj4N
Cj4+Pj4gSSBoYXZlIGFuIGlkZWEgdGhhdCB3aXRoIHRoaXMgbWFjcm8gd2UgY2FuIChvcHRpb25h
bGx5KSBnZXQgdGhlIHdob2xlIGNhbGwgc3RhY2sNCj4+Pj4gb2YgdGhlIGVycm9yIGFuZCBwcmlu
dCBpdCB0byBsb2csIHNvIGl0J3MgZ29vZCB0byBnaXZlIGl0IG1vcmUgZ2VuZXJpYyBuYW1lLCBu
b3QNCj4+Pj4gbGltaXRlZCB0byBwcm9wYWdhdGlvbi4uDQo+Pj4NCj4+PiBIbSwgd2hhdCdzIHRo
ZSBjb250ZXh0IGZvciB0aGlzIGZlYXR1cmU/DQo+Pj4NCj4+PiBUaGUgb2J2aW91cyBvbmUgd2hl
cmUgeW91IHdhbnQgdG8gaGF2ZSBhIHN0YWNrIHRyYWNlIGlzICZlcnJvcl9hYm9ydCwNCj4+PiBi
dXQgdGhhdCBvbmUgY3Jhc2hlcywgc28geW91IGdldCBpdCBhdXRvbWF0aWNhbGx5LiBJZiBpdCdz
IGp1c3QgYSBub3JtYWwNCj4+PiBlcnJvciAobGlrZSBhIFFBUEkgb3B0aW9uIGNvbnRhaW5zIGFu
IGludmFsaWQgdmFsdWUgYW5kIHNvbWUgZnVuY3Rpb24NCj4+PiBkb3duIHRoZSBjYWxsIGNoYWlu
IGNoZWNrcyBpdCksIHdoeSB3b3VsZCBhbnlvbmUgd2FudCB0byBrbm93IHdoYXQgdGhlDQo+Pj4g
Y2FsbCBjaGFpbiBpbiB0aGUgUUVNVSBjb2RlIHdhcz8NCj4+Pg0KPj4NCj4+IFdoZW4gSSBoYXZl
IGJ1ZyBmcm9tIHRlc3RlcnMsIGNhbGwgc3RhY2sgd291bGQgYmUgYSBsb3QgbW9yZSBkZXNjcmlw
dGl2ZSwgdGhhbiBqdXN0DQo+PiBhbiBlcnJvciBtZXNzYWdlLg0KPj4NCj4+IFdlIG1heSBhZGQg
dHJhY2UgcG9pbnQgd2hpY2ggd2lsbCBwcmludCB0aGlzIGluZm9ybWF0aW9uLCBzbyB3aXRoIGRp
c2FibGVkIHRyYWNlIHBvaW50DQo+PiAtIG5vIGV4dHJhIG91dHB1dC4NCj4gDQo+IEJ1dCB3b3Vs
ZG4ndCBpdCBtYWtlIG11Y2ggbW9yZSBzZW5zZSB0aGVuIHRvIG9wdGlvbmFsbHkgYWRkIHRoaXMN
Cj4gZnVuY3Rpb25hbGl0eSB0byBhbnkgdHJhY2UgcG9pbnQ/IEkgcmVhbGx5IGRvbid0IHNlZSBo
b3cgdGhpcyBpcyByZWxhdGVkDQo+IHNwZWNpZmljYWxseSB0byB1c2VyLXZpc2libGUgZXJyb3Ig
bWVzc2FnZXMuDQoNCkludGVyZXN0aW5nIGlkZWENCg0KPiANCj4gSG93ZXZlciwgZXZlbiBpZiB3
ZSBkZWNpZGUgdGhhdCB3ZSB3YW50IHRvIGhhdmUgdGhpcyBpbiBFcnJvciBvYmplY3RzLA0KPiB3
b3VsZG4ndCBpdCBtYWtlIG11Y2ggbW9yZSBzZW5zZSB0byB1c2UgdGhlIHJlYWwgQyBzdGFjayB0
cmFjZSBhbmQgc2F2ZQ0KPiBpdCBmcm9tIHRoZSBpbm5lcm1vc3QgZXJyb3Jfc2V0KCkgdXNpbmcg
YmFja3RyYWNlKCkgb3IgY29tcGlsZXINCj4gYnVpbHQtaW5zIHJhdGhlciB0aGFuIHJlbHlpbmcg
b24gYW4gZXJyb3JfcHJvcGFnYXRlKCkgY2hhaW4/DQo+IA0KSG1tLCBJIHRob3VnaHQgYWJvdXQg
dGhpcy4uIEFuZCBpbiBjb25jYXRlbmF0aW9uIHdpdGggdGhlIGZhY3QgdGhhdCB3ZSdsbCBoYXZl
IG1hY3JvIG5vdA0KZXZlcnl3aGVyZSwgYmFja3RyYWNlIG1heSBiZSBiZXR0ZXIuLg0KDQpPbiB0
aGUgb3RoZXIgaGFuZCwgYmFja3RyYWNlIHdpbGwgbm90IHNob3cgY29yb3V0aW5lIGVudHJpZXMu
Lg0KDQpPSywgYW55d2F5LCBpZiB3ZSB3aWxsIHRyYWNrIHNvbWUgYWRkaXRpb25hbCBpbmZvcm1h
dGlvbiBpbiB0cmFjZS1ldmVudHMgb3IgaW4gbWFjcm9zIG9yDQppbiBlcnJvcl8qIEFQSSBmdW5j
dGlvbnMsIGl0J3Mgbm90IGJhZCB0byB0cmFjayBzb21lIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24g
aW4gbWFjcm8NCm5hbWVkIEVSUlBfQVVUT19QUk9QQUdBVEUuDQoNCi0tIA0KQmVzdCByZWdhcmRz
LA0KVmxhZGltaXINCg==
