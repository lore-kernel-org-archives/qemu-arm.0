Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp427799njc;
        Thu, 8 Aug 2024 02:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmB2TYW73D9b6i9vDqN3vBJImdhEE71xMh/Ce5Ofamkqy6YwlQAnmgcd44BBN/b9KLanDmDVM6iQ48o9G9of0PqB8zm2xv
X-Google-Smtp-Source: AGHT+IEtOIJbAAuV9RUlPbq8s+8wdgvcIrZHsLm40LLzAGeVyqhv6MFrmmlGE7lLLsdf4By+vN2s
X-Received: by 2002:a05:6808:2119:b0:3d9:b33e:d3e2 with SMTP id 5614622812f47-3dc3b41b007mr1547881b6e.19.1723107750061;
        Thu, 08 Aug 2024 02:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723107750; cv=none;
        d=google.com; s=arc-20160816;
        b=YLP+jCjGGG+duS6/JGgpotOyhbZXqIR8YnU6BeYPX3gVnfAFhxH41nRxVjPvCLRnJY
         tMIgAkqCdwHxHLBOP3wYDM/zE5t8ZFtn75oBsGH/ITgwHf8Y3qFnSGOYwoHFDCwaYi4s
         rXUp9+PEknkjz4vQyGJS5JJzWTJnsnleiKmbYgEJOHc9JXGWK9ho46y3QiQdk/zBd39Z
         u+EOZUlJve6yte0KVRNVBlrPlY2rhHb/fb10sGz5TWWez1mzXwbUFiL9YmxCIh3CM0Eg
         tUdmm9kuyWPI2VLXCwfM0AHRNV/DI403XyMR1K40bz6SaDAux0eGgHgAXqq1oe75wuNw
         9PUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=HiyGi7Q1zlSqPeEiA5xu3E56J3mw7niOeosteLq135o=;
        fh=t4Y28DVIqtV+MSBQpAeeUpuJxxHHgJPFCb51U2BCN/U=;
        b=Dsm4/TIejjYypjzX9FZ1+47mZ1jm8Oug/DIMeYMcaclBZ11yKNbiEdl1Rt5R9BSDuI
         v1fDimcz0+DsRlb4FToaDVZomhes/8Qb9ZIeRYb8ak/kfIS1/QjvTDKlZoKL1hPNzJBS
         eEM+ZDQub4/kw5EpFE4cNxrenKOaqofh3sSlF/MjCT2sFVVESgU8XU6p8jebgMAn83Je
         6BzZ5Kc4LRp/crYcqzdB33UrPIxlix0NKWMDuGrh9sV69eiDPQ84PLTYUp74uHPNVXnt
         gNV3ztcoBw7ybO2FBxw62O6d1YE03n1wJ9VnjR/P4VA6/xSk/U7GHlOjXnkDpRyl3mAm
         cfKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YNfAh8X0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-451c884c679si35381211cf.708.2024.08.08.02.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 02:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YNfAh8X0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbz2L-0001ZL-MO; Thu, 08 Aug 2024 05:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sbz2H-0001YK-2N
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 05:02:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sbz2E-0000g7-Br
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 05:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723107732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HiyGi7Q1zlSqPeEiA5xu3E56J3mw7niOeosteLq135o=;
 b=YNfAh8X0eml4TLtB7tYaYooV8iDze47p7PKbl/mizQ/VoH+P1DN8wAWdg2DvJhjPjs0c6U
 EHwyUTiNHyAW1ukO4AUAg8sNXKr0mfdq4AfhS8Wnbj8+oXbZALYAc6zWSNpLvfoB2bpnRB
 uBcF4rP3AIPufHQMBUi/EMeIXiQb4nU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-njc4O-I7OWO53MLJTwwlsw-1; Thu,
 08 Aug 2024 05:02:09 -0400
X-MC-Unique: njc4O-I7OWO53MLJTwwlsw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B6B361955F43; Thu,  8 Aug 2024 09:02:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.245])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 41C6C1955F2E; Thu,  8 Aug 2024 09:02:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E1BAE21E66E5; Thu,  8 Aug 2024 11:02:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  qemu-devel@nongnu.org,
 Eric Blake
 <eblake@redhat.com>,  qemu-arm@nongnu.org,  Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH-for-9.1? 1/2] target/arm: Move
 qmp_query_gic_capabilities() to hw/intc/
In-Reply-To: <CAFEAcA8J4i-81rOEHBpqbV=c4F26o6qd3Lg9dZV+BuNyZPGg7Q@mail.gmail.com>
 (Peter Maydell's message of "Thu, 8 Aug 2024 09:44:59 +0100")
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-2-philmd@linaro.org>
 <f82397e9-3be4-49be-b291-5598acdaf39b@linaro.org>
 <CAFEAcA9emwsK07+itUzMxReOLG8gHaxNdDE8ymuwyuBfsoY2Pg@mail.gmail.com>
 <87bk23skhq.fsf@pond.sub.org>
 <CAFEAcA8J4i-81rOEHBpqbV=c4F26o6qd3Lg9dZV+BuNyZPGg7Q@mail.gmail.com>
Date: Thu, 08 Aug 2024 11:02:04 +0200
Message-ID: <87ed6z1j77.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: myBQhLJcoiyo

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 8 Aug 2024 at 05:32, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> [...]
>>
>> > The QAPI command which this code is implementing is
>> > also (a) target-specific and (b) unfortunately
>> > designed so that it doesn't get passed a particular
>> > CPU or particular device to query, it's just assumed
>> > to be a part of the whole simulation.
>>
>> We can fix (b) if we care: add a suitable optional argument, default to
>> the sole GIC in the system, fail if there's more than one.  I assume we
>> have no machines with more than one now.
>
> The exynos4210 SoC (board types 'nuri', 'smdkc210') has
> two GICs. (It's a rather odd design -- there's the
> interrupt controller that's part of the main CPU
> cluster, and then they used a second "external" GIC
> that feeds into that one.)

Then "fail if there's more than one" would be an incompatible change for
this machine.

If the two GICs have identical capabilities, it doesn't matter to which
of the two query-gic-capabilities technically applies.

Else, it matters, and we have an interface issue.  Do we?

