Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1041087ejb;
        Fri, 20 Oct 2023 00:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHNm++ytjD0xXt4uS7PVVUV1lB3HRM/M8jBUDasdhBLFe/qWz+qr9X8/xHR2GUZuB9PC49
X-Received: by 2002:a05:620a:46a4:b0:76f:1eac:e726 with SMTP id bq36-20020a05620a46a400b0076f1eace726mr1225664qkb.15.1697787086760;
        Fri, 20 Oct 2023 00:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697787086; cv=none;
        d=google.com; s=arc-20160816;
        b=b8yFIrZPeB72isV1aGcR6ge3Ym653GDMrOGF2nwoP8RVrUweELRiChuHI5LtgtLsYs
         isM5h/UAPPPijNPoHZ53BzrcuzF2n7Fz+BlgbKUi/XdabeGQeV3XFPwFiL/124AY888f
         +8pPbxlWbPc4OkSvOkzcWvjjAIzmsXsoz7L1PHPau+xmYa3geelou+Llj0HY7XIFTSkR
         TIryue5DROldvxD0Y+NqhwFF0XtMAAgH3dt3LaBftFCycvnUJ6i3G7H9Rzv+jz7g299Q
         mzRiteR38ISualsYjjuYKKvOeYNTWFRhSgwUPtQErrFuGM2y7iv494BtqO5dev4w69/h
         G4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=amJOxqJ+raTBxywBm3QL8jBcO8MOp3+kljTW/J9MJh0=;
        fh=38tbsy5dIgB7KIMLhzpYuIJbD6iFvOooSSD6dMI8z+o=;
        b=jwRZOIzMvdooJdVGr/+XDm7LJLzkdnXJ7bo13gd56hdMAWF55jI+SaoRlriZ+3pGwS
         lIg5vtwcIsbkWUVbCOcueQKYD38s0CyqNjl71/yHBaONIrYXV3ibevQWQKdvJYVF6HrQ
         0ubxX/OBwEhlrqEqI6aVB0ost8ERUNfASrr+yNtzpph8XRu/w3c1//Fvsy0RZo8s4EJ+
         5jmwSA5KjnHIGKrso+dPRmf6ziGka8mV1FLI2dHoVEepQ6CO6oI0TjOfzC7ZUXZm/T/b
         L3/Qx+0sTMXxdP0hdTji/4PKgAYqKIv1nm/bxHMzSv8NjpXjjgttq36NDP3OgtnvCKf8
         h4uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iXyHoSq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq34-20020a05620a46a200b0076d2a4328c6si905115qkb.298.2023.10.20.00.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 00:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iXyHoSq1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtjyE-0000nz-KS; Fri, 20 Oct 2023 03:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtjyD-0000nh-Jl
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 03:30:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtjyB-0006A0-5X
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 03:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697787054;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=amJOxqJ+raTBxywBm3QL8jBcO8MOp3+kljTW/J9MJh0=;
 b=iXyHoSq14DU2deW2iNatdGwPY63GVoP/e/8CvzQcMK1sPSi2yKpnDJ3YRWsai5KYOZOTX7
 G52iIeIhes2Sn+RSr7IlQDj3t1vLmp5G8cto3HFVloxNiYGBE8EBJDc05JT17E35R+eYqD
 HN+DpGzd08BsRTeE7nB8xzIl5Y1DXnE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-frXWk24JO3qBT7CququESg-1; Fri, 20 Oct 2023 03:30:47 -0400
X-MC-Unique: frXWk24JO3qBT7CququESg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3231fceb811so279224f8f.2
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 00:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697787046; x=1698391846;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=amJOxqJ+raTBxywBm3QL8jBcO8MOp3+kljTW/J9MJh0=;
 b=hezqo4mdOuv/FcD3z8nj/uA0TC92flqyJiEgj98bZjmi0HKEk/qzVKB+5drNm53Hj0
 ldkqIQdWJwpOnv+RwHhypY60QH2bTJG2vQZP3IpaWU045alOTPi0U5+3DpL3XJcWR5iJ
 T4e2zb7l98HH22ohhQok2U1wopBFPehei5cReVXgnwN4xYZA+uZCOaXc+PccVh8dtjEI
 t5vbHOgyJfB14bKn501sTLiNo0l0auQAaRF/rDOQDzyWC0V01DtgKGM3S0qVkgGD6aqj
 QDRPW9whbU0FGL7AV4RN4l2KKOfN7LtE9R/sF+Vy/Z/6lMQX7hly5PhKk/ve9BiZkaDs
 eEjA==
X-Gm-Message-State: AOJu0Yw6G7g92mySXwssjFGv6uRiRfmXliQd5zvmTFISWkPk4Z460pty
 iU6FvhEylZN6CYr8h9dDhEwapKLRU+y0fOQzaOPadzJ3RBdaL54yf0Iluxu+DCZSKUOdoH29dPe
 ElnNnyUu9HNoz
