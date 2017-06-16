Received: by 10.25.0.23 with SMTP id 23csp1034813lfa;
        Thu, 15 Jun 2017 17:18:43 -0700 (PDT)
X-Received: by 10.200.40.88 with SMTP id 24mr10130494qtr.37.1497572323131;
        Thu, 15 Jun 2017 17:18:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497572323; cv=none;
        d=google.com; s=arc-20160816;
        b=ynpg8afxPbQnDgNL6N1NmCoifmxoG029yIj5mQVJzqQnFKixzpS2iad8+gUhgPAo7S
         4W63Ca3JSi+ac4vFowne5UIgjExEF6ACPvVbVJBVeY0PjSQ3Jiw7kD4ucH/q+YCk1gYw
         ZeKCn+/qxlzmLs84ysxfky4FKXXvVViDXUSlPCdfInkmWFRjSjhCm+3lO8qQ9qjJ6Qqm
         1YAZ/ICoPiHLlw+4xsve+AUNeohHCHpcqxP8/fPe1Mrr+tAiG7e00f1Z5oV1CtZMKeNy
         /OlTgO05cwmq7KByHnjjSuPXmv0C3Wdo6JWpWv3t+Uj9CkY1wR3dEWVz0To6zh/WxUfj
         zAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=oJrB+20pK//0mugNBVGKAk6dl0hkCvndPAGMOQNJxVs=;
        b=bCWVxTJBBrUDjK4oZnAYfu0WVPrzo+sN+fnh8rssAnVlcEcI9a7QN9hbs8XiGLc+wf
         73azNwG9kyg0E4k12wNToNS4T8hHQorT13e9rSdzH1tZ124tx7w/3gEnYMg8Dj/TC61E
         nn//MjhWAoOO5jnD4TzMjujvJ+pyiHuNYdYXN5Jk/LteakHgCisVWVbkXbNbw9Zy6w+P
         1i9J6dd7G20VaL0OS+J9EuOUJMdDbQCtOYIWwg/fpI5TpeGj9E3w2cEIABFxZhH0fjh+
         BQfGENgzadS1ql1KI3WteVWaBgZMDFIFHFuMY9smvkZsTOkNegQWKfjCoax3lVRNrcUy
         USpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=I5ziMj/I;
       dkim=pass header.i=@messagingengine.com header.b=PIWBVcrE;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com. [66.111.4.27])
        by mx.google.com with ESMTPS id r20si676571qkl.14.2017.06.15.17.18.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jun 2017 17:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) client-ip=66.111.4.27;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=I5ziMj/I;
       dkim=pass header.i=@messagingengine.com header.b=PIWBVcrE;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.27 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A386C20B32;
	Thu, 15 Jun 2017 20:18:42 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Thu, 15 Jun 2017 20:18:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=oJrB+20pK//0mug
	NBVGKAk6dl0hkCvndPAGMOQNJxVs=; b=I5ziMj/IGvonE3TYf3PD2rmsFLjRndr
	bxuJvkGAH/5ZSDgbwFYILl4GtaQgZeaEYcuIOPxvQnWBZo27hriYmbXAgOVsTBXL
	gO9LUHUWQF3mfgENbhl2nYgDMdIDV60rBbb2vfbcRALWLiiVvk31GZht/lZXUbKD
	xOnt4HIC+3VM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=oJrB+20pK//0mugNBVGKAk6dl0hkCvndPAGMOQNJxVs=; b=PIWBVcrE
	2KS/N8WYRbEL838S0dqX9tGz2+8V8+58x8UpuuRWtEHeBAE/EKw+HVnFxZnJjxtG
	w9j3TWcMiW7dDqikBi5NuOkuXB0rTbaPHkQFCxgX6GDDPvIe47bMf0DvaN7NXkTl
	/4pnhIyfXTxqC8G7WwQco563rbb3s8IzeGprXt2B0+7o+qBvglTb+8jcMRY+ZscK
	8aXRx2IYHK6xfVDriYkUTRijnz0PwAGRa+hX2LSbtlmwzgZegBnUFnuvnV6xDjZ1
	5JfJs1uRia3tnnbpA5fWfXbCztKRZW7jhQQvIc8cOcrrm9SWyHCvdhAI8yOer282
	C9zgnJN59k7r9w==
X-ME-Sender: <xms:4iNDWZbstYKMYihddDTdsa-57h3GjMRE73UVoRAf7lIb-UrIThQhmg>
X-Sasl-enc: WlAipPtdtWHCjSu98GZWht3qCUG9X5duxiBHvLKMi66n 1497572322
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5DA0324767;
	Thu, 15 Jun 2017 20:18:42 -0400 (EDT)
Date: Thu, 15 Jun 2017 20:18:42 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v6 6/6] target: [tcg, arm] Port to generic
 translation framework
Message-ID: <20170616001842.GA25056@flamenco>
References: <149727922719.28532.11985025310576184920.stgit@frigg.lan>
 <149727927074.28532.17986481795216498698.stgit@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149727927074.28532.17986481795216498698.stgit@frigg.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: pcilpJmfPK5/

On Mon, Jun 12, 2017 at 17:54:30 +0300, Lluís Vilanova wrote:
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> ---
>  target/arm/translate-a64.c |  346 ++++++++++-----------
>  target/arm/translate.c     |  720 ++++++++++++++++++++++----------------------
>  target/arm/translate.h     |   46 ++-
>  3 files changed, 560 insertions(+), 552 deletions(-)

This one makes my arm-softmmu hang while booting debian. The last line
I see is:

> Freeing unused kernel memory: 300K (80669000 - 806b4000)

Note that this happens even after disabling goto_ptr, so it shouldn't
be related to that feature.

The problem might be with the rebase. For instance, the
hunk below was modified by commit 542b3478a ("armv7m: Replace armv7m.hack
with unassigned_access handler"). Might be a good idea to go over
the latest changes to arm/translate.c. What commit was your last working
version based on?

(snip)
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 96272a9888..06f207a5f6 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> +#else
> +    if (dc->base.pc_next >= 0xfffffff0 && arm_dc_feature(dc, ARM_FEATURE_M)) {
> +        /* We always get here via a jump, so know we are not in a
> +           conditional execution block.  */
> +        gen_exception_internal(EXCP_EXCEPTION_EXIT);
> +        dc->base.jmp_type = DJ_EXC;
> +    }
> +#endif
> +}

Thanks,

		Emilio
