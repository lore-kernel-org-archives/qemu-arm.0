Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1493002ejb;
        Mon, 20 May 2024 07:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXq+F5XrNzO/CU50SpxKLOLVtHmn+cfdgpY/EkGXNoXrHdeBVmS5ZrmgghR9JBN+JbVxAXkPXOyfD4vXcsNp1J0iQPaJAzF
X-Google-Smtp-Source: AGHT+IGvq1WZm2suvPnEZSatbYBW51bAW7Pto1P6vt9NeiBCnfOUBM9uxH1citVrKrUzS8U0r91V
X-Received: by 2002:a05:6358:419d:b0:17f:565c:8db2 with SMTP id e5c5f4694b2df-1974d9087bamr89278155d.12.1716216662050;
        Mon, 20 May 2024 07:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716216662; cv=none;
        d=google.com; s=arc-20160816;
        b=NZEvOep1+iWDo33EOKNxIdKHF1+JV/VjPPEHrV3/5J9EGKhpd0C4sOQSAjv0/eiYgL
         K9QM1MnqQwH+5X+lDbhAl3dGWayqJrG4BamTWr/xjtXTJr6ldE18Oh0rNLyPamAT2BpW
         s5PEbhra5tvETKaxs+r3RBX2zZJdkR+Pke2qrYv0jFKOVZ0m50KbTokiTfvaPA2fwZCL
         ztAlcrFUdvFk2dwz8+TL974TlQgGdAHu1YoU8e42PdctmL6mDBYc9YqNjhYDc93tizCh
         2kpOkejvupiK25lhsiYZannADIftWqSnpPlWTQJdRBOIdGdQg1wjQtWt4obQlsKoX9xJ
         XC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=M+RY37ILR+bGutCGqlDSpT5t/N+Xf3qdqRVhsE5xMYs=;
        fh=itTzUIN6ux3qOEWlEJM+YlgvejpJncHONliLXCBVSaM=;
        b=l6hI26QTo5bUb3v4afQm5MdDzthn7bwt+sCcSAGVcCB673Pftw3yvczo+Np9j6iiOc
         A3L7d9vHiK6IJAWZCsD9iazonJGYgX7NVv+wEz3IhdaA16K8Ty7eddtJbB2+HEtcrQpq
         Xg39tMstb8qP3mOqogHV/hWBLzArS3qRxWL6sKOmC+tikLHw9ZIqcDHwUGcVLs/tX2jn
         g1G7EgYRWJ0hnnBQw0MbzzaFRfqQNttDKSfrnif2g9M/HiR1CA7cew5zre2hB/iEFR8g
         LGy35po36KYxYsM7QvnLsmPKcDyyL+hkcl65fpVlZqtV786lWbCmq6CpIhnsIU8UpbQa
         TceA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xn0UsB8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43e3bab80c4si33694731cf.352.2024.05.20.07.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 07:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xn0UsB8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s94LZ-0004tq-3l; Mon, 20 May 2024 10:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tanmaynpatil105@gmail.com>)
 id 1s94LX-0004tX-PN; Mon, 20 May 2024 10:50:39 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tanmaynpatil105@gmail.com>)
 id 1s94LP-0001Rc-FC; Mon, 20 May 2024 10:50:39 -0400
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3c999d53e04so2068262b6e.2; 
 Mon, 20 May 2024 07:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716216629; x=1716821429; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M+RY37ILR+bGutCGqlDSpT5t/N+Xf3qdqRVhsE5xMYs=;
 b=Xn0UsB8tgiZTtQG2j2HHVFTulIouqhPu8TJvNVlMP/FVSQsXIeornv+84W/6XztZNT
 O8GTJhCiyH3IVvUemiFucHRXJHBWyIVoxcN2QQjVActyPdlMrQog46ZwKSfPK0lSUhT2
 T0xI+ipT8VhMeo5alghq8OVpEbeG200TN1/1N6ibSPikEgl1nEfI0HGOjH9wKVJMIsiv
 e/RdAxpuDjuiN343LfNpVfn35lu5xjuChKd4ddOFGGM7J/f5g0UNG+BYZn6Y7YOU3J73
 GC4HrizGejsLXhU1XYF8DEL7NmRBlicaJv3CkRgiB/QQZ3ZfbVpySUQ4VZiS6fv6ZyuB
 m4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716216629; x=1716821429;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M+RY37ILR+bGutCGqlDSpT5t/N+Xf3qdqRVhsE5xMYs=;
 b=MrK56ZOk/i0drGCs77RgSJP2k/FlD31WkN4QvIxre8W9rh5mEcaF7xznNKKkfHimV4
 0l0/lo34eqgR9hDQPnR4QlJYdJsedrSvhdbrQ4YmlvFz1kfPGOnL/gD2H8jyZNa3C9L6
 HP1F6QHVvMZX0ruzo5M7Jc1DRpvcnIVLJDIm7mVBjxYs0uUQf3994SPU14s3P0HUWXeB
 ucW+q660whifZclAM9fotWAb5/eCVzs+V2u3tefPSm7f6Gxod69T/QPvBN3DQTelEvrv
 m90mHAaovtG0k2d5hOSqTkJKO71mXQQ+ZBgvxPjmrBFvaxPz+nZUY46NFQa5YgZXhpIR
 QYAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRWg7wB9RxqWCj3ugUu6ezvIVMr99aYyrYdq6DtSVURR/1yfTfOYzDNRHnnU/ciJ6ihtBthcRMmUIGpPppm2zFh4Ys
