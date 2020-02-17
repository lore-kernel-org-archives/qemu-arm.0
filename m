Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4884475lfp;
        Mon, 17 Feb 2020 01:45:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqwc49pmuO8uK5mX9obwulW44WENsmlylPjifYtBTfzs/32qzs3V6OJJl6gNKyTLL3USOlZu
X-Received: by 2002:ac8:6645:: with SMTP id j5mr12677510qtp.167.1581932739627;
        Mon, 17 Feb 2020 01:45:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581932739; cv=none;
        d=google.com; s=arc-20160816;
        b=w7Q1qzB14yx8ifeh3vTtJjFLCzj+JMkAcul5ymPOyn+UIx1EfXmViO0D8NqhwYYgJy
         VOf+nDUduY912S3X6DDQE3dffTr8ZCy/7mGeYUZhwLnzsZjfyE93OnNJl4jfCFlRpFBA
         FsUIUQr91FYqAlVJH1cgQBe1w3b4NJPpGqYG5zEyfKOfxbMb7yAWahPS4NwqVg0/Q/tm
         dZV40pAdvyLGakEWf28yIkehKA97bgzqSImyt+WmWBEgj9NQApU/NSzS6zRbo1XwwYT7
         T05Gkk9rw3RNRBUUE+j0C19jVm3I6PTrmKs2G7o4f8VcGmg/oy1zDoYCn2vV11DNPRmT
         GINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=E/fulFHrafqGq2n0MCIzj3y8MCjcVkLWUrr6GE47ebM=;
        b=JCy2lKEZVKC3T6xKpujEMIy4KI6cuzBNtEEKpMZLiBqI4htDFG14D/aBEkB6JK//IV
         qNMGg2mOh9niGWAc8OUlgpbE5Lv0CDktAI+k0qCSn0uPKNutKqJE7+sfaMMxBP/PtHEV
         d7hK8rKqaslCZYRFludWhtPILr2MVQT1mMe7MoruUw9qsdcdJnbEFewhUegTJibp7T/C
         ttqgfoDvqApLQrZBm0Bfi2LBXHja0TiDh+qj3EgZwrTa3IoY5tHvCua1MwZuY+/sAHu+
         TT5BbFNeSmuZfEZ3w0YddVM9iDTH1sd7eNLQuzawXmlHBFFJ7DbMOOGfBbjh8n3dvpMC
         T3EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hUkEIMRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si49419qkn.19.2020.02.17.01.45.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 01:45:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hUkEIMRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3cyB-0006fR-3j
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 04:45:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3cxm-0006T7-M1
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 04:45:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3cxl-00065g-AX
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 04:45:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47089
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3cxl-00064V-6p
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 04:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581932712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/fulFHrafqGq2n0MCIzj3y8MCjcVkLWUrr6GE47ebM=;
 b=hUkEIMRZ174Z3NrkQDpOd6U+JSy8YUtgsGx1gKQ12qCjgOoEwJupREan5T1jEtJglYGWXO
 cY3mEPyKX4Zq/3e8y1/dzIR3AVV5VvvFss25jjEKURK7RWTFkqX4EhDzQFvEkVLRi/kueA
 vCp1TrF/twbMsUkQZij26QEsYIs2WVY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-nEIZfsfJMTqAVUJ3PteX5g-1; Mon, 17 Feb 2020 04:45:11 -0500
Received: by mail-wm1-f72.google.com with SMTP id z7so6781143wmi.0
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 01:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+7hc+vITPTYEl7pL1mRIzG8mgOlv43afEzF0950NGHk=;
 b=Ji7cXaFGUs1VvAbTdZWkNt7jD5+6UfDazhPub4I6SYiwAm3hyI1ItUea5RT3nw1XyA
 34iGOq5BwnLc0wmvD1oGxoJZqp7jSrLxLx2r0KJra6pB9UOs/VYz/B/Dsr2MyqPPLir4
 +0KaJhVio/Cv0LeEC/902x/0fRul/70btptQvWi/h7CwN2M6/Wh39XSTooF9cRe/Xn3a
 1nPNQNsHl6ubk29gS6mk09YRVlE9tiYRKVrCA6PIabqG5wo/DK18vbYjaLf0/8zyAWDo
 eI8vivdGAaFlmB6eI2bL26nKD4PQkvw8TsWq0JO5ZxRevq1BIAdWRB0YDuY8Je+8R1gT
 oIBQ==
X-Gm-Message-State: APjAAAWDnagSTh7AZ9uB2E5JXRqzX0mt4Dnkm0Z8NpllTrmbzTee3suj
 pgjeZeuUpfHbDme0xwR0YKWl8IwwJL6QGeJKcboHqr07wszhCVCBwwViglel3WA5OBy3WGMtuHX
 jKJfT4hpMY9BM
X-Received: by 2002:adf:de86:: with SMTP id w6mr22000402wrl.115.1581932709740; 
 Mon, 17 Feb 2020 01:45:09 -0800 (PST)
X-Received: by 2002:adf:de86:: with SMTP id w6mr22000366wrl.115.1581932709526; 
 Mon, 17 Feb 2020 01:45:09 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id 18sm20105851wmf.1.2020.02.17.01.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 01:45:09 -0800 (PST)
