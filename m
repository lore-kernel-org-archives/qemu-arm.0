Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2499024lfj;
        Tue, 17 May 2022 00:37:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2uWK1SMQOUEB5OmH3oHC18lFgdDxr2GA/fS9+EhhvxcVGoyglwGKqNL7zeuRV8I8BjGwc
X-Received: by 2002:a37:501:0:b0:69f:bcda:e371 with SMTP id 1-20020a370501000000b0069fbcdae371mr14922922qkf.39.1652773036881;
        Tue, 17 May 2022 00:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652773036; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+mhne3vTwa6+6ewryRGDgQGMfEp+Ev1H5ySfGNBBLiht9JuBzArW79CwyFsJ2m+Zw
         b5xL3ISV3zDgAiF9WfpWvDSriKWvUN2HozjOP1imq+hDDf/zimwRXMew6pbvcmslW3Ym
         yp/1qtswlpWltlqtEMBX4bCHybXfMFtgpxW4BJztD9VFP+Sbcl0XQ1MMU+ANy8LXT99n
         9UnTJ44mYMLH/UqGHfBpYFC6yYRruvEgt1vQHfkaCh9aRVL4WRtIs5YhrMJ8/W5M9drV
         aK7oqguBFGMyDgYdwwj1AYEJHISkj+V5HXOUZnvqQJTtTpQKOj0WT2teW606AYHbCOfX
         iqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=snE/0rWS++/r+/C3jNaYZ6if3OuV98GZgrGKPbrES+w=;
        b=gUa8s3SvrHlVlUJvHYeikonfp3a4hvM+HpKxBwJcf2OyzfeldgmAkosrocThabFdK6
         XndT0hE6GlckdoSqFtBokcsSvwxo7iaSQdtgWkvVfIQeCGDVdnWhO8PJHhoAgOVFCozi
         12QAUwrYp+5Ti7Yi7wCMHc3AtsFmuP+mMsGc2fVvP0GcN2Yb6yFxQEum6V1ogc1F2E+r
         bziUb/14g9jn2Yn7aVaakOKI8MpfTFUAW738RSYssRV9YeKYTWFqFyky+ncDksIEq38e
         4vWcGTJAFSugBwaRLzNnoyHssHKZ5ujbySPZpjqqpoYdQycgNXnX4MPfrahoT9zT2GNZ
         M1Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yOKc82fJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq1-20020ad45961000000b00459e17a3f8esi7183557qvb.205.2022.05.17.00.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 May 2022 00:37:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yOKc82fJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqrlc-00012t-D0
	for alex.bennee@linaro.org; Tue, 17 May 2022 03:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqrl7-00012R-8O
 for qemu-arm@nongnu.org; Tue, 17 May 2022 03:36:45 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqrl5-00019t-JM
 for qemu-arm@nongnu.org; Tue, 17 May 2022 03:36:44 -0400
Received: by mail-yb1-xb35.google.com with SMTP id e78so9965178ybc.12
 for <qemu-arm@nongnu.org>; Tue, 17 May 2022 00:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=snE/0rWS++/r+/C3jNaYZ6if3OuV98GZgrGKPbrES+w=;
 b=yOKc82fJhJuC64XRruV0JbZDJB0MsRo9EZOdNtB4NOQ47leW6mL3NhB6PQ8mOu8dIJ
 u9WlR56d7dc2QwV3vuG9uFP6HfvElzzsyP7odVxqy8DT3bnaoVAKdOpQ3f2V8Fs/9FIg
 9dlkjoicaIWQ1hL2+kVU3KYgyjhKCalacWbbMu2Isce4gxjnT9uXaefw7INpoeEnD6R+
 3oTyPKavwxsu560vSr6XAtG8PZLF35xMZ4MCNMJ4vphpyVw8J+sdcw8LccQg9T6CqKsH
 vjp2RGwHmMJlblBFYtQQXd0FethzlWml3bZBIxBtuwMIoyJNw3XL319SkF8MbNxkHXsN
 wzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=snE/0rWS++/r+/C3jNaYZ6if3OuV98GZgrGKPbrES+w=;
 b=bc1O9duY/fZj4vvIrhrX9ezRgwJVv4c1k3aFY3CtoQAwfLNTQvvhI/iIbd6bgBGW91
 JXCdGs8SSyoHH9Yy7FR6BHJuyMp/IBEfMYvBjvsbhPAnF9n3dGAQPTRiSDY3VO3BVAwu
 WD4mMrjhtW0WBPSHrvXsVnYybhXJ34zYuDFkXntkK2yS05trlRx92w8/ylR7xu7kKWl8
 Itsonfk3tXbtgYqj/S3bR3ej6X9YH+wUeHd+dSu2ORUS85BURYLgAMOMsavF0iVpJHrM
 R/qC4CPx9oTXPBtlHQIqInOR6GRi1W4RMGwD9Y9V+SGhqdclZqyGlFbyugsf0VIH9uvM
 k7JA==
