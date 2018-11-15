Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7212738wrw;
        Thu, 15 Nov 2018 08:27:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5cqzJhwd9KPdiVnqfvUUNo7T2NtX/4l4+MPzgSqh5stq4mZdAslhXnI2JBI9pisvv571oss
X-Received: by 2002:a0c:d4f9:: with SMTP id y54mr6767321qvh.98.1542299259199;
        Thu, 15 Nov 2018 08:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542299259; cv=none;
        d=google.com; s=arc-20160816;
        b=VqHnUsVB+BjV265sx9deuwCnhJkDyD5URHOEMk+otPbVGFEjy2ff48BCT1MFL/bqvI
         J2JIG7GRZZV+QAFl7KskbgUEmy5dj+0l5jBCNHTFBPoGfwGhLRPqfsjcgK0MEyIMA1jg
         9ubSHDIIA7luZHGQCSYryOu6UejqhEbGIXJaJp30c+O+QpOkgHr2LAhTEwLgBFxY9lbv
         RfE4mLO8hpmhC6qcmxd6J/LQ/4UhovAZOTXAMO6bIVEjHFA7ZO2Nw+4C7fyD4FR6sYvZ
         VoskGaZv/eMycEpsSpn8ddO2oLwzfJknlrTpD8IlYa/WvtViCFzlyoTLcazqW5i29n0i
         RKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=d0q2tuRcMWtSu14/ctPZ9iPLPOyUhkAS4rEvWbRvC8M=;
        b=fJtjrYMNSwsc3CoYo28gnMMqggivLPJACj7uG+hWu3jj3OltsKlJnb9sgI2Lgd4H/5
         hb2cNEw4K5mnesmURVvEvF+KjUSN2XaUuMWdZSbX9KB1W6p6Gz0zEPFDhnGV7qlCiDCh
         4Ydss/J96sUZpQaBbcW03ciV2E4pRzuKou5ztD2cbA8TExPSTQk+88fNXWE1O5XwyQWF
         DlnrR4ohNLypXtrQReXxdD/ThM8KaaSOevl/I+nQoov2B0846KCHFW5cUyJZMbUbTeoP
         +UL1JVXMuHcQ7OHMSmOxA8PoZZL3JamN3zfGuPJW/d9GScOz3kSGB20FM79PScORoatt
         lvug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iD4kxQm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si2680625qtd.95.2018.11.15.08.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 08:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iD4kxQm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39704 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNKUU-0006KQ-Lj
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 11:27:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNKUL-0006KD-1y
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 11:27:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gNKUH-0005QW-0p
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 11:27:29 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gNKUD-0005Or-DE
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 11:27:23 -0500
Received: by mail-wr1-x442.google.com with SMTP id p4so12702094wrt.7
	for <qemu-arm@nongnu.org>; Thu, 15 Nov 2018 08:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=d0q2tuRcMWtSu14/ctPZ9iPLPOyUhkAS4rEvWbRvC8M=;
	b=iD4kxQm7QpY9VQYsEbBvFoCk6z6bE4DIJMXyQWzOm5rLnEJUSN6HgqEjLR62pQVRi3
	cD9hlw0pTf709Hx0iQUN4k0Obqk8JVoP33TDCUEzS94w7VwVkjdMsh6/uXxqiXUPPFW2
	zF8sOpjCZwBjlZjGW/HM7lxzcsGrlSkKquspo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=d0q2tuRcMWtSu14/ctPZ9iPLPOyUhkAS4rEvWbRvC8M=;
	b=ToeravwErrU7ERqVK5xZZNd4JWDrWV5nwAAAD8TZNjJkBBt/uWKP6vh+KFCUEwGxT4
	zeWNdJma5KBFOc3QFCd6G5UH9Jam0NPNMRbKNkBTjPymG+tntP3nZFAJiOeokOgPAKdv
	jodX/IMLn5hdaEMrVqYEb8q+neyBPLjrYkBOIG59sRgwqIt44kjjBUj45Tv6XDadr+s8
	kJ0/pHP7zayjz7IJ8IF9rl4uXpgYYVYn3u5sFpKfBVCX468/v65WD/e0WKLcoHMbWE5B
	X1Nl7/QKpGKacEbNImhkjAmOFabRW2CbugkyhtaYa28XenDq1xTvvgpYeCX9YLbTiEUO
	vcpA==
X-Gm-Message-State: AGRZ1gIh+PhsSBRHOIXScsMszmk8rhOtay2Lzi9h/l9Ze2RfOaMjPiV+
	BXAhUGz6sF1zF4yj8EB4o/49aQ==
X-Received: by 2002:adf:e08c:: with SMTP id c12mr6233641wri.199.1542299238841; 
	Thu, 15 Nov 2018 08:27:18 -0800 (PST)
Received: from cloudburst.twiddle.net
	(57.red-213-99-142.dynamicip.rima-tde.net. [213.99.142.57])
	by smtp.gmail.com with ESMTPSA id
	4-v6sm12681748wmd.18.2018.11.15.08.27.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 08:27:18 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181115143535.5885-1-peter.maydell@linaro.org>
	<20181115143535.5885-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ee5b3393-fc6f-5ed3-194a-4b3ad91623ea@linaro.org>
Date: Thu, 15 Nov 2018 17:27:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115143535.5885-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-arm] [PATCH for-3.1 1/2] hw/block/onenand: Fix off-by-one
 error allowing out-of-bounds read
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
Cc: Thomas Huth <thuth@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hs/JmFkFyCCi

On 11/15/18 3:35 PM, Peter Maydell wrote:
> An off-by-one error in a switch case in onenand_read() allowed
> a misbehaving guest to read off the end of a block of memory.
> 
> NB: the onenand device is used only by the "n800" and "n810"
> machines, which are usable only with TCG, not KVM, so this is
> not a security issue.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I tweaked RTH's suggested fix to use an 0xbffe offset so
> we don't overrun on an access to 0xbfff either.
> 
>  hw/block/onenand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
