Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2506041wrs;
        Thu, 29 Aug 2019 11:05:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykD5eG/xiSbQdSpZdCp950ZHJiH3NLifH41R2z/iP9BvH7c08+JmE58SWkLFdtPpvQILwV
X-Received: by 2002:a50:9f81:: with SMTP id c1mr11553282edf.100.1567101907023;
        Thu, 29 Aug 2019 11:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567101907; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5aBFVM8qP6hlD5f1+T3RJYqNHt8heudi4yLP4EjlLX1RpITOgsiUy6BT7ygWZ9PRu
         cdWbkDqJBmjeu/wShReBysfBRtLUAhLm56cKZiDH93GB3lf84943CBXBO1D1BwtgorCm
         aqOHGiwqLZhJyjwtXtiJVF30DBd7BlpyIF4WMAH5YjIsa2Q//kL5Efdx+e8Sn0VBenQY
         tcmMGziZClGGdfl3oxrH0fx0H3OQ0y2GNiijqsGNkE80pDjU1tJD+E/cE7prn7qNto0a
         zMp/Q2IkFLRnHLam6WpseBb1d+4AI/mIX2ofGTsX454UFDWkd64pnNgh4HQQEN2CaA5t
         PoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=wAsB0UC2GerfIEqU5J+ldaLz99qJPEveaFscq6OPcpo=;
        b=uW8mYVsOiNZ/iL12f7g3tN19YLVRI0NxmBlaBthPQo5kAQV8MG4V7kX8QWtR/kWGpc
         77u0jDwlrztfpfpiKnQmb24hORFsmaFGE6bsB1TLtQVMCC5wrPqR0IoEEYc/1lvVV7OU
         g5TwPaz/3XMsS1VsITxhPARosPxmAiZj/fnfhqbfo5fA+1mB9YfrF2Z1itaUH1tOuvGz
         mxuqFSMpM4zjnFql2lB4oViZQ7d7HMUJhJVqRzRdPilBY5kvBlbwqceYILNpdzqnRy0D
         wuLya5WS4RLUMalDPwv2fGy1qTUqC6pS/liebrX/Yn1akpyNb63m/ijj/FkkvRIF1Kb3
         5J0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si1584411edv.296.2019.08.29.11.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 11:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3OnC-0007vk-3m
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 14:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i3Omz-0007vS-A2
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:04:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i3Omy-0006VU-1d
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:04:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46516)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i3Omx-0006UX-Qq
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:04:51 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A00F7C08C325
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 18:04:50 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id w11so2488833wru.17
 for <qemu-arm@nongnu.org>; Thu, 29 Aug 2019 11:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bP7ESnZ1RAt0LXK6eH9zKAf51XwW+XJZ3/F1B9BOJw0=;
 b=fp/y2J2WZGSYl4lVrD1dlrW42jwuhoq6xwv/OXacHrI21dPRX4YlqSGpXP2Xudcg3W
 PQ3vHb3oIFvgRPOHqrOSXYsUfgBIwHBQ5B5K2wPAWO4KljbtrVIJcemXE0ARh5U0nbjK
 8HEI54dmZRYWuEiw0RvfGaPme9kyQ+Ga/QcaEDz5Kw97HMqz830H596i+2bo4J9UMTYC
 3c93UIAwPxNKBJ+Y2jGqCD5Ac6SKlAdsJs67fES553V2rYp+gikrkBs6xU2txS/IWviA
 w/IBMrXGXWhWLfQ77viC/MA9o6SLRux9fPC2bnxv4zEZZsB+cS3gYGRV2NH55XZMPqTG
 gKEA==
X-Gm-Message-State: APjAAAVNhnDWzTfkj6ka8hLeVLYSzaJrIVRNLvCeBjyyCqnVVIJRAhpe
 uJ7YgEY3eSGN2RT3NxjVb3hLOuxsFT1OroXd1w28mF4F60suVaB0OH/3MnF/SelwqrbGVICAjYp
 4kvN2H1n/akd9
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr13880789wrx.17.1567101889464; 
 Thu, 29 Aug 2019 11:04:49 -0700 (PDT)
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr13880761wrx.17.1567101889192; 
 Thu, 29 Aug 2019 11:04:49 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id s1sm7208059wrg.80.2019.08.29.11.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2019 11:04:48 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190823135811.13883-1-philmd@redhat.com>
 <20190823135811.13883-2-philmd@redhat.com>
 <64061664-f79f-b074-8fec-fea24594d5df@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <427b3a07-b428-fca4-a6ed-ba0d663d6a83@redhat.com>
Date: Thu, 29 Aug 2019 20:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <64061664-f79f-b074-8fec-fea24594d5df@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] target/arm: Restrict
 pre-ARMv7 cpus to TCG
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 82ng4Fe+AnUk

On 8/23/19 7:04 PM, Richard Henderson wrote:
> On 8/23/19 6:58 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> @@ -2535,6 +2544,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
>>      { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
>>      { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
>>      { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
>> +#endif
>>                               .class_init =3D arm_v7m_class_init },
>>      { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
>>                               .class_init =3D arm_v7m_class_init },
>=20
> Ifdef is misplaced.  This shouldn't even compile without CONFIG_TCG.

What a shame... I hope I messed this due to a failed rebase...

> Also, m-profile shouldn't work with kvm either, so I think the endif sh=
ould go
> below cortex-m33.

Obviously.
