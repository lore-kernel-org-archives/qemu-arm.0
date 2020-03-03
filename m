Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp682921lfi;
        Tue, 3 Mar 2020 10:34:04 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtOHMTDabw7pfxZRK5Z+0YKZOW7EJOwpZUO2PcxfR29yIuwxNzPDquRApVTGkI9mLeJBWtL
X-Received: by 2002:ae9:d887:: with SMTP id u129mr5500540qkf.357.1583260444422;
        Tue, 03 Mar 2020 10:34:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583260444; cv=none;
        d=google.com; s=arc-20160816;
        b=BwnGhJ2pQaM1WNHf7JlTslHEeCcSFeVBHXwwefWdooXSAuIoD90NeqgbeEGqBFEyHo
         mbxa8Fl/L1Jp+N7pMv+mhwZMFl6Bmg3QAbeF3FaNC8K9+3WpHwm+qV/eRZ7Lkmqh54LY
         t+X7Kt3fZHeXYVLGyL3hrdGeR7qRircsIrTqF++oObXS3q20U7L65gB8XtMsrMhoeiGP
         pYzbfBOo0ZUQHciHzEbj4NPmPLptMaPxYjZHXPnttjU6FNOKbp82TEyTUF/eKiKv6yZY
         KUY4s+hzz2OaMgQdPF12lrBDbzAE5l0wc15uoiQbDAhxexaTXxAh4C4Jvk7i8gXzvZLn
         iGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=IZNETiz7EbXiLfwg7ORQ38ayvqgzQzpI5I9Bowlm0jk=;
        b=KbEvJ7REZKLQqOU/V6Q3WRXR27QSkADpS5PeUTyBcpafXRYbXAKnzxN+VAomvwAKB3
         kDytf1w1DKnFCBYsTfltQ6UW2JCHbFwJnrOtQPjvqb7QatIk5TF6UitLqs8wgdjkeAGT
         xsOTnKZtdvnGaNI3uKWyVTNDqpLozKUVmN7mTBQO5nZPVQFdKII0JTaD9sNxvMFUYkBF
         Vg5Q3QFycsknocqy42Q2HeXfQYRtm4hxIWt5G7jnMlYC898FghWVe+VCWUjFqZkVdG+D
         D0eZJK4mFChuZ2N9JGSOrogmmQRrjxZO0hyvd2ACWkpp9jYiQhlmj2aMxD7ZmfHpIgwz
         wZtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMLpKWol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si4077866qto.91.2020.03.03.10.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 10:34:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMLpKWol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9CMl-0004Ck-Q9
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 13:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9CMY-00042Y-Ru
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:33:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9CMX-0000au-5r
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:33:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41491
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9CMW-0000aS-UK
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 13:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583260428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZNETiz7EbXiLfwg7ORQ38ayvqgzQzpI5I9Bowlm0jk=;
 b=XMLpKWolMCNsQbFsbi1QMN+v6grswYp8k4InvhbgcqHOmIA35P6myYmRUKu7Fscip5IOck
 g7iqN7ZHnVMw9nHfis0WJCG+LKjfZv67PQalVgsFpy7wDgxoVx2TmAGJnmjGi7TIeEjXkT
 FmGnNHbE1CZcein1a9EW/MfKpDlLoaU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-zUPtoDl4PYaPBCRPBDQsrA-1; Tue, 03 Mar 2020 13:33:44 -0500
X-MC-Unique: zUPtoDl4PYaPBCRPBDQsrA-1
Received: by mail-ed1-f71.google.com with SMTP id y23so2907001edt.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 10:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K5BW9sStMUjfdr8a3tqhgjQikjArA8kWcXItHbdi/fw=;
 b=pg0qKyCrYeaJtH6Gl8bj3HFzGBjXYiwBh12bTqENd0iJR1ye00364bX83rOAl0Epwl
 8Gi2Sw/5IK08H0ixHDTg7+Wqomxo0CHvZVhm2AD2IbdYNrG05FNqeeptNQwx/XW0eg7n
 NkLQcuqU3fURl+m1Mz1um0n7w5KdQLJhW1WG7NZ+xyZ5QiZYea3MtK1BKtQe64JtM1h6
 HMgW3hyHL/DSSfm1HkeebVhPv7+iQYsbLa9jPl6lOTxxZLNnlVmBNiYwYEyIOiKkXm7g
 vp5Ftk0YRdQUuDiYezyt7RAUsoWbLDmriTGrZYWQ8ziV9KUi3mnmAePWjtYpPwok5nH8
 q0mQ==
