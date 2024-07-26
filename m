Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp680512njb;
        Fri, 26 Jul 2024 13:08:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGtZ0yj7RrU/mUC0x5yfXyAyueKCuG2cDPiq71Zg3kNjhF5mbJDtCMUIDuY4hWKB6MfWAmuGEMT2GsmO375Dgbtmy4gr3A
X-Google-Smtp-Source: AGHT+IG/KGMS8Bb17PQYL/sxWK0NauoW0fz75WqKWgbqrwNt31nI83gP+f0vR2U+V5+lt2+ELD/J
X-Received: by 2002:a05:622a:1791:b0:44f:e74f:637 with SMTP id d75a77b69052e-45004f31daamr11658651cf.33.1722024496070;
        Fri, 26 Jul 2024 13:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722024496; cv=none;
        d=google.com; s=arc-20160816;
        b=GE+cMtjXPk6pKs3TdB/26stn4IxSB1YtEFPmCmSMhTeNgX5laH9hVMFjRmdSIYlXAb
         7VzbMwGyuK/j+ok142KwA9tpQ4JWwO0vTs1CeXLSoIosPZHEQ8GO1Va4PbV55u+j3s2E
         gWHKiPotH4Bf92JwjRNIVflc2gF++WuxeU7bTDnZYXhUYmNzCklZETM4aEVK/CcxT1OP
         glQPUAhSt6cLv+QNXHBLLsVTZ3LWpksoZBBceYLbRdbPLYCgXokjXdqhGSs2ZO6CPT/d
         /ZqlRUoq9HrMHXuMvR33P9O67HfEkUWyPGjEtUPGf5KaqZorVI6wFckb6IReAy3tRIjJ
         nyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5i+1xR/r6NjwtBueKhQYVFBb3RxDm4yR6OtzI628NlY=;
        fh=W+9lqOwYKkeDrPoFWlFMGBkKiRi71vwD43j9ZyNwpms=;
        b=dZ8cZZg4qHHOWThER1WTN/A3asvEvwlvqHW11jj21H+qfvBVeg3DYpQq37BXT7upnC
         lLSBpxVf3eCQVbt8BYU3bF8a+50FSMAvGJvh8ObuJf3dPzrgba2uXiSpHBQd7W9R7M8d
         P0bUZTt/zNVC6xtC2gqSEj0xcrahI5qs7leMyUV1NsAe2kQBfckzV53Nk7QLNag87oVK
         pcELMLFzO3RiDNVXrVeBK8wRfX/3Ps3w3/+g6iyKZPC7bHG+igl2BXmszA06ftmWXCt1
         uqGMxDYaKqhAl/lbZIhJqSIRYniC48Bw7kpqYCkAnyiBo9y/tVSs/cysSvrecvH1phMq
         TFnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UM2utWYr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe840e52fsi47645201cf.524.2024.07.26.13.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2024 13:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=UM2utWYr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sXREP-00087U-FO; Fri, 26 Jul 2024 16:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonas.c.noll@gmail.com>)
 id 1sXREO-000821-4p
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 16:08:00 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jonas.c.noll@gmail.com>)
 id 1sXREL-0007Rv-Pd
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 16:07:59 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-65f8626780aso582887b3.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2024 13:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722024477; x=1722629277; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5i+1xR/r6NjwtBueKhQYVFBb3RxDm4yR6OtzI628NlY=;
 b=UM2utWYr9PzhYGvdR65gkwghxcKnIcV4J+nhmc3XTcCXw2Pm5AZ53cVktbHgDmbxuW
 CbGex+VNGDGUWAmejEnw94QjtVbVOBLp3idRTFyiDI081dlnWt1/pHnoJD49+iyoaVcR
 IF4Q8e7g54haf4iR4RmQ0UjOfFIZcKJjyjF/21pIsdlKFsHRk/Bnqs0oC00nmu5R1MuG
 nsHysrdQgb4cVYTeWHT8n1hnMYLnfHulNlUFWrOKeTDDEFYt71FAFJ6GweAOZPUeSe+p
 zeuvPHrXU2yf6cPg+5lpyaG1CYtcIdzKhLPUd0kJLYqsmwD6zrjmEB/2pcMQDcIfF5Mp
 HeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722024477; x=1722629277;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5i+1xR/r6NjwtBueKhQYVFBb3RxDm4yR6OtzI628NlY=;
 b=BUOLUFoumL50ZJQSokgfpcqB12FBcc47CkHp9EMEwQNH26Eby6XYt9eXCrliFn5IDI
 0ohzjJdKreOGkSzv45tpiK3Sfg6NZslyR2Nj/ng7B+m65mJH50cFTs0go7i+iDqt3CPH
 FSovZoG29LRmb0x6Wsq2vF/20eDPVB7oMHg+F5EiW9vSdkV6gOEqJKjNvOptmutj8IkD
 lDzTudhBAGp8Cp08c3GSCB97wgJuewOJmQKVrSa75gOxtDXmvcwuiERDN/jDMXQ6pw9F
 kt5ktELWDwLvfUxLWZ19h9nA3VAL/pYsm0wmjQCr2GOBBRD/RGj4hbmdZnXzG10km6Ga
 VJ+g==
