Received: by 10.25.221.202 with SMTP id w71csp1217762lfi;
        Thu, 3 Aug 2017 15:04:54 -0700 (PDT)
X-Received: by 10.55.16.6 with SMTP id a6mr337873qkh.205.1501797894695;
        Thu, 03 Aug 2017 15:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501797894; cv=none;
        d=google.com; s=arc-20160816;
        b=RUY7J+t+mRQ992iATdyJ+Z/NgdAtFeSAPORtehqw5iT5zfHUUaDLhJ+ayet3++zKA+
         ADeadabGT9LMg9opEnDwL2aG5Op0Fiik1lu0lNh7SfaZobyMERtYqFAogVrqZioyoZtO
         2MXhkSgx6AsbQlFAy43zQT3+gEUol2+xjPn+jEfUtLkkG9lzhGWas89ueajuhht+UWTv
         cVLtmQILRPfNrx8+YiB8Bob1jb0/PPblkEE+kDnWgfjAz8czyBbZ/XsaIZfQccQFGHHT
         5a2aC+/2b6vCjrAWo3n3ocjEG9ps9fYoi5OGEHnZmeN1s5cIAmvur0SFH22UkMdmnnvx
         97jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ArZx5vsxiNY/zTM4RTLQBMbE7iETsTsPnsGuWQ/XuCs=;
        b=nRGj1hVuCt36GtpLCKYiENdS+RyTc0EAEc4awIsHB/v0GmatlgfBBm9GFQJbfzJuB7
         onC5JTXoVA/KSQPw/rC7o+x+0PbPAPBHHCCB0j2vo1MNCqkaFsSUfS9yhihm6XaFpbOC
         cgEm/qjTFF/k+bDe6Wa1xGivr3mJv8egiu8WmbDJa93mThGGvZY1ZSz5EmwCnrQAr+5J
         D4WItZNxxkU5zkyGGOB3ML3ndH9bLFfKdcVyh6PFuwZtv11WKxTS02nzVCxjcDrrsiTg
         On6qOdYqzgvfBadKBqwe8W7WsWSIxrN1tu7KblOK+EpuXq94+aRoseK50IcashjKBQj3
         zbuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=LppGENHt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7si27044qkd.12.2017.08.03.15.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 15:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=LppGENHt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddOEe-0000kA-5H
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 18:04:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddODF-00083Y-Uw
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:03:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddODB-0007pg-RT
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:03:25 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:35818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddODB-0007my-IL; Thu, 03 Aug 2017 18:03:21 -0400
Received: by mail-pf0-x241.google.com with SMTP id j68so6334pfc.2;
	Thu, 03 Aug 2017 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ArZx5vsxiNY/zTM4RTLQBMbE7iETsTsPnsGuWQ/XuCs=;
	b=LppGENHtg1PDZ4vVi6e5rMrJrqrF4blCn/f8X1L+aCsU6EfbC2nZ20wBJEty1S8B33
	W6zxK5g8UJEp9a5ZzMSpS6Nh5iyofWtRjuBrRvHXlAQPbu+4N72kuaMBcs7sSWLbwm1B
	UQRdGbkYlD7fMbmzzy3skTQC1V5dNREuQ9H7w6uzB5Ls21HTK83A6IS054ylXkAsS/a7
	3hB6H6bUzSLsx2HplkpNXL/dPv3YHuYahBSX9xHF86akiC5F8ukqcJcrC6h89lUp+Cts
	INBjnph2wZvJnIH0Zs2pjtPi9dZYRtguljLilftEV47JM6sGlnyU6HxnS+82AjbBjTV6
	ASbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ArZx5vsxiNY/zTM4RTLQBMbE7iETsTsPnsGuWQ/XuCs=;
	b=B+n3uYNMLG7uNELUWqPYwjjOys97qQt/L4EmfXXMfvfkKa2s30o3+c1nDzq1yMr10/
	y9X0CtCt3JlvfIMZ42B5dskDyooY6bigw4u+NMtJz96YVP9GfFMhcSn9Er8NABwgrjVh
	lV7otF43wTSXvx/1UPVLUiB9GLXDiPZ2eAGyXPvyglqcVAO+DjgNiOdbC/h1I4VpyAIE
	0IB25b4LylvU9eZZpB1T8VjjtqReSEoBlyBREvtQHi3rGcuDjG+TWwiLpwzT/tUiiMhM
	My24pCUNa8gsU7z5wl9d1kzlNvW5g3WIZzEfw1b/bcySxe+THd1Pm89zQp+OL9rk+jAc
	ZP9Q==
X-Gm-Message-State: AIVw111WacQTuvd3bdOwz7DtScMLELwPk4+g9Ahf+clMWAAHL8FNJ/Jz
	oFTudxb2KfT7IQ==
X-Received: by 10.84.164.193 with SMTP id l1mr283660plg.279.1501797800515;
	Thu, 03 Aug 2017 15:03:20 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	z66sm29671728pfi.137.2017.08.03.15.03.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 15:03:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-10-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <20ef352d-38d3-90bb-27ef-a6a644240b9b@twiddle.net>
Date: Thu, 3 Aug 2017 15:03:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-devel] [PATCH 09/15] target/arm: Don't store M profile
 PRIMASK and FAULTMASK in daif
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XprkSUG3fdiC

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> We currently store the M profile CPU register state PRIMASK and
> FAULTMASK in the daif field of the CPU state in its I and F
> bits. This is a legacy from the original implementation, which
> tried to share the cpu_exec_interrupt code between A profile
> and M profile. We've since separated out the two cases because
> they are significantly different, so now there is no common
> code between M and A profile which looks at env->daif: all the
> uses are either in A-only or M-only code paths. Sharing the state
> fields now is just confusing, and will make things awkward
> when we implement v8M, where the PRIMASK and FAULTMASK
> registers are banked between security states.
> 
> Switch M profile over to using v7m.faultmask and v7m.primask
> fields for these registers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c |  4 ++--
>  target/arm/cpu.c      |  5 -----
>  target/arm/cpu.h      |  4 +++-
>  target/arm/helper.c   | 18 +++++-------------
>  target/arm/machine.c  | 33 +++++++++++++++++++++++++++++++++
>  5 files changed, 43 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

