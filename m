Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp505956lfe;
        Mon, 16 Mar 2020 13:11:46 -0700 (PDT)
X-Received: by 2002:aca:2b14:: with SMTP id i20mr941569oik.79.1584389506216;
        Mon, 16 Mar 2020 13:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584389506; cv=none;
        d=google.com; s=arc-20160816;
        b=ueZDWu03qp6eoXxEoDEsUXWACM9HCAxlnxmlsQAkxlkYZtQk5PVjMO1rbmwwGNvebK
         xevd+CbI86GR3d6DVXXXm4SS/JmJKImw9cZHfC9DlJV06mHEmuXNrnXv32B3DUmQG5hA
         YC/hQiEsKbPy6cnbaPFNbP63vbM23DgTOuxQlYD1XiHZClp2zj242PrhREsDk6I+qKBr
         trWvJidQfAk+Mq+M2ViLm4uy5QYZB62B1XeV9U2J8EnDBH8bXfsgTgitRcXfq3ogNTPK
         LOwSGwB5m3ibQeOsKwFwxNwPe7xtHymabfdyaCuwh9oVCnwnnaGPEq7n/XeUJlL5o2qz
         jSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ijs2BAIZQngYJr60lDXDIztUajpq/leFmXIdziG2LkM=;
        b=KPWQZO9Ta8WPpJfKHYrTM6axLYBcNdG7CjOCgwR7fHIkfjUT5JzL0bOljZzbJfmsdF
         IOca23XtO33ZoZ2BXhtb0zukDeA4yUVvW21f3UAm2QyxoYyVSEQUXcQgz+wPd8eVQEiz
         QTKhEPXRS0d9dT4Eux68v9dmu1fg8uU0P/0PoWkZuNrdhnds1rI5NTtdmYzPCZfNK06U
         KQFgsdenkaOuS7viH6tHEYn7Tas1PcQ/y3i6RCJ7BmdYhn7dfylGRrq9tTB+uwegQJjI
         MCOCoDsJRYY0tgz7JQvwXtDgU2JYQUJgabizy8V3javrMzdYhoFlQm+bgNjAm4e3q9v5
         W0LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sv5GzYNw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b124sor952790oii.37.2020.03.16.13.11.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 13:11:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sv5GzYNw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ijs2BAIZQngYJr60lDXDIztUajpq/leFmXIdziG2LkM=;
        b=sv5GzYNwiSh3FeS0FRD8JM9TyIwu42PNDUBqb2XRpr7JWlyBhsNwNdpjQBWBU+l1bR
         WN6v2XTv991YfA+F1LJE3nqARuovbsoRT3n4bJouPNyhgwsi6Fl2xAIdDG+rNfRWzw9N
         BeyPq/wVWSA56Wg5t/+hJhUDQuLoL92VYEEyb76M2cFYJjW/MPndakK64X7XPFlhMDcc
         MnKhzJo21aBHp9XNHOLp4MHAGgi6uP28iPP2tAmsbd4osuHZ1UQKD6YU81yz+a8mt1wv
         KExbnv7HV333vv/xrvNbN6VMES9N3EELGs5ODy6fE7X+/Obh6Cw/X+6S1RJdf6t6o3H8
         OnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ijs2BAIZQngYJr60lDXDIztUajpq/leFmXIdziG2LkM=;
        b=jGzLnjLWMdvViGzLams81pcsZ5ATZ0qNef8n5/BsW3bmCG+BHtV0HR8Q0hyCXbt+FE
         +9O395+2V6XPoyLLOSARx2EBllM+lIXGmbdn8nLnbXTopmxx66l0FqhXX3WXJOVU87ZW
         Z83VEASZi/GBbRf+AF3NReV36mdN2mrJTHrp4ihpJ6W4UImRMMkqAr+vv5bGOp/IuGSn
         KZDklI6DXjEAA0/QHqwBal6dXga+3ZlotQ2uKrcHwUy5fphknomKiNzVs8aMvgtft8RO
         XCS8TR5jNG08/GpyK1a39Ah9zufvfTMnPL/NhifXiQPKRZLK7vyg9lym31LPHKQ3TcCn
         qe2A==
X-Gm-Message-State: ANhLgQ1OcpocS1xkgL1sOnNuvthwEG+k2hf39ZMGJ+oouL1brXMFw5Y2
	f+b4GD39Rw+wMn5ErsOO+jtJt8CrjRC5YGktVjL9Bq9ni24FVA==
X-Google-Smtp-Source: ADFU+vuNAGWfTNfTG7BCG62IAVcWTMGcJnSdFo65qjGsPUVKe0hQPlhhs0R7X5BcJqT9yHK67QFaPQIXmPb88pVygO4=
X-Received: by 2002:aca:190f:: with SMTP id l15mr937814oii.48.1584389505745;
 Mon, 16 Mar 2020 13:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200316160634.3386-1-philmd@redhat.com> <20200316160634.3386-4-philmd@redhat.com>
 <f570579b-da9c-e89a-3430-08e82d9052c1@linaro.org>
In-Reply-To: <f570579b-da9c-e89a-3430-08e82d9052c1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 20:11:34 +0000
Message-ID: <CAFEAcA8K-njh=TyjS_4deD4wTjhqnc=t6SQB1DbKgWWS5rixSQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/19] target/arm: Restrict DC-CVAP instruction to TCG accel
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: TXT2y4wUpMTA

On Mon, 16 Mar 2020 at 19:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I'm not 100% sure how the system regs function under kvm.
>
> If they are not used at all, then we should avoid them all en masse an not
> piecemeal like this.
>
> If they are used for something, then we should keep them registered and change
> the writefn like so:
>
> #ifdef CONFIG_TCG
>     /* existing stuff */
> #else
>     /* Handled by hardware accelerator. */
>     g_assert_not_reached();
> #endif

(1) for those registers where we need to know the value within
QEMU code (notably anything involved in VA-to-PA translation,
as this is used by gdbstub accesses, etc, but sometimes we
want other register values too): the sysreg struct is
what lets us map from the KVM register to the field in the
CPU struct when we do a sync of data to/from the kernel.

(2) for other registers, the sync lets us make the register
visible as an r/o register in the gdbstub. (this is not
very important, but it's nice)

(3) Either way, the sync works via the raw_read/raw_write
accessors (this is a big part of what they're for), which are
supposed to just stuff the data into/out of the underlying
CPU struct field. (But watch out because we fall back to
using the non-raw read/writefn if there's no raw version
provided for a particular register.) If a regdef is marked
as NO_RAW then it means there is no raw access and we don't
sync the value.

(4) I think that in KVM mode we won't deliberately do
non-raw accesses, and a quick grep through of the places
that do 'readfn' accesses supports that.

thanks
-- PMM
