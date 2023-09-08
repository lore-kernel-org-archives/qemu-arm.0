Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp619925ejb;
        Fri, 8 Sep 2023 11:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECmytBMr0ty3/UXGHE/3BOAgZZjMt+SDyQP/XFhXNeHc2sVjo/U0VGoj4Y4OXW/lrSikiR
X-Received: by 2002:a0c:f454:0:b0:649:a763:6022 with SMTP id h20-20020a0cf454000000b00649a7636022mr3272884qvm.56.1694198509166;
        Fri, 08 Sep 2023 11:41:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1694198509; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZcC3wiphBzXRm2anofEszY9cwdvACPmGlOUSSSkUO+0k4MYJYJ5ZGOdLG0yxWH2Vi8
         tKBBeNbuppSUlN8XRf7hFSUR+7K7Rzn2qZcaw/0saHr4n+M3FoHaUxqTRbgNThZEwmtd
         zxSom2DFEwsysfhVkbQkhibEmpLU3ofTfbH21rQDqq/Sbz9vq4O9CyKRbu+FnnUGOMFu
         KzpZ6z2hz3YqCBcAQmdIOtNLEPIWdqSA+Mk8CCpFSDwbtyihTQNUzIBuO5UdLgx4S4/f
         qK2lA/zysCMHUpmu4KzsomS9fGVcoF6dvlv1oKVqgKKxyYARYEODCpcpX5uban5aLbxF
         2qWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:dkim-signature;
        bh=5tJQ1pmx1hSnM7wDQ0nCqNbDWTvAwv3DyTgMAX2ZIS0=;
        fh=WMM/eE2x+coaGYCZt0Ggt/jYLj/oQTXU0ExoNPVriNQ=;
        b=Q6fFH/QdRC1LIPjIyYD5pNDUgtFG3N3diyDvmhd/SwERMp2XcKlecJdLQ8XgYmi/5D
         5AOqOC3MTNVpPdwOKvpkqsnk3oDtQm9pOmcObGLA5LrMykiCpiH/BuRspGVhd8zIdAff
         R3lwjFD+yYF3uTtAWiz+APP1PhQFDNxSz4ogSwkebaRwSzAAHYcbjsB3J8Uv+xf0gFNz
         tD+eI43JQei6M4MrzVmjrWZCrufAqADAG3Q5tnG4L8Gy7Msxyz8WUetgKUmjPbnoFZKp
         APPmMZbt8KPSmNkLSU3O6LF3JK9TwOYrPiMUW0FrhdPOpUIDRvabA/PSqkj2o0LGqIfJ
         mH3Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b="g/KHtCld";
       arc=pass (i=1 spf=pass spfdomain=amd.com dkim=pass dkdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020a0ce3cb000000b0064f397f5afasi1424365qvl.342.2023.09.08.11.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 11:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b="g/KHtCld";
       arc=pass (i=1 spf=pass spfdomain=amd.com dkim=pass dkdomain=amd.com dmarc=pass fromdomain=amd.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qegPs-0001R8-UO; Fri, 08 Sep 2023 14:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tong.ho@amd.com>)
 id 1qegPq-0001Mo-6e; Fri, 08 Sep 2023 14:41:14 -0400
Received: from mail-dm6nam10on20610.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::610]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tong.ho@amd.com>)
 id 1qegPm-00021W-Fm; Fri, 08 Sep 2023 14:41:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXUQ0sYLDQVKMI55PrQk7Kp2nfQm8kx4FU60BL7xCluhKXYWDkN/u9C5vCwHkcD1CgzE2W7KEPsoX2i/ivVa9ESyCe/ipo0wvnCR9kgDSq5PjMlHRhotB97Eqfb7Qm/lbaiyvNxKZSOM8FJ+tXEPYL5YNtm6/urONjZe7UPxUzJYN805k5WesNsesi6jexlQCMU8ZCEbwsIPzJ1xX1vRT76VDFnsCmME3pe9RPUvjqikCldQ6rk6wWULqSLay4phlwTZ8xtE2/ry447Ucy5YKtTlKfMaftaSAhluxf/6Oz7idgsNHBcJcNweMZ6qcZiSx2TtrAUl9a2bx7o72kb3lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tJQ1pmx1hSnM7wDQ0nCqNbDWTvAwv3DyTgMAX2ZIS0=;
 b=AdGaGYzWIAKQteUF/bwfTTeOBHggQfWQ/8v/b7h3oTrsmggt9j3iPvunkGGcMQMXsKTz5iTiZrUOZ4A+uQRZ4S2GlVPLBRkL68eSSysTeG11gk7Z8oOzZBnc0Y32zmVGwSg6UKM9SpgKLK/WFiQbQIURs9UAOcwN8NjvLgqP+JLV5YkK/z6TBxstkVk59B7+DSoDAAmAORd1ujd3k5TkFmnySBLAX10WBljeUSXTkZXC+48Q3/oGoYENTSxeHJ0UKF0uUQaQLC6l3N5ZGY/3sL2oBpoFovkrrrMYiO0XIDEy8BRmk6IH4LNWcIhUxuskeX/5srYu5gAjPOhFI+UVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tJQ1pmx1hSnM7wDQ0nCqNbDWTvAwv3DyTgMAX2ZIS0=;
 b=g/KHtCldlwaXuNFAjRblZnjJqSb8jepH39d8tbZoGDMpdqJhTJhcpiCHvuH3x/lm3VgryYSwb87534KAH2M5f2cHGRcoHgDGHmsxxJeDa0F0IM8lCD2IBnJAXAHC7ikRPwpNAc6Evauu717TVVOzRFzUM5RJQRGWyPmA3lH7l4g=
