Received: by 10.25.227.6 with SMTP id a6csp4900617lfh;
        Thu, 29 Jun 2017 15:52:26 -0700 (PDT)
X-Received: by 10.200.34.2 with SMTP id o2mr4350044qto.67.1498776746245;
        Thu, 29 Jun 2017 15:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498776746; cv=none;
        d=google.com; s=arc-20160816;
        b=gdDTF6PZnCbmNIoxD8J3yiEJLDi9E1ZNSr7aINXwqjZF4TLUmLBmuPcwtoME6u3YQL
         7/03hdn2f+OVYJDd6Z9c1VwB9OFyCvztapi8+k1Jl21Xh5of16LJZyG5uTUu7YTs1vSx
         E2p9LU5Vvi+XRLlh+c2LxWSTN2ueeJdUmsYqnERfgZuxWMmHy5losCDbw0Euun33HYDp
         ydFlEPmH+p8tnT/K/E4yGgsztIF0qszTl/FB7hEs7DVEYszAy6rydvLIim3S24HsxGL0
         btFVQ3fjjavE5ealrTdGlCwmFSgWHQimqENtdYbX46dtbbD8qKxjAd5szqYSrhPO1RlC
         kXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=J4zJf2VELzvzV91/lfEythPzw4JwGPGRuZ4o6bwRVYc=;
        b=Ro74G42j4KvQpf/i+5cD2fEEIUbx2saaSRNmU9zezgR9+jJ9vpFqBXrm+5GBt5h1m7
         E4A5Y2ZB1PYhGrB+PaOlADbUrHkJrO34OjbgjknyAlHM28zLv0mTvOAdboepKZlH9gK+
         fIgSk2wJuF9ic4hwB0LlCucxueviLGteBxvJfyMAXixnYoy2eCTE4xefmb552bdyA3dZ
         Z3JaMYjTtROPC6KAreNE09wZ2M9zE2b2eCIErKG88MLdDoXWpS85KQhqlA1esQjMyaHu
         BEuAHtSg+M+NKEg7W0sIocKO9AsKEfpDBR4eRdtWhyZec6yT9AXG3B9EEtUQ755fmxI7
         EWsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=j+UedUsK;
       dkim=pass header.i=@messagingengine.com header.b=Gh2vFSoU;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.29 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com. [66.111.4.29])
        by mx.google.com with ESMTPS id q55si6078891qtf.382.2017.06.29.15.52.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Jun 2017 15:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.29 as permitted sender) client-ip=66.111.4.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=j+UedUsK;
       dkim=pass header.i=@messagingengine.com header.b=Gh2vFSoU;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.29 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id CF3622066F;
	Thu, 29 Jun 2017 18:52:25 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Thu, 29 Jun 2017 18:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=J4zJf2VELzvzV91
	/lfEythPzw4JwGPGRuZ4o6bwRVYc=; b=j+UedUsKCJr/dkQ3d9Uk0wnaJK3yvq/
	06Y6UQyq/QeUFICaU8l+/ho0OwttYyA1ZWh48/0UKsH1GjMnfzaVHxpBIKXOJqMq
	SWtuEsIN3RWOoECRTOXJoa7vbN61/VUiAcovYBdUCmO0dJo/voiy409VoX7lX+HA
	o+NJsmDE5aBc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=J4zJf2VELzvzV91/lfEythPzw4JwGPGRuZ4o6bwRVYc=; b=Gh2vFSoU
	kzlddC551PdgPBfyjlpKPuqkAZJBMGPSzXrhl/0FEeM+OC7s2WSBt8ZSk3as2TIW
	wdLQLjrILmIG1ci2muoI3eZOXC6w4RguGScoYFTmip+RtR9sHHUal6B0Aon8YM39
	OT0fWvrNiGY0rEzPcQ9ZCjQEzfTMQB2XGiLQbB1q5MDSrypz1mIgy37cdjGVrjLT
	bGWTHRXHPqJHppfDyhW2f0IDNadUC81i7W6bYn3oLa9QQ5odIhA5xgvS88i+eBZ+
	8H4SnZkaLkQAVx0eTihOluoIWkXl3x7RYrAnkPB2KceRF/2+SiAuY/1EOfWd+NAE
	okwMD5FUrpWhWg==
X-ME-Sender: <xms:qYRVWR_G-DZHuf2Q4hOI_o9254Kf74v16hQRhU1OO3F6Ke4iGdrWOA>
X-Sasl-enc: B9lDpJSizl7WUBnRiaIvu/alGsWNXaOQEofgcBusbfDc 1498776745
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 85BF5246E8;
	Thu, 29 Jun 2017 18:52:25 -0400 (EDT)
Date: Thu, 29 Jun 2017 18:52:25 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: =?iso-8859-1?Q?Llu=EDs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,	Michael Walle <michael@walle.cc>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>,
	Anthony Green <green@moxielogic.com>,	Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>,	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,	Max Filippov <jcmvbkbc@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v11 01/29] Pass generic CPUState to
 gen_intermediate_code()
Message-ID: <20170629225225.GA13979@flamenco>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865244195.17063.11938084353514091141.stgit@frigg.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <149865244195.17063.11938084353514091141.stgit@frigg.lan>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: Gj9MVO3L050P

On Wed, Jun 28, 2017 at 15:20:42 +0300, Lluís Vilanova wrote:
> Needed to implement a target-agnostic gen_intermediate_code() in the
> future.
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> ---
(snip)
> -void gen_intermediate_code(CPUAlphaState *env, struct TranslationBlock *tb)
> +void gen_intermediate_code(CPUState *cpu, struct TranslationBlock *tb)
>  {
> -    AlphaCPU *cpu = alpha_env_get_cpu(env);
> -    CPUState *cs = CPU(cpu);
> +    CPUAlphaState *env = cpu->env_ptr;

I'd keep the original variable names, i.e. cs for CPUState in this case,
just like you did for a64:

> -void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
> +void gen_intermediate_code_a64(CPUState *cs, TranslationBlock *tb)
>  {
> -    CPUState *cs = CPU(cpu);
> -    CPUARMState *env = &cpu->env;
> +    CPUARMState *env = cs->env_ptr;
> +    ARMCPU *cpu = arm_env_get_cpu(env);

This will keep the diff size to a minimum.

		E.