X-Gm-Message-State: AOJu0YxPI64Ml7vQ0I6vNvhN6G454QAL1OC41tDHKBZaJsoIV+507IKI
 /oHk5AXOyTe/hPh3Evfrk5o3YGksjyWbFydqs0PBovUx+cJTPEPz2VaXOCAu/XJQux8ItBHmIxY
 hWVo7cr0yTdyHcAgjxtHHZyn4qjf+2Xfs/Rc=
X-Received: by 2002:a0d:f841:0:b0:646:ebea:1da2 with SMTP id
 00721157ae682-67a0a7fc541mr9198827b3.38.1722024476463; Fri, 26 Jul 2024
 13:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAETw2qO29JpKUeqAEzWEu-hNyYG4sB2wfiQA1nD6a8TC9YX7iw@mail.gmail.com>
 <CAFEAcA9POmXL+moGKJOzPm82wTw1eXmfZzHAqGF-uc=EUf8eHQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9POmXL+moGKJOzPm82wTw1eXmfZzHAqGF-uc=EUf8eHQ@mail.gmail.com>
From: Jonas Noll <jonas.c.noll@gmail.com>
Date: Fri, 26 Jul 2024 16:07:45 -0400
Message-ID: <CAETw2qOV84jVApab38iemKN9RZXxeAeKxjba9zDj=GmRHFfsiQ@mail.gmail.com>
Subject: Re: Running qemu-system-aarch64 with KVM support on a dual-booting
 android device
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000036dd05061e2c1149"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=jonas.c.noll@gmail.com; helo=mail-yw1-x112b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NOPVhaU5axSf

--00000000000036dd05061e2c1149
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wanted to rope everyone in here since I have forgotten to include the
mailing list in my reply.

This worked for the main error but I continued to get the

> qemu-system-aarch64: error creating in-kernel ITS: No such device

error. This was fixed with Peter's other suggestion in a private email
thread:
"The error means QEMU asked the kernel to create an ITS device,
but it said it didn't support it. So kernel too old, or kernel
with the ITS handling not compiled in. You can force QEMU to
create a VM without an ITS with '-machine virt,its=3Doff".

This also worked. But naturally there's another problem now. Also not
having much luck finding anything on this one:

