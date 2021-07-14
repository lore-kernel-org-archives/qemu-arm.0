Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp158035lfc;
        Tue, 13 Jul 2021 17:44:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNnlCFh90EVYUCtrXC5KXSEaj1ubdkE/Czz2cTVCVH5viconR/xVtFyLPLfRmrbEyEVYYO
X-Received: by 2002:ac5:c5d5:: with SMTP id g21mr507873vkl.12.1626223497569;
        Tue, 13 Jul 2021 17:44:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626223497; cv=pass;
        d=google.com; s=arc-20160816;
        b=Jqx4/2YiWHJLLnLEnNKUrghBYGp4RzYnZOD7geMrhMFoiB45Ai8vrjaSN9h+hjc9XS
         /UgJN/wxvh7toHn2lz3V6f/Em9qQoHOW8Ag2Efu67Hi7DECa/WdXG5SN569eL8mrB9D7
         1S+sJXdJEjlAbOwzvk/Djfsq6fIZ514qrFNg21PS7iYb7IC8qsb4NH5POwzflXrob1kX
         qAmpS5W9uJ4RslpoYFOb5qOhI/LOG3gEDD3ePZ1z/vs5wXrvEd/vBaf0GVX5ohnJvWBC
         k/rB57Q4M0ZB+VChiSFoXuC+RotJXm+gDuCPupdjpMSi3eljFtiZdeAu6WVTMnYEpcF8
         kuXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=jpJPY4ylHAg+w7pUo8aslROxciQOp+66npMVnI9iXYc=;
        b=OpkGa5sGHdEEKRFOhBo0zwiIYF9g4UKJYgTvd/2chfqcQpD0q63dgKMG8BFV4rXl+Q
         XtFVofQvJDMOH/IK4Jo+mYzps8qwdpTUtgGWKnaPaVd2jtQtMv8IQ2jC0cPfoboMJR/j
         oYj0t/bAnqWLwXHM6SmKKy6BZQvYV44tC3WN3GGbwthLy5Qwg3JLy/X5soS1oZHSj8SM
         fWaTIJRKz20zeK6yLugECAb1rTulFZwVTu5cdB79CBxgfNdHwxTwoo+HhhjWirAmR0Qg
         fuEQDwB2A14R/dItqX2NXPvcXawh9yiKuJZ7cHDzw3hB+oVm/WnQr4UVutASpqimUJJR
         LP/A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@brekersys.onmicrosoft.com header.s=selector2-brekersys-onmicrosoft-com header.b=aOsYl0JA;
       arc=pass (i=1 spf=pass spfdomain=brekersystems.com dkim=pass dkdomain=brekersystems.com dmarc=pass fromdomain=brekersystems.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si466762ual.31.2021.07.13.17.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 17:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@brekersys.onmicrosoft.com header.s=selector2-brekersys-onmicrosoft-com header.b=aOsYl0JA;
       arc=pass (i=1 spf=pass spfdomain=brekersystems.com dkim=pass dkdomain=brekersystems.com dmarc=pass fromdomain=brekersystems.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3T1E-0000wd-Qa
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 20:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aileen@brekersystems.com>)
 id 1m3Smn-0007qH-6i
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 20:30:01 -0400
Received: from mail-dm6nam12on2062c.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::62c]:19648
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aileen@brekersystems.com>)
 id 1m3Smj-0001XD-4r
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 20:30:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcXqy9Fzu6qJjafDfs2KquVbInuZ9f1Zj1nznjJSx8qvzA1LKyjf4LocUQBxB+pD5ZskuIX7enaEZktsIl37tVahZHtfN4gsSnjl/gniE08LhZVx3KqVoKrsfdfnRLe7kgVQRqfQH8Kmd4soS8FuBqfHRCwSPRI9Q8G5/rStEuSH5vKPru8Uwzf5f4s8sdhGjlxpVtZM2mD4ifblrSoEm+612ZsRrIibMgcRdgbuwOP2GM2pTGSLypgHKH4sjzNAGAx/BJAFBEhyuUneWf0RhsIoozmyAYZDaRWvGtMxtHueobCrXRMUzDGURDnt7n0yK3fAyhKpI+FSaGQbPYn20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpJPY4ylHAg+w7pUo8aslROxciQOp+66npMVnI9iXYc=;
 b=cHbQeIJDHaQMo6IWQEzgqoYntjaLdFVaTJsIhjMgDRPUzDS3wGqgzDqtY68cr0FhTLz3oufPWCSO8ZTghZ+ydVZeRBXKuLKH3hPgFg6ko9tfFhuycI2gEQUgCxQLUA/a0SOXE0T0qWuDssYFGpCnoDAJ2TqceMb4Ndq0F2W4vUPuFU3lFlxM/8U2/GqlpZVwoLhW6sNH9JHAxvWYTF8xj5DwDZsr/tgrhIS8DgS2rjFga5jFeBs7qrUsQfi91LSg5ofiSkNEryRTotcDq0i5zOkBXi0Lx2kz/FZExLnIsGo8cA82gx+RRf09nbi6YGODwW75avjNJHb/BGFKTz6lIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=brekersystems.com; dmarc=pass action=none
 header.from=brekersystems.com; dkim=pass header.d=brekersystems.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brekersys.onmicrosoft.com; s=selector2-brekersys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpJPY4ylHAg+w7pUo8aslROxciQOp+66npMVnI9iXYc=;
 b=aOsYl0JAHtYV2Kn6aCEKg4qVpRNemsTGdiAcpnAG6bXw7Fy3oKxIK1gx5HOE01kE9ygdtZhx+PJdZEif0ZZ2lTJE26wyipR7G//qrKn48yKUlubjjcbflXyCumy8Z5UshUrarMmFAb1y65syV1Z2/3ACPA4e13i8Rmz7sJtzo/Y=
