Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp725913ejk;
        Tue, 30 Jan 2024 02:30:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5eMl89CKuZeWN/sy9EhtPS/ilHoIdwBkoJiHrOWxMsQ+EJgvBcEF+2PGatJHXfxAFH+8I
X-Received: by 2002:a05:622a:38e:b0:42a:3658:5841 with SMTP id j14-20020a05622a038e00b0042a36585841mr10363182qtx.117.1706610611477;
        Tue, 30 Jan 2024 02:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706610611; cv=none;
        d=google.com; s=arc-20160816;
        b=Hj0FHBNMdJsV7D6CZdW1m6g3s7368TmHuLqvIYPTRwJO098ro/BGBtPK85bkIiTF3J
         iEG/7KK4hDko9PQB5/mi3deuTL6JXZ3Dq2tcW2GzPuXmXyTbIgMzTVYp/2mVXGebe/kF
         sV+vinQagsQ1QfURTQIB9DgHxFrzvGTOop6Ms2hvoVjwvpW00s5RU8CXq2m8cbcmeQFT
         SsFMoDM7I0TOHR5g6YajWD12hwSkeKRoNyC0tilXUh042VJ2h3METbajuLJdX6VzkOS5
         Gev2wIRU6sHGbsTpy5/9pEmFc/pcUbu3I3iFqI7WK0UtNoy1YGacyeUeV32fJlup89qo
         W/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=V3AACafdIR9mOFbk8iUl9aKL4lE+jvSmOg4nIbrA3sE=;
        fh=tG91SClu+OfDzmMHKkazd9TowFVdfcSb1bk7axst0w8=;
        b=KFOzW3IBCrM6ABCWd6f2uNhg5iOdU/GtS3Jx7c/EShUU1RvplA9411Zl+l4GyfGiOd
         rVFHq35FFAx8HLnWfuMmzVZel+K1zs52Sh7YP1yMW+EpwqB1paJy0JDk+dV0EXT7Oryy
         wXtuxgcREDeXgP98VkATs+1ZVCWJNcBlkB8HaKpvE0wtoXivgrCWg/NHSFR7HSzavie4
         6LCbpFUgJgqQ4uGB9pudevviTYJ5QjdChqrFxZg+K6NzMKo0BZWTISQ5Au5nRqMrU/3K
         +c7Zp//mG+juplDEnw0BxDC/Ns2SsNmOpqw9z6vG/LsGNoh15NQ/WJXVUwhR7U3tiYr9
         RLxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbEsThA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7-20020ac85b87000000b0042a62bc0b72si6881284qta.617.2024.01.30.02.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 02:30:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbEsThA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUlNT-0000Q5-Sf; Tue, 30 Jan 2024 05:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rUlNS-0000PU-Hc
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 05:30:02 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rUlNH-0006lY-Ra
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 05:30:02 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55f2b0c5ae9so1431244a12.2
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 02:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706610589; x=1707215389; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3AACafdIR9mOFbk8iUl9aKL4lE+jvSmOg4nIbrA3sE=;
 b=GbEsThA6njFGF5WZQDeqw4ShFhuKyHHNs0IvfJdxgoaejfkUrRVH8U4yfNcQrngKSY
 e+xyUZ3QIyKhwrUVn12dnQ/kw90V5BzF2lp14018S3hlCFcwCf/DdgxorOXPZk+PDw9t
 qhkDcdow5hDeCXsNj6zWaCRhKPZyXA30rtXy/uL4B5K4o82HHqP2po9mif1PPb380awz
 9oyW+/zJnS9DYgzZTn16c69hGAI9fV8DrktIMJfFaLSwPCMomSndVBjYbkVHUtgQlK/N
 S78QcXLgYUzHEuilqtdqzxyw1v99+5RybxFGf/iPmQMuRyW7Vo3gYO305B+F7nKJjcWt
 PUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706610589; x=1707215389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V3AACafdIR9mOFbk8iUl9aKL4lE+jvSmOg4nIbrA3sE=;
 b=mqSchVO9U2Bd9JeVdCqJ7g4brhhfHj/Hip4Ntacb0D0o1ypxX1+M1u3pME8HPkuU+r
 SupzmPyLakDQRolenpDRZmyeSj4QJPbHGKhswpFoINJ0bVYqvAyT28Q1dOzPmMK9k275
 zaB+BRLGiFKRhPw1VXhVgsMabKfTV5w0D6XPEW79YCRKIu9L0iQb7YHxD0z1Nq3A+jA5
 p4F39eNJ3Udbbwy5XgtoDPtB8Tq2ojI97jEZXOqLLpSCHOh87aTnusTDsiDyqxJwhTp9
 BToY2uDA+3L2dFQAf5gXwreG+PvI3baenoJzivqgHbf96swRwbgUzM0RCRH4JoCgdPdG
 XVbg==
