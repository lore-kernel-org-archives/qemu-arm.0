Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp495492wru;
        Wed, 25 Jul 2018 02:40:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpehgcWvH7EoKx9hGh5ZdSBtW8tdfnRD1s+8H7jLHIGEj2TZpyEwb6HkqCzgk6YlPkb738vr
X-Received: by 2002:a0c:da90:: with SMTP id z16-v6mr18391802qvj.55.1532511641224;
        Wed, 25 Jul 2018 02:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532511641; cv=none;
        d=google.com; s=arc-20160816;
        b=SgsK1xPRpUbMdo1UK1cYxyIseFV/qHCKFxUP+e0kwefJYux5PwPJfIamYFrvy4ZwsZ
         I2/Ycd1qv01sPX8REpbwFAqwSv54yH5b2Yd4xoJyIXqquqpQQCUZjtW5kAK0AZbPJMs2
         dH8nUvW0RzHJTEXWcpW2VKfcm+n8BO6rNNJyjPKlXEg0NpGzXNyF82rJ7fgdTvHmaGG8
         +kq3NGsdFObfZEDb3758KIjit1UrdEHp5q3hRuRUcMdsSUWfQARQWanlCuK79AblAkAc
         QhrOwe1k7wY+blVzYmAnYAemHXzC2lgFfTfwDFjnzFj0kEPtyCB7ag0NlBXyQ1qon4Uf
         ePqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=KJrqExp+6LqlAj5/OY8wSi9sYasrVEX6zeBXGW7fX/w=;
        b=pqA7xmhztl+wWYuPgiZMq71pK0zg3FuQUW4RCl+4tiQwfwXRGBHjle60BJUA7fr/Gx
         zde7r7tPObgKYQWVc5wNRNxh3MtQEu3a11YD/vpvWrfsdEUmgxyLjlsDD8TW/PzgAKoK
         6lLv8xqI9YBL7Tt+fznYKASLH9CMXNZRbC2ojjJFZiljyh329a39a0bFVPziGdg+jOqV
         dXmEWehq361H0TO+NWNNkJtulsQsdDrgcr3wQLR9jdhwFOIag87xUvPSKVQORLLRXPlg
         1bUx3F2ngTOv+rYZqo1DHQaeE9dfSf8/RzpIvekD6fm4JKNMb817Se7fioOAX/RzOoJ0
         OVlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id g4-v6si9673887qkc.274.2018.07.25.02.40.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 02:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA2554043954;
	Wed, 25 Jul 2018 09:40:40 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 666CD111DCE5;
	Wed, 25 Jul 2018 09:40:39 +0000 (UTC)
Date: Wed, 25 Jul 2018 11:40:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725094037.uzz4ycen4qja4q4a@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com>
 <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
 <CAHmQWvCqKqQXnXxOUgi=kLTyE5BhV2NxqaKzvPp63HX02V=X2g@mail.gmail.com>
 <CAKv+Gu_eFjS_UvOuEKhbsWr34o3Jqd4h2duJ-gG1ofsFbwkGbQ@mail.gmail.com>
 <CAHmQWvC8_J4i32UZzdHqJ4w3EdEAHmWGdgqrvGwEA7uo0kvk9A@mail.gmail.com>
 <CAKv+Gu-B4o7dwZPOix2MkECJia6M6Q+zBMw8XVdw49kFYW6J+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKv+Gu-B4o7dwZPOix2MkECJia6M6Q+zBMw8XVdw49kFYW6J+w@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 09:40:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 09:40:40 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: oV2jnpx5WPet

On Wed, Jul 25, 2018 at 11:20:03AM +0200, Ard Biesheuvel wrote:
> On 25 July 2018 at 11:17, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > On 25 July 2018 at 17:13, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >> On 25 July 2018 at 11:09, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >>> On 25 July 2018 at 17:01, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >>>> On 25 July 2018 at 10:48, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >>>>> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> >>>>>> For the Aarch64, there is one machine 'virt', it is primarily meant to
> >>>>>> run on KVM and execute virtualization workloads, but we need an
> >>>>>> environment as faithful as possible to physical hardware, for supporting
> >>>>>> firmware and OS development for pysical Aarch64 machines.
> >>>>>>
> >>>>>> This patch introduces new machine type 'Enterprise' with main features:
> >>>>>
> >>>>> The 'enterprise' name is really awful - this is essentially a marketing
> >>>>> term completely devoid of any useful meaning.
> >>>>>
> >>>>> You had previously called this "sbsa" which IIUC was related to a real
> >>>>> world hardware specification that it was based on. IOW, I think this old
> >>>>> name was preferrable to calling it "enterprise".
> >>>>>
> >>>>
> >>>> I couldn't agree more. However, IIUC this change was made at the
> >>>> request of one of the reviewers, although I wasn't part of the
> >>>> discussion at that point, so I'm not sure who it was.
> >>>>
> >>>> Hongbo, could you please share a link to that discussion?
> >>>>
> >>>> Thanks,
> >>>> Ard.
> >>>>
> >>>
> >>> V1 discussion here:
> >>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg545775.html
> >>>
> >>
> >> So who asked for the sbsa -> enterprise change?
> >
> > Actually nobody, but it was argued that sbsa does not require ehci and
> > ahci etc, then we should find a name fitting for this platform better.
> 
> That doesn't make sense to me. The SBSA describes a minimal
> configuration, it does not limit what peripherals may be attached to
> the core system.
>

Hi Ard,

I think that a machine model named 'sbsa' should provide all SBSA required
hardware, and nothing else, while providing a means to easily extend the
machine beyond that in any way the user likes. The user can easily add
devices with the command line and/or by using -readconfig to build a
"typical" machine. Note, it should even be possible to add, e.g. an ACHI
controller, to the memory map using the platform bus, if that's preferred
over PCIe.

Thanks,
drew