> CPU Reset (CPU 0)
> R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
> R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
> R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
> R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D00000000
> PSR=3D40000000 -Z-- A usr26
> CPU Reset (CPU 1)
> R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
> R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
> R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
> R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D00000000
> PSR=3D40000000 -Z-- A usr26
> CPU Reset (CPU 2)
> R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
> R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
> R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
> R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D00000000
> PSR=3D40000000 -Z-- A usr26
> CPU Reset (CPU 3)
> R00=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000
> R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D00000000
> R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D00000000
> R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D00000000
> PSR=3D40000000 -Z-- A usr26
> CPU Reset (CPU 0)
>  PC=3D0000000000000000 X00=3D0000000000000000 X01=3D0000000000000000
> X02=3D0000000000000000 X03=3D0000000000000000 X04=3D0000000000000000
> X05=3D0000000000000000 X06=3D0000000000000000 X07=3D0000000000000000
> X08=3D0000000000000000 X09=3D0000000000000000 X10=3D0000000000000000
> X11=3D0000000000000000 X12=3D0000000000000000 X13=3D0000000000000000
> X14=3D0000000000000000 X15=3D0000000000000000 X16=3D0000000000000000
> X17=3D0000000000000000 X18=3D0000000000000000 X19=3D0000000000000000
> X20=3D0000000000000000 X21=3D0000000000000000 X22=3D0000000000000000
> X23=3D0000000000000000 X24=3D0000000000000000 X25=3D0000000000000000
> X26=3D0000000000000000 X27=3D0000000000000000 X28=3D0000000000000000
> X29=3D0000000000000000 X30=3D0000000000000000  SP=3D0000000000000000
> PSTATE=3D400003c5 -Z-- EL1h
> CPU Reset (CPU 1)
>  PC=3D0000000000000000 X00=3D0000000000000000 X01=3D0000000000000000
> X02=3D0000000000000000 X03=3D0000000000000000 X04=3D0000000000000000
> X05=3D0000000000000000 X06=3D0000000000000000 X07=3D0000000000000000
> X08=3D0000000000000000 X09=3D0000000000000000 X10=3D0000000000000000
> X11=3D0000000000000000 X12=3D0000000000000000 X13=3D0000000000000000
> X14=3D0000000000000000 X15=3D0000000000000000 X16=3D0000000000000000
> X17=3D0000000000000000 X18=3D0000000000000000 X19=3D0000000000000000
> X20=3D0000000000000000 X21=3D0000000000000000 X22=3D0000000000000000
> X23=3D0000000000000000 X24=3D0000000000000000 X25=3D0000000000000000
> X26=3D0000000000000000 X27=3D0000000000000000 X28=3D0000000000000000
> X29=3D0000000000000000 X30=3D0000000000000000  SP=3D0000000000000000
> PSTATE=3D400003c5 -Z-- EL1h
> CPU Reset (CPU 2)
>  PC=3D0000000000000000 X00=3D0000000000000000 X01=3D0000000000000000
> X02=3D0000000000000000 X03=3D0000000000000000 X04=3D0000000000000000
> X05=3D0000000000000000 X06=3D0000000000000000 X07=3D0000000000000000
> X08=3D0000000000000000 X09=3D0000000000000000 X10=3D0000000000000000
> X11=3D0000000000000000 X12=3D0000000000000000 X13=3D0000000000000000
> X14=3D0000000000000000 X15=3D0000000000000000 X16=3D0000000000000000
> X17=3D0000000000000000 X18=3D0000000000000000 X19=3D0000000000000000
> X20=3D0000000000000000 X21=3D0000000000000000 X22=3D0000000000000000
> X23=3D0000000000000000 X24=3D0000000000000000 X25=3D0000000000000000
> X26=3D0000000000000000 X27=3D0000000000000000 X28=3D0000000000000000
> X29=3D0000000000000000 X30=3D0000000000000000  SP=3D0000000000000000
> PSTATE=3D400003c5 -Z-- EL1h
> CPU Reset (CPU 3)
>  PC=3D0000000000000000 X00=3D0000000000000000 X01=3D0000000000000000
> X02=3D0000000000000000 X03=3D0000000000000000 X04=3D0000000000000000
> X05=3D0000000000000000 X06=3D0000000000000000 X07=3D0000000000000000
> X08=3D0000000000000000 X09=3D0000000000000000 X10=3D0000000000000000
> X11=3D0000000000000000 X12=3D0000000000000000 X13=3D0000000000000000
> X14=3D0000000000000000 X15=3D0000000000000000 X16=3D0000000000000000
> X17=3D0000000000000000 X18=3D0000000000000000 X19=3D0000000000000000
> X20=3D0000000000000000 X21=3D0000000000000000 X22=3D0000000000000000
> X23=3D0000000000000000 X24=3D0000000000000000 X25=3D0000000000000000
> X26=3D0000000000000000 X27=3D0000000000000000 X28=3D0000000000000000
> X29=3D0000000000000000 X30=3D0000000000000000  SP=3D0000000000000000
> PSTATE=3D400003c5 -Z-- EL1h
> *error: kvm run failed Function not implemented*
>  PC=3D00000000000051e8 X00=3D0000000000000001 X01=3D0000000040080000
> X02=3D0000000000000004 X03=3D0000000030d0198d X04=3D00ff000000009000
> X05=3D0000000080000000 X06=3D0000000000000018 X07=3D0000000000000016
> X08=3D000000004007c000 X09=3D5aa55aa55aa55aa5 X10=3D0000000000000000
> X11=3D0000000000000000 X12=3D0000000000000000 X13=3D0000000000000000
> X14=3D0000000000000000 X15=3D0000000000000000 X16=3D0000000000000000
> X17=3D0000000000000000 X18=3D0000000000000000 X19=3D0000000000000000
> X20=3D0000000000000000 X21=3D0000000000000000 X22=3D0000000000000000
> X23=3D0000000000000000 X24=3D0000000000000000 X25=3D0000000000000000
> X26=3D0000000000000000 X27=3D0000000000000000 X28=3D0000000000000000
> X29=3D0000000000000000 X30=3D0000000000005168  SP=3D0000000040080000
> PSTATE=3D600003c5 -ZC- EL1h
>

 checking logs I found this:

> $ dmesg | grep kvm
> [ 7197.208742]  (4)[6508:qemu-system-aar]kvm [6508]: load/store
> instruction decoding not implemented
>

Hopefully this isn't a hardware limitation but any advice would be welcomed
still :)





On Fri, Jul 26, 2024 at 5:55=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Fri, 26 Jul 2024 at 02:01, Jonas Noll <jonas.c.noll@gmail.com> wrote:
> >
> > Hello.
> >
> > I'm running into the following issue:
> >>
> >> $ ./run_vm_kvm.sh
> >> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0):
> Invalid argument
> >
> > but sometimes this issue:
> >>
> >> $ ./run_vm_kvm.sh
> >> qemu-system-aarch64: error creating in-kernel ITS: No such device
> >
> >
> > I'm currently trying to run a windows 11 for arm VM on a Cosmo
> Communicator (an android phone that allows dual booting Debian Linux)
> > It runs a helios p70 with cortex-a53 small cores and cortex-a73 big cor=
es
>
> You need to make sure you run QEMU in a way that it is constrained
> to only run on one set of cores. KVM doesn't support running a
> VM in a heterogeneous (big/little) setup (and unfortunately there's
> no real way to diagnose this problem at startup).
>
> thanks
> -- PMM
>

--00000000000036dd05061e2c1149
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Wanted to rope everyone in here since I have forgotte=
n to include the mailing list in my reply. <br><br></div>This worked for th=
e main error but I continued to get the <br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<span>qemu-system-aarch64: error creating in-kernel ITS: No such device</sp=
an>

</blockquote><div>error. This was fixed with Peter&#39;s other suggestion i=
n a private email thread:<br>&quot;The error means QEMU asked the kernel to=
 create an ITS device,<br>
but it said it didn&#39;t support it. So kernel too old, or kernel<br>
with the ITS handling not compiled in. You can force QEMU to<br>
create a VM without an ITS with &#39;-machine virt,its=3Doff&quot;.<br><br>=
</div><div>This also worked. But naturally there&#39;s another problem now.=
 Also not having much luck finding anything on this one:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">CPU Reset (CPU 0)<br>R00=3D00000000 R01=
=3D00000000 R02=3D00000000 R03=3D00000000<br>R04=3D00000000 R05=3D00000000 =
R06=3D00000000 R07=3D00000000<br>R08=3D00000000 R09=3D00000000 R10=3D000000=
00 R11=3D00000000<br>R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=3D000=
00000<br>PSR=3D40000000 -Z-- A usr26<br>CPU Reset (CPU 1)<br>R00=3D00000000=
 R01=3D00000000 R02=3D00000000 R03=3D00000000<br>R04=3D00000000 R05=3D00000=
000 R06=3D00000000 R07=3D00000000<br>R08=3D00000000 R09=3D00000000 R10=3D00=
000000 R11=3D00000000<br>R12=3D00000000 R13=3D00000000 R14=3D00000000 R15=
=3D00000000<br>PSR=3D40000000 -Z-- A usr26<br>CPU Reset (CPU 2)<br>R00=3D00=
000000 R01=3D00000000 R02=3D00000000 R03=3D00000000<br>R04=3D00000000 R05=
=3D00000000 R06=3D00000000 R07=3D00000000<br>R08=3D00000000 R09=3D00000000 =
R10=3D00000000 R11=3D00000000<br>R12=3D00000000 R13=3D00000000 R14=3D000000=
00 R15=3D00000000<br>PSR=3D40000000 -Z-- A usr26<br>CPU Reset (CPU 3)<br>R0=
0=3D00000000 R01=3D00000000 R02=3D00000000 R03=3D00000000<br>R04=3D00000000=
 R05=3D00000000 R06=3D00000000 R07=3D00000000<br>R08=3D00000000 R09=3D00000=
