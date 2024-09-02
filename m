Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1130117njf;
        Mon, 2 Sep 2024 07:45:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzv0ewVo4L2TJU+FkKZqpY9daDZzhGd8nqgBoEz4k2zclAYCea03UjcbPdGQYkZJepsgfkPDXd4ZFM5A==@linaro.org
X-Google-Smtp-Source: AGHT+IEqSy3SR1go8PAKqdAnFpbzUTHusww4EFqhHMtQUwAIhvpc8mwVCn5dWHIlE35nEOzkrkHw
X-Received: by 2002:a05:6102:2ac5:b0:493:c767:3fe2 with SMTP id ada2fe7eead31-49a779384abmr5968525137.1.1725288319855;
        Mon, 02 Sep 2024 07:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725288319; cv=none;
        d=google.com; s=arc-20160816;
        b=jzUX9id1o2rARfNDgW3jJ4h33BuhGrHxU9EWf74ly8orVMgmWdoy7p08/QdcD39O3/
         J10TPYGItQPV2n5L3j5K4aIDnHQtd6bW4gxp4K9L7OPXLEHV9PEDiZvCK9hSP+98COm2
         SFGJtTXtVX+HoXmyMTvPJDrKqS+zJHVdvrk3h95ot2xRu6uSmRAtnjNxF2vI0kldBPX0
         G5V4iCqE6D2bj0bU/KSy6n6b9PQ1RqrDtfYHxTOv6RNubLPqi8vfzDPKYh97gk8Ryi3S
         iPSS5XTletgL4985reismVukKwg+Xh/BI8J7zz842k0zoAsnebVsCntMbhCM1NIx2Bh5
         f58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XVWXZcncFPbtKzvQK1fify+2OjCyeL0gnsgaf5SXS18=;
        fh=yvFSE+mlvu3NNt31NEZDuP7XbaBAu6bDG+clSW/LKGY=;
        b=rN6ogSqIlosk+1IS/DO4qHYHwIJjula483jQw8k+XoVXMV3jNrgJ3GSeY4L+vSXyju
         MYhqReeI2G5I+FJBvYVSjiAF48CFw3+7viiTxFbzzK+aMTOUmvpsj2Z1H8w08EwwhBiS
         RbICIp+tLvJDcCoXoC9k1RQlY8VSGifbRJ5XAxewFUDTIK2xnJkghYx4/ZHI1lE6tI9s
         admfDJQPSeOEG3AqNmRKk+1MtmIpa9eML8tVj8KjWyoZHaRFtvY/BUefzIEZugbrFz59
         H4YK6FmtgVXKPuXgK3x+UXfZCPZlPRxSQHB3EnCbyKiKLp8yLBuCX0qHyl217b1Pi3bN
         Zs2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=A5IsFsyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-49a5f4fae21si2586618137.278.2024.09.02.07.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 07:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=A5IsFsyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl8Ig-0008MR-25; Mon, 02 Sep 2024 10:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sl8Ib-0008Ko-Gv; Mon, 02 Sep 2024 10:44:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1sl8IZ-0006vE-V0; Mon, 02 Sep 2024 10:44:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2d8b96c18f0so1005073a91.2; 
 Mon, 02 Sep 2024 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725288294; x=1725893094; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XVWXZcncFPbtKzvQK1fify+2OjCyeL0gnsgaf5SXS18=;
 b=A5IsFsyfK11e1rw3R0a+JyYBFaPGdhQb8v6YhYvA2y8YTUT83/leRyGD7lwYGZf55Z
 0X+r1YYgKTKHAqVGbMolKryGyVPgirbDKYArLtFgl/uAQupV2EAQs9G3W0sV5EE2ELjy
 9UbFffLKaJT+xny9BKDfMQl5tmTChzi8x+YMDmdzSJemX3rRKX1C2Old42iDF99vERDT
 ETQkC1foR5UNYv5eEU+leZZpJ4pnencTVMmmPIAy3/nZ0ers0Bz9/eTkfgJoYTRicCvh
 VYyn1GOtFmXAQuBS1QML62VWxhwjeFa11WZme4Pq11tYSttfd2XF1R2tNqa+bLVLk0I4
 Mg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725288294; x=1725893094;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XVWXZcncFPbtKzvQK1fify+2OjCyeL0gnsgaf5SXS18=;
 b=pKkWkEjA9eFRtWp8dJmhZqOCLGjVTJKTanC5yrAWHEVFEEnT2lczfKxC+A4KmUmi4m
 y43Y46rtZtBIeLY0yVYfslPcSQNwo+1OYCHb45di4y8nPYhO07LUB/NNbQvvT2VZ12+5
 ssksa2GTNfcK+SCCs/Dt39vRAvxwOn3AXZpLypwnyfJMTwxGWkun7o/rLC8PKU22VW4U
 5vqclGiayYhVImWIqrjcLxAm3uFtmokd/mMwHjTizVyaGn3zYplZZTn1ukfkePU0dd5d
 ywpiBVcp/C8E1K17Z4AKIHO7NmanJMZbTq/G7u+Rtxu4MNa1ceJYEPT1iXLN2fJkxVDm
 oOgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzKbMvNmVeSNrFF9SfWYcAKiAv+cyBOqscHjz60QqerFcDz3Co7MwIh6K0ZD5xbJL/fXoVOsHtmw==@nongnu.org
