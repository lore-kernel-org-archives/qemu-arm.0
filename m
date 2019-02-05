Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5162890wrt;
        Tue, 5 Feb 2019 12:09:11 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZxV3jXDziorIfx4msoBxaQndQ/pvuZTVLxVsJ49XHmx2sHCr8blXEFqzzLv4+7u/5ftkjJ
X-Received: by 2002:a0d:f8c6:: with SMTP id i189mr5541967ywf.286.1549397351697;
        Tue, 05 Feb 2019 12:09:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549397351; cv=none;
        d=google.com; s=arc-20160816;
        b=BPVyFz3Ndxq2tcBjGI/qIBz+X6OBEcLuLf7c4wCxEjroEoKZ9998Gaq0dX4Y3Umuh6
         KT6kFm2Ie5wI3OeIhElq60z8HIFOxnXMmeEIjF9F/0NWrRu2SNTCpM8OTUWKWySLI6Dn
         6uxZdEno6pDBWwdBE/9BZAxLSywuNiE0MEA8aP4lyH7Z2a7RB/PSHD+HsXS4omlP/3QR
         YEsTvxajcpFTKFnS6MyrLdgWTB1Y3pueCkkREJAndx0oaJA6SIff7tOBIlk98Ig+OYBR
         mIWrHS9wLtmA0zG0cBfxYHKwlqvubi+at/xklnwHh3eaBSYI7LtBCYqmKclJoeAHQB4S
         DS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrws9AXUBL35xch6ekr1OlNl7FySMn16fqUNYApuLy4=;
        b=Ip317ttRfMpoAzINOxEGbKDmhBPy4CtyJHmVdxvcFI4wWCbkZoBN0npkU7ZYPBIb8I
         ruIAZZ4KcZYXb7/DBqWzKAGTtxzMz3Q9rzdbAyfjO6gAM7J2rJAARRzVX4JP83dQw69X
         e15wdsk2TFqp40r85GS1uY2lkk2sgmUZd7YfAv/EiL/5jZV0daOtC1D9CzNVloW+VEjf
         60m4hYm5qOHZHuMq7cU2n7I4+yA3xo0KD/OiW/sQQG0MVTLEz4ZEuoozaqnWJl4n5+4A
         CXCAArAAzkzd72LKlBye0Tr7V4hRAuD0nzAR2GctdP3cy/i4Dj1upr7nocoFH//tYfi2
         HZ8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MluQUDLT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si1841834ybr.89.2019.02.05.12.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 12:09:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MluQUDLT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:39732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr71r-00030F-4P
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 15:09:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gr6DT-0002aB-6j
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 14:17:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gr6DS-0002W8-EC
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 14:17:07 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gr6DO-0002Sn-LH; Tue, 05 Feb 2019 14:17:02 -0500
Received: by mail-lj1-x244.google.com with SMTP id t18-v6so3895957ljd.4;
	Tue, 05 Feb 2019 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nrws9AXUBL35xch6ekr1OlNl7FySMn16fqUNYApuLy4=;
	b=MluQUDLT71zYhKcFiZBJbOj9DsG6It0X3YTeHeXBtu9OOci8ZZadEgFSrR0PYCRVng
	HQhAwPW7AEoA4VEsENgDAxJQZnlQvEcx9V82Tr0rLW4wyoACFbiRIDM6+Gqn4Exx4jyJ
	kSPLnuLRoCyhP4YS0g74p4+Rnl3JsX12MiFqlreQYH2YEhOB+K7zRVsDeTd1XhR8CpP2
	7hpwmCkahUnvWxIDcFL4O0XYFwzjKLYN88rjhII5Fmq7BAQOIdUFUYlCE332XbqGwTyl
	cey0/b653YZAzLIUyTSmVrd52cjT+YLlncm4yxrtAPl4QRhnZWPY+RjEE3FmVE6jfoT6
	3yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nrws9AXUBL35xch6ekr1OlNl7FySMn16fqUNYApuLy4=;
	b=XdSO9kSkncW3S+DCK+wo2axENkG20qgWzKYhGrqgoApLyCwP+Ye6L1LjFU7v6pfZ8b
	bFpz9fVz/QjhBNrOQxH3eIZ1O2/V0XjXGIFmoz59GA9d4RzYfk5OWOKbUjglj8pW87ns
	b8VsGE8ADtLbA+3E8W978tZIXZgc0Qh+JTYbdkBLPPWvWhcBs4SV8lf26c3eK78+ZoF4
	26bCI2BoEwdjc7sh5CI/cvNJ1kdecaYSukttVI38q+AraIpCMQrBaeRwOghftbpUQ+4u
	OgbRNMeExXJkGFMMwHFh2LzJc+dHdJHcYhqPtNy3FMvbK9R2xd6t2CktGwrSBToc8pOh
	S5Ug==
X-Gm-Message-State: AHQUAuY9l+34IPdHIN5Rb1S8B8b6FD4/DFR+zcOFmxY6bU9/TYlsYpBU
	x7lthGpDtolL1Jb1Kxs7CM0h9DrcLEiBAN8k0Q0=
X-Received: by 2002:a2e:3308:: with SMTP id d8-v6mr3867958ljc.38.1549394220312;
	Tue, 05 Feb 2019 11:17:00 -0800 (PST)
MIME-Version: 1.0
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
	<50ea8b3e-cd8e-c6e9-86dc-2e50b78646c5@greensocs.com>
In-Reply-To: <50ea8b3e-cd8e-c6e9-86dc-2e50b78646c5@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Feb 2019 11:16:22 -0800
Message-ID: <CAKmqyKNgj=u5vKgR1F_fMKs8NLq2ze1OamgUxZOqzN1jytF3qQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/cpu/cluster: Mark the
 cpu-cluster device with user_creatable = false
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7YhDJ+QOgX5M

On Tue, Feb 5, 2019 at 7:22 AM Luc Michel <luc.michel@greensocs.com> wrote:
>
>
>
> On 2/5/19 1:58 PM, Thomas Huth wrote:
> > The device can not be instantiated by the user and QEMU currently
> > aborts when you try to use it:
> >
> > $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
> > qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
> >  Assertion `cbdata.cpu_count > 0' failed.
> > Aborted (core dumped)
> >
> > Since this is an internal device only, mark it with user_creatable = false.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> > ---
> >  hw/cpu/cluster.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> > index 25f9070..6f5f037 100644
> > --- a/hw/cpu/cluster.c
> > +++ b/hw/cpu/cluster.c
> > @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
> >
> >      dc->props = cpu_cluster_properties;
> >      dc->realize = cpu_cluster_realize;
> > +
> > +    /* This is not directly for users, CPU children must be attached by code */
> > +    dc->user_creatable = false;
> >  }
> >
> >  static const TypeInfo cpu_cluster_type_info = {
> >
>
