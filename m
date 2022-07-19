Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1868248lfp;
        Tue, 19 Jul 2022 04:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uux1VMu9+sYZeA9P6QvxkzpWlIFWF3iZFt3ijEK/qVr7oa9Mi3ZbwYVWh9c7S2FjfRlyDm
X-Received: by 2002:a05:622a:613:b0:31e:f64a:6d88 with SMTP id z19-20020a05622a061300b0031ef64a6d88mr4621320qta.321.1658231929000;
        Tue, 19 Jul 2022 04:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658231928; cv=none;
        d=google.com; s=arc-20160816;
        b=wrUZX35NvRZhia+AskwgJ1nPtk+mJ5seuL/WtySZwiSzbvMXy2HenCAbzMBDNVOUOn
         JlOsFyJWQG1QYkuX5yl7sOUenaQcOG16AUP4MRnFyVEHbkCuSbYbYb8M7JB5tE89bDST
         T4NqJ41++5ejCJYyAOGFQ097+o5BpNevbwwYkpbUewMfAPES81rLAXRDEmIGkg9Ff+9q
         AlV/+giSVov950x36wM8LgNG/xb03os82aIrpMvu77Dj3B4E/LQx//qVK9OZFky5yTKX
         Xay/Hm9TqwfLJIsi6mw3wFYfzw/rhblEAnK9+fOxnOMBCQng5nv7Qn8s3E4vs5tOE03p
         67cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JtR5tfFUoU7dhQSDkammYovUnGPr/0AZzezjaifbMuA=;
        b=ZsPGW1jv7mMbx6enbLqBA1uGyEsvziV9PRAFe8+F+UIza3C28ceJB7AltCWH7kBpoF
         1u7D0/dWQLBtDKjMpuIB5/FcsahAKtKSb4urUDmRyc53+57zbn1wJmIRqb4jhNwmJ1CK
         2Y+RJSayKM5A6KYIIHpwomggTqsr2VzzKVIhLcN9+fV95G2ePkRX+1f67ksnH90FU9kU
         Zt0RoPIPrrLLSLiRfjA24HdmmM1a1ntDw10aLc9hO+2Hl2tn5lUPEiSIR51N+dkncBWs
         rJBbCsAUL94LU4z63STRDbkKquybGU9H6repnrt3RvgT9RjxaG7V6XUV1FvVN1X4j09b
         2Dtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VQtURURx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt1-20020a05621427e100b00473a3e622fbsi6291291qvb.192.2022.07.19.04.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jul 2022 04:58:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VQtURURx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDlsG-00045n-Gx
	for alex.bennee@linaro.org; Tue, 19 Jul 2022 07:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oDlri-000451-IF
 for qemu-arm@nongnu.org; Tue, 19 Jul 2022 07:58:14 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:35740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oDlrg-0007u2-60
 for qemu-arm@nongnu.org; Tue, 19 Jul 2022 07:58:14 -0400
Received: by mail-ed1-x533.google.com with SMTP id e15so19262553edj.2
 for <qemu-arm@nongnu.org>; Tue, 19 Jul 2022 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JtR5tfFUoU7dhQSDkammYovUnGPr/0AZzezjaifbMuA=;
 b=VQtURURxfDlrAGYzCDYxKVzxzkD46uT/2YfuV6gJWjEuKGIiiHUzVnkVKd7jtP32Qx
 etcbRyZU1OfN85CjTcGX3LennPoDg5zuDbGNmfzv9WICDP6A11RDdhojfWqdjMuxolLG
 BTvSG0ocwCtoFHcGI3draWSi6sCDBqJ5niK1owwRK9PoVBjLguZcymnl5AlLoImM9GEm
 GDrWHFTKTUXWdudexh7ilaLBTwx+ebD6/o7/AYYzK7BQ6yfg6N74ACwaZ7PqXWPPa/id
 OKZm5QyycjodttyoQOX0++0FlElvqZD3+9PtD0a9wXGJKdAUfmMThvSV/V51/RyIBExf
 urOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JtR5tfFUoU7dhQSDkammYovUnGPr/0AZzezjaifbMuA=;
 b=6A6DnM/9L//emfZvBDf3QDyLUdKbW9+tkjmA3H7hA4qT6IcVrliEhJiP+rgyGpA16y
 iXlcB31tcRefspgQftV5j07iI8NWTXY286K2xSaABTolXdrxQPR7vjpSsmLu2PJih7b4
 CHa22Hq0PMDqozrvWK/j2bt5xwq9FboAPWyOWYssdRMfsS3+Otx5ireayXc/2vajSc5X
 ShYG1E5kX6dxwFMQUDR1mrpAfwOPSIABQEkgis8AjNAxGQCzmijnQTqVlhR5L4kxfb7P
 VXFlCuSSC7nLrfGj4Rm7fxQtkVmmMYCcAOQ/V3cwgK0MWeD3yX99cYH8F0xzRVWX4roE
 coxA==
