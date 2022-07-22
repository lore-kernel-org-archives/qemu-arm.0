Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp108958lfp;
        Fri, 22 Jul 2022 01:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sHh9DvRJH0awQiH9nAd5ziX6/pNyFzUEKTRLmjCsfpSIKoaYrghK0Gd81PPIi4Q6qJ0Xaf
X-Received: by 2002:a37:ccb:0:b0:6b5:e1ad:75b9 with SMTP id 194-20020a370ccb000000b006b5e1ad75b9mr1591835qkm.601.1658476859885;
        Fri, 22 Jul 2022 01:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658476859; cv=none;
        d=google.com; s=arc-20160816;
        b=s+VZm0rdv1CApdwFH6qsMKMiWtiFh8knNA7efhMTXpSe9HE3kmfDeaqdqoRRTVybBk
         VYT2StpGxSBtPqLUQyHy0GPiwrLg4kJq+DDMoqyiYTvZZujM9CeuaQD6yaIFsNMtPwqP
         6JybyVFPi7xPIL/27/J6saXg4wN9ifudXQPOmc1JVng6XxV6C3MxXLyGujb2OFQEbDb2
         xlnFGHKZHcBN7ndzxvAp6uThugst77zRvTU4eyiP9zzWphyTqIPKfVHvZLmQujSncS8f
         aHgsedTtr5IINi4+VOXtlNebwXVY/8E7qN6Kudn2DETSnlB/yXCcAbSeqiJAVPw1loTy
         zTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=F2AKGUF7VzhOrEeKGT+55bSxzEwuAj/ILo/pr5OdbFA=;
        b=CwkriuwifpbjcbjE245ysYOkoEdU3jN+gvhDPA8xHRVg0fFSvrjus6SPcIWkZO394f
         7p5n78imahkxJiFtOiU123SuOBi2IPTCxGysan7gZM9K7Mhjx27QUOkgp6zhY8l6XDG+
         dg9+4EVqGtyJ88gTk+rP8mk4gmKP+z0Co8pgImOwjDMpBFMO0xHn4fcZwRePYDQt9wkI
         BguFQbj3/+fsiLzZFxKgew9MhdRE91vIgCUwW8MjK468mdYvV/alZT29rmjV/lot/Uq7
         F5BVMkS4sKD5pSNotZKUd1ys5HNyigvuAiQ5+YXDn+dzM3eXd6UgaF2sCKfGq11/txLD
         gY8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JdP1Mwgd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d197-20020ae9efce000000b006b55b8a5ad4si2412545qkg.378.2022.07.22.01.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jul 2022 01:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JdP1Mwgd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEnal-0004wh-CA
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 04:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEnXo-0002wZ-Vg
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 03:57:57 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oEnXn-00058p-4i
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 03:57:56 -0400
Received: by mail-ed1-x535.google.com with SMTP id m8so4874910edd.9
 for <qemu-arm@nongnu.org>; Fri, 22 Jul 2022 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F2AKGUF7VzhOrEeKGT+55bSxzEwuAj/ILo/pr5OdbFA=;
 b=JdP1Mwgd21A1suJIWwMOA1Z77VDR9Yd++6zRZDnynNtDKZcrJMLeQDq7+Ar+8O2eA2
 NqEkrc5ZltCK/wiUcXBRzorp/mRLkZr2pVFbvxPF1WUFeD7WkH94nU/BTgnuL6B5iSQY
 CXz3BvLGWOev0tS9NsFw8kOUT0x49caO+DrPD6VNG0WhtzDIeRV6PfBWpp1yrWXxVhT8
 1sYyw3QE3ksz9ckRRfy3/eQtENEjnEYwPiLtjOHOupFc9v0cAgm47VHzrnGcfegrygGL
 tTOqxNsnPsPEqBupSdH9/dmQu9hcBWBHmjTAk5UcgloScwuefS8IcldF+cjTqL8SGkAS
 aGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F2AKGUF7VzhOrEeKGT+55bSxzEwuAj/ILo/pr5OdbFA=;
 b=d8XbkUOc16MaF8cErAn+6uLnzqo9z+SZ+OXOmGo8Uxj+ohm2IzET4zsH10F/Imk+q8
 My61I1SP3FI1ydqwYMN7UEAG/TE1PGFwCeRJlZU5HMSgM9LlRs24YrXQ9QyzC9/9FXlz
 nNeZlJL07P77DQIr7lWL1XbK6hDJkS1AmYq3A250vNM4r0yfw0IbrTtFozFJehj0vd/j
 j7GBjbvIDYfyZwsq0z6L5MkcfG56GNpzMzfF5SbUCtqMDZuNRn3gSi3rZWzKWiPZGonc
 uIQVRH5znNixfiUF/c5fQhzynROqrMmAXqnSstJDctlR0kkXSjP7t+MtnqN5QOiFsmnI
 g+eg==
