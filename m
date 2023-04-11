Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp683336ejc;
        Tue, 11 Apr 2023 11:12:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z352Jmu033M56lU24x5eCT3gOMs5Tc0zhZJZuhSs9qUW6yEsVYGHs+1buMrcz4jL+wBGiz
X-Received: by 2002:a05:622a:2d4:b0:3e4:e2af:adcf with SMTP id a20-20020a05622a02d400b003e4e2afadcfmr5297035qtx.57.1681236768245;
        Tue, 11 Apr 2023 11:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681236768; cv=none;
        d=google.com; s=arc-20160816;
        b=j4TnogzU6D8blT916+tcS5zP+h1aUfd9kWCxFo0WMJPaWHqI2++CWQWPG32ogzpXWX
         2rZWM5b/qZb0gbdV36UUF1zJ27z2yQjJmur2WNG7NUdPdWaGzoubszuWmXdDmTOvJ+zF
         3ATcPHsMp62DyqY/unsppAxiMJ//voGAd8H+oxeIlLsSXd4K3uPZdvj8jnEophKgzesy
         9yzw1txp1dxSoNJ4L4yWws+F3ODJH/dJV5NYGDVgstwHv9axbQcDFMrEakXMJlqGebA2
         GyRtOk9VoN45/klTZUdKj22O/3gQYg17ENDo9Tpz+UO8r/Az2wYKhuGiMJUs7FuQQ7R8
         zqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :cc:to:from:thread-topic:subject:dkim-signature;
        bh=hhAtX+MbjVh4BH8ecIcg6aCl9ijHfUxFs7dKj6cy084=;
        b=Ck7CVPilWmskjGdd/a0l3tkBrE7cC26r1Psd1Mxniqwi4jMngN6H7djSDmU6aAAvfu
         VXmVmZEdNuku+s9idCbKg0xGJAqcCVDMlq4R107qPVCx4gkf+m/mwGEK10VUQSPw1nJt
         NRE4+2TOGNXMhsxr1D7WzmzSTtsixBQdouyevrIgxPmdh3qNHu5SOtzKPS681bGXjmKt
         AGWXbNxWxeISwaNccVYHiOgeSaL0u65K28g0m+EW6ik5XUoXbdConbFdUCtivCfcFw8a
         0DZ6goixxt6Z8I+Z4FdgbWrXl5plNWMmdfxAuDZgVp+j3KD30Rv2Dxj3o+ZKwJUJgefu
         SuCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=UppEGxAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7-20020ac85787000000b003d1f54912bdsi9813724qta.405.2023.04.11.11.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 11:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=UppEGxAj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmIU0-0001ti-4O; Tue, 11 Apr 2023 14:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=45877f2e6=pbartell@amazon.com>)
 id 1pmITy-0001tS-QK; Tue, 11 Apr 2023 14:12:43 -0400
Received: from smtp-fw-6001.amazon.com ([52.95.48.154])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=45877f2e6=pbartell@amazon.com>)
 id 1pmITw-0003Rx-EP; Tue, 11 Apr 2023 14:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1681236761; x=1712772761;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version:subject;
 bh=hhAtX+MbjVh4BH8ecIcg6aCl9ijHfUxFs7dKj6cy084=;
 b=UppEGxAj08Yl0ykOyMYjtrEqVoHzTA9/QsJPn584kFleK8WU7D1es0ra
 bCcbhld6LDM5c1ytXuoeQEOSr/Usk+KYi4wwW/tXeY1J2JpriqI+hceR2
 l6I+OVwpCcxA2+l5IGoLsdDq+FWnHuW3nJUMJ80JQM/yry9bMGYcUzjTj Q=;
X-IronPort-AV: E=Sophos;i="5.98,336,1673913600"; d="scan'208";a="319219216"
Subject: Re: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
Thread-Topic: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-d40ec5a9.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6001.iad6.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 18:12:35 +0000
Received: from EX19D012EUA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2a-m6i4x-d40ec5a9.us-west-2.amazon.com (Postfix)
 with ESMTPS id 6411640E3B; Tue, 11 Apr 2023 18:12:33 +0000 (UTC)
