Received: by 10.25.0.144 with SMTP id 138csp1012140lfa;
        Sun, 16 Apr 2017 11:28:44 -0700 (PDT)
X-Received: by 10.200.36.139 with SMTP id s11mr6638141qts.19.1492367324444;
        Sun, 16 Apr 2017 11:28:44 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id f131si8424246qkb.116.2017.04.16.11.28.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Apr 2017 11:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E283820792;
	Sun, 16 Apr 2017 14:28:43 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Sun, 16 Apr 2017 14:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=EuwN9bfznaC1rikLMDl/bEU+Lsuq77d0qMle1K
	HpJeM=; b=VmoYskGySZJQLYcPqsJz2XZCGarL2oEeqokCq7hboZAOxPvNmMFAUQ
	EbpJ2v8LsP2ehQjRrGi0TAbgJBMi6glZ6ymgCwxwfK3PIAiw/OSIMuL/kst8HBxV
	35sde6NWWh689NnDM+D3efZT0xFJ4a5eh5MIK9NUbZkIxk9f3KKmk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=EuwN9bfznaC1rikLMD
	l/bEU+Lsuq77d0qMle1KHpJeM=; b=R7v4RGd9V2kxu3hOskfGuk5Ahub+pnKmVf
	4Oz3Cu5btKuBxfMA994pPl0tpOngXMsdwjx4ucOqSAxpV2TxWwnxCjBVUlQbWS3a
	xbbm7o10PreTKCHhYwVQthohMboHK6ptgEbTH8dlHhv78vWAr5pIXO+ruSxPNkh4
	H4bWNpgf+cAGt4bVe/wagWOnMtHNloJxoBmn71Um16vsva3REO7CNY4C9QqgMP8k
	KncYPSPGSG+QQ91E3EizySQqX7gL+zb6JdH84cqrZqeTh5IPzTCj24ojEZxLBLqy
	l4/LIoPOXs5q+VASK1es08jq9ehn4evDuA/xH3oQtYBdWgzpE1NA==
X-ME-Sender: <xms:27fzWAx50FntnebZQSRexfWe0N0LMbks22kehZEFO4IAQoqAIntcIw>
X-Sasl-enc: ZERzR+qVeaGsg6nxBswVmL38ruPQvOek6HLLrxhb70nM 1492367323
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id ABB347E6E3;
	Sun, 16 Apr 2017 14:28:43 -0400 (EDT)
Date: Sun, 16 Apr 2017 14:28:43 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@suse.de>,
	alex.bennee@linaro.org, qemu-arm@nongnu.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-devel] [PATCH 05/10] tcg: add jr opcode
Message-ID: <20170416182843.GA30160@flamenco>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
 <1491959850-30756-6-git-send-email-cota@braap.org>
 <73257eb8-edfd-ae0b-a5fa-b1194de568d8@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73257eb8-edfd-ae0b-a5fa-b1194de568d8@twiddle.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: p2oV2VaNARmL

On Sat, Apr 15, 2017 at 04:40:35 -0700, Richard Henderson wrote:
> On 04/11/2017 06:17 PM, Emilio G. Cota wrote:
> >This will be used by TCG targets to implement a fast path
> >for indirect branches.
> >
> >I only have implemented and tested this on an i386 host, so
> >make this opcode optional and mark it as not implemented by
> >other TCG backends.
> 
> I don't think this is quite the right abstraction.  In particular, if we can
> always return a valid address from the helper, we can eliminate a
> conditional branch.
> 
> I think this should work as follows:
(snip)

Yes that's much better. In fact in the cover letter I forgot to
mention that the code by the paper authors does something similar
to avoid the branch.

I went with the design with a branch because (1) I wasn't sure that
exporting tb_ret_addr would get your approval and (2) my knowledge
of TCG backend code is shamefully poor.

Will work on a v2. Thanks for the feedback!

		Emilio
