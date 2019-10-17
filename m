Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1054631wrm;
        Thu, 17 Oct 2019 07:50:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSEm5wnivjA8/QjhTqN6U8gTSIxvvb6bOGJT2aVX3184UXxc4AsdUGlypG8MizWKUvQBar
X-Received: by 2002:ac8:704c:: with SMTP id y12mr4265550qtm.363.1571323814594;
        Thu, 17 Oct 2019 07:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571323814; cv=none;
        d=google.com; s=arc-20160816;
        b=OLy40aG6Mb6ZBkSrS7acG5Sam6vG2zCxkkvGWck23ui6oll0T7REnaZPoPCXK+SA2x
         wQMTMEsCLyArIWe/5wf7ZCj+JvMl9bBJymWvpf6hWMDXmfp84W33tM0zRyAup18jEZr7
         Osz9giikOaBdmTO2UEEAa0VHVuPg7a5JTwQM/AI1x59vo79+WgSvEqcVGmX/Z6B6iJVg
         8nDkVMXAds7FQphuSuK64FHfTxu6aBT0nlk5rV2Gfz+dy78Xfiu08WtSeDRy60Ws1tQb
         wElBGQHCmaV9IpIbMgbgyuu0FQjLJti9yshicdAvjnD7YurVW8FZUFRwP0/WoWQlC/zG
         CJfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=ncZZKTj+JLdpJh3OEt20ZcEqe7Mn2RwqY7iUd1RZ5mc=;
        b=fAiFvLQSXB+lmD6dPuhKxqQC1IbDC3oJbr30ePcid2VsXcmLDTS9zPy8eehm7xZfDk
         pi4D7iDerLrRmOiKcEDIBtwfM0ddGcbpRR2Q2JirRdmhiNytB42j3BbHqVoU+IvVcc/V
         su1CoW92bhr+WwWdDo+8TmnANLDTcqEPrZo7rM9SNoPLy1UFE/sJ4VHI9eol0hWdfE5Z
         NhrH053a+G+CO3jF39owAHhcFWSDszGYHPnc5OE2K6DaauwCz8YXkVLQztX4T4BXItEm
         lzwPvutBlDHOIGkLfRkZnaHN2bxRRMgbfeeo5BADawXGeSES66AGdRHYb6+pEJN17s1C
         97og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MhPtaBhM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1si2489242qvj.198.2019.10.17.07.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 07:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MhPtaBhM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL76T-0003BR-60
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 10:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6We-0000g1-Lv
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:13:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6Wd-0000ip-Hz
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:13:12 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37792)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iL6Wd-0000fg-74
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:13:11 -0400
Received: by mail-pl1-x641.google.com with SMTP id u20so1205260plq.4
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ncZZKTj+JLdpJh3OEt20ZcEqe7Mn2RwqY7iUd1RZ5mc=;
 b=MhPtaBhMBo7Cmz1HYA1hmgGUaUkcf7a38chZBqGGQwZTtF1ZE6p9Y7PelsiU3sdnlQ
 XYeHe31eH3e5uOA/aNoDsEr+kRZzl4aQiPTAvxnrGLBVuJgsPskFWrWDBiMAXZvlr6jo
 2usC3k6mpblRWreL0QeEs0oGIUXFxPERypXCB4BmJYZ0GrYFf/26QOpyeMJVlCJ4xA3S
 84bUpTYeW0ELh5nm2EobVjnaevH9vBYgEmYQszpKmOQvRPcJVa+iNl/LLhPUr/E1iuAp
 UGRXaZ19iXKMqpjyDUgNeQNh2zR3ISLlsZsb/T17wR1UOWkBM1BUeB8acbo+wX//zcvq
 7alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ncZZKTj+JLdpJh3OEt20ZcEqe7Mn2RwqY7iUd1RZ5mc=;
 b=nQKmvYj2CaymClMqJTDZXbT44xgaZZwn88gWwlkrCzhOwzEBMtAojsfw/dTslR4pFO
 NBHv2lmll/ZSZxOqUkFaFHdlnl/dLNRfFjzRaq6o9ZWEjBtRBvulJOeJHCrgFLKmOuoe
 v19Z+NsS8oSlD/lykwUxaeYyWxt5znLE/8KE7KvAiuulqmDtdz9oYbNMVaSMyTzfOCEy
 lxMzrZGcccrBOo1RjBziWGHzVLfI7EKO9ZQ5U/WDo6zIspxZCC8vcZ3EsArBavkR0BKn
 rBVmmw+K+kCkvm1Bz42Yp5DbQDW/BdkH2+r8ARHt6Qi/TUAtQWlocVIterI8cxILbmG0
 gZ5w==
X-Gm-Message-State: APjAAAXEZ7SVjRgEZ8wWsKuWOOmnUX0X5YDBAfFPsceaONLOwva7FN/D
 3YQVrmz6jzMy5472vIU/jAvNYA==
X-Received: by 2002:a17:902:aa02:: with SMTP id
 be2mr4284215plb.326.1571321585175; 
 Thu, 17 Oct 2019 07:13:05 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id q26sm1399746pgk.60.2019.10.17.07.13.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 07:13:04 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/net/fsl_etsec/etsec.c: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <45d7e704-c22c-dfec-9f54-c73568f31ccc@linaro.org>
Date: Thu, 17 Oct 2019 07:13:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017132122.4402-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P6Xgs53NTnFw

On 10/17/19 6:21 AM, Peter Maydell wrote:
> Switch the fsl_etsec code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/net/fsl_etsec/etsec.h | 1 -
>  hw/net/fsl_etsec/etsec.c | 9 +++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