X-Gm-Message-State: AOJu0Yy5TQem1XRDWrziwPreV8HqUoYt+wvmSjOdhKcZ3c/NWIMWAb/u
 Nq0azBZM8yScBR48hOmLZ8g7e5WEb13AijmgJZDOvbqRv27wfE8nR/1OfVVYpNFnOK/OHnX8dD0
 0MmvonwvOi+TXGhhHtseQOLBrnnLEMR4OK3r+dw==
X-Received: by 2002:a05:6402:504:b0:55e:f164:7765 with SMTP id
 m4-20020a056402050400b0055ef1647765mr4000426edv.32.1706610589713; Tue, 30 Jan
 2024 02:29:49 -0800 (PST)
MIME-Version: 1.0
References: <CA+ji3pGBJBp+trjM-RhgkYjOs8rrtLJgHsaNvf=EyGtWB4gAow@mail.gmail.com>
 <CAFEAcA-L2vepWXfgaHW=ogLAvAZjJd5yv1hm6dBU6dsEOS_gCA@mail.gmail.com>
 <CA+ji3pGVBmDAeUoPM9Zk8pOtpxcR+92XeUBN8G=Mmmyi4Eh8-g@mail.gmail.com>
 <CAFEAcA9AeqbWt1Q5QM_HEwi+A2KYXFs1ZEqfFJcqdktYwWujTQ@mail.gmail.com>
 <CA+ji3pH4ZapKAZ+vCSw6P=svWUtfsWt8aqoTFZX_CV5DzPoOyg@mail.gmail.com>
In-Reply-To: <CA+ji3pH4ZapKAZ+vCSw6P=svWUtfsWt8aqoTFZX_CV5DzPoOyg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Jan 2024 10:29:38 +0000
Message-ID: <CAFEAcA-Hsm1b2-2r=c0n0g+pJUWxLNjhGwdeomBt6=1XqZux=Q@mail.gmail.com>
Subject: Re: Assistance Required for QEMU Hardfault Error with Cortex-M33 on
 MPS2AN505
To: sanjana gogte <sanj27272@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8kYRUzrf/qXg

On Tue, 30 Jan 2024 at 07:48, sanjana gogte <sanj27272@gmail.com> wrote:
>
> I wanted to express my gratitude for your insightful solution concerning =
the INVSTATE fault I was encountering. After recompiling my code with the -=
mthumb compiler flag, the exception is no longer being raised, which marks =
a significant step forward in my project.
>
> However, I've encountered another challenge while working with a specific=
 version of QEMU (QEMU emulator version 7.1.0, v2.6.0-55433-g23b643ba16). W=
hile the code runs flawlessly on QEMU version 8.1.50 (v8.1.0-2375-g516fffc9=
93), the earlier version throws a hard fault, which is critical to my use c=
ase.
>
> The use case involves attaching a remote port to the MPS2-AN505, and for =
this, I need to utilize Xilinx=E2=80=99s fork of QEMU, which is based on ve=
rsion 7.1.0 (v2.6.0-55433-g23b643ba16). The error I encounter during emulat=
ion is as follows:
>
> Loaded reset SP 0x0 PC 0x0 from vector table
> Loaded reset SP 0x10080000 PC 0x10000009 from vector table
> Taking exception 3 [Prefetch Abort] on CPU 0
> ...at fault address 0x10800000
> ...with CFSR.IBUSERR
> ...taking pending secure exception 3
> ...loading from element 3 000000c
> ...loaded new PC 0x10000011 of secure vector table at 0x1
> Taking exception 3 [Prefetch Abort] on CPU 0
> ...at fault address 0x10800000
> ...with CFSR.IBUSERR
> qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)
>
> Observations: When I trace it using the GDB:


> It goes to prefetch abort as soon as I step into reset handler and the co=
nnection gets closed.
> What I do not understand is:
>
> 1) Why is my PC going to address 0x10800000?
>
>
> 2) When I use Qemu version 8.1.50 (v8.1.0-2375-g516fffc993), the PC goes =
to the right address and does not throw a prefetch abort.

This strongly suggests you're running into a QEMU issue
which we've fixed in some QEMU version after 7.1.0.
For bugs in Xilinx's fork of QEMU, you should talk to Xilinx.

In terms of why your PC is going to 0x10800000, it is
almost certainly executing a lot of NOPs from some point
until it runs off the end of the flash memory. If you
use the gdb 'si' command to single step single instructions
you'll probably find this is less confusing than using
the 's' command, which steps an entire C source line.

thanks
-- PMM
