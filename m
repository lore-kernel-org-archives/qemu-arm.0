Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3901178wrm;
        Mon, 7 Oct 2019 07:58:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLu6pfm3BR4bC8FOwFi+dUq+KNNU1XdVFRy22XHtKTCTORHNE6C4ZqMCAOHKK0jZxMYHvF
X-Received: by 2002:ad4:458a:: with SMTP id x10mr15575134qvu.86.1570460324816;
        Mon, 07 Oct 2019 07:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570460324; cv=none;
        d=google.com; s=arc-20160816;
        b=Ttj8wLvCtMLImRDOHB5L+N01fwONcInPA15crXaiftISatlCzoRXjZ7EPOUo25u9pJ
         6C2C+nQ2fc/awfZDc4iUouiI2uwoCJms1+9cCMiJE2lJU2JQLhmU5HTlg1FOsP+hVw0Y
         X+pCquT4jvSGCi9NcKBzcoGBnyZXUcwaVOScpbqVR+Tj5eXjyb85s9YzXGFjuxpnq+BX
         iE4qUO43vk0n6BK9DWqtc5dyRtNJuvF9KxZuXBHdZF0w6F0K/jIlpPoHANpiGzYlA/8T
         h0Z3V7555nka4Z+uCMZ9uVfLdLp5I3+5kxAZhb0xz4GF5fAPZsjorJ5TTmr7L2ALSTOD
         8ZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=tKZ33DSZsGqjTRY3gdqK/IVj5yNkikr/SyCxI8liW68=;
        b=Jn1JovRl637Qha8xFhyjoRFkniLCM2MhjhYDhmR+imOdP1rAGUULofRPd7PVkEA7xV
         oY2ihVcuZ2AOuhWNTNpsJIdDPnGHI5j5+mxtpg62A9znPQGfp5eh09TJ3RtvtEs4RX4U
         SmYztt6GacHa8fF9SLKYyCZPMlepBzkL9rPG9h8WxFWuGLhrHcJPNNW0gkGXYodcXjiJ
         TzrzNUvEMfsNW/LhS+aB5QniR4tIAf3S2kiQIKHQKvZug6AzO6AFqqIaFDJq5kZuSTXU
         GyWgtwPatmjHr7Z2Eg3yLP91Ny/wWTBTbvr1yApGNBTHNHmYf0nhQHwvpQsLJjG4or52
         026w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iyJfKe+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si13217155qkd.85.2019.10.07.07.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 07:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iyJfKe+g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHUTE-0003dk-4R
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 10:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iHUT2-0003cC-TW
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 10:58:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iHUT1-0007UY-KJ
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 10:58:32 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35559
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iHUT1-0007U3-FM
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 10:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1570460311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=tKZ33DSZsGqjTRY3gdqK/IVj5yNkikr/SyCxI8liW68=;
 b=iyJfKe+gY20XQ/WirMZn7Flj+XwP3qCcmvjyMFR6RFdmloq8gxwMQI1wA0Bg2N7e8zKwSD
 JqYkDfmKM1FWOT1hsOocFc4nkCQ+LKlziUa/yMzvWDZFPulDQ0g6xuxU5Wu5+V/XedK1W9
 Hzt6BYPdSB8P6PHBqaR6U0f/SMDtwkU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-F1xJkNR3OsGnpvQ3_-QyXw-1; Mon, 07 Oct 2019 10:58:29 -0400
Received: by mail-wr1-f70.google.com with SMTP id v17so7251378wru.12
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2019 07:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=opDJaK1LOGeNR0h+y8//yRChbBH/T0RfjhSqu/HvGUY=;
 b=qsKiSzExgmlvcjp6lIWaFXHBC3hqbBlwMMEPRS/1M1EfUuJPNKsd93Hvv2tsIVNL3R
 MkjEcBGnFn/vnoIkedFZuXveptg+pkxi4XtvykkWLgHFzdtCmC8ILNUwV3KHrSjvcA1o
 V5PcApFg2kXHXZp8XH2ZFfcGX9UT4JBJRgnT63w9stu4klISj5kc+/O3uosYDQdbp9wW
 XZ7Ql0suDtEn/+6mekdlaTgEwPR41Lr6Zl4UeO0CDefemGQfU1lh3Us6dxrQiaaarwUu
 QYWMMGo/3kl3P7ZWglJLiKQeZG072OWghfjLJ61272QGtxyOSD9GM2erNJbPmZSHZ2t3
 DRKg==
X-Gm-Message-State: APjAAAVh4JPrcS3QL3GpF+HeJ/9AM44utzibcFbhyavM0/DVa+AW0hR1
 hW2GLghy6QVDOUsh0BUhR4bxHAZkPrHxzDITJWWmV+lh1QsdzKB1sgcrIgP4GQC6bY8gW2h0XGo
 GMJ3JflrE6LU/