X-Gm-Message-State: AOAM530R6GkJYe4KEn6T9YNHLPtmF5jEP7V64VF19NnZA0capxG5n/xy
 nS/xRzkAR8zwfHCJ7NhBnIXfpeF9E3rKin55uYtXNw==
X-Received: by 2002:a25:8f82:0:b0:64b:4d9:46fe with SMTP id
 u2-20020a258f82000000b0064b04d946femr21072198ybl.479.1652773002249; Tue, 17
 May 2022 00:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNiinuDjvX2c6uQr-wsRb1BNjLKVNWnokAnTiwYFtZg8-jXqA@mail.gmail.com>
 <CAFEAcA9AL3D6SsjhU2opuAAiCHaTSvvYV3JqCHEMG-7eMVpiAA@mail.gmail.com>
 <CAJNiinuyWmU9_DX5Sa8y14q4n0nn3APgsmq4cSOPH6vwXQubvg@mail.gmail.com>
 <CAFEAcA_4JwJkQAVOyGhVZ8qc9rag=bNVf73COnbUetojwpgHzQ@mail.gmail.com>
 <CAJNiinsuR26_C4mY4iCY81DqtvkwwfdH4K+U-ynzDw-wm2+xXw@mail.gmail.com>
In-Reply-To: <CAJNiinsuR26_C4mY4iCY81DqtvkwwfdH4K+U-ynzDw-wm2+xXw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 May 2022 08:36:31 +0100
Message-ID: <CAFEAcA9YWiJE4grOOjeDL=Hw2B9+ZVPZ5rgT8WZWD28fxi130g@mail.gmail.com>
Subject: Re: Hello world example with qemu-system-arm
To: James Gutbub <jgutbub@asu.edu>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YzHX0xjHBA+k

On Mon, 16 May 2022 at 23:26, James Gutbub <jgutbub@asu.edu> wrote:
>
> Thank you for the help. I tried specifying =E2=80=98-R 0=E2=80=99 and rec=
eive the same error message - qemu-arm: Unable to reserve 0xffff0000 bytes =
of virtual address space at 0x1000 (Permission denied) for use as guest add=
ress space (check your virtual memory ulimit setting, min_mmap_addr or rese=
rve less using -R option)
>
> I have been using the default linker script provided by arm-none-eabi-ld =
but I will continue by using the linker script defined below, which gives t=
he same error message as before.
>
> test.ld file contents:
>
> ENTRY(_Reset)
> SECTIONS
> {
> . =3D 0x0000000;
> .startup . : { startup.o(.text)}
> .text : { *(.text) }
> . =3D 0x8000000;
> .data : { *(.data) }
> .bss : { *(.bss COMMON) }
> . =3D ALIGN(8);
> . =3D . + 0x1000;
> _stack =3D .;
> }

Bear in mind that you are essentially linking a Linux binary
here, not a real bare metal binary. So you don't necessarily get
full control over where you want to put stuff in the address space,
and in particular putting stuff at address 0 is not going to work.
(If you can use an arm-linux-* toolchain then you can likely get
away without having a linker map at all.)

-- PMM
