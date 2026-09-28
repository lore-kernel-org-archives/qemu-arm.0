Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E541CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 11:16:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB9LB-0002B9-Ro; Mon, 28 Sep 2026 07:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB9Kj-00028H-H3
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:15:52 -0400
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB9Kh-00008V-CA
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 07:15:45 -0400
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a6063d7dc4so3408745a12.3
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 04:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790594142; cv=none;
 d=google.com; s=arc-20260327;
 b=Hpkmcs8o3Sv4hTpXeeYtK0dRTTzAnZcx8NTEUsyJ/HFnePzfgRcj6GrslJXKyWL7hY
 MSrn3drJlA8NH7fM1P3PEw7dodYBb4v92oEpU7dmSeh4E42bISvea49akSkvKkpUleth
 yv4dhttG5sQr+rCKUil4gWvqv0CpGtOrdz96cY+z5xHo5eLP+UH+Y8Vm9+EluXRmUXkd
 O0nvg55b38dmJV949nwoV+FjKp6r1bvVYkqpQ7nwUKahnnEq7nKNnNTqjnvI2LF4ZFYk
 Z2glI/wvp6CPR02cknu33pP2OlDKzdgT62D+nH0uAjwD0+7DzcceJ4NvGpBZxRehVI2S
 qY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=l/W5KMfmAafbh94ihcimc3L0jPH5ZoJNODiRrHBRay4=;
 fh=hI25hw5Cfp9JaPKN7TLmE/JTfzc4PGMJ0zKAdovc9fE=;
 b=NZd1TYaXWL26hM/lG0L4IOitNSz+nDLeBA7JmZJNPC+qjP5eFXAlUd1J1SKbqabQqN
 zN+5hQ0fiXeyrM+3AQeJUu9cCsAYkK7Iyjq/rm+3XgtGVvrtb4NqUF1rJvfBl5b2lEE6
 xNKFnWKoyZFXnYiPYDNTCkulDx1+mAUfZTDNt7YH7u10jLF+ebllnyCiUFpLbsTtnpIh
 6hwI/7ItTnX7U2B13WWim2bH5SoOjsR+0ssm3wAb5L8MiuiFpkV5ESWbeypuQjy1SZei
 9HJr/vkc0sBubCrprsDekWBPXFC3VkNO+bR7H28oWj2mz+4Gk4In3LCWhvKRmeMM7o3i
 lh2w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790594142; x=1791198942; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=l/W5KMfmAafbh94ihcimc3L0jPH5ZoJNODiRrHBRay4=;
 b=ZqDYUsiaPKBMCeDa5SLzt0XPm3hS7PAegS0Hsmvp0JsoSzVnfi0M/xKvH794a5lTxp
 3HRKxLKb/9qSZi8WPYqw/YDPJuJ6KKpPWUPWtETvRaE/zz2Q23TRLOZjSNImm5vsFXUQ
 67LAHQw8ATpWAO/sNst799pvqcoFdl8QW09DFgVRjurj1chK3CYccp11Gzk57VDwOZbg
 xQs70sYv8Y1N4dY4HvmM1QH/vDCiV9rilsUn6XzGLJpwYcvK10zBhei5f1HtBo2IN0R7
 MH5wRTJdOnxBxRylC29MAa0AWhHzT9J3r6mKMbwaQdRQJuvFSad+pAA4EYa5rxqceSAh
 EBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790594142; x=1791198942;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=l/W5KMfmAafbh94ihcimc3L0jPH5ZoJNODiRrHBRay4=;
 b=rH3W+YCYG223IyXKBtpHzHU+h8FUn3SKDRn7z3BnXAdKZUi6gwVneTZwONWxBnx61y
 alBpmCwzdAf1reG7n2uwkoNQtUA6VT7oySFtkjlb1cAA1kOG6XUdUXT2Jz8OaB/8KGt4
 v6ShGq9WrBAj9e6wW7U8W775vUiL4tDZgxV53Ib3tPZkmV5S4E6d8LjgdVvVOuFHP6Y8
 7MMubNECnkVKw1j1raGnc59cpDlBsh2gtSkZnYJ2x6qar6Zm0ytBCaxapzEaOh1t6mhN
 HHasPYecxMx1QrQzTqYZtp7Ra21QI8Z9swGd9WoYBirBP5RS2ILBSQqymF8H+cWG/L5/
 fFqQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBztRlpLjXwH/L+pvrADQ2VYduVAIHplbCcQ0IbiMVszz73w3mu6wSJGtpS/Lp0GjVN3Yb3neSvQbw==@nongnu.org
X-Gm-Message-State: AFq9FYKbnEvQkqP67iUI9WU/KJIVvPnThczLJdjCl4/HuQ7bonI9w6ll
 Eba8c4A/oKpwpUEXFEfdbgrfIqHgJsDXNTgDoqBC0vtc+d8UlGBeB2fMTZ6nXpG66kuxSIm+KJI
 GwOdfsAZD3FfV4vljAxXOxD9ctqpDVtw=