000 R10=3D00000000 R11=3D00000000<br>R12=3D00000000 R13=3D00000000 R14=3D00=
000000 R15=3D00000000<br>PSR=3D40000000 -Z-- A usr26<br>CPU Reset (CPU 0)<b=
r>=C2=A0PC=3D0000000000000000 X00=3D0000000000000000 X01=3D0000000000000000=
<br>X02=3D0000000000000000 X03=3D0000000000000000 X04=3D0000000000000000<br=
>X05=3D0000000000000000 X06=3D0000000000000000 X07=3D0000000000000000<br>X0=
8=3D0000000000000000 X09=3D0000000000000000 X10=3D0000000000000000<br>X11=
=3D0000000000000000 X12=3D0000000000000000 X13=3D0000000000000000<br>X14=3D=
0000000000000000 X15=3D0000000000000000 X16=3D0000000000000000<br>X17=3D000=
0000000000000 X18=3D0000000000000000 X19=3D0000000000000000<br>X20=3D000000=
0000000000 X21=3D0000000000000000 X22=3D0000000000000000<br>X23=3D000000000=
0000000 X24=3D0000000000000000 X25=3D0000000000000000<br>X26=3D000000000000=
0000 X27=3D0000000000000000 X28=3D0000000000000000<br>X29=3D000000000000000=
0 X30=3D0000000000000000 =C2=A0SP=3D0000000000000000<br>PSTATE=3D400003c5 -=
Z-- EL1h<br>CPU Reset (CPU 1)<br>=C2=A0PC=3D0000000000000000 X00=3D00000000=
00000000 X01=3D0000000000000000<br>X02=3D0000000000000000 X03=3D00000000000=
00000 X04=3D0000000000000000<br>X05=3D0000000000000000 X06=3D00000000000000=
00 X07=3D0000000000000000<br>X08=3D0000000000000000 X09=3D0000000000000000 =
X10=3D0000000000000000<br>X11=3D0000000000000000 X12=3D0000000000000000 X13=
=3D0000000000000000<br>X14=3D0000000000000000 X15=3D0000000000000000 X16=3D=
0000000000000000<br>X17=3D0000000000000000 X18=3D0000000000000000 X19=3D000=
0000000000000<br>X20=3D0000000000000000 X21=3D0000000000000000 X22=3D000000=
0000000000<br>X23=3D0000000000000000 X24=3D0000000000000000 X25=3D000000000=
0000000<br>X26=3D0000000000000000 X27=3D0000000000000000 X28=3D000000000000=
0000<br>X29=3D0000000000000000 X30=3D0000000000000000 =C2=A0SP=3D0000000000=
000000<br>PSTATE=3D400003c5 -Z-- EL1h<br>CPU Reset (CPU 2)<br>=C2=A0PC=3D00=
00000000000000 X00=3D0000000000000000 X01=3D0000000000000000<br>X02=3D00000=
00000000000 X03=3D0000000000000000 X04=3D0000000000000000<br>X05=3D00000000=
00000000 X06=3D0000000000000000 X07=3D0000000000000000<br>X08=3D00000000000=
00000 X09=3D0000000000000000 X10=3D0000000000000000<br>X11=3D00000000000000=
00 X12=3D0000000000000000 X13=3D0000000000000000<br>X14=3D0000000000000000 =
X15=3D0000000000000000 X16=3D0000000000000000<br>X17=3D0000000000000000 X18=
=3D0000000000000000 X19=3D0000000000000000<br>X20=3D0000000000000000 X21=3D=
0000000000000000 X22=3D0000000000000000<br>X23=3D0000000000000000 X24=3D000=
0000000000000 X25=3D0000000000000000<br>X26=3D0000000000000000 X27=3D000000=
0000000000 X28=3D0000000000000000<br>X29=3D0000000000000000 X30=3D000000000=
0000000 =C2=A0SP=3D0000000000000000<br>PSTATE=3D400003c5 -Z-- EL1h<br>CPU R=
eset (CPU 3)<br>=C2=A0PC=3D0000000000000000 X00=3D0000000000000000 X01=3D00=
00000000000000<br>X02=3D0000000000000000 X03=3D0000000000000000 X04=3D00000=
00000000000<br>X05=3D0000000000000000 X06=3D0000000000000000 X07=3D00000000=
00000000<br>X08=3D0000000000000000 X09=3D0000000000000000 X10=3D00000000000=
00000<br>X11=3D0000000000000000 X12=3D0000000000000000 X13=3D00000000000000=
00<br>X14=3D0000000000000000 X15=3D0000000000000000 X16=3D0000000000000000<=
br>X17=3D0000000000000000 X18=3D0000000000000000 X19=3D0000000000000000<br>=
X20=3D0000000000000000 X21=3D0000000000000000 X22=3D0000000000000000<br>X23=
=3D0000000000000000 X24=3D0000000000000000 X25=3D0000000000000000<br>X26=3D=
0000000000000000 X27=3D0000000000000000 X28=3D0000000000000000<br>X29=3D000=
0000000000000 X30=3D0000000000000000 =C2=A0SP=3D0000000000000000<br>PSTATE=
=3D400003c5 -Z-- EL1h<br><b>error: kvm run failed Function not implemented<=
/b><br>=C2=A0PC=3D00000000000051e8 X00=3D0000000000000001 X01=3D00000000400=
80000<br>X02=3D0000000000000004 X03=3D0000000030d0198d X04=3D00ff0000000090=
00<br>X05=3D0000000080000000 X06=3D0000000000000018 X07=3D0000000000000016<=
br>X08=3D000000004007c000 X09=3D5aa55aa55aa55aa5 X10=3D0000000000000000<br>=
X11=3D0000000000000000 X12=3D0000000000000000 X13=3D0000000000000000<br>X14=
=3D0000000000000000 X15=3D0000000000000000 X16=3D0000000000000000<br>X17=3D=
0000000000000000 X18=3D0000000000000000 X19=3D0000000000000000<br>X20=3D000=
0000000000000 X21=3D0000000000000000 X22=3D0000000000000000<br>X23=3D000000=
0000000000 X24=3D0000000000000000 X25=3D0000000000000000<br>X26=3D000000000=
0000000 X27=3D0000000000000000 X28=3D0000000000000000<br>X29=3D000000000000=
0000 X30=3D0000000000005168 =C2=A0SP=3D0000000040080000<br>PSTATE=3D600003c=
5 -ZC- EL1h<br></blockquote><div><br></div><div>=C2=A0checking logs I found=
 this:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">$ dmesg | grep =