Received: from SJ0PR17MB4320.namprd17.prod.outlook.com (2603:10b6:a03:29b::17)
 by BY5PR17MB4004.namprd17.prod.outlook.com (2603:10b6:a03:235::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 00:24:51 +0000
Received: from SJ0PR17MB4320.namprd17.prod.outlook.com
 ([fe80::70b8:c0d9:cc02:3e4]) by SJ0PR17MB4320.namprd17.prod.outlook.com
 ([fe80::70b8:c0d9:cc02:3e4%7]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 00:24:51 +0000
From: Aileen Honess <aileen@brekersystems.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: qemu-6.0.0:  Assertion 'p_rcu_reader->depth != 0' failed
Thread-Topic: qemu-6.0.0:  Assertion 'p_rcu_reader->depth != 0' failed
Thread-Index: AQHXeEOTTohGNOflxkG9ROFue+Uwsw==
Date: Wed, 14 Jul 2021 00:24:51 +0000
Message-ID: <SJ0PR17MB43209B366B72FCFFC1BADD50C0139@SJ0PR17MB4320.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=brekersystems.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08dfaae8-550c-4b50-f3c5-08d9465dcba1
x-ms-traffictypediagnostic: BY5PR17MB4004:
x-microsoft-antispam-prvs: <BY5PR17MB40045997D9CED917D4627A7AC0139@BY5PR17MB4004.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dFWTfh/30jXYU6s2YmAiMpgFuVIZEbFmcPlgCgKFEsIEUsCooMLDBMnxLgx+hhVlMu7yEhxh59PKnfNjG0sYu80EMN5TR/+QKjE5ANzETwhAPZ+bfISrGg2KMIDPFiJli09y7kat0NMQTormOwLM9gtkEgov9Xeok8qtafloY8cdhH1aVMLjtnAKl5YomL+QA0a3wf8aFtxQyT2CqjI9wcC2XbxesXB1Lh+oU1h2dUCqQHg0lBvHbXx2l8FVWoVbFs03Aq1Dn2iceyOgVpZWHc/aIH6mi5VSHnWHuDt6SQ83RYgHQnaD/HTi3u3kWR5HZ4rfBP2DL3NzQk3R2sw9oKVDBxae7xIpSQqfGmNmaHMR2bLd2wJETgzk8rfteiwrxmhq/PWmNupftafaRpVcTNjt049zL+RHkwEqSDXEpKHIGfln0JvQwN+OxZgs84CcmPXZv/g9dDDKCkhFwYubrCjqZQPdaQPNR2r2nmPNf1FUkP8tHQ+0LlTlu0VXRMeBNEJtDIf2H3cnNtaX9SK1gmg8sv1HJ29Eoa9es7Rt6ImGX8kKGGmtiBFkLXiRTcpl+1bOOE0pDaxSoOl7vp37fL2ANm2BnN8bi25UtgGJCPt831RHWCWLRxx6ovP5aS1gLfMyrW/YUr3aVBlB4fuGZiaeEeS7N7e2CqUlbqBv745WbBzQJbGKKtExf55Y2i9i2iiLZc2EyyIRKZqwGociIL2aXyP/I5LAxLBeAqvOZtXIbYnwwVEy9C/f+KUM5crf2NF8TDkjmXQb8wt4MWopLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR17MB4320.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(366004)(346002)(39830400003)(376002)(8936002)(166002)(66476007)(5660300002)(71200400001)(83380400001)(316002)(966005)(186003)(122000001)(6916009)(7696005)(64756008)(66446008)(86362001)(76116006)(38100700002)(55016002)(478600001)(2906002)(66946007)(6506007)(52536014)(9686003)(66556008)(33656002)(8676002)(9326002)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?4z8nmjL0Xxf9syeyV4fIDgS5fwAwA5uAYC685er+yM+50yoVSS3MIS41?=
 =?Windows-1252?Q?KI32CuicZZ0CuXVKUCb82kMPui+jTyjMGCAxgMdOY4BZeBaRsNtVhzmP?=
 =?Windows-1252?Q?tVRWwJpK6Um9xXlS3ZGlrYS1ick0Jfp9Cd3xg55/2gd22qrtgFBw0EA5?=
 =?Windows-1252?Q?VdTV0hCbqFBhuLI9imfyn+CS8JKk9EzTh8Uchh+P3cpBgpJKxhfnHaJw?=
 =?Windows-1252?Q?hoCrmsXb3IR/WwMqxuGXHr4BCRi6XBN4rp0tJr0d+4A+hMr6kSJtzbhO?=
 =?Windows-1252?Q?Ye+7m9BsOU1jbDiEiZWH7bvc3GXPA+962lS0TLesafAA+d8QeCFXHZTi?=
 =?Windows-1252?Q?434t9wFJ7tDSRxdroFPjfyj6s7zJ0VU2FJAIDN/jBekZ+6ysdv5W18ar?=
 =?Windows-1252?Q?z3zJwFMEUTcRVrwbjAA91WgkCiQkxrUK8ITqVUfmYP367gnSbwQv0CR6?=
 =?Windows-1252?Q?ZZm94HZR89LSKtLL+RSCkHoWtAqZHD5uPUrVKnYRNSwf0Hoq2Tc709OY?=
 =?Windows-1252?Q?6whAfpTY9WPhIENZusKtZuPrenhgddCrop+bh4m7qPVR+yorAo0mABA2?=
 =?Windows-1252?Q?/tik+MaoM/qjlxE+WsFsK1r+pSKCVLqgH0p4DwVfftM4Jdhx3jWJD0g+?=
 =?Windows-1252?Q?eoLBVUhEFUTRLfAP5LMpk2IiCrv7FyTtPq03vIP4esXW5g+eVVNaeVm6?=
 =?Windows-1252?Q?ZJBVlgnY4o5C5HsZkK8V68pMghPvuqIF8/QLKUtOaUoAMeovSk4MVquL?=
 =?Windows-1252?Q?uPmMT0yzVpwqCVH7a7UavMp7YxiAsG7/d1EIftsGdX8U8TyoT4y0buIg?=
 =?Windows-1252?Q?CsuFU2Rs4AzV75lUp79Ph6n07R8cRd51LrsySDunoRMwyZImTBcJCA4N?=
 =?Windows-1252?Q?ERLDeLwcuoWcsLpe0/RaYGXX7LbFRozHihafaq5uo0Va0rcUeASQqCaR?=
 =?Windows-1252?Q?/QqdEXe/sfcUC01L2WAWqJYS8DxNvJ+ZNUR1x8gI1E2oP/TBXeGFjnUK?=
 =?Windows-1252?Q?uZCzPPIdo/kyKBxUhz7sbVDYDYloUh6QF0mhQSgrpDE1bfzGPBwQa/2D?=
 =?Windows-1252?Q?l7AczSSATunmfsfLXkB1uIQnmYh1Kv1w0icxiErDi0E01a3lM8FyB0cc?=
 =?Windows-1252?Q?1Bbb/eqTWIXESBEpscW7YpO3u8FYRuDrdoTXXJ/2AonIGjKKlIsqV530?=
 =?Windows-1252?Q?P2JO5+/rdA0cB2H9+wK42Qq6p57pBWhtkcxTIppw++6QBJXfiQmBkzgz?=
 =?Windows-1252?Q?wBKU3oqwY9vr7+cu99nly4Oc3aQRs9rIeBaumbu2gaJ18AVOsl7RLpeY?=
 =?Windows-1252?Q?DzeKOdxNhnz7RnfOQ+iu3AH1mpgpqQ22c+bn15Th9ijHrBiXz3C7lbir?=
 =?Windows-1252?Q?PeCt7cXMfmmZq+FYX4kpiGe4FrQ49ttC3a1L175ypBbxgH6Cy5rJ3rD3?=
 =?Windows-1252?Q?pziIUR3/NVcG//i4/H+HWzA7b+j2F8lq/vICYXy9OtRw+D0gdz1Fr8su?=
 =?Windows-1252?Q?VO+xsIcrZ4YANgvGE989f74ii+h5kA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR17MB43209B366B72FCFFC1BADD50C0139SJ0PR17MB4320namp_"
MIME-Version: 1.0
X-OriginatorOrg: brekersystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR17MB4320.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dfaae8-550c-4b50-f3c5-08d9465dcba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 00:24:51.0722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d762a1a-d555-4ce6-8ffb-e8bd5687aa99
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8J5uzSmgyMbE7m2c9jfO4PbLJAV0oErj9ZqKaBMLsJlDCiJ2OALSawLJDpvLfRwJrAzZav0FFGaQFtBmygcsOGIR+L7yHjD4kzPqiONK/L8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR17MB4004
Received-SPF: pass client-ip=2a01:111:f400:fe59::62c;
 envelope-from=aileen@brekersystems.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Jul 2021 20:44:45 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4reBfZn6fx6X

--_000_SJ0PR17MB43209B366B72FCFFC1BADD50C0139SJ0PR17MB4320namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

I=92m attempting to run multicore bare-metal tests on the qemu-6.0.0 releas=
e, built from the downloaded tar file.  The tests themselves are generated,=
 but are a mix of C and ASM, compiled into an ELF. I=92m migrating to the c=
urrent QEMU release from version 4.1.0 or so.

My command line (with or without =93-s -S=94) is:

%> /tools/gnu/qemu-6.0.0/bin/qemu-system-aarch64 \
     -machine virt-6.0,secure=3Don,virtualization=3Don,gic-version=3D3 \
     -s -S \
    -m 1024M \
    -cpu max \
    -smp 4 \
     -nographic \
    -semihosting \
    -bios pssTop.elf \
    -device loader,file=3DpssTop.elf,addr=3D0 \
    -device loader,addr=3D0x40100000,cpu-num=3D0 \
     -device loader,addr=3D0x40100000,cpu-num=3D1 \
     -device loader,addr=3D0x40100000,cpu-num=3D2 \
     -device loader,addr=3D0x40100000,cpu-num=3D3;

This will run and produce expected results (through the UART) for a bit.  T=
he amount of output varies from run to run.
However, it will consistently die with this error, for which I find little =
help:

qemu-system-aarch64: /home/aileen/Downloads/qemu-6.0.0/include/qemu/rcu.h:9=
3: rcu_read_unlock: Assertion `p_rcu_reader->depth !=3D 0' failed.

Any ideas=85?

Thanks!
--
Aileen Honess           https://brekersystems.com/support


--_000_SJ0PR17MB43209B366B72FCFFC1BADD50C0139SJ0PR17MB4320namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:532962064;
	mso-list-type:hybrid;
	mso-list-template-ids:-2026080850 -1 67698691 67698693 67698689 67698691 6=
7698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I=92m attempting to run multicore bare-metal tests o=
n the qemu-6.0.0 release, built from the downloaded tar file.&nbsp; The tes=
ts themselves are generated, but are a mix of C and ASM, compiled into an E=
LF. I=92m migrating to the current QEMU release
 from version 4.1.0 or so.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My command line (with or without <span style=3D"font=
-size:9.0pt;font-family:Consolas">
=93-s -S=94</span>) is:</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">%&gt; /tools/gnu/qemu-6.0.0/bin/qemu-system-aarch64 \<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp; &nbsp;&nbsp;&nbsp;-machine virt-6.0,secure=3Don,virtuali=
zation=3Don,gic-version=3D3 \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp; &nbsp;&nbsp;&nbsp;-s -S \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp;&nbsp;&nbsp;&nbsp;-m 1024M \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp;&nbsp;&nbsp;&nbsp;-cpu max \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp;&nbsp;&nbsp;&nbsp;-smp 4 \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp;&nbsp; &nbsp;&nbsp;-nographic \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp;&nbsp;&nbsp;&nbsp;-semihosting \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp;&nbsp;&nbsp;&nbsp;-bios pssTop.elf \<o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp;&nbsp;&nbsp;&nbsp;-device loader,file=3DpssTop.elf,addr=
=3D0 \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp;&nbsp;&nbsp;&nbsp;-device loader,addr=3D0x40100000,cpu-nu=
m=3D0 \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp; &nbsp;&nbsp;&nbsp;-device loader,addr=3D0x40100000,cpu-n=
um=3D1 \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp; &nbsp;&nbsp;&nbsp;-device loader,addr=3D0x40100000,cpu-n=
um=3D2 \<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:Consolas">&nbsp; &nbsp;&nbsp;&nbsp;-device loader,addr=3D0x40100000,cpu-n=
um=3D3;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This will run and produce expected results (through =
the UART) for a bit.&nbsp; The amount of output varies from run to run.</p>
<p class=3D"MsoNormal">However, it will consistently die with this error, f=
or which I find little help:</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas"=
>qemu-system-aarch64: /home/aileen/Downloads/qemu-6.0.0/include/qemu/rcu.h:=
93: rcu_read_unlock: Assertion `p_rcu_reader-&gt;depth !=3D 0' failed.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any ideas=85?</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks!</p>
<p class=3D"MsoNormal">--<o:p></o:p></p>
<p class=3D"MsoNormal">Aileen Honess&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; <a href=3D"https://brekersystems.com/support">
https://brekersystems.com/support</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR17MB43209B366B72FCFFC1BADD50C0139SJ0PR17MB4320namp_--
