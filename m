Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4965688lfg;
        Thu, 27 Feb 2020 13:49:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNJQPmmSbCsK00DRzg5Q6MhNfH6stswEkWxxnxVdtNaJhSCBq9dWfsAZLLhtjdyTlKvPuB
X-Received: by 2002:a37:a87:: with SMTP id 129mr1640431qkk.270.1582840187701;
        Thu, 27 Feb 2020 13:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582840187; cv=none;
        d=google.com; s=arc-20160816;
        b=pMHrMkJq06DNL3cgvdwNZWGjCGLFzVuGThaCvTe9VMEZ4/KHlh/MWq0elSUiHW93Ew
         mr2c0mviHgY3RPEgMXVUS130ARfPHdVo6Ag0wvQJJcCPu8aa+AYCxFHEwfOZDiJitACk
         iXnM8E0Lnc9FJ0Pxezpv35hfdywq7HG27PZ11uWBrJ2l4jw++lYsvbNEd8J3tTRdeKQq
         6ezqSLDskNaTobrTMGcNsOYIKuaWYZN/hVP85wVRD39Ve1dNndgTB94SonVpb6aGIArC
         qNrAKZJIupi56BdVUO0dq/shrEL5fiCZ8FhctKrBmqNyPK49YPFzTj36QTZIns8vRnxV
         dwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2YFo13JeBiET7bAmKbDjgEr8zneKHVMEzIGM7cv+T/U=;
        b=tVmgGyn6WwCAihE3hZN4Tx5E9Vv1eh2HKJhY5T0dIB+WqSmVFsGd7ZuqoggCzMYqEm
         Jkp0/Cnm42f0zc68Tc7BG2CL8tc+b/N5mqIK+ThxOWorIDMXRdK95EYUoFCpcL3fpFJA
         fWxDBAUAiSnpB+iVwGgT0Jrxtt+BKXl+KsgiTb/yNiACMKiopF/R1O348otbJGpRMrcR
         PCY97vgkb0U/2sXlBVdkvjW++fyx1AoOQ/VNdXL1sTXit8MwnuwpXE2g4ajYCeCYq7uK
         cvHzsxsq4W1n8mFj7b8kXPYzD/QRvUOzGt/J1ksK2+82QHgAH9kx8E1b3tlSzaIgnXJp
         sHag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=axjqCfTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21si345212qkj.67.2020.02.27.13.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 13:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=axjqCfTH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7R2R-0001UE-4p
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 16:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j7R2I-0001Tx-Qx
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 16:49:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j7R2H-0006Gs-TL
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 16:49:38 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:38977)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j7R2H-0006Fg-Kc; Thu, 27 Feb 2020 16:49:37 -0500
Received: by mail-lf1-x143.google.com with SMTP id n30so549521lfh.6;
 Thu, 27 Feb 2020 13:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2YFo13JeBiET7bAmKbDjgEr8zneKHVMEzIGM7cv+T/U=;
 b=axjqCfTHL+XlsIvsFAdNXIttY+MFxh62SAWtkS03TIGPmti9uMjUEBqyIYuKDsxeEi
 fmCR6QC/kWPlcSD2n3I4E8lG/w2klAT5LGV3O/Cvf+M3DSJqgn/7HW9zxXCVFNNqif4h
 ooB4Q2MbxN+/tBYtOElYkIyVCTddIElGuMAg/O9nj9255fIXHmyFKbjUjV/2VHE8lRZs
 aUrRHrPay1CjDV21oZ/4FSWBHuF6xENiO6WoiytvDWCMgD5VSuqLfJHYeuN+DfSRhwsf
 SBSfDqEeFMbk1IGqDGiel7zLq1YY0sS4KMrCaZrMXXRU/CvFo2NWAhCOIKk2JCwRgRD1
 FGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2YFo13JeBiET7bAmKbDjgEr8zneKHVMEzIGM7cv+T/U=;
 b=rLFnJRyCoHfC8igSaNTR64TfzJL9Qt/vsQHd66Iit8c2djdX7+1bkFDg793hAydGCV
 Q+sMmHqEgNJnf11oJrSONzdjGNAuL2XIH3Va+YhuHnN5XY2ikQT5tL30QsO13EsjKPsW
 9B7cTcWGke1TU335/DpLic7DI+9lrEzkNR7ugI00iUAoyd7/ZoMZCYyITzh8RtZ2fMvD
 pVRhYuOYYD5a/hra/7ykXNCMOpT9y2mVDqejd3V0th/k3y+gLqdUwl3P2EV0xIweCWVT
 ESjS+idiHM/6wUsVuHitBHVvTq0RvLXnAIA3rHtUu6Am3Bz0a6A+RSP/RooZjFOUbhXb
 c6Qw==
X-Gm-Message-State: ANhLgQ0rdMBAnOdO+9lqP4cDkSEe86Os+xI4l93Ph1ee9seVDTRa9PU1
 LDujlN9DMbamXcxkNZSJx7aVAKF19a/J0LijX8c=
X-Received: by 2002:ac2:5111:: with SMTP id q17mr796743lfb.51.1582840175870;
 Thu, 27 Feb 2020 13:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20200227115005.66349-1-root@stephanos.io>
 <20200227115005.66349-3-root@stephanos.io>
 <88ad7129-9654-088d-6569-066949973a86@redhat.com>
 <CAKmqyKMkTsgqSEWhrkCmbQ3LMNz1OgdeHE6zFaMsZdRjAFvdRA@mail.gmail.com>
 <CAFEAcA_i9Qjvq1Bp8Me2JnUwL5bwEaUTi+8uvusNMcoc7OwfkQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_i9Qjvq1Bp8Me2JnUwL5bwEaUTi+8uvusNMcoc7OwfkQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 27 Feb 2020 13:41:55 -0800
Message-ID: <CAKmqyKNJWbf0Er=jLyr_vmrS_vDOFWz9eW8mRjFkDjk3WJHZXg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/arm/armv7m: Downgrade CPU reset handler priority
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
Cc: Stephanos Ioannidis <root@stephanos.io>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BSpQBC2mcITe

On Thu, Feb 27, 2020 at 1:44 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 27 Feb 2020 at 21:37, Alistair Francis <alistair23@gmail.com> wrote:
> > I do hit this problem, Peter described a workaround in the previous
> > version of this patch, that is to link at address 0 instead of the
> > alias address.
>
> Do you happen to have a simple test case you can send me
> that demonstrates the bug? That will save me a bit of
> messing around when I come to try to fix it...

Yep!

This repo: https://github.com/alistair23/CSSE3010-QEMU-Examples

Run: np2_env.sh to setup variables

Then build an example in the examples directory.

That repo will hard fault on QEMU currently (it doesn't have the address fix).

Alistair

>
> thanks
> -- PMM