X-Gm-Gg: AYBFou1qxzYgbQjx52kU/IBoxFddXUqSrUBXl05fhR/Oqq4YFfBQxYweAWYG6eqrhJc
 HYRi7o6BdlJAWxDYzVikkWUQSkcKDWic8TDD0s7Hnog2huHAo0NHfL8MSrK/KwJgYvgXXyKDv0k
 tRfqTYoIpoJOsNEpcvzhWaO7mf89JECnD4kJpTuMojI5/E83HiY9r5Q8nO4sPsGrSmCRz4XoKxI
 /q7SvFaH0KfiJU6lu32ewNC9PpIB/+qsEGjG7nRHf6kQOqOgJ12ZBbTkr6Rtgyl7CAecOMtBDxT
 Zv+Ff+THz2JwSxDx4OcUpLjQwdDgAs6o5hVuXyB9l9Rm4hmX71nB+RE=
X-Received: by 2002:a05:6402:2811:b0:6ac:68a3:3c30 with SMTP id
 4fb4d7f45d1cf-6ac68a344c1mr2814577a12.14.1790594141547; Mon, 28 Sep 2026
 04:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-32-luoyonggang@gmail.com>
 <87cxtxhd5i.fsf@pond.sub.org>
In-Reply-To: <87cxtxhd5i.fsf@pond.sub.org>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 28 Sep 2026 19:15:27 +0800
X-Gm-Features: AclHuK-f1y9KNL5-AcTF1mHTwD55vm1IehHZN18_5Lor_nIRBDnfBXmN0m0UOEw
Message-ID: <CAE2XoE-Qs6EL1CGFnE-Z6vdP2Zui3=4HZXtLSvKhpwkrPuNpgA@mail.gmail.com>
Subject: Re: [PATCH v4 31/55] accel/tcg: move memory helpers out of
 tcg-runtime.h
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000be74f0065c892f4d"
Received-SPF: pass client-ip=2a00:1450:4864:33::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000be74f0065c892f4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:40=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Yonggang Luo <luoyonggang@gmail.com> writes:
>
> > memset, ld_i128, and st_i128 are declared in ldst_common.h, and
> > ldst_common.c.inc emits their helper info. Atomic helpers move to
> > atomic_common.h, with info records emitted from atomic_common.c.inc.
> > tcg-runtime.h keeps the integer helpers implemented in tcg-runtime.c.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>
> Another compilation failure:

Sorry for the annoyance, catched by gitlab-ci, and I have already fixed it
locally. the gitlab-ci is green at commit

https://gitlab.com/lygstate-qemu/qemu/-/commit/cc6301e7142730de016cfd94c112=
ba8fd240d189

>
>     cc -m64  -o tests/unit/test-tcg-call-tl
libevent-loop-base.a.p/event-loop-base.c.o libqom.a.p/qom_container.c.o
libqom.a.p/qom_object.c.o libqom.a.p/qom_object_interfaces.c.o
libqom.a.p/qom_qom-qobject.c.o libqom.a.p/qom_compat-properties.c.o
libqom.a.p/target-info.c.o libqom.a.p/target-kconfig.c.o
libsystem.a.p/accel_tcg_tcg-runtime.c.o libsystem.a.p/tcg_optimize.c.o
libsystem.a.p/tcg_region.c.o libsystem.a.p/tcg_tcg.c.o
libsystem.a.p/tcg_tcg-common.c.o libsystem.a.p/tcg_tcg-op.c.o
libsystem.a.p/tcg_tcg-op-vec.c.o libsystem.a.p/tcg_perf.c.o
tests/unit/test-tcg-call-tl.p/test-tcg-call-tl.c.o
tests/unit/test-tcg-call-tl.p/test-tcg-call-tl-stubs.c.o
tests/unit/test-tcg-call-tl.p/.._.._page-vary-common.c.o -Wl,--as-needed
-Wl,--no-undefined -pie -fstack-protector-strong -Wl,-z,relro -Wl,-z,now
-Wl,--start-group libqemuutil.a
subprojects/libvhost-user/libvhost-user-glib.a
subprojects/libvhost-user/libvhost-user.a -lnuma /usr/lib64/liburing.so
/usr/lib64/libgio-2.0.so /usr/lib64/libgobject-2.0.so /usr/lib64/
libglib-2.0.so /usr/lib64/libgmodule-2.0.so -pthread
/usr/lib64/libgnutls.so -lm /usr/lib64/libpixman-1.so
/usr/lib64/libepoxy.so -Wl,--end-group
>     /usr/bin/ld: libsystem.a.p/tcg_perf.c.o: in function
`perf_report_code':
>     /work/armbru/qemu/bld/../tcg/perf.c:328:(.text+0x5e9): undefined
reference to `debuginfo_lock'
>     /usr/bin/ld: /work/armbru/qemu/bld/../tcg/perf.c:341:(.text+0x66f):
undefined reference to `debuginfo_query'
>     /usr/bin/ld: /work/armbru/qemu/bld/../tcg/perf.c:361:(.text+0xa91):
undefined reference to `debuginfo_unlock'
>     collect2: error: ld returned 1 exit status
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000be74f0065c892f4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, Sep 28, 2026 at 6:40=E2=80=AFPM Markus Arm=
bruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; =
wrote:<br>&gt;<br>&gt; Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail=
.com">luoyonggang@gmail.com</a>&gt; writes:<br>&gt;<br>&gt; &gt; memset, ld=
_i128, and st_i128 are declared in ldst_common.h, and<br>&gt; &gt; ldst_com=
mon.c.inc emits their helper info. Atomic helpers move to<br>&gt; &gt; atom=
ic_common.h, with info records emitted from atomic_common.c.inc.<br>&gt; &g=
t; tcg-runtime.h keeps the integer helpers implemented in tcg-runtime.c.<br=
>&gt; &gt;<br>&gt; &gt; Signed-off-by: Yonggang Luo &lt;<a href=3D"mailto:l=
uoyonggang@gmail.com">luoyonggang@gmail.com</a>&gt;<br>&gt;<br>&gt; Another=
 compilation failure:<div><br></div><div>Sorry for the annoyance, catched b=
