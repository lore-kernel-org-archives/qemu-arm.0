Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3057820lfp;
        Tue, 21 Sep 2021 06:56:05 -0700 (PDT)
X-Received: by 2002:a1c:20c5:: with SMTP id g188mr4744230wmg.182.1632232565148;
        Tue, 21 Sep 2021 06:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632232565; cv=none;
        d=google.com; s=arc-20160816;
        b=Wm1W55NBJA2DE4uAsCifrlFGv4vW9HBgYctpbJFbWkSVO3aoCdsfT86cEX+V+J315W
         3kFOAz7v1hbWe2SLT5lDPN/ySeaaR6gkDrXpIIQtDZ94GRLfSKrGI3YT8MXH1hdEcfWL
         CiswaTXeCLiRqmaSryCEznKwyVfYLWtCeJA68IzMpmU97HwYmCrnJWFzgL4pPsm3xIPB
         jelJA07lTN+IuWJhakoZjrEIwmW4hpjs0boipJZWHnrV4Pm8A80WUqhSbCvyXzVTfkiM
         8iaNpQwCkV/bE7DLl5hPNVUiYn+o5gl3KHj/IzjS6EcWS3LZY+YrLbJJ6+L4TqRdidYR
         mgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d+YA9aBp3W+m+owbojgCvCPTz2XIifjjqNbMKvcy0nA=;
        b=qANdwALV59wWnJ0zKFEgIDD3Y7F89xdPFPg1ByihacYyDc7M1OmaFWHqWfgFdQ8Bav
         2vklRQmW01+2DIf6QdI+tCMITILeaUl+0QSaG8d360dT8xFYtrZKLxi934LvuKTxiaqi
         l5CAzSm0ejTncyfwEJNfBiu4V1yEbvNv/pKcyKbLKQB2Z8OSobOKSfwxFYM2MW53vU74
         6ixk5Pk7pAYqmRFhyViFCxh4GtdaCxuEGquwaXbTo1Dv8i9HXB4a6vmyYN3jABu5yhmj
         esNXc0JQUNVKzxAFrjaYJGQcvII/NKxLFmafRa2c69V5rh+O4yOBaCdieSv3oHjp5via
         Wd9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=prsWWCXg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l27sor10430650wrz.0.2021.09.21.06.56.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Sep 2021 06:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=prsWWCXg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=d+YA9aBp3W+m+owbojgCvCPTz2XIifjjqNbMKvcy0nA=;
        b=prsWWCXgSSnCW+KKI5KpzJghnZL3o5i2kKnSsqhlN6VDdz65uZbB5zgg98BdGhLP5R
         DbelfvcyWsQcHDkxvZKLnYdlIRqoGg9VWzJCgN0QoWErkNXW591J404c3tNjfT7MIVWK
         BPeAoPaQB0x+z3y6K1/CWXo6oMqGzKF4UrxMkMI/LFapEa+VljAAKUU+meOMfKiexmHf
         37nDUEfif+dm4UqPehJvKLIamyg0vbRqSzMV0n3wL2ToxMg1tppxCgkivmxeEBr5901m
         4iRY1s2FTsmB8S4qj2HLIPuGkM5DpddemTDnt0x92mD0iQu6OUi3uiX/16ctYm/+ZkGv
         HJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=d+YA9aBp3W+m+owbojgCvCPTz2XIifjjqNbMKvcy0nA=;
        b=wb/6e7a4ZqMN4f/3VZFRJn4YE/gjfopyETOJ95P9oxPype1wCmWX0D5xAWMstAZ9lp
         GfvhDsscP6rNoHKf34waKErArqk+nsElmIgvf00w4KftOq2jNbhEJ3GxkZxs8xVVbJAy
         rdMpU7NzKd0IgPASdJlfyG64WPh8/daHeWYJNNHzelSxFWylQPbavMtdKWATpSUBl18F
         ceobSwb78BZb+RoBRf30yjLIp+0ti9NLb+dpLLKqdH3r25lDsKt2EE7zyCDf5r2V6qEg
         wNpYmcYgeKeTcxBwdW1Ma99HhLFguHyIq63PLt2mGpcybJzvEdaXUKWWECeot/S5aqVN
         fJnQ==
X-Gm-Message-State: AOAM531BzjqisUj4H5VAr+dCNzR4ohAzdLvpwDgtoJAcj3mQNIznKzG9
	fGEC323SL5VwMVmb1vJ7jnL+aWOyKAFHaezNbxuuFqUheU5sGw==
X-Google-Smtp-Source: ABdhPJy8QzMbVaLFx8meS6kBiBb65zZxDbo+A9iXdHAzrj3mU0iYiletban2nDlDDSzVO9dztD6OHws+kyWCSMKzMIU=
X-Received: by 2002:adf:f185:: with SMTP id h5mr35758638wro.302.1632232564840;
 Tue, 21 Sep 2021 06:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org> <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de>
 <874kjdugip.fsf@linaro.org> <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
In-Reply-To: <871regvs0w.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 14:55:12 +0100
Message-ID: <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>, Luis Machado <luis.machado@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: q0YwNFZeKBnO

On Tue, 19 Jan 2021 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Claudio Fontana <cfontana@suse.de> writes:
>
> > On 1/19/21 3:50 PM, Alex Benn=C3=A9e wrote:
> >>
> >> Claudio Fontana <cfontana@suse.de> writes:
> >>> qemu-system-aarch64: -gdb unix:path=3D/tmp/tmp9ru5tgk8qemu-gdbstub/gd=
bstub.socket,server: info: QEMU waiting for connection on: disconnected:uni=
x:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server
> >>> warning: while parsing target description (at line 47): Vector "svevh=
f" references undefined type "ieee_half"
> >>> warning: Could not load XML target description; ignoring
> >>> qemu-system-aarch64: QEMU: Terminated via GDBstub
> >>>
> >>> Seems to indicate it is "ieee_half" -related?

> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
> and there is no probing possible during the gdbstub connection. I guess
> I can either go back to stubbing it out (which would break gdb's SVE
> understanding) or up our minimum GDB version check for running tests.
> That would mean less people test GDB (or at least until the distros
> catch up) but considering it was zero people not too long ago maybe
> that's acceptable?

I just ran into this trying to connect qemu-aarch64 to the
Ubuntu gdb-multiarch. I don't care about SVE at all in this
case, but the 'max' CPU includes SVE by default, so we report
it to gdb even if the guest program being run doesn't use SVE at all.
This effectively means that usecases that used to work no longer do :-(

Luis: do we really have to report to gdb all the possible
data types that might be in SVE vector registers? Won't
gdb autogenerate pseudoregisters the way it does with
Neon d0..d31 ?

thanks
-- PMM
