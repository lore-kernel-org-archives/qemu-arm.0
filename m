Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1882540ejc;
        Mon, 30 Oct 2023 06:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeqs5AD585SGkaA0ICY0zRD89XlXPknBYykyveSs2CHQWfLkLhxBhGcJf0zeBBuhoMNHW0
X-Received: by 2002:a05:6214:27ce:b0:671:b009:c5a with SMTP id ge14-20020a05621427ce00b00671b0090c5amr5073524qvb.48.1698673962133;
        Mon, 30 Oct 2023 06:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698673962; cv=none;
        d=google.com; s=arc-20160816;
        b=RqlmFJevNqwN59f7AyTissOCCR+3+MdIr+MyFiwZMKN89q3dDUNVV4i/M8kS8BB5ok
         HXCORxWQkTVtHhnZ05ynoRpsDIk38X33HiefoXxNDiWEYZuDUciM6yrkepZosZ6jiDx5
         GAW3D/EOyum5qNwayftoEoYRIWpLfc021+B8tkmCXNNwP3LnY+2sTuH6EmXLWkgNnqmC
         Fc5aYt38f4gqgkXMl2TgcQ/T7B2isO+bCORwMVdAtiGx/KxyQQcTDhxo121xE6fZ/rz+
         w9sAtZpwng6hVo0AUViX1JfLwGUohYxkzttADINfnNkfLg5BJXc6VVK/7aSwacBQTKeR
         hDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ynWj52tiXqEUO/Nu0NorCTULQBeZndq4FV0JsKudmdw=;
        fh=WDL/pWcR0szXhLY7B8Yaxwuxnvr/kQ0aELH3hc1USFY=;
        b=BPLAy9C6ajWcI4U8CjBqUKAjonba5K4xS/ejYWvofFXOIIv+T3xgE3W6Gw/tR+H9Qr
         a1XSllpCUEd/tNsa4e4zgCVKyIcBZW3xzyfRS3YGbzQRJ4LO2q1m7DBWfIAixKa3EyvZ
         XxdAFk5mC9zNvL6OqUeafmNYeBVizE3PlKN9EOKBln14FVpPeYuDh9x7rtC/01UWricW
         FcsZQ0gEIIMFjXOCGhLZfH7BMOvj369LMCN15+lAbI+JEpiKsdC5RgxlYg8noKTT55IY
         FqjdYpfM8nq+s3UEOhS1XQoM5xOKZxHHZEH0EOcZzDQ9V8XJK2nWZmRE7DgL+f2r5WbV
         mbMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWTF0HPx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020a05620a40d300b0077413e0f24bsi5976587qko.415.2023.10.30.06.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:52:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWTF0HPx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxSgx-0003e7-Fa; Mon, 30 Oct 2023 09:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxSgv-0003ar-SR
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:52:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxSgu-0000n5-0K
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:52:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso35376735e9.3
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 06:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698673946; x=1699278746; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ynWj52tiXqEUO/Nu0NorCTULQBeZndq4FV0JsKudmdw=;
 b=uWTF0HPx5mObG4OCd644As8R2pseDEi0vCJjrenHKpPn8p9wKdd4ufOe3oS0ek+YpS
 OEhBUwDouSK6Ixp8E2S2qaqT+JruhY6Vwo5iv6/HoPL3lM+V8wW7Ia087mdzEfEpGRNg
 YQ/hj6DE2qQlI+5OlT8f1DCnDyNZf2VQWqi8ZWf5WjTHYwF8gEPJX2OUB4Q5PT6C7WVs
 XYPX8v6Tn94sS2e6USgLlZQnuiRda9hhjwcFJkGwXTxVd3ly1mFr5BjOHkYGKolCVSFj
 UWBNaw9nKSVGbV5xghkhCmQtZ8RdSXIoZm9nV9yvTwcCuAltqbtkOQGqH9CbHyL/je6A
 oPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698673946; x=1699278746;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ynWj52tiXqEUO/Nu0NorCTULQBeZndq4FV0JsKudmdw=;
 b=PFtted9P+Ov62yYZMG1/44CEhxC8SSJvgWmrJwQvxnqp6pesgQNjHI8Gj/hWfngxhj
 cDOT7cl6ake3ZqmQvcwX18MiZ0qKDsa2k5OqIQ8t8YoUSOtLZycIjflzJlbfG/OTOPEY
 YbLZRh6Z3+YdPAOQdDkFl3bCkJNwvhhX0noTyNHgLdHZlHx1fT0ANxNjKSad2Mqo+C9r
 ChLVIo+oj137QeU+cNxuRC5p7eN0D4YJ4vsyAEyVg3WYgbgmboqRJb8CDPWZcGonJWhm
 GwZ5uGyhCMHaN17Dsux3htmMaRu6EysU0VM5Fv14oEb2jZ6d1iTDwIGUSexDfZ00X7H0
 L3gg==
