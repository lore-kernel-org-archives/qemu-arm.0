Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2089034lff;
        Mon, 2 Aug 2021 17:32:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHW6vBdSolwUIG/a3ssYM+XgYdn3HTHtkQLTJOPwbzVxQLMybwmHyjDyxetKmz/0rB2w/m
X-Received: by 2002:a50:be81:: with SMTP id b1mr5989944edk.295.1627950725780;
        Mon, 02 Aug 2021 17:32:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627950725; cv=pass;
        d=google.com; s=arc-20160816;
        b=1GSoSG5+H15QWxTPU3YkdbNhc2DCpNEY/NZJhLmnADzt6h2Xoib7nrjGJEEgYHivTX
         9e6kWrfVn5+Kkv4GQrxXsg6aNWYy7IRn6YdOHPNP4BEo5OHhB2La251TKXBvHkA/wS64
         Xuu2EqHFeakGP7jJguJIY6+SoILbx4+YvqT/+M7v7n6SsUoL1sWQ1ua1unE8DkP6ZKBl
         G8W7bg3ip40J4YJ3IgFOoTU7qVxTJ6lLPP5HYxsNf7M3/0l59z+hUMVrugV0moIYS02C
         chAiwK0fligEdSdIiCn80vHXFbwUSFrXLloG6qeQLbBqXNM3eyp/0+yG9OpnS5Oixb2S
         FVpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=7PbjzinJvOipDyZP+7wX3as31RXG6LO7OZi7xT6rrhM=;
        b=W//QRM9rGRIypl/P4kdNYtMQxGqS2Lqh6MFTW+TqwC4rLELp4dT8UH1m8gQcVLkxxa
         dZlIcaGL2IbuD0cmfwGhpjnVo2Se0v8Q50tohkGT4Co7kbED+4yqfQTEXTBkXtyj7f1N
         sLWqopxiCxNiEPly7pqWBJ80UAAxNKjFUjgCOdXKHvDVpRvUEOOWcoR2jzt9uMsSjsqM
         ygFjsGLp4kXY0kH/QVQjJdQwfsvE5HqhsukHu9XJ5vgrhaaAs66T+Kq6UesElJWN4DuP
         Nl0UHxHMpYH6iZyax47qLNL0iigFpawMOxNc9f3XSJZjyqAyjbH93gbBc8zK7eeBLgrT
         oZ1g==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass (test mode) header.i=@fujitsu.com header.s=fj1 header.b=gFVT+GCq;
       dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=poaAkVAT;
       arc=pass (i=1 spf=pass spfdomain=fujitsu.com dkim=pass dkdomain=fujitsu.com dmarc=pass fromdomain=fujitsu.com);
       spf=pass (google.com: domain of ishii.shuuichir@fujitsu.com designates 68.232.159.90 as permitted sender) smtp.mailfrom=ishii.shuuichir@fujitsu.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <ishii.shuuichir@fujitsu.com>
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com. [68.232.159.90])
        by mx.google.com with ESMTPS id n20si11613110edt.533.2021.08.02.17.32.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Aug 2021 17:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of ishii.shuuichir@fujitsu.com designates 68.232.159.90 as permitted sender) client-ip=68.232.159.90;
Authentication-Results: mx.google.com;
       dkim=pass (test mode) header.i=@fujitsu.com header.s=fj1 header.b=gFVT+GCq;
       dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=poaAkVAT;
       arc=pass (i=1 spf=pass spfdomain=fujitsu.com dkim=pass dkdomain=fujitsu.com dmarc=pass fromdomain=fujitsu.com);
       spf=pass (google.com: domain of ishii.shuuichir@fujitsu.com designates 68.232.159.90 as permitted sender) smtp.mailfrom=ishii.shuuichir@fujitsu.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1627950726; x=1659486726;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7PbjzinJvOipDyZP+7wX3as31RXG6LO7OZi7xT6rrhM=;
  b=gFVT+GCqp+i5YZ0VJFx472qYi9VeQ/1WqZnpRqne9oWW9PXvde6DukHC
   do0UUEATWm58stu/GnpH0fH/4nJeqc7jXFEpGmL8p8IEK3Gh9pm+q1kh4
   B4DsTu3jPZBqWNR8w7fTxaJXILw+i8v71ner8WOstnCTKSq3NUtYyR7oD
   ERPA5f9oXdxW7AOvhWvIvElGAkqSu1YBRChCtDnRJwxbaohgQAkgxejs7
   MKPw4LOrODTvn5+PR6FArFlRZ1Jyu4YWjSzR/EpDfw3QNCpl9xH/UY1rU
   gaDkRK0zcrb45K1N9nLtgByDKXb6qm2a0q1SgrO2Yy+9zhB2TjHKtGXqL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="36058925"
