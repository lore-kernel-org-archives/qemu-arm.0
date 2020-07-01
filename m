Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp202486lfm;
        Wed, 1 Jul 2020 00:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6TGD4JgJ24IJPAHPOTopQkAID31tvrDljtl3a2WF2c/8rBFZIkzK0bJbmZOAqJMlRx39T
X-Received: by 2002:a25:24cb:: with SMTP id k194mr40183413ybk.81.1593588294237;
        Wed, 01 Jul 2020 00:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593588294; cv=none;
        d=google.com; s=arc-20160816;
        b=hMjq7mP4ttyURwKhELgyr4i7yykjS3sUCpA0h6u1yAB1zXzFe4X3UORKNTSxwId+jK
         xWyimSM+2/TMFG83gtalm1w/5uCUHRe1OtXSzCB9sEMs6KPihtbmlb44aS5HW2m4x82A
         0XsaIUts+N00igTml9IAsd0bO9pBUHcZVFVoB7JVgv0xDrmyRYijiVit0QNgMW0A7B8G
         bf8y5Ab/39h8xGPCWlpC8SQcejkfphuc3wdwFy7sxfCksSaEcbXO4VusAinuIb6P5AHN
         G+nzqHjF5a1g1X24VwP0DS0lJw6LPoHYlKf09SFQGNxmeBd2W8SUFC3iQkqg3aG8yjyE
         YKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=6NGbLPSGzlX9KxhD31PWetFn9mttU3V+FbD7IH0c8gE=;
        b=rw9E5kMOAGJAU8UUeL6he670uyIRUIxd4kReQ4ydZQ+C626bDz2VX25dYTA6Hp2J17
         vaUouHuOqIf3XhZ/dnsoLYqCS4Zr7joCo+W0IaTgWQxiYM6ziekYvAOTemuf81JCCEXR
         F3i27cJZfXMDsFpeHsCRRJgdO2GkUFFs6yfNuTwH55oMuR5D80w2zwzoexDN2ujDvYPJ
         v3n/1tQ4lDSDrAE4h2tVTo3N8EQ1JhNv9j0pB+L/jXIHdI+hqgK3CwAn3ttwn1rwr+Gk
         KGteTaRZMrAgJZuiVMJ5ycJk83cbYFE26YkEVsSwLAQBZWX+yDXpO+AWxG50bB9wqizG
         xwLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ilHW93dQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si4990558ybo.273.2020.07.01.00.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jul 2020 00:24:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ilHW93dQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqX6z-0004Pf-Kr
	for alex.bennee@linaro.org; Wed, 01 Jul 2020 03:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqX6q-0004Lk-8x
 for qemu-arm@nongnu.org; Wed, 01 Jul 2020 03:24:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33451
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqX6m-0001j9-MM
 for qemu-arm@nongnu.org; Wed, 01 Jul 2020 03:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593588279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NGbLPSGzlX9KxhD31PWetFn9mttU3V+FbD7IH0c8gE=;
 b=ilHW93dQA0UuYbGFSKSycKrGtg3hvkQB2ZO42AxqVMwTnyGE8waGRQdemK7lWQFd9D/mjI
 iDojSyg0/Ien6kCGyPOPFIEsZkoKgXk4UbwJPQN586RYv1fPQRgVYhyl62ym2Ql4nXofOj
 IdWgTXtPsr0T5RYu9qYoq2bIy8egPZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-stIJLYXhN7OG0S8gg5Ju_w-1; Wed, 01 Jul 2020 03:24:37 -0400
X-MC-Unique: stIJLYXhN7OG0S8gg5Ju_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CD8484E248;
 Wed,  1 Jul 2020 07:24:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B95B2B47C;
 Wed,  1 Jul 2020 07:24:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8FEE311384A6; Wed,  1 Jul 2020 09:24:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 22/26] arm/stm32f205 arm/stm32f405: Fix realize error
 API violation
References: <20200630090351.1247703-1-armbru@redhat.com>
 <20200630090351.1247703-23-armbru@redhat.com>
 <1c6d230c-cddb-9859-0a53-723db7c52e0f@amsat.org>
Date: Wed, 01 Jul 2020 09:24:28 +0200
In-Reply-To: <1c6d230c-cddb-9859-0a53-723db7c52e0f@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 30 Jun 2020 11:14:47
 +0200")
Message-ID: <87r1tvbsur.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 01:29:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EdQcpRY07GyU

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 6/30/20 11:03 AM, Markus Armbruster wrote:
>> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
>> pointer to a variable containing NULL.  Passing an argument of the
>> latter kind twice without clearing it in between is wrong: if the
>> first call sets an error, it no longer points to NULL for the second
>> call.
>>=20
>> stm32f205_soc_realize() and stm32f405_soc_realize() are wrong that
>> way: they pass &err to object_property_set_int() without checking it,
>> and then to qdev_realize().  Harmless, because the former can't
>> actually fail here.
>>=20
>> Fix by passing &error_abort instead.
>>=20
>> Cc: Alistair Francis <alistair@alistair23.me>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  hw/arm/stm32f205_soc.c | 2 +-
>>  hw/arm/stm32f405_soc.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
>> index 19487544f0..56aef686c9 100644
>> --- a/hw/arm/stm32f205_soc.c
>> +++ b/hw/arm/stm32f205_soc.c
>> @@ -154,7 +154,7 @@ static void stm32f205_soc_realize(DeviceState *dev_s=
oc, Error **errp)
>> =20
>>      /* ADC 1 to 3 */
>>      object_property_set_int(OBJECT(s->adc_irqs), STM_NUM_ADCS,
>> -                            "num-lines", &err);
>> +                            "num-lines", &error_abort);
>>      qdev_realize(DEVICE(s->adc_irqs), NULL, &err);
>
> qdev_realize() coult take &error_abort too then.

Think so.  I went for the minimal patch.

> Anyway:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks!

>>      if (err !=3D NULL) {
>>          error_propagate(errp, err);
>> diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
>> index c12d9f999d..cf9228d8e7 100644
>> --- a/hw/arm/stm32f405_soc.c
>> +++ b/hw/arm/stm32f405_soc.c
>> @@ -172,7 +172,7 @@ static void stm32f405_soc_realize(DeviceState *dev_s=
oc, Error **errp)
>>          return;
>>      }
>>      object_property_set_int(OBJECT(&s->adc_irqs), STM_NUM_ADCS,
>> -                            "num-lines", &err);
>> +                            "num-lines", &error_abort);
>>      qdev_realize(DEVICE(&s->adc_irqs), NULL, &err);
>>      if (err !=3D NULL) {
>>          error_propagate(errp, err);
>>=20

