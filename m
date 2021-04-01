Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp126435lfg;
        Wed, 31 Mar 2021 21:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIbzehNYLA5cG7ejwy8howuSEUfm5R/S7kQzlCcXThlImm/ubjBLQ1W1St+YTc6MduS4PK
X-Received: by 2002:a92:db50:: with SMTP id w16mr4705805ilq.287.1617250028392;
        Wed, 31 Mar 2021 21:07:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si3424722ilv.111.2021.03.31.21.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 21:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=PpBye5ft;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRobr-00025w-MW
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 00:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1lRoSy-0007b9-8S
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 23:57:56 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:8409)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1lRoSv-0007Lz-NE
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 23:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249473; x=1648785473;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=N16HJRvnYT6DaC1hIIftfitJ8jaPJOGRl/xJq0kFq2Q=;
 b=PpBye5fttafZHVyDy6Flz3+LKE/8uXwLTD98lP0ZuMPLYUa+5cETBR1/
 T3WmIwdDGbl23apt2VKADrN3W6+VZYp29BfedfDaUGOO3tcmD+lMbCDgC
 6MJS30mCB7rIpgpvl5X6LAbwcpdo3LP/4dgebsgI1G0Lrb6eN2PceoiAR 0=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 31 Mar 2021 20:57:50 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 31 Mar 2021 20:57:50 -0700
Received: from nasanexm03e.na.qualcomm.com (10.85.0.48) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 20:57:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 31 Mar 2021 20:57:50 -0700
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR02MB2640.namprd02.prod.outlook.com
 (2603:10b6:300:46::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 03:57:48 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::60a7:9bd9:6e7b:c6d1]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::60a7:9bd9:6e7b:c6d1%4]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 03:57:48 +0000
