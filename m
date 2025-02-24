Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp2149833njc;
        Mon, 24 Feb 2025 12:54:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrkvaAubbCyabvGbC1K+Tzx9fLlnP+qin42LlWOMthT8KF2CAYEqYKXb+F9a98B0ymBrSeSxaCmlrHVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE2/NOvdqlaWQKh15mFWtFSFoF0ucwUI/sgZUecOWz+8t4mNxsFKigJIPiUjL+hM8j/zt/z
X-Received: by 2002:a05:6214:cc5:b0:6e6:5a83:dcf5 with SMTP id 6a1803df08f44-6e6a264cb20mr308600196d6.21.1740430487498;
        Mon, 24 Feb 2025 12:54:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740430487; cv=none;
        d=google.com; s=arc-20240605;
        b=bJPvrTOgIJQ04oDc8EsvmPhtGmZjKZqQGcpaM5Cj2zVZsHyW1n6cJGkOVhGD69gSmK
         exjRF0O9K0kI4udzrjTxIQXErpvgBOviRYmVhRKA4wuOn3I32OH7/cJSJSALOi/YWZLo
         jUYi9EiEqszR+GYGY+Ne870KxxheYsIoaLoFWeXS56v0pSlecAJZ0LCEQ69TcwdXOZ/9
         58b+M4BbmvPfBcwjsEiDgYVNsYt7ykXsi8pHSYU5M5WkqSIq+Q0X22PiRNT9vGR054gD
         1CKbPvPUQ0JsnfVyCOFxVyxVlvKaLdtjyqZQGElaLqsIeyDJ3fy0Mi2ns53nTbr9k/EK
         JU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RlKtyHKmjkuK0qExQigH14CrDu3IzYINbLBSLatrJPU=;
        fh=4MdQxF1Dk8hma5ALkuSz8WhxDWRE663xUqK1Vh85LGo=;
        b=KLTra0bId3Vj2IdGhJ50DyCFnjrapX/5J2qIQbpdogmyJvSzMljZ43wkc3nIDzO8eD
         f/kwo4Mk+OCHvMUNY+Afy9AnGjYB9BpTwshfDuMVUOhWGdOECew9JuLBQtWj6iAYvV99
         MAOMxR1W1zUlhoRZMbjYbIw+3DMSuBSvNoc5izuS3pXA/75NG5p46vdBjb2myYWpy8+h
         V5AQ1eA66FQGpGocl8fgnLiiLCQi/83LpDnTuIU6tbiE7mRrguVDBVRp8MbPwkjFtEve
         oIQYotgGpxXyDHro2oXow1+hTHqELzR7CpatLKwq4xT+EHdCgaqqdLl/hfdhBpgfW4wD
         mNEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=37FQzMi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b01a78dsi2128976d6.100.2025.02.24.12.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 12:54:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=37FQzMi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmfTJ-0002Ix-Tg; Mon, 24 Feb 2025 15:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1tmfTB-0002DK-5d
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 15:54:30 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1tmfT8-0005Qi-ST
 for qemu-arm@nongnu.org; Mon, 24 Feb 2025 15:54:28 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54522e82e7dso1972e87.0
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2025 12:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740430463; x=1741035263; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RlKtyHKmjkuK0qExQigH14CrDu3IzYINbLBSLatrJPU=;
 b=37FQzMi6CwWeLRVqHnhygsT44uLHbYU/G9N4WQrbDCKP1msqhmF08qwKe0yvFp4M26
 h7occLAtiPFl31F6dps7KQmESZUQQQTEv8GeoFHPU49zYc0XWqkmCZdM6JOO2d8UjMgR
 n+RykjNI3i54LBdpR4iifSJsdIcUx1TePCWnQAx9VjWkc/gMuPF9AN4o3pVFPhtAjUEX
 gUni3eLB4Gm2iHRUtPKrnpEChn6GpzbbticQ6/BH9oyeMpvDwgVRjnLmaAz4V3h2sMKN
 JnmpeG3tgOzzUQ5PyUMN8vM8s+cc9Mvn62BE01V16gJNJ54aoYJTTlKEeJsKW0vPRcJB
 0gOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740430463; x=1741035263;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RlKtyHKmjkuK0qExQigH14CrDu3IzYINbLBSLatrJPU=;
 b=H0e3TdOgzeuM0Jvdbu6GbDkIOu9OeeJFuAjXcKElS9HHpM7rqMGTjK+X13P0Q+3dxL
 lhyyNcWPVMd63A2YW2Qt9oq6YRh+lrhY1PO4rTSiOO198zyGTOK5WIf4UyZ7CVtlJd2m
 wWkAEKwLxquJd1QJBdkLX6eq22Sm0U3/cbOFKxByLp9BaNPT2zooDgSmE8QoOZ29S7mq
 MNIj5pLMJSxnqprNhP/Y+0j4nyKimoDnskrA2nJWhlRpUkzUPNsdeT/VmHJMpPmmiv4V
 w5mebj4cSV8/Ol13WUNfPiQ+VOTfeYuT995LGPz1zjb02KgNJM/0XOcrojtoCFcCkbuJ
 30+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHvTDtFOmZHWl0nVG5BULFT/6GhSkmxpzVDNGunJG2lZg2OD2+idglaNmGDl7IOEl/X8j69RpyOg==@nongnu.org
