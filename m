Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5065669ejc;
        Mon, 6 Mar 2023 12:05:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8SmdgEaMn+qytdW7EruYJ1yOY9MMic5aQ4gYS9I4fJ9udvJ7AL9higZKc8YS6VoooMtq8P
X-Received: by 2002:a05:6214:2423:b0:56e:fe7b:8bcd with SMTP id gy3-20020a056214242300b0056efe7b8bcdmr22606717qvb.37.1678133109241;
        Mon, 06 Mar 2023 12:05:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1678133109; cv=pass;
        d=google.com; s=arc-20160816;
        b=xuHhGQO2mRSz8GUHEuu+23NJyEU6kGeYXW2hYIImWBcQGFGdBWHw03Z6Uaxz1+ZN/f
         UUK45huN8QN+ZCG94g3oK9JGbobd/BCNu84gP7rnf1c7oR1j+2dyC5hgYnbbVrFS94Xb
         H0aIlya9bqVfisFEmDRj4yIxLYaA+uy4IFXzacY1IgxcCE1FcMjQT5paAW5P+MP/fs6K
         +gBh8tNntcRuw/EAnx/s6TF6pyT8SQjkg5JzFwyeuyOo6VrgxOUCY4BdgxD2NtBx7xFK
         r7OjMNL2VEJOsinO/jrmpZif5BMObztzdEwQD+q9mcNKp+Nbx3ur1ticktDatqce7ueF
         qWZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=4Z94QwfvEvP91KWsJysxiM7xyMDROuBeH+OWI/wyLhE=;
        b=k/JLWCDjzEyskvzbBM8Vndv5+1bZB1jZIx9g8wTUGB80OE5ddukm+OBgR2ybg+XTOO
         uDgfZHmr9sC5pZBqsCosk7Q9MQJJffkIIZR7eqNQzr5c39xWAgjAqiZIYr0JHrWg59ZO
         yPe5Kbq8zUV1fGeliMBdhVkOifN9YEI7zbM0pzX7LBIDwyCMxfKXqCu5Wuw3TsXL7Brt
         6h3Qj0aoYj/0qnGdnXL0Ot7vBThlJKkZvRyazOV9KnVNoGboa8Jp3o3j12D6lhrBxaQG
         Tw2B0R9qDv2S/MBN+JfkIJ6h8rSoSsL9Wh5qD9CTxV/HB/SY6KpsP46JHs8hs1ZnP5A2
         0W9g==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=3e5f0uei;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=gyghYHhl;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2-20020a0cda82000000b0056eafd69749si8015482qvj.247.2023.03.06.12.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 12:05:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2022-7-12 header.b=3e5f0uei;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=gyghYHhl;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZH4q-0005bd-IY; Mon, 06 Mar 2023 15:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pZH4h-0005Wr-1N; Mon, 06 Mar 2023 15:04:47 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pZH4e-0003tw-J5; Mon, 06 Mar 2023 15:04:46 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326HSvhM026650; Mon, 6 Mar 2023 20:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=4Z94QwfvEvP91KWsJysxiM7xyMDROuBeH+OWI/wyLhE=;
 b=3e5f0ueinoFtSJj0LlkPwdhSkiHPqBKCPrM1yAW9VrmVkdbfEIY/k35m7WxRoNQ3Ioyy
 VZC0OCYkH9wQYn826V4BV8JAoKjNF+EjVsNeJI/0uUWRV32AbwhZB2OxJuyCJjY/v3C1
 vEh9v5Z758gZDYO3eWjIOna9wxxsCb4QY12m8HZJ4uVRg4hLzgLmtEwpsKAjMsvq3I+6
 wkESRqOaRpXK2uhLprsgVGs07FDJIHHe8urEJlYLzLJe7xCe2uCiivW2u4rMAzVYQQU0
 e7pOoyXd/Uo1dBg1GqOFnMU/4BCewhVFcxHfJ6AEssg6vqRS+w2HksBnU9I7g9tZGe1j lg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415huvpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 20:04:39 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326ITDL3037244; Mon, 6 Mar 2023 20:04:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txdfsdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 20:04:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dW1pfRfCyOrJWszpFhq7PCNj7/mxas+LXEQTPrfesrlXROWrkTVAEV/EV9k2mbWo5l8ljC7hWzctufAz7zxCnqIv04VDMD8P1eMsuLmVGTvLjxUDkfafsUBgbbMjlC5CPUmBFF+yyLBpokc1ldZF7xs9NdQQH10Xh+eiZTliMp/GLnxd3Q7huWvfaTeTu2F/ycgR93WHWnPFmjpNvmBqt5Oj56kBG/GDeDufY8cOwYtu6o7hbcRwvTQnNwc63Fw/tni4XusNbZhk17AecuxsU9K6hRs7vH9YiSiYN4QYR25ch6M3ShnaPcm+YrsBBF5hSadBCb245Ca1LPVyjFEaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z94QwfvEvP91KWsJysxiM7xyMDROuBeH+OWI/wyLhE=;
 b=iP7BGLMDsnmJl5EjITE+s90groeeQhZnzzr5jZHN1sXas2/TGNpRh8EfXaTNyRR9aBTQ6h1q0mE4p/2ZcwF0d27CuHyuwRfYa6UGDH1OzAeCftsBx14yPsoawXibj12HJiB/AkGOvWjsYXhOAxAV30m4nwkXBI/gcvM2s0trOLRG3+uKfq8pKwWOa27Xkf5bR8QcHzW+jH9vZfcRo8GhSPo19P1V3BSJ9jO/xbP6AqY4w+u7Jhh/ts+RGlmEFbajgOxxbRKR/BWE8V9b+VxZsXgWA6vRevQbp4AjkT37Yk3VU/+Zyem4JHltLwyprRr8rqRw9136tJ3oSJtHqNMj8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z94QwfvEvP91KWsJysxiM7xyMDROuBeH+OWI/wyLhE=;
 b=gyghYHhlr+UpKFKoaUwxkVyxLKEP3opLdCLdXj64Hz08ieVRJqjHSd+lcopi4bJHhf9jj55iirMjiJrZPfzEKqMqK7fLAnHTu1DInCE3dMfU71XiA/MEoo/mOoe8Ge2UUj/SnCrL8S3Ine9C84i4lyt5zn36rNOKE6GmYAyF8bg=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by IA1PR10MB6148.namprd10.prod.outlook.com (2603:10b6:208:3a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 20:04:35 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 20:04:35 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Marc Zyngier <maz@kernel.org>
CC: Peter Maydell <peter.maydell@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Haibo Xu
 <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>
Subject: Re: [RFC PATCH 2/5] hw/intc/gicv3: add support for setting KVM vGIC
 maintenance IRQ
Thread-Topic: [RFC PATCH 2/5] hw/intc/gicv3: add support for setting KVM vGIC
 maintenance IRQ
Thread-Index: AQHZSsnJ7xQgBTUGnkaFPlM2rQXn9q7t0wSAgAAIZgCAAFy0AA==
Date: Mon, 6 Mar 2023 20:04:35 +0000
Message-ID: <D120DBA0-6950-42C7-837E-E2AA35D73C24@oracle.com>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-3-miguel.luis@oracle.com>
 <CAFEAcA9ZzN0Xokh4kFcxtpv9hU512Km1EcaJHLG3JznVDF=Tew@mail.gmail.com>
 <864jqyympn.wl-maz@kernel.org>
In-Reply-To: <864jqyympn.wl-maz@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|IA1PR10MB6148:EE_
x-ms-office365-filtering-correlation-id: 7be9f722-019c-48c6-59fd-08db1e7e0240
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Me3FZtaIMzDgWUl+/yIgRnw9hrZmQMLVt865w/rs1olDTu6klveNDcya0W8wT+3LO35vkYk/CmF8QqR4MZYS7X9HXH1JhtfOZTG/PHYZWZZ1UcbHULBAdqJB/5cMfaV0X3SGBlZnpWK3zweGBu1EtMz2Daylf1AKCTlMKwjMWwrwQd6vqA3NsZ1spvKM8UE8sW7aG4yaHi6n6U0Ke3hx5QA3G4b8boYqcOURQEVFnzaiHI0bbs4rZXWataPI7brPxJZeYOVlHwVIfEESuGAiuiZXrML4UbkowF4O1fxgGvGb0cTCa6Iv5tASquNPA3rzpkjLuq3+DVII4VQvFlKizLtg4wRdkyw1YRlhU3pvePPZOyo0uG9S1Ryl1rY6a6Tuy5EAFQCdsgVDhqEO/QBTYtCugs2Mgah3OJZkOsjJxuCGf+nOIJMNs/ty7MxI4OWK5TIHpY5BRzpyHc0KBP6xjbcDJwTt5qBKH+moXpVnPPA6FhVIeuD45n8oy82t4emY+u6aKKDy7jBfQ6ublxStPTHAbc+Aej488zkQjaKvKbPY9Q2NOTsKXr5KoZakHqF+yx48X0xsy6l68wW/8Padhk6+St1Rz4fGiThLOkWSYvDd9Le5oWhWYp5wAG129qy83H/cfn8vzQJ92XtAG4rsDFl+KInFybKMr23Se45B9Dj9ayzG/VYma/cgADsneteRHTMvYOQ+xsI70lgQ7hZylmMmulPTYaKEz9x+JQKpqoA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199018)(54906003)(6486002)(36756003)(316002)(83380400001)(33656002)(86362001)(6506007)(186003)(2906002)(5660300002)(66476007)(4326008)(76116006)(66446008)(8936002)(6916009)(66946007)(41300700001)(8676002)(53546011)(478600001)(44832011)(64756008)(6512007)(2616005)(71200400001)(66556008)(122000001)(91956017)(38100700002)(38070700005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDF0alg5bWNuZk9iWFFqYzB2aHplZW5NVzdhQWE2eGFFdzNMR0VqUU45Uys1?=
 =?utf-8?B?cDlZUnJlRWdDMVVFUjFvVExGTXlXc2x2SGJ0RTQxQTBrU1B3aDl6eGFXSTh2?=
 =?utf-8?B?MnB2ZDRYd2NJVXhGZ2pWSWJwR2lkNEE5SWcyN00wYmNaSXhBS0xzdlBuaTVN?=
 =?utf-8?B?VmZLampoU0ZUajF2MENUbmdqL1BUclcxMXBCZHA5K1NiMlREK092cXRyKzJ5?=
 =?utf-8?B?ZGJWbmZmWFRkS0hKTzRiemZ6VEVERmhjNmhVMzc4QytxZ25yMXJxNVVrb1hl?=
 =?utf-8?B?WFEzUCtDbnJKZkF2eFZBb3o5b205dVdCam42Qm9kd1FVYmFUdW1zcWIvSXgz?=
 =?utf-8?B?Y0dtVjJFMXZJakNIcXBFYm9ibGlpS1p3Yk5IRjgxejhBZFZYdlhZYVJpaE5S?=
 =?utf-8?B?RGxFdEdZejJwSDJremJDTlV3T09sc0U1dmUvbEhuVTJtRUlGSjVNK0F4OEZy?=
 =?utf-8?B?SldDZ0VIMDV1cWJVQk5UaThudFVxc0VTcWlKYWxWSmpwWHFVMkZBSTdSR3Iz?=
 =?utf-8?B?YmQrN2dIWVBzclBINDJvMHNuY0krSms0Nm5nd09VUHZqOS9KcVVMM3JPWCs4?=
 =?utf-8?B?YURmZk9FZWtHSEZGMUpXbkQxQkx0b0ZwVXJxM1FZTlRGS0FrVnNEbXU2Vks3?=
 =?utf-8?B?SWE3bGxuTTJhQzR5TWpNNWpEcEdzUjBubVFmZWwzSU5mZmEvYTB0MjlTczhH?=
 =?utf-8?B?NzVXdkgrd1d4M0JRRVlGTGpSZnNGZmZmd3haN0dSM1dHZmZyOVJyQUJoZDlW?=
 =?utf-8?B?ZHJ0VlJDNGpWTGtqZHE5alBvelpCdzNPSitqNXBxbUNHQ0lMbDluY0Rzczdv?=
 =?utf-8?B?RFVKOU5OR2J0MW9WUUlFMnpWc3hwL2N2VUlmbzdBdnExb3JxRjBZUUxDVVdL?=
 =?utf-8?B?bmszbmhuV3F6TFBnS2FhY1VSVldMVW5DNHdvSzU5cDVuS2dVcHkyb1FydHFh?=
 =?utf-8?B?VkhKdWlkN2FTM2RLWUhxVzRMVVErV1NSRXBDdCtCd0dXZVp6NkNxN0Z5L1Nx?=
 =?utf-8?B?cGdmOUppeUFLZEhSVjFmOWYyM2tsbFVwa09uUVNNVXVmd2VFUWlFcXVscmJm?=
 =?utf-8?B?NjBDb0QyOE5RRmdpdFVUYVBYaytOSjd1Y2tMWjUwa0VXUER0Y1p6OUZBZTVX?=
 =?utf-8?B?eWxRWW85NjN2a1JuM2xIeitOZkw0R1Q4TlBlbXZvVGJJV01Ddld6S1dGRzh6?=
 =?utf-8?B?MU1MUEFucW9JOTM5YzNUTVpVM0hMUm9MNHJqUDdsakQ5bTFEWGpOZTZPc2Z3?=
 =?utf-8?B?ZkN4aXRBdHBZQ3hsVExkR0dMYjJCL0JHVGxMZU8zWmg3a01qdVJ0ZGYwbUZs?=
 =?utf-8?B?NTJVKzRJZ1NjVmw3REJVRTk4Wm1qUXY2TDQ0K1djc1RzUUFsbkJKblBZUW5C?=
 =?utf-8?B?bWtDcjhVa2thK2NLbXl1MGRKZkF0QnlJa3hZQ29FYmgwelVrRnZpN1M2SC9x?=
 =?utf-8?B?LzFpcUZUUE8wZnE2a0JoUHZtelVQd3F2MjFyaUNYellvdFF5UEVDZ1FYRkhB?=
 =?utf-8?B?MHMrQWVJWDc4Ync4TUhPazEvZk9YYzFrMEFERTg3ZWh2d1doejFVL1kvZVFU?=
 =?utf-8?B?VTBZVTdqNVMzUHpRRFNKYWxHVEdsdEZwbVhqT2drTTUxNnhUQ085clRIYlEv?=
 =?utf-8?B?Wi9ZS0drWEZ3QXNaam8vcHE3OFFwS0hVQXhZT0w1Z3JDSDNVVzd6bjhpSmZQ?=
 =?utf-8?B?SXV6cFBWbUdXZ0JydjlRM25CVTVXV0tzOFNOUkFQSy9yQ2doR0pwNFFoUURQ?=
 =?utf-8?B?N2F1SFJ6MVVZVGJmSWJ4c0tMKzRKY1VTMlBoVlZwSHpITVpURGlweWZEaEJS?=
 =?utf-8?B?MFNkUkFoL0FxaHJBdEtPSDhIUWRQTzVCZy93S3pVK1U1OWxvU05lcjNDOFFT?=
 =?utf-8?B?Zk5Vb2dpdDVTV0hnb0xXWFcvL05Yb0V6cVdka2tZTndicEgxazlKc3N4R09k?=
 =?utf-8?B?YUwwNXdaeTRmdDUxbkFMYm4rYWwza256ejdlbk90K1VsR2x2ck1nWUdML3BE?=
 =?utf-8?B?V3VxT0s1WUN2TThPaldJOVdBN3RHUWRCSXFNRFB1YlJRTlh4S2VZN1lydUR2?=
 =?utf-8?B?VzIzMjhxSWxmSmNlYyt3L2VpZWVXbmRXcU4waURxWThKUnU2YU03b0lieHly?=
 =?utf-8?B?QjlDSjd3QTJTVW8xZ2p6L1lLcFpMMmpYaG5mNERldlJuYkNSRXYvWXBBM3RX?=
 =?utf-8?Q?9JM1Dmj6IXcvtns2BnfSU8k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEC1B090AA068249BE93AAA6D67FF9C1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DXdk0EF9YciQwAv1vpWWAKgvkO6bSm1VQQ30vP2c6WhECuARHv9TIoK5s6vzZuzM0GWazJkVAqkToVhVj6xGaqgQMQaArj13LSacsvw5AkarDj2mCBUfa5XClDqnK/Hs77fogq5/jet2T/5o4GvnYmRpSQjDY9Fe+mP6THaJdctZAZsA/igsWh86b/WHU21VI0O+FKY2LBkMU5PajVDd6YyiCYCn18yD31xTXgZy1PezaaqdZihnLKZ2CZC2TjKI78lOUKoPwWmYQfIlnswQckJVh5qN1XRVW5hukIG1+his5YmTQOKTaP94Y24lRBVGMjbU14O97iYndeHOywIwnG6Z/qdMWH20VkiC7A2a/wmV7uqkX5DZXm0lpQwEwjLGTbUO89Q02Zd/R+qqKjC/XznF9MXp3o4Sybvqn0uHdOBLfKXUzmSNxbArkEKyxMnxhp8MgGP73UEy2U+Z89SS9ikNBQO68nUnpCZ1+PgZf0YbOnLevxUUzEFcCSGjpMc8mcMCX8qJ4l5uc/KXHB5lWsv7V5+S8HY6AK2cEMvcIjHSn+1bA1/oQA+oFzqcC9Fwcf9oIRKVEdNyuXCmk4yH4OWr9F/BYFyJjci8iRA0NMrsaxRvT+UwC9SvbbrYYjfOAJY0sx/JLWiobhjGpjldyo4znHEiG+/Gk7LbRfU5Hyvxm7ACgvyLOmBnmfouQi8rfLxqVBVlZKdao3oGCk0A2JbYyt+qIh+Kbxch3qjjdEU39hmVA5nCCbzaT4mWwnxK0qcW0mMHCI9gBL8I2y2uJv8XILgbZOatuDSTRtuQl2BG9kQGWSd50jrTDNeAtBf2fXBBFjUBvCyBCpYAlfUpeA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be9f722-019c-48c6-59fd-08db1e7e0240
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 20:04:35.5073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HlYSpMLQEeNwXTPhpsYnQb395CCPHsjVARqbYlrCUqp3EN0M3j2EAlFqw6N6Yb7AiZUUifdbwkIyKZVH0GB3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6148
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_13,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060175
X-Proofpoint-GUID: 5MtyGXaG62ividjfo2MjUjeEA8bgTDPV
X-Proofpoint-ORIG-GUID: 5MtyGXaG62ividjfo2MjUjeEA8bgTDPV
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: i9ONezYxa30A

SGkgTWFyYywNCg0KPiBPbiA2IE1hciAyMDIzLCBhdCAxMzozMiwgTWFyYyBaeW5naWVyIDxtYXpA
a2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDA2IE1hciAyMDIzIDE0OjAyOjMzICsw
MDAwLA0KPiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+IHdyb3RlOg0K
Pj4gDQo+PiBPbiBNb24sIDI3IEZlYiAyMDIzIGF0IDE2OjM3LCBNaWd1ZWwgTHVpcyA8bWlndWVs
Lmx1aXNAb3JhY2xlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gRnJvbTogSGFpYm8gWHUgPGhhaWJv
Lnh1QGxpbmFyby5vcmc+DQo+Pj4gDQo+Pj4gVXNlIHRoZSBWR0lDIG1haW50ZW5hbmNlIElSUSBp
ZiBWSEUgaXMgcmVxdWVzdGVkLiBBcyBwZXIgdGhlIEFSTSBHSUMNCj4+PiBBcmNoaXRlY3R1cmUg
U3BlY2lmaWNhdGlvbiBmb3IgR0lDdjMgYW5kIEdJQ3Y0IEFybSBzdHJvbmdseSByZWNvbW1lbmRz
IHRoYXQNCj4+PiBtYWludGVuYW5jZSBpbnRlcnJ1cHRzIGFyZSBjb25maWd1cmVkIHRvIHVzZSBJ
TlRJRCAyNSBtYXRjaGluZyB0aGUNCj4+PiBTZXJ2ZXIgQmFzZSBTeXN0ZW0gQXJjaGl0ZWN0dXJl
IChTQlNBKSByZWNvbWVuZGF0aW9uLg0KPj4gDQo+PiBXaGF0IGRvZXMgdGhpcyBtZWFuIGZvciBR
RU1VLCB0aG91Z2g/IElmIHRoZSBpc3N1ZSBpcw0KPj4gIktWTSBkb2Vzbid0IHN1cHBvcnQgdGhl
IG1haW50ZW5hbmNlIGludGVycnVwdCBiZWluZyBhbnl0aGluZw0KPj4gb3RoZXIgdGhhbiBJTlRJ
RCAyNSIgdGhlbiB3ZSBzaG91bGQgc2F5IHNvIChhbmQgaGF2ZSBvdXIgY29kZQ0KPj4gZXJyb3Ig
b3V0IGlmIHRoZSBib2FyZCB0cmllcyB0byB1c2Ugc29tZSBvdGhlciB2YWx1ZSkuDQo+IA0KPiBO
bywgS1ZNIGRvZXNuJ3QgZ2l2ZSB0d28gaG9vdHMgYWJvdXQgdGhlIElOVElELCBhcyBsb25nIGFz
IHRoaXMgaXMgYQ0KPiBQUEkgdGhhdCBpcyBvdGhlcndpc2UgdW51c2VkLg0KPiANCj4+IElmIHRo
ZQ0KPj4gaXNzdWUgaXMgInRoZSAqaG9zdCogaGFzIHRvIGJlIHVzaW5nIHRoZSByaWdodCBJTlRJ
RCIgdGhlbiBJDQo+PiB3b3VsZCBob3BlIHRoYXQgS1ZNIHNpbXBseSBkb2Vzbid0IGV4cG9zZSB0
aGUgY2FwYWJpbGl0eSBpZg0KPj4gdGhlIGhvc3QgaC93IHdvbid0IGxldCBpdCB3b3JrIGNvcnJl
Y3RseS4NCj4gDQo+IE5vIGhvc3QgbWFpbnRlbmFuY2UgaW50ZXJydXB0LCBubyBOVi4gVGhpcyBp
cyBzcGVjaWFsbHkgbWFuZGF0b3J5IGFzDQo+IHRoZSBMMSBndWVzdCBpcyBpbiAoYWxtb3N0KSBj
b21wbGV0ZSBjb250cm9sIG9mIHRoZSBJQ0hfKl9FTDINCj4gcmVnaXN0ZXJzIGFuZCBleHBlY3Rz
IE1JcyB0byBiZSBkZWxpdmVyZWQuDQo+IA0KPj4gSWYgS1ZNIGNhbiBoYXBwaWx5DQo+PiB1c2Ug
YW55IG1haW50ZW5hbmNlIGludGVycnVwdCBJRCB0aGF0IHRoZSBib2FyZCBtb2RlbCB3YW50cywN
Cj4+IHRoZW4gd2Ugc2hvdWxkIG1ha2UgdGhhdCB3b3JrLCByYXRoZXIgdGhhbiBoYXJkY29kaW5n
IDI1IGludG8NCj4+IG91ciBnaWN2MyBjb2RlLg0KPiANCj4gKzEuDQo+IA0KPiBJJ2QgZWxpbWlu
YXRlIGFueSByZWZlcmVuY2UgdG8gU0JTQSwgYXMgaXQgaGFzIG5vIGJlYXJpbmcgb24gZWl0aGVy
DQo+IEtWTSBub3IgdGhlIFFFTVUgR0lDIGNvZGUuDQo+IA0KPiBJIGFsc28gcXVlc3Rpb24gdGhl
ICJpZiBWSEUgaXMgcmVxdWVzdGVkIi4gTm90IGhhdmluZyBWSEUgZG9lc24ndA0KPiBwcmVjbHVk
ZSB2aXJ0dWFsaXNhdGlvbi4gV2FzIHRoYXQgc3VwcG9zZWQgdG8gYmUgInZpcnR1YWxpc2F0aW9u
DQo+IGV4dGVuc2lvbiIgaW5zdGVhZD8NCj4gDQoNCnMvVkhFL3ZpcnR1YWxpemF0aW9uIGV4dGVu
c2lvbi8NCg0KSeKAmXZlIG5vdGVkIGl0IGhhcyBiZWVuIGEgcmVjdXJyaW5nIGNvbmZ1c2lvbiBv
biBteSBwYXJ0LiBXaWxsIGZpeC4gOikNCg0KVGhhbmsgeW91LA0KTWlndWVsDQoNCj4gVGhhbmtz
LA0KPiANCj4gTS4NCj4gDQo+IC0tIA0KPiBXaXRob3V0IGRldmlhdGlvbiBmcm9tIHRoZSBub3Jt
LCBwcm9ncmVzcyBpcyBub3QgcG9zc2libGUuDQoNCg0K
