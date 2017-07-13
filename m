Received: by 10.25.44.15 with SMTP id s15csp2266568lfs;
        Thu, 13 Jul 2017 07:54:52 -0700 (PDT)
X-Received: by 10.237.61.208 with SMTP id j16mr5752809qtf.111.1499957692181;
        Thu, 13 Jul 2017 07:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499957692; cv=none;
        d=google.com; s=arc-20160816;
        b=J7RUzp71ZoVA3y+6ZECKH49jS0TsU23nk9dAApOS2rpxz3W2ClZEuwRoCL89ZlazsA
         OywMbhJJ76goRDQeMxGgFpw0msA5jNubmTEHJjpDvTAmYQ4WYqYaG1WJpB7uaEqn6Mk7
         zhOFyXsteMosp8uRAqvaZGZyvt//1jAGGydpCzgh5wjQTs5+rIar6HNs6YQxFUCOOKvo
         y6KNRYCjMRyop+netK5bqhEclulDNKLXLGw1njScTtDspGuxBzKdEyA/YxdewXWppB5g
         9KMWwUgxpT3YsIYZ3+Zgj4FkIc7gJD1S2pI8cl31I+UHHu0OpnW1GguOq+siT1kxEQTG
         KpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=sYeGgXL3zCyFT9YleY1C+cWD0++rvH/bKk/weHUjGhg=;
        b=V+PrfF2NO7RqQg4zyQMu/qgOvhE/yvdZtoUgZ4FhMvl3ppnVpqbzHC8go4TfVcc+W2
         m0GNdnU2KmxSosrx02ZYhWsqnW/d5Jz60gjZb35ATH5uRecB6zYCVpzsEqFcy0msVIsI
         2bDm2YsMcFnHR23VVefqrh/keZKSqEujCFjfx5TEikhwDekvzjY468x8rduqEhyr+Ck/
         qNIqpvVhnilApajidhqH4fElVsiyODR7Nd6O2/utS4lGK5FRXoH/lGTZYQR/UXr3Onxq
         Yid4bylIgNbQHXTiIpiGKzk32wAzbTvGbz+SzHnN0Cur1KUeQetECDrbB8e+zVtN/Ev9
         n6tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=bQQhNP7H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id c185si5284693qkd.316.2017.07.13.07.54.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 07:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=bQQhNP7H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVfVx-00047V-Ej
	for alex.bennee@linaro.org; Thu, 13 Jul 2017 10:54:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVf4z-0002Pi-Pw
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 10:26:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dVf4z-0004c8-0U
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 10:26:57 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:34341)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dVf4y-0004bi-QF
	for qemu-arm@nongnu.org; Thu, 13 Jul 2017 10:26:56 -0400
Received: by mail-wr0-x235.google.com with SMTP id 77so54174766wrb.1
	for <qemu-arm@nongnu.org>; Thu, 13 Jul 2017 07:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sYeGgXL3zCyFT9YleY1C+cWD0++rvH/bKk/weHUjGhg=;
	b=bQQhNP7H+tsuaXdbX+bhKKTvDvmdR5UYH8XmQVyJiKu9qvGRpS0W9DS57CfQVnmwg+
	OWpEbZSC4gTMLDZufNlJC/lA60KgS56okcnyKEJc9SH41UHwOQIQK/Jy/m13LLDEoPId
	BJ3ePGa6YiFmSf9lT3mpT7VpSJhvusNhAyRk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sYeGgXL3zCyFT9YleY1C+cWD0++rvH/bKk/weHUjGhg=;
	b=HYzpjyFvETqSTUa8hBxXxZP3G+EGiIW9zmlINYeZff+0RKtFFXlcOlkskcDstJL0iq
	3ctJ2g6aPyatdxJIM7rJz2n3Am6u5Jru3DoTb7P0x4ZKZgzaQRxPu36tfNGPYO5GXREt
	2aIEwrOHiF27s1jf/k7DKbKPObpG9eztl+T6QEwja2mTecFQVVMJEBQnx+xqUJAzuu2g
	75nT70wftmYY37H5KgxS//cIB8Wp3ejsZaCnAN6niVbLJTVFtaTTyZ08AmYaTAI6UKCD
	gY0ODXRoC731ZtmvIGTpG8x6LjufDjmt8szKyLloQQKG1qx4mPEFbfbkRBUzNZ8dp1Bs
	HgOw==
X-Gm-Message-State: AIVw110s7YEs5hsHRkL97owcbPVMQMLi2Q+QGgEVY3Dtap0TVCGBhSRr
	JA8xsZAddBLlgJWUR7xivVz6c2v6syzQIws=
X-Received: by 10.223.173.143 with SMTP id w15mr2122330wrc.113.1499956015704; 
	Thu, 13 Jul 2017 07:26:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 13 Jul 2017 07:26:35 -0700 (PDT)
In-Reply-To: <87lgns2zps.fsf@dusky.pond.sub.org>
References: <1499788408-10096-1-git-send-email-peter.maydell@linaro.org>
	<1499788408-10096-2-git-send-email-peter.maydell@linaro.org>
	<87lgns2zps.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jul 2017 15:26:35 +0100
Message-ID: <CAFEAcA--qraHck1_ba9ZFbZU+N-3FMzY8Z5rpri-NKr6K-dUmA@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FGjN+QK6GQQA

On 13 July 2017 at 15:11, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> In DEFINE_PROP_ARRAY, because we use a PropertyInfo (qdev_prop_arraylen)
>> which has a .set_default_value member we will set the field to a default
>> value. That default value will be zero, by the C rule that struct
>> initialization sets unmentioned members to zero if at least one member
>> is initialized. However it's clearer to state it explicitly.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> If my eyeball of the sources is correct, this is the only case we
>> have of a Property struct that uses a PropertyInfo with a non-NULL
>> .set_default_value but which doesn't explicitly set .defval.u.
>> ---
>>  include/hw/qdev-properties.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
>> index 0604c33..36d040c 100644
>> --- a/include/hw/qdev-properties.h
>> +++ b/include/hw/qdev-properties.h
>> @@ -110,6 +110,7 @@ extern PropertyInfo qdev_prop_arraylen;
>>                            _arrayfield, _arrayprop, _arraytype) {        \
>>          .name = (PROP_ARRAY_LEN_PREFIX _name),                          \
>>          .info = &(qdev_prop_arraylen),                                  \
>> +        .defval.u = 0,                                                  \
>>          .offset = offsetof(_state, _field)                              \
>>              + type_check(uint32_t, typeof_field(_state, _field)),       \
>>          .arrayinfo = &(_arrayprop),                                     \
>
> Hmm.
>
> .info and .defval apply to the array *length*.
> .info.set_default_value() is set_default_uint(), which uses .defval.u.
> Setting it here is correct.
>
> The array *elements* are described by .arrayinfo.  There is no
> .arraydefval, but that's okay, because .arrayinfo.set_default_value()
> doesn't get called.  Correct?

Correct. (There's no way to specify a default value for array properties.)

thanks
-- PMM