X-Gm-Message-State: AOJu0YzUtR6QQvNvx0qI7dmQMOJOPoWEyPRbbwFJm6NbJOLCmlswgjov
 HHI4aZtHIBpO74dMobDmLPfTf1MCfqoDJ82QJh6TP2EVD6mwd9Fr+i+7s62C3WK9zJp95kWDXGc
 c0kJhsWTtctQGx+iNA7q7qtMTZWpzc0f+tirP
X-Gm-Gg: ASbGncvH4qF3gRIEXgpCJ1dZKlLv0/rvz2MRXn6NO1jTWy2ioOtbD/ONuErkGvZliel
 rXBYeqXqfNTQ0d2EpwL44Oi0Yb0Tzjeq9F6Y71xpWP/+GmleS9giTaXqbjOrgszoGrtuNIUEWBA
 g2hYr/Wa4aFW6hspndv43hqEi057jgYYl0TqsR
X-Received: by 2002:a05:6512:b9d:b0:542:6b39:1d57 with SMTP id
 2adb3069b0e04-5485099c434mr90433e87.3.1740430463367; Mon, 24 Feb 2025
 12:54:23 -0800 (PST)
MIME-Version: 1.0
References: <20250224205053.104959-1-pierrick.bouvier@linaro.org>
In-Reply-To: <20250224205053.104959-1-pierrick.bouvier@linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 24 Feb 2025 12:54:10 -0800
X-Gm-Features: AWEUYZnb91g44R1mQSftDXTwGD3xgW8LHWmD4j3x9DK4eY6RZfIjMQHKE8Qcklk
Message-ID: <CAGcCb11d2d7xYA0p+y=9PH1uEmzXmjBP5upu3YXQ6TAGdfN_5w@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/npcm_clk: fix buffer-overflow
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, titusr@google.com, hskinnemoen@google.com, 
 peter.maydell@linaro.org, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="00000000000086fd1a062ee98ba8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: XUMEkzstr88f

--00000000000086fd1a062ee98ba8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!

On Mon, Feb 24, 2025 at 12:51=E2=80=AFPM Pierrick Bouvier <
pierrick.bouvier@linaro.org> wrote:

