Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3642959wrg;
        Mon, 24 Jun 2019 04:05:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHHW4SKxkvq/NF2JI9gs/1mSbF6pVRK5Xc/QmDTA0oqpwChR7tnUQ8qMHsuWQ9uOuYfURL
X-Received: by 2002:a17:906:552:: with SMTP id k18mr41924332eja.117.1561374312216;
        Mon, 24 Jun 2019 04:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561374312; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+zaKV0QTKCf6axQKDjRCRzsXKCYXzV/zl7ZXkHgJzBX3G7WVrjrnuom/aOxM6yTm/
         3bf/RGgNZswLjH2kqh9fyMpjped19qFyWH7XvjWT98nZEp55CaSoFhW+PIcpqCe06haL
         VUHlh37Ow4rCnPF/sjyA94YsT3A3Mxad9tycr7zNcs+NQPeDzH1ItNvuqZA1BSFVZYhN
         FxtNlNDz36aGfwFiFbBJDcswTb0I/8S2FngjzeayKi6p78qrsS381xBfY+/LXIMHVRYR
         bTJiWB2q9basVSie7hHb1NisvvFaVrF+X3C/9cgvzhved4KFnCxcPKDN90EaHWrsJ8e/
         m2hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=HDUtVK0Yse04Ve+MkDhegg1DgJEBVMvppJUQz0PPPZQ=;
        b=F08NuarqH3uE9SteYKc/ErS4eOttN6aM9Q/xhy92UGI1K6yMz/WwxrKS0ulF3YsquB
         e6VUjoPE45WvyLcXk5UfdWxq1nhiIyw1xQeffvUAAmhEABZEu7nutX7R/A47kmS0E2hh
         p2FCDz4AVdq4UAnMEQgw4RPSTTk8d8Jfl1sAo1Y8FlWZvgDtPvP15d8j88ffHDnV+524
         z+9zda5gsUzdyJ5oAQgzt3qi5Owh/eErxi7+YZDsMb1e/WGa7AN5BjWrD4s0PX+oxU2r
         VQpqCf1JwuT267ohbY7ptumx1KNohrZEa46M33LoBcwINBOaOnR4ZqB6QYjQOVjj5GLX
         r48w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id v12si6491051ejh.154.2019.06.24.04.05.11;
        Mon, 24 Jun 2019 04:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9563B2B;
	Mon, 24 Jun 2019 04:05:10 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E99A3F718;
	Mon, 24 Jun 2019 04:05:09 -0700 (PDT)
Date: Mon, 24 Jun 2019 12:05:07 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Subject: Re: [PATCH v2 05/14] target/arm/helper: zcr: Add build bug next to
 value range assumption
Message-ID: <20190624110507.GG2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621163422.6127-6-drjones@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: sCaL7ge4n+GX

On Fri, Jun 21, 2019 at 05:34:13PM +0100, Andrew Jones wrote:

The purpose of this check should probably at least be described in a
comment -- i.e., what actually depends on this?

Cheers
---Dave

> Suggested-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index df4276f5f6ca..edba94004e0b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5319,6 +5319,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      int new_len;
>  
>      /* Bits other than [3:0] are RAZ/WI.  */
> +    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
>      raw_write(env, ri, value & 0xf);
>  
>      /*
> -- 
> 2.20.1
> 
