Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1074255lfp;
        Wed, 5 Feb 2020 22:49:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyoxaVeLjHZBo0KF5MdY3kB0+8vsqo6TLOFv9ynDTeMBrM4pyphUAnuR33JwMOaunS9+K0J
X-Received: by 2002:a05:620a:1273:: with SMTP id b19mr1238014qkl.482.1580971791745;
        Wed, 05 Feb 2020 22:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580971791; cv=none;
        d=google.com; s=arc-20160816;
        b=FwH2Zo9JnzAXdEykBu2i33xunH61sP/BtO1RFf64UOh0axs3NREOmuhl5dC7Zdvpn7
         xTcD9+EkqiCqXe1pMrgtQd4vV1sI1iuDCl5pErqZsYCcliwFyJ7cuLsKf5oMhb0MboAZ
         aR7w74XSaYau3oSNZEEevwOc2ShWQjDkgcl1uzHurS+V3I0Kx/RjrCDleO69W0bHt7Qg
         MouN6NMs7+OLN7NA/lPa/EPDSOeMU1+xaWfvghAd5NdvD2ZNEHzqW9GC3eng/OlA9qM3
         GzfOWaio3+FbGSNECZg8cWz5BmbIvFgtl745rLXcSFt7gNLAqGAxWTXN/lkR4fhCPY2G
         ZdZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=VDcoZY1ZFRsky3PU15o8qkwztr/6tyc0v29JuLE4MIk=;
        b=nxINBiy8gXKQMebtKAX5V08YdOezfRU9iZhGzAa6rgdf53X2Ccc7DTXm/CA53zv894
         euNlqrpYkhwE4WHXVszZ62j7BWy1VhlWoRo6j5p5lB+NGYpl1zTrEtLumqgggLtS3mus
         dsyHfKzq18V7xcbWPvW6JSFhyaRBoMcCr4FRKVc05zZIjcAE/VbgvQ4UdIIxdgQvaacY
         SLUepgBRPQZryg0Z4s2zr4LU6hlGGyxLQr1jd9qQ5cF6oRct7JVOjLXt8b9+fUD4p0N2
         D6AGLF7Qh5AsAd2GexMVO+G7Q2JfCOSz4wJlAXAokZJCkxRLXjCMw3yqSPHIsqlR+Eg3
         vnRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eBig9Bi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e66si1000418qtb.244.2020.02.05.22.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 22:49:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eBig9Bi1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izaz1-0007lT-4o
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 01:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41437)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1izayr-0007km-8v
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 01:49:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1izayp-0001Sr-Ka
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 01:49:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38555
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1izayp-0001Hj-Em
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 01:49:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580971777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=VDcoZY1ZFRsky3PU15o8qkwztr/6tyc0v29JuLE4MIk=;
 b=eBig9Bi1ClDCyRgaGYQqd9rfSY1UbkGzDTRadCtYawsMAUenAcPlxzFmM3ixK8PDgWFNum
 d4NWc+NjWqsJ+mFVC4lhVAlhxhAXq5xVk6LEIahr8KWJesw0jsEaAMUdktRrNXpt103O21
 coz2DnCDBd70IBGlvmKek4s3+O2Q1J0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-OPxz6hA4OB-P4a3WQmVB_g-1; Thu, 06 Feb 2020 01:49:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5F761081FA0;
 Thu,  6 Feb 2020 06:49:27 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-151.ams2.redhat.com [10.36.116.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F29105DA75;
 Thu,  6 Feb 2020 06:49:17 +0000 (UTC)
Subject: Re: [PATCH for-5.0 3/4] Remove the core bluetooth code
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20191120091014.16883-1-thuth@redhat.com>
 <20191120091014.16883-4-thuth@redhat.com>
 <7a775153-f18d-e766-1d8f-33607f5fa05b@amsat.org>
 <2396dfd4-6c85-d17a-b358-bd058c757f14@redhat.com>
 <CAAdtpL7vPCQ8k91nvBWc_NLrmhu6OPVprUSL8uzi_v6HMiSrnw@mail.gmail.com>
 <CAL1e-=gd-ymYd3_cods8BAtwbQeJFodmnmsNo-gLx381rXHKxQ@mail.gmail.com>
 <20200205175115.GT2221087@redhat.com>
 <CAL1e-=jHpNmTdWSiHZ_StC0MXjLLsyq0cfSE=45=6SwoFnfiaA@mail.gmail.com>
 <CAL1e-=ivAZCj990c+47kVdcaOUgU5sDvoWZNWAMHmVJWd9L3Vg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <dde1555d-8aab-0faa-b70f-8510d751c3da@redhat.com>
Date: Thu, 6 Feb 2020 07:49:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=ivAZCj990c+47kVdcaOUgU5sDvoWZNWAMHmVJWd9L3Vg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: OPxz6hA4OB-P4a3WQmVB_g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: at7H/u3g4sjg

On 05/02/2020 19.53, Aleksandar Markovic wrote:
> On Wed, Feb 5, 2020 at 7:03 PM Aleksandar Markovic
> <aleksandar.m.mail@gmail.com> wrote:
>>
>>> The deprecation policy is primarily intended for notifying of changes
>>> to QEMU's stable interfaces ( CLI, HMP, QMP) which affect behaviour
>>> and usage of QEMU at runtime & are liable to break apps managing
>>> QEMU.
>>>
>>> Changes to build time options have no strong reason to be subjected to
>>> the deprecation process.
>>
>> This sounds reasonable to me.
>>
>> But: Should our deprecation policy be clearer on what is subject to
>> our deprecation procedure, and what is not?
>>
>> Regards,
>> Aleksandar
>>
> 
> And, there is even a section devoted to the build system in
> https://qemu.weilnetz.de/doc/qemu-doc.html#Deprecated-features :
> 
>     B.10 Build system
> 
>     B.10.1 Python 2 support (since 4.1.0)
> 
>     In the future, QEMU will require Python 3 to be available at build
> time. Support for Python 2 in scripts shipped with QEMU is deprecated.
> 
> The wording above comes from the file in our source tree: qemu-deprecated.texi .
> 
> Shouldn't the cases like "--enable-blues" be documented here? I think
> the deprecation of bluetooth devices support should have included a
> short section on involved configure options here.
> 
> Why is Python 2 support different to "--enable-blues" support? There
> should not be some unknown and arbitrary criterium what do and what
> doesn't come in this subsection.
> 
> Or, if our build system is not subject to our deprecation policy, than
> what is the entire subsection "B.10 Build system" doing here, in
> section "Deprecated features"?

See here:

https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg02552.html

i.e. the section was here rather by "accident". It will be removed once
my "qemu-deprecated: Remove text about Python 2" patch hits the master
branch.

 Thomas