Subject: Re: [PATCH v2 1/2] s390x: fix memleaks in cpu_finalize
To: pannengyuan@huawei.com, balrogg@gmail.com, peter.maydell@linaro.org,
 mav2-rk.cave-ayland@ilande.co.uk, david@gibson.dropbear.id.au,
 edgar.iglesias@gmail.com, alistair@alistair23.me
References: <20200217032127.46508-1-pannengyuan@huawei.com>
 <20200217032127.46508-2-pannengyuan@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <60b21fff-e6f4-93f7-ca7d-4f2ef6388870@redhat.com>
Date: Mon, 17 Feb 2020 10:45:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217032127.46508-2-pannengyuan@huawei.com>
Content-Language: en-US
X-MC-Unique: nEIZfsfJMTqAVUJ3PteX5g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: zhang.zhanghailiang@huawei.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 euler.robot@huawei.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WkcZ2GLOLf/9

On 2/17/20 4:21 AM, pannengyuan@huawei.com wrote:
> From: Pan Nengyuan <pannengyuan@huawei.com>
>=20
> This patch fix memleaks when we call tests/qtest/cpu-plug-test on s390x. =
The leak stack is as follow:
>=20
> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>      #0 0x7fb43c7cd970 in __interceptor_calloc (/lib64/libasan.so.5+0xef9=
70)
>      #1 0x7fb43be2149d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>      #2 0x558ba96da716 in timer_new_full /mnt/sdb/qemu-new/qemu/include/q=
emu/timer.h:530
>      #3 0x558ba96da716 in timer_new /mnt/sdb/qemu-new/qemu/include/qemu/t=
imer.h:551
>      #4 0x558ba96da716 in timer_new_ns /mnt/sdb/qemu-new/qemu/include/qem=
u/timer.h:569
>      #5 0x558ba96da716 in s390_cpu_initfn /mnt/sdb/qemu-new/qemu/target/s=
390x/cpu.c:285
>      #6 0x558ba9c969ab in object_init_with_type /mnt/sdb/qemu-new/qemu/qo=
m/object.c:372
>      #7 0x558ba9c9eb5f in object_initialize_with_type /mnt/sdb/qemu-new/q=
emu/qom/object.c:516
>      #8 0x558ba9c9f053 in object_new_with_type /mnt/sdb/qemu-new/qemu/qom=
/object.c:684
>      #9 0x558ba967ede6 in s390x_new_cpu /mnt/sdb/qemu-new/qemu/hw/s390x/s=
390-virtio-ccw.c:64
>      #10 0x558ba99764b3 in hmp_cpu_add /mnt/sdb/qemu-new/qemu/hw/core/mac=
hine-hmp-cmds.c:57
>      #11 0x558ba9b1c27f in handle_hmp_command /mnt/sdb/qemu-new/qemu/moni=
tor/hmp.c:1082
>      #12 0x558ba96c1b02 in qmp_human_monitor_command /mnt/sdb/qemu-new/qe=
mu/monitor/misc.c:142
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Cornelia Huck <cohuck@redhat.com>
> ---
> Changes v2 to v1:
> - Similarly to other cleanups, move timer_new into realize, then do
> timer_del in unrealize.
> ---
>   target/s390x/cpu.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
>=20
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index cf84d307c6..f18dbc6fe4 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -170,7 +170,12 @@ static void s390_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>       S390CPUClass *scc =3D S390_CPU_GET_CLASS(dev);
>   #if !defined(CONFIG_USER_ONLY)
>       S390CPU *cpu =3D S390_CPU(dev);
> +    cpu->env.tod_timer =3D
> +        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
> +    cpu->env.cpu_timer =3D
> +        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
>   #endif
> +
>       Error *err =3D NULL;
>  =20
>       /* the model has to be realized before qemu_init_vcpu() due to kvm =
*/
> @@ -227,6 +232,16 @@ out:
>       error_propagate(errp, err);
>   }
>  =20
> +static void s390_cpu_unrealizefn(DeviceState *dev, Error **errp)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    S390CPU *cpu =3D S390_CPU(dev);
> +
> +    timer_del(cpu->env.tod_timer);
> +    timer_del(cpu->env.cpu_timer);
> +#endif
> +}
> +
>   static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
>   {
>       GuestPanicInformation *panic_info;
> @@ -279,10 +294,6 @@ static void s390_cpu_initfn(Object *obj)
>                           s390_cpu_get_crash_info_qom, NULL, NULL, NULL, =
NULL);
>       s390_cpu_model_register_props(obj);
>   #if !defined(CONFIG_USER_ONLY)
> -    cpu->env.tod_timer =3D
> -        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
> -    cpu->env.cpu_timer =3D
> -        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
>       s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>   #endif
>   }
> @@ -294,6 +305,8 @@ static void s390_cpu_finalize(Object *obj)
>  =20
>       qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
>       g_free(cpu->irqstate);
> +    timer_free(cpu->env.tod_timer);
> +    timer_free(cpu->env.cpu_timer);
>   #endif
>   }
>  =20
> @@ -453,6 +466,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void=
 *data)
>  =20
>       device_class_set_parent_realize(dc, s390_cpu_realizefn,
>                                       &scc->parent_realize);
> +    dc->unrealize =3D s390_cpu_unrealizefn;
>       device_class_set_props(dc, s390x_cpu_properties);
>       dc->user_creatable =3D true;
>  =20
>=20

Thanks for v2.
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

