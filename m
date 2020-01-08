Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp728251lff;
        Wed, 8 Jan 2020 05:20:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxy9V3edBV+KcuXWKhDdQIHZfl4MW+pyZG7Xt3olrqUS2Fs1ycBfArIkAU0B4EVZyA7fEcW
X-Received: by 2002:a05:6402:363:: with SMTP id s3mr5411584edw.245.1578489624191;
        Wed, 08 Jan 2020 05:20:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578489624; cv=none;
        d=google.com; s=arc-20160816;
        b=KvgLWpQ64HrgySSLvqDk3qYrN8aGBTTL0Y2ZJY9ZDgMqR+ofQQGCJA6h0crlRncgGw
         zog6UQ4JuG7GO7ju7WGmJTC2UmNW7y42WOgNruoqBdOgY2IlOK0GPeuHE+D+GauZEfFz
         JTOQgqRqiSx0pcZEDtlK0OeIQduyjAR2GRUE21p+/VVrFrdHkQdcX/CnvSU+2jbg1BGB
         II0Vxir4PUMBOCSeYEaIin+4PHptT28QlI6l+7x7UKAXKDM+78xfvmA5/FA32p6CZr/p
         Wnwl+s3YjUVNc6PmubYYf/y69f6dxdHU5qCP+yI5EuuMl9cLSZ7AFpjqAKX20Yvv2iqH
         RmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=AtgRUXkxC0f5MYhGoBbdBZ8dGiDYnQt/S4XHSLEqe8g=;
        b=jkReBGm5HwrFNTFHFgDA+01f9bUoVPG2ludKPVRXHLnXVFOUUbSB50Vp6zRHNbzDF8
         tnigrcUsdzz9yy/pmWvw81HzhMT6DjrH87MIzmZCa62w4HXinm7HtamS0onODrYXAO2l
         VpOnvh1b23Uk4R1gNIMHjcyYcAV6T12sMA/ncAwQnlQYCg1MuyXOVgS5rYOMpIDbbddg
         zUh8wY3Q+TLntYL/F9ide+FPxayptt3waXkk7Y1uqJixOQ7ucy+/3eeoejqLQu6dAbZG
         iEYqqivgcqoGUwPz41KkluWQ8+sCpBwZH2DuIfG9ekV7KEUK7A/cpR1Po1uwPPUqDF+p
         yMLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BkkD88K3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26si2201023eje.430.2020.01.08.05.20.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 05:20:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BkkD88K3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipBG3-0003sH-3p
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 08:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34655)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipBFo-0003r8-NB
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 08:20:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipBFn-0001se-JP
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 08:20:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56643
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipBFn-0001sO-FH
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 08:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578489607;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AtgRUXkxC0f5MYhGoBbdBZ8dGiDYnQt/S4XHSLEqe8g=;
 b=BkkD88K38rXRprobMACQ6Lp/X+rK90GWYgEXBT+0ojsXOdnpi6ZPU7Pvuz39Zq2etZssQO
 e6EzTK/4C29Y9KqG3AMV8lHFDa8vpD9Es6g2FNy80vJys1PyrHOjeF0oBRl2rGHlpHy+wB
 h9Nob/d4ZGxEs5YuVNRvG0gxKInFKRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-dPd4s5tpM9q4Qwbr7LGL0A-1; Wed, 08 Jan 2020 08:20:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D10768C238C;
 Wed,  8 Jan 2020 13:20:01 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C277B5C1B0;
 Wed,  8 Jan 2020 13:19:53 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH for-5.0 v11 01/20] migration: Support QLIST migration
In-Reply-To: <20191127114621.GG3016@work-vm> (David Alan Gilbert's message of
 "Wed, 27 Nov 2019 11:46:21 +0000")
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-2-eric.auger@redhat.com>
 <20191127114621.GG3016@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Wed, 08 Jan 2020 14:19:50 +0100
Message-ID: <87muaygk5l.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: dPd4s5tpM9q4Qwbr7LGL0A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 Eric Auger <eric.auger@redhat.com>, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HCdlNJNw9O74

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Eric Auger (eric.auger@redhat.com) wrote:
>> Support QLIST migration using the same principle as QTAILQ:
>> 94869d5c52 ("migration: migrate QTAILQ").
>>=20
>> The VMSTATE_QLIST_V macro has the same proto as VMSTATE_QTAILQ_V.
>> The change mainly resides in QLIST RAW macros: QLIST_RAW_INSERT_HEAD
>> and QLIST_RAW_REVERSE.
>>=20
>> Tests also are provided.
>>=20
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>=20
>> +    while (qemu_get_byte(f)) {
>> +        elm =3D g_malloc(size);
>> +        ret =3D vmstate_load_state(f, vmsd, elm, version_id);
>> +        if (ret) {
>> +            error_report("%s: failed to load %s (%d)", field->name,
>> +                         vmsd->name, ret);
>> +            g_free(elm);
>> +            return ret;
>> +        }
>> +        QLIST_RAW_INSERT_HEAD(pv, elm, entry_offset);
>> +    }
>> +    QLIST_RAW_REVERSE(pv, elm, entry_offset);
>
> Can you explain why you need to do a REVERSE on the loaded list,
> rather than using doing a QLIST_INSERT_AFTER to always insert at
> the end?
>
> Other than that it looks good.

This was my fault (integrated as this is).

Old code had a "walk to the end of the list" and then insert.
I told it was way faster just to insert and the beggining and then
reverse.  I didn't noticed that we had the previous element to know
where to insert.

Eric, feel free to send a patch on top of this, or I will do it.

Later, Juan.

