Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp967236lfi;
        Tue, 3 Mar 2020 16:10:36 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsncqcONC0+F6iyqALnDNarXNXnUmqpv3ig93Y6xlSNmP6gwO0kCtWL8Gud6eumu+Y9hG+9
X-Received: by 2002:ac8:6753:: with SMTP id n19mr145467qtp.193.1583280635893;
        Tue, 03 Mar 2020 16:10:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583280635; cv=none;
        d=google.com; s=arc-20160816;
        b=ieG2FU0TYLuSScUoIjTvbiTcaNgQMbnKXE/0SMjRew/EbeZT8ERPrhkhcmFF3uGd+s
         im6s63VM9L20oM2w9MA0xYL+4jRTWxDGp/gm6aH8eWsngSJOivJgzT9X1DqYKgD0QwHJ
         xDK8fW9/xdURxAS5N8XZ0LQGlFwe9tP4nu073NaGrBIB+nUCQwpp6y5T0xZe//ACtpgV
         0h/mbD9Z7iQ2sU/twDzxtcaegO9seAYGNs4hwlXaIhMeZLsdSS2fVCLnr1Tq6Ss82tw9
         ZXLxKPf7uoIpkfjW4Y+qIIkSrjjcl2mLxBpD1L7ihyiZS+1YHDSkrDbEUuiF1QktutpQ
         +gLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RVniUVYRygY3SLjMTMIrb4u7u3AekyD10DlRdZpXe5M=;
        b=LumuD2qKlHiwvU1fg4y5gVcCzCZyawUg8oOJkUBAnfkVPE46oQPc0dO3902/zO3SMn
         +Zqzid7mfpn/EmXGDpnpx5q2ll3NP9krwkpPYjC3H3SQScjRUaKx6LVCiWLo51eq7qKa
         cYDSfZ71RUcaBZkpJvHhCUTKYHAM5RVwmXHuDUOIg94HlwB/NJ8SlH2C9aPA0C2ij/oF
         hAtIhHUDq8qoGKv4V7zvEDdJC4ArPWwHhnsLMUxmRUMHUEZlR7/VcwG4amUx6YgAhozo
         KG/m3Wb1faVnN49iC8leBRqIeHfoUqn4m4dE/LxJV7eXDFAN2w2FH63k37cZMqN3v0uv
         NV8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CUAIMSqO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24si4666240qkk.377.2020.03.03.16.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 16:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CUAIMSqO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9HcR-0003jc-At
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 19:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9HcH-0003fz-8o
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 19:10:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9HcG-0005mn-0E
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 19:10:24 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56853
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9HcF-0005m0-S7
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 19:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583280623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVniUVYRygY3SLjMTMIrb4u7u3AekyD10DlRdZpXe5M=;
 b=CUAIMSqOzhnSwvTwSNgySdBhKSCvRJqOKupiVMq2Ysn/j0O2AuadDndzv4NUmJMgPgkNiK
 B+kwDPzQNrrYsgCd39IzRAUMv2yBBX9OxlGKk9sXFOfDmCsgRsOKREP4aBtmzXzZV34Rnq
 9jsqO9zhDkN7+SwuwWUXfUdd7bbtHb4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-Wz7KL-j5PCmb38XehydryQ-1; Tue, 03 Mar 2020 19:10:21 -0500
X-MC-Unique: Wz7KL-j5PCmb38XehydryQ-1
Received: by mail-wr1-f72.google.com with SMTP id n7so110316wro.9
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 16:10:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yqmqjAjqlW9ia9aj9VahL5KNuPi9NrDLAY10DHXBTnw=;
 b=JZ60JW+EMWdjeG4Oato0yzUV7jG5q3H2l0KN3P4p5+as7bqYMTozVSC5VVKMKoTAgH
 9QwQHRv1NJUwPxlIwTcfiQEM3Cdwegt/63CsOazVbCcPXVkYn5qhAqkWRnsRG1yekvjF
 v7uaTkU0QdW8d6Yb194f95gTERDyJnsEzyn0MwGgRZz2g6ygYhUCaGqa3/AbaN5MnHoa
 2e1zVc34fmtHKSW3Us6/U8PfAqZE/k1L9zDX4KdnjpPgJBcenDndDxiqqy6qtPC2WEhH
 p6v+J41mHvJvDekKIwavrsoh+bvqT9r6p65z643yYWL4LC8ClDteDRALxeE2UfNvBdZ1
 HZrQ==
X-Gm-Message-State: ANhLgQ3ym8P6cdnRnwWeOpzskcwlDBZT6ZvG4AWcAtE+vYz+zloj9/8R
 kAFcA31lxCVsyeJQwdM+YCgWGHJTkPAZtXGrLAt3xgmxW+mLaTYTyvHm05zzncjk007yUV+i4Mt
 WWSlZpbbCBySD
X-Received: by 2002:a1c:1bd6:: with SMTP id b205mr123351wmb.186.1583280620650; 
 Tue, 03 Mar 2020 16:10:20 -0800 (PST)
X-Received: by 2002:a1c:1bd6:: with SMTP id b205mr123294wmb.186.1583280620277; 
 Tue, 03 Mar 2020 16:10:20 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id f17sm26091800wrj.28.2020.03.03.16.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 16:10:19 -0800 (PST)
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200303100511.5498-1-peter.maydell@linaro.org>
 <226c0d6b-feb5-d202-2fdf-ba4ae910e463@redhat.com>
 <4f960fe0-e5f5-1f8c-76a1-b1df2bef4bd9@redhat.com>
 <CAFEAcA-H9nOzSon9eqiL5w1Rq9qVWu=B1q29D4pLTd=u2cWSwQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <87269add-a5f1-4dca-9ae8-de392d7dbfd7@redhat.com>
Date: Wed, 4 Mar 2020 01:10:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-H9nOzSon9eqiL5w1Rq9qVWu=B1q29D4pLTd=u2cWSwQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +7VurUimeCB2

On 3/3/20 7:36 PM, Peter Maydell wrote:
> On Tue, 3 Mar 2020 at 18:33, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>> Nitpick: you don't need to include the bracket symbol in the diff:
>>
>>     @@
>>     -resetfn(CPUState *cpu)
>>     +resetfn(DeviceState *dev)
>>      {
>>
>> (simply indent it with a space).
>=20
> I think this was probably leftover from trying to get Coccinelle
> to not rewrap the '{' onto the previous line, before I found
> --smpl-spacing.
>=20
> In general I don't find it terribly useful to spend a great
> deal of time streamlining Coccinelle scripts -- I think they
> are basically one-shot uses almost all of the time, so once
> they're producing the right changes I prefer to move on.

I agree in this case it is not useful to add the script to the=20
repository as a file, because the cleanup is done (as you said,=20
'one-shot script'). The script is however valuable as in the commit=20
description.

Cleaning it up is not for performance, but as the script is buried into=20
the git repository, it can (and will) be used as reference/example by=20
other developers.

Anyway this patch is queued now, so let's move on :)