X-Gm-Message-State: AOJu0YzEb/lEJ6drEg0ZwzOGliu5qXZV5YuWzgL8v4tqIs5iS2zZNLoG
 YBK5R7tfcZF/RoNil5Sjq/NNLZXddJ182PhbX+QtMupP4w7JH+rASbZSiQiuTZq683IphNx4I1v
 hxGUdgpKT9YsNAJlpklDACEjkMro=
X-Received: by 2002:a17:90b:188:b0:2d8:ee39:465 with SMTP id
 98e67ed59e1d1-2d8ee391ae2mr2465106a91.1.1725288294088; Mon, 02 Sep 2024
 07:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <CAFEAcA81xDEubwm7ZYHZWtp_9nZh_gd9o=SZK3WOOm0-9Ja3rQ@mail.gmail.com>
 <CA+1FSiiuThJXkgXOnzuw7U26kXaNuHBrJkmh2EXbtOcH00rKhA@mail.gmail.com>
 <CAFEAcA-8tWc7i2OqQTWJvup0QztOK7XeuBzUohT9eNoEADFKuQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-8tWc7i2OqQTWJvup0QztOK7XeuBzUohT9eNoEADFKuQ@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 2 Sep 2024 16:44:17 +0200
Message-ID: <CA+1FSii1WErcfeNqUQMYMYxtChLETXh8SJX7BNkLm=VThd4QSQ@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e7864f062123fba2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
X-TUID: aFI/jpLcASj1

--000000000000e7864f062123fba2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The real problem here is that I'm asking in a lot of "places",but I get
very few useful responses. It seems that there isn't a good knowledge about
the relationships that there are between qemu and android.

On Mon, Sep 2, 2024 at 4:29=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Mon, 2 Sept 2024 at 15:06, Mario Marietto <marietto2008@gmail.com>
> wrote:
> >
> > ---> I think it would be better to fix the guest
> >
> > I have no idea what to do. Please elaborate more.
>
> I know very little about Android -- you'd need to talk to
> somebody who does to find out about how to configure what kind
> of disk it is expecting.
>
> But the broad-outline summary is that to run a guest on QEMU
> then both the guest and QEMU need to agree about what the
> hardware it's running on is. If they disagree, you can fix that
> by changing what QEMU provides, or by changing what the
> guest is expecting. I'm suggesting that you'll get a
> long-term better result here by changing the guest.
>
> -- PMM
>


--=20
Mario.

--000000000000e7864f062123fba2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The real problem here is that I&#39;m asking in a lot of &=
quot;places&quot;,but I get very few useful responses. It seems that there =
isn&#39;t a good knowledge about the relationships that there are between q=
emu and android.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Sep 2, 2024 at 4:29=E2=80=AFPM Peter Maydell &l=
t;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mo=
n, 2 Sept 2024 at 15:06, Mario Marietto &lt;<a href=3D"mailto:marietto2008@=
gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; ---&gt; I think it would be better to fix the guest<br>
&gt;<br>
&gt; I have no idea what to do. Please elaborate more.<br>
<br>
I know very little about Android -- you&#39;d need to talk to<br>
somebody who does to find out about how to configure what kind<br>
of disk it is expecting.<br>
<br>
But the broad-outline summary is that to run a guest on QEMU<br>
then both the guest and QEMU need to agree about what the<br>
hardware it&#39;s running on is. If they disagree, you can fix that<br>
by changing what QEMU provides, or by changing what the<br>
guest is expecting. I&#39;m suggesting that you&#39;ll get a<br>
long-term better result here by changing the guest.<br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000e7864f062123fba2--
