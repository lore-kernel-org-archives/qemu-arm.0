Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp968228lfo;
        Fri, 29 Jan 2021 01:28:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD+LY1UhCcU6L0mjLAu//LygdqvEqWp7Uq2218EC23nV0s6NlsPjJ3z1nZvZTFfqlrumFz
X-Received: by 2002:a25:1241:: with SMTP id 62mr4979862ybs.366.1611912508981;
        Fri, 29 Jan 2021 01:28:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611912508; cv=none;
        d=google.com; s=arc-20160816;
        b=a3wSpudi6gIDHFBWfZh/hWXBIOE+gocW2VOQkAPmjf037Uq/Y/L53tCBe7MSThOuKk
         JuL4a37ClzmjmU2k0QG2uwA+4JpgoHOTDTTa6crBbAyazig5dGziqMbSeucg5CTEXIBJ
         1QfMZ1Xwd50gN+BPwVInu2ZJAN6vEeAzjotm9EAJmbFOE4uIi7vZrbFZpcdvMZudW3Zc
         A+LaFD/Ockbj7M42EVOyqqvB4H87YTt0VQjd2Qpr3QTfi+oLl6ResfWLeN8zmGyZnrqM
         JY1PTLmhdltNAdwATrJjWZ1wAF7HMarZW4+7B/zhSKAgwXooDPxb+d20cqzi8i62l+a+
         ci7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=/yz8EbxTd6P8o5Z3b4wxCqcLdps47THMx0uujj+aREc=;
        b=ihDgu23X9NYB0yLfN+8HAlaDJ1EtFApxcjiIYxOf4/73oikq/Uc+or7Nl2olhke5n6
         HIo4PTytceGtMUNo8txVBmYwvIJ92SmprfuqgKxvA+Jap8oMteYLQPw2t/Zxsi7dkWie
         piy5uLtiEZz0Sh11pFayjsmRHFtaA2i07T6RtWkl2cqYoys7/QHLUgSsz58LJzdoDGob
         Hx+2aS2y9HEYbbFvKKrBrPWeMq40NEdZ9gwkvWYGj1QrlUpN7r5XVRA0xdsn+Y3ulhCH
         lkjMpcLX2hEKoWe36/6ySlv/tOBKLwwbvihgoypwYMzqIYJBDMzGJ/qxZaN3tpV6UHGN
         xoow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LwnvXUTq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n128si8856814ybf.370.2021.01.29.01.28.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 01:28:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LwnvXUTq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Q4q-00054U-DN
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 04:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5Pvn-00089d-3A
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:19:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5Pvl-0004w1-ME
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611911945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/yz8EbxTd6P8o5Z3b4wxCqcLdps47THMx0uujj+aREc=;
 b=LwnvXUTqVqbESKNhvR+fqfyt+XEwByeGbGKdRA1ZTriqpSTTfS/lUWlFNmTTBDBc4Q6i9m
 MBF2lI+Lh4exyQ+jyQN8T/laI2dvaIdZJhDlWTt2FsFNflnG+shM9xIqrnNUMETtgvALQp
 GnqWAdv/OJSFF+PPV1oyyhJgHoaJ+Cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-RThDdCvNMCqmVKvhQpDu7w-1; Fri, 29 Jan 2021 04:19:01 -0500
X-MC-Unique: RThDdCvNMCqmVKvhQpDu7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D80D1922961;
 Fri, 29 Jan 2021 09:18:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 055C66268B;
 Fri, 29 Jan 2021 09:18:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 91E4D113865F; Fri, 29 Jan 2021 10:18:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH RFC 1/1] hw: Replace anti-social QOM type names
References: <20210129081519.3848145-1-armbru@redhat.com>
 <20210129081519.3848145-2-armbru@redhat.com>
 <6d69c392-1c53-cc35-d504-0ada33ca37c5@redhat.com>
Date: Fri, 29 Jan 2021 10:18:48 +0100
In-Reply-To: <6d69c392-1c53-cc35-d504-0ada33ca37c5@redhat.com> (Paolo
 Bonzini's message of "Fri, 29 Jan 2021 10:06:20 +0100")
Message-ID: <87pn1o2j9j.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, frederic.konrad@adacore.com, kraxel@redhat.com,
 edgar.iglesias@gmail.com, mreitz@redhat.com, qemu-block@nongnu.org,
 quintela@redhat.com, andrew.smirnov@gmail.com, marcandre.lureau@redhat.com,
 atar4qemu@gmail.com, ehabkost@redhat.com, alistair@alistair23.me,
 dgilbert@redhat.com, chouteau@adacore.com, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, jsnow@redhat.com, kwolf@redhat.com,
 berrange@redhat.com, jcd@tribudubois.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: caQBDoIriUEd

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 29/01/21 09:15, Markus Armbruster wrote:
>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>> index 7fc547c62d..0dd158bf73 100644
>> --- a/hw/block/fdc.c
>> +++ b/hw/block/fdc.c
>> @@ -2547,7 +2547,7 @@ void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
>>      DeviceState *dev;
>>      FDCtrlSysBus *sys;
>>  -    dev = qdev_new("SUNW,fdtwo");
>> +    dev = qdev_new("SUNW-fdtwo");
>>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>      sys = SYSBUS_FDC(dev);
>>      sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);
>
>
> Missing:
>
>         fdc_name = object_get_typename(OBJECT(fdc_dev));
>         drive_suffix = !strcmp(fdc_name, "SUNW,fdtwo") ? "" : i ? "B"
>         : "A";
>         warn_report("warning: property %s.drive%s is deprecated",
>                     fdc_name, drive_suffix);
>         error_printf("Use -device floppy,unit=%d,drive=... instead.\n", i);

You're right.  I based on my "[PATCH 0/3] Drop deprecated floppy config
& bogus -drive if=T", where this is gone, then forgot to mention it in
my cover letter.  Apologies!

