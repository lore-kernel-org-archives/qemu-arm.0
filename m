Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2796177ejx;
        Mon, 14 Nov 2022 05:18:52 -0800 (PST)
X-Received: by 2002:a63:a47:0:b0:46f:b3e:4d46 with SMTP id z7-20020a630a47000000b0046f0b3e4d46mr11669869pgk.265.1668431932443;
        Mon, 14 Nov 2022 05:18:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668431932; cv=none;
        d=google.com; s=arc-20160816;
        b=0VlyZIra07ZRjKk9eUtnshzsIoay4ggyS10U04N61+b5Gv5ijCFKztKIueO3pqekg3
         Hp7LpKwFYlzAaoAwPhfQMXhwQOLVzWNO4cuHACewsQutEwFelc756XWlpFaGa8+eWpS2
         ZB8rRKE8UD/k4NaBzKDh+z04pKmWZFQUT+xvTDy//+AgJ1p8phPf6zJnUE6o4FaY3kQG
         LoDFL10cZc5aRuCjXgmisLJhp2NOry46M4dehnVhO16/6+mwCJu+q6oygTYwHV+P2Z7u
         kYj18IsTjZm6qh+DJ3gh2GVy7sG4YIPxF0Nhw2+Ps44EVEcZstKJgCuY4EIUkSwZJsZq
         GMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A78MonTqUVj6SW0ZTqjKXzSGKlFKvo8xINRWkrlof5A=;
        b=wxKMPtGSkAd82vi1lUnkfS7T+KkG7XNgvK5g8KyFCg61Y8Eo/iHhxXxhiE/k5rs0Nx
         BufBYp4nNSRlQOCNm3aUCga0dSK4Mpyanqhs3SA1EcuuxjOWly7i0TAAczFbYBzstf82
         XxRV1P+ayETpMn2d8iJlSzW/OP16s+A7aObu/alTbEBqtNRgtlvSnEn1fr6QylZkZ8RW
         4pT1tb12f8rtz82CvvdKMeT+oZJfqjoK5gzwNINIsKhcflrdCg9TF6fnNNv70RaElZXx
         InIGe+MxQCq+WUNDAj9DQv6rKS1QtA6B9afwhufO7WMhie17LxbpdaHI3jHxQE8cc+DH
         rPcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiqdPmFR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f11-20020a170902f38b00b0017ce06ee06bsor3787257ple.11.2022.11.14.05.18.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Nov 2022 05:18:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hiqdPmFR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A78MonTqUVj6SW0ZTqjKXzSGKlFKvo8xINRWkrlof5A=;
        b=hiqdPmFRWf4Ykt+K7C5jCW4TX2bbJOY2VxJqGwpbnJckLKGoYHFq6WbtKZZR3HHA5B
         8/C0vHRmYga9jwO8unhJBUmahOMqEiK9SipfCmCTPBbfL/tclD0vnkMHzsu6IcsHmyuS
         6/b+nGWY3ueiERE4f9wp2oX0HYaHe0msBNThqrnYZtomvYD+3yu/1W5Tz3tbPLVjJP8q
         0nSOwZzfdLK1DSVA9v/WMG6kkGJg5gFRchN5PTlXdcTkNQIEJZIuFVX9ZgJ0ACyJ2mR/
         JF1KvZv8NbFppQQnJbCvx1IFeRhHLW4WUsCib+gCEr4znfsFcOi34Ol8neJ7PJAnz6M4
         eBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A78MonTqUVj6SW0ZTqjKXzSGKlFKvo8xINRWkrlof5A=;
        b=gzE5g/ajPtRgq8flxhGBw209L1xUcfcq1qMDfaiwB9Vbk1Tp5p39NUaIW8xSY4+rWQ
         wXfZqArk0xBxifCXj769WL9zTr+YBCgrCfIWA33syMH/G+76AqP32GU16gzwYSpRu7fZ
         rZq+Hw6CEVPQslb6GnUfYZGgprw2CHz/EQtpuK83md+XWkFpkpXdfb0Og8aS2T2C6lQA
         HjJQ1A6tdMxkW4AaV2ayjOANlRwuEkU0dkT+egBX4MCK8PbDVw7MY6LcNiDIj6Vu/TCp
         ICtdCxAvKYVH9P6699B0XSSyZVnqaDB+Ua52DLHAprQShXx6ONkGT6RO2ktBXqVMHTy4
         B58Q==