y gitlab-ci, and I have already fixed it locally. the gitlab-ci is green at=
 commit</div><div><br></div><div><a href=3D"https://gitlab.com/lygstate-qem=
u/qemu/-/commit/cc6301e7142730de016cfd94c112ba8fd240d189">https://gitlab.co=
m/lygstate-qemu/qemu/-/commit/cc6301e7142730de016cfd94c112ba8fd240d189</a><=
/div><div><br>&gt;<br>&gt; =C2=A0 =C2=A0 cc -m64 =C2=A0-o tests/unit/test-t=
cg-call-tl libevent-loop-base.a.p/event-loop-base.c.o libqom.a.p/qom_contai=
ner.c.o libqom.a.p/qom_object.c.o libqom.a.p/qom_object_interfaces.c.o libq=
om.a.p/qom_qom-qobject.c.o libqom.a.p/qom_compat-properties.c.o libqom.a.p/=
target-info.c.o libqom.a.p/target-kconfig.c.o libsystem.a.p/accel_tcg_tcg-r=
untime.c.o libsystem.a.p/tcg_optimize.c.o libsystem.a.p/tcg_region.c.o libs=
ystem.a.p/tcg_tcg.c.o libsystem.a.p/tcg_tcg-common.c.o libsystem.a.p/tcg_tc=
g-op.c.o libsystem.a.p/tcg_tcg-op-vec.c.o libsystem.a.p/tcg_perf.c.o tests/=
unit/test-tcg-call-tl.p/test-tcg-call-tl.c.o tests/unit/test-tcg-call-tl.p/=
test-tcg-call-tl-stubs.c.o tests/unit/test-tcg-call-tl.p/.._.._page-vary-co=
mmon.c.o -Wl,--as-needed -Wl,--no-undefined -pie -fstack-protector-strong -=
Wl,-z,relro -Wl,-z,now -Wl,--start-group libqemuutil.a subprojects/libvhost=
-user/libvhost-user-glib.a subprojects/libvhost-user/libvhost-user.a -lnuma=
 /usr/lib64/liburing.so /usr/lib64/<a href=3D"http://libgio-2.0.so">libgio-=
2.0.so</a> /usr/lib64/<a href=3D"http://libgobject-2.0.so">libgobject-2.0.s=
o</a> /usr/lib64/<a href=3D"http://libglib-2.0.so">libglib-2.0.so</a> /usr/=
lib64/<a href=3D"http://libgmodule-2.0.so">libgmodule-2.0.so</a> -pthread /=
usr/lib64/libgnutls.so -lm /usr/lib64/libpixman-1.so /usr/lib64/libepoxy.so=
 -Wl,--end-group<br>&gt; =C2=A0 =C2=A0 /usr/bin/ld: libsystem.a.p/tcg_perf.=
c.o: in function `perf_report_code&#39;:<br>&gt; =C2=A0 =C2=A0 /work/armbru=
/qemu/bld/../tcg/perf.c:328:(.text+0x5e9): undefined reference to `debuginf=
o_lock&#39;<br>&gt; =C2=A0 =C2=A0 /usr/bin/ld: /work/armbru/qemu/bld/../tcg=
/perf.c:341:(.text+0x66f): undefined reference to `debuginfo_query&#39;<br>=
&gt; =C2=A0 =C2=A0 /usr/bin/ld: /work/armbru/qemu/bld/../tcg/perf.c:361:(.t=
ext+0xa91): undefined reference to `debuginfo_unlock&#39;<br>&gt; =C2=A0 =
=C2=A0 collect2: error: ld returned 1 exit status<br>&gt;<br><br><br>--<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=
=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<=
/div></div>

--000000000000be74f0065c892f4d--

