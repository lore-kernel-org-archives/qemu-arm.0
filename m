Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3255573lfi;
        Thu, 5 Mar 2020 10:54:45 -0800 (PST)
X-Google-Smtp-Source: ADFU+vujoGqDrttr4W39M+YxcrTSBV83dEEi8VHj+vPuaJdttcpaNr7rftbwl+XgMceonbMFwZAJ
X-Received: by 2002:a0c:e244:: with SMTP id x4mr112690qvl.195.1583434485735;
        Thu, 05 Mar 2020 10:54:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583434485; cv=none;
        d=google.com; s=arc-20160816;
        b=bEUDr8ALgT+ETPEAwssMk323ECc6DlCrPVG49Zfr2UZiZ13YY8sPdcXVsmAl3+iRUN
         RzEmE/tOLHZHvQDm58wQ0EaAAt6ubu+MygfYe30yfU/8VgHyl+Goa9EbrIaRRyTOeSX/
         334LPPvc+4JcwyK6LupTyytB/HR5oR7aSyc9009QIDQVbnwWget6Ic9dDJLmNU7/wsz6
         W+Z0OBqYr0LyTSSfuQE5eUl32d6hXBLxFWbtJPTiynvxwUHTF6ENdhFYbvCj3A9C8rE8
         2oIOjA2AZZGmfemfGjNKUpgg0aCgEbR5Sqdx93e3c5Yh1IN7Zh1we/DFdwipd7CmxSd5
         KsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9WlH75BN1udAgD+33THQruL8q+EWLnMXDXUqFlXchmo=;
        b=GuKbj4g7XWilNT+FA2/aoNfobLPVtADuQ/xFvsEXU0FxL60pcDLd0DknokZ39/UN8K
         lE5XWSQnEGGk75D4A8JcDyL4EQQQprCjxxpOxDgqdQF86UZmFcvHu9iq49ZtNP3jlfQi
         Np86L5UAQ5qwJBB7zFXr0lh2yc7RcriBmlfGEBbYC3s+HZwualqmdEqkRHf58NvLntIs
         +11Oc8N7KgyC/YCxkL7BHZWF++OsnOIZErgMyz2Mxm5u+EhpFPIE1ypcKEIFW7kXXB1M
         a1OHoZLvawB+hKDGDF7blQMGBoqDgfVnBjcH7x8yL2IOWz0yYrRAGB765ONuPad8+ggm
         0SNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PmS7kmXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si3205944qtv.380.2020.03.05.10.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 10:54:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PmS7kmXL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9vds-0008Bc-67
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 13:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j9vdZ-0007wE-Pl
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 13:54:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j9vdY-0002WL-SR
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 13:54:25 -0500
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:43848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j9vdU-0002PW-JR; Thu, 05 Mar 2020 13:54:20 -0500
Received: by mail-vs1-xe42.google.com with SMTP id 7so4292057vsr.10;
 Thu, 05 Mar 2020 10:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9WlH75BN1udAgD+33THQruL8q+EWLnMXDXUqFlXchmo=;
 b=PmS7kmXLhQ+FbFufdDFbYhizGEA7DkGLFOuivQL1r/Uo4DMOFPhcBuDN9JRycej6Dq
 3nN/LDXSZRRBIfSWKQua6pf5VZ7AkvX7oMAofaF23jZps+hJCAyAITeghPnVAw3raq/j
 gshN3qQe8cW+IBl/tQ7/YZeJnife69C8Jeyst2TwMqNoDb7cjIR4DsCiAfFv1ukEHUId
 oc2E1x7CL76pOCzzYEYbeb/SMmrw1LcCize913ASQ/6U8yJNVEmLtQRvRZNVrgXMe8cx
 21Sq2GXU12Bzl+spdesubPuysEUwS6r4Ie0TRBagV+3zs7L/XZ5khlVBm68zOHGPfHvn
 +IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9WlH75BN1udAgD+33THQruL8q+EWLnMXDXUqFlXchmo=;
 b=JLfiiLPgFUzm7HR00b/eyJRqqRm+FIGyX0K6f1v76Bpd6iHdXdbm10mxIL2raZ8oG3
 zEMCyRWJRLFbWqEUBRMKaoGQVykoCtzvau/EYaZMP8gNDFGNrWNzIoPTcysSVJO3oQqy
 Fu1Hz62iM21xlkK/0kpNGNbEc7APrL/qlWYcA3yy9cxn9X68rhUFb0rOVTEB+0l97TPw
 iG+33FQe/NDjIELQaTGikkuPWTIYicYZA7JAZJVREVT9n6bzFSPzSJ39hEF4hy2wRtGq
 Wum0Y1wUQOv0riUHooUoGaHERMLcDczISBwqw78oa4Ob7uriuoKTAdYJz09wqib02bR7
 0qdw==
X-Gm-Message-State: ANhLgQ1nFfOCOJ1CqvUT+/w0eUIGrQcpp42JKrAySJc2kmgokyCohsBN
 tf/fHwgIegWGiPMbpQ4/ZWagc2SYnGcQsN4KgNM=
X-Received: by 2002:a05:6102:3019:: with SMTP id
 s25mr173996vsa.133.1583434459899; 
 Thu, 05 Mar 2020 10:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20200305175651.4563-1-philmd@redhat.com>
 <20200305175651.4563-2-philmd@redhat.com>
In-Reply-To: <20200305175651.4563-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Mar 2020 10:46:37 -0800
Message-ID: <CAKmqyKMvrXreJvzSEPyrCDyUe=65n6PX3pNTA66kG2Uhe15CzQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/net/e1000e_core: Let e1000e_can_receive() return a
 boolean
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e42
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Peter Chubb <peter.chubb@nicta.com.au>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v5/sZBkKl5H6

On Thu, Mar 5, 2020 at 9:57 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> The e1000e_can_receive() function simply returns a boolean value.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/net/e1000e_core.h | 2 +-
>  hw/net/e1000e_core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
> index 49abb136dd..aee32f7e48 100644
> --- a/hw/net/e1000e_core.h
> +++ b/hw/net/e1000e_core.h
> @@ -143,7 +143,7 @@ e1000e_core_set_link_status(E1000ECore *core);
>  void
>  e1000e_core_pci_uninit(E1000ECore *core);
>
> -int
> +bool
>  e1000e_can_receive(E1000ECore *core);
>
>  ssize_t
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 94ea34dca5..e0bafe975b 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -967,7 +967,7 @@ e1000e_start_recv(E1000ECore *core)
>      }
>  }
>
> -int
> +bool
>  e1000e_can_receive(E1000ECore *core)
>  {
>      int i;
> --
> 2.21.1
>
>
