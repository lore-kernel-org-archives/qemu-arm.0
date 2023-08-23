Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp231952ejc;
        Wed, 23 Aug 2023 12:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyZ0nsRr4pGow8zSBD0xHOebLeYGsogBF4jK012RgF+QNQmAjeHFvWL+4QPG8gGairkEIO
X-Received: by 2002:a1f:c6c1:0:b0:48f:ad64:6e0c with SMTP id w184-20020a1fc6c1000000b0048fad646e0cmr3358199vkf.13.1692820204492;
        Wed, 23 Aug 2023 12:50:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1692820204; cv=pass;
        d=google.com; s=arc-20160816;
        b=0h0VTn3HgIfB14/ULirQx6HcJTGOaG02U5O9qq4UYRgJWzM89AXut3BnPNe/A1vvvN
         w3XH/oDrzPl02MOa2hBcKp1yLXSmPVmKwyVP6eZw/264IYF3R0QGRPEFxWj2wqaWRVRm
         7Fh9yoPbngDRzV/00cA9RDan8ZTSvu5PWejloeW0FAPlndBz4bNkOusZB1KK819itej/
         hl/qU7IY+K0d9ZI8FPXhQpNTaOwRGJUkbPvacDNN9TFH3o4ulEwNMX08SeKjbFMsJy2n
         O/863Rkczu1VJNRYUO7BKgAkItJJmFA3976pYIkRnxpsGCHbtz5mi592TstjipkxgZb9
         cJew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:in-reply-to
         :content-transfer-encoding:content-disposition:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zzIZT9h++W1sXIgt1n7FXtl1nG6g+vLBeGHKLZnx8lo=;
        fh=TVECiCO/tcDPuFchUIjOVQ8LN2SAALsTKR1BWtJAbqg=;
        b=Y6Icd0t+b2p8h3MwIID4SXWDy/ri0nv9U+xGqAC28cg3Tj/oIVHnaYFDcXf3Lx3zXF
         0fmYyeLkPcG9TuitKgSXJxrHnhK97BVWYn6/dLB2hiEkaIexZ6ZJq2xCxBrCOWSd8EGx
         2RLFRN66zogKImw74qZT22cw70O1+/pwTKbpxa7TiTtOANIEigkufS+Q/iHPWLMwXDzt
         vE9/ex3XTPXshNULZotXODeSNpyDKJJTTiqmG4BMvvQA6mtKlshrwqRWVSfj5jmTU5m+
         OejGj7bkA6tvEOz8gLwgpEBhdTQFoKjpZDLp2i2tps3rzbCjmtbDwUo00199PM7oLxvn
         s5FQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@memverge.com header.s=selector2 header.b=CvOZYake;
       arc=pass (i=1 spf=pass spfdomain=memverge.com dkim=pass dkdomain=memverge.com dmarc=pass fromdomain=memverge.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=memverge.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a0cb386000000b0062fe673acfcsi7838908qve.548.2023.08.23.12.50.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Aug 2023 12:50:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@memverge.com header.s=selector2 header.b=CvOZYake;
       arc=pass (i=1 spf=pass spfdomain=memverge.com dkim=pass dkdomain=memverge.com dmarc=pass fromdomain=memverge.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=memverge.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYtrT-0002Wl-6f; Wed, 23 Aug 2023 15:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1qYtrR-0002Wc-N3
 for qemu-arm@nongnu.org; Wed, 23 Aug 2023 15:49:49 -0400
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregory.price@memverge.com>)
 id 1qYtrP-0007XR-6t
 for qemu-arm@nongnu.org; Wed, 23 Aug 2023 15:49:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fODwwQcYfoUy4lztvtuobB0B9AI84h2Oc7MvhtSAllx4aXsFk37whNCJ1tnkrHML5IUf4N7phyPPzAsg4OWH45Bjr33t4v6GP+enGHA7Q1wDnURpyMOn/v8CZl1TpqXbNkpteeEb1eJZaJZhHETtaJs7xXgVAwzuHYPT/PWiPPMCtTdlIXsx9f2YdF0EtXJ8aGjYFPBg1zj/XtuIMijXc4Nkndr8nt0nw0+9+XXQyHPh9RWaWM+ARYnugOyvxlE1YxoHZj9aFszuncg2p2q1TWXVIsg5ml8hR6TqvWLuUPw9WGrKge46Dc/z7X+MxxsVXQrCygIyo18nMvxYdQG3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzIZT9h++W1sXIgt1n7FXtl1nG6g+vLBeGHKLZnx8lo=;
 b=YvOojGPF/NAW5bijb+UmvBaY3cXBAtJA48AGU2+NJnzw55dvlPD6sFLxceUduz7s7ihLJ4L7XNiAsK1r+MZAiNrAGrA/dI/vCCIrR4AuKAq5hzwttKTMLdcIp7pjDTQW+zmkFSqTu4g8doJex9QOo7P0b2/dc9mo1uAhuHakT6zbi46yRtjGKEcDCWVfJB/qKqjc+hs2V/1xy9qqMnmYCNpKvxTUsSSl/Fn2OwVKgCi/+Y/UKN8MgYx4Keuz8NTgOhKr3mV4hAd9oc9X2iifYGPnYQ++DtJntZZS2oMBcJKOBp2CPufHEum5b9OEGvzJZ0+YI+4JOxSf8hnwEDBJog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=memverge.com; dmarc=pass action=none header.from=memverge.com;
 dkim=pass header.d=memverge.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=memverge.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzIZT9h++W1sXIgt1n7FXtl1nG6g+vLBeGHKLZnx8lo=;
 b=CvOZYakeN2f6bBYTn0FGxr9SFEZvrQwpEk1KbXp5smUIaWq1wjyD/SmbaiRZrxGdpUzyDeqhSOGeWB19Uwl39bUjM6X0kZpFDlqpjLsRqdPSEw6hoXIbKTJWofMBXbGYog4VcC3zsFXicHqwN2nvzVVOGZh3seHoYmIaJg+7sLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=memverge.com;
Received: from SJ0PR17MB5512.namprd17.prod.outlook.com (2603:10b6:a03:394::19)
 by PH0PR17MB4923.namprd17.prod.outlook.com (2603:10b6:510:ea::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 19:44:39 +0000
Received: from SJ0PR17MB5512.namprd17.prod.outlook.com
 ([fe80::180f:5cff:3e12:e654]) by SJ0PR17MB5512.namprd17.prod.outlook.com
 ([fe80::180f:5cff:3e12:e654%2]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 19:44:39 +0000
Date: Wed, 23 Aug 2023 15:44:35 -0400
From: Gregory Price <gregory.price@memverge.com>
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "jonathan.cameron" <jonathan.cameron@huawei.com>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
Message-ID: <ZOZho3SyqASo9MPD@memverge.com>
References: <2023082215220191352877@phytium.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2023082215220191352877@phytium.com.cn>
X-ClientProxiedBy: BYAPR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::24) To SJ0PR17MB5512.namprd17.prod.outlook.com
 (2603:10b6:a03:394::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR17MB5512:EE_|PH0PR17MB4923:EE_
X-MS-Office365-Filtering-Correlation-Id: aef8902b-e2cf-4e48-6b2d-08dba411633f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BrO/4o/PFWO/kPC2MlRBLI7rqMBcLgf/o3GUqb5MRVkqgaG+rMNsRVKcJ/njbc9ZP2yUEzclsAxHLPGxfeXpa5GTE75sgHX/7di+zHd3doP8XJDV/JLTc72frceaRgxsdkblEO0osYRqeqgX+jibIKaS6B9lz8x1St6JPF9D0VtSvOGBkcx+ZxbRLkJEYkcBcj3dZP3xngIqrobAL0mYv7m3844vGvMs/pvHYsOW0jv+MQRPJsgO6cZJqwltoCE5mN8mAB6llQsM5KCXmlRrKTmF77EdNMfBdLbsCEHdsI1AJ82cKZ2CM83ruBTmi7+tKDgdjU/Y1rXam3QcpKaGGa4jgNs7DuS4Pul3h4h9EGk8nYPv9myqp6mxOyUbpU3l29FMXYh2xDwLJLRyl+GVfKnvwPpLl/Myc6f4BcsimMOv+VeGxrRVBuFPfLWJOiJPITMwwwtdh02nfvCKmLHN3OFg4HzLFxWP4AL0daSos75wXMmV/l32W4K7NIIfXuZXKjEqfM7Bjy+FHezQv4gBRSf1m8GmmTDteP702MBadzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR17MB5512.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39840400004)(136003)(346002)(366004)(396003)(376002)(1800799009)(186009)(451199024)(5660300002)(36756003)(83380400001)(2906002)(38100700002)(86362001)(41300700001)(6512007)(66556008)(66476007)(66946007)(54906003)(6486002)(6506007)(6916009)(316002)(2616005)(4326008)(8676002)(8936002)(966005)(478600001)(6666004)(26005)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S01RL0hndUNhQmFiVjlTcDdicDZlN05DcEswNWxlRG1FWDRvZ0xkb0RBNXk2?=
 =?utf-8?B?SnQ0TjJBU21xSEtkYzJabDdNQWNvV3o5Ri9sT0dzQlBPaWNUTzA2WmdXdU5S?=
 =?utf-8?B?RnVoQld5TENmb0JzMHYwc0ZPUi8rcGxCTjV1Q01CR1VwV3pyaElPQVNCaTRH?=
 =?utf-8?B?YnNIekI5dVFNNjI2ZUNTWjBYeVRjc3JTcGtTWnltY1BEWEphZml3NWV2MVk5?=
 =?utf-8?B?Njd2a3VnZURlRWVtTndyZWpjaW5pMVB0ckZ2TGNLK3lMbjVlZTduMVhsV2Zm?=
 =?utf-8?B?b2ZndGMrS25COEVZcm9aSnNqajZ0L2gwSkp5QmwxcUdUMG5INnZzZ2szZUxQ?=
 =?utf-8?B?Nzh1b1FFaVZhNXpqOG9wOGh5YTVreVgwMVIyM2djZm5VcWREdTVKQmkvQWta?=
 =?utf-8?B?Z2Z1ZzY3QlROemwrcy9EeExTT2FleXZYUVF2RkcxWU4yR2V3bFJPUjU2WnNR?=
 =?utf-8?B?WGpvSEVZSG5SREFoMndnb0hGT1RuSHNDdXVidXVCNlVYcEg2ODNCcVcvOUxH?=
 =?utf-8?B?dHB1N2oraTl3ZHIwbytUWlVzdk1Cb0RoMjltQjBldWtQMXlEdHZNbGdCbzNz?=
 =?utf-8?B?Szg0OUY3aGxiWGVYeHI1amFHOTJTZzhENmQwV2VFWnluU1pwQmRsT0pYOVdo?=
 =?utf-8?B?R0hyRFBOY0ZSMmtZbG1hVU5DdzZYU0kyczI2UHRqZ1lIWnQ0TitxYXhCTGh3?=
 =?utf-8?B?anErc1BGS0FMR2s5NDUrb1Z6UXV5NGpzakhXNXF1SzZOYzVKTm8xRXpBUk9a?=
 =?utf-8?B?dVFEVU9qNGRnT0JWLy9rR1F1RVN6d05iWmdjMUd2Ti9xQlF6MjIwTmJCVmsw?=
 =?utf-8?B?RlFjQmE1eUI5ZmlCS1A2TlNQV1hyanE1aHgxNkIxNldkeW5jMmRFUDlJSlBv?=
 =?utf-8?B?ZEdwTitLQjZCVnNtakFmZ3RkaE5yYlc2NWVmMUFwVEhpeERYMWdxdDNCWWRj?=
 =?utf-8?B?MjlIcCtzTnVJbDg2RVZVUllaMzUrZ0RnMGNrR25IVExqVDAxMWxsY3dhOXFq?=
 =?utf-8?B?NTVGQlY1b3pWMUZpdjhQZ1hJWkM1Z1JLdGhmd25XTWl3QzVPUEttT2ZTSmMv?=
 =?utf-8?B?T2dVL0ZlQnFYeEh4ekJoYWJyKzZIa1FtSVlsTFo3a2krY2FvV3M5VnduSW14?=
 =?utf-8?B?TUFBbTdsVVg0ZmEzRTZEUmN3TzY2SEp5Y2lJZ3dlOG5rcHg4NURzRERxbW8w?=
 =?utf-8?B?bDVjVzlVL3NCZUF5ZE5wVnVoVU1DZklLOTJZWmZRUjVodlhpbkhxMGZFWExK?=
 =?utf-8?B?aURyN1dUODhteWNhTTJQN2ZsZk9xOXdCTzRoSUltczFEUExQRW9zeGZBUmNW?=
 =?utf-8?B?d3pibDhsSllXYU9yNStuZ1NPbTRDQWhCMHhxR0lCNm9WZ3BqakovYW4wWFNw?=
 =?utf-8?B?M2dGTHdsalZhd3B1TFh6YXBZLzZid0M3WUprNEhwK0RYbkJuOVlmak5mTHBX?=
 =?utf-8?B?K0JZZ1Nyb2wvZnVCUlJYN2tDUHcwT29hZEdpRWJFbkI1RWVwRFI1d3BtZEpU?=
 =?utf-8?B?c0JlNHZmb1J5Y1JoVFZHZ0RCY3Y5UjRoNFZDaEpFZ0dTOTE5VUs5azlJYUVP?=
 =?utf-8?B?YmVGNVQ4NnlQZEhXcVNheFFCZ3dVclJqSGFHR2lKS3E4NGxIelA0R0pSQXpL?=
 =?utf-8?B?Nm9JNDVYTk1oK1FabGkrUFVBOWlaWHluTU14dDRmS2JJSE9ENTVJK1lqa2di?=
 =?utf-8?B?MnhjazlsK0k3OXdxL0xPcXJIakpCWVZjNFVsai9qb3h3NEtwSEZlYnFrTHdE?=
 =?utf-8?B?eElNMGo2REpJS2dralpGL0FUMGpocUdaRk4wbTIyMDEvMGNsTHFaSjFTVk9T?=
 =?utf-8?B?cUtLM0hOdnVkMHdDeUpSNXhQTkxmcGxRVU1QR3EwaDFKOWd6alNLNGlIb0g1?=
 =?utf-8?B?bnZhcXVONVRkZSs4Vmx6RS9QdjgzejZlKzUxRW0zT0hzcFRqSkdUOElTc04y?=
 =?utf-8?B?dXhjMWF6NG5MZkY4MkoyVVlSUVBrb2x1ZVVBUE54MVdvbTUvMmgvaS9sYlJ4?=
 =?utf-8?B?eDloV0NHdm5tZm81bmt5WFpOZTdGTHBGTUJkU0xUakh0SXRBYkNibmpvakJM?=
 =?utf-8?B?a09FUnB1NCtyRGloMDFLVndyZ201elZ0SGo4NlFmcEllYkRNT0pkMEcwMldm?=
 =?utf-8?B?dWgvVHlacEI1RVVlNnlnalFsNVFBRm5oK2hnbTFCM1p3QUhlbnk4NUlHZGdj?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: memverge.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aef8902b-e2cf-4e48-6b2d-08dba411633f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR17MB5512.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 19:44:39.2015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5c90cb59-37e7-4c81-9c07-00473d5fb682
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIOvQdXXwtFYezlo+QVDMFXRxL4gTTO44D6eMGYK7QaMHU+A37XkgXbGvIh6ezEIsmxAzqlIa0XgNEvB9USHJTWxvv+Uawx/xfzgnUwhpZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB4923
Received-SPF: none client-ip=40.107.236.40;
 envelope-from=gregory.price@memverge.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-TUID: AKTNSwRsUCPr

On Tue, Aug 22, 2023 at 03:22:02PM +0800, Yuquan Wang wrote:
> Hi, Gregory
> I am sorry to disturb you, but there was still an ignored problem about CXL, 
> Although I had sent an email to jonathan (maybe he is busy recently so he forgot to reply),  
> the Link is : https://lists.nongnu.org/archive/html/qemu-arm/2023-08/msg00278.html 
> 
> Maybe the core question is that how should we use CXL components with a standard PCIe system：
> 1) In Qemu, since the boards or machines in qemu can only use pxb-cxl (attached on pcie.0) to add
> cxl host bridge, therefore, users should avoid to assign an occupied bus number by other devices
> to pxb-cxl.
> 
> 2) In real hardware, CXL components should use independent CXL root/tree (ACPI0017&ACPI0016)
> to separate from the namespace of default pcie root/domain.
> 
> I would be grateful if you have some free time to help check this issue : )
> 

Generally speaking, ACPI questions are outside the scope of my
knowledge, but to the extent that i have debugged QEMU for CXL I can say
that #1 is correct - the host bridge adapter should not share PCI bus
id's with anything else or you will have issues.  This can be
frustrating if you don't know what the magic numbers are.

for my work, i have been using this when i need to attach two pxb-cxl
deivces

qemu-system-x86_64 \
-drive file=./cxl.qcow2,format=qcow2,index=0,media=disk,id=hd \
-m 4G,slots=4,maxmem=8G \
-smp 4 \
-machine type=q35,cxl=on,hmat=on \
-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 \
-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=191 \


In regards to real hardware, I'm honestly not knowledgable enough about
ACPI or hardware to provide an intelligible answer unfortunately.

~Gregory
