Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4665694lfm;
        Tue, 14 Apr 2020 00:16:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypK4fICDHe9PwMsINQEMhv/E64ceZzTEPGrS6YxzUfVj2sa0CdHObRCVcPgJwfppxtBoEhgd
X-Received: by 2002:a05:620a:1512:: with SMTP id i18mr18957791qkk.137.1586848600400;
        Tue, 14 Apr 2020 00:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586848600; cv=none;
        d=google.com; s=arc-20160816;
        b=b6JlBtWn7TlAxqhb5h4WkR064Ol0NjC/mmQx9lIulrep3t+8ahTBiRv+THHXz6DWCz
         zElqIJPO/IOI4wknNPjHaFaO5wZ/pSn0yEIvJFT7SrbIBjShYmF6zGmcRF396wLMB8jV
         UKADBCG6EesA+2oLrJeLRvfj33FdGrxh9xx5K2xJBfGnXlWIpZhKNo4jwDRQkpToJI+M
         G1KfHKa3BDbP25XU/0ag8Sz6RLbbM0pIQjAGwUR8RoreOVXn6DJJqQaXCPwEy0tjYxYi
         EgyCxXX12IaZe5gJJTqPlbLfIYXwNbMsKq0Sz5SNzWxmQbTunsZ7d77DuoDFDfWHv7kJ
         PuGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=gIxxP2P7bDv0LyJOEFsSl+b26dNwRkjroj5o9XBzADA=;
        b=OqnHco3HJ3oi/ojRPqDOEuZHBhCnsd9synWNSsLYoi0lABIYX5TKDxCLYZT5ywIhZu
         ixloAlcW8TFx+o8h2bjT51UKMwGtWj14Vb8zC9wurZL1AZRJ39UbnQvK2I7Xw3pgsKex
         J9x5Yzll3dnqPZnfAxjkXbqbxmGsXO1qjEjLVSLBTjgqG6Hb6B8F8H6HLj0Zx/IvfSMj
         yX/I/W1TSjQ0QSjDGJBkFQQDj8/LLG4bBcZ1kG2veKo/Vx+zPp2HGOvsalM+lTY+847o
         liBObUCr2c+5V+CTzHVvg6KMLMVcoGtl3DP4ln1k8EsQyeIXYjJu5LsHUD6gLJw2uxaD
         M7Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YOVXGakY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m184si4351171qke.250.2020.04.14.00.16.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 00:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YOVXGakY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOFoF-0003YJ-QN
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 03:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOFnn-0003Y1-T1
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 03:16:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOFnl-0001iB-5h
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 03:16:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56655
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOFnl-0001hx-1m
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 03:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586848568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIxxP2P7bDv0LyJOEFsSl+b26dNwRkjroj5o9XBzADA=;
 b=YOVXGakYD9mcV0Ttd8589I0jllkvEtp1HrOx+AMQNsfc9XGNqm0/PWsfr7HLmbytc5IOY/
 X6EqRt86x6sKBHdcHAmSMh+sjd4BEYJpLRim6gq9czEhNbvl1wirdIFuXNon2VkVv1ZdID
 lWD9j7HgC9X4hxXKHI7w9kiPwq4z/yI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-VXY0blHTPYSvQf01L1nR-A-1; Tue, 14 Apr 2020 03:16:06 -0400
X-MC-Unique: VXY0blHTPYSvQf01L1nR-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F046E108838D;
 Tue, 14 Apr 2020 07:16:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 352DC1000325;
 Tue, 14 Apr 2020 07:16:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A9B7E11385C8; Tue, 14 Apr 2020 09:15:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v9 5/9] docs/clocks: add device's clock documentation
References: <20200406135251.157596-1-damien.hedde@greensocs.com>
 <20200406135251.157596-6-damien.hedde@greensocs.com>
 <87pncjzxwc.fsf@dusky.pond.sub.org>
 <f5556e5f-ee75-10cb-53f3-b249de8a5147@greensocs.com>
Date: Tue, 14 Apr 2020 09:15:59 +0200
In-Reply-To: <f5556e5f-ee75-10cb-53f3-b249de8a5147@greensocs.com> (Damien
 Hedde's message of "Wed, 8 Apr 2020 12:06:10 +0200")
Message-ID: <87sgh6zgeo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qCaAJPqADESO

Damien Hedde <damien.hedde@greensocs.com> writes:

> On 4/7/20 7:07 AM, Markus Armbruster wrote:
>> Damien Hedde <damien.hedde@greensocs.com> writes:
>>=20
>>> Add the documentation about the clock inputs and outputs in devices.
>>>
>>> This is based on the original work of Frederic Konrad.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>> ---
>>> v9:
>>>  + fix a few typos (Alistair)
>>>
>>> v8:
>>>  + fix list indentation
>>>  + reduce title size
>>>
>>> v7:
>>>  + update ClockIn/Out types
>>>  + switch to rst format
>>> ---
>>>  docs/devel/clocks.rst | 360 ++++++++++++++++++++++++++++++++++++++++++
>>>  docs/devel/index.rst  |   1 +
>>>  2 files changed, 361 insertions(+)
>>>  create mode 100644 docs/devel/clocks.rst
>>>
>>> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
>>> new file mode 100644
>>> index 0000000000..ead9f55561
>>> --- /dev/null
>>> +++ b/docs/devel/clocks.rst
>>> @@ -0,0 +1,360 @@
>>> +Modeling a clock tree in QEMU
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>> +
>>> +What are clocks
>>> +---------------
>>> +
>>> +Clocks are QOM objects developed for the purpose of modeling the
>>> +distribution of clocks in QEMU.
>>> +
>>> +They allow us to model the clock distribution of a platform and detect
>>> +configuration errors in the clock tree such as badly configured PLL, c=
lock
>>> +source selection or disabled clock.
>>> +
>>> +The object is *Clock* and its QOM name is ``CLOCK``.
>>=20
>> PATCH 1 has
>>=20
>>     #define TYPE_CLOCK "clock"
>>=20
>> Ignorant question: how is this related to *Clock* and ``CLOCK``?
>>=20
>> [...]
>>=20
>
> Hi Markus,
>
>
> *Clock* refer to the C type
>> typedef struct Clock Clock;

Okay.

> I think I've put ``CLOCK`` in uppercase because, in practical, we only
> use the upper case macro.

True for internal code, not true at external interfaces.

>> #define TYPE_CLOCK "clock"
>> #define CLOCK(obj) OBJECT_CHECK(Clock, (obj), TYPE_CLOCK)
>
> I'm not sure what is the right terminology here. Maybe I can replace by
> the following:
>
>> The QOM name of a clock is ``"clock"`` (or the macro ``TYPE_CLOCK``).
> The C type object is *Clock*.

Better.

Maybe (in C, the macro ``TYPE_CLOCK'') or (C macro ``TYPE_CLOCK'').
Your choice :)

