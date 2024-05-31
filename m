Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp403910ejs;
        Fri, 31 May 2024 02:57:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4Sfc5lbrYbkW5jaO0pHxQrfEFsbhiZws22XOjOabBh0QYuV4s5MD/i5p4ndCD9FZuZGVfMBPClgF1ZBF46ax8JujuyuOb
X-Google-Smtp-Source: AGHT+IHjBERZSLtFegH9uh+lzF4NmoQBfWh15puWDwpmF3jhWnIdavhePn49ruHSGZCbw9RcN0jb
X-Received: by 2002:a05:6214:4b13:b0:6ae:9c4c:b613 with SMTP id 6a1803df08f44-6aecd6a3681mr14411926d6.28.1717149465756;
        Fri, 31 May 2024 02:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717149465; cv=none;
        d=google.com; s=arc-20160816;
        b=Dx1UlkTukvI2S+ikvF2YTal8ICLr/y4llmjPYmimARPaReNW2kuhDzIwa8/pYKOI2J
         dSGubBe9TwArHIvrWShjqxH+P2gxTmabWyJMlrMS67sG6jHXIiawfSeqfu0cf1HceOJ2
         NeMYOGT+2/ICfQ256ip6xtcqxt+fIA08PBKpIZdMvgtYSGfb8k7BoJH2fGsNBEP4jMG3
         3Ea8Qat5L4VPHhSJ6zMz3b1yotRCyvBdiWTJDLs5F9ZeM502FPZCifEfxqlHnbTRXcjr
         kOFVxPLjk55QCbpfhnkYrW9Y//trW7wc2dBIYlWa/vgBaFPegpalv5X2ZNgP1fjrMYHx
         /g1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=e4FQ3vNtU3m1PcRGN45PKbcYE+qV7GC9NH8Mioabx8M=;
        fh=wpO3XP0+SzlVdAeRftzpZWNgqDO19RQVbEyCPJWsRH8=;
        b=TsSLjLstlVDMWhKxfdg947u+KncI5iVZ3KxS6h5sYBZKme01c+l0loW/Rl3dokJzij
         wg6iw0fZDYMo5AdLYMxiY8nfwjrpGZaSMdmOpjWz7yCYpH4d7iqTOQJVx/jEO9vDfJx3
         Ul/OR2OQP7W1P1ZerStvxwm8hpIDJK9grB0v6p+Ms23GtqwfJauOB51b6SI7cOVKUJor
         DtVwQSuYxo4i4dHsNucE7lU9Z5TuI8HnhaQKXW1U6uNN/6M7/0js0rQ1DTSgBgaOva/O
         xmrLvuq6LxS0FhL2CF6IB8+AFgfjBNmXjsrwO4AKA9S00q5ZK7v7FSDyMMkYYyCIz3+z
         Dt5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXA5p2jP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b4151efsi17015546d6.386.2024.05.31.02.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 02:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXA5p2jP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCz0r-0000Yh-3b; Fri, 31 May 2024 05:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCz0q-0000YL-Ck
 for qemu-arm@nongnu.org; Fri, 31 May 2024 05:57:28 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCz0o-0004t1-Ab
 for qemu-arm@nongnu.org; Fri, 31 May 2024 05:57:28 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57a033c2e9fso2255735a12.2
 for <qemu-arm@nongnu.org>; Fri, 31 May 2024 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717149444; x=1717754244; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4FQ3vNtU3m1PcRGN45PKbcYE+qV7GC9NH8Mioabx8M=;
 b=RXA5p2jPN15I66bGzMTwkiVInxivlM5/oIflq4FTzMgdvBmvnQt3PfCl5XmPMjUNqn
 /JP5rKH4OI8WiZ2LzkiatEkju8HfghEJB84ByU6pbLEfH42BsIblJsJ9Mobr46b7M/o/
 TZh4akrQnYRGqSn9bobn33vdo2otib9o0UeixAgFHz5ftc7P6kaFMB6LemwYaFypqgk4
 MoVsFKjhILhf9ZS2zyKVWe+JjxzhAWvp1J7Bxl82FBKDMlr+2TyxAHHWIJ0MmuUywQGy
 LE3z2Cnb7L+eL6PmsKf436XxTjxH2L14dUKSX6ZTVxUyQJFm21yG/pZJIXGUVQTkj9Sz
 AB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717149444; x=1717754244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e4FQ3vNtU3m1PcRGN45PKbcYE+qV7GC9NH8Mioabx8M=;
 b=hlYXHf6NLeeQrkp1XCOB0VFD6dNPIryEHj/ge2k4TcJwbusl6j4DpZ6zo3VDr5aAIV
 QBAzxX8j7ZxNxWMREc6UDvc/Mc4E8jWefxBzgp3tZHWat/0pti59KIcivlMMG8rwXshN
 +vnkiqakk3eYMPoQJ0n9scAxVDx8OVDlHdBmN0jtnNVXEKM9AQ97rRFhOt7CUQdfZ4o3
 WOp9ql8XF9xVJclGqq1Ap2ydFu4kUIqzVuEXnXKVnAzSWEyz1HpnQVdUi/thMFhNU0WI
 YR6r70SmfD/iUIrWOPne3EEHw8sQU7adEOR1E38CUEpfDT/a1cevoEm4fuseYE+Kp+bh
 he9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9rRQTbrt6WVskzyJUdU+ztihV0rbj79bf5oFAQRzD3i4zsdIi0RI9P3su9q7Axfyt5kKonLYJrY7UjDHzJOvB6KpW