X-Gm-Message-State: AJIora9lReVuOrQdepo6ZUt/XK0S5vaBAnaIdTPwBT/+98g8ur5OO9yX
 czigGIv5IETjUcuxwKTJAidxuqjV2IBG/tsoFyc=
X-Received: by 2002:a05:6402:3047:b0:43a:9e43:95e5 with SMTP id
 bs7-20020a056402304700b0043a9e4395e5mr43561411edb.385.1658231889656; Tue, 19
 Jul 2022 04:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
In-Reply-To: <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Tue, 19 Jul 2022 13:57:58 +0200
Message-ID: <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bcff1f05e4273203"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jon.alduan@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /34lgA1r7zEG

--000000000000bcff1f05e4273203
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

this is not what I expected. I did the same as you again to be sure I was
not missing something. but I get the same bad result (see below)
Are you using qemu-arm as static bin or qemu-arm as dynamic bin?

I also tested it on an another machine with another Kernel version, same
result.
So, what is the difference between your environment and mine?
I send you my binary, so that you can test it directly on your machine. If
it works, the issue comes within the compile phase.

Thank you for your support, again.

Best regards
Jon















































































































































*$#/home/test_qemu_timer/src# arm-linux-gnueabihf-gcc -O2 -o timertest
testTimer.cpp -static -pthread -lrttestTimer.cpp: In function =E2=80=98void
sig_alarm(int, siginfo_t*, void*)=E2=80=99:testTimer.cpp:105:35: warning: f=
ormat
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 3 has type =E2=80=98timer_t=E2=80=99 {aka
=E2=80=98void=E2=80=99} [-Wformat=3D]  105 |     printf("signal from alarm =
%d %d %X\n",
info->si_value.sival_int, m_tid[info->si_value.sival_int],
info->si_value.sival_ptr);      |                                  ~^
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~      |
                        |
             |      |                                   int
                                             timer_t {aka void*}      |
                             %ptestTimer.cpp:105:38: warning: format =E2=80=
=98%X=E2=80=99
expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 4 has=
 type =E2=80=98void*=E2=80=99
[-Wformat=3D]  105 |     printf("signal from alarm %d %d %X\n",
info->si_value.sival_int, m_tid[info->si_value.sival_int],
info->si_value.sival_ptr);      |                                     ~^

 ~~~~~~~~~~~~~~~~~~~~~~~~      |                                      |
 |      |                                      unsigned int     void*
|                                     %ptestTimer.cpp: In function =E2=80=
=98void
create_alarm(int, int)=E2=80=99:testTimer.cpp:131:30: warning: format =E2=
=80=98%d=E2=80=99 expects
argument of type =E2=80=98int=E2=80=99, but argument 3 has type =E2=80=98ti=
mer_t=E2=80=99 {aka =E2=80=98void=E2=80=99}
[-Wformat=3D]  131 |     printf("Create timer %d %d\n", m_iNr, tid);      |
                          ~^            ~~~      |
     |            |      |                              int
 timer_t {aka void*}      |                             %ptestTimer.cpp: In
function =E2=80=98void delete_alarm(int)=E2=80=99:testTimer.cpp:143:30: war=
ning: format
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 3 has type =E2=80=98timer_t=E2=80=99 {aka
=E2=80=98void=E2=80=99} [-Wformat=3D]  143 |     printf("Remove timer %d %d=
\n", nr,
m_tid[nr]);      |                             ~^         ~~~~~~~~~      |
                             |                 |      |
         int               timer_t {aka void*}      |
      %p$#/home/test_qemu_timer/src# ls -ltotal 764-rw-r--r-- 1 root root
 116 Jul 15 18:16 CMakeLists.txt-rw-r--r-- 1 root root   4269 Jul  6 00:12