X-Received: by 2002:adf:ea4a:0:b0:317:50b7:2ce3 with SMTP id
 j10-20020adfea4a000000b0031750b72ce3mr631591wrn.51.1697787046218; 
 Fri, 20 Oct 2023 00:30:46 -0700 (PDT)
X-Received: by 2002:adf:ea4a:0:b0:317:50b7:2ce3 with SMTP id
 j10-20020adfea4a000000b0031750b72ce3mr631565wrn.51.1697787045842; 
 Fri, 20 Oct 2023 00:30:45 -0700 (PDT)
Received: from redhat.com (static-151-150-85-188.ipcom.comunitel.net.
 [188.85.150.151]) by smtp.gmail.com with ESMTPSA id
 r3-20020adff103000000b0032d9337e7d1sm1081841wro.11.2023.10.20.00.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 00:30:45 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: <qemu-devel@nongnu.org>,  Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  <qemu-ppc@nongnu.org>,
 Nicholas Piggin <npiggin@gmail.com>,  <qemu-s390x@nongnu.org>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Corey Minyard <cminyard@mvista.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  David Hildenbrand <david@redhat.com>,
 "Ilya Leoshkevich" <iii@linux.ibm.com>,  Fabiano Rosas <farosas@suse.de>,
 "Eric Farman" <farman@linux.ibm.com>,  Peter Xu <peterx@redhat.com>,
 "Harsh Prateek Bora" <harshpb@linux.ibm.com>,  John Snow
 <jsnow@redhat.com>,  <qemu-block@nongnu.org>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Stefan Weil <sw@weilnetz.de>,
 <qemu-arm@nongnu.org>,  Jason Wang <jasowang@redhat.com>,  Corey Minyard
 <minyard@acm.org>,  Leonardo Bras <leobras@redhat.com>,  "Thomas Huth"
 <thuth@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  "Michael
 S. Tsirkin" <mst@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  David
 Gibson <david@gibson.dropbear.id.au>,  Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 07/13] RFC migration: icp/server is a mess
In-Reply-To: <20231019233958.17abb488@bahia> (Greg Kurz's message of "Thu, 19
 Oct 2023 23:39:58 +0200")
References: <20231019190831.20363-1-quintela@redhat.com>
 <20231019190831.20363-8-quintela@redhat.com>
 <20231019233958.17abb488@bahia>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Date: Fri, 20 Oct 2023 09:30:44 +0200
Message-ID: <875y313g4b.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cW3pgfXjZI86

Greg Kurz <groug@kaod.org> wrote:
> On Thu, 19 Oct 2023 21:08:25 +0200
> Juan Quintela <quintela@redhat.com> wrote:
>
>> Current code does:
>> - register pre_2_10_vmstate_dummy_icp with "icp/server" and instance
>>   dependinfg on cpu number
>> - for newer machines, it register vmstate_icp with "icp/server" name
>>   and instance 0
>> - now it unregisters "icp/server" for the 1st instance.
>> 
>> This is wrong at many levels:
>> - we shouldn't have two VMSTATEDescriptions with the same name
>> - In case this is the only solution that we can came with, it needs to
>>   be:
>>   * register pre_2_10_vmstate_dummy_icp
>>   * unregister pre_2_10_vmstate_dummy_icp
>>   * register real vmstate_icp
>> 
>> As the initialization of this machine is already complex enough, I
>> need help from PPC maintainers to fix this.
>> 
>> Volunteers?
>> 
>> CC: Cedric Le Goater <clg@kaod.org>
>> CC: Daniel Henrique Barboza <danielhb413@gmail.com>
>> CC: David Gibson <david@gibson.dropbear.id.au>
>> CC: Greg Kurz <groug@kaod.org>
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  hw/ppc/spapr.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>> 
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index cb840676d3..8531d13492 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -143,7 +143,12 @@ static bool pre_2_10_vmstate_dummy_icp_needed(void *opaque)
>>  }
>>  
>>  static const VMStateDescription pre_2_10_vmstate_dummy_icp = {
>> -    .name = "icp/server",
>> +    /*
>> +     * Hack ahead.  We can't have two devices with the same name and
>> +     * instance id.  So I rename this to pass make check.
>> +     * Real help from people who knows the hardware is needed.
>> +     */
>> +    .name = "pre-2.10-icp/server",
>>      .version_id = 1,
>>      .minimum_version_id = 1,
>>      .needed = pre_2_10_vmstate_dummy_icp_needed,
>
> I guess this fix is acceptable as well and a lot simpler than
> reverting the hack actually. Outcome is the same : drop
> compat with pseries-2.9 and older.
>
> Reviewed-by: Greg Kurz <groug@kaod.org>

I fully agree with you here.
The other options given on this thread is deprecate that machines, but I
would like to have this series sooner than 2 releases.  And what ppc is
doing here is (and has always been) a hack and an abuse about how
vmstate registrations is supposed to work.

Thanks, Juan.

