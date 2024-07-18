Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1327692njk;
        Thu, 18 Jul 2024 02:43:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUT2L0Ag2QYk0en8jB9zBeAm1plF6WB0ViP0HBt8kAYZtwQiU8nSzwZsnOemsEG8+bMRmU22m2nf534qCRB/7yM/PLuPOS/
X-Google-Smtp-Source: AGHT+IEDnsGWqp03UedWR8N9WUSJfWT9M3qHlIetL9N/UTwlUx2V5s0LN53EPNRCA4acetGVl9qY
X-Received: by 2002:a05:620a:4507:b0:79f:1624:f211 with SMTP id af79cd13be357-7a1874fe0bcmr508300585a.57.1721295796924;
        Thu, 18 Jul 2024 02:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721295796; cv=none;
        d=google.com; s=arc-20160816;
        b=LNbFnELVt1kXI8ya3i5kRiyhNbetJaX/8sIDqPptMNYkur1Ti54xiTOde9k7dWdA1d
         2lBuP6FPnAxXKzwkji/J5Wcf0/WasPgJ0hzOEttUdjJeU2J+V7MT5QOulbS1etqkGH30
         X/MHbed3USaOIdXwnHQX6vLvh0rJe1jstBIPQ5zRO91QcH4DsoEKKgCvbr3qgCTy0CQX
         GCqjggwyV+O62P37Pqr5F98Hiw3JG0Jp9PxeWS/9ZJpoDs2LxrO64WvZiNkdL5RjBPCw
         2LIJUz2SpPm2aeOavh0YJnjx1XSoZxZo/Ta/8ntm4dRvjkEwfcq048uIkRa/MQeeoUBb
         XJgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ur27+PZ4q+21qbdQxHpKSV98KfAioDOHdSymytlbitU=;
        fh=FTErQpYFaYm0rZ1Ymq4ZtxEQFN8mMgBPfI9hhlQ5qcg=;
        b=yLTNUhCXWPOz1YEbZx0KL3ZRY4wADOxzf3VsApIgcK7/L5Ag92YCGXP4ZhhPiPbRNS
         yQxQyUd3tbtX3uSSxslBaUji9aYpmzHyIlbPx4oMq/JdvP1VokAteN7kXuJ90cOz/Pe/
         TLRdrG5eHtbNUCykmI0S27aexjBZu1PvnwyHVtmamXDxQCUH3fIVW+hTih1Qa9XKFzpK
         r5cvdpFm8JbGjqnWy1IY1qkmdly0RHN9dbkC6cQ5sA3lsW9UI+Tx8SdlgflPqk03RFCe
         jN8jE5DgPQlxYezhnLCuWaj4V2gMklk/KZhL5WG0qjAwCl44snhltrLnEAiOg8ouNvUp
         87nA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=eHIk97kk;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
Return-Path: <julien@xen.org>
Received: from mail.xenproject.org (mail.xenproject.org. [104.130.215.37])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9696b825si1933101cf.15.2024.07.18.02.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) client-ip=104.130.215.37;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=eHIk97kk;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ur27+PZ4q+21qbdQxHpKSV98KfAioDOHdSymytlbitU=; b=eHIk97kkIoSk2Ev7eX5AHo2Om7
	r0c3pTq1ALdf6E478tuVWNCDZDPglGPwEEfaZ8cyzvRb7bwISv64NVjxVeF6ssNtvCJ2YsSR6hU3X
	6pz1U4wj4Wq7REgLKYPKaqXV9eKpxIg63deWFfrwiE+R32nKwj/3jMuyKwixQWkrrgZQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1sUNfK-0005NE-Ai; Thu, 18 Jul 2024 09:43:10 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1sUNfK-0006Br-0n; Thu, 18 Jul 2024 09:43:10 +0000
Message-ID: <5684927d-d890-42be-841c-ece681502503@xen.org>
Date: Thu, 18 Jul 2024 10:43:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/18] SMMUv3 nested translation support
Content-Language: en-GB
To: eric.auger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com,
 richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240717150931.GA3988597@myrica>
 <1e7e750b-61bd-4822-8742-124bdf66a7c4@redhat.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1e7e750b-61bd-4822-8742-124bdf66a7c4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aQAuc+F1HvpE

Hi Eric,

On 17/07/2024 18:43, Eric Auger wrote:
> Hi Peter, Richard,
> 
> On 7/17/24 17:09, Jean-Philippe Brucker wrote:
>> On Mon, Jul 15, 2024 at 08:45:00AM +0000, Mostafa Saleh wrote:
>>> Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
>>> but not nested instances.
>>> This patch series adds support for nested translation in SMMUv3,
>>> this is controlled by property “arm-smmuv3.stage=nested”, and
>>> advertised to guests as (IDR0.S1P == 1 && IDR0.S2P == 2)
>> For the whole series (3-9, 11, 12, 15, 16, 18):
>>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> (and I think patch 16 is missing Eric's R-b)
> 
> Jean-Philippe and I have followed up the progress of this series,
> Mostafa took into account all our comments and all the patches were
> reviewed. It seems to be in a pretty decent state so if you don't have
> any objection, please consider pulling it for 9.1.
> 
> On my end I did some testing in non nesting mode with virtio-net/vhost
> and I have not noticed any regression.
> Would be nice if someone could send his T-b for the nested part though
> (Julien?).

I haven't yet tried the latest version. I will do that in the next 
couple of days.

Cheers,

-- 
Julien Grall
