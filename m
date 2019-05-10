Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp53469wrg;
        Fri, 10 May 2019 10:01:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmKfGGc0CreKmYggbJQDKYRV8jOTi10l+sVLaXSVi7VuLEWKNBO7MJzZM1e2yuesMitTP8
X-Received: by 2002:a05:600c:230a:: with SMTP id 10mr3357877wmo.24.1557507706115;
        Fri, 10 May 2019 10:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557507706; cv=none;
        d=google.com; s=arc-20160816;
        b=hT4/d6HMI4j/6RUkoCqrqV2PHDJ4nJqAoDAQ9Wip5uTEgJJtxuQLqvwU40bidaOhdx
         /UN3m3d8DGsD7Aky0AH8ML2BnsVjAIK3QBhCG11RutSjiEj0oqFdmHqODZPaTIUg2Vkz
         tQ0BB66xLKDGFuQcN9UE5BAPHSsH2z3LMx4u7khV0+YazMjKi8S56qFvHF4j/cYRB95Q
         KKp2iySWbYDQhNbtuRDHOTo6HQOwQA/mSdqykey2lSeXNKbae3XPtDcGwKn3ZZK5yAwu
         KTtABcpG4xl4Vf4ic+D5UvBOV+biU71a08winyy0TOdriDCweuX26vPcdI1oG7XKVcQb
         dsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature;
        bh=HAc61hZVPwMI44DNxHAee1xNkXKfQn9mb6hUsdxLP3k=;
        b=R2nuTmG0gDnDE+LQzrPOqt5vNiwgUiOU1It9jjNGJSw5o8ST5td9ZnzY5rILov2bnG
         9PjWAPYv4pcm8l1+KLocdOiVDN0vAi9jLrNHuLYvKr1olznVLUJrvtxlxuVT4GGyYu3D
         8O/VOsJX5IL9Zon6bekYGhXAYl9NsXqYvx/Ed/L9bITiP2oUYPS9MiHsB1uJPFGPGgrQ
         dt09Tu18CDlnXzpZYm78fNUeACH0zphyTaB8anTboQilJJjotMRSSo2l9m1HcrGF9biJ
         Ux0bNAxfyeE5k3MTBtg095SQCzQU6ntm4LT6iNOBeJOr+CxuFkz9bU+jiPPBCsyABaKR
         0NfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=0tdz4EV4;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=fzFpRsSh;
       spf=pass (google.com: domain of cota@braap.org designates 64.147.123.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com. [64.147.123.25])
        by mx.google.com with ESMTPS id y23si4099028edm.232.2019.05.10.10.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 10:01:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 64.147.123.25 as permitted sender) client-ip=64.147.123.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=0tdz4EV4;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=fzFpRsSh;
       spf=pass (google.com: domain of cota@braap.org designates 64.147.123.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 291393E4;
	Fri, 10 May 2019 13:01:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 10 May 2019 13:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=mesmtp;
	 bh=HAc61hZVPwMI44DNxHAee1xNkXKfQn9mb6hUsdxLP3k=; b=0tdz4EV4dk/P
	QwCMjB92FLTUHWyaFfcTMrpS5y2ywKgHLPSsYtA7vzNChnFVRFKB7uVw7u4DOo69
	ZP5rzDMdul0QnG53QfMf/q7QjdPD5kgIzafDDSU+T234VQvQHPmfc8efzRfRKpyU
	/IQKh4k+bKhMukurQqGZINP0svy86xs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=HAc61hZVPwMI44DNxHAee1xNkXKfQn9mb6hUsdxLP
	3k=; b=fzFpRsSh6yf12POjeGdjnjKM+SVM0AXWcOaHu8Ixdu/D/RAMBjklPa5o/
	KV40Jk/PBB1VAJwrXTvEFZjGXWQAdY0q4VE7uts2gsZ+8+7lKWWcVaH/KC2tKEsz
	X1unvHtfhMCj+l1JxXh6/i6/+MxdGKsUU0PC+sWfAoAdLlJn5M3NQFRQsaeKn8ST
	x6UBVFca3TliSas6xgTUH36yeejW3ODz5ZMNiY0/UEjnlGgUi33oPdzl48msWqZ1
	tSLLYb+5NBEozxpZqf6bUKk4OK93u7ZqlmiS5wTs+BD2zCvB1vuT6PTHZk2r8VyG
	nIhdzrJzIWZQt/HeGYqF6W0Ka3OeA==
X-ME-Sender: <xms:d67VXMdoGG_zSUvNaITYdrbFjrA9EEXNfITv5HClU1QnIhMiiItBmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeekgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtredunecuhfhrohhmpedfgfhm
    ihhlihhoucfirdcuvehothgrfdcuoegtohhtrgessghrrggrphdrohhrgheqnecukfhppe
    duvdekrdehledrvddtrddvudeinecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhtrges
    sghrrggrphdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:d67VXPEqDvQb0jaa39XVizmD-RpDlPHPyMSLvLMdfvVSC4O60xCyXg>
    <xmx:d67VXOj7hTWPS-F0h8ErW7wII31Kpw9JwpBzSoBnjtE1k4v0Ud_p9g>
    <xmx:d67VXD5FeGFDEF1ZAPmmzzgZBM7jJnj6yMrGYJAh_cRXi9VwMP_dgw>
    <xmx:d67VXCjRUzSEjJMpkXpXMSLCJpv7rWDe965D8A36pnz0ArgUiFsXcA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1E1D38005A;
	Fri, 10 May 2019 13:01:43 -0400 (EDT)
Date: Fri, 10 May 2019 13:01:42 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH  v5 00/15] demacro softmmu (plus tests/coverage)
Message-ID: <20190510170142.GA21309@flamenco>
References: <20190430165234.32272-1-alex.bennee@linaro.org>
 <87muju4mvi.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87muju4mvi.fsf@zen.linaroharston>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-TUID: 85NojZmVYQgB

On Fri, May 10, 2019 at 11:36:33 +0100, Alex Bennée wrote:
> Ping Emilio/Mark
> 
> Would you be able to re-run your tests to check there are no other
> regressions? I can then get the PR prepared for merging ;-)

I'll try to run some tests next week, but I am not sure I'll
have time to do so. If I were you I'd go ahead with the PR --
it's best to have these type of changes merged early in the
development cycle.

Thanks,

		Emilio
