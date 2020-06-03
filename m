Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp1670341qvs;
        Wed, 3 Jun 2020 08:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/u7GC53DjZsXubqS/d9XZC7Qom7M9ywyUkqXLSgrRemeq5zASArkCfhCnK/82r/66XbuS
X-Received: by 2002:a25:44c:: with SMTP id 73mr570797ybe.52.1591196436005;
        Wed, 03 Jun 2020 08:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591196436; cv=none;
        d=google.com; s=arc-20160816;
        b=ClHiY/Inrlkfp5Mb1zEClF6RTdSzd5G1A31gvvlZdM16FUA0k2i02kRbo5M0yLAngw
         997OruzRHi33XIhywHZUl+tTJRLPizoHct2aAU01F6xH/2NxJo3LBzJFxAhGud256ZSD
         GkFMpWbf3uZFjzov4+wQ++sIpL0wJWTgjLOAlLMGiodbvocJiCPTvAW8YzcdtmJ4OaZy
         xIoWPGIsrfslNky1Rur6U8IHbqidxM4/JtYbGjtJC4ek3+muN5eOQWu9e9VpDHjHa7+I
         uv1Si39kYEftoJQN8On0JLtdedyCdSkY+iAn2YM+/ab1iFaHC49ixB8RVgp2ZhSGq8f0
         M4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=+rmHqcvJ7J0pW7BbH0a8aC3V9MlkJ5Ae3YLKJD+8L80=;
        b=Qq0z2g28wAqrzYZBcmcqsPDGryPBSXgK7crYXUtjVdvTAVMhzps5Si4aU5fXxOj5qz
         fqLsVRwvdZy6jZkpxOlwv5+67+hJiBRcHV7FXu/mTCW+rKUgnZfWibF6GuOxgrR2zbpq
         hdbRRsYPh58MZJVrIjV1Adl4Q0lyNmk2PPIGT1FFjtmzQ1TYRMHHg2bk8vGzYB8K1Os+
         34k1IUL/nUMoHiRWJZDJfo0jW0F+DFdaL51TIKcfNZ0RLi+vBN6CSaBIAqOhJh65H92S
         6jPS39ALkRU2qYCN5PVobFZ8P2ehcGQqFfF/jccZ3n/QNkEPUtm45/aI8CBsg/NR/Nwc
         LGug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i131si1936903ybg.369.2020.06.03.08.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 08:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgUsd-0006Nf-5C
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 11:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jgUlk-0008PH-OT; Wed, 03 Jun 2020 10:53:28 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2106 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1jgUlj-0000Z9-1B; Wed, 03 Jun 2020 10:53:28 -0400
Received: from lhreml701-chm.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 123029BDA1E0E550BEA2;
 Wed,  3 Jun 2020 15:53:22 +0100 (IST)
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 lhreml701-chm.china.huawei.com (10.201.108.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 3 Jun 2020 15:53:21 +0100
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1913.007; 
 Wed, 3 Jun 2020 15:53:21 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Subject: RE: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Thread-Topic: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Thread-Index: AdY3+/mIYt1+TQdDQmymnxAa7PkUWwBhkdKAAAS79tAAAMvMAAAC6ahgAAIBWIAAAj9tUA==
Date: Wed, 3 Jun 2020 14:53:21 +0000
Message-ID: <70ab2e21085844999f5f8615b32dde1d@huawei.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
 <6bacdd359e504ed8924e67ed125bf15d@huawei.com>
 <20200603121606.bj3mjlqsstzbu7py@kamzik.brq.redhat.com>
 <5cb329f13566411eadfeca7c9a1b4bf5@huawei.com>
 <20200603143655.vk3uqw5lvgv6sm5p@kamzik.brq.redhat.com>
In-Reply-To: <20200603143655.vk3uqw5lvgv6sm5p@kamzik.brq.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.30.55]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.76.210;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 07:45:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "gshan@redhat.com" <gshan@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dOfoaUQ9F1R4


> From: Qemu-arm [mailto:qemu-arm-bounces+salil.mehta=3Dhuawei.com@nongnu.o=
rg]
> On Behalf Of Andrew Jones
> Sent: Wednesday, June 3, 2020 3:37 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>; mst@redhat.com;
> qemu-devel@nongnu.org; eric.auger@redhat.com; qemu-arm@nongnu.org; Igor
> Mammedov <imammedo@redhat.com>
> Subject: Re: [Question] Regarding PMU initialization within the QEMU for =
ARM
> VCPUs
>=20
> On Wed, Jun 03, 2020 at 01:48:10PM +0000, Salil Mehta wrote:
> > (Maybe I should float the ARM VCPU Hotplug patches and let this
> >  discussion be held over there?)
> >
>=20
> Yes, I think that would be best. Keep in mind that the 'pmu' CPU property
> is just one CPU property that we require all CPUs to have, if any have it=
.
> 'aarch64' and 'sve' are two other examples. And, likely any CPU feature
> that comes down the line that we want to use with KVM will fit that
> pattern. I think the hotplug patch series will need to handle those
> features in some way other than to push them all into machine properties.

Sure, I do have realization about that. I have for now used a per virt
machine flag for PMU to do a workaround of the problem I discussed.
Maybe once I float the patches further comments on the ways to improve
the design would be very helpful. So for now I will keep the flag and
use this approach and invite everyone for open discussion about this
and we could evolve the design as we discuss there.


Many thanks
Salil.
