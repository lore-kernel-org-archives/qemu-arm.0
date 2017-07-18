Received: by 10.25.44.15 with SMTP id s15csp5242544lfs;
        Mon, 17 Jul 2017 17:08:37 -0700 (PDT)
X-Received: by 10.237.33.134 with SMTP id l6mr158081qtc.165.1500336517154;
        Mon, 17 Jul 2017 17:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500336517; cv=none;
        d=google.com; s=arc-20160816;
        b=S58+OASn87nHziUbLtzKntvWTd2JoXPMD3t411CbwDyW1mCwm73Tas27HrjaWCf8wD
         gATtJhIABTWJa3H2mMdEaSXDJzkFODiUIGum/wfMHnV+bXJsAu8q5G3WdbxXpfiz0fFY
         Q9VMN9RQn4tkhxMonHhjPEgWjI1Ha8igBIXY4P7K1EjKuTsY09pk+L+OYrFpFAQQdVsM
         0+quN+PXyF7RWdTBLlXnvdIhrXgFdaFtxrXB3MgsGw6ZtNof9V/T55GREbU4Jjam10rN
         wp6jW+6YkvBhilkle54+y/C2qfpC1bKgE7JF+zJPshmyGhxWbj9tzPv0uG5p7iGxWZr/
         vtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=ww7yJCGpDQf+fyHKLN1YgC6OJpVQLeJP3fPcz87eFq4=;
        b=WpjR4NEcUJfCKqK+w97qpAUV2Id1f69bdqirQbNYoaailFVAPODPtQG9K+cv5QOeI5
         sOiQ83ruWrtX0gErFZ6MgiEUjCGRkdoynyiyDBLx4zdBfnxfREsFageOFyrLFwTOuNB7
         qiW4s8+F8dQwKsBvC2Da/A8q01QZbpDfVwJoJyglhnnabHxVVTy3z7hcXEyGUo0u6IyA
         jXstJlYZH+b5I/xq7UvCxltgt1WNAp20PMNenmQA6P+IziWplMO0ZCaki5P0qm0440qq
         NXTLWnvOFocIow83czX2JyrIF5ByuraqsPtnyzSoIm1x876g11F5DEmqIRw827Ti2eYn
         MZlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=JBvwIr9+;
       dkim=pass header.i=@messagingengine.com header.b=hBx7fq3X;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id z26si614292qth.126.2017.07.17.17.08.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jul 2017 17:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=JBvwIr9+;
       dkim=pass header.i=@messagingengine.com header.b=hBx7fq3X;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C1BD9208E0;
	Mon, 17 Jul 2017 20:08:36 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Mon, 17 Jul 2017 20:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=ww7yJCGpDQf+fyH
	KLN1YgC6OJpVQLeJP3fPcz87eFq4=; b=JBvwIr9+9I21Wkf2mIMoXKE6S9W/iIL
	ey8CMF+0fSA2cjuJjtnSinoRJk0Y5YE53++p4b9jIr8jbzLpSwju6xLdeubS3OQa
	qbJ6fXzM/MLwv+cUWnDyGEEsB43qW3IyG1bzrRpehYiIpU8yXIROoYRgZsR+5dBD
	NW3rUMAOAKGc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=ww7yJCGpDQf+fyHKLN1YgC6OJpVQLeJP3fPcz87eFq4=; b=hBx7fq3X
	nXW2ZYl66186ph5zOpTv33vWdmmAuUx3k9IFf7T0how6pidUqZrCa6x8cWgs2Ix7
	HNgHhwMmxUM6ZsoPE5KMxz2KfJVbrlsTl+kD1PLCujiNQUcOYbSu7fYXo/FoLr4l
	v1ux6OQyt+es/xGdp3OUWHQTgpf59joHY5JiOBKUuX7spYghEe9WNL19NXQtlMRh
	Itup1KpPxHSi6K3F0rOtSBIb6bt41HxjoF8XitTXGgn33nPb5wfswF5hyV8QeJ/a
	6z0hVxC9tr+V4jjQ+yDlpM2YEWYBhdZuUowdEDiLTRgpAvOD5bllPnnNJkCCFbgd
	6exOzgjLtfYJ6g==
X-ME-Sender: <xms:hFFtWaTDgydKDvm4qtqGjCuWYH4iWQQs5m4r3AvctIfmiuWp89FP3Q>
X-Sasl-enc: SusGQZ0LUcwJmsRsewAUfrkgkWIstA1upiw0Gk3G2INj 1500336516
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 87F0A7E21B;
	Mon, 17 Jul 2017 20:08:36 -0400 (EDT)
Date: Mon, 17 Jul 2017 20:08:36 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, rth@twiddle.net, qemu-devel@nongnu.org,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 3/6] target/arm/translate.h: expand comment on
 DISAS_EXIT
Message-ID: <20170718000836.GD30851@flamenco>
References: <20170711175937.23140-1-alex.bennee@linaro.org>
 <20170711175937.23140-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170711175937.23140-4-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: XSwBQeB25e9T

On Tue, Jul 11, 2017 at 18:59:34 +0100, Alex Bennée wrote:
> We already have an exit condition, DISAS_UPDATE which will exit the
> run-loop. Expand on the difference with DISAS_EXIT in the comments.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Reviewed-by: Emilio G. Cota <cota@braap.org>

		E.
