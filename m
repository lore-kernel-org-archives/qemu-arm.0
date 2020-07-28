Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp695195lfy;
        Tue, 28 Jul 2020 08:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjgF3h4HRm2OJY6/c8dqWfL+rpLqXIOttwmFAwkc5t97bQe3PAFWEn+Fkper1khjxuZBJG
X-Received: by 2002:a25:c0ca:: with SMTP id c193mr9465161ybf.366.1595949978432;
        Tue, 28 Jul 2020 08:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595949978; cv=none;
        d=google.com; s=arc-20160816;
        b=kbXW2qalO5vFZPbSSYqSQtGUiQkuNY12ndypc6wiHB0crgtUX292fnWD17EkljqBVO
         4PBRQQuYIB9IpgxOR1TeZpd1yAPEEQqJoL/YlkF1H30+av9Jbpv7Zgr6Tk42qF7Ghiwh
         pS9JqNrQExcnosebtS6hiLu32LQ3qxXwD+GlhDI5j9/U7u26UK71SGP50wFwynpf6ATH
         +n0InQ+m/sB/umvt8rmGuBwF204/4GGNQZcmh9T8qnyv9dEWrvdOoGVvDWf/KxXTpq46
         J5MNbFwEe3cNZvcOPqU5ayY9Zw8TzOt6Jcri/Iy02XOcAti0AIm4GQ2ly7y66tXA9RK3
         dSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=LvRNG9X0BNafmRfIgzOdb6Wrikuna7dIbV3XGnnPy7E=;
        b=el3hKM/fPBQq+JOZgBlYBHwgoBlydwzHulcO/Xavt22KoA+A13pZjMCniR6Fn1fjln
         Utd4qGD1yxQ8NeSfNRDRf402UmUpN7A51cayXvOvWuzQw41AiAMm/2rkpSW1yU7xhtT6
         TEEDrh8KPNDhErvfjBOo8vBGagWTq1q7d96frPaQxaSOFgmppxnF32/tU2FydFCMeHn2
         S9nO0UOvrNkzTZnnzRHbIsIxyzyhjLwbjxiCtfMNoO2ZEum0vOHweHinLfgQFBaIdRni
         aclEgU/Rl7yzqwkE89r8EDCAr9BBm9WR3hFM8y8jCv7KJv0weazwvRuQdoaE4TGZfwCh
         C+AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SzuMf2Ey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y125si12323259yba.353.2020.07.28.08.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 08:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SzuMf2Ey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0RUf-00047x-Ql
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 11:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k0RUL-0003nz-0g
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:25:57 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:39260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1k0RUJ-0002FI-DZ
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 11:25:56 -0400
Received: by mail-qk1-x732.google.com with SMTP id l6so18996772qkc.6
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 08:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LvRNG9X0BNafmRfIgzOdb6Wrikuna7dIbV3XGnnPy7E=;
 b=SzuMf2EyHLZP/2u9KP4JmCjgNISJiBSCZCERaJbj2T/t5OTttPVbfMZrSbQN/pWgS+
 S8vdeXZayu6VZZrX3xRWWQaFzjwewtxdGaZ17/MgaPv19uQKZu2gKnMK/9/4fTqUZ8rv
 K5G6HwebrmQ5u2DrP2ZAQSUe8v3cz8JphPaBJr1jShvpbOlOPd5HNnmB7A7HsykIWhlB
 uzi0EuJnCp2H0A+/d+q7gnfvrsi7yKdv/l5ykpMC0ZLxB30F/duW78mTHQgpCL5yh212
 sDk2HPHunJIvyzS++seDyFCmfN/5wdMCs+ZJGc0wFRg96ybxieJfgrjFvFmUi3slX6Nw
 Q5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LvRNG9X0BNafmRfIgzOdb6Wrikuna7dIbV3XGnnPy7E=;
 b=Zq7pEeqfrskg0DFcBbMYHnAtr6kZD4AiIfw5V1Lj5XRi1k+jeZC7YN47um6fLBA747
 JiWAyol7yjSigObx4QdZfAoX/a0G4m+6Mm3/Iso+EGigsqb9hJtCOnVm9CdPRuDxVUVQ
 x3Soz3J1LHQCqlaHjIwT+HP2Li1aWOOZYJ7KV8sxvFOUlCvzSxzo1T7aIQ5nP3jGhlWi
 6akv0uve7S5XggjNiUTddvbpnIDq6lkQmVk3seUF7S2/c84VQ5+Ec/WwqYoZnrSHKlnE
 1686SKvYoZN0U5OuunzoblqHPM6+PV3FthfY3rnc+IxYZ+IIxprHIlUERRlqa6BekmZs
 tYkA==