X-Gm-Message-State: AJIora+6MVAw0HwrfcXWSnOWiHRQizMYgbILUAXEtT2A/G2tsTl3Od+l
 m5dGnLGFscocorNH+1fNU3B2abN8bMmuXSbHu88=
X-Received: by 2002:aa7:ccd6:0:b0:43b:c2de:da04 with SMTP id
 y22-20020aa7ccd6000000b0043bc2deda04mr2170754edt.393.1658476673066; Fri, 22
 Jul 2022 00:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
 <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
 <CAL7npF9H_eKi0jA_m-wV=jSHy9hc6re7TpTe2ni=9NYK4CxRpA@mail.gmail.com>
 <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
 <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
 <CAFEAcA8hbU7PJK-YvOkbjj2F2PBW1M9J10DkHqUPXTSxYOS-5Q@mail.gmail.com>
 <CAL7npF9neZUWweuZFqDkO5mh5=tZj3ybjZUvVoF932cJibpRiw@mail.gmail.com>
 <CAFEAcA9CnC5P4Myf1qMO=DLas93+kSVjNvnj6Vgty_yvdjH5vQ@mail.gmail.com>
 <CAL7npF8KNQKyfeW5ONY53+_u6Q4H8BDtY386Eyt-+gxaXdBBJA@mail.gmail.com>
 <CAFEAcA8hVyCwMbQ_ZNUgw8Nfb3wTvRk3gvUr8RC3gSH7Pkuv_g@mail.gmail.com>
 <CAL7npF897P3=Rro4pe_i_cmO+rUe-b1NqnJtmEM3K0kEF5VC7Q@mail.gmail.com>
 <CAFEAcA9y6zwErffpvrJrenS0hyLvGyoyhdF8Vo3mgFhLOvvOSw@mail.gmail.com>
 <CAFEAcA-9F6QDzEiAfiMa=DUVK3LGe9vLmD_OcMTfbU8ayv3Ffw@mail.gmail.com>
 <CAL7npF839onoBJxewXraSGRPmbK=8SqbPeU2W3YN7kFYW6j9tQ@mail.gmail.com>
 <CAFEAcA8wfEfxZh4NFpbDAsB=Rz=9-UcafOWbEtGkJ1WGZs71WQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8wfEfxZh4NFpbDAsB=Rz=9-UcafOWbEtGkJ1WGZs71WQ@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Fri, 22 Jul 2022 09:57:41 +0200
Message-ID: <CAL7npF_QDbfxYtcU-Nnzj=JVatTC3+ajcnN3j7vCsSHOAVuPVg@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f7687605e46030b3"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=jon.alduan@gmail.com; helo=mail-ed1-x535.google.com
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
X-TUID: /DBlJUrkL7l6

--000000000000f7687605e46030b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

yes, I see that too. I think you are right with your assumption.
Please, let me know as soon as you have a bugfix candidate. I will be of
course, very pleased to test it :-)

Thank you for your support!!

Best regards
Jon

El jue, 21 jul 2022 a las 22:36, Peter Maydell (<peter.maydell@linaro.org>)
escribi=C3=B3:

