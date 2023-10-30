Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1905823ejc;
        Mon, 30 Oct 2023 07:25:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFot+EMxS3Hzt28whuFyLynNK6KNcjRTbCkoKMYSPXhufAUaPqMDxT2AgVqA+vnPCBe4Hv2
X-Received: by 2002:a05:620a:2a01:b0:76c:b7f0:2bc9 with SMTP id o1-20020a05620a2a0100b0076cb7f02bc9mr14893075qkp.16.1698675933335;
        Mon, 30 Oct 2023 07:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698675933; cv=none;
        d=google.com; s=arc-20160816;
        b=ifbjS9KyBtAaOAL4P9DCjHlnQwfNJdX/tpiUX4kd7Ye2dRHRZJK2M93BoI2HmBbi26
         4mfCVb2DAKeQLDGcVaqJAeEiRUpHn07WZ+smRPFZIJ/dTqG8UAgF4+xsBxzCLRwUOaVg
         Sy0E86M2VYFqhsETquSCUAZwLqVZ/AQySKKHKJmzvaRMamOhfIVL8VGRVe7UcT4OAkfd
         FiAX84v59QCyfuIkp2XwemUSVSejRlGVt5DaPbPbzgxfl6/tuU2p1w5EhGrGN/gskkcj
         R5Lg3ztNwrXryb7GZYIWCGuLg5NB4MkxTwiUIboiCABP7Y859Um0CXzrnT086PpeLL1m
         9ufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=nSIm+xy18eZ0sK8H4uKlzHn1rwtN98dl6uA4rXP3aa4=;
        fh=2ipoTlA8tvzyRbGCeci9XXv4lYL45ySsxipPhy/7rFQ=;
        b=LL7FUBZMpWNu2E9RGiAaegaITy7vIl17516qMf20LhPgh4kp3gDursi+rJR1b7ld0I
         0voDVQZB8IzSL1mWmnac3jtBPFDk4OcVGz5cqMQ6lXTrD6z3n/ajQ2ykRLQ3+kHD/4+s
         ThPJs9BK37MW442uT6mOHzIl/BS3rfCdMYHjQ40lKHyDbtcoJ49ERXatZOmkmwbSl8D7
         z7cmRZgY6ZtOU3B2vwB8OUogTm2bGonKpDKa/ljNWJJVp0pV1brExFRVQ+s1zNfgb8iX
         B49IQfog3gUdVqxSlCUvUhXMV3XMbVThPGWGDwb/MOUAz6JIaDsDcSesoIH4bd5nueZB
         Z45w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vef7YZqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e30-20020a05620a209e00b007788b96f13esi5401175qka.515.2023.10.30.07.25.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 07:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vef7YZqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxTCh-00059u-Ed; Mon, 30 Oct 2023 10:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qxTCe-00059R-Dh
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 10:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qxTCX-0006qG-UK
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 10:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698675909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nSIm+xy18eZ0sK8H4uKlzHn1rwtN98dl6uA4rXP3aa4=;
 b=Vef7YZqIMW/dlqjiR+ZO36LQrYnlbsFGp1N1jXi/5lWAD2MbB8NfAwD2Zq3vTZPEye4ngW
 HqhtBUvL2z/pzv2eGW6tX4aStayX4RT5a7M/2MTCVGbhXkxcePVbiyppOoVphTmx132L+K
 DJDXObZdMu0f1EJX6IgEHDaokdpZXDs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-247-HShPKYc9PdCeCm3NGR3gpQ-1; Mon,
 30 Oct 2023 10:25:03 -0400
X-MC-Unique: HShPKYc9PdCeCm3NGR3gpQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6536F1C05AAE;
 Mon, 30 Oct 2023 14:25:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E162492BE0;
 Mon, 30 Oct 2023 14:25:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 29F9D21E6A1F; Mon, 30 Oct 2023 15:25:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Markus Armbruster
 <armbru@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 5/6] hw/input/stellaris_input: Convert to qdev
References: <20231030114802.3671871-1-peter.maydell@linaro.org>
 <20231030114802.3671871-6-peter.maydell@linaro.org>
 <edf24aec-59cf-d594-7bda-cef3c268a835@linaro.org>
Date: Mon, 30 Oct 2023 15:25:02 +0100
In-Reply-To: <edf24aec-59cf-d594-7bda-cef3c268a835@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 30 Oct 2023 14:52:24
 +0100")
