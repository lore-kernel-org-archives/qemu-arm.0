Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp318656wru;
        Thu, 26 Jul 2018 05:35:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdQbvMR2b1g+FYH5KI5R082bqmhFy3PUNP78v69Bwn7ub6H8WXLL/T1dEdgZswSAWZrDztW
X-Received: by 2002:a0c:f90e:: with SMTP id v14-v6mr1369157qvn.207.1532608513444;
        Thu, 26 Jul 2018 05:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532608513; cv=none;
        d=google.com; s=arc-20160816;
        b=ziUV8bWL1g9XToWaWhXUIb6FKAkYwmlzQqou0+KulYrbTZrdmiWdtff5x6u164QZ8U
         CyCR1T7FN6ErDG0N+UMoTkKxxvJ5CbCwvfUGb5jCDNuNTsLE28Y+zujuol+pzYLWHAi7
         1I4vGQSBcxR9wyu3WE4ovTQy4WN2NN01XOhFi3jIYKMhYuF13/2pKXAyuT39Jtdnql8h
         PZBmSaiuR9PHlbUv/VxnfHBCrkTwbVTrDrKAcmtViOlidRBCAkhkOCagakuxlg6pyZsH
         hbOdPdoR4sPx7oqa7jx5343jy5xuP/E22U0wmBTi7FCrHZjo5QpqqVE65ZRb2byW/fP9
         YU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=qQyNqSGcA5Vnf22RTUKK4SKdSEnl9tyLDAEDcn22F/M=;
        b=sETEsoFRxOcWIKk0ncRXODol7ytlFSRRensO6affIyXRghjGA6g5WZn+u//xQwHm7O
         vIiW3SNnhrt+uIETz1rgHc+SgRUog9GvHUobsulVNkTzcqx87Yr8Y+nEwE14oT/Dgu3M
         Qzw1uvcYf1/GgSrOoE/kU/aA4RF/+gK7qLtzw146qaZuKbuRWHkHzgmD5xQOZrql6uM9
         NDUbSBN41vH7jK06MXH5iLMKj38R4KZGchW2EX9HRz9aCp94oqQxaOydOAfssSGqF6sy
         /qJdzt21w12/1YUauiqgwCqb0ePJLj7Nd5K8uhTFo6XHMmshDC5WE89BVoQs46/naOjN
         vM+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id f10-v6si427223qvo.225.2018.07.26.05.35.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 05:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE42187927;
	Thu, 26 Jul 2018 12:35:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8626710FFE52;
	Thu, 26 Jul 2018 12:35:11 +0000 (UTC)
Date: Thu, 26 Jul 2018 14:35:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com>
References: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com>
 <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com>
 <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com>
 <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com>
 <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 26 Jul 2018 12:35:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 26 Jul 2018 12:35:12 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: MroCbmHBFLS1

On Thu, Jul 26, 2018 at 01:10:34PM +0100, Peter Maydell wrote:
> On 26 July 2018 at 12:41, Andrew Jones <drjones@redhat.com> wrote:
> > The patch guards the generation. It'll only modify DT and ACPI for the
> > new machine type. But, while modifying the DT makes sense, as that
> > generated DT will get consumed
> 
> ...will it? Why would we want the firmware to read the
> QEMU-generated DT? Real hardware doesn't work that way.
>

Good point. If the plan for this reference software is to always
prepare its own DTB and ACPI tables, then this patch shouldn't
touch the DT generation either. Of course a lot of the device
and fdt node creation is intertwined in mach-virt, so it's going
to create a DTB anyway.

(Unless major refactoring is done first...)

Thanks,
drew