X-Gm-Message-State: AOAM533PIUnJ2RBRptlP2GGu+/SdBmrPcyeJxLv7NpN8+rbwziXNu0+r
 CssphDVH/HWIgnHACDTCjdjltEhLSpE0Nyi/bl8SWPtb6+4=
X-Received: by 2002:a37:a98c:: with SMTP id
 s134mr27646967qke.397.1595949953597; 
 Tue, 28 Jul 2020 08:25:53 -0700 (PDT)
MIME-Version: 1.0
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Tue, 28 Jul 2020 11:25:42 -0400
Message-ID: <CAJoBWHzJq-51dBxP8pniQPd7fy7J+jU2gHwZOkn-NRJzc5uNiQ@mail.gmail.com>
Subject: Differing PAC behavior between Qemu and Arm FVP
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001046e005ab820e4d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=derrick.mckee@gmail.com; helo=mail-qk1-x732.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QYC53WQfoouR

--0000000000001046e005ab820e4d
Content-Type: text/plain; charset="UTF-8"

Hi,

I think I may have found a behavior different from Qemu's system emulation
and Arm's FVP, which is supposed to provide exact hardware behavior.  The
Qemu commit I am using is ed67b09529a564d2ceb242a7cb02613bbe0fa3ca from the
tgt_arm_mte branch and the FVP is the freely available
FVP_Base_RevC-2xAEMv8A from Arm's website.

The scenario: Application signs pointer 0xdeadbeef using the pacda
instruction to obtain a new pointer 0xXYdeadbeef.  Later, the application
wants to generate a new PAC signature for 0xdeadbeef, but uses 0xXYdeadbeef
as the address for the pacda instruction to generate pointer 0xABdeadbeef.
Finally, the application wants to authenticate using the autda instruction
using 0xABdeadbeef and the modifier used to generate that pointer.

Qemu behavior: The autda instruction succeeds and 0xdeadbeef is returned.

FVP behavior: The autda instruction fails, and an invalid pointer is
returned.  In order for the autda instruction to succeed, the pointer
provided to the pacda instruction must have the upper bits set to zero.

Is this a bug, or are we not very concerned about corner cases like these?

-- 
Derrick McKee
Phone: (703) 957-9362
Email: derrick.mckee@gmail.com

--0000000000001046e005ab820e4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I think I may have found=
 a behavior different from Qemu&#39;s system emulation and Arm&#39;s FVP, w=
hich is supposed to provide exact hardware behavior.=C2=A0 The Qemu commit =
I am using is ed67b09529a564d2ceb242a7cb02613bbe0fa3ca from the tgt_arm_mte=
 branch and the FVP is the freely available FVP_Base_RevC-2xAEMv8A from Arm=
&#39;s website.</div><div><br></div><div>The scenario: Application signs po=
inter 0xdeadbeef using the pacda instruction to obtain a new pointer 0xXYde=
adbeef.=C2=A0 Later, the application wants to generate a new PAC signature =
for 0xdeadbeef, but uses 0xXYdeadbeef as the address for the pacda instruct=
ion to generate pointer 0xABdeadbeef.=C2=A0 Finally, the application wants =
to authenticate using the autda instruction using 0xABdeadbeef and the modi=
fier used to generate that pointer.</div><div><br></div><div>Qemu behavior:=
 The autda instruction succeeds and 0xdeadbeef is returned.</div><div><br><=
/div><div>FVP behavior: The autda instruction fails, and an invalid pointer=
 is returned.=C2=A0 In order for the autda instruction to succeed, the poin=
ter provided to the pacda instruction must have the upper bits set to zero.=
</div><div><br></div><div>Is this a bug, or are we not very concerned about=
 corner cases like these? <br></div><div><br>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Derrick McKee<br>Ph=
one: (703) 957-9362<br>Email: <a href=3D"mailto:derrick.mckee@gmail.com" ta=
rget=3D"_blank">derrick.mckee@gmail.com</a><br></div></div></div>

--0000000000001046e005ab820e4d--
