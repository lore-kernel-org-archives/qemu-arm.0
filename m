Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CD0CAC5BB
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 03:22:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v73hb-0003Y9-Ho; Thu, 09 Oct 2025 23:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@opnsrc.net>)
 id 1v73ha-0003Xz-LQ
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 23:21:54 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <salil.mehta@opnsrc.net>)
 id 1v73hX-00085b-M8
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 23:21:54 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-648746b05ecso487611eaf.0
 for <qemu-arm@nongnu.org>; Thu, 09 Oct 2025 20:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=opnsrc.net; s=google; t=1760066506; x=1760671306; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EGUCbquu7MKyc+ExilLriCce2z2XG0aQ6PXI2Lj1xe8=;
 b=R3cKw9EnmsGhYRQIRYnM43Kio403TdydUG6yY7TfFsq2MQStBRnvx/Az7Dqszq9e2+
 RMRolUJgrqCYB9eOiziCOty5r+GkQ2+7OUNfX4nKlSMDwlcasrwnyWZE3by/mleJYvAZ
 RfhQQC0vu9GHqmFO9aK/cXYBqp/X/UKqUH3FZBm/YWRA80Mobnu8lEZu7Yrs1Nz79Q5d
 eQ2Fpl5JmUc6XUnKHDECTRhtYf3BUoGZaQAwkUUvFzb5wLnRxPZtBQibPqU8pJiewtSB
 I0zKb4792JT8G+RHJcLGy1Uz/AngpW/u6HEHRKB3vEl30LGUFQaxnQU3CItAzTjEH0X5
 YX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760066506; x=1760671306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EGUCbquu7MKyc+ExilLriCce2z2XG0aQ6PXI2Lj1xe8=;
 b=Ww7DG92RzXBIaSzv0GU97//m10BF1qa02iyJ0BPzGmFypbhMmp9ehpgwiBKXCLbpi0
 z2OQMfD0XM97nSnq26j48l2pjyCg0QAQvrcgNhsOd1Mjeud6xeHQXyxSRDzMMtmlQywN
 jbmyJasr8TEh4o84FLj168pUsiM0EfCwhMX0BKpzxtwZRQb2k9pYbcck0RmIahUCyep5
 iGYzh6y94bSgcbUQPb/X3IroQj016GifXYiDBfrBZImu0XuGSqtPuhmvEg79MYsadEQF
 /FIgfXCZMr6faHN8wLPiLLs1oXO85QEal1Nu/kIc5Mt4HCyxHsUyKHikCYN9cimRl6N0
 GIlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSvTgva4fZzQr2aJJL9WB0WnC9ymhHFDXCSoYv9FQgHUUIbQTC1xwmHJucUGJh5fdYlnOjYwK80g==@nongnu.org
X-Gm-Message-State: AOJu0Yx/EZTywTGiBiszz+0CU9VNNiq/p9wxUYYaVZ12X7oG72tpgrMY
 ZdhZjoiVBEhUmFkBesQDIi0eUN5iFWUGDASqYbV08bIliCEkt7ecWrYzZ7j9IS4FknVMLnE1zVY
 YYbYDxe3zGEu35LGcGAqVVJ1x/cAQAM6AUAkozLKzIA==
X-Gm-Gg: ASbGncuxzaowsgKAnqqDpYDa6JS81v9Vn9Op/EkS2UOwXK9tKPkpgyCn8aks6gfG4Ih
 HxsWYkIjcRs6QitOLP+tV9IMYxRikoAsWi/z1nKA+5ErfbcLKjebkUhSuqf9zWuZbBQpj+ytrXJ
 Jx253tx3rrBeQRL5lHpiKRF0mKs59KurBIZfhhqABYFQLBAz4WPxKQYEON7BKRt4Cw3CLIF5waG
 xupHArAhkcgdSQuXYAu0MMvPjqeZBNw1vQP/14rUXvso7qSLspABaZiGWiQu9b4EzUOa11JwNHi
 gnMo23g=
