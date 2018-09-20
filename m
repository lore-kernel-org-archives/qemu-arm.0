Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2322972wrd;
        Thu, 20 Sep 2018 13:06:43 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYLwopiSTAPBn7IGSP4HEsXusFtu4u1WTI9cmXVaVKUKYnUsaK6xlfMjSmLg0BFdZLUhW2h
X-Received: by 2002:a37:1519:: with SMTP id f25-v6mr599068qkh.268.1537474003541;
        Thu, 20 Sep 2018 13:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537474003; cv=none;
        d=google.com; s=arc-20160816;
        b=hYPzCsOfLfoApW4ECeyI2vmTh6Y9BagzjHA7QEgRalPnEYKKP0neShYhndwY1rd1UG
         ivMfpM4aipYPyb4+LV/Qyj8dVwVicYxVAiQr9/P5gO6hS5kaLgVTyoG1LOb24JAMfruN
         nRgnIS28+en5APe5wYBrcyLqLPUiHKmvWez3ezuYpD1AG+aJ+bt7mEdNBQogQ2jP8/3g
         Sp1Yv4QSzBxZ25R8h2EethyILYSGbtC8GFGbTf2Y0KhT+hWAqMUbcPN0wEDhA68N8VMw
         ast3dJrc2LYduzgdFMeAm+85G7rO7/XLCboR5bvIBU9YvYU1lmxqvTPpbu2Cg5BAtrNW
         5WLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to;
        bh=+EdT+hSTxGtDm2kVJ6KYMLLvduD7zqeTocRgDvZ9fLw=;
        b=M/QP0Z1JJ/LfqNTs0sNQ0QB1QuUXJdgmtxYlrY2j4qO3c5PKQAtuHXPkT7MmRpTKUv
         oqsnXCN5NH9bkQLjxA1nX969UPKthETpgpne6GjXJCqoETOPsfyZRxHrGAzciGf1GQl1
         y/o4PydoJFp+75ugrJa8rPEKCW70/0U3khPJZLjuWyEcmtNF3cjLwiIGeJNRX/Kg1qUS
         SF0n/XNxzsdSjb/3KSsh4rIPGEzVxCmd6HRbww57koKsdqIWqsqeG1ANvZu8K+ncFBLX
         tvf3XbddrwT/Tzn4FxvuK6v1Th70cUFx/zkQPCme6IFlk142AJ4ySLvVK82M6dlNsFCY
         Jp9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11-v6si828433qtc.224.2018.09.20.13.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Sep 2018 13:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g35Dl-0005fl-0l
	for alex.bennee@linaro.org; Thu, 20 Sep 2018 16:06:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1g35Db-0005du-LS
	for qemu-arm@nongnu.org; Thu, 20 Sep 2018 16:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1g35Da-0005X8-L3
	for qemu-arm@nongnu.org; Thu, 20 Sep 2018 16:06:31 -0400
Received: from chuckie.co.uk ([82.165.15.123]:33154
	helo=s16892447.onlinehome-server.info)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1g35DS-0005Ql-Aa; Thu, 20 Sep 2018 16:06:22 -0400
Received: from host86-191-82-156.range86-191.btcentralplus.com
	([86.191.82.156] helo=[192.168.1.65])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1g35DA-00065z-I9; Thu, 20 Sep 2018 21:06:05 +0100
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <20180917163103.6113-1-cota@braap.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
	xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
	3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
	E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
	PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
	PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
	AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
	eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
	NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
	mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
	z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
	T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
	DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
	y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
	2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
	14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
	YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
	Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
	BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
	opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
	NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
	Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
	KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
	imgcU9TTGC5qd9g=
Message-ID: <0d919bf9-9379-e3e6-3f68-3c0010362d64@ilande.co.uk>
Date: Thu, 20 Sep 2018 21:05:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180917163103.6113-1-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.191.82.156
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Subject: Re: [Qemu-arm] [PATCH 00/35] exec: drop BQL from interrupt handling
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
	kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	James Hogan <jhogan@kernel.org>, Anthony Green <green@moxielogic.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Chris Wulff <crwulff@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RcmnDabD4qml

On 17/09/2018 17:30, Emilio G. Cota wrote:

> This series comes originally from a series of patches that Paolo
> sent to me a long time ago. I have kept most of his S-o-b tags,
> but I have done the forward port of the patches to the current
> QEMU code base, so please blame all possible bugs on me, not him.
> 
> The goal of this series is to push the BQL out of interrupt
> handling wherever possible. Many targets do not need the BQL
> to handle interrupts, so for those targets we get rid of the
> BQL in interrupt handling. In TCG mode, this by itself does
> not yield measurable performance gains. However, it is a
> necessary first step before tackling BQL contention when
> managing CPU states (i.e. exiting the exec loop always
> involves taking the BQL, which does not scale).
> 
> The patches:
> 
> - Patch 0 accesses icount_decr.u16 consistently with atomics.
>   This is important because we use it across threads to signal
>   that an interrupt is pending.
> 
> - 2-28: convert direct callers of cpu->interrupt_request
>   to use atomic accesses or CPU helper functions that use atomics.
>   I have broken these up into individual patches to ease review.
>   Note that in some cases I have added many atomic_reads, most
>   of which are probably unnecessary. However, I'd leave this up
>   to the maintainers, since I do not want to break things by
>   doing a single atomic_read(&cpu->interrupt_request) at the
>   beginning of a function and then miss subsequent updates to
>   cpu->interrupt_request.
> 
> - 29-31: drop the BQL requirement when handling cpu->interrupt_request
> 
> - 32-33: drop now unnecessary BQL acquisitions in i386 and ppc
> 
> - 34-35: push down the BQL acquisition to cpu->do_interrupt
>   and cpu->cpu_exec_interrupt. Here I am Cc'ing everyone so that
>   we can make sure I am not missing any target that requires
>   the BQL on either do_interrupt or cpu_exec_interrupt.
> 
> This series is checkpatch-clean, and can be fetched from:
>   https://github.com/cota/qemu/tree/cpu-lock
> 
> Note that the series applies on top of patches that are
> already on the qemu-devel list and will hopefully soon
> be upstream. This series begins after commit
> 4ece0cbd74 ("cpus: access .qemu_icount_bias with atomic64")
> in that tree.

I ran the above cpu-lock branch through my SPARC32 and SPARC64 test suite just to be
sure, and everything appeared to work fine. So for the SPARC32/64 patches:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.
