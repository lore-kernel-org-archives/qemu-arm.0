Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2943716wrp;
        Mon, 23 Sep 2019 10:54:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWcfH+37ETJCQNeCluNkEHciV3s9G8mzValRvnDD3rJKu7qU3mzuofw3QnxBxue+6y82wp
X-Received: by 2002:a17:906:278a:: with SMTP id j10mr969077ejc.228.1569261296173;
        Mon, 23 Sep 2019 10:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569261296; cv=none;
        d=google.com; s=arc-20160816;
        b=rruP0ZuuITJ6wLW7U+AzMBRKMa5PIZKSYbqgDVcPtjD0wgWqEDIMS8troQRbLDZ+o6
         OMkOI1WOp23Px7ocSolmsiY4iFkn3WBkMTq9s7C97E630BcTnrt06cCI/K7PIcX6hJif
         dOfsj3TMe3VaRd316voar5HlKs4/AiMY4FpO4hArNdUbT2VixXRxjmxTZsH9am5T6Eaw
         G4y/qtrTVFRJI/f7WqLO1GctVzPlFiDOw7p5+byY1P560OPZmS6veZH3jAHMPZkTbSAu
         +40cf2CTTPHfaWHV2fqbr7MHamTSwRvxLl4ItTWT2mTz6X790rZYbQBRP63fq3hEOGIc
         0IfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:openpgp:from:references:to
         :subject;
        bh=8tYHzE7oNq+M3EPcJZpXriNAOOqsYmbAVRN2qrmLpc0=;
        b=DyG+TQxy12UhCBNeqv0LCv5od771YCL8Ki++lAf9bdVJ2vVy2BkgmPTIuDkYIC/5z+
         tyNjynvXUaLMXZaoj6lbD7Pm/50m+sFYSYnIbXrvMlP9Vl7+YkEUK1IQmhEG7S+MEYz+
         S07VF5OStW3oL1i0dNi2TPzJcS83BLgj9oLhSkTVLDQPjz/M3jyz1xBU2gBj/EslGD0o
         0n5jA/wyaIJ2m9LpnR/13gcQhD+FJ7so4f6vx2DkNqbu9bi0KBXiBIqKnxHCdlupKRVs
         B3qAWS2cgE2P0OI1Moa/v5m+OBCfKXdBrtEGBQFpid0U1TxbC9bShcHlwL2ijYdl6Y1i
         zSdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p43si6917851edc.368.2019.09.23.10.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 10:54:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCSY3-0003Ai-3Y
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 13:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45120)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iCSXT-00036f-P1
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 13:54:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iCSXS-0001Wv-Nh
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 13:54:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55244)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iCSXQ-0001Vk-F5; Mon, 23 Sep 2019 13:54:16 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5459F18C4286;
 Mon, 23 Sep 2019 17:54:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F6BD1001DC2;
 Mon, 23 Sep 2019 17:54:08 +0000 (UTC)
Subject: Re: [PATCH 3/4] hw/arm: Move armv7m_nvic.c to hw/arm/ and always
 enable it for arm builds
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-4-thuth@redhat.com>
 <CAFEAcA_6UxMBeyOMM0iT5cnCQEpWXfRO2XMuV9ez_0Su2osXNg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <0389e9dc-7f78-5b27-4764-51f0bdef5bef@redhat.com>
Date: Mon, 23 Sep 2019 19:54:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6UxMBeyOMM0iT5cnCQEpWXfRO2XMuV9ez_0Su2osXNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Mon, 23 Sep 2019 17:54:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /3T7xI2BhFUa

On 23/09/2019 16.52, Peter Maydell wrote:
> On Sat, 21 Sep 2019 at 16:04, Thomas Huth <thuth@redhat.com> wrote:
>>
>> qemu-system-arm/-aarch64 currently can't be built without setting the
>> switch CONFIG_ARM_V7M=3Dy - which we currently always do in the config=
 file
>> default-configs/arm-softmmu.mak. This is because the code in target/ar=
m/
>> calls many functions from this armv7m_nvic.c, and thus linking fails
>> without this file.
>>
>> So armv7m_nvic.c should not be under the CONFIG_ARM_V7M switch, but al=
ways
>> compiled for arm builds. Since we can not simply do this in hw/intc/ (=
with
>> "obj-y +=3D ..." it would get compiled for all other architectures, to=
o),
>> let's move the file to hw/arm/ instead and always enable it there.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/arm/Makefile.objs           |  2 ++
>>  hw/{intc =3D> arm}/armv7m_nvic.c |  0
>>  hw/arm/trace-events            | 17 +++++++++++++++++
>>  hw/intc/Makefile.objs          |  1 -
>>  hw/intc/trace-events           | 17 -----------------
>>  5 files changed, 19 insertions(+), 18 deletions(-)
>>  rename hw/{intc =3D> arm}/armv7m_nvic.c (100%)
>=20
> Please don't move this file. This is an interrupt
> controller (with some other functionality jammed into it)
> and so it should be in hw/intc. It's true that it's rather
> tightly-coupled to the CPU, but the same is true for our
> GICv3 model.

Ok, then what would you suggest to solve the problem that this file has
always to be linked into the binary? I can't use "obj-y +=3D ..." in
hw/intc/Makefile.objs since that would mean that the file also gets
compiled for non-Arm boards. Would you prefer a bunch of stubs instead
that get used if CONFIG_ARM_V7M is not set?

 Thomas