X-Gm-Message-State: ANoB5pnHVZR/HqY2fGf/NTCHFESn9J72dxlRd4Sg0GkaA/Coyfp3d2kA
	Ccu/9l6+5dLVVYllEGJzxKlSJd2Ypjc+fAwUgtVhBeynw+zjWl9S
X-Google-Smtp-Source: AA0mqf6I7SqcmQY2M7gFiqrPTl2RTqGiqf6Vx6Bc12y/PxjCloYbwkopPD8yqtFkzkfxmS/1nLV21tos/C/BX9tlkK8=
X-Received: by 2002:a17:902:ea91:b0:185:4ec3:c708 with SMTP id
 x17-20020a170902ea9100b001854ec3c708mr13726401plb.60.1668431931940; Mon, 14
 Nov 2022 05:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20221111145529.4020801-1-alex.bennee@linaro.org> <20221111145529.4020801-13-alex.bennee@linaro.org>
In-Reply-To: <20221111145529.4020801-13-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 13:18:40 +0000
Message-ID: <CAFEAcA_HoysKQ83rNUn-3X0gdUMjEaq9Xg-scCGnDb18C3MJOw@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] hw/intc: add implementation of GICD_IIDR to Arm GIC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
	f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
	stefanha@redhat.com, crosa@redhat.com, 
	"open list:ARM cores" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: d/+yztQgRPdB

On Fri, 11 Nov 2022 at 14:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
> this for the CPU interface register. The fact we don't implement it
> shows up when running Xen with -d guest_error which is definitely
> wrong because the guest is perfectly entitled to read it.
>
> Lightly re-factor this region of registers and also add a comment to
> the function in case anyway was under the illusion we only return
> bytes from a function called readb.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - checkpatch fixes.
> ---
>  hw/intc/arm_gic.c | 44 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..65b1ef7151 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -941,6 +941,10 @@ static void gic_complete_irq(GICState *s, int cpu, i=
nt irq, MemTxAttrs attrs)
>      gic_update(s);
>  }
>
> +/*
> + * Although this is named a byte read we don't always return bytes and
> + * rely on the calling function oring bits together.
> + */

Rather than documenting this, maybe it would be better to
fix the weirdness? We only do this for exactly one register,
the GICD_TYPER. Everything else is naturally byte-based.
(The GICD_CTLR looks like it is also doing this, but the
only non-zero bits are in the low byte, so it isn't really.)

The GICD_TYPER returning bigger than a byte's worth of
data I think is a bug we introduced in commit 5543d1abb6e2
when we added the security extensions support -- before that
all the bits we needed to return were in the low byte. So
I think we can fix this with just (untested):

--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -955,6 +955,7 @@ static uint32_t gic_dist_readb(void *opaque,
hwaddr offset, MemTxAttrs attrs)
     cm =3D 1 << cpu;
     if (offset < 0x100) {
         if (offset =3D=3D 0) {      /* GICD_CTLR */
+            /* We rely here on the only non-zero bits being in byte 0 */
             if (s->security_extn && !attrs.secure) {
                 /* The NS bank of this register is just an alias of the
                  * EnableGrp1 bit in the S bank version.
@@ -964,11 +965,14 @@ static uint32_t gic_dist_readb(void *opaque,
hwaddr offset, MemTxAttrs attrs)
                 return s->ctlr;
             }
         }
-        if (offset =3D=3D 4)
-            /* Interrupt Controller Type Register */
-            return ((s->num_irq / 32) - 1)
-                    | ((s->num_cpu - 1) << 5)
-                    | (s->security_extn << 10);
+        if (offset =3D=3D 4) {
+            /* GICD_TYPER byte 0 */
+            return ((s->num_irq / 32) - 1) | ((s->num_cpu - 1) << 5);
+        }
+        if (offset =3D=3D 5) {
+            /* GICD_TYPER byte 1 */
+            return (s->security_extn << 2);
+        }
         if (offset < 0x08)
             return 0;
         if (offset >=3D 0x80) {


(you can add my Signed-off-by: if you want to turn that into a proper patch=
.)

thanks
-- PMM