X-Received: by 2002:a5d:660c:: with SMTP id n12mr23865420wru.286.1570460307924; 
 Mon, 07 Oct 2019 07:58:27 -0700 (PDT)
X-Received: by 2002:a5d:660c:: with SMTP id n12mr23865393wru.286.1570460307616; 
 Mon, 07 Oct 2019 07:58:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9dd9:ce92:89b5:d1f2?
 ([2001:b07:6468:f312:9dd9:ce92:89b5:d1f2])
 by smtp.gmail.com with ESMTPSA id q10sm43364861wrd.39.2019.10.07.07.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 07:58:26 -0700 (PDT)
Subject: Re: [Qemu-devel] qemu_futex_wait() lockups in ARM64: 2 possible issues
To: dann frazier <dann.frazier@canonical.com>
References: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
 <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
 <1864070a-2f84-1d98-341e-f01ddf74ec4b@ubuntu.com>
 <20190924202517.GA21422@xps13.dannf> <20191002092253.GA3857@hc>
 <6dd73749-49b0-0fbc-b9bb-44c3736642b8@redhat.com>
 <20191007144432.GA29958@xps13.dannf>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <065a52a9-5bb0-1259-6c73-41af60e0a05d@redhat.com>
Date: Mon, 7 Oct 2019 16:58:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007144432.GA29958@xps13.dannf>
Content-Language: en-US
X-MC-Unique: F1xJkNR3OsGnpvQ3_-QyXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>,
 lizhengui <lizhengui@huawei.com>, Jan Glauber <jglauber@marvell.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Bug 1805256 <1805256@bugs.launchpad.net>,
 QEMU Developers - ARM <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7wM/06EI1LBT

On 07/10/19 16:44, dann frazier wrote:
> On Mon, Oct 07, 2019 at 01:06:20PM +0200, Paolo Bonzini wrote:
>> On 02/10/19 11:23, Jan Glauber wrote:
>>> I've looked into this on ThunderX2. The arm64 code generated for the
>>> atomic_[add|sub] accesses of ctx->notify_me doesn't contain any
>>> memory barriers. It is just plain ldaxr/stlxr.
>>>
>>> From my understanding this is not sufficient for SMP sync.
>>>
>>> If I read this comment correct:
>>>
>>>     void aio_notify(AioContext *ctx)
>>>     {
>>>         /* Write e.g. bh->scheduled before reading ctx->notify_me.  Pai=
rs
>>>          * with atomic_or in aio_ctx_prepare or atomic_add in aio_poll.
>>>          */
>>>         smp_mb();
>>>         if (ctx->notify_me) {
>>>
>>> it points out that the smp_mb() should be paired. But as
>>> I said the used atomics don't generate any barriers at all.
>>
>> Based on the rest of the thread, this patch should also fix the bug:
>>
>> diff --git a/util/async.c b/util/async.c
>> index 47dcbfa..721ea53 100644
>> --- a/util/async.c
>> +++ b/util/async.c
>> @@ -249,7 +249,7 @@ aio_ctx_check(GSource *source)
>>      aio_notify_accept(ctx);
>> =20
>>      for (bh =3D ctx->first_bh; bh; bh =3D bh->next) {
>> -        if (bh->scheduled) {
>> +        if (atomic_mb_read(&bh->scheduled)) {
>>              return true;
>>          }
>>      }
>>
>>
>> And also the memory barrier in aio_notify can actually be replaced
>> with a SEQ_CST load:
>>
>> diff --git a/util/async.c b/util/async.c
>> index 47dcbfa..721ea53 100644
>> --- a/util/async.c
>> +++ b/util/async.c
>> @@ -349,11 +349,11 @@ LinuxAioState *aio_get_linux_aio(AioContext *ctx)
>> =20
>>  void aio_notify(AioContext *ctx)
>>  {
>> -    /* Write e.g. bh->scheduled before reading ctx->notify_me.  Pairs
>> -     * with atomic_or in aio_ctx_prepare or atomic_add in aio_poll.
>> +    /* Using atomic_mb_read ensures that e.g. bh->scheduled is written =
before
>> +     * ctx->notify_me is read.  Pairs with atomic_or in aio_ctx_prepare=
 or
>> +     * atomic_add in aio_poll.
>>       */
>> -    smp_mb();
>> -    if (ctx->notify_me) {
>> +    if (atomic_mb_read(&ctx->notify_me)) {
>>          event_notifier_set(&ctx->notifier);
>>          atomic_mb_set(&ctx->notified, true);
>>      }
>>
>>
>> Would you be able to test these (one by one possibly)?
>=20
> Paolo,
>   I tried them both separately and together on a Hi1620 system, each
> time it hung in the first iteration. Here's a backtrace of a run with
> both patches applied:

Ok, not a great start...  I'll find myself an aarch64 machine and look
at it more closely.  I'd like the patch to be something we can
understand and document, since this is probably the second most-used
memory barrier idiom in QEMU.

Paolo