testTimer.cpp-rwxr-xr-x 1 root root 766532 Jul 19 13:31
timertest$/home/jon/test_qemu_timer/src# qemu-arm-static_ -versionqemu-arm
version 5.2.0 (Debian 1:5.2+dfsg-9ubuntu3.3)Copyright (c) 2003-2020 Fabrice
Bellard and the QEMU Project developers$#/home/test_qemu_timer/src#
qemu-arm-static_ -L ../ timertestCreate timer 0 212795392Create timer 1
212795392Create timer 2 212795393Create timer 3 212795394Create timer 4
212795395thread0: startedthread0: saw 0 alarms from 0thread1:
startedthread2: startedthread3: startedthread4: startedthread5:
startedthread6: startedthread7: startedthread8: startedthread9:
startedsignal from alarm 0 212795392 0signal from alarm 2 212795393 2signal
from alarm 4 212795395 4signal from alarm 0 212795392 0signal from alarm 1
212795392 1signal from alarm 3 212795394 3signal from alarm 2 212795393
2signal from alarm 4 212795395 4signal from alarm 0 212795392 0signal from
alarm 2 212795393 2signal from alarm 4 212795395 4Remove timer 0
212795392signal from alarm 0 0 0Error, already deletedsignal from alarm 2
212795393 2signal from alarm 3 212795394 3signal from alarm 4 212795395
4signal from alarm 0 0 0Error, already deletedsignal from alarm 2 212795393
2signal from alarm 4 212795395 4signal from alarm 0 0 0Error, already
deletedsignal from alarm 2 212795393 2signal from alarm 4 212795395 4signal
from alarm 3 212795394 3signal from alarm 0 0 0Error, already deletedsignal
from alarm 2 212795393 2Remove timer 1 212795392signal from alarm 4
212795395 4^C$#/home/test_qemu_timer/src# qemu-arm-static_ timertestCreate
timer 0 212795392Create timer 1 212795392Create timer 2 212795393Create
timer 3 212795394Create timer 4 212795395thread0: startedthread0: saw 0
alarms from 0thread1: startedthread2: startedthread3: startedthread4:
startedthread5: startedthread6: startedthread7: startedthread8:
startedthread9: startedsignal from alarm 0 212795392 0signal from alarm 2
212795393 2signal from alarm 4 212795395 4signal from alarm 0 212795392
0signal from alarm 1 212795392 1signal from alarm 4 212795395 4signal from
alarm 3 212795394 3signal from alarm 2 212795393 2signal from alarm 0
212795392 0signal from alarm 2 212795393 2signal from alarm 4 212795395
4Remove timer 0 212795392signal from alarm 0 0 0signal from alarm 2
212795393 2signal from alarm 4 212795395 4Error, already deletedsignal from
alarm 3 212795394 3signal from alarm 0 0 0Error, already deletedsignal from
alarm 2 212795393 2signal from alarm 4 212795395 4signal from alarm 0 0
0Error, already deletedsignal from alarm 4 212795395 4signal from alarm 3
212795394 3signal from alarm 2 212795393 2signal from alarm 0 0 0Error,
already deletedsignal from alarm 2 212795393 2Remove timer 1
212795392signal from alarm 4 212795395 4signal from alarm 2 212795393
2signal from alarm 3 212795394 3signal from alarm 4 212795395 4signal from
alarm 2 212795393 2signal from alarm 4 212795395 4*





El lun, 18 jul 2022 a las 18:44, Peter Maydell (<peter.maydell@linaro.org>)
escribi=C3=B3:

> On Fri, 15 Jul 2022 at 17:18, Jon Alduan <jon.alduan@gmail.com> wrote:
> > thanks for answering so fast.
> > Attached a tarball file containing everything you need to reproduce it
> (If not, please let me know).
>
> I can't repro this compiling your test from source, either with
> a build of QEMU 5.0 or with current git:
>
> $ arm-linux-gnueabihf-gcc -O2 -o /tmp/timertest src/testTimer.cpp
> -static -pthread -lrt
> $ ~/linaro/qemu-from-laptop/qemu/build/qemu-5.0/arm-linux-user/qemu-arm
> /tmp/timertest
> Create timer 0 536856
> Create timer 1 537904
> Create timer 2 537920
> Create timer 3 537936
> Create timer 4 537952
> thread1: started
> thread9: started
> thread0: started
> thread3: started
> thread2: started
> thread4: started
> thread5: started
> thread6: started
> thread7: started
> thread8: started
> thread0: saw 0 alarms from 0
> signal from alarm 0 536856 0
> signal from alarm 2 537920 2
> signal from alarm 4 537952 4
> signal from alarm 0 536856 0
> signal from alarm 1 537904 1
> signal from alarm 4 537952 4
> signal from alarm 3 537936 3
> signal from alarm 2 537920 2
> signal from alarm 0 536856 0
> signal from alarm 2 537920 2
> signal from alarm 4 537952 4
> Remove timer 0 536856
> signal from alarm 1 537904 1
> signal from alarm 2 537920 2
> signal from alarm 4 537952 4
> signal from alarm 3 537936 3
> signal from alarm 2 537920 2
> signal from alarm 4 537952 4
> signal from alarm 1 537904 1
> signal from alarm 4 537952 4
> signal from alarm 3 537936 3
> signal from alarm 2 537920 2
> signal from alarm 2 537920 2
> signal from alarm 4 537952 4
> signal from alarm 2 537920 2
> signal from alarm 1 537904 1
> Remove timer 1 537904
> signal from alarm 3 537936 3
> signal from alarm 4 537952 4
> signal from alarm 2 537920 2
> signal from alarm 4 537952 4
> signal from alarm 3 537936 3
> signal from alarm 2 537920 2
> signal from alarm 4 537952 4
> ^C
>
> thanks
> -- PMM
>


--=20
j.A

--000000000000bcff1f05e4273203
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Peter,</div><div><br></div><div>this is not wha=
t I expected. I did the same as you again to be sure I was not missing some=
thing. but I get the same bad result (see below)<br></div><div>Are you usin=
g qemu-arm as static bin or qemu-arm as dynamic bin?</div><div><br></div><d=
iv>I also tested it on an another machine with another Kernel version, same=
 result.</div><div>So, what is the difference between your environment and =
mine?</div><div>I send you my binary, so that you can test it directly on y=
our machine. If it works, the issue comes within the compile phase. <br></d=
iv><div><br></div><div>Thank you for your support, again.</div><div><br></d=
iv><div>Best regards</div><div>Jon<br></div><div><br></div><div><span style=
=3D"font-family:monospace"><i><b>$#/home/test_qemu_timer/src# arm-linux-gnu=
eabihf-gcc -O2 -o timertest testTimer.cpp -static -pthread -lrt</b><br>test=
Timer.cpp: In function =E2=80=98void sig_alarm(int, siginfo_t*, void*)=E2=
=80=99:<br>testTimer.cpp:105:35: warning: format =E2=80=98%d=E2=80=99 expec=
ts argument of type =E2=80=98int=E2=80=99, but argument 3 has type =E2=80=
=98timer_t=E2=80=99 {aka =E2=80=98void<br>=E2=80=99} [-Wformat=3D]<br>=C2=
=A0 105 | =C2=A0 =C2=A0 printf(&quot;signal from alarm %d %d %X\n&quot;, in=
fo-&gt;si_value.sival_int, m_tid[info-&gt;si_value.sival_int], info-&gt;si_=
value.sival_ptr);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0~^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0timer_t {aka void*}<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%p<br>testTimer.cpp:105:38: warning: form=
at =E2=80=98%X=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=
=80=99, but argument 4 has type =E2=80=98void*=E2=80=99 [-Wformat=3D]<br>=
=C2=A0 105 | =C2=A0 =C2=A0 printf(&quot;signal from alarm %d %d %X\n&quot;,=
 info-&gt;si_value.sival_int, m_tid[info-&gt;si_value.sival_int], info-&gt;=
si_value.sival_ptr);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ~^ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~~~~~~~<br>=C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>=C2=
=A0 =C2=A0 =C2=A0|<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int<br>=C2=A0 =C2=A0 =C2=A0void*<br=
>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 %p<br>testTimer.cpp: In function =E2=80=98void create_alarm(int, int)=
=E2=80=99:<br>testTimer.cpp:131:30: warning: format =E2=80=98%d=E2=80=99 ex=
pects argument of type =E2=80=98int=E2=80=99, but argument 3 has type =E2=
=80=98timer_t=E2=80=99 {aka =E2=80=98void<br>=E2=80=99} [-Wformat=3D]<br>=
=C2=A0 131 | =C2=A0 =C2=A0 printf(&quot;Create timer %d %d\n&quot;, m_iNr, =
tid);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~^ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0~~~<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>=C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0timer_t {aka void*}<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %=
p<br>testTimer.cpp: In function =E2=80=98void delete_alarm(int)=E2=80=99:<b=
r>testTimer.cpp:143:30: warning: format =E2=80=98%d=E2=80=99 expects argume=
nt of type =E2=80=98int=E2=80=99, but argument 3 has type =E2=80=98timer_t=
=E2=80=99 {aka =E2=80=98void<br>=E2=80=99} [-Wformat=3D]<br>=C2=A0 143 | =
=C2=A0 =C2=A0 printf(&quot;Remove timer %d %d\n&quot;, nr, m_tid[nr]);<br>=
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~^ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ~~~~~~~~~<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>=C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 timer_t {aka void*}<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 %p<br><b>$#/home/test_qemu_timer/src# ls -l</b><br>total 764<br>=
-rw-r--r-- 1 root root =C2=A0 =C2=A0116 Jul 15 18:16 CMakeLists.txt<br>-rw-=
r--r-- 1 root root =C2=A0 4269 Jul =C2=A06 00:12 testTimer.cpp<br>-rwxr-xr-=
x 1 root root 766532 Jul 19 13:31 timertest<br><b>$/home/jon/test_qemu_time=
r/src# qemu-arm-static_ -version</b><br>qemu-arm version 5.2.0 (Debian 1:5.=
2+dfsg-9ubuntu3.3)<br>Copyright (c) 2003-2020 Fabrice Bellard and the QEMU =
Project developers<br><b>$#/home/test_qemu_timer/src# qemu-arm-static_ -L .=
./ timertest</b><br>Create timer 0 212795392<br>Create timer 1 212795392<br=
>Create timer 2 212795393<br>Create timer 3 212795394<br>Create timer 4 212=
795395<br>thread0: started<br>thread0: saw 0 alarms from 0<br>thread1: star=
ted<br>thread2: started<br>thread3: started<br>thread4: started<br>thread5:=
 started<br>thread6: started<br>thread7: started<br>thread8: started<br>thr=