X-Gm-Message-State: ANhLgQ0qTELjO5yRFKJ/G5boPNKkyqdDLgKXa/f91I/kQtQ6d5Q1TViG
 xGY4Y6V+aexy37IbtKIm+ALvTjN09ACKqMu9kebN28J034I2ey0CTkpPd2EiG8RtUO05giFF/Op
 0Y7LhWoTgA4YO
X-Received: by 2002:a17:906:f24e:: with SMTP id
 gy14mr5263285ejb.165.1583260423255; 
 Tue, 03 Mar 2020 10:33:43 -0800 (PST)
X-Received: by 2002:a17:906:f24e:: with SMTP id
 gy14mr5263235ejb.165.1583260422839; 
 Tue, 03 Mar 2020 10:33:42 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id c24sm1390966eds.40.2020.03.03.10.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 10:33:42 -0800 (PST)
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200303100511.5498-1-peter.maydell@linaro.org>
 <226c0d6b-feb5-d202-2fdf-ba4ae910e463@redhat.com>
Message-ID: <4f960fe0-e5f5-1f8c-76a1-b1df2bef4bd9@redhat.com>
Date: Tue, 3 Mar 2020 19:33:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <226c0d6b-feb5-d202-2fdf-ba4ae910e463@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MjYGsmcjozxu

