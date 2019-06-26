Received: by 2002:adf:a309:0:0:0:0:0 with SMTP id c9csp704014wrb;
        Wed, 26 Jun 2019 03:01:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqystpWPc0U46MyDcfB+DtOiQ6Iy8L2/stQCFUyAsqoopsbMA2+vDiuVZASWSOn5ktawuUon
X-Received: by 2002:a37:dd4:: with SMTP id 203mr3151765qkn.326.1561543289629;
        Wed, 26 Jun 2019 03:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561543289; cv=none;
        d=google.com; s=arc-20160816;
        b=SgzgckWQDZ3y+4nlM8ZMc1NbRRq1csqA/ynubauSiRAeO/WwxXzCZQQk5jIDdB4cd2
         w68tulW+tIuSEWLAdmptxSPOOGi5Q9HpRsIcOKk3lgC7fRCJZOZsJOlibtQujTFtEdid
         o/Iqx9B9CeKjQeD0oLh469zeXUOwnnzv70ISWPLN7j09xy9bAbytBEN44S+bxGyiukNt
         EUYsWNQG9ErgIyruKJrMRorvAg7KA407wzrxeumNH1fKjM4TuZ1aO//CvkCBRPiZmhOJ
         7khjNAtkOeVUxvWTddBJ7g5kS4q1xUMrziKvZgqZ76+VC3q19uf7SkHSBve7g1pRit8T
         u6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=YXHGACYbUN1s78km6SS2elWyN73U+sb543dnyuDbqSs=;
        b=H9Y0Ltub7WNdLp9cMkeOofUIgWyWCwZ2Qyc6Pz2RD9ad3r8ixI60bA7yM9vQwQo6n2
         Z/xRdT1cLZGy91bW8o+q2uYuwZ/khsIOaodJgznm2ic4ViAyL/7ssJxFZkovUUmRMfHe
         bq6OvrBuaHN9nh7SBaCtRpG6V5qcvLWNmzM2Cqe3x4gTg4pnc8aNcCLgugy8cmtr+n89
         WE+bOC03MTLmPbg3YbKEX3/7wVw6QHrJWK5fhCYpYG4ylaL8L4nPVUyPwltzEq2TP4D0
         62sx2gYaxYOVEDG/RXJ+KvCSZS/PYUfKOLXeE+8ECGMwFDOeSPwordZCZsD7kdYz3gl4
         ht3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g130si11226395qkb.213.2019.06.26.03.01.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 03:01:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA1C9307CDD5;
	Wed, 26 Jun 2019 10:01:15 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE8A5D70D;
	Wed, 26 Jun 2019 10:01:12 +0000 (UTC)
Subject: Re: [PATCH v2 05/14] target/arm/helper: zcr: Add build bug next to
 value range assumption
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3c24d706-4ee5-336d-8f74-adae672c450d@redhat.com>
Date: Wed, 26 Jun 2019 12:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-6-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 26 Jun 2019 10:01:15 +0000 (UTC)
X-TUID: T+Bs/gXq+WJV

Hi Drew,

On 6/21/19 6:34 PM, Andrew Jones wrote:
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
Can you document in the commit message why this check is critical?

Thanks

Eric
>      raw_write(env, ri, value & 0xf);
>  
>      /*
> 