Received: from BL0PR12MB4882.namprd12.prod.outlook.com (2603:10b6:208:1c3::10)
 by IA1PR12MB8358.namprd12.prod.outlook.com (2603:10b6:208:3fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Fri, 8 Sep
 2023 18:41:04 +0000
Received: from BL0PR12MB4882.namprd12.prod.outlook.com
 ([fe80::8e6d:40ac:2547:e850]) by BL0PR12MB4882.namprd12.prod.outlook.com
 ([fe80::8e6d:40ac:2547:e850%4]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 18:41:04 +0000
From: "Ho, Tong" <tong.ho@amd.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alistair@alistair23.me" <alistair@alistair23.me>, "edgar.iglesias@gmail.com"
 <edgar.iglesias@gmail.com>
Subject: RE: [PATCH 1/3] hw/misc: Introduce AMD/Xilix Versal TRNG device
Thread-Topic: [PATCH 1/3] hw/misc: Introduce AMD/Xilix Versal TRNG device
Thread-Index: AQHZ3C85IdR/2hbobUC8AAIMe7DmJrAFEeUAgABB0kCAC6qWAIAAQNBQgAAO1YCAAACnsA==
Date: Fri, 8 Sep 2023 18:41:04 +0000
Message-ID: <BL0PR12MB4882BCA8F2705DA2DE869720E6EDA@BL0PR12MB4882.namprd12.prod.outlook.com>
References: <20230831171849.3297497-1-tong.ho@amd.com>
 <20230831171849.3297497-2-tong.ho@amd.com>
 <622751d4-8a89-b34e-171f-9e9f7ac99972@linaro.org>
 <BL0PR12MB48829589D59FA02B93549E65E6E4A@BL0PR12MB4882.namprd12.prod.outlook.com>
 <CAFEAcA_KJFnxg-msgwiaFBzPYkj4RPQeYwLzd4RCy3_br11AGQ@mail.gmail.com>
 <BL0PR12MB4882D72296EE27610D9B04D5E6EDA@BL0PR12MB4882.namprd12.prod.outlook.com>
 <CAFEAcA-F21-kpzoUNMiUJY6t9eyMueJ7b6RqgVOgAu_ZwdRkog@mail.gmail.com>
In-Reply-To: <CAFEAcA-F21-kpzoUNMiUJY6t9eyMueJ7b6RqgVOgAu_ZwdRkog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR12MB4882:EE_|IA1PR12MB8358:EE_
x-ms-office365-filtering-correlation-id: 959a9a3c-8ac9-4fb7-3eaa-08dbb09b2824
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RMdskoGqoyaTMeuwPTwiXXY2s+7sDql17CJEhHMgr9TQ7cTro26tU8SX9yXurgcSVBFVMnM8DpBiyRY+qptuvwMoHpHtTD3Dx31QT9QDBJSuQJcnUP2zw4E/mISsqdR+QMI5zWG7OuMwXsaKEGi9I6MIFmwyBFWtfXncG2/EhjJ3hNdw1IhtCxBdTw2xcQQfEhCqyAM1umUWU+I9lx7Q++jwKM1fsE1FAxkPka4b51NDpgYMlv3a957DwXB751MNq8SU24T3tyvXbWwUWJShJIzrAch+X6zxEX9F3nMOTFu0yRcsk3o8YZhfqnDZo5DTa/lqQ+2N8jigFmFfPYtaBStEgra819clzTIEQHTlSSPv4EC+x9hjOsO0TJcPlAYxfF+19CRMmOzsl4Mt+UQHIZ4Nr0cXV3JCRqvm3wZ7E4OI089y2/YFxrS0hB9PS6a6Xsp5cGrDzOJGWR74OxUjnmyacKpGHZOVsPhfuzkNJMHl1f3skHHVMjjAM80F3A/H+dXD/2mIY5lMOyXai8GC1MCDSfHEYXxP0mPT6pIJDTfFxB36J1zoZRaI+U8AR48/FQoA6BxQ98uhGkwx5z32eAVlhgAl+jJ5KKIs4THhE0nwnBz5JH6XRMYogFHgJ47E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4882.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199024)(186009)(1800799009)(76116006)(122000001)(53546011)(7696005)(6506007)(71200400001)(38070700005)(86362001)(55016003)(38100700002)(33656002)(26005)(2906002)(9686003)(83380400001)(478600001)(4326008)(52536014)(5660300002)(8676002)(8936002)(66476007)(66446008)(41300700001)(66946007)(316002)(54906003)(6916009)(64756008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTJiZjFDVVp1V3c4VlVNbUtRNmlUZTlQbGFETFQ5VDIwdkt4M3FPS3BsRi84?=
 =?utf-8?B?VmxTVzJBY1BLNFhPWmNHL2RiWFg5cVZNeDJXWlVvYkZ2VExQVnAvTFFWOS9F?=
 =?utf-8?B?TGh4ZnVVaEdubGdhZ3hLZkxla0x5aS9WenZyZHZsVGl4VVVYayt1QkVLbDV4?=
 =?utf-8?B?d0dHYTdJWXpyc3ZGdjRCVkgwNVhyTVpHTmx6T1draS82NkJPbUYzNTN5ZVlt?=
 =?utf-8?B?NFgzN2l0c0pOQUJWTFNDcDRSSGFZaEs2MVR1VFcvZmxJdEdnNWpvbE1EY2lX?=
 =?utf-8?B?RG13UmlreGFaMkNHK3NzYmpPM2RIOFQ3WEZQZENFckxkeWROT1ZndGNBTXhl?=
 =?utf-8?B?bUpIRFFFMVVLNkJmc2Izcm1wVUQxL3gvZzZuT0dOWVhwajZtajMyQ0p2YzFH?=
 =?utf-8?B?ZU1QUy8rRDU0dFNHNmRGaUtVQy9vMVJCWWg5SnVkVHNQU2hJMUQ1SG1KK2tr?=
 =?utf-8?B?a2pDb01YdDVUUjVlSHZsZzlPZVdrczF3cGdPOUtIY09CM1dYc1JFYUVyTjlN?=
 =?utf-8?B?aTlFbnZ5eXN6UVNjMFV2TXhFRW1vQnJxeGxsZDhZWEEzamJEc1cvYnBCc25W?=
 =?utf-8?B?VnhNR3ArWmdPK3dyVHpOOFh4L0R0ZjExUWxvclU1QXBEbHdIRGwrbStqckFQ?=
 =?utf-8?B?TjhtcGN1eVM4VGxibERLL09uRVpkUm9ONFhOSUc4TFlxMlhBaHFZbnBTWHNq?=
 =?utf-8?B?TGs1ZkFCWDQvN08wSlFXS05TdVEvYmcxTW9KZkwvR2xRQmFhL1ZuZFl4Rko2?=
 =?utf-8?B?OXl6RGNXbTB1TCt3QXphWDZMSDRhVFFnajV0NWI4bjQzZlFpS1A5MXg2MGdR?=
 =?utf-8?B?Tkd0K1hSdC9teGVTWkMramQxR3k5QXhqVkFESm9aQlNuNzlCbkZCMVMwV3hH?=
 =?utf-8?B?QXNxUDdyY0F3ZW44VjIxN3EraHAxSVdhZzkwRHI1SVgvWHpaYnJIL2FMbW9m?=
 =?utf-8?B?c1VnVkVWcTcyK3RMKzVWOWJlSFZlMGJEaGN2SktxRTNleGc5NXZFb2htcEZj?=
 =?utf-8?B?anVKc0dFdXViYzVTU09zcHlKVm5DVzdtTWVkSmFYcXdwM3dDK0tqUGVkMWhY?=
 =?utf-8?B?Mk9CSmJBRW00ZXpMQzZhUlNSd2F5dUFNVlA1dTRvZkdieE5TYzVZekpDL1BL?=
 =?utf-8?B?MlVVUmFjTVJTaTNZRGJXWXdHRC9JOTZ5S09uS2ZnWlRHaVIybUpjZXJzV29Z?=
 =?utf-8?B?Qmdyb2p1WE5sVm5JS0EvV2FuYmhLR3dsYjFMc0RpaWNVWEJEaWVUR1hnT2da?=
 =?utf-8?B?dDhQNXc3K21KZ1ZGWXNhWk4waXpZWE5HdHAya002dk9vWXh6UTJVVUo2bkZo?=
 =?utf-8?B?anlmbzNSMWNpeUNlRitBYXJvZnRiVzhXU3p6VzBXNDhaWTI4TklPVllNc1Nv?=
 =?utf-8?B?ZnY0c2ZxS2l4cWMyZEQxeVVHRWlxaFBRVFJuVkVyWDJGTmt4TDQ0TDRFZnNv?=
 =?utf-8?B?NzdheTlGOGUwTmtnUWtzMkZiZ1dyQituQU9nQTlRREpjRHgzbG0wWUhwSm9W?=
 =?utf-8?B?RG1raWZlNk5MbzhwcUEyaW5UL3p3M0ErVDZYTm82MFdvYnhWUFJEUS84dExJ?=
 =?utf-8?B?K2huQlJma0UyTWxkakhoSU0yRy96dGFOd0V2aUZLM0h6cjFkdThpcFJVOTh3?=
 =?utf-8?B?dm1Ld1lzYWlwZXc5U2pjejM4YURGYzV1WG8vREQ3NEE1VnpjeVU0U1BmWEJL?=
 =?utf-8?B?U3MvWjhmWmV0MWs0UnFYNmxOdDdMeVV3S2xFUGJqeS9sK2pzRng0YnJzQWxx?=
 =?utf-8?B?UkFkNVY2VmRqVmZDVCtOVTBJUkR1MDhUVmxPc0ZCZEVRQlRISkl3L1VmTTN1?=
 =?utf-8?B?NU9jazlSVFEwKzliK2QyS2RBcTd0dEk2RjN6ZWtwUS8rMmErOEl4ekx4YVJI?=
 =?utf-8?B?eDAvUSthVnQxemsvc0NWT0xnbUpuMXBYUENJR2dNdllvTzgwalVNRmhGUGxT?=
 =?utf-8?B?bWFoQ3FmRjFHb1RIM2Z0b0d2UUs1MUdDU1pBcUxYRnk3azNJRlN1Nm4xd1BG?=
 =?utf-8?B?TDdJLzJsdVRLUVY2NWU0MFlxTGcwMU9BNUUwamJmQ0JHMUVPTXcyemlDdk1V?=
 =?utf-8?B?ZFlzOE9DUUs2VzBIMGxrUDFTYTRpZVhnTEZZNEZCT2dGZXUyUGNob1FmZjJX?=
 =?utf-8?Q?Flzw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4882.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959a9a3c-8ac9-4fb7-3eaa-08dbb09b2824
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2023 18:41:04.2852 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GvRTdDwHAoj7gEjbTAetHWhzSNWOXyUGgYgZiAMU9jj+bzdBgajjoLKvrBFDyCRB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8358
Received-SPF: softfail client-ip=2a01:111:f400:7e88::610;
 envelope-from=tong.ho@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pgq12d34rtOe

SGkgUGV0ZXIsDQoNCllvdXIgcmVjb21tZW5kYXRpb24gaXMgbm90ZWQuICBUaGFua3MgZm9yIHlv
dXIgdmFsdWFibGUgaW5wdXQuICBJIHdpbGwgcHJlc2VudCBWMiB3aXRoIGJldHRlciBhbGlnbm1l
bnQuDQoNClJlZ2FyZHMsDQpUb25nIEhvDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+IA0KU2VudDogRnJp
ZGF5LCBTZXB0ZW1iZXIgOCwgMjAyMyAxMTozNSBBTQ0KVG86IEhvLCBUb25nIDx0b25nLmhvQGFt
ZC5jb20+DQpDYzogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5v
cmc+OyBxZW11LWFybUBub25nbnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmc7IGFsaXN0YWly
QGFsaXN0YWlyMjMubWU7IGVkZ2FyLmlnbGVzaWFzQGdtYWlsLmNvbQ0KU3ViamVjdDogUmU6IFtQ
QVRDSCAxLzNdIGh3L21pc2M6IEludHJvZHVjZSBBTUQvWGlsaXggVmVyc2FsIFRSTkcgZGV2aWNl
DQoNCk9uIEZyaSwgOCBTZXB0IDIwMjMgYXQgMTg6NTYsIEhvLCBUb25nIDx0b25nLmhvQGFtZC5j
b20+IHdyb3RlOg0KPg0KPiBIaSBQZXRlciwNCj4NCj4gVGhlIFZlcnNhbCBUUk5HIGRldmljZSBp
cyByZXF1aXJlZCB0byBzdXBwb3J0IGJvdGggVFJORyBtb2RlIGFuZCBQUk5HIA0KPiBtb2RlLCBh
bmQgdGFyZ2V0L2d1ZXN0IHNvZnR3YXJlIHNlbGVjdHMgYW5kIGNoYW5nZXMgdGhlIG1vZGUgYXQg
d2lsbCBkdXJpbmcgcnVudGltZS4NCj4NCj4gSSBkbyBhZ3JlZSB0aGF0LCBpbiB0aGUgVFJORyBt
b2RlLCB0aGUgbW9kZWwgdXNpbmcgcWVtdV9ndWVzdF9nZXRyYW5kb20oKSB3aWxsIHdvcmsgd2l0
aG91dCBhbnkgaXNzdWVzLg0KPg0KPiBXaGVuIHNvZnR3YXJlIHNlbGVjdHMgdGhlIFBSTkcgbW9k
ZSwgdGhlIFZlcnNhbCBUUk5HIGRldmljZSBpcyANCj4gZXhwZWN0ZWQgdG8gb3V0cHV0IGEgcmVw
cm9kdWNpYmxlIGFuZCBkZXRlcm1pbmlzdGljIHNlcXVlbmNlIG9mIHZhbHVlcyBmb3IgYSBnaXZl
biBzZWVkLiAgVGhpcyBpcyBwYXJ0IG9mIHRoZSBoYXJkd2FyZSBzcGVjLg0KPg0KPiBJIGZhaWwg
dG8gc2VlIGhvdyBxZW11X2d1ZXN0X2dldHJhbmRvbSgpIGNhbiBiZSB1c2VkIHRvIG1vZGVsIHN1
Y2ggcmVxdWlyZW1lbnQgY29ycmVjdGx5Lg0KDQpJZiB0aGUgaGFyZHdhcmUgZG9jdW1lbnRzIGEg
c3BlY2lmaWMgUk5HIHRoYXQgaXQgbXVzdCB1c2UsIHRoZW4geWVzLCB3ZSBzaG91bGQgbW9kZWwg
dGhhdCwgYW5kIHRoZSBjb21tZW50cyBuZWVkIHRvIG1ha2UgaXQgY2xlYXIgdGhhdCB3ZSdyZSBt
b2RlbGxpbmcgYSB2ZXJ5IHNwZWNpZmljIHRoaW5nLCBub3QgbWVyZWx5ICJoZXJlIGlzIGFuIGFy
Yml0cmFyeSBQUk5HIi4NCg0KLS0gUE1NDQo=
