Received: by 10.28.91.67 with SMTP id p64csp5497281wmb;
        Wed, 21 Mar 2018 13:16:53 -0700 (PDT)
X-Google-Smtp-Source: AG47ELshB3UymkY6xGi8vqk5eT3+zwsOkrM5fuEMzwQxCvW2VhCFIjPr8Wz0/dDmoYftE12mvvcS
X-Received: by 10.101.97.205 with SMTP id j13mr2225668pgv.266.1521663413074;
        Wed, 21 Mar 2018 13:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521663413; cv=none;
        d=google.com; s=arc-20160816;
        b=o2RybK2ZQ4ozzZzNMbn4sPo+Jzjz/XfsktlGazborYzhmIGQLrK2O3doBt+8SWCKAi
         S3CZ6EZr+1UIZsZUNr6GeWMupAmKeCqBpnCc8OL2xkSgP6IhaoGd9vWBRF+fyWYncpht
         PIdKR0QSZkikqP9liJjdlRnCoF2hgYh2GDCFGA1m61sQZNuLu7jK57rhpyIEvhhYis63
         9c8Thn+T7sd6rYSsvkjdHDS1C7oMeLd1mbVr4V4hFZeubXJkSFQWCmAvuBVeO/X2IwT7
         Amnhgk/PUrM+xTFQ06DX7zS6nYeSpnpQa+AVumftiAnlAJU8RD9SHG19+vrfcCY6YCAe
         UBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=nblGJnBRifQ4hjO38nbiChsolu5z/ZAfscy357YyB1E=;
        b=gOuBLWY1CfFT1CXIxgjmwtEkQLoeFHJa8RSxxhalzSkCzGrIydEh79to8xsXqAnQ0k
         ZpVlL+gplYyFVLHkChMF4cwrnbDLjyWGzAiLDODS/YTll98kuXH5KtBfLeU8n7J7l/jv
         xUUJdUqvTN20uB1Vw8TRUi8QcJGYehI1+nQB0XbrDkX2qYaEHkmoiHoX/gpuCg6KOpVc
         2bS3VG8RXHCRopKpqSye3MuFOS0asCIWU2OsLwhCjdWWKPn/oKTsnlrKelca3y7EeRIt
         Si3SZb78lEh5kbTJ6MOyhBQs8fGRQWwc6FbZk7fQk3/e0uwkGC4om/2kDR3JO9M4NBeN
         hn0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=T8/iQpjP;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ctI+GrmO;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.29 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com. [66.111.4.29])
        by mx.google.com with ESMTPS id j20-v6si4248144pll.86.2018.03.21.13.16.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Mar 2018 13:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.29 as permitted sender) client-ip=66.111.4.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=T8/iQpjP;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=ctI+GrmO;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.29 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 27D2A214CE;
	Wed, 21 Mar 2018 16:16:52 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 21 Mar 2018 16:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=mesmtp; bh=nblGJnBRifQ4hjO38nbiChsolu
	5z/ZAfscy357YyB1E=; b=T8/iQpjPc9Iq9MjIM3oLCW/wY/QB/yB6NQftmb5cq+
	gdeGbLjrUQmYhzAfiZf1sYmlW8No2l3+lTX/9SXL56tCBfrguW1TwKun6yDOW0/n
	BKMzUtmFp0k5X9kAAAkbOC4sorZZ0c1gQ5rGtQVZzMFrWviD/LGAkD7WwpK3L+RS
	M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nblGJn
	BRifQ4hjO38nbiChsolu5z/ZAfscy357YyB1E=; b=ctI+GrmOvgpD/RUlQ0Q+U0
	9x4y3BTxK61np7iUQvhigCV3XIjKke4VtVYF9KWbDnlKSOBtqvoQmaN52Sj5N4eG
	yznAJgYUBy3A4Mt7AVJ0MExie+PPe09X+SQYMgNzyW+8wWjN5LHiQy+S5eX9LIzq
	gYdc7tq15CTgsMUg/BxYy2nP12ltpOROB3fpknnfIYYpGMbKsoIEO/r4LOJ6gWs0
	H1naoDKpW+++LM7PDK77Iud8naha0cwJ99scGfMekHnWvInSDFkAVVap8bXMvR9P
	dSQ/Cnwsrr/tgT19KUGQG9rZQeBqSIGgee7L32mOMqQcVTOj8NSR9ZCFJbOPgyGg
	==
X-ME-Sender: <xms:tL2yWnnDYGveZpfSCunGbWWUB2bxWeeWMTY9wsq-nG-IJlBOz9_7mQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id D3A647E16E;
	Wed, 21 Mar 2018 16:16:51 -0400 (EDT)
Date: Wed, 21 Mar 2018 16:16:51 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH] fpu/softfloat: use hardware sqrt if we can
 (EXPERIMENT!)
Message-ID: <20180321201651.GA32458@flamenco>
References: <CAFEAcA_Tp9cH5CBi4C6CRHpZ4ozygGSFYhdLaURBQOVZ9zVxvA@mail.gmail.com>
 <20180220210137.18018-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180220210137.18018-1-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: P31QEVN1h/WS

On Tue, Feb 20, 2018 at 21:01:37 +0000, Alex Bennée wrote:
> This is an attempt to save some of the cost of sqrt by using the
> inbuilt support of the host hardware. The idea is assuming we start
> with a valid input we can use the hardware. If any tininess issues
> occur this will trip and FPU exception where:
> 
>   - we turn off cpu->use_host_fpu
>   - mask the FPU exceptions
>   - return to what we were doing

Please see this thread for an alternative approach:

  [Qemu-devel] [PATCH v1 00/14] fp-test + hostfloat
  https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg05908.html

		Emilio