On 3/3/20 3:19 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/3/20 11:05 AM, Peter Maydell wrote:
>> The CPUClass has a 'reset' method.=C2=A0 This is a legacy from when
>> TYPE_CPU used not to inherit from TYPE_DEVICE.=C2=A0 We don't need it an=
y
>> more, as we can simply use the TYPE_DEVICE reset.=C2=A0 The 'cpu_reset()=
'
>> function is kept as the API which most places use to reset a CPU; it
>> is now a wrapper which calls device_cold_reset() and then the
>> tracepoint function.
>>
>> This change should not cause CPU objects to be reset more often
>> than they are at the moment, because:
>> =C2=A0 * nobody is directly calling device_cold_reset() or
>> =C2=A0=C2=A0=C2=A0 qdev_reset_all() on CPU objects
>> =C2=A0 * no CPU object is on a qbus, so they will not be reset either
>> =C2=A0=C2=A0=C2=A0 by somebody calling qbus_reset_all()/bus_cold_reset()=
, or
>> =C2=A0=C2=A0=C2=A0 by the main "reset sysbus and everything in the qbus =
tree"
>> =C2=A0=C2=A0=C2=A0 reset that most devices are reset by
>>
>> Note that this does not change the need for each machine or whatever
>> to use qemu_register_reset() to arrange to call cpu_reset() -- that
>> is necessary because CPU objects are not on any qbus, so they don't
>> get reset when the qbus tree rooted at the sysbus bus is reset, and
>> this isn't being changed here.
>>
>> All the changes to the files under target/ were made using the
>> included Coccinelle script, except:
>>
>> (1) the deletion of the now-inaccurate and not terribly useful
>> "CPUClass::reset" comments was done with a perl one-liner afterwards:
>> =C2=A0=C2=A0 perl -n -i -e '/ CPUClass::reset/ or print' target/*/*.c
>>
>> (2) this bit of the s390 change was done by hand, because the
>> Coccinelle script is not sophisticated enough to handle the
>> parent_reset call being inside another function:
>>
>> | @@ -96,8 +96,9 @@ static void s390_cpu_reset(CPUState *s,=20
>> cpu_reset_type type)
>> |=C2=A0=C2=A0=C2=A0=C2=A0 S390CPU *cpu =3D S390_CPU(s);
>> |=C2=A0=C2=A0=C2=A0=C2=A0 S390CPUClass *scc =3D S390_CPU_GET_CLASS(cpu);
>> |=C2=A0=C2=A0=C2=A0=C2=A0 CPUS390XState *env =3D &cpu->env;
>> |+=C2=A0=C2=A0=C2=A0 DeviceState *dev =3D DEVICE(s);
>> |
>> |-=C2=A0=C2=A0=C2=A0 scc->parent_reset(s);
>> |+=C2=A0=C2=A0=C2=A0 scc->parent_reset(dev);
>> |=C2=A0=C2=A0=C2=A0=C2=A0 cpu->env.sigp_order =3D 0;
>> |=C2=A0=C2=A0=C2=A0=C2=A0 s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu=
);
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> Testing was by 'make check' and 'make check-acceptance'.
>>
>> I need this patch as a preliminary to some arm stuff I'm
>> doing, but I think it makes sense as a cleanup in its own
>> right so I'm sending it out early for review. If it's not
>> yet in master before I get round to finishing the stuff
>> that depends on it I'll resend it as part of that series.
>=20
> Nice cleanup, thanks.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
[...]
>> diff --git a/scripts/coccinelle/cpu-reset.cocci=20
>> b/scripts/coccinelle/cpu-reset.cocci
>> new file mode 100644
>> index 00000000000..396a724e514
>> --- /dev/null
>> +++ b/scripts/coccinelle/cpu-reset.cocci
>> @@ -0,0 +1,47 @@
>> +// Convert targets using the old CPUState reset to DeviceState reset
>> +//
>> +// Copyright Linaro Ltd 2020
>> +// This work is licensed under the terms of the GNU GPLv2 or later.
>> +//
>> +// spatch --macro-file scripts/cocci-macro-file.h \
>> +//=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --sp-file scripts/coccinel=
le/cpu-reset.cocci \
>> +//=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --keep-comments --smpl-spa=
cing --in-place --include-headers=20
>> --dir target
>> +//
>> +// For simplicity we assume some things about the code we're modifying
>> +// that happen to be true for all our targets:
>> +//=C2=A0 * all cpu_class_set_parent_reset() callsites have a 'DeviceCla=
ss=20
>> *dc' local
>> +//=C2=A0 * the parent reset field in the target CPU class is 'parent_re=
set'
>> +//=C2=A0 * no reset function already has a 'dev' local
>> +
>> +@@
>> +identifier cpu, x;
>> +typedef CPUState;
>> +@@
>> +struct x {
>> +...
>> +- void (*parent_reset)(CPUState *cpu);
>> ++ DeviceReset parent_reset;
>> +...
>> +};
>> +@ rule1 @
>> +identifier resetfn;
>> +expression resetfield;
>> +identifier cc;
>> +@@
>> +- cpu_class_set_parent_reset(cc, resetfn, resetfield)
>> ++ device_class_set_parent_reset(dc, resetfn, resetfield)
>> +@@
>> +identifier rule1.resetfn;
>> +identifier cpu, cc;
>> +typedef CPUState, DeviceState;
>> +@@
>> +-resetfn(CPUState *cpu)
>> +-{
>> ++resetfn(DeviceState *dev)
>> ++{

Nitpick: you don't need to include the bracket symbol in the diff:

   @@
   -resetfn(CPUState *cpu)
   +resetfn(DeviceState *dev)
    {

(simply indent it with a space).

>> ++=C2=A0=C2=A0=C2=A0 CPUState *cpu =3D CPU(dev);
>> +<...
>> +-=C2=A0=C2=A0=C2=A0 cc->parent_reset(cpu);
>> ++=C2=A0=C2=A0=C2=A0 cc->parent_reset(dev);
>> +...>
>> +}
>>
>=20