Message-ID: <87jzr4p4qp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.483,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BTGJAtz/S8UL

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Peter,
>
> Cc'ing Markus for QObject.
>
> On 30/10/23 12:48, Peter Maydell wrote:
>> Convert the hw/input/stellaris_input device to qdev.
>> The interface uses an array property for the board to specify the
>> keycodes to use, so the s->keycodes memory is now allocated by the
>> array-property machinery.
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> ---
>> v1->v2: drop private/public comment lines
>> ---
>>   include/hw/input/stellaris_gamepad.h | 22 ++++++++-
>>   hw/arm/stellaris.c                   | 26 +++++++---
>>   hw/input/stellaris_gamepad.c         | 73 +++++++++++++++++++---------
>>   3 files changed, 89 insertions(+), 32 deletions(-)
>
>
>> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
>> index 96585dd7106..707b0dae375 100644
>> --- a/hw/arm/stellaris.c
>> +++ b/hw/arm/stellaris.c
>> @@ -31,6 +31,7 @@
>>   #include "hw/timer/stellaris-gptm.h"
>>   #include "hw/qdev-clock.h"
>>   #include "qom/object.h"
>> +#include "qapi/qmp/qlist.h"
>>     #define GPIO_A 0
>>   #define GPIO_B 1
>> @@ -1274,16 +1275,27 @@ static void stellaris_init(MachineState *ms, ste=
llaris_board_info *board)
>>           sysbus_connect_irq(SYS_BUS_DEVICE(enet), 0, qdev_get_gpio_in(n=
vic, 42));
>>       }
>>       if (board->peripherals & BP_GAMEPAD) {
>> -        qemu_irq gpad_irq[5];
>> +        QList *gpad_keycode_list =3D qlist_new();
>
> I'm trying to understand better qlist_new(), but unfortunately there
> is not much documentation. Looking at how the allocated list was
> released, I found use of g_autoptr in tests/unit/check-qobject.c,
> so I tried:
>
>            g_autoptr(QList) gpad_keycode_list =3D qlist_new();

QObject and its subtypes QDict, QList, QString, ... are reference
counted.  qFOO_new() ist to be paired with qFOO_unref() or
qobject_unref().

Your use of g_autoptr(QList) should work.

> But QEMU crashes elsewhere which seems unrelated:
>
> * thread #2, stop reason =3D signal SIGABRT
>   * frame #0: 0x8b1eb11c libsystem_kernel.dylib`__pthread_kill + 8
>     frame #1: 0x8b222cc0 libsystem_pthread.dylib`pthread_kill + 288
>     frame #2: 0x8b132a50 libsystem_c.dylib`abort + 180
>     frame #3: 0x8b049b08 libsystem_malloc.dylib`malloc_vreport + 908
>     frame #4: 0x8b06924c libsystem_malloc.dylib`malloc_zone_error + 104
>     frame #5: 0x8b05b094 libsystem_malloc.dylib`nanov2_guard_corruption_d=
etected + 44
>     frame #6: 0x8b05a2a8 libsystem_malloc.dylib`nanov2_allocate_outlined =
+ 404
>     frame #7: 0x0201fdc0 libglib-2.0.0.dylib`g_malloc0 + 36
>     frame #8: 0x02007718 libglib-2.0.0.dylib`g_hash_table_setup_storage +=
 76
>     frame #9: 0x020076b0 libglib-2.0.0.dylib`g_hash_table_new_full + 96
>     frame #10: 0x003a9920 qemu-system-ppc`object_unref [inlined] object_p=
roperty_del_all(obj=3D0x42023e00) at object.c:635:34
>     frame #11: 0x003a9914 qemu-system-ppc`object_unref [inlined] object_f=
inalize(data=3D0x42023e00) at object.c:707:5
>     frame #12: 0x003a990c qemu-system-ppc`object_unref(objptr=3D0x42023e0=
0) at object.c:1216:9
>     frame #13: 0x00355114 qemu-system-ppc`address_space_dispatch_free at =
physmem.c:1001:9
>     frame #14: 0x003550fc qemu-system-ppc`address_space_dispatch_free at =
physmem.c:1010:9
>     frame #15: 0x003550e0 qemu-system-ppc`address_space_dispatch_free(d=
=3D0x000060000385d680) at physmem.c:2473:5
>     frame #16: 0x00349438 qemu-system-ppc`flatview_destroy(view=3D0x00006=
0000385d640) at memory.c:295:9
>     frame #17: 0x00524920 qemu-system-ppc`call_rcu_thread(opaque=3D<unava=
ilable>) at rcu.c:301:13
>     frame #18: 0x0051c1f0 qemu-system-ppc`qemu_thread_start(args=3D<unava=
ilable>) at qemu-thread-posix.c:541:9
>     frame #19: 0x8b223034 libsystem_pthread.dylib`_pthread_start + 136

Can't see QList or QObject in this backtrace.  object_unref() is QOM,
not QObject.

> However when running 'make check-unit', qobject_is_equal_list_test()
> is successful, so I'm a bit confused...
>
>>           static const int gpad_keycode[5] =3D { 0xc8, 0xd0, 0xcb, 0xcd,=
 0x1d };
>> +        DeviceState *gpad;
>>   -        gpad_irq[0] =3D qemu_irq_invert(gpio_in[GPIO_E][0]); /* up */
>> -        gpad_irq[1] =3D qemu_irq_invert(gpio_in[GPIO_E][1]); /* down */
>> -        gpad_irq[2] =3D qemu_irq_invert(gpio_in[GPIO_E][2]); /* left */
>> -        gpad_irq[3] =3D qemu_irq_invert(gpio_in[GPIO_E][3]); /* right */
>> -        gpad_irq[4] =3D qemu_irq_invert(gpio_in[GPIO_F][1]); /* select =
*/
>> +        gpad =3D qdev_new(TYPE_STELLARIS_GAMEPAD);
>> +        for (i =3D 0; i < ARRAY_SIZE(gpad_keycode); i++) {
>> +            qlist_append_int(gpad_keycode_list, gpad_keycode[i]);
>> +        }
>> +        qdev_prop_set_array(gpad, "keycodes", gpad_keycode_list);
>> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(gpad), &error_fatal);
>>   -        stellaris_gamepad_init(5, gpad_irq, gpad_keycode);
>> +        qdev_connect_gpio_out(gpad, 0,
>> +                              qemu_irq_invert(gpio_in[GPIO_E][0])); /* =
up */
>> +        qdev_connect_gpio_out(gpad, 1,
>> +                              qemu_irq_invert(gpio_in[GPIO_E][1])); /* =
down */
>> +        qdev_connect_gpio_out(gpad, 2,
>> +                              qemu_irq_invert(gpio_in[GPIO_E][2])); /* =
left */
>> +        qdev_connect_gpio_out(gpad, 3,
>> +                              qemu_irq_invert(gpio_in[GPIO_E][3])); /* =
right */
>> +        qdev_connect_gpio_out(gpad, 4,
>> +                              qemu_irq_invert(gpio_in[GPIO_F][1])); /* =
select */
>>       }

