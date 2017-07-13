Received: by 10.25.44.15 with SMTP id s15csp2381265lfs;
        Thu, 13 Jul 2017 09:24:06 -0700 (PDT)
X-Received: by 10.200.3.213 with SMTP id z21mr6225323qtg.185.1499963046213;
        Thu, 13 Jul 2017 09:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499963046; cv=none;
        d=google.com; s=arc-20160816;
        b=tcyzmdcaxZS3VPy0EBPPDl/8IZ7pr9wizKVYvjk+rwjXbaVpvxyEuUgUPFgfa/LFy7
         7fboECvK/ohlP2fJtb681bXO3TRg+3+f1p3nYESl3a3VNsZw8Dq5ZxCGDJv/oNxkKJRS
         eybZEfoq1vCOIkDHh++Mr0ALkbBjtpFawW2fUvMWwaU1WTqLpSvmhA+UMMaDTbemp0xQ
         Vb5ZAcSFpdLf5sNCI1na33fR9WK3JfSSR12KwGjsqNtYwNlXlof5L3MBY7oFv/K77VKH
         SyKurLvV0yeD5LOzT5o74fBoz3sg9F2/CjNqXULzz0KiWSYJyu8TDF5qeZ3/F2kTBtz/
         bHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=enMEKMtd4XPCYt0uoTCDlgDOni6DQPC1ihdgjbpOcGs=;
        b=nMe5eLvT7ulqeeXW/u7FhCCfIza6kVo5ZymjqkkMt+qWfNc7DhWg2s8Zmd5QIZwvH2
         eGY3NnEQXlcpvch5dV8p5219PP41eezLt4ieeyWazgLi5iaD+6/J7UAQxADaF8mcSt4c
         USfjhfVKwEVjhz/phITZSgQarL4MXDBCk9gCiDg8Ik0CdH4fYl/YdfNBvZ0f2IO4/iqT
         DmTIZjzFbQMEMQXxBGEN5nGnJn4jmRpYqMCYJLr1bFazsCqXG08C8Ugl3Z9qr6Kb3vk1
         POQpjqUoxOZJUNdpefKo4EQtLXndwoDU96Kqs7CmP6uvYy84iP09eY80M5JlheINoqSL
         /r6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h68si5534466qkd.34.2017.07.13.09.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 09:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVguJ-00087W-M3
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 12:24:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVgsI-0006Fs-6a
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 12:22:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1dVgsF-0007Ff-V3
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 12:21:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1dVgsF-0007FP-Lt; Thu, 13 Jul 2017 12:21:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 965647F6B1;
	Thu, 13 Jul 2017 16:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 965647F6B1
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 965647F6B1
Received: from blackfin.pond.sub.org (ovpn-116-60.ams2.redhat.com
	[10.36.116.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5DC460609;
	Thu, 13 Jul 2017 16:21:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 364FC1138645; Thu, 13 Jul 2017 18:21:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-2-git-send-email-peter.maydell@linaro.org>
	<87lgns2zps.fsf@dusky.pond.sub.org>
	<CAFEAcA--qraHck1_ba9ZFbZU+N-3FMzY8Z5rpri-NKr6K-dUmA@mail.gmail.com>
Date: Thu, 13 Jul 2017 18:21:50 +0200
In-Reply-To: <CAFEAcA--qraHck1_ba9ZFbZU+N-3FMzY8Z5rpri-NKr6K-dUmA@mail.gmail.com>
	(Peter Maydell's message of "Thu, 13 Jul 2017 15:26:35 +0100")
Message-ID: <87k23cxq75.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 13 Jul 2017 16:21:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] qdev-properties.h:
 Explicitly set the default value for arraylen properties
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mMXjd1Jm2q78

Peter Maydell <peter.maydell@linaro.org> writes:

> On 13 July 2017 at 15:11, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> In DEFINE_PROP_ARRAY, because we use a PropertyInfo (qdev_prop_arraylen)
>>> which has a .set_default_value member we will set the field to a default
>>> value. That default value will be zero, by the C rule that struct
>>> initialization sets unmentioned members to zero if at least one member
>>> is initialized. However it's clearer to state it explicitly.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> If my eyeball of the sources is correct, this is the only case we
>>> have of a Property struct that uses a PropertyInfo with a non-NULL
>>> .set_default_value but which doesn't explicitly set .defval.u.
>>> ---
>>>  include/hw/qdev-properties.h | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
>>> index 0604c33..36d040c 100644
>>> --- a/include/hw/qdev-properties.h
>>> +++ b/include/hw/qdev-properties.h
>>> @@ -110,6 +110,7 @@ extern PropertyInfo qdev_prop_arraylen;
>>>                            _arrayfield, _arrayprop, _arraytype) {        \
>>>          .name = (PROP_ARRAY_LEN_PREFIX _name),                          \
>>>          .info = &(qdev_prop_arraylen),                                  \
>>> +        .defval.u = 0,                                                  \
>>>          .offset = offsetof(_state, _field)                              \
>>>              + type_check(uint32_t, typeof_field(_state, _field)),       \
>>>          .arrayinfo = &(_arrayprop),                                     \
>>
>> Hmm.
>>
>> .info and .defval apply to the array *length*.
>> .info.set_default_value() is set_default_uint(), which uses .defval.u.
>> Setting it here is correct.
>>
>> The array *elements* are described by .arrayinfo.  There is no
>> .arraydefval, but that's okay, because .arrayinfo.set_default_value()
>> doesn't get called.  Correct?
>
> Correct. (There's no way to specify a default value for array properties.)

Thanks!

Reviewed-by: Markus Armbruster <armbru@redhat.com>