X-Gm-Message-State: AOJu0Yzzo70iPF80s79Hd6vPPYITcMFPAwCRYgP470NDnQ6oSJV7j2eJ
 l91RyYOFp0tc6evMITi3rubUGRa7Q2XfOfWEgkZI0XMU2zdTpBMeQv09jtXbuK/7zQ1XPeikMLf
 Wn3NBfYdTWH8kTbazrz8UTgfuMUc=
X-Received: by 2002:a05:6808:178b:b0:3c9:6f53:ee11 with SMTP id
 5614622812f47-3c9970251camr40434136b6e.8.1716216629347; Mon, 20 May 2024
 07:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240508081502.88375-1-tanmaynpatil105@gmail.com>
 <CAFEAcA_867TphLCF8NeG5OaH9cKwUQjMqXcT9ewgr1QSV57QNQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_867TphLCF8NeG5OaH9cKwUQjMqXcT9ewgr1QSV57QNQ@mail.gmail.com>
From: Tanmay <tanmaynpatil105@gmail.com>
Date: Mon, 20 May 2024 20:20:15 +0530
Message-ID: <CAHnsOnNL_ZbHG48iGSRzoLMsQPUfa2jmOf_aApru3SAgWUCsmQ@mail.gmail.com>
Subject: Re: [PATCH] Fixes: Indentation using spaces instead of TABS and
 improve formatting
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 marcandre.lureau@redhat.com, pbonzini@redhat.com
Content-Type: multipart/alternative; boundary="0000000000008cccef0618e3d2a9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=tanmaynpatil105@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rRJRlsEfOoso

--0000000000008cccef0618e3d2a9
Content-Type: text/plain; charset="UTF-8"

Sure! Thanks for the update.

~ Tanmay

On Mon, 20 May, 2024, 6:32 pm Peter Maydell, <peter.maydell@linaro.org>
wrote:

> On Wed, 8 May 2024 at 09:15, Tanmay Patil <tanmaynpatil105@gmail.com>
> wrote:
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/373
> >
> > Files changed:
> >         - hw/arm/boot.c
> >         - hw/char/omap_uart.c
> >         - hw/gpio/zaurus.c
> >         - hw/input/tsc2005.c
> >
> > Signed-off-by: Tanmay Patil <tanmaynpatil105@gmail.com>
>
> Thanks for this patch; I've applied it to my target-arm.next
> queue and it will get upstream within the next week or so.
> (I tweaked the commit message format a bit.)
>
> -- PMM
>

--0000000000008cccef0618e3d2a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sure! Thanks for the update.<div dir=3D"auto"><br></div><=
div dir=3D"auto">~ Tanmay</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, 20 May, 2024, 6:32 pm Peter Maydell,=
 &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 8 May 2024 at=
 09:15, Tanmay Patil &lt;<a href=3D"mailto:tanmaynpatil105@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">tanmaynpatil105@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/373=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-p=
roject/qemu/-/issues/373</a><br>
&gt;<br>
&gt; Files changed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- hw/arm/boot.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- hw/char/omap_uart.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- hw/gpio/zaurus.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- hw/input/tsc2005.c<br>
&gt;<br>
&gt; Signed-off-by: Tanmay Patil &lt;<a href=3D"mailto:tanmaynpatil105@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">tanmaynpatil105@gmail.com</a>&g=
t;<br>
<br>
Thanks for this patch; I&#39;ve applied it to my target-arm.next<br>
queue and it will get upstream within the next week or so.<br>
(I tweaked the commit message format a bit.)<br>
<br>
-- PMM<br>
</blockquote></div>

--0000000000008cccef0618e3d2a9--
