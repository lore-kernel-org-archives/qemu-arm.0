Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp762898lff;
        Wed, 8 Jan 2020 05:51:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwIA8Fz/DzG1yyTIvh2DSS7qSAvIq9aYqBMqoFE+5voLy+quvqu1nwjizp6q1yk5oc0Dgx4
X-Received: by 2002:a05:620a:6b6:: with SMTP id i22mr4168400qkh.301.1578491488999;
        Wed, 08 Jan 2020 05:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578491488; cv=none;
        d=google.com; s=arc-20160816;
        b=G0GFYXQ3U0v8PiKVqXr1e7iqd9oOrRJuO0OuYcx/AF5FYgfvy7DCOB0OnJWkPvji6/
         k2ot6PD5sQ4Inma1MX60ecxKV6FcumTmAqZTcgCzC4L6kEpZV3jv/t3TJqp4bSvAuj6i
         tCcdQ8E/rzrhSZ/CGt2ATYHV1hFWfprq5IcMwtILWCrAvsShELWiTKSzJIL7TaRDN3O4
         efCcCJAybCukVTIwEONMooAwg3rqMFsFrjXjlfK0EKzEOFktMcqP/uGQOFLgo5yr+fs6
         +bLgE/Z4OtJjr4bwjMLVyOIEJeuleBCrA7zlVVsdHb6P3KF5AlUFWyVsU8/HNeb/kklH
         x4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=UQj2wsXEkE+tVxns93g9xXkrKkxI6UDItUZYHlHoPqw=;
        b=XdBDoRkoYfftqL58P6modbcj2FV4ALPVCbDc/RHv8znzmewaJCkni/hXcRRDRcFWMM
         AmL7Bi5cObxWPIj8XlA4op14hjsM1kbXvKlMY/3Y1w0jKqYzFCH4PDjQLrjBdi9Vjoyd
         QQxsRqJB1RTDtTOPyjq8GTke6gTV4Rt6b/a0uq6E5Ts2hezjy6FTIEURun25U67nMb5P
         sHFcZK1Lu5Ja4CT7tXwc0BHGXrci9kMPClPV/cxflArwwm5XOGoTiq4fzBI4JoJZG1zm
         ZNMARfW/XEzYXtcfFrX6R6Fzqi9yoWE1xSxFWtiL/xS71/VafpNf9bH8j6n5MnQp1tXb
         2vUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yd7WeFMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si1626705qtj.154.2020.01.08.05.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 05:51:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yd7WeFMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipBk8-00062Y-F2
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 08:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipBk0-00062G-6V
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 08:51:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipBjx-0000nT-NU
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 08:51:18 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22766
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipBjx-0000md-JJ
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 08:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578491477;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQj2wsXEkE+tVxns93g9xXkrKkxI6UDItUZYHlHoPqw=;
 b=Yd7WeFMUV1J50GD5XVFD/mmVJGDYyWYNH0zbmG+2uuV31ajFXcZHP7mz3xw3GuerdcQNGy
 OfuKjEMw3oPwYYnz8D0rab24lnv10uBiQBoYQUAYq3D1QQiJ4mpp/WyWItfLXDmmTDX3ZT
 E2gCZdZCGKK9TsnqBr2ZtyQXMxPzMLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-ec9nmA8-NWyfNl1oiY-xmg-1; Wed, 08 Jan 2020 08:51:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7723800D54;
 Wed,  8 Jan 2020 13:51:13 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0758A5C21A;
 Wed,  8 Jan 2020 13:51:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 01/20] migration: Support QLIST migration
In-Reply-To: <9ba4d8f1-50b1-4882-77e8-8e7d9a6fac54@redhat.com> (Auger Eric's
 message of "Wed, 8 Jan 2020 14:40:47 +0100")
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-2-eric.auger@redhat.com>
 <20191127114621.GG3016@work-vm> <87muaygk5l.fsf@secure.laptop>
 <9ba4d8f1-50b1-4882-77e8-8e7d9a6fac54@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 08 Jan 2020 14:51:01 +0100
Message-ID: <8736cqgipm.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: ec9nmA8-NWyfNl1oiY-xmg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Reply-To: quintela@redhat.com
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 armbru@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 peterx@redhat.com, qemu-devel@nongnu.org, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bkPa8CvpsLqw

Auger Eric <eric.auger@redhat.com> wrote:
> Hi Juan,
>
> On 1/8/20 2:19 PM, Juan Quintela wrote:
>> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>>> * Eric Auger (eric.auger@redhat.com) wrote:
>>>> Support QLIST migration using the same principle as QTAILQ:
>>>> 94869d5c52 ("migration: migrate QTAILQ").
>>>>
>>>> The VMSTATE_QLIST_V macro has the same proto as VMSTATE_QTAILQ_V.
>>>> The change mainly resides in QLIST RAW macros: QLIST_RAW_INSERT_HEAD
>>>> and QLIST_RAW_REVERSE.
>>>>
>>>> Tests also are provided.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>
>>>> +    while (qemu_get_byte(f)) {
>>>> +        elm =3D g_malloc(size);
>>>> +        ret =3D vmstate_load_state(f, vmsd, elm, version_id);
>>>> +        if (ret) {
>>>> +            error_report("%s: failed to load %s (%d)", field->name,
>>>> +                         vmsd->name, ret);
>>>> +            g_free(elm);
>>>> +            return ret;
>>>> +        }
>>>> +        QLIST_RAW_INSERT_HEAD(pv, elm, entry_offset);
>>>> +    }
>>>> +    QLIST_RAW_REVERSE(pv, elm, entry_offset);
>>>
>>> Can you explain why you need to do a REVERSE on the loaded list,
>>> rather than using doing a QLIST_INSERT_AFTER to always insert at
>>> the end?
>>>
>>> Other than that it looks good.
>>=20
>> This was my fault (integrated as this is).
>>=20
>> Old code had a "walk to the end of the list" and then insert.
>> I told it was way faster just to insert and the beggining and then
>> reverse.  I didn't noticed that we had the previous element to know
>> where to insert.
>
> Not sure I get your comment. To insert at the end one needs to walk
> though the list. The head has no prev pointer pointing to the tail as
> opposed to the queue. So I understood Dave's comment as "just explain
> why you prefered this solution against the QLIST_INSERT_AFTER alternative=
.

You have the previous inserted element, so it is kind of easy O:-)

    prev =3D NULL;
    while (qemu_get_byte(f)) {
        elm =3D g_malloc(size);
        ret =3D vmstate_load_state(f, vmsd, elm, version_id);
        if (ret) {
            error_report("%s: failed to load %s (%d)", field->name,
                         vmsd->name, ret);
            g_free(elm);
            return ret;
        }
        if (!prev) {
            QLIST_RAW_INSERT_HEAD(pv, elm, entry_offset);
        } else {
            QLIST_RAW_INSERT_AFTER(prev, elm, entry_offset);
        }
        prev =3D elm;
    }

And yes, I realize that there is no QLIST_RAW_INSTERT_AFTER() (it is
QLIST_INSERT_AFTER).  And no, I haven't took the time to understand the
different between QLIST and QLIST_RAW.  From a quick look, it seems that
QLIST_RAW is embededed inside other structure.

But as said, we can move that to another patch.

Later, Juan.

