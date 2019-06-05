Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2842483wrg;
        Wed, 5 Jun 2019 00:21:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQ7uu2zFSP80B06RYZIlbd358okulT+6QUaoqcUmoVNVUSwRGxmfGioOp581/2RVTHhl2D
X-Received: by 2002:a0c:b529:: with SMTP id d41mr30841492qve.125.1559719284286;
        Wed, 05 Jun 2019 00:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559719284; cv=none;
        d=google.com; s=arc-20160816;
        b=j3M/sK0WDoXmcog4dHGTr70xiIir4BUSEha+tgpIxmIPlITYgX0WP7jrLbC828fSmd
         wsmQDQSlJn241T7P1zeM/x6hcbQ2UgXazP2pPkYCfvQccG8ecd1C2vnaHe5KYo2PX76M
         fTJaiiOSwxUFE1kv6Lxdpo1RvCScHxwEFJD/b2D9veKlDD1oT2e2gsDaCrhu76GNU8BN
         e4z/jnOMP9ywxLcJfFRV5VT2lSMq5rednpazeYy93/2u1/n8qpIrvCEcCdPQk4hMyWOt
         n/okeLB8Fffs/lma751FAn7KKo6Om1QFK4hIQp1wiwVZHDzmTuvAHyLp7Z0pqwIEqNH9
         AZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=PITquy42t5M4H4+ooUi1UUDJHoqrqb+ZoOraZPqsDsU=;
        b=jeHKr8nTSfNei0/UYIzNy0IJwKgEmN9EyfJS1lmvDUMbF/rG9bYEf2LC+cLZxrTyPU
         ogDescY+CB59Z36aTe4EtlqjDErm+CPJjWPfjY93lvkyQjHXyBk79ueOfuSi3IOcugXj
         rlGaoBfuCe0oGkls6sEhoGfGx+oWcMPD6CFcpfnq1Ry08QNKxnwRey9nFSHUImOyD/7n
         Xv3fT7W+7ZkaCfH9unwvXuG01ZRJ37Xp0E3hydKJyyp4iEVpqxkgbWpu8AeSjZgjNXOv
         vEEDacnz9gNKCCG6yY1PplyFn9J6pgEuXX2FC8Y/4Iy52Q1woNRuw1vCUcQ2vx6zA0RS
         hSlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f204si2258861qke.8.2019.06.05.00.21.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 00:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CA32308AA11;
	Wed,  5 Jun 2019 07:21:23 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64F001001E65;
	Wed,  5 Jun 2019 07:21:20 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 02/13] update-linux-headers: Add
 sve_context.h to asm-arm64
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 armbru@redhat.com, abologna@redhat.com, alex.bennee@linaro.org,
 Dave.Martin@arm.com
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-3-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c2756de5-be71-45f8-8ca4-bf9f594d525d@redhat.com>
Date: Wed, 5 Jun 2019 09:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190512083624.8916-3-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 05 Jun 2019 07:21:23 +0000 (UTC)
X-TUID: N7QnHyiun44b

Hi,

On 5/12/19 10:36 AM, Andrew Jones wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  scripts/update-linux-headers.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> index c3819d2b983d..e1fce54f8aa3 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -99,6 +99,9 @@ for arch in $ARCHLIST; do
>          cp "$tmpdir/include/asm/$header" "$output/linux-headers/asm-$arch"
>      done
>  
> +    if [ $arch = arm64 ]; then
> +        cp "$tmpdir/include/asm/sve_context.h" "$output/linux-headers/asm-arm64/"
> +    fi
>      if [ $arch = mips ]; then
>          cp "$tmpdir/include/asm/sgidefs.h" "$output/linux-headers/asm-mips/"
>          cp "$tmpdir/include/asm/unistd_o32.h" "$output/linux-headers/asm-mips/"
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