X-Gm-Message-State: AOJu0YxVmiBUNoPxl3FZHOr+WywIJC/9yYlIN6SH41N0YdOC4OARrWQw
 0yYekyZkD0FwL8nM57rYGzh/DA==
X-Received: by 2002:a05:600c:5110:b0:405:34e4:14cf with SMTP id
 o16-20020a05600c511000b0040534e414cfmr8245662wms.4.1698673945990; 
 Mon, 30 Oct 2023 06:52:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c4ec700b004064ac107cfsm9422077wmq.39.2023.10.30.06.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 06:52:25 -0700 (PDT)
Message-ID: <edf24aec-59cf-d594-7bda-cef3c268a835@linaro.org>
Date: Mon, 30 Oct 2023 14:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 5/6] hw/input/stellaris_input: Convert to qdev
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231030114802.3671871-1-peter.maydell@linaro.org>
 <20231030114802.3671871-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231030114802.3671871-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.441,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mtLjYdRgoP9r

Hi Peter,

Cc'ing Markus for QObject.

On 30/10/23 12:48, Peter Maydell wrote:
> Convert the hw/input/stellaris_input device to qdev.
> 
> The interface uses an array property for the board to specify the
> keycodes to use, so the s->keycodes memory is now allocated by the
> array-property machinery.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> v1->v2: drop private/public comment lines
> ---
>   include/hw/input/stellaris_gamepad.h | 22 ++++++++-
>   hw/arm/stellaris.c                   | 26 +++++++---
>   hw/input/stellaris_gamepad.c         | 73 +++++++++++++++++++---------
>   3 files changed, 89 insertions(+), 32 deletions(-)


> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 96585dd7106..707b0dae375 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -31,6 +31,7 @@
>   #include "hw/timer/stellaris-gptm.h"
>   #include "hw/qdev-clock.h"
>   #include "qom/object.h"
> +#include "qapi/qmp/qlist.h"
>   
>   #define GPIO_A 0
>   #define GPIO_B 1
> @@ -1274,16 +1275,27 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>           sysbus_connect_irq(SYS_BUS_DEVICE(enet), 0, qdev_get_gpio_in(nvic, 42));
>       }
>       if (board->peripherals & BP_GAMEPAD) {
> -        qemu_irq gpad_irq[5];
> +        QList *gpad_keycode_list = qlist_new();

I'm trying to understand better qlist_new(), but unfortunately there
is not much documentation. Looking at how the allocated list was
released, I found use of g_autoptr in tests/unit/check-qobject.c,
so I tried:

            g_autoptr(QList) gpad_keycode_list = qlist_new();

But QEMU crashes elsewhere which seems unrelated:

* thread #2, stop reason = signal SIGABRT
   * frame #0: 0x8b1eb11c libsystem_kernel.dylib`__pthread_kill + 8
     frame #1: 0x8b222cc0 libsystem_pthread.dylib`pthread_kill + 288
     frame #2: 0x8b132a50 libsystem_c.dylib`abort + 180
     frame #3: 0x8b049b08 libsystem_malloc.dylib`malloc_vreport + 908
     frame #4: 0x8b06924c libsystem_malloc.dylib`malloc_zone_error + 104
     frame #5: 0x8b05b094 
libsystem_malloc.dylib`nanov2_guard_corruption_detected + 44
     frame #6: 0x8b05a2a8 
libsystem_malloc.dylib`nanov2_allocate_outlined + 404
     frame #7: 0x0201fdc0 libglib-2.0.0.dylib`g_malloc0 + 36
     frame #8: 0x02007718 libglib-2.0.0.dylib`g_hash_table_setup_storage 
+ 76
     frame #9: 0x020076b0 libglib-2.0.0.dylib`g_hash_table_new_full + 96
     frame #10: 0x003a9920 qemu-system-ppc`object_unref [inlined] 
object_property_del_all(obj=0x42023e00) at object.c:635:34
     frame #11: 0x003a9914 qemu-system-ppc`object_unref [inlined] 
object_finalize(data=0x42023e00) at object.c:707:5
     frame #12: 0x003a990c 
qemu-system-ppc`object_unref(objptr=0x42023e00) at object.c:1216:9
     frame #13: 0x00355114 qemu-system-ppc`address_space_dispatch_free 
at physmem.c:1001:9
     frame #14: 0x003550fc qemu-system-ppc`address_space_dispatch_free 
at physmem.c:1010:9
     frame #15: 0x003550e0 
qemu-system-ppc`address_space_dispatch_free(d=0x000060000385d680) at 
physmem.c:2473:5
     frame #16: 0x00349438 
qemu-system-ppc`flatview_destroy(view=0x000060000385d640) at memory.c:295:9
     frame #17: 0x00524920 
qemu-system-ppc`call_rcu_thread(opaque=<unavailable>) at rcu.c:301:13
     frame #18: 0x0051c1f0 
qemu-system-ppc`qemu_thread_start(args=<unavailable>) at 
qemu-thread-posix.c:541:9
     frame #19: 0x8b223034 libsystem_pthread.dylib`_pthread_start + 136

However when running 'make check-unit', qobject_is_equal_list_test()
is successful, so I'm a bit confused...

>           static const int gpad_keycode[5] = { 0xc8, 0xd0, 0xcb, 0xcd, 0x1d };
> +        DeviceState *gpad;
>   
> -        gpad_irq[0] = qemu_irq_invert(gpio_in[GPIO_E][0]); /* up */
> -        gpad_irq[1] = qemu_irq_invert(gpio_in[GPIO_E][1]); /* down */
> -        gpad_irq[2] = qemu_irq_invert(gpio_in[GPIO_E][2]); /* left */
> -        gpad_irq[3] = qemu_irq_invert(gpio_in[GPIO_E][3]); /* right */
> -        gpad_irq[4] = qemu_irq_invert(gpio_in[GPIO_F][1]); /* select */
> +        gpad = qdev_new(TYPE_STELLARIS_GAMEPAD);
> +        for (i = 0; i < ARRAY_SIZE(gpad_keycode); i++) {
> +            qlist_append_int(gpad_keycode_list, gpad_keycode[i]);
> +        }
> +        qdev_prop_set_array(gpad, "keycodes", gpad_keycode_list);
> +        sysbus_realize_and_unref(SYS_BUS_DEVICE(gpad), &error_fatal);
>   
> -        stellaris_gamepad_init(5, gpad_irq, gpad_keycode);
> +        qdev_connect_gpio_out(gpad, 0,
> +                              qemu_irq_invert(gpio_in[GPIO_E][0])); /* up */
> +        qdev_connect_gpio_out(gpad, 1,
> +                              qemu_irq_invert(gpio_in[GPIO_E][1])); /* down */
> +        qdev_connect_gpio_out(gpad, 2,
> +                              qemu_irq_invert(gpio_in[GPIO_E][2])); /* left */
> +        qdev_connect_gpio_out(gpad, 3,
> +                              qemu_irq_invert(gpio_in[GPIO_E][3])); /* right */
> +        qdev_connect_gpio_out(gpad, 4,
> +                              qemu_irq_invert(gpio_in[GPIO_F][1])); /* select */
>       }

