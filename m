Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3169523lft;
        Thu, 23 Jun 2022 11:35:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v7CnaMxnEvVW+k8U/2dM05vFomjJpMrnpyKFKXS/fyJ3FMljbYFbup/+0tpmN2hmx0s6uw
X-Received: by 2002:ac8:7d4e:0:b0:305:2912:d5de with SMTP id h14-20020ac87d4e000000b003052912d5demr9341222qtb.392.1656009307797;
        Thu, 23 Jun 2022 11:35:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656009307; cv=pass;
        d=google.com; s=arc-20160816;
        b=t6RPPpnuCsgODEskRj3+BzbYytfr9cf+Pd1GGrQm34CLv4l9/Q1WgBRNxvM4vSK2Mw
         4eXak7OMf//FzR9KeAYXeHWFQiz5ExpYM2dMqJL055yqNr5h10/86qK82M0puJJD371Y
         0x2euA1WsBYZ1jVX/vbtE2qcm9yveNMmWLyRPG1CCMfyBrL/s9YafGkYsOz1mjSDXNlK
         8FCJ+DUwOW4FVDMrKWMBkaPO6UK3865VSAHGGq4c1Nx5nqxVpQBiPv8XhE68pkchYPlI
         TS+LX0D1h8X5WhkO3UJHh/dvRltVXGw1WNQuoke0R6zSw97ZvnEd43iPbCWYEi8fTVh7
         /aug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:from:dkim-signature;
        bh=5RR/5EA89C/KhMuB8I/cNDRNeq+hCMGZof3XnfwfE6E=;
        b=rNIo4THUxqF8VYj4Rz14Bwxzb54fNHJ0yZsBhV4z4TLdkTkBdjQ3d38t6jAF+mvK/j
         UeSFaV26AjMGAcg8DGXVw+JzAMIrxUijmC0ch3Nyqr49ZTQ0dchrcJMfNXfbZrGhE/m8
         KIo7ogZK0c7x42IKF9pVfjYoovpDNk4J2PiGk92mK3mIHR/ihr/dYHLc1jsDzJw14d4J
         JspLCjWyYorK6hcPMN7KKHpUMnlR9eiEuUYZGTxSBeuR+w6mhDIWJcBDco24o5qz6HmW
         bc9SIz01THwu32EMEBTlbWHSgwA/woDLiNCwMmvhY/IXB+0tbublqKH7mPkE2zUzdfvC
         rlTA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=aSicU+Mw;
       arc=pass (i=1 spf=pass spfdomain=fb.com dkim=pass dkdomain=fb.com dmarc=pass fromdomain=fb.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c70-20020ae9ed49000000b006a7462233f5si236825qkg.284.2022.06.23.11.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 11:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=aSicU+Mw;
       arc=pass (i=1 spf=pass spfdomain=fb.com dkim=pass dkdomain=fb.com dmarc=pass fromdomain=fb.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4RfX-0004r5-8B
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 14:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7173458386=pdel@fb.com>)
 id 1o4Rdg-0003FN-AS; Thu, 23 Jun 2022 14:33:12 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:64340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=7173458386=pdel@fb.com>)
 id 1o4Rde-00041z-MB; Thu, 23 Jun 2022 14:33:12 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NHumNw015918;
 Thu, 23 Jun 2022 11:32:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : cc : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=5RR/5EA89C/KhMuB8I/cNDRNeq+hCMGZof3XnfwfE6E=;
 b=aSicU+Mw2Ih2dBFmYTK0bwviWhONuOm0E3EJc5NECuj7tgcFQZBmDy7UcFyZYUIJFe6C
 PdRaznlgqKQNdkuJoinQCRg/KIwxyyMGGwvdBGSxjJS34qHY50K/odpKIfr95/VgJG1g
 LNFDwFFcUR4wNMtbkA7XVW/aRzO3XM/J1aA= 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gv51n966x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jun 2022 11:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTKHI41iovNm9hNVrjYSyn1HsAC0cpkSh4g2MnNtaXUntqwqPO+kkl63y2ylZTw13cTlmg7dKqD65NZOJm4GLwswgvjfO9fseGNXx/VDssqeunqi/vAzmy6coiEr9LX7NgRmHRobs9jAd1+hjXRAVxYiEKCnZjo/Vcx/OXKMsaDW/jdT7uqWmIdK3JtziRqKQCijNE0aAAG7U7stdxNM+znnmvWy9hFdPk+uGts4Z7cKw4avRPR0wVFoCoLgKhPqG8KBdCVVunNGCLqTaclVZ2DFyJ3I8+8sreNF2PRgBKw0dm6cXPZ8fL0/Jt7wQ+C/T6kAVQs1ZpHiBRuagMfgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RR/5EA89C/KhMuB8I/cNDRNeq+hCMGZof3XnfwfE6E=;
 b=ExGGk9zGA6lCBgUzx6duuJwI3hAsFnzXgoSYt3nsW6VEwi9ljaYacKHBItJHHMcy6Noj/RC0IUwaMg+8epBa8f0z7V4zfBmATX+7TnagaV4culXD90C6ppJ5MUisyWrgK6XAvC5m+N96K9YeKpYqQSuD8J5zSMomXRO8/kAejQPiSqEdU1LHKqXrq0JMVnXVshfBWFXkYtPclE+vBbjSKG60PkUWE0be0gukZFsAUsf5vSlBPpb2POEAr+lS3mnBVLAwexPOCpUT1xo9mbj1qe28g68kMlqb2zAi6Ox4i6VdFWZWs1ANZzsaXDAYhE0q9dQQxTsY8EXt4Vw3khJqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by PH0PR15MB4575.namprd15.prod.outlook.com (2603:10b6:510:89::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 23 Jun
 2022 18:32:43 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::70d0:8133:42cc:f134%6]) with mapi id 15.20.5373.016; Thu, 23 Jun 2022
 18:32:43 +0000
