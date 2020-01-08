Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp776036lff;
        Wed, 8 Jan 2020 06:03:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqw5JE+mLy/17QIbfyFq2sx1f/h0tERklXkflEkki6siBl8ywL3yRFqr2y6urAND39Kil0Y4
X-Received: by 2002:a05:620a:1010:: with SMTP id z16mr4499837qkj.237.1578492202022;
        Wed, 08 Jan 2020 06:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578492202; cv=none;
        d=google.com; s=arc-20160816;
        b=iXA1TUyvm0CgMM28N88SFWYaXGOKOc+aJcxwSunqFui54ZQm67PDaK2aLmXVdjKiwj
         UrM5KUcectIYnobTKancF5rfnbWZ979ZvQucdDicxK/6I04viU/c457TMfaHr06dAQcY
         C6hhyhUNnLxqMW2DtB9kSZeFs8cK3N2XDobbomOMceVTkRoc3hHjWmNvBnmEUs4wOIoV
         lVFj2XKoaq7qf3KCJqx5K6aRqSFCPGe/pRQAln6x6RBdX1+1MeQ3om8FMNjs+Fo7rAxf
         3Qrjgp/3pE67GIZpY02ktE0e4E4sJCo9hc/JQfdp/Ct6HB4AfIk3teGin0aLAW6pcvk9
         IunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fI8xL0pWbc09RBSXsr+ccXcLijYdveJWXe6MGKSHtIU=;
        b=KNSuJ9UTvPjauG72V8KxvTKmY7cuJLpXQ0cZWhvbiB+Vt5LERIp9uTYBlqQjcFALVX
         0o1hQsCK8QgaUqMJ5Bkft6sRtg5mryRY4uyxwYCcJzgHaACdBk1oz63SKOKhE73BvFOG
         Ss9vn03CHPuBO0fsowyQ3Fsvloa8KJbSesjZX+hQaw4gsMebxkzujrhWhuyijA3iRdzi
         pAKpBD0MNGUxnqaB5ikOdaqUtrHfjuBoaNPesY7OoQO8Pr1g2UDsb1wRrfS11ha9zrRF
         xwKZm7wDKTUKMHXnd0hNYs0uWWQhlIGovFSfHUaIOnhJRpurV/eLjfIQm5CbfRALLrP8
         UeeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TI7wpa02;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si1794323qtm.309.2020.01.08.06.03.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 06:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TI7wpa02;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipBvd-0000Yq-52
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 09:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipBvK-0000VX-GG
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 09:03:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipBvJ-0002jJ-3e
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 09:03:02 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23918
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipBvI-0002iS-V7
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 09:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578492180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fI8xL0pWbc09RBSXsr+ccXcLijYdveJWXe6MGKSHtIU=;
 b=TI7wpa02NU0xlIwMIVgAXx7qWFYYe9kDH4hcwFzMXPwZRhAlc2utGCm9MZt0UEass34ZjS
 IG3l580fazs2kDutU+2HmLoH20OTVe8fEORpzr37GL/yvulfBnUXBQ2CjdGPSwy9hfS8s6
 0fg6JEUWy+uXEqyzwCOftsMvn3EOJbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-0JHdwa2CM1OTDf0I1Gxqpw-1; Wed, 08 Jan 2020 09:02:59 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4B99184B1E3;
 Wed,  8 Jan 2020 14:02:57 +0000 (UTC)
Received: from [10.36.116.16] (ovpn-116-16.ams2.redhat.com [10.36.116.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C07C668882;
 Wed,  8 Jan 2020 14:02:49 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 01/20] migration: Support QLIST migration
To: quintela@redhat.com
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-2-eric.auger@redhat.com> <20191127114621.GG3016@work-vm>
 <87muaygk5l.fsf@secure.laptop>
 <9ba4d8f1-50b1-4882-77e8-8e7d9a6fac54@redhat.com>
 <8736cqgipm.fsf@secure.laptop>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ab55f1a1-b9fa-297c-7e3a-68359eb082af@redhat.com>
Date: Wed, 8 Jan 2020 15:02:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8736cqgipm.fsf@secure.laptop>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 0JHdwa2CM1OTDf0I1Gxqpw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 qemu-devel@nongnu.org, tnowicki@marvell.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, armbru@redhat.com, peterx@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ND0I+qW6u3rH

Hi Juan,

On 1/8/20 2:51 PM, Juan Quintela wrote:
> Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Juan,
>>
>> On 1/8/20 2:19 PM, Juan Quintela wrote:
>>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>>>> * Eric Auger (eric.auger@redhat.com) wrote:
>>>>> Support QLIST migration using the same principle as QTAILQ:
>>>>> 94869d5c52 ("migration: migrate QTAILQ").
>>>>>
>>>>> The VMSTATE_QLIST_V macro has the same proto as VMSTATE_QTAILQ_V.
>>>>> The change mainly resides in QLIST RAW macros: QLIST_RAW_INSERT_HEAD
>>>>> and QLIST_RAW_REVERSE.
>>>>>
>>>>> Tests also are provided.
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>
>>>>> +    while (qemu_get_byte(f)) {
>>>>> +        elm = g_malloc(size);
>>>>> +        ret = vmstate_load_state(f, vmsd, elm, version_id);
>>>>> +        if (ret) {
>>>>> +            error_report("%s: failed to load %s (%d)", field->name,
>>>>> +                         vmsd->name, ret);
>>>>> +            g_free(elm);
>>>>> +            return ret;
>>>>> +        }
>>>>> +        QLIST_RAW_INSERT_HEAD(pv, elm, entry_offset);
>>>>> +    }
>>>>> +    QLIST_RAW_REVERSE(pv, elm, entry_offset);
>>>>
>>>> Can you explain why you need to do a REVERSE on the loaded list,
>>>> rather than using doing a QLIST_INSERT_AFTER to always insert at
>>>> the end?
>>>>
>>>> Other than that it looks good.
>>>
>>> This was my fault (integrated as this is).
>>>
>>> Old code had a "walk to the end of the list" and then insert.
>>> I told it was way faster just to insert and the beggining and then
>>> reverse.  I didn't noticed that we had the previous element to know
>>> where to insert.
>>
>> Not sure I get your comment. To insert at the end one needs to walk
>> though the list. The head has no prev pointer pointing to the tail as
>> opposed to the queue. So I understood Dave's comment as "just explain
>> why you prefered this solution against the QLIST_INSERT_AFTER alternative.
> 
> You have the previous inserted element, so it is kind of easy O:-)
> 
>     prev = NULL;
>     while (qemu_get_byte(f)) {
>         elm = g_malloc(size);
>         ret = vmstate_load_state(f, vmsd, elm, version_id);
>         if (ret) {
>             error_report("%s: failed to load %s (%d)", field->name,
>                          vmsd->name, ret);
>             g_free(elm);
>             return ret;
>         }
>         if (!prev) {
>             QLIST_RAW_INSERT_HEAD(pv, elm, entry_offset);
>         } else {
>             QLIST_RAW_INSERT_AFTER(prev, elm, entry_offset);
>         }
>         prev = elm;
>     }
> 
> And yes, I realize that there is no QLIST_RAW_INSTERT_AFTER() (it is
> QLIST_INSERT_AFTER).  And no, I haven't took the time to understand the
> different between QLIST and QLIST_RAW.  From a quick look, it seems that
> QLIST_RAW is embededed inside other structure.

Ah OK I get it now. Yes indeed that looks simpler.

> 
> But as said, we can move that to another patch.

OK.

Thanks

Eric
> 
> Later, Juan.
> 
> 

