Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1967873lfg;
        Mon, 23 Aug 2021 08:24:27 -0700 (PDT)
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr37251346edr.335.1629732267167;
        Mon, 23 Aug 2021 08:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629732267; cv=none;
        d=google.com; s=arc-20160816;
        b=kgGiQDU8vidyyBNyTFI/6CrQgPMORKe6vKfTfTRft19C1iKF5pZxkwtYFFTs1zADic
         LbR54E49gVS7P2bPtgA3hv5L7PhxB8p7iiAG3JnH8du5nfbO53TowgbnPv//sZpLQs4S
         zI9mIBtnKdVkGhgwHolg66XWDKEmpcer2Qzs4F/UZTueTrKsNqc7UNIWgoXaPu4S+ea2
         tHyCx4pnOZJkp7dnb/LD2sUqkHo0HsZk6rFtj6bUwC4f7OzAbWkCgoUWVvuc5pldV7Qy
         s7+UYkt0Z0Ade0AiFWDXdnG6XB0Rau+rpMeVmeMA1Iw0DnGSPneDRQpLveJ+WMRbTON9
         iCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iyAYC9RN+9lBQIAbfVLcSBds/G54lZ6rxoaMkQ0DVAM=;
        b=FhR+YgDw5IilHru47PKzs7Utf+zw7EN3SCXmyS49zdk8PA1Gw4XNpFU21YThs5NZSe
         COJqRAcaivQNJjI06wnDhdS8AL8Ztgn+hTN8ken97UueblquQJkG6XRyF8wMGsUPM5XT
         75kM2j1sk2mp7GO+oB8yw0lyIjISC+uofdF3AOw3OMIp9nunD7j7r7FjcWlA61HNVMzb
         5CcX4PsHzz/PSmwlPkhPRqga6qrYorEAlEImLCuGs4CUOipZbH7wKClAo5knB3aKd3lQ
         9cBGQ8mEefSemuG5PM6LFi/LfXSX5lvHPABHf4CeEl9ROmbfWwarB4VLR+KzmBsyUfco
         463A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IP3ggqsu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e22sor15253477edu.23.2021.08.23.08.24.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Aug 2021 08:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IP3ggqsu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iyAYC9RN+9lBQIAbfVLcSBds/G54lZ6rxoaMkQ0DVAM=;
        b=IP3ggqsukFsyQvd085tX264U9mGoseI2K3ztdclDisPK/y1dCDdNCRIMktFymacNDN
         Z8u8IxrTQLs1maMEgCW32UGsx0nxVim0ZuegYhn/qlaw9k2Wo1GU7gUFOE5ZXPOkX0W2
         mscquJi1y9NOPeOw3f64+xkhCSWCSY4zk+IyNK5BUuDkSs6Wb192FONl3oZRvPpwHmDc
         XM5G2fwh/JQbF+nUf9cl3q6G4GN+PqMZURAg7YeO+P3Jwewg2m8P5nbr8+IwTLX3BNjg
         XRW7w5AcJP2taTVPfbLXmRNF8dzFoRuQzx11iBwNWqkPInNOTI+40FVrytylT2CmKiAS
         Veag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iyAYC9RN+9lBQIAbfVLcSBds/G54lZ6rxoaMkQ0DVAM=;
        b=j+n2qPDIIe8fq5ym9b09c64xXRNQz1Q+S9Y2e5OS4wlHRFu/GRjuNwZoNN6Y2fSbY4
         bawowKPi/Q7hRw25dMkJFjKX4NoAk5PcvO00fkCd4Rfgp05S7X/QxJF81vSxon44SAks
         lTw6pitaH9OJEOpwSq7m/644ER5y+n1KkYF6zX+beH77e25PdYyl+tNggLaELfpX/9bO
         7Q4ftG4HOhK9NmATP3IRQg3d9xOZqpT/iGt6d9JV6y3rrwhVkN06tqITWVo30TTjIDnC
         yxsciMHTTKkxgFiC5seFzEYXig2mxMGU9w5Yh3CSXRfMI99v9/rOwiYER0oYenVfed/s
         UCQQ==
X-Gm-Message-State: AOAM533Y+vn/VDBAy/dVtjN7C/QbLcxP6mWgLUZwOeLlJHnWcIEU7pm+
	7PZg2B2qwhWmticTkUQ4OreuG2uFKFke9nUrSPmIxQan
X-Google-Smtp-Source: ABdhPJzoPcoBK6IWJsYo0rLSA1C7+N2f/kE6l+HTOp1I3fcflrxGhX1ji1SbTaA5swHpI6Ub+NKugw44ut1cHOyMx2Q=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr26770811edp.146.1629732266936;
 Mon, 23 Aug 2021 08:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210823142004.17935-1-changbin.du@gmail.com>
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Aug 2021 16:23:40 +0100
Message-ID: <CAFEAcA9AqV7BoyPVwuMUdcX2uHOCahPK2wZobOLpLqD3WM5FPQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 7/VRGbgq8Unw

On Mon, 23 Aug 2021 at 15:20, Changbin Du <changbin.du@gmail.com> wrote:
>
> To resolve the issue to debug switchable targets, this serias introduces
> basic infrastructure for gdbstub and enable support for ARM and RISC-V
> targets.

As I understand it, fixing this problem requires support
from gdb, not merely changes to QEMU. You would need to be
able to have QEMU tell gdb "the guest's endianness is now
little/big" and have gdb cope with that change.

> For example, now there is no problem to debug an big-enadian aarch64 target
> on x86 host.
>
>   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...

I don't feel like this is the right approach. QEMU already
knows the endianness of the guest at any point.

thanks
-- PMM
