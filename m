Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp953264wro;
        Fri, 26 Oct 2018 09:31:29 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fu89qO8XHGjU5NVOWC9/B5NmztM89IRdIGZtXh0qlmVP3nbTPcXWsqJQC5L1MOYLcd155l
X-Received: by 2002:ac8:234c:: with SMTP id b12-v6mr3816178qtb.187.1540571488959;
        Fri, 26 Oct 2018 09:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540571488; cv=none;
        d=google.com; s=arc-20160816;
        b=YQnidYfEDO3U9/S9t20GlfrkVijurgOcfHtrP+SvkLanpZw3BxxyplLgmiHwN4PI+l
         WmV2Ydm5yLYvRfWxzEkvvXYQwCNG9PjotGiBxUUA9Z79+1hexX28Ae8yP7VxA4Ap3KPD
         lpXi0hMCgyi8kTxlVxYxwCXAh/8p57RjRYYL0jDL7ltAn7YyvZP2Q4qrYK4mT+RYQNxl
         iImsB5dcbXG6tDWX8aHYeWw22qXD3DuFU4O4HA1ta8a4XX1IW+7wE2NbEzeS7FnvmFWa
         WHG0sBOHpv3+oGHNLnnlf8nU6R/lMF6I7GDDU4XokcYKgzYm9fjbgP/MQmrldaqdGv6h
         Z7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature;
        bh=Q2M6sy6oJW/uaIVRe6Yd4RAhICsqGXo4MmNZKAiEUKI=;
        b=mMrc7lw9BFi0dstjGZSKmjCQJ84+P+xhASqUP3FN0+nNQM9h6Qn2JIOkFTkpGUz55a
         kD7FgnSp2nM9RgNNFRyD7nxHHE7PiN4zeFzzQilGHZCAEVCTWBSzbDjywt6TRAnxMC7k
         cxvWWt85XDgtWdj6LTVGRce5tf+ZxW69RBJ50dG2rZj1Y+CAC+5eFAnwJNB1/csjzEwP
         jVE1oCLNqBVXbxQIov+o6mtwtICwzf2zQwOLVtUdc+Rj9kuphU0+jiKSw3hfTDV/BF5E
         x/8chhEcOX+JGNJInzP733d1c+CN0+pjSwDPOEkj1/7mVvkBaXDh/mZO76BfRhRkAAZH
         b/Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b="Q/KNwD73";
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=v7d4h2c5;
       spf=pass (google.com: domain of cota@braap.org designates 64.147.123.24 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com. [64.147.123.24])
        by mx.google.com with ESMTPS id f18si9129743qvr.1.2018.10.26.09.31.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 09:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 64.147.123.24 as permitted sender) client-ip=64.147.123.24;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b="Q/KNwD73";
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=v7d4h2c5;
       spf=pass (google.com: domain of cota@braap.org designates 64.147.123.24 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 50E61301;
	Fri, 26 Oct 2018 12:31:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 26 Oct 2018 12:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=mesmtp;
	 bh=Q2M6sy6oJW/uaIVRe6Yd4RAhICsqGXo4MmNZKAiEUKI=; b=Q/KNwD73+9zH
	ot6kREnuMC4EbpAADSt9JsWC2OCtKoGicrzzbsEafKB4NiDEidI/PRvVz7tI88uy
	jO4uVKvIRGM5Tm8f3i3rTefF1z/w+q8OPBvRSR0cHb6Y6lrjArf3GC0PKOqjAE0G
	J8bEU6RZo5dS+lNn7kaSmrBpZk5CmVE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=Q2M6sy6oJW/uaIVRe6Yd4RAhICsqGXo4MmNZKAiEU
	KI=; b=v7d4h2c5Dget5aaHybDyLnonTRtmpAXsbgAsKn3uq5snay5PmkgAlQqG1
	Griom7nEWv8xtq9dnxAJRCHl8BoqbHJGVXchuBs6DYFxWTwF7L3Ihm7iTS/ki+xv
	8IRVcoFRlRHPjzrFSedFnoaaLP9Vxpw0iUBRrQtpY3YS26M43iOpSbnwYlOXwLNO
	ZBU2fT1GQCQfKTwRq6+KMTRqbwzAFgQR6pqTqv6jh8juZetsdlddGFtpFL6NrgDT
	yLZjhhblEQ3CgwB7oH7RhPH6T6z79ZFZ90bbMIGyIPEgV2+RjOivBgTEZiJTkOoW
	DT9HhHgJ28JNQmJaPVRgDKjiG9OIw==
X-ME-Sender: <xms:XkHTW_k9lJyuiLmGJtQJNyVTmfLfzUjh3tiQqy05GtZA-fURFGsEpQ>
X-ME-Proxy: <xmx:XkHTW246IJkiWQLQx_T3q0LFS0UE8iNRzh6FBNMNrWYUGuStabbQLg>
    <xmx:XkHTWwGr6Jz330ETwdLaVgLiXz5yYompX133bMXeVqhvkFLanQe20w>
    <xmx:XkHTW3T-eYM14jzEmuqK36BzyOzWXuWiBOfXOuhDD0P1nhaI40FWKw>
    <xmx:XkHTWxsNRKqQKcTjxea1rudHjlmO9ITMD2Uod1lvBaDnsr2RkgGOPg>
    <xmx:XkHTW-zBO7-1IruGgtpNKCsSQAOUJW12EOKHkW4zz3V8II6TxaqdMA>
    <xmx:XkHTW6CxPCIsZu_6EIRFSesSxfHVm6CAA__AVMhuGjmamHo7SkmxKA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9A0E0102F4;
	Fri, 26 Oct 2018 12:31:25 -0400 (EDT)
Date: Fri, 26 Oct 2018 12:31:24 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [RFC v4 36/71] arm: convert to cpu_interrupt_request
Message-ID: <20181026163124.GA11593@flamenco>
References: <20181025144644.15464-1-cota@braap.org>
 <20181025144644.15464-36-cota@braap.org>
 <87d0rw25fa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87d0rw25fa.fsf@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-TUID: bpe7OoNH7s48

On Fri, Oct 26, 2018 at 14:39:21 +0100, Alex Bennée wrote:
> 
> Emilio G. Cota <cota@braap.org> writes:
> 
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> 
> This will need to catch-up in the next re-base as there is a merge conflict.

Yep, this series is so long that I decided to keep the same
baseline as in v3, so that I could just git diff the two
branches to track the delta.

I'll rebase on master in the next iteration.

Thanks,

		Emilio
