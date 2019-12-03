Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1646010lfc;
        Tue, 3 Dec 2019 07:17:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqzN5IuU/XX7DE16F6Ouo8KCRQtzeG9eUp0podUX7Y3AhQdbN1I6U0eeaLr5emeawsSJ85JX
X-Received: by 2002:aed:3e12:: with SMTP id l18mr5582851qtf.290.1575386243741;
        Tue, 03 Dec 2019 07:17:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si1972464qti.327.2019.12.03.07.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 07:17:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=eDROYK43;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic9vW-0003ZP-FU
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 10:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34559)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1ic9tX-0003YC-5m
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 10:15:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1ic9tG-0007Fr-SG
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 10:15:12 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:41568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1ic9tG-00076M-8d; Tue, 03 Dec 2019 10:15:02 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 2B6DE96EF0;
 Tue,  3 Dec 2019 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1575386099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+Ssg94fEKiJOG8sgIrMssOBBvuXoDqgaPDRIWUBlzk=;
 b=eDROYK43rWl8jk4R4vno8u1RqnoVuY9h2qOyw3PqWireUB04dSjBZiT+DaDtc2cyHxqSNf
 4BeFYaWuqg3C0hGuKup49ShbK1YaE5lCQFL+iYJMKPGVgoI0xZNMhbzDegPRJYenVILBCp
 BwhqwiFutPm17QcUaj72z2stW8bUM4I=
Subject: Re: [PATCH v6 1/9] hw/core/clock: introduce clock objects
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-2-damien.hedde@greensocs.com>
 <50c7d986-1630-e75c-acbd-24330e961dbb@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <9f79bf28-ad1a-4df1-76b4-8ecef780bb0f@greensocs.com>
Date: Tue, 3 Dec 2019 16:14:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <50c7d986-1630-e75c-acbd-24330e961dbb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1575386099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+Ssg94fEKiJOG8sgIrMssOBBvuXoDqgaPDRIWUBlzk=;
 b=NIg02mQeNDQW68KKyYyAz3CPscELn+/OUI5jluHGV9nrSQj1p2Ir6XJD0+Hq4E1SPpDDlp
 V1QsB8y6ZBJygQzQUdCn7cSSNZDzfTSuDccbtoptPQsnRvIWI6iMI9UAGqdEbgzCYwJP6r
 bPWKMCgr/YJfrbZ+357iYjeCmE8eIAI=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1575386099; a=rsa-sha256; cv=none;
 b=A9WmEAcAWj3t2Oezb7mTK+faJC8ICDg415eeG5p6iCwKz/+cjXxR7iaXPbULPpmt5DIiO2
 GMwAE6pB5huK0YqIACddwpE0Cuqw8ZPkC1hEQJ8iZpyR/IvNDm2dvH7tU9YbfOm+hQBIYE
 hQhM82X2ltYejI+0mNWj1V+NjoDKBGo=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 alistair@alistair23.me, mark.burton@greensocs.com, marcandre.lureau@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GwaXC+98KclN



On 11/25/19 2:37 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 9/4/19 2:55 PM, Damien Hedde wrote:
>> Introduce clock objects: ClockIn and ClockOut.
>>
>> These objects may be used to distribute clocks from an object to sever=
al
>> other objects. Each ClockIn object contains the current state of the
>> clock: the frequency; it allows an object to migrate its input clock
>> state
>> independently of other objects.
>>
>> A ClockIn may be connected to a ClockOut so that it receives update,
>> through a callback, whenever the Clockout is updated using the
>> ClockOut's set function.
>>
>> This is based on the original work of Frederic Konrad.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> =C2=A0 Makefile.objs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 1 +
>> =C2=A0 hw/core/Makefile.objs |=C2=A0=C2=A0 1 +
>> =C2=A0 hw/core/clock.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 144 +++++=
+++++++++++++++++++++++++++++++++++++
>> =C2=A0 hw/core/trace-events=C2=A0 |=C2=A0=C2=A0 6 ++
>> =C2=A0 include/hw/clock.h=C2=A0=C2=A0=C2=A0 | 124 ++++++++++++++++++++=
++++++++++++++++
>> =C2=A0 5 files changed, 276 insertions(+)
>> =C2=A0 create mode 100644 hw/core/clock.c
>> =C2=A0 create mode 100644 include/hw/clock.h
>>
>> diff --git a/hw/core/trace-events b/hw/core/trace-events
>> index ecf966c314..aa940e268b 100644
>> --- a/hw/core/trace-events
>> +++ b/hw/core/trace-events
>> @@ -34,3 +34,9 @@ resettable_phase_hold_end(void *obj, int needed)
>> "obj=3D%p needed=3D%d"
>> =C2=A0 resettable_phase_exit(void *obj, const char *type) "obj=3D%p(%s=
)"
>> =C2=A0 resettable_phase_exit_end(void *obj, uint32_t count) "obj=3D%p
>> count=3D%" PRIu32
>> =C2=A0 resettable_count_underflow(void *obj) "obj=3D%p"
>> +
>> +# hw/core/clock-port.c
>=20
> "# clock.c"
>=20

Oups, I missed this one in the renaming.

>> +
>> +struct ClockIn {
>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>> +=C2=A0=C2=A0=C2=A0 Object parent_obj;
>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>> +=C2=A0=C2=A0=C2=A0 uint64_t frequency;
>> +=C2=A0=C2=A0=C2=A0 char *canonical_path; /* clock path cache */
>> +=C2=A0=C2=A0=C2=A0 ClockOut *driver; /* clock output controlling this=
 clock */
>> +=C2=A0=C2=A0=C2=A0 ClockCallback *callback; /* local callback */
>> +=C2=A0=C2=A0=C2=A0 void *callback_opaque; /* opaque argument for the =
callback */
>> +=C2=A0=C2=A0=C2=A0 QLIST_ENTRY(ClockIn) sibling;=C2=A0 /* entry in a =
followers list */
>> +};
>> +
>> +struct ClockOut {
>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>> +=C2=A0=C2=A0=C2=A0 Object parent_obj;
>> +=C2=A0=C2=A0=C2=A0 /*< private >*/
>> +=C2=A0=C2=A0=C2=A0 char *canonical_path; /* clock path cache */
>> +=C2=A0=C2=A0=C2=A0 QLIST_HEAD(, ClockIn) followers; /* list of regist=
ered clocks */
>> +};
>=20
> Can we keep the structure definitions opaque in hw/core/clock.c?
> If so, clock_get_frequency() can't be inlined anymore.
>=20

I think so. Apart from the monitor command (and the inline), nothing
requires the structure fields. I suppose we can add a function to access
or print the fields to be used by the monitor.

I don't have a opinion on this.

Damien

