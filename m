Received: by 2002:a17:906:3017:b0:a26:c056:f233 with SMTP id 23csp280898ejz;
        Fri, 22 Dec 2023 06:23:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEE221LiCVeGWUTu4wxdTvzxpHca31S1lPIKtGYGuiJafIe/8tsTRLtQnL3PyGlqBDypDQn
X-Received: by 2002:ac5:cfda:0:b0:4b6:e424:754 with SMTP id m26-20020ac5cfda000000b004b6e4240754mr797852vkf.27.1703255022210;
        Fri, 22 Dec 2023 06:23:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703255022; cv=pass;
        d=google.com; s=arc-20160816;
        b=w842cZFcT2fuW/zeNrz5YHq4LfeHj5aq+qDo0aMYE0eor3c698Ju4l6APebAti3The
         W+9RJBa4gUOymy7ja/bSNkdHhDI3G6Qa7m8R7rK2wugQBJxNBVhigiPOWbMlNZHXOMXu
         cInpdixboYNwyowiQXFaE+VpXplId99xXYo9mDlvzRrSJ9vv7HFbcbo39oNzkc6JfH1K
         Wlg2AkDNP4vvZbzkQN9SlKD5pHPa1krKGU2q3YoAQbGVDFs788Wx/+4JKzE+HDjjUPhS
         Hhkw9+afrprAVDTGP9ThEQDDJ8JkuWdCjmP7tTuAVa+uN8XaE1YNjUIzMU9Bb8VJfZKu
         QtoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=uvfUz5VvDtPBFQnVpCwjMl4aW46ScQMkSkrZeYrX9YY=;
        fh=1wUvpL7Cyv+Ui6xrcePBqb7wLQsbaXtdRCOYB3v1w34=;
        b=qG+JfLSq0GytYCZC0PGX8m85XldUKKTJLsMaVIQwz1TXn2D60QaZG1BQhc34oSfq+q
         S91B3VmcYxXUOQXZ9HJ+6JKCCJPHYGSuv6cbvQXIjiEYbcbK2bzCEMm1ZN/tuZFKHKLq
         gd7m2JpwaHGCH74cgjZNsjMPdlKidNirsaS41FaVKz9z7AtFYq0/R02v+CSULEx7hmoi
         jjRqAMU9revWyh/rg9zmhkquh3m8b/+kFFhYKMUgRqh8c8zioNZTzTU7a8gnjNzPeGO+
         V0s+CiY3VNHYjtJ/HDwRi0dJ3VOgt2Kf46x6cd329QF+hCCiTAQ8z3rTsvcsIFTt561T
         r3bg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=FETL8NxQ;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=Qg1O6vCF;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d189-20020a1fcdc6000000b004b7189f37besi149465vkg.314.2023.12.22.06.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Dec 2023 06:23:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2023-11-20 header.b=FETL8NxQ;
       dkim=pass header.i=@oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=Qg1O6vCF;
       arc=pass (i=1 spf=pass spfdomain=oracle.com dkim=pass dkdomain=oracle.com dmarc=pass fromdomain=oracle.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rGgQz-0006Bn-Ji; Fri, 22 Dec 2023 09:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1rGgQx-0006BK-R2; Fri, 22 Dec 2023 09:23:27 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1rGgQv-0000oy-4Q; Fri, 22 Dec 2023 09:23:27 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3BMDbMWW027936; Fri, 22 Dec 2023 14:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=uvfUz5VvDtPBFQnVpCwjMl4aW46ScQMkSkrZeYrX9YY=;
 b=FETL8NxQtS0yJEC8E7EBFFkynL4H5tc78n77PZJaBminXIU2HTaa2OQLp+zabJFBdZwq
 BLOy2jh8jb2CKOzFin8C4vNNwCuq/lqDA7RnWn0gVQpVNUmbm4Uq5ZTleBHTL2o5cNTm
 TwZb5k/4dzV+uylN+kk5TR62+db/zkUQSLybv0C+qsWqXNyWnPVRaImQ3AGVh1VSJRIW
 JcxnU/6qeTX8FTZVQumg3k5lm+d0Jb/U5fZTfI3CJ+dpQ4MiLsY5oO+RzBLk6SzRATkh
 ExmxRqqO0GLgqMbZcFv53noNDJd3ZlQE3IW4f8ymKkOxymxDgB92jXnA0MxTTb5tU5vp FA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3v4atx40tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Dec 2023 14:23:20 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 3BMDGb1U035489; Fri, 22 Dec 2023 14:23:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3v12be2r48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Dec 2023 14:23:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hh/63nrNNzHkbsXbfZG7qcv/t1ozglDOUXvU/mf3KSmgCdM9VO+TFzzAKxqrgQKVFOkrBNMwGPUH6MxgoSzPlllWqesvR20G43wE9Tlq1QW99dZQL2uUHM2a/l75PcUMgcGyRYgBOkZXEpTPSyiIHATbC35GWj6pBAyLqO9XAsS9eilxEnF0Cjc+SthPX/aUv2i5Mz6RrpcxQ10a0Web0j6mYp66frzcCw7gQLOrShL19Vt2y2gIjY+CoabU+yAwIVvr8fM16GWCq3WvE7ouhuzHyUmmBBjesBSu/mzOw79accP1CmrsQ22Goy642rVPdnOR9N8dqj8zcIrXBvfDew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvfUz5VvDtPBFQnVpCwjMl4aW46ScQMkSkrZeYrX9YY=;
 b=O5we2FymJ0KBCDGUkOg2DJa1i8a9OQT9sfk4Z0tYpxrfsQqbYxki2PXxH65ujKIXeVNFe6uMPGxuVdHQrjpnfkazGEtdz+AyI/4zfgsz6xWcf4pbUu89YtMKt0EN0n/7f+ei3CxX+pg6Gp47zxrUNBTF8JZwBE44TxPLqOuRxN3aZ8/nHzd5sKRKvkUOcpyb/hHzXtaWAxv55XDflxDcHHMBLl9d6NfN/qtC/GpPkjxCrhdMPPVK1UJSWqbHk+E4JYOmGTraoJ1qfzOh98rvA3C9x/2YMyz3srxXazi4jO2n+eVFleR43MGPuLmIua0rOxHugYymQ1CiHH7UTNDAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvfUz5VvDtPBFQnVpCwjMl4aW46ScQMkSkrZeYrX9YY=;
 b=Qg1O6vCFxlogPXtYBFiRj6a1cUnv29dHW2TM70OIT6R9y7PlcJo07KS/VAXFdowv38VuvYgNY5xqeu4xofqTShSCBF+iZOJ3sMvwjzFOxTalSnAsGJulzpgHNTItT5Hm1yyhVX/Q9Oeb5JgG1QrMaHW8UWYehOSVZfkpuwNGqg0=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by BN0PR10MB5109.namprd10.prod.outlook.com (2603:10b6:408:124::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 14:23:16 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::5997:266c:f3fd:6bf4%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 14:23:16 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 00/35] target/arm: Implement emulation of nested
 virtualization
Thread-Topic: [PATCH 00/35] target/arm: Implement emulation of nested
 virtualization
Thread-Index: AQHaMaYRZUndUmdMrk6xdGhmdoaJH7C1YXKA
Date: Fri, 22 Dec 2023 14:23:16 +0000
Message-ID: <2D791223-C9CE-46CD-8403-83BD9CE8D355@oracle.com>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|BN0PR10MB5109:EE_
x-ms-office365-filtering-correlation-id: 8c017a17-262e-4123-871c-08dc02f989ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7HXQCFToz5sjVX9/r0feIOoU1Pn7SXXtb44nxk2Dca3XQMTWzIXgJ0LyIOa/LmTJYyvh4yKTgfjkELO2AmTE2OsqXzm8/tLS634O2zPX3W63FzCIHVjXib4JiNjKRtwFoT7GvkigL9TT5N5FQz5jAXekSR2TctLK5vo1YRwJ4/SYMxbX6FgGJtkYs6VgeAyivHMTFl/2RwoQFnbxFAb68Q7RnY5Gi1ER/1sOlj9wpPv7ZzidVGbwKVe8NkU5r6+rsXze78FHhPGaJs4ASzxrbzTUuj3WZMSAQzBgE13Ye0hs080IhwUpfNZ5v/+ArUuD0XkhL3Zq2R6cUjIh6ShLNzoYlPPzFxl+SrXiVqahp0b/ZlqsrQqp0FelAQcnSDol+DInbcXF6Y28npd13F0gayYd65oB0Kcmkbi+zKQ67WcyUD/T+K6LavX9FihS+iokgeCL4dq6Wfv9bowLvmV1Rq7k/IrdxJYAB30wGKk4mhnV8p+oDnuV/jgWEsDbYcHuavON6U3gmT0C9b1muYx4+4wxNlS2+fj2/DtNxkwgBvCeGHCj5Tqd8/5eGLOkheMJrxv0kT91IEiagi8gdu4EE6JaGcWvRXgvLikxWIaA/FLFDZRTsF1r2RXCv46T9hxubkzZOB7HZVfuGIrZ/XmGWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(376002)(366004)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(4326008)(8676002)(8936002)(6512007)(6506007)(71200400001)(53546011)(66556008)(66476007)(64756008)(76116006)(66446008)(6916009)(54906003)(316002)(83380400001)(91956017)(44832011)(66946007)(2906002)(33656002)(86362001)(38100700002)(36756003)(478600001)(122000001)(6486002)(966005)(2616005)(41300700001)(38070700009)(66899024)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xv0P7uoYe8UR3FdvM9NhmjmJgSSpTDwv/x4XR84p1wbMuLsG7O29B3FFbFFu?=
 =?us-ascii?Q?e120Ql+uyPHVHXT8x7RH7g/+z37IvrN+iVyS5yXU4RA3Pf+yv2fBc2AW8TAb?=
 =?us-ascii?Q?6BRtMZbx2n3s5PtUekr7HnBZ9aJAJqR+0EGdet8UPgTQV7kNGQH/sNuQprAl?=
 =?us-ascii?Q?XJblyPVg/5i9RM1DA87DrndzzQ8Jne/f5HzCQ/c7Q7KiWEBD93VTTcigHZ8h?=
 =?us-ascii?Q?QggLLaTUgUkyCw+hZI1hra2+XH/lqJomDI4aV0R6pp1R43Lq4yD4bi/Avygl?=
 =?us-ascii?Q?Z7jhc/McPZPhFIqw7FRBL+snqv9zGijH/HZl6i26PIS5LBni1GRxLIiHnpeN?=
 =?us-ascii?Q?E+NLmXwWlTnTSswrpqOCIBcXjNbHFGXCLGGaM4Q1OX8FERnNro7XY3WHRCFp?=
 =?us-ascii?Q?PMv9BJyoRm+7r7z7XP7/rKWdSsyPW/Ty5b5OZIuAEcALk5tln/d7np9QgPOG?=
 =?us-ascii?Q?lbVXrilwmqxyaLaqvD+Kcz6dwMVBMxTcgjKZEATm6ZIAhvlAr+DPeGeKZa8Q?=
 =?us-ascii?Q?1m1gQogMZfAH02KcifarcpDTYKBm7UTDGpQwbM+dbaPTXouCwPOJvR/HKRey?=
 =?us-ascii?Q?/X6PQ90P76hLWziaQOBs4FQ/GwZSecDFyv1i3l/HeuFeIousm8o5W0UYvedj?=
 =?us-ascii?Q?xSWeROzlrm7dmZokoA3xq4kexgvhxzk3LNeQPG9XUngTZb41o5ltuhkrixBx?=
 =?us-ascii?Q?lR7Pl7DiTGrVMWKuW66Qx+KMnWsAm/+uWX6Fx6BK4YZ6Ey4u5mExa7qaKW4/?=
 =?us-ascii?Q?kr+9shNW3Byi39dQ8QPi04A9cpQPKix6xLmVy4cFQLa8yoDOYkyuhpXe9Lql?=
 =?us-ascii?Q?IkW20qSiynBMHYYTih9THktdO/khmCqvvICVQrTsQB5zMLT2G/KkW4YyBSXv?=
 =?us-ascii?Q?5VrD9bbMFXhB1SxOFzR+uv5ymQZWMDl60ii/uip2FWDLmUtiZjimwAmgla1P?=
 =?us-ascii?Q?fZme3q0WADpcYujUrU7tIxkvsS94vDgBZk2YPawne5FM7m7B6Umddxr/L/r+?=
 =?us-ascii?Q?Zrk1cDvOynEar8FaZZHKlAzL61cLcyzcNIS5HxrC7DceYOIWJnMsJZj/hUFS?=
 =?us-ascii?Q?Coj1kgwg9gg7UjWEYSSF5dPEo4EZBarFZ2Jb0iCleyXQAg69QbkAQbQ8bGw/?=
 =?us-ascii?Q?5UEuyhltEceKErEV8gFisN8+Yeu2RU/ipAP/0aUFZknk5ccCu5JjM/tBpPA4?=
 =?us-ascii?Q?3w5ET2YiS3VPMHeFbPd/gMSu+roa/sitmft1uZrySWwFymEoqg+tNMUYJPJt?=
 =?us-ascii?Q?MPDC1NB6Cg1z+h4Vjk6km1cRgeZBJMqtPxyxRcOqLQzP9H0JFgSjukkcsbPV?=
 =?us-ascii?Q?g2tqwXyZ3NbN202KBQFaH8ElC09vpfdDbHbIKWiFKiUb8JAg57Y7FCr+eTeH?=
 =?us-ascii?Q?VSbJGKKoSnd80Vx/kXFuZjRIode1L4MfJfxBLR8Z1hh35yAhv+/U1fb29oK0?=
 =?us-ascii?Q?HnG3pJTUB/4xJuJUJ8XsRKaPkS9CTOlDmU24j5KkubVk8j1S0dCWWxrYpdX7?=
 =?us-ascii?Q?vqTIye6cuFtIca0KmUSukwrad2Ueef1j8TqIVDf5hmJlWqvjIRuXA45iCBEF?=
 =?us-ascii?Q?GEJAhOyWvYHnagef/NkecaOuv3oYeQHQ4+X9khOwUgSzW+NG4PMMNtiqA6rj?=
 =?us-ascii?Q?08ylvE0w8jgRCclVFXvmTgY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F87CF01A0027844688BE6DBEDF46BBA5@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: aUTkXy5NBouJYxeLD5SRVkoWpnGO8lFQWYD+aiVmv9aMaxMLKGquvmb5dJ0EkpLNvVEX6MdrZvGMpYBdCB8TWB3PnVsXcFsO0BwGeI+rDxc/2ZG9gsPVdMFSaPTrb2XMiQ4o6rcqjxJNNPbcmxk6sASVly8PGZPHFXAnHBc45IaHTTcgvuij2HMAs+rN3E8sbmHP4HFKdIUxKaIyzFWUWbBi5S+gIOG7XBmyGzJ0SSAUblqxiuPnH6JblFOxoUsMh8/OeoH+J247gRLAtY+WiyppHP1+q+A5Fd1DLA3KjvG8sN0Rh0XrbEjL0Dkfr0ixFGEv9tWedFzeQI1bW3w1ZXML88NOUWgZ/n/VDORoTIGW1aHGupl2DZC6IaUzSYsXCuyImhLln5zJE4BVHM3ad3gwgK8RxHcEfxGkroKqpx6Csrl0MWntNzlMRRxAAOsXYRCaAD7ClzrVzG71mfMRXTqx8I9QkWdXfZd5feoyngDRSzYlCo/dUuPUcJcukN34Zj0sNm5EPY7XqfyGoCJcnHBrrrCJj3FlDGwv/SJroq8OZF8hF5aUgJeBvWeMbddSoCtrAs1j3KdgdRq6kxXhPtgJx+QAMA6sipoh+7BXgjw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c017a17-262e-4123-871c-08dc02f989ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2023 14:23:16.3265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ggsxGPukBqZSKy25E91wA2VpxCNmvweVcfu7S1+BEZZQ/7M6b/OV9dG2IzYI12hHhPRqT3RJ6AmDJmmW1z4UwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5109
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-22_08,2023-12-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312220105
X-Proofpoint-ORIG-GUID: a6hM5tMJVsdeR1WfcSIhTjdABVTLLA9d
X-Proofpoint-GUID: a6hM5tMJVsdeR1WfcSIhTjdABVTLLA9d
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OFFlW6FFo9mu

Hi Peter,

> On 18 Dec 2023, at 10:32, Peter Maydell <peter.maydell@linaro.org> wrote:
>=20
> This patchset adds support for emulating the Arm architectural features
> FEAT_NV and FEAT_NV2 which allow nested virtualization, i.e. where a
> hypervisor can run a guest which thinks it is running at EL2.
>=20
> Nominally FEAT_NV is sufficient for this and FEAT_NV2 merely improves
> the performance in the nested-virt setup, but in practice hypervisors
> such as KVM are going to require FEAT_NV2 and not bother to support
> the FEAT_NV-only case, so I have implemented them one after the other
> in this single patchset.
>=20
> The feature is essentially a collection of changes that allow the
> hypervisor to lie to the guest so that it thinks it is running in EL2
> when it's really at EL1. The best summary of what all the changes are
> is in section D8.11 "Nested virtualization" in the Arm ARM, but the
> short summary is:
> * EL2 system registers etc trap to EL2 rather than UNDEFing
> * ERET traps to EL2
> * the CurrentEL register reports "EL2" when NV is enabled
> * on exception entry, SPSR_EL1.M may report "EL2" as the EL the
>   exception was taken from
> * when HCR_EL1.NV1 is also set, then there are some extra tweaks
>   (NV1 =3D=3D 1 means "guest thinks it is running with HCR_EL2.E2H =3D=3D=
 0")
> * some AT S1 address translation insns can be trapped to EL2
> and FEAT_NV2 adds:
> * accesses to some system registers are transformed into memory
>   accesses instead of trapping to EL2
> * accesses to a few EL2 system registers are redirected to the
>   equivalent EL1 registers
>=20
> This patchset is sufficient that you can run an L0 guest kernel that
> has support for FEAT_NV/FEAT_NV2 in its KVM code, and then
> inside that start a nested L1 guest that thinks it has EL2 access,
> and then run an inner-nested L2 guest under that that can get
> to running userspace code. To do that you'll need some not-yet-upstream
> patches for both Linux and kvmtool:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log=
/?h=3Dkvm-arm64/nv-6.8-nv2-only
> https://gitlab.arm.com/linux-arm/kvmtool/-/commits/nv-v6.6
>=20
> You'll also want to turn off SVE and SME emulation in QEMU
> (-cpu max,sve=3Doff,sme=3Doff) because at the moment the KVM patchset
> doesn't handle SVE and nested-virt together (the other option
> is to hack kvmtool to make it not ask for both at once, but this
> is easier).
>=20
> (kvmtool is needed here to run the L1 because QEMU itself as a VMM
> doesn't yet support asking KVM for an EL2 guest.)
>=20
> The first three patches in the series aren't strictly part of FEAT_NV:
> * patch 1 is already reviewed; I put it here to avoid having
>   to deal with textual conflicts between it and this series
> * patch 2 sets CTR_EL0.{IDC,DIC} for '-cpu max', which is a good
>   idea anyway and also works around what Marc Z and I think is
>   a KVM bug that otherwise causes boot of the L2 kernel to hang
> * patch 3 is a GIC bug which is not FEAT_NV specific but for
>   some reason only manifests when booting an L1 kernel under NV
>=20

I've successfully replicated this setup and reached inner-nested L2 guest=20
userspace.

FWIW, feel free to add

Tested-by: Miguel Luis <miguel.luis@oracle.com>

(I've been working on QEMU asking KVM for an EL2 guest on top of this serie=
s=20
although there's been yet some debugging to do.)

Thank you!

Miguel

> thanks
> -- PMM
>=20
> Peter Maydell (35):
>  target/arm: Don't implement *32_EL2 registers when EL1 is AArch64 only
>  target/arm: Set CTR_EL0.{IDC,DIC} for the 'max' CPU
>  hw/intc/arm_gicv3_cpuif: handle LPIs in in the list registers
>  target/arm: Handle HCR_EL2 accesses for bits introduced with FEAT_NV
>  target/arm: Implement HCR_EL2.AT handling
>  target/arm: Enable trapping of ERET for FEAT_NV
>  target/arm: Always honour HCR_EL2.TSC when HCR_EL2.NV is set
>  target/arm: Allow use of upper 32 bits of TBFLAG_A64
>  target/arm: Record correct opcode fields in cpreg for E2H aliases
>  target/arm: *_EL12 registers should UNDEF when HCR_EL2.E2H is 0
>  target/arm: Make EL2 cpreg accessfns safe for FEAT_NV EL1 accesses
>  target/arm: Move FPU/SVE/SME access checks up above
>    ARM_CP_SPECIAL_MASK check
>  target/arm: Trap sysreg accesses for FEAT_NV
>  target/arm: Make NV reads of CurrentEL return EL2
>  target/arm: Set SPSR_EL1.M correctly when nested virt is enabled
>  target/arm: Trap registers when HCR_EL2.{NV,NV1} =3D=3D {1,1}
>  target/arm: Always use arm_pan_enabled() when checking if PAN is
>    enabled
>  target/arm: Don't honour PSTATE.PAN when HCR_EL2.{NV,NV1} =3D=3D {1,1}
>  target/arm: Treat LDTR* and STTR* as LDR/STR when NV,NV1 is 1,1
>  target/arm: Handle FEAT_NV page table attribute changes
>  target/arm: Add FEAT_NV to max, neoverse-n2, neoverse-v1 CPUs
>  target/arm: Handle HCR_EL2 accesses for FEAT_NV2 bits
>  target/arm: Implement VNCR_EL2 register
>  target/arm: Handle FEAT_NV2 changes to when SPSR_EL1.M reports EL2
>  target/arm: Handle FEAT_NV2 redirection of SPSR_EL2, ELR_EL2, ESR_EL2,
>    FAR_EL2
>  target/arm: Implement FEAT_NV2 redirection of sysregs to RAM
>  target/arm: Report VNCR_EL2 based faults correctly
>  target/arm: Mark up VNCR offsets (offsets 0x0..0xff)
>  target/arm: Mark up VNCR offsets (offsets 0x100..0x160)
>  target/arm: Mark up VNCR offsets (offsets 0x168..0x1f8)
>  target/arm: Mark up VNCR offsets (offsets >=3D 0x200, except GIC)
>  hw/intc/arm_gicv3_cpuif: Mark up VNCR offsets for GIC CPU registers
>  target/arm: Report HCR_EL2.{NV,NV1,NV2} in cpu dumps
>  target/arm: Enhance CPU_LOG_INT to show SPSR on AArch64
>    exception-entry
>  target/arm: Add FEAT_NV2 to max, neoverse-n2, neoverse-v1 CPUs
>=20
> docs/system/arm/emulation.rst  |   2 +
> target/arm/cpregs.h            |  54 ++++-
> target/arm/cpu-features.h      |  10 +
> target/arm/cpu.h               |  24 ++-
> target/arm/syndrome.h          |  20 +-
> target/arm/tcg/translate.h     |  16 +-
> hw/intc/arm_gicv3_cpuif.c      |  28 ++-
> target/arm/cpu.c               |   8 +-
> target/arm/debug_helper.c      |  34 +++-
> target/arm/helper.c            | 360 ++++++++++++++++++++++++++++-----
> target/arm/ptw.c               |  21 ++
> target/arm/tcg/cpu64.c         |  11 +
> target/arm/tcg/hflags.c        |  30 ++-
> target/arm/tcg/op_helper.c     |  16 +-
> target/arm/tcg/tlb_helper.c    |  27 ++-
> target/arm/tcg/translate-a64.c | 162 +++++++++++++--
> 16 files changed, 725 insertions(+), 98 deletions(-)
>=20
> --=20
> 2.34.1
>=20
>=20

