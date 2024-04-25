Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1174903ejb;
        Thu, 25 Apr 2024 00:38:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZ0/QjZV8Wp1dNlLsksHDETSdjJa+ZWCJD0qgBErRyc5dr8NBHH/A2bt98UsefKGacmhsywD7J9aTT5Ad73AHTmXVGi3Dd
X-Google-Smtp-Source: AGHT+IE8naOG6L2b6mM4AzuDAowCFEW0SgDw3LOcPoMfRJMJcSUpCwiijP2UJFOk134ri1niU965
X-Received: by 2002:a05:6000:156c:b0:346:d66c:76ae with SMTP id 12-20020a056000156c00b00346d66c76aemr1547874wrz.4.1714030727607;
        Thu, 25 Apr 2024 00:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714030727; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqFKpD1qLfrilpUPkCcJgLRsWdXicrVMysHIuYcgVBxzyo3zEmGrGsrDGcGyLSCgNt
         C7otiWgqmOadoXYg+dDJnjrCChVdDKbJibK8YvMw0l3jjPLBchU7d48Baox5Iz1Gme6K
         p6WeV+3XoL5E8vhRwhqDX4sf/JGQ3yez4VavaPn+ZUWC9X2/O6OuBp1BgXCZcLsihk5m
         KC5ipI9MPtgRJsPpGC6EzH4ERxWQMb8DfY++jp8amOwLQ5IGCARQ7IezBQuvEo7jIAgC
         pev6xrgQw2umTYewd7rNBhonkwxrjcMe6Lper/r6jNdxP0UMqQuIaME2+s82SG2SBQG3
         JbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=uTm0kiXQXQ/Si1FqE2IlgGcUMD6zMGm2KY25S/RPy8c=;
        fh=OtOOtvo4FU6BXigKPw99z6qO8iwfsyoeuXCBKSqaik8=;
        b=Sufvgd70T7V93OleNhi/osBBTir96CSuDcqTKoLxY2aFRNCI8ud2d+j25uRBj17z+m
         j+4yU2fFnYfFMrtw+0Qzfpc/ymq66aX4w7eP6Txkbp1VKkE1ZjBartrGnnhIQz6+r0Ws
         eiYUhj/F1pfrIxopre8H3lkYbAjgt59GAUNG7k1aIXmKBoDQee7efLP61asAPdgpK47T
         3Irvk3yPW0C4LlyUOB0xLtt75Uft5IEs8Nqbc25M8IBT0vhMVXpd0sKLOJqTA3J6GNho
         426F+Hy2tOMqc9ydDuDtSGIXlY1VQahlFy17L58b9ZdfdDRxnmPpAGG1xUGOe/P/ziio
         i17Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=BX4vHLuM;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id i9-20020a05600c354900b0041663119530si275810wmq.1.2024.04.25.00.38.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 00:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=BX4vHLuM;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=uTm0kiXQXQ/Si1FqE2IlgGcUMD6zMGm2KY25S/RPy8c=; b=BX4vHLuMML6o8fU
	+7ykzTpw+IA1y32aJuXV3axUp8UqiSRLuhf4MMMXwaQxdgQyrJqfF+OyrmrpBDSFnfcNrne2wBWL8
	MN7LZrEY2NWsaS50RO7bxeabIYbLGoukEhMtDsiOkf33ddElh5pL1aIs3Y4HSD7wOXkon6+W3NRB3
	6A=;
Date: Thu, 25 Apr 2024 09:39:57 +0200
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Riku Voipio <riku.voipio@iki.fi>
Subject: Re: [PATCH 14/24] exec: Rename 'exec/user/guest-base.h' as
 'user/guest-base.h'
Message-ID: <mneadkx4ytvujstobsjifz7hoizsbbpes5opi7i2lyodl3tgs2@7jzadxaldrpi>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-15-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418192525.97451-15-philmd@linaro.org>
X-TUID: hiCEEX/p70BF

On 18/04/24, Philippe Mathieu-Daudé wrote:
> The include/user/ directory contains the user-emulation
> specific headers. Move guest-base.h there too.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/exec/cpu-all.h               | 2 +-
>  include/{exec => }/user/guest-base.h | 4 ++--
>  tcg/tcg.c                            | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>  rename include/{exec => }/user/guest-base.h (72%)

Patch looks good, but the difference between user/ and exec/user is not
entirely clear to me :)

Reviewed-by: Anton Johansson <anjo@rev.ng>