X-Gm-Message-State: AOJu0YzVnXMcEuM40f6pdklV1prZFDS7b7FX7FzK6rofWjcQck8x08Tb
 Q4cq46Ft/kEdZieo6IUH5vsOevQQgXTJjsuz7kzFeHoiiADUVyGMKbp+YOUdaDQvLL4KylaF8QO
 RGrAwwBzUK5rDEkySqIrQInsXHbhjCmqDBn/s0g==
X-Received: by 2002:a50:c8cd:0:b0:579:cee1:9139 with SMTP id
 4fb4d7f45d1cf-57a365b2bccmr1098585a12.28.1717149444546; Fri, 31 May 2024
 02:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
 <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
 <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
In-Reply-To: <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2024 10:57:13 +0100
Message-ID: <CAFEAcA-gye9B1yJNKyT0fcZzR7TukNvaQyc7QkKQ_1FUGfAaYw@mail.gmail.com>
Subject: Re: Unexpected error in rme_configure_one() at
 ../target/arm/kvm-rme.c:159
To: Itaru Kitayama <itaru.kitayama@linux.dev>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3rMOYPD3TYrt

On Fri, 31 May 2024 at 05:20, Itaru Kitayama <itaru.kitayama@linux.dev> wro=
te:
>
>
>
> > On May 30, 2024, at 22:30, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
> >
> > Cc'ing more developers
> >
> > On 30/5/24 06:30, Itaru Kitayama wrote:
> >> Hi,
> >> When I see a Realm VM creation fails with:
> >> Unexpected error in rme_configure_one() at ../target/arm/kvm-rme.c:159=
:
> >> qemu-system-aarch64: RME: failed to configure SVE: Invalid argument
> >> test.sh: line 8:  2502 Aborted                 qemu-system-aarch64 -M =
'virt,acpi=3Doff,gic-version=3D3' -cpu host -enable-kvm -smp 2 -m 512M -ove=
rcommit 'mem-lock=3Don' -M 'confidential-guest-support=3Drme0' -object 'rme=
-guest,id=3Drme0,measurement-algo=3Dsha512,num-pmu-counters=3D6,sve-vector-=
length=3D256' -kernel Image -initrd rootfs.cpio -append 'earycon console=3D=
ttyAMA0 rdinit=3D/sbin/init' -nographic -net none
> >> do I need to suspect first the VMM, QEMU, or the Image? The kernel is =
built with LLVM, does it matter?
> >> Thanks,
> >> Itaru.
> >
>
> I=E2=80=99m testing Jean=E2=80=99s repo at:
>
> https://git.codelinaro.org/linaro/dcap/qemu/-/tree/cca/v2?ref_type=3Dhead=
s

OK, we should cc Jean-Philippe then.

I'm wondering if this is as simple as "RME via KVM doesn't support SVE yet"=
,
perhaps.

thanks
-- PMM
