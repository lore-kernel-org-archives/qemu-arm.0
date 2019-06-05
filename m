Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2841700wrg;
        Wed, 5 Jun 2019 00:20:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjMHY1U6vbwCF3fJZaxVSeg8rEGQ7xaDqqhvd5fJX1ccJobEqbsXL8dd8P6qkIwAgf9KBe
X-Received: by 2002:a37:5d41:: with SMTP id r62mr12469177qkb.315.1559719233728;
        Wed, 05 Jun 2019 00:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559719233; cv=none;
        d=google.com; s=arc-20160816;
        b=pqqIhFaNOHd1ihaS5/8dZg2iFaJUkR3itarX5/jwGUXElL+AsfvPIELxImfJaKc8gq
         iojxrsYB5F4D1RB/L0JJoxoovl2KVRzB9+ljhSf+rVjUw/eF6gBE9dsizEIUaR/6/xlf
         6zpNGVOeNcc1/t4NeKlI6tjkG7bIoqZTJaL4E9FG5elcV8CtoB8to0JbYPwJ9xI0qfUb
         kXngWCIWUZ5SH+nAftuzfVfx+Cvt2gsGeb67VAgA5EUjkDA+ZG4gGibc+rI1+YXS7RfY
         5n0n2dY7HuPd6sPQQXGrlHr8AfgKTTebM7nw9gtuQTxzG5w9vjgHRBCYISYZltuJ2Jnn
         05hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=EY8G4ytsEBZprPsiOKs7oIyA8IaZ/JLFlppKlTpssuY=;
        b=Ce4G9HihRYz5Jc+CUCJqDTGasBz6SO1n0rEJdDiT0oVq+CyxEZA3iOAA59kUIFy9Bn
         hyhma2ZFLz0R2IRklqcc7tJTa5+rWGA1NAvfGQTSh0/+rppmwoNO2t5Ltg2SyeIixWlN
         dAasTnxh9nUfwP6FZXloh3dK7bzj0uWvq0FeyZDIsJbUYNcA+nLnhxPMY2gjlfWf+sQc
         NKe0e4GodEXBuWIHOUXfQBsyvH0cZbxZYBAlRzF2ZCD/d/ME3CIAG+SVKzTGcZ1/jW1A
         nIYzkxuJ80BqkPFnzFXzA1sotxpHSU6NnptNG9ZlV+WSRh+BOCi8PXLTPJU3BCI+6udd
         WP/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w124si319958qkd.161.2019.06.05.00.20.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 00:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCBEF3082B69;
	Wed,  5 Jun 2019 07:20:32 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A375E19741;
	Wed,  5 Jun 2019 07:20:29 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 01/13] target/arm/kvm64: fix error returns
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 armbru@redhat.com, abologna@redhat.com, alex.bennee@linaro.org,
 Dave.Martin@arm.com
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-2-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9175d449-9b06-7c38-8804-ef454ab5942f@redhat.com>
Date: Wed, 5 Jun 2019 09:20:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190512083624.8916-2-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 05 Jun 2019 07:20:32 +0000 (UTC)
X-TUID: Vayoa/7zddz8

Hi,

On 5/12/19 10:36 AM, Andrew Jones wrote:
> A couple return -EINVAL's forget their '-'s.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index e3ba1492482f..ba232b27a6d3 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -841,7 +841,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>      write_cpustate_to_list(cpu, true);
>  
>      if (!write_list_to_kvmstate(cpu, level)) {
> -        return EINVAL;
> +        return -EINVAL;
>      }
>  
>      kvm_arm_sync_mpstate_to_kvm(cpu);
> @@ -982,7 +982,7 @@ int kvm_arch_get_registers(CPUState *cs)
>      }
>  
>      if (!write_kvmstate_to_list(cpu)) {
> -        return EINVAL;
> +        return -EINVAL;
>      }
>      /* Note that it's OK to have registers which aren't in CPUState,
>       * so we can ignore a failure return here.
> 
note, if I am not wrong, in existing call sites the returned value is
never tested actually.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