X-IronPort-AV: E=Sophos;i="5.84,290,1620658800"; 
   d="scan'208";a="36058925"
Received: from mail-ty1jpn01lp2054.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.54])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 09:32:04 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbiXf6ifqciBAlmfRbAQkhm/xKrhG3XmpgaeU7WdYLseAjZxAGzKZ883XaWeE1tmOeLHAloYkDxqdETNeahfZblSWrnBWeRscq7Y4UA3YL4FUbnsP8qXdbRPNJ1Su+BGiZ/Z9WIGvUSqbVhbiIR36l1T2dITkcZhq6LIltxxNUnTgOBmQ/jtfcf1tT6OqhmcZgdkksnYHjUknX/bxQCg7kwEuzBeQytpsxXhNvTbanlgLhYP6ewJwnoq06Djq9IpxKXckKsv8YGZ8GwRw53xfhG+1Xi7ZWI0ejGXBOp4FDdmnP/0LLIXdnFmOLwzj6kfXUkm4iO5VE4CObIwnw7xfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PbjzinJvOipDyZP+7wX3as31RXG6LO7OZi7xT6rrhM=;
 b=O7S3MFoD/1Wo/YKiPS9PqoQKYIVkn/6DoxA91Hc5+ax3O6KmFsIft3+P2ak2vFphqsnp0pgGHJQukCAmkbCZIlPbdXsyi0TItettYNLvD1pByV4jS6SwvSehTwUpDAolNCiKylMZv5zD0hETEYC1TXGRZ1nZyVxDzwGl3l10Kvu4LcH6bNnEya8AVRAoHmct1wch3buDKV1lDgZeUtzbkXZnRRml3mfLKtTRgmMJLykXeI/u5F9IMNaksDHH9zIAq1H+ENEoGksfrBv6c03SOnij2Dry45XwlVtj+AGBP//ux4D6b8aCCMXQXiOv3iRfLSF9rzfqh0J/N4xtuwjXuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PbjzinJvOipDyZP+7wX3as31RXG6LO7OZi7xT6rrhM=;
 b=poaAkVATRJ+dYsIdFoM1jWEqbIJcZQdm+cw8368Jdas7XYDdZaOb2Ghfcown33AvUl7nTsMx1/bmv8D8/bIfEnWW94K5QuzEWERRGQxE/usXreO1PG5ENzlFtUnfmfExJ9MvlDkIxq8o3n62UjgEKVj4vM26I84NLXOnjkBRpQw=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYYPR01MB6989.jpnprd01.prod.outlook.com (2603:1096:400:d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Tue, 3 Aug
 2021 00:32:01 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::154e:70ee:e0c5:f482%8]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 00:32:01 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: =?utf-8?B?J0FsZXggQmVubsOpZSc=?= <alex.bennee@linaro.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "ishii.shuuichir@fujitsu.com"
	<ishii.shuuichir@fujitsu.com>
Subject: RE: [PATCH v2 1/3] target-arm: delete ARM_FEATURE_A64FX
Thread-Topic: [PATCH v2 1/3] target-arm: delete ARM_FEATURE_A64FX
Thread-Index: AQHXhPAuBW5c6k/W+U+CcgAi+zekmatbU5GAgAWeZSA=
Date: Tue, 3 Aug 2021 00:32:01 +0000
Message-ID:
 <TYCPR01MB61601C4DE620EE9EE5AB2FB0E9F09@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <20210730030821.231106-2-ishii.shuuichir@fujitsu.com>
 <87r1fggka6.fsf@linaro.org>