Received: from EX19D031EUC002.ant.amazon.com (10.252.61.193) by
 EX19D012EUA001.ant.amazon.com (10.252.50.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Apr 2023 18:12:32 +0000
Received: from EX19D031EUC003.ant.amazon.com (10.252.61.172) by
 EX19D031EUC002.ant.amazon.com (10.252.61.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 11 Apr 2023 18:12:31 +0000
Received: from EX19D031EUC003.ant.amazon.com ([fe80::dad0:4f18:bddd:d966]) by
 EX19D031EUC003.ant.amazon.com ([fe80::dad0:4f18:bddd:d966%3]) with
 mapi id 15.02.1118.026; Tue, 11 Apr 2023 18:12:31 +0000
From: "Bartell, Paul" <pbartell@amazon.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Thread-Index: AQHZaa1L7iNpTV5R00K3KIarsp7cMK8gzriAgANcvgCAAhSNgIAALv+A
Date: Tue, 11 Apr 2023 18:12:31 +0000
Message-ID: <F1E57852-8712-4BB0-95B2-E3853B59F0D2@amazon.com>
References: <20230408000118.50854-1-pbartell@amazon.com>
 <c56f4f56-6cba-ceaa-9f89-228fafcbc2ac@linaro.org>
 <E3A05628-86C2-42B7-B17B-64972FE60834@amazon.com>
 <CAFEAcA8pSvbFwcbstF1q5y3yE8S3R-X4LKgihq-PFY0F02fw7Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8pSvbFwcbstF1q5y3yE8S3R-X4LKgihq-PFY0F02fw7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.63.8.42]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2F432843EBA24347A50742341EC7F7D1@amazon.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: Bulk
Received-SPF: pass client-ip=52.95.48.154;
 envelope-from=prvs=45877f2e6=pbartell@amazon.com; helo=smtp-fw-6001.amazon.com
X-Spam_score_int: -118
X-Spam_score: -11.9
X-Spam_bar: -----------
X-Spam_report: (-11.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: RZB3hD/oYDNW



> On Apr 11, 2023, at 8:24 AM, Peter Maydell <peter.maydell@linaro.org> wro=
te:
>=20
> On Mon, 10 Apr 2023 at 15:38, Bartell, Paul <pbartell@amazon.com> wrote:
>>=20
>> You can reproduce the problem by running gdb against an ARMv8M target ru=
nning secure mode code (the default).
>>=20
>> Running qemu with the following arguments : qemu-system-arm -machine mps=
2-an505 -m 16M -cpu cortex-m33 -nographic -semihosting -monitor null --semi=
hosting-config enable=3Don,target=3Dnative -d guest_errors -kernel /path/to=
/binary.elf
>>=20
>> With the following .gdbinit file:
>> target extended-remote :1234
>> compare-sections
>>=20
>> Upon startup, every symbol in the elf file reports the following error:
>>=20
>> Section .text, range 0x10000000 -- 0x10009298: MIS-MATCHED!
>> Section .text.main, range 0x10009298 -- 0x10009300: MIS-MATCHED!
>> Section .text.prvQueueSendTask, range 0x10009300 -- 0x10009338: MIS-MATC=
HED!
>>=20
>> Attempting to debug results in errors constantly (unable to read or writ=
e memory at all).
>>=20
>> init_data_sections () at /project/Demo/ARM_MPS/startup.c:95
>> 95      {
>> (gdb) info locals
>> pCopyTable =3D <error reading variable pCopyTable (Cannot access memory =
at address 0x381fffec)>
>> dataIndex =3D <error reading variable dataIndex (Cannot access memory at=
 address 0x381fffe8)>
>>=20
>> Does that clarify my report sufficiently?
>=20
> Could you (a) file a bug and (b) attach a sample test executable
> that demonstrates the problem, please?
>=20
> thanks
> -- PMM

Bug filed at https://gitlab.com/qemu-project/qemu/-/issues/1590 with binary=
 attached and some additional logs.

Adding the qemu-stable list since semihosting and gdb debugging for all ARM=
v8M targets is broken in the current stable release (v7.2.1) and previous s=
table (v7.2.0). v7.1.0 is not affected.

