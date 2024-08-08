Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp385777njc;
        Wed, 7 Aug 2024 22:35:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUl9KDiybA5cJhFtsv4hpBA+S26ZvP/yyNdILt74AKmuegvZJMYAqqMNw4MiVzB2jMaaTjB78G2Bq8y7vLIvXuJGY1KskAy
X-Google-Smtp-Source: AGHT+IGbkXgfNf+UeEbgN3TsNm3nju7Q/pYz650XM1Bp9LnhWRyFYb/sY3dx8sqsLXCih+xK2NSQ
X-Received: by 2002:a05:620a:28d6:b0:79f:1105:be3 with SMTP id af79cd13be357-7a38181f042mr89837385a.40.1723095352868;
        Wed, 07 Aug 2024 22:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723095352; cv=none;
        d=google.com; s=arc-20160816;
        b=BPXsrCxsP6w40kqnv6g97FModVzI5e5EtQ140wtVOaQIjsfGsF7TJ3homEtrjczMiZ
         IsTcj+fG+ZKpsgNNsVSpDdqEiU/CCUx0ehecrupBTc7aYs7RDCkmEsDN41DGf4MCralY
         Zd/Z/a2LufxzR4PSjW6GyJP1fPBIchZYoAXHCyYG4oo0OWacQbdd5yp7FkFuGlylCQBU
         IfEcsOQ1GIXBPplk4J28XZG252ukTgZV8pzs9JTdgct06rQ1tOBm3baKh3asR26Hv9rM
         fJ/PmjFfN3aHCl43xXil9brm0a7wo6lRpcMif7nI55JB2BlkvR4+iSROLT8A54MiNyU2
         7GHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=MY2pU3AGTr/0JOkEMSITZyyh8YPC7QV3jBbsYOFDizY=;
        fh=p4g19jZeELzlV+xydDLGnCMB8iNCmgBFEz5Ng2/z/c0=;
        b=z9eoxSLTfObZSLRuEiP2VK4ApFsHlN2o2TYDhlDetXrx4xDz9ssonywNezd85eeJ9+
         sW1QWmOuwuAwDf6Hxu22N6EpY9rwBnuS8YDT0+smGr8NS5DH4fIXd6Bzsvbi5H3aQFF4
         E8tmRw17f02Y1+uf3fJRLDuqXJXtMKjgO3KCUPKBgGG8two+wyHTvAVK66T2Tr1S/Wq3
         cE7sAcHszzu9Xl00rJpctmsQVvVDVstYPHL8iJiXxKSchdnr+OMmAQt8hRN0O9Yn16D8
         Qn+G0u2AtrZ3nQlAhPuCT0o4kvx5hExiyCehHqmRssZ886KRQ+LqPdVqe7saHZaX/d+e
         mwgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RgEdn+BA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a378874815si341887085a.745.2024.08.07.22.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 22:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RgEdn+BA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbvoM-0006a8-Fl; Thu, 08 Aug 2024 01:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sbvoG-0006WX-Vi
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 01:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sbvoC-0004v7-6S
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 01:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723095330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MY2pU3AGTr/0JOkEMSITZyyh8YPC7QV3jBbsYOFDizY=;
 b=RgEdn+BAs/TFVjpwxfCCPIR5Tbe/tZ6KvizmYb+o0L6SD8JfH8YjAaFhTBM27Hm41iCRKT
 G0dBnJ4EddkEvHEvxIYWBldWtqIi+QoPFZiGZzJ/owrJQexhunuJkHmT2f+zxY6ovn0HUK
 XPAM+IFQn6eFHqbpa9Z2XPhTZvVuMx0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-VXTVfnJvP4uQOqmpWl-XYA-1; Thu,
 08 Aug 2024 01:35:27 -0400
X-MC-Unique: VXTVfnJvP4uQOqmpWl-XYA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D577419560A6; Thu,  8 Aug 2024 05:35:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.245])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 59FA219560A3; Thu,  8 Aug 2024 05:35:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 191AA21E66E5; Thu,  8 Aug 2024 07:35:21 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,  qemu-arm@nongnu.org,  Thomas Huth
 <thuth@redhat.com>
Subject: Re: [RFC PATCH-for-9.1? 2/2] hw/intc/arm_gic: Only provide
 query-gic-capabilities when GIC built-in
In-Reply-To: <CAFEAcA_2pJA47K72qJQX9bc8sBcA+0wJGaf3KAaYJaRurjQD7w@mail.gmail.com>
 (Peter Maydell's message of "Wed, 7 Aug 2024 17:30:50 +0100")
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-3-philmd@linaro.org>
 <87o764yce3.fsf@pond.sub.org>
 <a8eb43d8-3714-447b-ab1b-c96ff05cf14a@linaro.org>
 <87h6bwwpu4.fsf@pond.sub.org>
 <CAFEAcA_2pJA47K72qJQX9bc8sBcA+0wJGaf3KAaYJaRurjQD7w@mail.gmail.com>
Date: Thu, 08 Aug 2024 07:35:21 +0200
Message-ID: <871q2zshk6.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
X-TUID: RFOAlyDf2x46

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 7 Aug 2024 at 12:10, Markus Armbruster <armbru@redhat.com> wrote:
>> Having to manually include a configuration header like CONFIG_DEVICES
>> wherever you use configuration symbols strikes me as unadvisable when
>> uses include checking for definedness, such as #ifdef: silent miscompile
>> when you forget to include.
>>
>> This is why Autoconf wants you to include config.h first in any .c: it
>> makes #ifdef & friends safe.
>>
>> qemu/osdep.h does include some configuration headers:
>>
>>     #include "config-host.h"
>>     #ifdef COMPILING_PER_TARGET
>>     #include CONFIG_TARGET
>>     #else
>>     #include "exec/poison.h"
>>     #endif
>>
>> Why not CONFIG_DEVICES?
>
> The stuff in CONFIG_DEVICES is target-specific, so wanting
> to include it should be rare (currently we include it in
> only about 25 files). Any file that includes it has to be
> a compile-per-target file, and generally we'd rather avoid that.

Since all the macros defined in CONFIG_DEVICES are poisoned by
exec/poison.h, which *is* included by qemu/osdep.h, target-independent
files never need to include CONFIG_DEVICES.  My question was strictly
about target-dependent files, i.e. exactly the ones that include
CONFIG_TARGET.

> Plus it's a bit odd to need to change code based on whether
> some other device was configured into the system,

I agree it's a bit odd for device code to check whether some other
device is also selected for the current target.

But is it odd for the QAPI schema to define a device-specific command
only when the device is selected?

>                                                   so I think
> that's something worth restricting to only files that effectively
> opt in to it.

Is accidental use of a macro from CONFIG_DEVICES a risk?  Is the risk
mitigated to some useful degree by having to include CONFIG_DEVICES?

I consider the combination of testing configuration symbols with #ifdef
and requiring a manual #include to actually get the symbols (and make
the #ifdef work) bad practice.

Options:

1. Approximate symbols from CONFIG_DEVICES with symbols from
   CONFIG_TARGET.  This is what we do now.

2. Use symbols from CONFIG_DEVICES.  Generated headers are no longer
   self-contained.  Strong dislike.

3. Define device-specific stuff unconditionally.  We get to fool around
   with stubs, binaries carry more useless code, and introspection
   becomes less useful.  Meh.

Thoughts?