> Regression introduced by cf76c4
> (hw/misc: Add nr_regs and cold_reset_values to NPCM CLK)
>
> cold_reset_values has a different size, depending on device used
> (NPCM7xx vs NPCM8xx). However, s->regs has a fixed size, which matches
> NPCM8xx. Thus, when initializing a NPCM7xx, we go past cold_reset_values
> ending.
>
> Report by asan:
> =3D=3D2066=3D=3DERROR: AddressSanitizer: global-buffer-overflow on addres=
s
> 0x55d68a3e97f0 at pc 0x7fcaf2b2d14b bp 0x7ffff0cc3890 sp 0x7ffff0cc3040
> READ of size 196 at 0x55d68a3e97f0 thread T0
>     #0 0x7fcaf2b2d14a in __interceptor_memcpy
> ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_intercepto=
rs.inc:827
>     #1 0x55d688447e0d in memcpy
> /usr/include/x86_64-linux-gnu/bits/string_fortified.h:29
>     #2 0x55d688447e0d in npcm_clk_enter_reset ../hw/misc/npcm_clk.c:968
>     #3 0x55d6899b7213 in resettable_phase_enter ../hw/core/resettable.c:1=
36
>     #4 0x55d6899a1ef7 in bus_reset_child_foreach ../hw/core/bus.c:97
>     #5 0x55d6899b717d in resettable_child_foreach
> ../hw/core/resettable.c:92
>     #6 0x55d6899b717d in resettable_phase_enter ../hw/core/resettable.c:1=
29
>     #7 0x55d6899b4ead in resettable_container_child_foreach
> ../hw/core/resetcontainer.c:54
>     #8 0x55d6899b717d in resettable_child_foreach
> ../hw/core/resettable.c:92
>     #9 0x55d6899b717d in resettable_phase_enter ../hw/core/resettable.c:1=
29
>     #10 0x55d6899b7bfa in resettable_assert_reset
> ../hw/core/resettable.c:55
>     #11 0x55d6899b8666 in resettable_reset ../hw/core/resettable.c:45
>     #12 0x55d688d15cd2 in qemu_system_reset ../system/runstate.c:527
>     #13 0x55d687fc5edd in qdev_machine_creation_done
> ../hw/core/machine.c:1738
>     #14 0x55d688d209bd in qemu_machine_creation_done ../system/vl.c:2779
>     #15 0x55d688d209bd in qmp_x_exit_preconfig ../system/vl.c:2807
>     #16 0x55d688d281fb in qemu_init ../system/vl.c:3838
>     #17 0x55d687ceab12 in main ../system/main.c:68
>     #18 0x7fcaef006249  (/lib/x86_64-linux-gnu/libc.so.6+0x27249)
>     #19 0x7fcaef006304 in __libc_start_main
> (/lib/x86_64-linux-gnu/libc.so.6+0x27304)
>     #20 0x55d687cf0010 in _start
> (/home/runner/work/qemu-ci/qemu-ci/build/qemu-system-arm+0x371c010)
>
> 0x55d68a3e97f0 is located 0 bytes to the right of global variable
> 'npcm7xx_cold_reset_values' defined in '../hw/misc/npcm_clk.c:134:23'
> (0x55d68a3e9780) of size 112
>
> Impacted tests:
> Summary of Failures:
>
> check:
>   2/747 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test
>        ERROR             9.28s   killed by signal 6 SIGABRT
>   4/747 qemu:qtest+qtest-arm / qtest-arm/qom-test
>        ERROR             7.82s   killed by signal 6 SIGABRT
>  32/747 qemu:qtest+qtest-aarch64 / qtest-aarch64/device-introspect-test
>        ERROR            10.91s   killed by signal 6 SIGABRT
>  35/747 qemu:qtest+qtest-arm / qtest-arm/device-introspect-test
>        ERROR            11.33s   killed by signal 6 SIGABRT
> 114/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_pwm-test
>        ERROR             0.98s   killed by signal 6 SIGABRT
> 115/747 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp
>        ERROR             2.95s   killed by signal 6 SIGABRT
> 117/747 qemu:qtest+qtest-arm / qtest-arm/test-hmp
>        ERROR             2.54s   killed by signal 6 SIGABRT
> 151/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_watchdog_timer-test
>         ERROR             0.96s   killed by signal 6 SIGABRT
> 247/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_adc-test
>        ERROR             0.96s   killed by signal 6 SIGABRT
> 248/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_gpio-test
>         ERROR             1.05s   killed by signal 6 SIGABRT
> 249/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_rng-test
>        ERROR             0.97s   killed by signal 6 SIGABRT
> 250/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test
>        ERROR             0.97s   killed by signal 6 SIGABRT
> 251/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_smbus-test
>        ERROR             0.89s   killed by signal 6 SIGABRT
> 252/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_timer-test
>        ERROR             1.09s   killed by signal 6 SIGABRT
> 253/747 qemu:qtest+qtest-arm / qtest-arm/npcm_gmac-test
>        ERROR             1.12s   killed by signal 6 SIGABRT
> 255/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_emc-test
>        ERROR             1.05s   killed by signal 6 SIGABRT
>
> check-functional:
>  22/203 qemu:func-thorough+func-arm-thorough+thorough /
> func-arm-arm_quanta_gsj                      ERROR             0.79s   ex=
it
> status 1
>  38/203 qemu:func-quick+func-aarch64 / func-aarch64-migration
>                           ERROR             1.97s   exit status 1
>  45/203 qemu:func-quick+func-arm / func-arm-migration
>                           ERROR             1.90s   exit status 1
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  hw/misc/npcm_clk.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
> index d1f29759d59..0e85974cf96 100644
> --- a/hw/misc/npcm_clk.c
> +++ b/hw/misc/npcm_clk.c
> @@ -964,8 +964,9 @@ static void npcm_clk_enter_reset(Object *obj,
> ResetType type)
>      NPCMCLKState *s =3D NPCM_CLK(obj);
>      NPCMCLKClass *c =3D NPCM_CLK_GET_CLASS(s);
>
> -    g_assert(sizeof(s->regs) >=3D c->nr_regs * sizeof(uint32_t));
> -    memcpy(s->regs, c->cold_reset_values, sizeof(s->regs));
> +    size_t sizeof_regs =3D c->nr_regs * sizeof(uint32_t);
> +    g_assert(sizeof(s->regs) >=3D sizeof_regs);
> +    memcpy(s->regs, c->cold_reset_values, sizeof_regs);
>      s->ref_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      npcm7xx_clk_update_all_clocks(s);
>      /*
> --
> 2.39.5
>
>

--00000000000086fd1a062ee98ba8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks!</div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb =
24, 2025 at 12:51=E2=80=AFPM Pierrick Bouvier &lt;<a href=3D"mailto:pierric=
k.bouvier@linaro.org">pierrick.bouvier@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Regression introduced by c=
f76c4<br>
(hw/misc: Add nr_regs and cold_reset_values to NPCM CLK)<br>
<br>
cold_reset_values has a different size, depending on device used<br>
(NPCM7xx vs NPCM8xx). However, s-&gt;regs has a fixed size, which matches<b=
r>
NPCM8xx. Thus, when initializing a NPCM7xx, we go past cold_reset_values<br=
>
ending.<br>
<br>
Report by asan:<br>
=3D=3D2066=3D=3DERROR: AddressSanitizer: global-buffer-overflow on address =
0x55d68a3e97f0 at pc 0x7fcaf2b2d14b bp 0x7ffff0cc3890 sp 0x7ffff0cc3040<br>
READ of size 196 at 0x55d68a3e97f0 thread T0<br>
=C2=A0 =C2=A0 #0 0x7fcaf2b2d14a in __interceptor_memcpy ../../../../src/lib=
sanitizer/sanitizer_common/sanitizer_common_interceptors.inc:827<br>
=C2=A0 =C2=A0 #1 0x55d688447e0d in memcpy /usr/include/x86_64-linux-gnu/bit=
s/string_fortified.h:29<br>
=C2=A0 =C2=A0 #2 0x55d688447e0d in npcm_clk_enter_reset ../hw/misc/npcm_clk=
.c:968<br>
=C2=A0 =C2=A0 #3 0x55d6899b7213 in resettable_phase_enter ../hw/core/resett=
able.c:136<br>
=C2=A0 =C2=A0 #4 0x55d6899a1ef7 in bus_reset_child_foreach ../hw/core/bus.c=
:97<br>
=C2=A0 =C2=A0 #5 0x55d6899b717d in resettable_child_foreach ../hw/core/rese=
ttable.c:92<br>
=C2=A0 =C2=A0 #6 0x55d6899b717d in resettable_phase_enter ../hw/core/resett=
able.c:129<br>
=C2=A0 =C2=A0 #7 0x55d6899b4ead in resettable_container_child_foreach ../hw=
/core/resetcontainer.c:54<br>
=C2=A0 =C2=A0 #8 0x55d6899b717d in resettable_child_foreach ../hw/core/rese=
ttable.c:92<br>
=C2=A0 =C2=A0 #9 0x55d6899b717d in resettable_phase_enter ../hw/core/resett=
able.c:129<br>
=C2=A0 =C2=A0 #10 0x55d6899b7bfa in resettable_assert_reset ../hw/core/rese=
ttable.c:55<br>
=C2=A0 =C2=A0 #11 0x55d6899b8666 in resettable_reset ../hw/core/resettable.=
c:45<br>
=C2=A0 =C2=A0 #12 0x55d688d15cd2 in qemu_system_reset ../system/runstate.c:=
527<br>
=C2=A0 =C2=A0 #13 0x55d687fc5edd in qdev_machine_creation_done ../hw/core/m=
achine.c:1738<br>
=C2=A0 =C2=A0 #14 0x55d688d209bd in qemu_machine_creation_done ../system/vl=
.c:2779<br>
=C2=A0 =C2=A0 #15 0x55d688d209bd in qmp_x_exit_preconfig ../system/vl.c:280=
7<br>
=C2=A0 =C2=A0 #16 0x55d688d281fb in qemu_init ../system/vl.c:3838<br>
=C2=A0 =C2=A0 #17 0x55d687ceab12 in main ../system/main.c:68<br>
=C2=A0 =C2=A0 #18 0x7fcaef006249=C2=A0 (/lib/x86_64-linux-gnu/libc.so.6+0x2=
7249)<br>
=C2=A0 =C2=A0 #19 0x7fcaef006304 in __libc_start_main (/lib/x86_64-linux-gn=
u/libc.so.6+0x27304)<br>
=C2=A0 =C2=A0 #20 0x55d687cf0010 in _start (/home/runner/work/qemu-ci/qemu-=
ci/build/qemu-system-arm+0x371c010)<br>
<br>
0x55d68a3e97f0 is located 0 bytes to the right of global variable &#39;npcm=
7xx_cold_reset_values&#39; defined in &#39;../hw/misc/npcm_clk.c:134:23&#39=
; (0x55d68a3e9780) of size 112<br>
<br>
Impacted tests:<br>
Summary of Failures:<br>
<br>
check:<br>
=C2=A0 2/747 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09.28s=C2=A0 =C2=A0k=
illed by signal 6 SIGABRT<br>
=C2=A0 4/747 qemu:qtest+qtest-arm / qtest-arm/qom-test=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A07.82s=C2=A0 =C2=A0killed by signal 6 SIGABRT<br>
=C2=A032/747 qemu:qtest+qtest-aarch64 / qtest-aarch64/device-introspect-tes=
t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 10.91s=C2=A0 =C2=A0killed by signal 6 SIGABRT<br>
=C2=A035/747 qemu:qtest+qtest-arm / qtest-arm/device-introspect-test=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11.33s=C2=A0 =C2=A0killed by signal 6 SI=
GABRT<br>
114/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_pwm-test=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ER=
ROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.98s=C2=A0 =C2=A0killed=
 by signal 6 SIGABRT<br>
115/747 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ER=
ROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.95s=C2=A0 =C2=A0killed=
 by signal 6 SIGABRT<br>
117/747 qemu:qtest+qtest-arm / qtest-arm/test-hmp=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02.=
54s=C2=A0 =C2=A0killed by signal 6 SIGABRT<br>
151/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_watchdog_timer-test=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00.96s=C2=A0 =C2=A0killed by signal 6 SIGABRT<br>
247/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_adc-test=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ER=
ROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.96s=C2=A0 =C2=A0killed=
 by signal 6 SIGABRT<br>
248/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_gpio-test=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.05s=C2=A0 =C2=A0killed by si=
gnal 6 SIGABRT<br>
249/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_rng-test=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ER=
ROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.97s=C2=A0 =C2=A0killed=
 by signal 6 SIGABRT<br>
250/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.97s=C2=A0 =C2=A0killed by=
 signal 6 SIGABRT<br>
251/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_smbus-test=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.89s=C2=A0 =C2=A0killed by=
 signal 6 SIGABRT<br>
252/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_timer-test=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.09s=C2=A0 =C2=A0killed by=
 signal 6 SIGABRT<br>
253/747 qemu:qtest+qtest-arm / qtest-arm/npcm_gmac-test=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.12s=C2=A0 =C2=A0k=
illed by signal 6 SIGABRT<br>
255/747 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_emc-test=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ER=
ROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.05s=C2=A0 =C2=A0killed=
 by signal 6 SIGABRT<br>
<br>
check-functional:<br>
=C2=A022/203 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_q=
uanta_gsj=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.79s=C2=A0=
 =C2=A0exit status 1<br>
=C2=A038/203 qemu:func-quick+func-aarch64 / func-aarch64-migration=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.97s=C2=A0 =C2=A0exit status 1<br>
=C2=A045/203 qemu:func-quick+func-arm / func-arm-migration=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ERROR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.90s=C2=A0 =C2=A0=
exit status 1<br>
<br>
Signed-off-by: Pierrick Bouvier &lt;<a href=3D"mailto:pierrick.bouvier@lina=
ro.org" target=3D"_blank">pierrick.bouvier@linaro.org</a>&gt;<br></blockquo=
te><div>Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuha=
otsh@google.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0hw/misc/npcm_clk.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c<br>
index d1f29759d59..0e85974cf96 100644<br>
--- a/hw/misc/npcm_clk.c<br>
+++ b/hw/misc/npcm_clk.c<br>
@@ -964,8 +964,9 @@ static void npcm_clk_enter_reset(Object *obj, ResetType=
 type)<br>
=C2=A0 =C2=A0 =C2=A0NPCMCLKState *s =3D NPCM_CLK(obj);<br>
=C2=A0 =C2=A0 =C2=A0NPCMCLKClass *c =3D NPCM_CLK_GET_CLASS(s);<br>
<br>
-=C2=A0 =C2=A0 g_assert(sizeof(s-&gt;regs) &gt;=3D c-&gt;nr_regs * sizeof(u=
int32_t));<br>
-=C2=A0 =C2=A0 memcpy(s-&gt;regs, c-&gt;cold_reset_values, sizeof(s-&gt;reg=
s));<br>
+=C2=A0 =C2=A0 size_t sizeof_regs =3D c-&gt;nr_regs * sizeof(uint32_t);<br>
+=C2=A0 =C2=A0 g_assert(sizeof(s-&gt;regs) &gt;=3D sizeof_regs);<br>
+=C2=A0 =C2=A0 memcpy(s-&gt;regs, c-&gt;cold_reset_values, sizeof_regs);<br=
>
=C2=A0 =C2=A0 =C2=A0s-&gt;ref_ns =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);=
<br>
=C2=A0 =C2=A0 =C2=A0npcm7xx_clk_update_all_clocks(s);<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
-- <br>
2.39.5<br>
<br>
</blockquote></div></div>

--00000000000086fd1a062ee98ba8--
