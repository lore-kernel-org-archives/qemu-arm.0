Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp198597njk;
        Thu, 20 Feb 2025 08:54:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCc/L+wdtH0PyFI4YafJTS1xyeATo46gMlem4aWPFyb5uiCJ0PhI/NtCL5st/U0urg146WTeYta8DWfw==@linaro.org
X-Google-Smtp-Source: AGHT+IFofuni5cNp8l122PIPLCzo4vbgPaTEn5ixdyEiQ8t5vvP38Zobq59JJ7CFhJONR072SOES
X-Received: by 2002:a05:620a:29c4:b0:7c0:add8:175d with SMTP id af79cd13be357-7c0add82dc1mr1645345785a.18.1740070442757;
        Thu, 20 Feb 2025 08:54:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740070442; cv=none;
        d=google.com; s=arc-20240605;
        b=j6YBLmJTVELstclHXQdN+u1H/WR6wLTlgcRBgieKFUM0Yw/zYGONICzV/8h0XDdyQX
         kd6PoZ8tTxo8XkLV89TT3Ua9BIzIuIAqNsYJqi4ThNYsqTdtSPt+/lvPIuMwaiorGW+m
         qbzujT3xa/9KDc/fioVukkjJYa4JrytLRmOYj16tZxd7V6NxLIiY4SmQMsWROgE4vmGM
         yNsiLmQ9NFUcaasfJIyed2gzZR0cN7+ut7jNQvnBzHhHZgN0TUhefaIX/PRqqt7UJ2jA
         rtmeGKqWtvyi8ZhHNw6NCqyziB4jg/5k24WGbJ5C+VQ9YWYEqysBcHQTAvmkNA2lKgKn
         gmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WGueGLJKjxjk0mP/vtDKATK7kGCq/pQ/lzWMFb9XyBo=;
        fh=pVK8cZI47VUMQKs7dBdSrDNj1Ikmva3dkLg7UZ638Vs=;
        b=PmgBk80uj25bXNj8gyGymiGrt2L15ZlRK7NVV1qvwXGdIMTaimDr8yjIobAKZPZLuj
         LSCJLOOQcnyFfuOPeb3dKVzzaPVqwkXDvzknN2Uz/qBO2BMpLodCBNHJRFqlsmWRMMdu
         cFIJwthpBWQajDmXQna6kkXbNHPkPy8ZmwymcbG8kvlz5cTsX7bQ34xsV3Mbaftx0D+z
         uaLLoLd23PC2f0NlWVESqK5yTxsHGLM54SznESmxpHAXE2beVnPZNKSFNq0ziv8ubaxe
         A7JNqXsyaH6ijuW38QhnMHxg3JHDABx7aRz8py0vpzBLNrG8ndX7peuawHYILGl333iN
         09/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ns+3uil5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0bf1e9a21si235942185a.384.2025.02.20.08.54.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 08:54:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Ns+3uil5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tl9nq-0005eq-L9; Thu, 20 Feb 2025 11:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1tl9np-0005du-Bh
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 11:53:33 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1tl9ng-0005ne-Kv
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 11:53:26 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5461a3a03bdso7658e87.1
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2025 08:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740070400; x=1740675200; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WGueGLJKjxjk0mP/vtDKATK7kGCq/pQ/lzWMFb9XyBo=;
 b=Ns+3uil5p4Kkc4hsWNr6r83ClRZvKMbYAsIbxa1AddMJgapGy0ond/0yPv50Xxf4aI
 SugM5zdsNCqc29GemN3G8jAZnnZJLdqMXf3Dc0vxzN9baIMNy49BQdK+8LmU5GIh5J5K
 t58dlKjcDIvXf51mrGtR1JLWoGhaHCVrv4G+wbFI1qtgSJHRedR1rn1QiVOFF8yiNhck
 oCcU6PHHEyos2YBgcCap9mvmUgWweEEBbpSLuLq5AIn/Wpn40QpHyeqDSqdB6AVZa4h5
 wwTvozoHVzenp2UKz3G5cL7nxY7PRPGKS/sg9X0HFeZHlshq7aDl05en8lvxe99jN+5h
 jG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740070400; x=1740675200;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGueGLJKjxjk0mP/vtDKATK7kGCq/pQ/lzWMFb9XyBo=;
 b=xLvS3/K59r405/0VumiIChfbWNUmENajNoDruxJLOOcdxFgLmVNiABdkG19+VrTqVZ
 NckWoDFm1f3CihsTY5ifCeFBUuvCaJ6Se26vUAKI8dQlJBt6LyA5m5a2qWcnvpmhFZ39
 zBdeFd3hefsX9XOp9Phb4vPNr2oQ7cMeRxXEn+5DhDwJhJMIc+6WhLpLX5EA0aQnLGhq
 3vBE5IjLBmg+doDLFTM5rJOkJUF3xd4FV+PkQqljfV0XVyOuyr6zHN3VegmOyVS7IhQ9
 X9L23Bi/7pEiCBMiLQzJMY+ItwMJGxBkRIyRAPlRLfRkOMQqdSmQfnfYpKJpiSM1Vi4f
 WKlA==