> On Thu, 21 Jul 2022 at 20:03, Jon Alduan <jon.alduan@gmail.com> wrote:
> >
> > Here you have the output with the debug logs:
> >
> > next_free_host_timer: returning 0
> > timer_create: host timer_create: returned 0x00000000, set phtimer
> 0x559dc5d8aa00 to (nil)
> > timer_create: wrote 0xcaf0000 to guest address 0x408002e8
> > Create timer 0 536880
> > get_timer_id: guest timer id 0xcaf0000 -> index 0
> > next_free_host_timer: returning 0
> > timer_create: host timer_create: returned 0x00000000, set phtimer
> 0x559dc5d8aa00 to 0x1
> > timer_create: wrote 0xcaf0000 to guest address 0x408002e8
> > Create timer 1 537928
> > get_timer_id: guest timer id 0xcaf0000 -> index 0
> > next_free_host_timer: returning 1
>
> For me I get:
>
> next_free_host_timer: returning 0
> timer_create: host timer_create: returned 0x00000000, set phtimer
> 0x562e7f755e20 to 0x562e81150040
> timer_create: wrote 0xcaf0000 to guest address 0x407ffe90
> Create timer 0 0x0x83520
> get_timer_id: guest timer id 0xcaf0000 -> index 0
> next_free_host_timer: returning 1
> timer_create: host timer_create: returned 0x00000000, set phtimer
> 0x562e7f755e28 to 0x562e81215230
> timer_create: wrote 0xcaf0001 to guest address 0x407ffe90
> Create timer 1 0x0x83530
> get_timer_id: guest timer id 0xcaf0001 -> index 1
> next_free_host_timer: returning 2
> timer_create: host timer_create: returned 0x00000000, set phtimer
> 0x562e7f755e30 to 0x562e81150720
> timer_create: wrote 0xcaf0002 to guest address 0x407ffe90
> Create timer 2 0x0x83540
> get_timer_id: guest timer id 0xcaf0002 -> index 2
> next_free_host_timer: returning 3
> timer_create: host timer_create: returned 0x00000000, set phtimer
> 0x562e7f755e38 to 0x562e81150fc0
> timer_create: wrote 0xcaf0003 to guest address 0x407ffe90
> Create timer 3 0x0x83550
> get_timer_id: guest timer id 0xcaf0003 -> index 3
> next_free_host_timer: returning 4
> timer_create: host timer_create: returned 0x00000000, set phtimer
> 0x562e7f755e40 to 0x562e81151200
> timer_create: wrote 0xcaf0004 to guest address 0x407ffe90
> Create timer 4 0x0x83560
> get_timer_id: guest timer id 0xcaf0004 -> index 4
>
> I think what is happening here is that for your system, the host
> libc is returning timer ID values (host libc timer_t values)
> which are integers 0, 1, 2, ... On my system the host libc returns
> timer_t values which are pointers -- you can see they are
> 0x562e81150040, 0x562e81215230, etc.
>
> The code in QEMU that determines "is this slot in the array
> in use or not?" assumes that 0 is a value it can use to mark
> "not used", ie that it is not a valid timer_t. That's clearly
> a broken assumption. The effect is that when we're allocating
> an ID for the second timer that gets created we look at the
> slot that has the first timer's host timer_t ID, and because
> on your system it's 0 we think it's not in use and reuse it.
>
> Presumably your host has a different (older?) libc than mine,
> which is why the difference.
>
> Now I understand the cause of the bug I'll think about how to
> best fix it, but I won't get to that until next week.
>
> thanks
> -- PMM
>


--=20
j.A

--000000000000f7687605e46030b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>yes, I see that to=
o. I think you are right with your assumption.</div><div>Please, let me kno=
w as soon as you have a bugfix candidate. I will be of course, very pleased=
 to test it :-)</div><div><br></div><div>Thank you for your support!!</div>=
<div><br></div><div>Best regards</div><div>Jon<br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El jue, 21 jul 2022=
 a las 22:36, Peter Maydell (&lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt;) escribi=C3=B3:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, 21 Jul 2022 at 20:03, Jon Alduan=
 &lt;<a href=3D"mailto:jon.alduan@gmail.com" target=3D"_blank">jon.alduan@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Here you have the output with the debug logs:<br>
