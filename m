Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp668786wru;
        Wed, 25 Jul 2018 05:57:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcXghbHql8mP7iF+nd7KxvoBT3E04dGDn8KRl/OC+eYoUXG4baD7fkspEhDn50H2xt8qczk
X-Received: by 2002:a37:d93:: with SMTP id 141-v6mr16240271qkn.159.1532523458751;
        Wed, 25 Jul 2018 05:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532523458; cv=none;
        d=google.com; s=arc-20160816;
        b=ChWzznKB8WwwR+lj/bqgoTTabm8ZPdg4non0Sg9KCk6D0r+N6NLnIx6MRRKpmwaU8p
         ezIr9OuEUWEl1xLXyQk6JXkRiWfPXCur4etOW8GFRxqlmRoNGiQ55e6YXn49uxEnirG0
         ekn4XdGt0BWTQW94tvBVvd//onYQAE7iZ73fumktPbAw3iXEZkrY2op+SGGVRVIAu2gr
         QcTC5awhnuSitY9EPWoFB1kgqr7Zvv5x2BFY6A8sJEQm/CbwQKcnORuyISoPAa2Ze/Bw
         7ASThot4E7Ghf5QJeD4bXaVk1tqkpit0Q5fAjmbV6GVSrb623bAZzzsYtm/4RmXsLMpT
         FAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=QygSRk/VtRM79fGbzfSdov7ggwqbmksHYE48LPuRF4o=;
        b=MnvKqcXJVqmElP+f1bw96wB+cXGchRRVlgNvT01vTu85PenicX2fMNx395Rr87CDNS
         ujbkZdwZvCdb4aWd5+S06sk9pprpJj6VmbLpvr/RPHIuDD+bcN+mOKSCH7iZPj2SaxJr
         68IGY4OIpoxiZppuzfjpIO6khSSyVIIBaEBtQ6/qIRyxR/ee7BP0Hz1Zog8Z9W4O4MR2
         NOV1EXBT5etj19YAtYB8OrxxvTfwVTaBBjZsRgu5LBIJHVjKbOVakkTIYOsse9aJc0i2
         cpLVl5EDeosWdB76mKzQbi3xWiobfv/6i+f8N75GJ4EoAo6Fl2xDKooTb4ZdAKSGnVAk
         f+NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id i69-v6si6283383qkh.347.2018.07.25.05.57.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 05:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5068640216E3;
	Wed, 25 Jul 2018 12:57:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8F6A7C56;
	Wed, 25 Jul 2018 12:57:36 +0000 (UTC)
Date: Wed, 25 Jul 2018 14:57:34 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725125734.pzsv5mieynulqw6k@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
 <CAKv+Gu9n5Y9tghjR7VJcnH96-rzDWvhY4UCkPtFP9hNUh=LK=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu9n5Y9tghjR7VJcnH96-rzDWvhY4UCkPtFP9hNUh=LK=Q@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 12:57:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 12:57:38 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: QRBlkswIbroY

On Wed, Jul 25, 2018 at 02:29:09PM +0200, Ard Biesheuvel wrote:
> To prevent spending a disproportionate amount of time on inventing
> ways to parameterize these 'models', which includes interfaces not
> only between UEFI and QEMU but also between ARM-TF and QEMU (and
> potentially between UEFI and ARM-TF as well), could we please consider

I guess a UEFI <=> ARM-TF interface will also need to work on real
hardware, and therefore need a QEMU model. If whatever that interface
needs can also satisfy the UEFI <=> QEMU and ARM-TF <=> interfaces,
then that's all we need - no need for fw-cfg.

> fixed configurations for the non-discoverable bits? If there is a new

Well, at least one thing must to be fixed, which is

 a) address/register where the address of the DTB will be stored
 b) address of the QEMU interface device, e.g. fw-cfg. fw-cfg or
    whatever can then be used to get the DTB.

And I guess everything the SBSA says should be fixed should be fixed.
Otherwise, what's non-discoverable?

> and improved sbsa model in the future, we could call it sbsa-2.0, no?

Of course the model can be versioned, allowing for any change, but
I don't think model versions were meant to be aliases for peripheral
selections. That's what scripts wrapped around qemu are for.

Thanks,
drew