From: Peter Delevoryas <pdel@fb.com>
CC: Peter Delevoryas <pdel@fb.com>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "eduardo@habkost.net"
 <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "ani@anisinha.ca" <ani@anisinha.ca>, Cameron Esfahani via
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH 11/14] aspeed: Switch to create_unimplemented_device_in
Thread-Topic: [PATCH 11/14] aspeed: Switch to create_unimplemented_device_in
Thread-Index: AQHYhvlPS1D9ZhS9E0+OJ2Mvr3fREa1c80oAgABeAgA=
Date: Thu, 23 Jun 2022 18:32:42 +0000
Message-ID: <49BB7452-B393-4A31-8CF3-29B80E0002F5@fb.com>
References: <20220623095825.2038562-1-pdel@fb.com>
 <20220623095825.2038562-12-pdel@fb.com>
 <CAFEAcA_iOeL50nGaTSNRa23P0GKH8_0fpiSOxktAOA22CGgZvA@mail.gmail.com>
In-Reply-To: <CAFEAcA_iOeL50nGaTSNRa23P0GKH8_0fpiSOxktAOA22CGgZvA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e781a0e3-624b-4e08-81dd-08da5546c2c3
x-ms-traffictypediagnostic: PH0PR15MB4575:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DHRlzWVG1fnHgAaHYdcDj7n2L5HrM0IgLKz2uhtPNEOot92i2O0M9hZcJQTIA8wcUcf1aVAa7o2hBZTHMLyWB+QhuVm2PwE0N8osLdGRrmS8k3+1dxdOPqMgitLepNI+XVABH7UR8ZG1IAEBsyroXAA803MmKCGiOrEGGWbKrZ77Q2/xPtXpbrHLaMGG43zYwaeQBe0Tcpw9iIPdi5utZWB77kSLjjPZvj/oW6jldYcsfjaX7IE3BKm4dkBRG2+t6+vCQRW6qNaKY7HZ2PHMBI1foxqiJpYKtxACVOsGzwl4R4TFjpioW/sg0FZ6iwgC1aqLNdiMCxtEzGZZvIFSrxi3jrB0oNdV0Yu+bTrbur2QjGRtWWyh2eBiLZSsoVohR8hRzjAAWExqsN7vc7x30bSHu5DVrWdsrrq4uec8XeRz/EQjlk3KmAMgeG5JUshN9sW9x01aEFjuSYcwcmF6BLG0MI71183Ve3xN1kFc335sTH0W26A6yteKfYhFJJy2zn+VGZ5dYhVBcG5bInaXmqXAO4EHBMHFoBUvRb3y3W+16dx25heVNVXE9U556iwX3VzGV5Rdhv2z8Njcyt+ueFidQWUd7akQcDVX9C1PzZSUgD0AFSlWPqECuB9uY0RgKu8fXDhaIx4mHkx2vbn9pjquciX+AwX3k7n7jTICY+Jv7EaeIkrmt1kCtJMOA9FkbY/Qz9FywWOxeiNCQUwlS120kUb5iXghcLL31rbYbVhqrRheasduaz8BoEgSHl7eOlknYSMK2krUwqTsYl9A/ZU6ZRxM2MkGK5xKSu2lV6lKQmuqwRTApzp2bCi/e2Fvvh1/UJFonnhxLWmqBgeFMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(86362001)(53546011)(6506007)(76116006)(8936002)(2906002)(41300700001)(66946007)(38070700005)(6512007)(2616005)(109986005)(66556008)(36756003)(66446008)(54906003)(316002)(66476007)(64756008)(38100700002)(8676002)(4326008)(6486002)(71200400001)(122000001)(33656002)(478600001)(83380400001)(7416002)(5660300002)(186003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWM4cTI0WkJIWUFXM0ZkUUZTRkNaQ3NJeTVKZGJZZmFDMExpMFJ6STExQURa?=
 =?utf-8?B?WUtyUWt1RWhoMTBLb2xTZy9CRFNQeXBaTGo1cnppSUNTVE00TWhCTGEvcFJl?=
 =?utf-8?B?RlpZcVpBajVGelJDNnpldVlnZ0pEQmwyRzdKNTVrNTNpSkZPckFRNk54VVZL?=
 =?utf-8?B?Z0tyNTVUMEFhRkh2aXBjQ2xUbWkyWmU1Zkx1VzM3S1BGVk5XYzVrUkQ1ZnRx?=
 =?utf-8?B?QUFFb1E3RkRSVTJLZXNsd3BCUUNYekkwUmZBQWFMSm40L2RSZi9qYm9ESXNC?=
 =?utf-8?B?TytHQXpwSTRaVE14aFlrYXRUa3lEbS95cGkydFViQ3d3YkMrdkJNdHhEYUE0?=
 =?utf-8?B?dzB6c1YrVFM2eVhjUERMYnVjSno5UUU2ZDVzdVFLRzJwSlEvTzNxZDdWeTFq?=
 =?utf-8?B?S0hFL044RmpWYzVTVUxJTk40VWM5QnIyRmF3dWxkMVFrL3JHTStaWXVsc3Mr?=
 =?utf-8?B?TzcvaUFDbEJrTTR2Uk1oSFRmV3FrN2JkQ1VrR1FhNzloZWU5b2JqY1QyZ010?=
 =?utf-8?B?ditRUnArVS8rKzk3QVpWR1VFQkMvNmVQbDQvSHZmTFkrNDFwU21NTGtIeGtK?=
 =?utf-8?B?ZHg1SkJQODVrbFBmdW1WNmhsejhXQzJHRHFIb3BVanpHSDVNUm5EaEpkRy9l?=
 =?utf-8?B?S045alk4ZkZyOW0waHdrSmptRlltYmNEUkRPcXdISys3MjVxeVN4Y3NvSTMw?=
 =?utf-8?B?aVpEbWl4WGNORkY4NmdYbU1aRWJ6NEhWUy82aXJ6UXRZOWIwRTM5WVpGdGp1?=
 =?utf-8?B?bVNuTWM4TFdPRlhkYjRCYTJINWpJd055bmlnUW1zVEwyMnI2d05uVy9QSDh6?=
 =?utf-8?B?eHRlTlZYNWQ4cjZ2NldMVDh4VjFxNFdxTURJRHpHTHpYaUx0Ny9zNWF6Yms2?=
 =?utf-8?B?Vk5lTDNxZWtyOHlReFRsdlY4ay9KZWg1R3FQMmxnRENDQkphUmJCOXVvVEVo?=
 =?utf-8?B?VGxoQ2t0MUxLUmhnM1lEb2dkcjJNR042dmFmVzhjTnJpYzVkejR3dGt3cWx6?=
 =?utf-8?B?eHhKOExYVGNLR0xPNUpMeWVmejhMVDBsaU9wQk96VEZaQXB2QU45RzNsSENx?=
 =?utf-8?B?M1h0YVBuaEtiRUZROVZZN3pWeTJtS3BqbmM0OWFlR1VaNk9FZ2oxT2daV1Rw?=
 =?utf-8?B?RzhBdHdxNDhtcnllRmhHU0FYZmtQbzIyOXNPS2FxSWtNV2doQmJYS0xza044?=
 =?utf-8?B?TTNhUERveU5FaE8xY0FZa3ovL3dPT1lmK1hLRnNoK29jT3B3bVV4Nys0cUFB?=
 =?utf-8?B?NFdxbXQyR25FRGVrR3NlTEpMUzU1RmxaUmNxWWdlZ0ZmRXY3SlRwUG9iWnNm?=
 =?utf-8?B?R3pqRVFmeHo0MkVQWGs3UktwYS9OUld0NmJGU0F1RVBieVJ0TjJHZWJSQ0Q1?=
 =?utf-8?B?NnpoYzdWaGVWSlV0RHBLc3hzVWpuZjBudEVoUGVNemhHMzRzTzErcnd3K1Q0?=
 =?utf-8?B?SUFKZENUblZGK3lZNVhWOUhVbHpiTUE5YzB5U3V5eFhkbTB6NmUvckN3K1V1?=
 =?utf-8?B?VWFGV0VlSUJSTGM0Qk5ZdGZXYU5uQnRiUm12a1ZLbUFMcDRwUFp0OE9XRGN2?=
 =?utf-8?B?WVQ4cDBpdmZnNjN4cWVKNDE0elpIRFZ3U1NnN2ZMMTF0TmVodEVhekltVkRq?=
 =?utf-8?B?YVdLN0h1RTRhVEtTdkRVZERGTmI3NzFhZDFucTVKcG5pbnh4ODJWYUhZajNC?=
 =?utf-8?B?Rytld0Y0OXptazhvRHdlQ0JxZFFVaDhpRnIyTkgzSGV4bm0zVmVqY1V6WG54?=
 =?utf-8?B?TE9mVEVDZkh1cjdPU0MweGwrWWdUSDloOTJLRlhpWi9kaDY2UVIySFBPdEVu?=
 =?utf-8?B?MUZGeTRPMXV6RU1tbHVpWnRXcVFlUGhSc2YxZVNPYlZmN2FhcktuMXo4THFz?=
 =?utf-8?B?L1lUbWlna2M3d05lcytJUTh3OUVudVJ3SXBGZWxCNEx6bHRlOEJvTXNtOGlH?=
 =?utf-8?B?SFBjQjR3RTRLNmx3Z3dhUDc0ZU5rUEljRkg3RnVnS1R2cVBkdWh1a0l4VUt1?=
 =?utf-8?B?VUUyQnFxZEM2cnowZmNYN281Z0p1K21nTEpxOWFvQnZPUHh1dEU4aS94Rzhw?=
 =?utf-8?B?ZzhoSXB3d2hmUXJPS0w2STRzSFRjclhjZ1grWkJiUXIwaGJJY2hMekdjUGo1?=
 =?utf-8?B?aGJqaVFTY0ZIK2pCcnd4bVp0cVNDcWN1VGdjb2U2NEk0MUZmUlFXV2ZCNkZo?=
 =?utf-8?B?U3JpbEQ5OGJoT3IzdVpRRVNlekh5ZjVuVDZzVi9ScFNjaFdUUEM2QVIvZVJW?=
 =?utf-8?B?MFBhMitIK1FzZ0ptVytmY09RbGVsUkoxOVpyNS9oYXVXemJ0azZEMDh5TDRr?=
 =?utf-8?B?U0xMaUtjUzNpQ1lBNzdJSUVJSGJLekxCQlhYcVhtVnNLUjFBbUdHSkVudTBI?=
 =?utf-8?Q?8eCzGalIkBgNfPfE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3901F3DCE101E43BAA22AC747C5CB85@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e781a0e3-624b-4e08-81dd-08da5546c2c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 18:32:42.9698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PHhf7CJIPjJdClSlTwjfhW7LyqlguYSTiaszYwKg6bxAwLCKwgsqygm1wsG7IQn/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4575
X-Proofpoint-GUID: fl07DQ0zrcj4YtAJFSGOT9oshM5pI7hT
X-Proofpoint-ORIG-GUID: fl07DQ0zrcj4YtAJFSGOT9oshM5pI7hT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_08,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=7173458386=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MISSING_HEADERS=1.021, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 2LXgcjdA3waw

DQoNCj4gT24gSnVuIDIzLCAyMDIyLCBhdCA1OjU2IEFNLCBQZXRlciBNYXlkZWxsIDxwZXRlci5t
YXlkZWxsQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAyMyBKdW4gMjAyMiBhdCAx
MzowNCwgUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5jb20+IHdyb3RlOg0KPj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBEZWxldm9yeWFzIDxwZGVsQGZiLmNvbT4NCj4+IC0tLQ0KPj4gaHcv
YXJtL2FzcGVlZF9hc3QxMHgwLmMgfCAxMCArKysrLS0tLS0tDQo+PiBody9hcm0vYXNwZWVkX2Fz
dDI2MDAuYyB8IDE5ICsrKysrKysrKystLS0tLS0tLS0NCj4+IGh3L2FybS9hc3BlZWRfc29jLmMg
ICAgIHwgIDkgKysrKystLS0tDQo+PiAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDE5IGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZF9hc3Qx
MHgwLmMgYi9ody9hcm0vYXNwZWVkX2FzdDEweDAuYw0KPj4gaW5kZXggZDI1OWQzMGZjMC4uNGU2
Njg4Y2M2OCAxMDA2NDQNCj4+IC0tLSBhL2h3L2FybS9hc3BlZWRfYXN0MTB4MC5jDQo+PiArKysg
Yi9ody9hcm0vYXNwZWVkX2FzdDEweDAuYw0KPj4gQEAgLTE1OCwxMiArMTU4LDEwIEBAIHN0YXRp
YyB2b2lkIGFzcGVlZF9zb2NfYXN0MTAzMF9yZWFsaXplKERldmljZVN0YXRlICpkZXZfc29jLCBF
cnJvciAqKmVycnApDQo+PiAgICAgfQ0KPj4gDQo+PiAgICAgLyogR2VuZXJhbCBJL08gbWVtb3J5
IHNwYWNlIHRvIGNhdGNoIGFsbCB1bmltcGxlbWVudGVkIGRldmljZSAqLw0KPj4gLSAgICBjcmVh
dGVfdW5pbXBsZW1lbnRlZF9kZXZpY2UoImFzcGVlZC5zYmMiLA0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2MtPm1lbW1hcFtBU1BFRURfREVWX1NCQ10sDQo+PiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAweDQwMDAwKTsNCj4+IC0gICAgY3JlYXRlX3VuaW1w
bGVtZW50ZWRfZGV2aWNlKCJhc3BlZWQuaW8iLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2MtPm1lbW1hcFtBU1BFRURfREVWX0lPTUVNXSwNCj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEFTUEVFRF9TT0NfSU9NRU1fU0laRSk7DQo+PiArICAgIGNyZWF0
ZV91bmltcGxlbWVudGVkX2RldmljZV9pbigiYXNwZWVkLnNiYyIsIHNjLT5tZW1tYXBbQVNQRUVE
X0RFVl9TQkNdLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHg0MDAw
MCwgcy0+c3lzdGVtX21lbW9yeSk7DQo+PiArICAgIGNyZWF0ZV91bmltcGxlbWVudGVkX2Rldmlj
ZV9pbigiYXNwZWVkLmlvIiwgc2MtPm1lbW1hcFtBU1BFRURfREVWX0lPTUVNXSwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFTUEVFRF9TT0NfSU9NRU1fU0laRSwgcy0+
c3lzdGVtX21lbW9yeSk7DQo+IA0KPiBUaGlzIGlzIFNvQyBjb2RlLCBzbyBpdCBzaG91bGQgcHJv
YmFibHkgYmUgaGFuZGxpbmcgaXRzIHVuaW1wbGVtZW50ZWQNCj4gZGV2aWNlcyBieSBjcmVhdGlu
ZyBhbmQgbWFwcGluZyBUWVBFX1VOSU1QTEVNRU5URURfREVWSUNFIGNoaWxkDQo+IG9iamVjdHMg
ZGlyZWN0bHksIHRoZSBzYW1lIHdheSBpdCBoYW5kbGVzIGFsbCBpdHMgb3RoZXIgY2hpbGQgZGV2
aWNlcy4NCg0KQWgsIHJpZ2h0LiBJ4oCZbGwgaW5jbHVkZSBhIHBhdGNoIHRvIGNyZWF0ZSB0aGUg
ZGV2aWNlIGFzIGEgcmVndWxhcg0KY2hpbGQgb2JqZWN0LCBhbmQgYWZ0ZXIgdGhhdCBpdCB3aWxs
IHByb2JhYmx5IG1ha2UgbW9yZSBzZW5zZSB0bw0KcmVtb3ZlIOKAnGNyZWF0ZV91bmltcGxlbWVu
dGVkX2RldmljZV9pbuKAnSB0b28gYW5kIGp1c3QgZG8gdGhhdA0KbWVtb3J5IG1hcHBpbmcgZGly
ZWN0bHkuIEVzcGVjaWFsbHkgc2luY2UgSeKAmW0gZ29pbmcgdG8gcmVtb3ZlDQp0aGUg4oCcc3lz
YnVzX21taW9fbWFwX292ZXJsYXBfaW7igJ0gZnVuY3Rpb24gdG9vLg0KDQo+IA0KPiB0aGFua3MN
Cj4gLS0gUE1NDQoNCg==
