Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2427636wrq;
        Mon, 9 Jul 2018 06:16:10 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfLGNoR6n65yJa5SqpqvlwapZODDvRtOfDc7/FrUZ+OmphyO1ITS2Jrk2VkFYEZn4bXMLO6
X-Received: by 2002:a37:a24f:: with SMTP id l76-v6mr16923352qke.406.1531142170826;
        Mon, 09 Jul 2018 06:16:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531142170; cv=none;
        d=google.com; s=arc-20160816;
        b=VRuKhquzVu4zMEdlsTeuuqmLwg7LRKNUlKNiBfq8TqviiVmET/Dpx3QxttgoqY03Yt
         HLl1AtAXknSiBQGO7prbI2cX0pVjOmuwfBr8yGuAhO5/YYn9flCnV9WbrDOXAryWahOT
         4dhlZ8jk/Z1Kff8qbPeWmywB0+ItEsp4gAaOXPXNrR22mVARTNjEupDtOHyyyGRokH1x
         D94qcRs57dx/TNX5YHpXfAy1HJmaAcyr9JaJ/gSSr3DsF6gZMX1Loq1rUue350ncc2je
         UQL6oBVCsrYpesK7pMEQ3OdJm0UkLAunNwehNFDIei0uq5SjFzLxsSHp7gBncd+U2pHc
         WDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d0fy+KGJQLE5M2T7ruU2Tc4U3xfnm+HYqgQvnewC88k=;
        b=qUg4C/LBcPUiJEnGxPcMis6DFNujqLV609WeFg85yK+RtCBQxg+FoxtFMjeAcSHvrU
         S9IxjXL8mU9rUpjIYNrNchMUiEVzsADGOtrIEn7eY/LHpLnHelyfWUidr9536Ua2SpA+
         wExCdYclwqLFwr3WBqm3Kziv6Qozik7//bdRi0JG1zoRay7O4n3sHYIyiNaLgneA/RRL
         TJTboJqs2490McvfBa1jCcAjGQHGCHxgyF435+i9yoRU/8XkswzYbsjo8g1X7TauB7V6
         k452XsdG6bBv7CBaPAVgHAwuPIsHOQ7xgXUT6gsvdB4rKRTgMwAoIqt+SHKKijkKP4SC
         c4rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWA70Y74;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b57-v6si4591298qte.346.2018.07.09.06.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 06:16:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NWA70Y74;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcW1S-0001Kc-8M
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 09:16:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcW19-0001J5-Bs
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 09:15:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcW18-0002Ds-8y
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 09:15:51 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:34963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fcW18-0002De-4m
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 09:15:50 -0400
Received: by mail-oi0-x244.google.com with SMTP id i12-v6so35780329oik.2
	for <qemu-arm@nongnu.org>; Mon, 09 Jul 2018 06:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d0fy+KGJQLE5M2T7ruU2Tc4U3xfnm+HYqgQvnewC88k=;
	b=NWA70Y74i/JXTahnUDcj+cKPOvzRzaE3WqwXZozWKuktGpOBcudlk9TQdKnAh5Sdid
	rL5UrgvedyDXUuKPxeJ3DvBXNG2RGa2XtYf6hY823ZKaq5E6nZgvqot99/AOINgiKmh1
	l1IzbiTgZjR3RAwG4rC1AW5AQ8sNKkXylVrGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d0fy+KGJQLE5M2T7ruU2Tc4U3xfnm+HYqgQvnewC88k=;
	b=Zx6kCjVynbRkdz9zo5iz9BmT+JglcOb7HvrXYXm3xOWBzqMPp7h6+oG8s1dRYI9kdh
	PTke2KEC9PPuiuPYtt8q398gGr/OS39LXtF+Vkj7JP+uUxtB/lp5MmJMs4Y9Hq5shk5I
	RdiaUCC6n50tkPykPkOACGpLsIgfM0XnqPSVRPKp3eYF1xCG5KaRe/o7nVU0FIB6mwmK
	qCiz0Fa/zi8jcVWpv6pKAumk3am5hHk5/LTCZs1CrvuDFlf52hBUBkZBGWTr0E/K3HBu
	+KSzEepo3J9v9hLOISGcIAFWaWXPOZVBAobrmzTc27eaE8ouO0YE34uVa3pAd8/bLtBS
	31CQ==
X-Gm-Message-State: APt69E26f3ddqwg+6IkKbxUJoRrlY5g8wmZkSF/+Krgox3uioMY+OolA
	WJPD12tjTzp/PmoihX4wuUYeKxBOz3PnijZwIr6UcSpD
X-Received: by 2002:aca:ce0f:: with SMTP id
	e15-v6mr24185984oig.13.1531142149409; 
	Mon, 09 Jul 2018 06:15:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 06:15:28 -0700 (PDT)
In-Reply-To: <20180702130605.13611-1-peter.maydell@linaro.org>
References: <20180702130605.13611-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jul 2018 14:15:28 +0100
Message-ID: <CAFEAcA8gpNbc=a1r_OBNV+KOu0CDbM1X7kH1__1G6rrADry8Mw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH for-3.0] boards.h: Remove doc comment
 reference to nonexistent function
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
Cc: Thomas Huth <huth@tuxfamily.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vOoMRRQdtkZ+

Ping for review? I can put this in via target-arm.next...

thanks
-- PMM

On 2 July 2018 at 14:06, Peter Maydell <peter.maydell@linaro.org> wrote:
> commit b08199c6fbea1 accidentally added a reference to a doc
> comment to a nonexistent memory_region_allocate_aux_memory().
> This was a leftover from a previous version of the patchset
> which defined memory_region_allocate_aux_memory() for
> "allocate RAM MemoryRegion and register it for migration"
> and left "memory_region_init_ram()" with its original semantics
> of "allocate RAM MR but do not register for migration". In
> the end we decided on the approach of "memory_region_init_ram()
> registers the MR for migration, and memory_region_init_ram_nomigrate()
> is a new function which does not", but this comment change
> got left in by mistake. Revert that part of the commit.
>
> Reported-by: Thomas Huth <huth@tuxfamily.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Doesn't strictly need to go into 3.0, but it's a trivial
> doc comment fix...
>
>  include/hw/boards.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 79069ddcbec..d139a431a67 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -35,8 +35,7 @@
>   *
>   * Smaller pieces of memory (display RAM, static RAMs, etc) don't need
>   * to be backed via the -mem-path memory backend and can simply
> - * be created via memory_region_allocate_aux_memory() or
> - * memory_region_init_ram().
> + * be created via memory_region_init_ram().
>   */
>  void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
>                                            const char *name,
> --
> 2.17.1
>
>