ead9: started<br>signal from alarm 0 212795392 0<br>signal from alarm 2 212=
795393 2<br>signal from alarm 4 212795395 4<br>signal from alarm 0 21279539=
2 0<br>signal from alarm 1 212795392 1<br>signal from alarm 3 212795394 3<b=
r>signal from alarm 2 212795393 2<br>signal from alarm 4 212795395 4<br>sig=
nal from alarm 0 212795392 0<br>signal from alarm 2 212795393 2<br>signal f=
rom alarm 4 212795395 4<br>Remove timer 0 212795392<br>signal from alarm 0 =
0 0<br>Error, already deleted<br>signal from alarm 2 212795393 2<br>signal =
from alarm 3 212795394 3<br>signal from alarm 4 212795395 4<br>signal from =
alarm 0 0 0<br>Error, already deleted<br>signal from alarm 2 212795393 2<br=
>signal from alarm 4 212795395 4<br>signal from alarm 0 0 0<br>Error, alrea=
dy deleted<br>signal from alarm 2 212795393 2<br>signal from alarm 4 212795=
395 4<br>signal from alarm 3 212795394 3<br>signal from alarm 0 0 0<br>Erro=
r, already deleted<br>signal from alarm 2 212795393 2<br>Remove timer 1 212=
795392<br>signal from alarm 4 212795395 4<br>^C<br><b>$#/home/test_qemu_tim=
er/src# qemu-arm-static_ timertest</b><br>Create timer 0 212795392<br>Creat=
e timer 1 212795392<br>Create timer 2 212795393<br>Create timer 3 212795394=
<br>Create timer 4 212795395<br>thread0: started<br>thread0: saw 0 alarms f=
rom 0<br>thread1: started<br>thread2: started<br>thread3: started<br>thread=
4: started<br>thread5: started<br>thread6: started<br>thread7: started<br>t=
hread8: started<br>thread9: started<br>signal from alarm 0 212795392 0<br>s=
ignal from alarm 2 212795393 2<br>signal from alarm 4 212795395 4<br>signal=
 from alarm 0 212795392 0<br>signal from alarm 1 212795392 1<br>signal from=
 alarm 4 212795395 4<br>signal from alarm 3 212795394 3<br>signal from alar=