&gt;<br>
&gt; next_free_host_timer: returning 0<br>
&gt; timer_create: host timer_create: returned 0x00000000, set phtimer 0x55=
9dc5d8aa00 to (nil)<br>
&gt; timer_create: wrote 0xcaf0000 to guest address 0x408002e8<br>
&gt; Create timer 0 536880<br>
&gt; get_timer_id: guest timer id 0xcaf0000 -&gt; index 0<br>
&gt; next_free_host_timer: returning 0<br>
&gt; timer_create: host timer_create: returned 0x00000000, set phtimer 0x55=
9dc5d8aa00 to 0x1<br>
&gt; timer_create: wrote 0xcaf0000 to guest address 0x408002e8<br>
&gt; Create timer 1 537928<br>
&gt; get_timer_id: guest timer id 0xcaf0000 -&gt; index 0<br>
&gt; next_free_host_timer: returning 1<br>
<br>
For me I get:<br>
<br>
next_free_host_timer: returning 0<br>
timer_create: host timer_create: returned 0x00000000, set phtimer<br>
0x562e7f755e20 to 0x562e81150040<br>
timer_create: wrote 0xcaf0000 to guest address 0x407ffe90<br>
Create timer 0 0x0x83520<br>
get_timer_id: guest timer id 0xcaf0000 -&gt; index 0<br>
next_free_host_timer: returning 1<br>
timer_create: host timer_create: returned 0x00000000, set phtimer<br>
0x562e7f755e28 to 0x562e81215230<br>
timer_create: wrote 0xcaf0001 to guest address 0x407ffe90<br>
Create timer 1 0x0x83530<br>
get_timer_id: guest timer id 0xcaf0001 -&gt; index 1<br>
next_free_host_timer: returning 2<br>
timer_create: host timer_create: returned 0x00000000, set phtimer<br>
0x562e7f755e30 to 0x562e81150720<br>
timer_create: wrote 0xcaf0002 to guest address 0x407ffe90<br>
Create timer 2 0x0x83540<br>
get_timer_id: guest timer id 0xcaf0002 -&gt; index 2<br>
next_free_host_timer: returning 3<br>
timer_create: host timer_create: returned 0x00000000, set phtimer<br>
0x562e7f755e38 to 0x562e81150fc0<br>
timer_create: wrote 0xcaf0003 to guest address 0x407ffe90<br>
Create timer 3 0x0x83550<br>
get_timer_id: guest timer id 0xcaf0003 -&gt; index 3<br>
next_free_host_timer: returning 4<br>
timer_create: host timer_create: returned 0x00000000, set phtimer<br>
0x562e7f755e40 to 0x562e81151200<br>
timer_create: wrote 0xcaf0004 to guest address 0x407ffe90<br>
Create timer 4 0x0x83560<br>
get_timer_id: guest timer id 0xcaf0004 -&gt; index 4<br>
<br>
I think what is happening here is that for your system, the host<br>
libc is returning timer ID values (host libc timer_t values)<br>
which are integers 0, 1, 2, ... On my system the host libc returns<br>
timer_t values which are pointers -- you can see they are<br>
0x562e81150040, 0x562e81215230, etc.<br>
<br>
The code in QEMU that determines &quot;is this slot in the array<br>
in use or not?&quot; assumes that 0 is a value it can use to mark<br>
&quot;not used&quot;, ie that it is not a valid timer_t. That&#39;s clearly=
<br>
a broken assumption. The effect is that when we&#39;re allocating<br>
an ID for the second timer that gets created we look at the<br>
slot that has the first timer&#39;s host timer_t ID, and because<br>
on your system it&#39;s 0 we think it&#39;s not in use and reuse it.<br>
<br>
Presumably your host has a different (older?) libc than mine,<br>
which is why the difference.<br>
<br>
Now I understand the cause of the bug I&#39;ll think about how to<br>
best fix it, but I won&#39;t get to that until next week.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--000000000000f7687605e46030b3--