X-Google-Smtp-Source: AGHT+IEHLaXNtXD7YVPgP/v0UdENfIJFJ2hjQCiMBH4i3iykUAqxGez2QDb5eB7YqxzugOsIpv9ggcIrfPpsrZv7t/Y=
X-Received: by 2002:a05:6870:82a6:b0:376:bfb7:18a with SMTP id
 586e51a60fabf-3c0f48c60a3mr4218402fac.12.1760066506269; Thu, 09 Oct 2025
 20:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250930224037.224833-1-salil.mehta@huawei.com>
 <871pndlgi7.fsf@pond.sub.org>
In-Reply-To: <871pndlgi7.fsf@pond.sub.org>
From: Salil Mehta <salil.mehta@opnsrc.net>
Date: Fri, 10 Oct 2025 03:21:34 +0000
X-Gm-Features: AS18NWAArEiq3NdvYWAvnAIkDAvaN-UwvutJ0MTDvk50y9S4KegIk9PvsljrbRY
Message-ID: <CAJ7pxeagneZ4-R8BDPjzGPSOQXjMgoO_78+D5yq_jrs1UAEN+A@mail.gmail.com>
Subject: Re: [PATCH RFC V6 00/24] Support of Virtual CPU Hotplug-like Feature
 for ARMv8+ Arch
To: Markus Armbruster <armbru@redhat.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 mst@redhat.com, maz@kernel.org, jean-philippe@linaro.org, 
 jonathan.cameron@huawei.com, lpieralisi@kernel.org, peter.maydell@linaro.org, 
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev, 
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, 
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com, 
 gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com, 
 alex.bennee@linaro.org, gustavo.romero@linaro.org, npiggin@gmail.com, 
 harshpb@linux.ibm.com, linux@armlinux.org.uk, darren@os.amperecomputing.com, 
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, 
 gankulkarni@os.amperecomputing.com, karl.heubaum@oracle.com, 
 miguel.luis@oracle.com, zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, 
 wangyanan55@huawei.com, wangzhou1@hisilicon.com, linuxarm@huawei.com, 
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn, 
 shahuang@redhat.com, zhao1.liu@intel.com
Content-Type: multipart/alternative; boundary="000000000000e3360c0640c56aa8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=salil.mehta@opnsrc.net; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000e3360c0640c56aa8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI Markus,

Thanks for reporting this issue. Sorry, I forgot to check it for x86 and
other platforms.
I'll try to fix this or you can share the fix. I'll add to the series.

Best regards
Salil

On Wed, Oct 8, 2025 at 12:34=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:

