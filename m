Received: by 10.28.4.212 with SMTP id 203csp888244wme;
        Thu, 19 Apr 2018 10:06:50 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrTUQMcybA6w7KCq364jHYEYYUSTPrzms0ti/QdP0WEfkOwHaBhym+DbyC5Y+kOkCt0foEM
X-Received: by 10.55.133.1 with SMTP id h1mr6978707qkd.209.1524157610717;
        Thu, 19 Apr 2018 10:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524157610; cv=none;
        d=google.com; s=arc-20160816;
        b=EEfuebCLk6mrBm+ZhXwkzwJwCkkNehQLcJVlCAFfXjBRHU5kITgjTMe89d1xk0LWrn
         tD5V+eWLAdZg4F+dyjjEliAMLjZZv8YCcK2jAwQg8KN64MnnwjYJEUzzcfwbgyMOsGdE
         jBMKeFnLD5XPCAQbVRGD0Xsco8gS5XER7bF9aP6uZweJtoSkE01wt0v+bQwvqTVp8HOR
         syCubUJvfzOUaoRWJQtu+R3JHo05/C6KDPdF0sMJ6viM+8OjPR1QRig6jd8p8vv6jxnW
         /Je+Ewua9X9+GGVxGmqktLMDWiLfXDN87ShcDtR51XVH1eGWcy6pSoYvht6fp38RHQmQ
         bl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Ahzh9n+mIydCbNlO+TyelZe9oWE8ILgZHktopT2jF+g=;
        b=AAX4s/1l1E+xzw0N3vYZ4hKnghGvvajq94YROQ6skGvrNQJ9Q6thV8vKTef8sRYRgA
         Q6y2BytZkjvuxchyRDR/yYK5ZHYaVIowy+KePcHF10chY+Tbf4fB14tKEpnpB8ohvEl1
         LjTw3brS8P3QKrhGFwMGBcMHRR3dEycL0Srdh/X/50D7hYoFxWUYtiI1SKqv1W8Gawdt
         xeC1yRwlRJhp9u5PINCG/O/E87bgYzza4LqK2K0jgATtejY0l8/SrRd/VSgTBhL3DH+0
         302+OWKYC/+INZbKODyCe5tA/XA24doaqLuhyNEvNRQ0ISKd25n/+JyFs58E3VEQM6ru
         Cuhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W/YaDvtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n8-v6si5304305qtc.341.2018.04.19.10.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 10:06:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W/YaDvtW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9D1F-0002tf-SN
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 13:06:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f9Coa-0000UQ-19
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 12:53:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f9CoZ-0004Gz-AN
	for qemu-arm@nongnu.org; Thu, 19 Apr 2018 12:53:44 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:42447)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f9CoU-0004EN-Pv; Thu, 19 Apr 2018 12:53:38 -0400
Received: by mail-qt0-x244.google.com with SMTP id j3-v6so6522696qtn.9;
	Thu, 19 Apr 2018 09:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ahzh9n+mIydCbNlO+TyelZe9oWE8ILgZHktopT2jF+g=;
	b=W/YaDvtWChG+CIcIpmSXHqvSmsdTWTkeIGH3Uehv7MFJL4b1UijTWbM1jt3gL5OmeY
	I9Kz6vrK8E5DtLLwe3S75WWWI/6YDHQ2ufBfJFc3uxRh4d3QL9kU+peLzPOg/g+1ZHbG
	SmEiosO7CgS38pMVFntRx4rXcqaHr5m0ss3k1kqYKrFu4+QzLiSS5ZAMhinXnhTGuKyl
	1mB9Y9wHrXIGsG5C7N08OJISnZTcVx0zEQqdllVKzhaaGuDWPJxwt9dcXYvNyyP0NDR2
	8f+EOb4PQgWNPHSeySsg7Fp77U2tki0E9kqlREIDzytrcxJ96KG0RPpqNvmKJK4G5GQo
	hNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Ahzh9n+mIydCbNlO+TyelZe9oWE8ILgZHktopT2jF+g=;
	b=HFuiiYY5SVz9Nz9Ig4GCyxMMqXLjoiukgZG9PWbQIPBsW1WHQ4nFvicETmJTrjqZF9
	iOtllTebsBhvxHFkDQXd+wrTLbGLB10SJw/af1Kzt3p2+UA9MCmwJyT2xoo4R75797+U
	QHmsTGpN/vL7v4t2K6WicqkJUb9ZkdKTzynEeoIc2hBoM+K6IwIQUR0ocjCgCuT8jnzG
	Pp7vh/2EC7hVzGD5kQqX0LFfO5v679BpsI1XS/NjK76ekEcnM9+CFU0dduPG2fFlMh2j
	KDUwFgxX8w6PDroTFMD2fbc6IWjsDc713lim49JFlKeRO6Mi/ppBEvE0TRamD1CsewPF
	a8Mw==
X-Gm-Message-State: ALQs6tD/JBwiUjiZ42oHX+RklTSmmXv9gvJrmq6y4D49nfKafWNeGp5T
	MdgeXg3qrBVQFc4lzAmqNOA=
X-Received: by 2002:aed:35e5:: with SMTP id
	d34-v6mr6947402qte.246.1524156818179; 
	Thu, 19 Apr 2018 09:53:38 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	42-v6sm3260058qty.51.2018.04.19.09.53.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Apr 2018 09:53:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180419142151.9862-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1f466289-1d74-713f-4644-751e52a54000@amsat.org>
Date: Thu, 19 Apr 2018 13:53:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180419142151.9862-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH] target/arm: Remove stale TODO comment
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
X-TUID: om+dEKkv2eBX

On 04/19/2018 11:21 AM, Peter Maydell wrote:
> Remove a stale TODO comment -- we have now made the arm_ldl_ptw()
> and arm_ldq_ptw() functions propagate physical memory read errors
> out to their callers.

... in 3b39d734141.

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 2ebd086ef2..0fa02c31e1 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8681,13 +8681,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>      return addr;
>  }
>  
> -/* All loads done in the course of a page table walk go through here.
> - * TODO: rather than ignoring errors from physical memory reads (which
> - * are external aborts in ARM terminology) we should propagate this
> - * error out so that we can turn it into a Data Abort if this walk
> - * was being done for a CPU load/store or an address translation instruction
> - * (but not if it was for a debug access).
> - */
> +/* All loads done in the course of a page table walk go through here. */
>  static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
>                              ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
>  {
> 