In-Reply-To: <87r1fggka6.fsf@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NWQ5ODA0ZTctNDlmMy00MGU5LThlNzAtMDQ2N2EyNjRi?=
 =?utf-8?B?MDM5O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMS0wOC0wM1QwMDoyNDoyN1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 181bc362-f9b2-41c3-1f52-08d956161c3e
x-ms-traffictypediagnostic: TYYPR01MB6989:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <TYYPR01MB69895AD88E97CD2EF1311580E9F09@TYYPR01MB6989.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SmUySpANzpxYGhNTJdoqMXrS3V52kTqsu2uYTkEfPU7krnveTZfkScgqnerqsqV2aksZQLazm30HW8h1ciQ+GLEFVXs+gg7E9/YBFfTVP6phuRPsfqc02HUrpbTs53tySeFOWhXUqVeAUKlpEyGJmr8b7qsxKAmxVf85Me2vjqr6esGap8GwKrG2KoMeNqqE6ufHZ75Lmafoz9yvf/wBeARgIuykG1xnweChO/bMdmGLWVAvHGl2aNckHktabmnaveYhS9xMulSgzGMCpquXl8PFKbt7I7dPyhHu/lGzN3mQUjzrgR/Cldc8+WpZ89h1BF8Sf7rNTUNVabVUZ5e6PNuZeqsVFwqnOKiCWQjhlidhJ78gye8Mt1SPq6W43QGCpfzk9fT+bkkQivxUxJ0fsTKOWnievDqAbN+0j9luaRjuvSdEB/u5fZ8HjdNIGj2jqR/hth2oLM3i8Tz+w+pMcB9bW8KlfxgU5TtQ8syG4EOKF/53MsXvYGnKGm6FuGHVt4XHu2+Ph5EmCqpA5vbSg4YAJT5S/VYEeqpbnyP035koLeXtbDuz0rKNPWnxInMmn+w9SZhSsc0dHxApQgaLMDRaz1u8HywQG4SFFCveqD46HUdiYdce0DQQ/4TtjprwprDFBBgxEHSKOaYjQTcj7uUFL0FZHmoFZZP4+eOkuG1+EmRzFaUWz2Q+lAVS9Q3FhsH7sUblRlOZiEIPzBpJJw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6160.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(66476007)(76116006)(66556008)(64756008)(66446008)(107886003)(66946007)(8676002)(186003)(33656002)(4326008)(26005)(85182001)(6916009)(66574015)(83380400001)(316002)(71200400001)(54906003)(508600001)(55016002)(5660300002)(2906002)(7696005)(9686003)(38070700005)(52536014)(6506007)(53546011)(8936002)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnE4ZXFmQ1UwcmNuL2pXZTY2dFN5RmIxSlVoM2VmVFlWOE5rN1RJL0lZMnpn?=
 =?utf-8?B?MVQrWE8wV2lJeE1lSkZMVHFSN3JTbVorU0VaRU1lY2FEZFYzRmhTYnVuWkZN?=
 =?utf-8?B?cmdaSlRXbXFOZ0VoWmdXTlEwdkR3VUMycS9QTkdmNTZSSGh0c0tQbzJoQ2sw?=
 =?utf-8?B?SDRtT2F5WG0xa0JETERiWFd2bnQvNUNab1k2N0diNzJ6NUhSWWQ2bk1iUm1F?=
 =?utf-8?B?aTB1ZlVBcThYMllFRUdGM2RBVE9yeUsxL1IrdkhBZUwyWjZKcFFIbmg3YlhI?=
 =?utf-8?B?TUg4VWdOQ3V3eTJSRi9NaEw3c2VBTjdEUlBjcUZjMGFhZDZOSVl6TXRYZFZW?=
 =?utf-8?B?c2p4ejZHVFJLNWNmWnEzL2FwSnV6WitaK3o2bVc1M1VxUzMvbFVFejUzTzRK?=
 =?utf-8?B?YXZnWHc3L2ptMGNIM0RGNzBEcmp2SlpINTFWT1lka00zQkp2ZFlaZnQ0VUg3?=
 =?utf-8?B?Qkxia2s5YU5FOUFpSEJwLzlSbmRZOGt3SkdPRVlwSnAxV1pxTW0vYkNNektE?=
 =?utf-8?B?ME9Na0ZxRGNrZWtJMWR2dDU3WVJHSVFTTFBVR1NmdXZqc1d0bWJwdWZKSVY0?=
 =?utf-8?B?d29JNS9wejFTMGRzTm0xZDNxU1lhQlprWlVvRGJvbTY3MDFheERiN25ZVTN4?=
 =?utf-8?B?Y2RPRWNWdTQ3THpTRW9kblpCMkxpaGZ6aThFb0d6cm9PVi81R3ZNZHc0VGRi?=
 =?utf-8?B?OExSSitKdkZQa3dHbnpqajJtRE5ycjRSWElpTDNtcnZVNnhIeDhIN2JNNmxR?=
 =?utf-8?B?YW5Sa0FiTVJidjFjL25xY3ZRZE51bGVRamE2QzcwSzFEcVNOWWZYSG0wRDFa?=
 =?utf-8?B?MWhkV2piUTBCSHphVWliUjdWQ3VMQklyMnNVcytkcm5ZMTFSVUttam5EQ0dw?=
 =?utf-8?B?QTRXZ0RsakVOVjVybk5QWFRnSkErV1hUU0hINnhPUmJvY1lPbkM4MEdVQW5i?=
 =?utf-8?B?dWVGZWV2aU54OS85TWorR0lrQkttNDQ1UnZnMW1rUXoyRWlXbitodTR1Nk1z?=
 =?utf-8?B?VjFHLzlTOThNa2RPMExBdnI2OWZydXpkMVFaTHRkdk9wVGFmVytVbFh5d3Mr?=
 =?utf-8?B?RDc4UXlrSlVaU0xGaEE4S2hZcURpWCtiZmlqcUJFYkFQd00rWFZrR3RoL01v?=
 =?utf-8?B?K3R6TjVuMzl4ekpwcy9iczF6bW5lWkNwZFhOOGIvVUkyUDFzZGhTaWJWZXgy?=
 =?utf-8?B?ZXEvdmR6WUlFYnQ0TGJXUTdGMGFVNDF3UHJ1R2gxbUovaCt1b2xLemxDWjVO?=
 =?utf-8?B?ZW9uNGR2SHhHNGJxZVBmVDQ2T3M3ZWplb0VFa0puaytTWXNidG9BcG9nL3FK?=
 =?utf-8?B?Ky9Od2NCSzY5QWs0QmpPNVc0MFhlK2ZUN2JOZ3hpVHFHY3NJV1FmNTlFT1E0?=
 =?utf-8?B?Z2JQcnk5U01CamlIeUp1VEFBaVB1VExZbmZHSlRrVCtSRzV3T2hRVnVGUkR3?=
 =?utf-8?B?TXU5UldiQWdyQ29ldjlhZWRBTWhaM0lMUXBzUmV4N2ZoZzY0cnpyZ1UwanR0?=
 =?utf-8?B?d1l4YVArdmxId1QzR3V5aWhjckNJdlQ0c1E4dmFqVVRyRGNlTTNJdXBlK1c3?=
 =?utf-8?B?YlVmT09zTm5reDhXQWtCR0ZqVnNSOVhNdmpPc3IwVExBVUovSEZ2K2FWZVdN?=
 =?utf-8?B?ZkgwRXF6aERLRzA2b2IxUEUvVndtY0JJSytSR2ZReFpCakRLOVJWQkZRTUUr?=
 =?utf-8?B?QTJxSmJwRkdoeG1JOE9LNUwwRHR1TmJINFRoK2o3azUyVENBWnNsMmtpQW5v?=
 =?utf-8?Q?IUkfaB1xKZpVlKPqvFV9mzTAiCNFBmNrj47fHuc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 181bc362-f9b2-41c3-1f52-08d956161c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 00:32:01.1951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oR5//TgyuO0Kfo68hXCWT4vDU+e6IugoFJ4EnjJTBsKnBQwzNAenrpIRCiWhSWBz4KM3nKAMEYXA9VmZmisl43AovRJZ4PHWJ8K8XqxnIf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6989
