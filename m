Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1918901wrd;
        Thu, 23 Aug 2018 21:54:06 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ+ZBUHp4bcVUPVf6MAgBCL9zo6HtIDK+j/eQ0RXcOifEJtd4+B1MB/8kcWOYeq7qbtqh6L
X-Received: by 2002:aed:2841:: with SMTP id r59-v6mr90194qtd.6.1535086446868;
        Thu, 23 Aug 2018 21:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535086446; cv=none;
        d=google.com; s=arc-20160816;
        b=VW/IZ3weyonSfcLiQ3n8Kd0N3apyUqHCyjUv+hOX0YQ6z5sAng56jRU4MBqHbXTJF2
         cAw87AxY6mDoQzL53yHtA0NedDJBLBxfO57E3P+tZFCG5lCb+lcUz0XV2E1QLWsCme2X
         CjNP8jySGCMKPtnO6CwHw7dMf1kICwqeNu2nTVyP/5yRbdX/Ldemjw16FpmCNNcHBXo0
         U3uj77xLHJkpyPnmQcZKKhlT+4D0xNR2TU5H+YPmFPYh1B4WfFAtey1TJ7+8djH1ITla
         qcix98hWgAxz4HGquYaaILxFJmwPCqQiiykbm4xQUMSN4NhnsI6nNumWoWx98GDqBChB
         G8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=mQCUx9Q//cJyczzqu7TA09Mo5gw41QR2VcZvulT8wQo=;
        b=EENBYmq4qF4PTIburl0nmYzi650YBPpPt7GBjzsJKioM76nZ3Kz5cvTG+swMqcC9Dr
         UaT6eZ8FDH7AJIdWAaxY0Dm9h2V6Ve9klA1TzBLP5z92yfhSPLRTdZqQ3/StBnCP7A0u
         2imuYa0ckqX3bdKbENOBamh0QxkW2gq2B0d7/Lj0I/bYYliEXY2SiZ43yGgKe4U0+iLI
         WqYd6XG2zzUwTibWq26nKM5KaYjoP62QhfGcfRBooPn57s91uuxqyo3ieKLX9JDTqo5H
         /kGepcJXpEk8X4+WOFybh4xiqrtDe7JIhtDVF/NFLfr1Po9OBFxQhagGcwvs/KQSlj0B
         nJJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SVifuh5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d11-v6si61465qka.155.2018.08.23.21.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 21:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SVifuh5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft46o-0001Xb-CB
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 00:54:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft46c-0001Ws-KN
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:53:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft46Y-0002vD-Ic
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:53:54 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:45075)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ft46Y-0002sQ-By
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:53:50 -0400
Received: by mail-pf1-x430.google.com with SMTP id i26-v6so3927641pfo.12
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 21:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mQCUx9Q//cJyczzqu7TA09Mo5gw41QR2VcZvulT8wQo=;
	b=SVifuh5I6H7kBuosZB2RjG0TnEvToUIItIAQSEPtHd8yLHnHJURiU4ndBcBXXGW8Xj
	V0GJMMMAXt7AWJcfXiy6/W01MX1Q6VgHp3vRHzYiiJGF6tu6o0uqRCAgZr0vYnZPPnQ1
	92bKbAbYd8y8tv8iH5lAo02567noL4Au2DS4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mQCUx9Q//cJyczzqu7TA09Mo5gw41QR2VcZvulT8wQo=;
	b=IWApRRTNb+bou923GH8gnAmPjG//xd3yRlPovrsDBvCkwLzkDPsIAozaR796n3RS6M
	fF4GPXfNHYDZkX4bTEWS7ZO+fDGpQ3t4vE+EVvkbblZOMkGE+3dAuKc8JCcnBR4hoLQ4
	6Qb+ZbpnremAmv63s0q5orSq+X8CFwlbR1kxE11d4nj8ETFT8e5JXnz4hjMHgLiKBpFz
	6G08H1ySqVhIelB95lAnv0d/Gyk8xRsmFRfvv6XmT8kUwqZTJxCmpRVlX+WH9DGqKPzj
	f0STkbn0MGsqcurUM0WnrMvzev84+pSG4m7mSV9ow6guT+LSoSC8nAEW+xZxlc2VkA8i
	w0cQ==
X-Gm-Message-State: APzg51C4bDMrL/2kn2a8gym1O1nQ4/pRhxloWDz7Hm4M1pXKYs8CpMOi
	txg257fMfLQaDW49FmF5ZSXQFA==
X-Received: by 2002:a65:65c6:: with SMTP id y6-v6mr67745pgv.436.1535086429330; 
	Thu, 23 Aug 2018 21:53:49 -0700 (PDT)
Received: from cloudburst.twiddle.net
	(50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
	by smtp.gmail.com with ESMTPSA id
	c1-v6sm10088045pfg.25.2018.08.23.21.53.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 21:53:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814144436.679-1-peter.maydell@linaro.org>
	<20180814144436.679-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b6bbd929-5008-f72b-1a6c-67d5ea16d982@linaro.org>
Date: Thu, 23 Aug 2018 21:53:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180814144436.679-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::430
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 7/8] hw/display/bcm2835_fb:
 Validate config settings
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TBUKztDLHovj

On 08/14/2018 07:44 AM, Peter Maydell wrote:
> Validate the config settings that the guest tries to set.
> 
> The wiki page documentation is not really accurate here:
> generally rather than failing requests to set bad parameters,
> the hardware will just clip them to something sensible.
> 
> Validate the most important parameters: sizes and
> the viewport offsets. This prevents the framebuffer
> code from trying to read out-of-range memory.
> 
> In the property handling code, we validate the new parameters every
> time we encounter a tag that sets them. This means we validate the
> config multiple times if the request includes multiple config-setting
> tags, but the code would require significant restructuring to do a
> validation only once but still return the clipped settings for
> get-parameter tags and the buffer allocation tag.
> 
> Validation of settings made via the older bcm2835_fb_mbox_push()
> function will be done in the next commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/display/bcm2835_fb.h |  8 +++++
>  hw/display/bcm2835_fb.c         | 48 +++++++++++++++++++++++++++--
>  hw/misc/bcm2835_property.c      | 54 ++++++++++++++++-----------------
>  3 files changed, 81 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

