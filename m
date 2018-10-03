Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp38968wrt;
        Wed, 3 Oct 2018 13:17:04 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61iJ0q9H6/VkPac1L+rWm63AYqlXb1THf6DfkSmDoiKMDgn06s1i9F4NZ+UaCwMziZHVhuG
X-Received: by 2002:ac8:19ea:: with SMTP id s39-v6mr2700537qtk.215.1538597824536;
        Wed, 03 Oct 2018 13:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538597824; cv=none;
        d=google.com; s=arc-20160816;
        b=GU3q3Mtgyx+ZdqgAHCR+2YutJilHRoh2ZXU1LSfPb5a3MF0gFqpPNn/LJpmU40N5S8
         c39l2zD/S0tM15mpXMK5WAPsasN52VI/CmBg6bTjvirFkoUH71ZlR5yglhZ7mjdtb7FF
         1wMXd9JoWCejqbOslTyRdfNeBBoM1+tFMVVrGvA5uxP4yJkyH+VAoH/LZTuyN5umHLyi
         LaMWG7jK4/7eF97mzeURyiFvPIzTjVmye9UHmIaB5q5nR2AnjLyFxxN+qLTPbsAEqJmU
         b8Ol/WbzT1KZ/ibkcSo621wZDyzkDnejzZ5iuVgTmLDlgAH7kY2bH4InqaS6Oz9pOgwV
         9N7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=UFRz5cQP0ys3PSx1qKKi/nVa72tAVFv+4P/NIyw9n9c=;
        b=pRmTvK7ST4zwBosH14x6u+wJ3UHx7ZLdb0ewPPTO6bi3m0BcXq1yI4tEFV433z/gmk
         Ne7X52dY+ETm1gF3q+NKxJOTg19B4qkQIZ5rOlw0U3xnDFPvQ7g2dJFVtIn/akp8E7GO
         om+2gMUvQ95U4Tq+5YuzhYVvwtooQPbeN9NvvB+3jm7szM/GQMcDCn97QyCGXQ5bd5/B
         Q3CeDOuJ1r5cEgv4tpuKHxfsAjUuURgweazAEf0LLwg3ofrS9cFxIcTEDuZ8K7aUiqZa
         u+ZHINC5Diq5JI7YuzuqOefLCLilM49FvdLFNwJhN6xvB29A8Q09evLiWHzNu8dAjGVO
         ZvBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XY/S23Kv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k58-v6si1668034qtf.286.2018.10.03.13.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 13:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="XY/S23Kv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nZu-0003dC-FX
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 16:17:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nZl-0003cg-1o
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:16:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7nZh-0004kC-IS
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:16:52 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7nZg-0004fU-Lx
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 16:16:49 -0400
Received: by mail-ot1-x341.google.com with SMTP id e18-v6so6889922oti.8
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 13:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UFRz5cQP0ys3PSx1qKKi/nVa72tAVFv+4P/NIyw9n9c=;
	b=XY/S23Kv5Lbx/juItYfuCEwurFzDv+59tVyDLDBgiaNucEVtw6w1E7uosR6561rWky
	q1DfNwl6AzzdBxTVcc6KWeBQKl3233qwp9FHv1tR9WqLn93ZfV16kOY53s1pfqtY+pjo
	jyv5oWlZIY1BoYzW3IGVQlzmz9wLMIvw9I4pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UFRz5cQP0ys3PSx1qKKi/nVa72tAVFv+4P/NIyw9n9c=;
	b=lxO+L6B8S8yy84IGsmTnAifSDF8XMJQajUW39NDstYOUm1g9ulzumcjzTm277QOmVi
	wpIMPHAS0R+kvavM75ycnDjaivcg0ECsHq73ZXoeDjJKXbyHMXmALwC5kK0ncqrmkvMW
	QYmdF9A2GHri6eyWtk6s+LJbE8m4S7dCY+OniWIHp/vRH6b2TJx5/w1g+CwOqKF/zwqX
	k62kG8Cp/KnQaPYKSM3CTJuHnQclI4T1zPUez91z4T4BW1Otgzz/BXLZsxvHzSCYzo4R
	RVOGJJc3b3cbATD38XqPDIFaGdPzkkTm+nSQEywDmhf2ItcfgV5mrgPVjbEZabky16ph
	NCqw==
X-Gm-Message-State: ABuFfohPVj6B29xioWwDct43zLuryfuF8s67K3aTpSWgdtDcEM5MlBB5
	OMtKDisBDOdlyIeFyJnK9t9oQQ==
X-Received: by 2002:a9d:2af:: with SMTP id 44-v6mr1719945otl.244.1538597801785;
	Wed, 03 Oct 2018 13:16:41 -0700 (PDT)
Received: from cloudburst.twiddle.net ([187.217.227.243])
	by smtp.gmail.com with ESMTPSA id
	i9-v6sm739724ota.12.2018.10.03.13.16.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 13:16:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002163556.10279-1-peter.maydell@linaro.org>
	<20181002163556.10279-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <572e6756-7cad-7f0a-cb82-a214cfc35757@linaro.org>
Date: Wed, 3 Oct 2018 15:16:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002163556.10279-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 08/13] target/arm: Add v8M stack
 checks for LDRD/STRD (imm)
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
X-TUID: mZ5R38slgR0I

On 10/2/18 11:35 AM, Peter Maydell wrote:
> Add the v8M stack checks for:
>  * LDRD (immediate)
>  * STRD (immediate)
> 
> Loads and stores are more complicated than ADD/SUB/MOV, because we
> must ensure that memory accesses below the stack limit are not
> performed, so we can't simply do the check when we actually update
> SP.
> 
> For these instructions, if the stack limit check triggers
> we must not:
>  * perform any memory access below the SP limit
>  * update PC, SP or the load/store base register
> but it is IMPDEF whether we:
>  * perform any accesses above or equal to the SP limit
>  * update destination registers for loads
> 
> For QEMU we choose to always check the limit before doing any other
> part of the load or store, so we won't update any registers or
> perform any memory accesses.
> 
> It is UNKNOWN whether the limit check triggers for a load or store
> where the initial SP value is below the limit and one of the stores
> would be below the limit, but the writeback moves SP to above the
> limit.  For QEMU we choose to trigger the check in this situation.
> 
> Note that limit checks happen only for loads and stores which update
> SP via writeback; they do not happen for loads and stores which
> simply use SP as a base register.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