> Salil Mehta <salil.mehta@huawei.com> writes:
>
> [...]
>
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > (VIII) Repositories
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > (*) Latest Qemu RFC V6 (Architecture Specific) patch set:
> >     https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v6
>
> Does not compile for me (x86_64 box running Fedora 41):
>
>     [...]
>
>     FAILED: qemu-system-loongarch64
>     cc -m64 @qemu-system-loongarch64.rsp
>     /usr/bin/ld:
> libsystem.a.p/hw_acpi_generic_event_device.c.o:(.data.rel+0x50): undefine=
d
> reference to `vmstate_cpu_ospm_state'
>     collect2: error: ld returned 1 exit status
>     [6757/7232] Linking target qemu-system-mips64
>     [6758/7232] Generating docs/QEMU manual with a custom command
>     FAILED: docs/docs.stamp
>     /usr/bin/env CONFDIR=3Detc/qemu
> /work/armbru/qemu/bld/pyvenv/bin/sphinx-build -q -W -Dkerneldoc_werror=3D=
1 -j
> auto -Dversion=3D10.1.50 -Drelease=3D -Ddepfile=3Ddocs/docs.d
> -Ddepfile_stamp=3Ddocs/docs.stamp -b html -d
> /work/armbru/qemu/bld/docs/manual.p /work/armbru/qemu/docs
> /work/armbru/qemu/bld/docs/manual
>     /work/armbru/qemu/docs/../include/hw/qdev-core.h:190: warning:
> Function parameter or member 'admin_power_state_supported' not described =
in
> 'DeviceClass'
>     /work/armbru/qemu/docs/../include/hw/qdev-core.h:269: warning: Enum
> value 'DEVICE_ADMIN_POWER_STATE_ENABLED' not described in enum
> 'DeviceAdminPowerState'
>     /work/armbru/qemu/docs/../include/hw/qdev-core.h:269: warning: Enum
> value 'DEVICE_ADMIN_POWER_STATE_DISABLED' not described in enum
> 'DeviceAdminPowerState'
>     /work/armbru/qemu/docs/../include/hw/qdev-core.h:269: warning: Enum
> value 'DEVICE_ADMIN_POWER_STATE_REMOVED' not described in enum
> 'DeviceAdminPowerState'
>     /work/armbru/qemu/docs/../include/hw/qdev-core.h:269: warning: Enum
> value 'DEVICE_ADMIN_POWER_STATE_MAX' not described in enum
> 'DeviceAdminPowerState'
>     1 warnings as Errors
>
>     Warning, treated as error:
>     kernel-doc 'perl /work/armbru/qemu/docs/../scripts/kernel-doc -rst
> -enable-lineno -sphinx-version 7.3.7 -Werror
> /work/armbru/qemu/docs/../include/hw/qdev-core.h' failed with return code=
 1
>     [6759/7232] Linking target qemu-system-i386
>     FAILED: qemu-system-i386
>     cc -m64 @qemu-system-i386.rsp
>     /usr/bin/ld:
> libsystem.a.p/hw_acpi_generic_event_device.c.o:(.data.rel+0x50): undefine=
d
> reference to `vmstate_cpu_ospm_state'
>     collect2: error: ld returned 1 exit status
>
>     [...]
>
>     [6874/7232] Linking target qemu-system-x86_64
>     FAILED: qemu-system-x86_64
>     cc -m64 @qemu-system-x86_64.rsp
>     /usr/bin/ld:
> libsystem.a.p/hw_acpi_generic_event_device.c.o:(.data.rel+0x50): undefine=
d
> reference to `vmstate_cpu_ospm_state'
>     collect2: error: ld returned 1 exit status
>
>     [...]
>
>     ninja: build stopped: cannot make progress due to previous errors.
>     make: *** [Makefile:168: run-ninja] Error 1
>     make: Target 'all' not remade because of errors.
>     make: Leaving directory '/work/armbru/qemu/bld'
>
> [...]
>
>

--000000000000e3360c0640c56aa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">HI Markus,<div><br></div><div>Thanks for =
reporting this issue. Sorry, I forgot=C2=A0to check it for x86 and other pl=
atforms.</div><div>I&#39;ll try to fix this or you can share the fix. I&#39=
;ll add to the series.</div><div><br></div><div>Best=C2=A0regards</div><div=
>Salil</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 8, 2025 at 12:34=E2=80=AFPM M=
arkus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Salil Mehta &lt;<a href=3D"mailto:salil.mehta@huawei.com" target=3D"_blank"=
>salil.mehta@huawei.com</a>&gt; writes:<br>
<br>
[...]<br>
<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; (VIII) Repositories<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;<br>
&gt; (*) Latest Qemu RFC V6 (Architecture Specific) patch set:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/salil-mehta/qemu.git"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/salil-mehta/qemu.g=
it</a> virt-cpuhp-armv8/rfc-v6<br>
<br>
Does not compile for me (x86_64 box running Fedora 41):<br>
<br>
=C2=A0 =C2=A0 [...]<br>
<br>
=C2=A0 =C2=A0 FAILED: qemu-system-loongarch64 <br>
=C2=A0 =C2=A0 cc -m64 @qemu-system-loongarch64.rsp<br>
=C2=A0 =C2=A0 /usr/bin/ld: libsystem.a.p/hw_acpi_generic_event_device.c.o:(=
.data.rel+0x50): undefined reference to `vmstate_cpu_ospm_state&#39;<br>
=C2=A0 =C2=A0 collect2: error: ld returned 1 exit status<br>
=C2=A0 =C2=A0 [6757/7232] Linking target qemu-system-mips64<br>
=C2=A0 =C2=A0 [6758/7232] Generating docs/QEMU manual with a custom command=
<br>
=C2=A0 =C2=A0 FAILED: docs/docs.stamp <br>
=C2=A0 =C2=A0 /usr/bin/env CONFDIR=3Detc/qemu /work/armbru/qemu/bld/pyvenv/=
bin/sphinx-build -q -W -Dkerneldoc_werror=3D1 -j auto -Dversion=3D10.1.50 -=
Drelease=3D -Ddepfile=3Ddocs/docs.d -Ddepfile_stamp=3Ddocs/docs.stamp -b ht=
ml -d /work/armbru/qemu/bld/docs/manual.p /work/armbru/qemu/docs /work/armb=
ru/qemu/bld/docs/manual<br>
=C2=A0 =C2=A0 /work/armbru/qemu/docs/../include/hw/qdev-core.h:190: warning=
: Function parameter or member &#39;admin_power_state_supported&#39; not de=
scribed in &#39;DeviceClass&#39;<br>
=C2=A0 =C2=A0 /work/armbru/qemu/docs/../include/hw/qdev-core.h:269: warning=
: Enum value &#39;DEVICE_ADMIN_POWER_STATE_ENABLED&#39; not described in en=
um &#39;DeviceAdminPowerState&#39;<br>
=C2=A0 =C2=A0 /work/armbru/qemu/docs/../include/hw/qdev-core.h:269: warning=
: Enum value &#39;DEVICE_ADMIN_POWER_STATE_DISABLED&#39; not described in e=
num &#39;DeviceAdminPowerState&#39;<br>
=C2=A0 =C2=A0 /work/armbru/qemu/docs/../include/hw/qdev-core.h:269: warning=
: Enum value &#39;DEVICE_ADMIN_POWER_STATE_REMOVED&#39; not described in en=
um &#39;DeviceAdminPowerState&#39;<br>
=C2=A0 =C2=A0 /work/armbru/qemu/docs/../include/hw/qdev-core.h:269: warning=
: Enum value &#39;DEVICE_ADMIN_POWER_STATE_MAX&#39; not described in enum &=
#39;DeviceAdminPowerState&#39;<br>
=C2=A0 =C2=A0 1 warnings as Errors<br>
<br>
=C2=A0 =C2=A0 Warning, treated as error:<br>
=C2=A0 =C2=A0 kernel-doc &#39;perl /work/armbru/qemu/docs/../scripts/kernel=
-doc -rst -enable-lineno -sphinx-version 7.3.7 -Werror /work/armbru/qemu/do=
cs/../include/hw/qdev-core.h&#39; failed with return code 1<br>
=C2=A0 =C2=A0 [6759/7232] Linking target qemu-system-i386<br>
=C2=A0 =C2=A0 FAILED: qemu-system-i386 <br>
=C2=A0 =C2=A0 cc -m64 @qemu-system-i386.rsp<br>
=C2=A0 =C2=A0 /usr/bin/ld: libsystem.a.p/hw_acpi_generic_event_device.c.o:(=
.data.rel+0x50): undefined reference to `vmstate_cpu_ospm_state&#39;<br>
=C2=A0 =C2=A0 collect2: error: ld returned 1 exit status<br>
<br>
=C2=A0 =C2=A0 [...]<br>
<br>
=C2=A0 =C2=A0 [6874/7232] Linking target qemu-system-x86_64<br>
=C2=A0 =C2=A0 FAILED: qemu-system-x86_64 <br>
=C2=A0 =C2=A0 cc -m64 @qemu-system-x86_64.rsp<br>
=C2=A0 =C2=A0 /usr/bin/ld: libsystem.a.p/hw_acpi_generic_event_device.c.o:(=
.data.rel+0x50): undefined reference to `vmstate_cpu_ospm_state&#39;<br>
=C2=A0 =C2=A0 collect2: error: ld returned 1 exit status<br>
<br>
=C2=A0 =C2=A0 [...]<br>
<br>
=C2=A0 =C2=A0 ninja: build stopped: cannot make progress due to previous er=
rors.<br>
=C2=A0 =C2=A0 make: *** [Makefile:168: run-ninja] Error 1<br>
=C2=A0 =C2=A0 make: Target &#39;all&#39; not remade because of errors.<br>
=C2=A0 =C2=A0 make: Leaving directory &#39;/work/armbru/qemu/bld&#39;<br>
<br>
[...]<br>
<br>
</blockquote></div></div>

--000000000000e3360c0640c56aa8--

