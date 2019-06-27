Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1193555wru;
        Thu, 27 Jun 2019 04:47:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoQIpo19cl0pi0uwqt2a43FYBeghla+9cpVUWoyzJy/u1b/3AxjTHxLd6fIRTcG27r9PRz
X-Received: by 2002:a37:dc07:: with SMTP id v7mr2847314qki.260.1561636034553;
        Thu, 27 Jun 2019 04:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561636034; cv=none;
        d=google.com; s=arc-20160816;
        b=mafM40I61RZeho5avu2pnpNBrboPXuHzS7GtP+F8fz58zJDLyOBo1OGQyaTU7o+T4t
         G/PKALHZWTThoxBz61P9dxQnZxXij/PiE6e7bEVmJKhTK09n3LZDCl1N79H9OvVU2/2I
         WuSm5cDHmTw+W/xnupbaJ3dhdHwnwjbRGGJ4HamOhrTtRJLdIWjEayVnfIvhUywuQq7E
         VS4I6rS0QNXuU4mEOXE/6CKuNxUHIMhCvSvahGPZMNzbgnWBu6kxy1mXlq6gb7iU5Jf9
         W8HpOwvjc2cvc9iPxAN5YIIN7kXubs9irz3pqXAzKWYFA0u0TbDdawCULm/evic4ZWTS
         I2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=pL0PIkmAJ+vpO5oBcuWMS2JrOTPLtaHA/nbSWL9pWCE=;
        b=c/8OKSQSjQg4z2KKhxd6Y5gDdeeBt9lH6vw3KX9014Zkn9oD5AJVcr1EdcVummy0dd
         1ck4ffeFZm8QPd9n0K9UOszs5pTyPJUFswATYmWnkGD2W4fJ2GHitUUSRLN/Afla/D8V
         3/AbjKkRVgYorT6EFDt0R2okRlm6civbVSh71quJHi6S393ATXq2Kv6vN4Xp7/jOIp4R
         Hlx+QG4EnJezKmDqFLAMuMApTrBz7u4UhQAObdr0TWoXLa/+Jze+iOCOPj/GSxt7ZUyh
         R9WQBK3BfFrEHZXqPkKQleEbuyiKg+OIoXESmB3xQJUsZs6BCiJ79xtQ9q76KGqEYwKM
         qZ8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v27si1535520qtb.140.2019.06.27.04.47.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 04:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACBB0307D91F;
	Thu, 27 Jun 2019 11:47:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBE3B5D9C6;
	Thu, 27 Jun 2019 11:47:04 +0000 (UTC)
Date: Thu, 27 Jun 2019 13:47:01 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
Message-ID: <20190627114701.n7tjgmljeribk7to@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <ee8ce4a6-09fd-47ab-ef7e-a231df1e9c1b@redhat.com>
 <20190627104638.x4gxsmv7vpww3mra@kamzik.brq.redhat.com>
 <ae98bf94-6826-1f2b-2f2e-a11a3f75cb92@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae98bf94-6826-1f2b-2f2e-a11a3f75cb92@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 27 Jun 2019 11:47:08 +0000 (UTC)
X-TUID: B9fv1sozDjt/

On Thu, Jun 27, 2019 at 01:00:27PM +0200, Auger Eric wrote:
> Hi,
> 
> On 6/27/19 12:46 PM, Andrew Jones wrote:
> > On Wed, Jun 26, 2019 at 06:56:54PM +0200, Auger Eric wrote:
> >>> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >>> index f500ccb6d31b..b7b719dba57f 100644
> >>> --- a/target/arm/helper.c
> >>> +++ b/target/arm/helper.c
> >>> @@ -5324,7 +5324,16 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >>>  
> >>>      /* Bits other than [3:0] are RAZ/WI.  */
> >>>      QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> >>> -    raw_write(env, ri, value & 0xf);
> >>> +    value &= 0xf;
> >>> +
> >>> +    if (value) {
> >>> +        /* get next vq that is smaller than or equal to value's vq */
> >>> +        uint32_t vq = value + 1;
> >>> +        vq = arm_cpu_vq_map_next_smaller(cpu, vq + 1);
> >>> +        value = vq - 1;
> >> spec says:
> >>
> >> "if an unsupported vector length is requested in ZCR_ELx, the
> >> implementation is required to select the largest
> >> supported vector length that is less than the requested length. This
> >> does not alter the value of ZCR_ELx.LEN.
> >> "
> >>
> >> So I understand the value written in the reg should not be unmodified.
> >>
> > 
> > Sorry, I can't parse what you're trying to tell me here. Here we have
> > to write 'value', because that's what the guest is trying to do. As the
> > spec says in your quote, we have to pick the length the guest wants, or
> > the next smaller valid one, so that's what the code above does. So are
> > you just stating that you agree with this hunk of the code?
> What we are writing into the reg is arm_cpu_vq_map_next_smaller(cpu, vq
> + 1) -1. Maybe I misunderstand the whole wording but I would have
> expected the original unmodified value to be written in the reg instead?

Hmm... So maybe we need more changes to the emulation in order for it to
have an acting value and a register value? Maybe Richard knows what we
should do here.

Thanks,
drew
