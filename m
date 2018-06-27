Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6450949wrq;
        Wed, 27 Jun 2018 09:57:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfWj1sC2HYzh36MVyS50UIwDm33jraebX143NSVKQqDyOEPq7fWPdNEsjRgnAWzbKq/1vem
X-Received: by 2002:a50:be49:: with SMTP id b9-v6mr6171858edi.46.1530118642185;
        Wed, 27 Jun 2018 09:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530118642; cv=none;
        d=google.com; s=arc-20160816;
        b=m1zxvvg0cdCzqWbR0dnV/JW6wVwAu/L3Y+cb7iVbaScIvExPfGbfN/2DPYQgBybzQk
         E9IzCzR1vT8fpj9i1PQFkhDwY1bZjnAUKW15ldSgmg7qSeqHyklbdaUX1PJZVlcodhVZ
         JVEfamtQxuL3BDMz5IQkSpQVl7BFLyt0cULgzoqJ5Wr3VbigqNm1gZ0mM2W1Eeh352xm
         GkxZX07/1mk55choa+O6NrxKQD8B44/beZRHI7rHlgWLS7HQS8+xk+YJFhldUEG7QXdo
         pLPCobK7tMJO5RtYxNhfd5IYWbnN3skEsJYYfiJLTRhlG6hu6P+JfBgSDwlJ+9/6KtTX
         Rcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=HFPduqSYXd4nrkQx0PxiZTVs0z/V0pDxghwZAlBffwM=;
        b=VhuhdY/8NuotJ1RTkCDBBmUhAdf9j4HoUOglOnDdSts+xrDl02ZHAF0YKwfwYO7S7j
         rqFXTZ8UjJfzW2WkjQsBbLc440PVTqAdX+o7Ucv3iOHY4gnKU4UdQzCJYu9UMb2odkgo
         /DyqoDPVb0V4ZvdyGpT2J/5iK90Sc3VnnlzNDDd4iWBl6oHDiTz+E2EKJYU1JMaaJcUd
         GMAGUJd2uDzb2NTTXgEbnyDvbXjn7lpKUm5PnqRJ7DEaNPt55rQUOmH5Nz7oquUxScHq
         JFbDNFzI91MX1h2TESYnSnLdI1XBDcRde49zqVJlafr6O+L2xARvwzs5080KOuYsZ2gZ
         F9wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=1PwMtzEd;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=iXycHAjv;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id g29-v6si2477168edb.317.2018.06.27.09.57.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jun 2018 09:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=1PwMtzEd;
       dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=iXycHAjv;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1B9C8213D0;
	Wed, 27 Jun 2018 12:57:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 27 Jun 2018 12:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=mesmtp; bh=HFPduqSYXd4nrkQx0PxiZTVs0z
	/V0pDxghwZAlBffwM=; b=1PwMtzEdBvS0+1TsL27OF+wtFhmkGOdnTX/zwY72EL
	6+Vz20DES6WyK3zvfKIPjyAcoikDctrauEJ41TGOPHDGheMiNNBat4FHaMIxJQuG
	wdcYhIZ+FtIab34B5OWpS8WwsaQ9+wUBT0dzv75P1T2j5htsWZcoNNNJ74OK1Gio
	s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HFPduq
	SYXd4nrkQx0PxiZTVs0z/V0pDxghwZAlBffwM=; b=iXycHAjvKYsjRQ6Wu/cCdJ
	Zxi+5AD1UoZgrKAFMJJUZ0DfUUDEFLMRNUX0M9gcT8TV4qLpFQAFHqI5dh3K+W50
	J5Ro9SLDVLH5pnAX6USmmrNsjLmeWN+aF9weG6APSa7Zt5FsWnXMQjfJNn3ae/+I
	JADBi8rEeWGQESYCCOhNgx40FsiMKqEXHACYAsp/FNIzHaQTuWYW+vj80oTKX6/y
	7LvFs1JCLbg998ZXqrNg8+9nypZDqlNQzT7GOzdLKLMKaOgtSqzxNrncZaozOkEs
	/3IXqQlFXI+vQqhZBsB14pMOUpgAPJRYAR+bBdIbXwAh8SxmJK7/b6b9SKcVYKbA
	==
X-ME-Proxy: <xmx:8MEzW5GYU4aQ5pZ0wQxqkmPN5eHsvY5BloGqbkDDb3RR-jt9vXHMqQ>
    <xmx:8MEzW7yBMANQaFnupbfTuuIImBL5fwMvzUq25Hw_MjjSd2KJEto6Ow>
    <xmx:8MEzW7Hg1q8N-1ZDlGEX7rFkywZZbDH_P088rgUQEBThnrei53GLig>
    <xmx:8MEzWwtKzfdzqCvlkmvFf4D72pJen0E3y_uBFhO2Vy-BXsPeYdwKSg>
    <xmx:8MEzW_XA1umTpBMhCROG0VmONAh5rXypNczpsIUJaRM_xfE-qKSyYQ>
    <xmx:8cEzW58W74YKKOakiYTkB8KXSlaN0KNUrlqMcsM4n8BdTE329JUtzQ>
X-ME-Sender: <xms:8MEzW7v5-0F5LfS4nY6PlU0qCgWIhs35fSfWfqlIJu1jshb8Oshv4g>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7EA631025D;
	Wed, 27 Jun 2018 12:57:20 -0400 (EDT)
Date: Wed, 27 Jun 2018 12:57:20 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v3 1/5] target/arm: support reading of
 CNT[VCT|FRQ]_EL0 from user-space
Message-ID: <20180627165720.GB17117@flamenco>
References: <20180625160009.17437-1-alex.bennee@linaro.org>
 <20180625160009.17437-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180625160009.17437-2-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: yAhNclNwBXyG

On Mon, Jun 25, 2018 at 17:00:05 +0100, Alex Bennée wrote:
> Since kernel commit a86bd139f2 (arm64: arch_timer: Enable CNTVCT_EL0
> trap..)

I'd also mention here that this feature became available in v4.12.

Thanks,

		Emilio