X-Gm-Message-State: AOJu0YzRkbSzZmW2lC1pMIZBEMpHmiXk7zDE1qS5qVIxQIGAcbo69C4/
 heB/lwiN9ql0wjr2JZGKTOXCv1Ki9GZS/76fJfuyTuzh8goP5ye9je/SakFnHoB3YPe2GhM1XmN
 8AVv9IwBIhD6NKLqem1KYqOyJaFHjF+EOAssv
X-Gm-Gg: ASbGncumbdAJlTBmZhxGE89FUJjg0k26MG5lkucLcc+30XtzlzJthihMgOBZ14lNRKs
 tr8K1f3D6b77h7r84+2v9kABYcF4uMxmIE5ZUB1Fa3gLNOgKsFbogW9S6RKA5CK0T6uGMWrD3Fd
 bXSidXyelU747TiXVZxVDIn3J6SC0=
X-Received: by 2002:a05:6512:1054:b0:545:38d:ffd9 with SMTP id
 2adb3069b0e04-5471c9ba747mr205794e87.1.1740070400341; Thu, 20 Feb 2025
 08:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
 <CAFEAcA_3FOHVo6q_tiOEE7dHZNDw7_0emdCR5=5cEt7fdKVkTQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_3FOHVo6q_tiOEE7dHZNDw7_0emdCR5=5cEt7fdKVkTQ@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 20 Feb 2025 08:53:08 -0800
X-Gm-Features: AWEUYZmP1Zv0kYij9jFDGl1PQ-YBD2nsQoseCAyE1URO_xpdh6oEOH_JnloHAyc
Message-ID: <CAGcCb10OPzQhjMQ0dc06AQt06Y2x2syQURSC26bx=mUsyNir3Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] hw/arm: Add NPCM8XX Support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com, chli30@nuvoton.corp-partner.google.com, 
 pbonzini@redhat.com, jasowang@redhat.com, alistair@alistair23.me, 
 philmd@linaro.org
Content-Type: multipart/alternative; boundary="0000000000001935c2062e95b628"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x132.google.com
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
X-TUID: Brb5oDwmSBxA

--0000000000001935c2062e95b628
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you very much!

On Thu, Feb 20, 2025 at 8:18=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Wed, 19 Feb 2025 at 18:46, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > Changes since v4:
> >
> > 1. Bump vmstate versions on NPCM CLK and GCR modules.
> > 2. Remove "hw/boards.h" include in npcm8xx.h and add it in npcm8xx*.c
> > 3. Use cpu_to_le32 instead of tswap32 in npcm8xx.c
> >
>
> I've applied this to target-arm.next with the fix for the
> type of flash_size applied.
>
> thanks
> -- PMM
>

--0000000000001935c2062e95b628
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you very much!</div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 20, =
2025 at 8:18=E2=80=AFAM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@l=
inaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, 19 Feb 2025 at 18:46, Hao Wu &lt=
;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; Changes since v4:<br>
&gt;<br>
&gt; 1. Bump vmstate versions on NPCM CLK and GCR modules.<br>
&gt; 2. Remove &quot;hw/boards.h&quot; include in npcm8xx.h and add it in n=
pcm8xx*.c<br>
&gt; 3. Use cpu_to_le32 instead of tswap32 in npcm8xx.c<br>
&gt;<br>
<br>
I&#39;ve applied this to target-arm.next with the fix for the<br>
type of flash_size applied.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000001935c2062e95b628--
