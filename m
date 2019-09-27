Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3108832wrp;
        Thu, 26 Sep 2019 23:52:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziCmsdQJeHqln/X4cxuwxs7adC+MQ74JNp402d6M6Ki/UcvpnDx3CrTGAfKh7eJrO2i3Er
X-Received: by 2002:a5d:9956:: with SMTP id v22mr6786981ios.27.1569567123874;
        Thu, 26 Sep 2019 23:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569567123; cv=none;
        d=google.com; s=arc-20160816;
        b=apl581b07dpJ+kWbP/W1IUr/15PzIdbWq5yLjJKTquJ06BstHduzHJFNiQFGYSHt8V
         cvLNeM4YFtohbMvc0UGEopoouTWvKNEpEmevf413YohlrghEQuHoJk6vne5PXa7vhKQT
         ZCxy14Er8ed0mq17lQ0fv0XXIGfpIo4EDS1HcoIvcZJr567ti3xuNYKFRL36WfiAJKCr
         xyjk/Mi+hhsFfwT1hd5SRBXgqJbA2mbjYB+gL+axgfRRu06Xg2Zsx/6KSGzsvG9LLRkd
         Pp3xsp6F2wHdKjwWt3Ms1vSbBErU0wI4+XU0HPHshpDO2JdQfgdAdmnyr3M6NK1AygDB
         tV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=LikGSeWG8ekRT7gsQZj9DRtxjF7i9VuAdPKKtI2BCCw=;
        b=d7f8Bh5015j7fiReKb15t8YuP0Zc/sUW4Lq9QNkrjMGTcpi4RSde7w3jLLmvFtAugF
         ct7xahdgEolilb8fKDPkrrpKVe9lWF9z6Hds3TDONFrSEEExmRb0VWhofernfAcl+op+
         YX4OLbDiwI4kbFtWH/tg4PiG3nSWEaR1Ph+PndZ+E0ji4sXo1uOKA0ECsg9aSmz37tUI
         A21Br60CDsw4n1ig2lRVQKRY5Kf5FfXtPKAwSratK867Ep2a9YeluZgYwSL5T7LueiP4
         H+2i9Wg60gLMXCNRM0VN6ndUUX3FD6u4AJeP9nkua6AdsLo5vADo7Q9faVS3InPdHjG0
         1KWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d23si6045378jad.117.2019.09.26.23.52.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 23:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF88FC06512C;
	Fri, 27 Sep 2019 06:52:02 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE17B5C21F;
	Fri, 27 Sep 2019 06:51:58 +0000 (UTC)
Date: Fri, 27 Sep 2019 08:51:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
	Dave.Martin@arm.com
Subject: Re: [PATCH v4 4/9] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
Message-ID: <20190927065156.zzlx54nmhmnbc4of@kamzik.brq.redhat.com>
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-5-drjones@redhat.com>
 <2beb840f-99cf-d928-0926-c284933c78d9@linaro.org>
 <877e5uaa74.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877e5uaa74.fsf@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 27 Sep 2019 06:52:03 +0000 (UTC)
X-TUID: yVEwAeTsb7Bx

On Fri, Sep 27, 2019 at 12:50:55AM +0100, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
> > On 9/24/19 4:31 AM, Andrew Jones wrote:
> <snip>
> >
> >> +#if __SIZEOF_LONG__ == 8
> >> +#define BIT(n) (1UL << (n))
> >> +#else
> >> +#define BIT(n) (1ULL << (n))
> >> +#endif
> >
> > There's no reason not to always use 1ULL is there?
> 
> Also we already have this helper in bitops.h so should just use that.

bitops.h BIT() uses UL, but we need ULL. FWIW, the kernel has a BIT_ULL()
that we could mimic in QEMU. I guess I could even add that for this patch,
if you'd like.

Thanks,
drew
