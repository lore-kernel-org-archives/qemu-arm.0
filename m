Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp269710wru;
        Thu, 26 Jul 2018 04:42:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfjRd9rH/dleA8nvnNFCFPDdUiC2qMpYDhDWL/LFTF4W9DKtStrZW6CnWylqdVPIz5gPnHf
X-Received: by 2002:aed:23f8:: with SMTP id k53-v6mr1343209qtc.230.1532605322411;
        Thu, 26 Jul 2018 04:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532605322; cv=none;
        d=google.com; s=arc-20160816;
        b=QVl1H18xDKu9rkx0JRhtferz6RTGQD6i6GDjuux2xeI3GT9TxTMhZgGMLvQSNdwEMX
         0TumJN4yTvJ0rsXY5UZL8dKrU6fD3fxNxkO3/GcZdO8wLWoF/AVC8vYLbrkyvqCbuxYt
         SD8EWUhu0mp3yEHUWjJDoh9ecI+sSvSMazbhlwbNH49nwlTGCox7bzfVMY7g8kO/9joh
         cGdFU/UrBsL8gFiv6QPUIkrzzYvy/tZt6WKJWay+GALuik0iq3sPhPbNU+QYVAzK4tND
         ZcbLbakHkx+DNkSj1w0ip3pN/FOHez0U1Ula2Li8m6bysVTYXUbaJTc95IinzpuxAb0I
         7cQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=ht0U66d2504+P5pZVU35zqSRoyCxixVIuJB+6Eaw8is=;
        b=gvC0jq8FWZkdDc7DNRU2S/ZLIz2/emY66xJteiHP+BXinOwUasWAD2hrjApYX8MZHN
         LWFF7WEy44zVXKFfhdqXZk2h67gZPUjf4tDxO3REBos5yojQb4lld4QZpoklWxFIJJF1
         yD1yRRn0cpZsqqQzcdyE4mIqTBNbCSjp/SL4DidR+Z/GNVtrPimRgxq03pS04jF+sQm1
         lJitnErLGWQAjRUhlID2z98qvcHv77gU4g47u86HpJjt9uJjICJ34R+96vtO+GtU+8Jy
         6ww/rUslfjTqNtxBWPS41ercqWGiTcsh8qnufqNgny8ctalq1Y1uAVYWtJS0Kodp1vlD
         Hd9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id b187-v6si1032493qke.34.2018.07.26.04.42.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 04:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D33E681663C5;
	Thu, 26 Jul 2018 11:42:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D9221C5AF;
	Thu, 26 Jul 2018 11:42:00 +0000 (UTC)
Date: Thu, 26 Jul 2018 13:41:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com>
 <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com>
 <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com>
 <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 26 Jul 2018 11:42:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 26 Jul 2018 11:42:01 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: WY91yaWRCANg

On Thu, Jul 26, 2018 at 01:15:15PM +0200, Ard Biesheuvel wrote:
> That may be true. But we'll still end up with a UEFI build that has
> OVMF virtio bus drivers and device drivers included, blurring the line
> between emulation and virtualization.

The UEFI build can drop the virtio-mmio support, and all the virtio-mmio
device drivers. Those haven't been necessary since the virt machine got
a PCIe host bridge. You'd still need the virtio-pci device drivers, which
may or may not "taint" the reference code, depending on its requirements.

> > I don't disagree, but there's no point in making QEMU ACPI generation
> > code changes that will never be consumed. This patch adds tables for
> > the hard coded ?HCI controllers to ACPI. We don't need those changes for
> > the virt machine and, without fw-cfg, you can't use them on the reference
> > machine.
> >
> 
> Ah, indeed. I missed that bit.
> 
> We should not include any changes that modify the DT node or ACPI
> table generation for mach-virt.
>

The patch guards the generation. It'll only modify DT and ACPI for the
new machine type. But, while modifying the DT makes sense, as that
generated DT will get consumed, the ACPI tables have no way of being
consumed without fw-cfg. If the new machine type doesn't want fw-cfg,
then there's no need to touch any ACPI generation code at all in this
patch.

Thanks,
drew