From: Stephen Long <steplong@quicinc.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Question about MTE and SyS_brk
Thread-Topic: Question about MTE and SyS_brk
Thread-Index: AdcmqwEGmf7eYAxiT1mQJ6WhZgzTPQ==
Date: Thu, 1 Apr 2021 03:57:48 +0000
Message-ID: <MWHPR0201MB354790AEB8421F7F8EB98EC3C77B9@MWHPR0201MB3547.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.167.219.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 859fc945-38eb-418b-187f-08d8f4c2508a
x-ms-traffictypediagnostic: MWHPR02MB2640:
x-microsoft-antispam-prvs: <MWHPR02MB26404B2BCC68BB18128557E7C77B9@MWHPR02MB2640.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HakybHB2+n7V2Wg8s6r6fGChlDaCaC4mMIwAassCjnWMoqeUrcL/LN94/7YJ+mqHl4QLErvEDlnZuO+yIn/Gvl4Nx3tepaRBMODKGYC8Pnb17ykQEAfSY8qf8Zo22wiDkNsAHlhoHjQFFm+q5osWJJfsdFtpIIvbO87XCJLXdH/HoQlgxhacQIFOz45UAFEotGYPsWEtKwbG9jWF6xLPVIYLHdRXioy664dhTZn/YOSSdY0ecONMEn1CdbHC/C3gsElGvPveWKuEm6kJMM3gwsMcjtarHfkFgLAi+LQsFym4qoZj2w1PuIRVp5GrGL42bD3yux/BqarEEtEiwPPcxszDeBZ0YHfJwl+My34mj8nTio6wrQFZXwaDvx+BnKFRspCktnhQos07iuyKKq7DxeEosmlIz6aYPunq5ShCcueuossM+i5Wkxfp8VtTeysTSnNZ4IvJomj496QD2P5ItvYcyPZTyVzAAwtumBx5ZnFJk9leCBEr1BRiGZFDqgWBzcLV/dROWWA4tQaX/PPtTSUqXrA/rnR6TkKvl6jDmacoeRt1ssH29y6kLElPW7fPSO2DeNhV3MoomDkfVpbXAnxEEAXjh1nli3TsRpB96Nf8hpXo/5H3ck/bmbbEIBWEGiiSi/qXO7WQ3uUsz8rG6I4OHVQz6NRHFjdSLdzVL0Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(52536014)(4744005)(6916009)(8936002)(478600001)(26005)(5660300002)(4326008)(71200400001)(2906002)(38100700001)(316002)(64756008)(186003)(55016002)(66556008)(66476007)(6506007)(33656002)(76116006)(66446008)(66946007)(86362001)(8676002)(7696005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dj2yTPNRCO0Fj5I+EKJ8gTEdexiOWNMJkDiFNOKn6QQ90ku7NlJxxRQY9RMT?=
 =?us-ascii?Q?etY03h4aouzbRDSh0LZ1pcwD2oKKIHRJVSE5iyBYSBLjOli+GGdBMfjcHNAV?=
 =?us-ascii?Q?uxfiyXyyjZtygROoSpVAXKuflpykx7D4IERh2u+b36exkqQW2uwZgCyVEowg?=
 =?us-ascii?Q?vL3+reXAyCtdiEvRhP4il01TTUQ2irWRTyJ2S03H0QWVFVBQrBjXBbvJ6qXP?=
 =?us-ascii?Q?cqj7swj7hYTJyUqyAN9t9zhZ81T8QSiOilUmTAeElPFvaHNtWrqFZEXB+IAw?=
 =?us-ascii?Q?lCv7Hk2MqiSl+a3Ohq81KalZCN3tBlijhq8uvhdG6Bgm5fGng41N9L72gI0Z?=
 =?us-ascii?Q?uDqnNTeKVFWbFddnFb2zf0idBStAY0qz+iDkkPlw3q5n4IvuZl823jC+d9ou?=
 =?us-ascii?Q?7jQPItK0Iqk7JMabO1V1EWr70jWxg/WqGPb3t/1QgRjAyBX8vInsjt71zSv9?=
 =?us-ascii?Q?YC65/GvtApjE3KFSEcSHIOj2ueJzE+uV16Elnc8adptvDwGDOz2/ieq9CAmm?=
 =?us-ascii?Q?LIjfzipqKmxuPle/V92Pqv9yqHnAqjhTo9Xsd/365gIW6NRD5ENwraQ2HuQ7?=
 =?us-ascii?Q?AIMaaGjev5j93GNWrjrDM6rEpig9FDzcP0+BSuBNJtmp/543SSRKB6JJOuHZ?=
 =?us-ascii?Q?xullLBz2uLPRRYZQgrmMzSqbC1CWDxE3rQ2oi1bz6J4JDgRtK5UYcE0OP4Hr?=
 =?us-ascii?Q?bxHVG8sExS600eNNultlWAjXgsVW9aRXeKYt9YCbaigv4m5Fb8Sxa1Ie4CfJ?=
 =?us-ascii?Q?WQSeHHjPO9JEkToXRj/HgLXgLa64O0jZev9Ik7NzEt6u5PcJclCddRO0JAdm?=
 =?us-ascii?Q?wiEyrPme90xWgrSyRcqHjRD/ka5+eYuRDtZO/MGe5WBfUlxKGu3nXnlU99/2?=
 =?us-ascii?Q?ZQdl392qNUY7hJy43RXyYpbaQYzzkh/3Zdk9V39VJ8zjc+VjkqiAMOEJgfQs?=
 =?us-ascii?Q?fcrRk5H8PteAnwwpfoSw+mVEj8MUFxNUNf4ckfIcLjl/UE8BXrW4g0JLeKH0?=
 =?us-ascii?Q?tkyyt3vHj6XYsoEHcW2U3/kmpSDwr1Z2TfqIi2QrMvFcWM7zDq42xTbTOwMV?=
 =?us-ascii?Q?Mz4RxD3fyEmFvYDN/RrEyIEhamtnQ9ccc92URo9h4Eun5VVBAwstV/TkpZzB?=
 =?us-ascii?Q?e4pJtA7PzHNiguYehW9Ucg9e0ScX2LXt0avBcORVUWQnjs0WAypT613m4/eN?=
 =?us-ascii?Q?cK56GmwHHXWvZLM80zsnLID7yAOvoOSRKslIZ1zHMwadqhN2ZQveIV4/jJ6U?=
 =?us-ascii?Q?f7Orr4HsnaLrcP2b5LCpqULAuVIQN82ehqlI6naew4871hlhgjsKObONSgC/?=
 =?us-ascii?Q?Vvo=3D?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETRfABtrwpz/rY7eb7WsZUJoigRxNMJsY/0+e9W0UrFdIIjZjwPA8oCskVIjwOmi9/30rsGa0A72GlN7ZaJEOZYQHUn/f6AZavg1z8HXCmTOndjoxdnkosC2MKBS6Hx2DobhK3jM0sOXZLPZ1tl+/p86Qxs+FDtXkM44SK2+U8WOtrPNO5Io+cOXsLMOl9Gi6q7OsdRjx7UAfVNjBJkWk7clAhSxNOHpqM5yxUzdbwH9Gd2AxnrGGO7qeAO7fPccthv/z+kp5Drammw67ee4v9XTEUMJHNxthL6vbzaIgDtj79Wuzl+qNogKpmWGGlQr6azu9AHPyw9G+SI+US/1UA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEQfddXiz34z1a8pbAlbRzFaDzWwMJXxUFScmKg0cYc=;
 b=chdBW/9WFw+debiCYY/KhruaHC7wt8Vn7GkN+iKq95tRxZMJu5/aCM+MXF5zzGdXhJSZN1tyDJ2mfzXHiHvYR4jbVcg1Ouc5AOWj72OmPlnPxO1P8I2hW5kHhsQ+KERYusABxrC7xDU76u0SouyoPV6DTeHvdEkMwdosHpYCBABLmdM5N+jyrbecqioB+tXznDUMR8kuwzpSEZVWfDI+jRT94UQmZL4TuxuJekn5z3s1NUusYbGk2TYJcKDAtI6N83Dz7m3sVy9CN9J/Mc51+QOuST/mBaFLYT2/traf0YeLxrK6TfY6/TMo26wqXMyZifdyNiCRxeAIn19rky4l2Q==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: MWHPR0201MB3547.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 859fc945-38eb-418b-187f-08d8f4c2508a
x-ms-exchange-crosstenant-originalarrivaltime: 01 Apr 2021 03:57:48.3816 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: xkJwIxoyTcLz7YpfGyljOP6Ot+vaLZpOj8810HWamav1h12TrAY2mJOq0TuX5BGHi4i0nyX1IeXVAWEqzpYvnQ==
x-ms-exchange-transport-crosstenantheadersstamped: MWHPR02MB2640
x-originatororg: quicinc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eAZqQTjoOug7

Hi Richard, do you know if the following is supposed to work? I think it's =
aborting
with qemu because qemu is considering the page not anonymous

#include <sys/syscall.h>
#include <err.h>
#include "mte.h"

void pass(int sig, siginfo_t *info, void *uc)
{
    assert(info->si_code =3D=3D SEGV_MTESERR);
    exit(0);
}

int main(void) {
    enable_mte(PR_MTE_TCF_SYNC);

    void *brk =3D (void *)syscall(SYS_brk, 0);
    void *new_brk =3D (void *)syscall(SYS_brk, brk+16);

    if (mprotect((void *)brk, 16, PROT_READ | PROT_WRITE | PROT_MTE)) {
        err(-1, "mprotect");
    }

    int *p0, *p1, *p2;
    p0 =3D brk;
    long excl =3D 1;

    asm("irg %0,%1,%2" : "=3Dr"(p1) : "r"(p0), "r"(excl));
    asm("gmi %0,%1,%0" : "+r"(excl) : "r"(p1));
    asm("irg %0,%1,%2" : "=3Dr"(p2) : "r"(p0), "r"(excl));
    asm("stg %0,[%0]" : : "r"(p1));

    *p1 =3D 0;

    struct sigaction sa;
    memset(&sa, 0, sizeof(sa));
    sa.sa_sigaction =3D pass;
    sa.sa_flags =3D SA_SIGINFO;
    sigaction(SIGSEGV, &sa, NULL);

    *p2 =3D 0;

    abort();
}