X-TUID: Ys21dLPLMaV2

DQo+IFRoaXMgaXMgY29uZnVzaW5nIGJlY2F1c2UgSSBjYW4ndCBzZWUgdGhpcyBmZWF0dXJlIGZs
YWcgaW4gdGhlIG1haW5saW5lIGJyYW5jaC4gSGF2ZQ0KPiB5b3UgaW5hZHZlcnRlbnRseSBiYXNl
ZCB0aGlzIHNlcmllcyBmcm9tIGFuIGludGVybmFsIGJyYW5jaD8NCg0KSSdtIHNvcnJ5IGZvciB0
aGUgY29uZnVzaW9uLg0KDQpNeSBsYWNrIG9mIHVuZGVyc3RhbmRpbmcgb2YgaG93IHRvIGhhbmRs
ZSB2MiBwYXRjaGVzIGhhcyBsZWQgbWUgdG8gY3JlYXRlIGEgdjIgcGF0Y2ggc2VyaWVzDQpiYXNl
ZCBvbiBwYXRjaGVzIHRoYXQgaGF2ZSBub3QgYmVlbiBtZXJnZWQgaW50byB1cHN0cmVhbS4NCkkg
d2lsbCByZXBvc3QgdGhpcyBzbyB0aGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBjYW4gYmUgY2xvc2Vk
IGluIG9uZSBwYXRjaCBzZXJpZXMuDQoNCkJlc3QgcmVnYXJkcy4NCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3Jn
Pg0KPiBTZW50OiBGcmlkYXksIEp1bHkgMzAsIDIwMjEgNzozNiBQTQ0KPiBUbzogSXNoaWksIFNo
dXVpY2hpcm91L+efs+S6lSDlkajkuIDpg44gPGlzaGlpLnNodXVpY2hpckBmdWppdHN1LmNvbT4N
Cj4gQ2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBx
ZW11LWFybUBub25nbnUub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8zXSB0YXJnZXQt
YXJtOiBkZWxldGUgQVJNX0ZFQVRVUkVfQTY0RlgNCj4gDQo+IA0KPiBTaHV1aWNoaXJvdSBJc2hp
aSA8aXNoaWkuc2h1dWljaGlyQGZ1aml0c3UuY29tPiB3cml0ZXM6DQo+IA0KPiA+IFRoZSBBUk1f
RkVBVFVSRV9BNjRGWCBwcm9wZXJ0eSB3YXMgYWRkZWQsIGJ1dCB0aGVyZSBpcyBubyBmdW5jdGlv
bg0KPiA+IHRoYXQgdXNlcyB0aGlzIHByb3BlcnR5IHlldCwgc28gaXQgd2lsbCBiZSByZW1vdmVk
IHVudGlsIGEgZnVuY3Rpb24NCj4gPiB0aGF0IHVzZXMgaXQgaXMgYWRkZWQuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTaHV1aWNoaXJvdSBJc2hpaSA8aXNoaWkuc2h1dWljaGlyQGZ1aml0c3Uu
Y29tPg0KPiA+IC0tLQ0KPiA+ICB0YXJnZXQvYXJtL2NwdS5oICAgfCAxIC0NCj4gPiAgdGFyZ2V0
L2FybS9jcHU2NC5jIHwgMSAtDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2NwdS5oIGIvdGFyZ2V0L2FybS9jcHUu
aCBpbmRleA0KPiA+IDFiMGM3YjkxZWMuLjlmMGE1Zjg0ZDUgMTAwNjQ0DQo+ID4gLS0tIGEvdGFy
Z2V0L2FybS9jcHUuaA0KPiA+ICsrKyBiL3RhcmdldC9hcm0vY3B1LmgNCj4gPiBAQCAtMjE0NSw3
ICsyMTQ1LDYgQEAgZW51bSBhcm1fZmVhdHVyZXMgew0KPiA+ICAgICAgQVJNX0ZFQVRVUkVfTV9T
RUNVUklUWSwgLyogTSBwcm9maWxlIFNlY3VyaXR5IEV4dGVuc2lvbiAqLw0KPiA+ICAgICAgQVJN
X0ZFQVRVUkVfTV9NQUlOLCAvKiBNIHByb2ZpbGUgTWFpbiBFeHRlbnNpb24gKi8NCj4gPiAgICAg
IEFSTV9GRUFUVVJFX1Y4XzFNLCAvKiBNIHByb2ZpbGUgZXh0cmFzIG9ubHkgaW4gdjguMU0gYW5k
IGxhdGVyICovDQo+ID4gLSAgICBBUk1fRkVBVFVSRV9BNjRGWCwgLyogRnVqaXRzdSBBNjRGWCBw
cm9jZXNzb3IgSFBDIGV4dGVuc2lvbnMNCj4gPiBzdXBwb3J0ICovDQo+IA0KPiBUaGlzIGlzIGNv
bmZ1c2luZyBiZWNhdXNlIEkgY2FuJ3Qgc2VlIHRoaXMgZmVhdHVyZSBmbGFnIGluIHRoZSBtYWlu
bGluZSBicmFuY2guIEhhdmUNCj4geW91IGluYWR2ZXJ0ZW50bHkgYmFzZWQgdGhpcyBzZXJpZXMg
ZnJvbSBhbiBpbnRlcm5hbCBicmFuY2g/DQo+IA0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBp
bmxpbmUgaW50IGFybV9mZWF0dXJlKENQVUFSTVN0YXRlICplbnYsIGludCBmZWF0dXJlKSBkaWZm
DQo+ID4gLS1naXQgYS90YXJnZXQvYXJtL2NwdTY0LmMgYi90YXJnZXQvYXJtL2NwdTY0LmMgaW5k
ZXgNCj4gPiBhMTVmOWMwYzU1Li5kZDcyMzAwZTg4IDEwMDY0NA0KPiA+IC0tLSBhL3RhcmdldC9h
cm0vY3B1NjQuYw0KPiA+ICsrKyBiL3RhcmdldC9hcm0vY3B1NjQuYw0KPiA+IEBAIC04NTYsNyAr
ODU2LDYgQEAgc3RhdGljIHZvaWQgYWFyY2g2NF9hNjRmeF9pbml0Zm4oT2JqZWN0ICpvYmopDQo+
ID4gICAgICBBUk1DUFUgKmNwdSA9IEFSTV9DUFUob2JqKTsNCj4gPg0KPiA+ICAgICAgY3B1LT5k
dGJfY29tcGF0aWJsZSA9ICJhcm0sYTY0ZngiOw0KPiA+IC0gICAgc2V0X2ZlYXR1cmUoJmNwdS0+
ZW52LCBBUk1fRkVBVFVSRV9BNjRGWCk7DQo+ID4gICAgICBzZXRfZmVhdHVyZSgmY3B1LT5lbnYs
IEFSTV9GRUFUVVJFX1Y4KTsNCj4gPiAgICAgIHNldF9mZWF0dXJlKCZjcHUtPmVudiwgQVJNX0ZF
QVRVUkVfTkVPTik7DQo+ID4gICAgICBzZXRfZmVhdHVyZSgmY3B1LT5lbnYsIEFSTV9GRUFUVVJF
X0dFTkVSSUNfVElNRVIpOw0KPiANCj4gDQo+IC0tDQo+IEFsZXggQmVubsOpZQ0K