m 2 212795393 2<br>signal from alarm 0 212795392 0<br>signal from alarm 2 2=
12795393 2<br>signal from alarm 4 212795395 4<br>Remove timer 0 212795392<b=
r>signal from alarm 0 0 0<br>signal from alarm 2 212795393 2<br>signal from=
 alarm 4 212795395 4<br>Error, already deleted<br>signal from alarm 3 21279=
5394 3<br>signal from alarm 0 0 0<br>Error, already deleted<br>signal from =
alarm 2 212795393 2<br>signal from alarm 4 212795395 4<br>signal from alarm=
 0 0 0<br>Error, already deleted<br>signal from alarm 4 212795395 4<br>sign=
al from alarm 3 212795394 3<br>signal from alarm 2 212795393 2<br>signal fr=
om alarm 0 0 0<br>Error, already deleted<br>signal from alarm 2 212795393 2=
<br>Remove timer 1 212795392<br>signal from alarm 4 212795395 4<br>signal f=
rom alarm 2 212795393 2<br>signal from alarm 3 212795394 3<br>signal from a=
larm 4 212795395 4<br>signal from alarm 2 212795393 2<br>signal from alarm =
4 212795395 4</i></span></div><div><br></div><div><br></div><div><br></div>=
<div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">El lun, 18 jul 2022 a las 18:44, Peter Maydell (&lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;) escr=
ibi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fr=
i, 15 Jul 2022 at 17:18, Jon Alduan &lt;<a href=3D"mailto:jon.alduan@gmail.=
com" target=3D"_blank">jon.alduan@gmail.com</a>&gt; wrote:<br>
&gt; thanks for answering so fast.<br>
&gt; Attached a tarball file containing everything you need to reproduce it=
 (If not, please let me know).<br>
<br>
I can&#39;t repro this compiling your test from source, either with<br>
a build of QEMU 5.0 or with current git:<br>
<br>
$ arm-linux-gnueabihf-gcc -O2 -o /tmp/timertest src/testTimer.cpp<br>
-static -pthread -lrt<br>
$ ~/linaro/qemu-from-laptop/qemu/build/qemu-5.0/arm-linux-user/qemu-arm<br>
/tmp/timertest<br>
Create timer 0 536856<br>
Create timer 1 537904<br>
Create timer 2 537920<br>
Create timer 3 537936<br>
Create timer 4 537952<br>
thread1: started<br>
thread9: started<br>
thread0: started<br>
thread3: started<br>
thread2: started<br>
thread4: started<br>
thread5: started<br>
thread6: started<br>
thread7: started<br>
thread8: started<br>
thread0: saw 0 alarms from 0<br>
signal from alarm 0 536856 0<br>
signal from alarm 2 537920 2<br>
signal from alarm 4 537952 4<br>
signal from alarm 0 536856 0<br>
signal from alarm 1 537904 1<br>
signal from alarm 4 537952 4<br>
signal from alarm 3 537936 3<br>
signal from alarm 2 537920 2<br>
signal from alarm 0 536856 0<br>
signal from alarm 2 537920 2<br>
signal from alarm 4 537952 4<br>
Remove timer 0 536856<br>
signal from alarm 1 537904 1<br>
signal from alarm 2 537920 2<br>
signal from alarm 4 537952 4<br>
signal from alarm 3 537936 3<br>
signal from alarm 2 537920 2<br>
signal from alarm 4 537952 4<br>
signal from alarm 1 537904 1<br>
signal from alarm 4 537952 4<br>
signal from alarm 3 537936 3<br>
signal from alarm 2 537920 2<br>
signal from alarm 2 537920 2<br>
signal from alarm 4 537952 4<br>
signal from alarm 2 537920 2<br>
signal from alarm 1 537904 1<br>
Remove timer 1 537904<br>
signal from alarm 3 537936 3<br>
signal from alarm 4 537952 4<br>
signal from alarm 2 537920 2<br>
signal from alarm 4 537952 4<br>
signal from alarm 3 537936 3<br>
signal from alarm 2 537920 2<br>
signal from alarm 4 537952 4<br>
^C<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--000000000000bcff1f05e4273203--