kvm<br>[ 7197.208742] =C2=A0(4)[6508:qemu-system-aar]kvm [6508]: load/store=
 instruction decoding not implemented<br></blockquote><div><br></div><div>H=
opefully this isn&#39;t a hardware limitation but any advice would be welco=
med still :)<br><br><br></div><div><br></div><div>=C2=A0<br></div></div></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Jul 26, 2024 at 5:55=E2=80=AFAM Peter Maydell &lt;<a href=3D"mai=
lto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 26 Jul 2024 a=
t 02:01, Jonas Noll &lt;<a href=3D"mailto:jonas.c.noll@gmail.com" target=3D=
"_blank">jonas.c.noll@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello.<br>
&gt;<br>
&gt; I&#39;m running into the following issue:<br>
&gt;&gt;<br>
&gt;&gt; $ ./run_vm_kvm.sh<br>
&gt;&gt; qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0):=
 Invalid argument<br>
&gt;<br>
&gt; but sometimes this issue:<br>
&gt;&gt;<br>
&gt;&gt; $ ./run_vm_kvm.sh<br>
&gt;&gt; qemu-system-aarch64: error creating in-kernel ITS: No such device<=
br>
&gt;<br>
&gt;<br>
&gt; I&#39;m currently trying to run a windows 11 for arm VM on a Cosmo Com=
municator (an android phone that allows dual booting Debian Linux)<br>
&gt; It runs a helios p70 with cortex-a53 small cores and cortex-a73 big co=
res<br>
<br>
You need to make sure you run QEMU in a way that it is constrained<br>
to only run on one set of cores. KVM doesn&#39;t support running a<br>
VM in a heterogeneous (big/little) setup (and unfortunately there&#39;s<br>
no real way to diagnose this problem at startup).<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000036dd05061e2c1149--
