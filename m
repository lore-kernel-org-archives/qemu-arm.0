Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4062067wrx;
        Tue, 23 Apr 2019 17:13:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvbrQ981B1IZ1h2Vg0BRICS938VXoHlCfLAH5JzQH2MRNhJbvXsiI1halPFbnkCkqg67Qs
X-Received: by 2002:a1c:be0e:: with SMTP id o14mr4333275wmf.118.1556064814221;
        Tue, 23 Apr 2019 17:13:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556064814; cv=none;
        d=google.com; s=arc-20160816;
        b=l7jkgWMnGIQRiNXY1HkSaW7LXPu7sqm3APGo1QhjgJP7+xQ5pMHGGpJEya6RPIMRQN
         ZwUQNE3RATj88ERk5VFSCPOIMJ6mKvfBQZ2PIhePZIP4koCLZS67DPvO5XVTdoTZk40z
         LLL4SWPh2HEfPyammlVaMykwZw/EWOG3+x+52AybRoJscaAo9PgpxB/673pQqiXxgX2u
         Mtr7DbrIgtqQdixc4rNjY8nZ3eJk8ZsyzKBoZs955rNlFrdKeJ1hRbgmBS45bq6xms2F
         rb2cchEKGeM8cn5mCsnCo9FtxsXJs9pKRfBlhlRwV4K7iZEuR7C8i8FEDsULat9kMaTq
         uoqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=/fydwa7araE5rDPRD4fbYYSPjYQ9EqylFEpViLH5T5Q=;
        b=PFfqGI+uVywbLlX8mIlJ7l9VEWB68ujSPWtn4Qg3yNvuFrNcBzteOKVY1kSCe733+p
         UzWAzWPcBRH+ZK6wRuRSjdr0OvSihDZsb+xdBKozGgZ3oIkwK4sB/8b+nKV8gY5Xhkww
         AwjUCFEJwi/kKdShbCQAmBgjmYqgpQHCVpcHtaoCppN8IS6Y92h9oKK+HMbkUfOdefxB
         nAK0poQJRicJYbPVS4SWFsHi/tArzXnggt/4N1HlpxJL37e9OdT5IGzDxGQsVzs5xqrJ
         TIDMy0fKyNV6KD4/gN1fNZx71/+WmvSLBwXqHOqlOGT153y/uUJuiRFda2I1DpSs65k0
         FeUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DrfVP8j4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c190si12435414wma.54.2019.04.23.17.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 17:13:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DrfVP8j4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ5XZ-0005oo-9h
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 20:13:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ5WR-0004Zt-0Q
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 20:12:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ5WQ-0004OE-1w
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 20:12:23 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:33809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ5WP-0004NB-Qq
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 20:12:21 -0400
Received: by mail-pg1-x544.google.com with SMTP id v12so8436721pgq.1
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 17:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/fydwa7araE5rDPRD4fbYYSPjYQ9EqylFEpViLH5T5Q=;
	b=DrfVP8j4Bm+OizsAC68THmVwEifpRtRd8OsviMS/rx+/oQacKmfDqJ3m9LQVyM/snm
	/dPt4qyB/xqCaAZcwBPUyLhS+QkZzqv6Vqa9lLLncTLhkuxlLGKGOgr10+IE8CC6JNvr
	dUpJPgSeNKt6EUUQRjlyP8lrme+6kCu/4PwZXaPcSEjmaQ7CUp1iROCZnraJkcZwFHgN
	mYN7MlQFbWgy0vLOLnfU5dHc5o6Q33qpXtrtztSZxOg9PoEAdA3B1m7czGukuMt8JMQf
	5dqWZy18HsFf7aGZDExz/FXsy6cGJmz6rtemUhoYpuxtDoYTlI99c1aqOJVg8iZKZebP
	YDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/fydwa7araE5rDPRD4fbYYSPjYQ9EqylFEpViLH5T5Q=;
	b=XcV0QCC6/zKgJAFAp+my7yUyjtTB4J/TygOEB9TnLHrFC/8dQwl0mzv2EzMDNhjBHv
	LkcIm+jNipJKioOxkAYBO8LoVbmt1z3NVJJ13sDvOdeS/ZjCLi40P4Jil3A+Htr0pwXs
	v8Utx1+29D1pl3Bex4VQ6jc0XABquvi0AD7hVH+mprpfd7y8aZmFgyPoD1uSwgsJyJ0F
	bylswNk0ACKlX1VuUXts+fmAnOP/p0p0kNbkrGjsVfMmedM5LOQ4Y/PUx7TB1ElETO7m
	YgJsXp+jqYoH8HWDgglzRccj3Yf65v1ulwI0qa0i59O7fmFu4Dy0WRv61VsE4c1LDZP+
	crOA==
X-Gm-Message-State: APjAAAUMP/dQbg2k/qNEFLXGzgAou9YzkXB+PnTDFyMvMp7I0E0V94fY
	zGYGL9pnG5vnz9oh4gBO+Sr06Q==
X-Received: by 2002:a62:5a42:: with SMTP id o63mr31187370pfb.170.1556064740338;
	Tue, 23 Apr 2019 17:12:20 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	x128sm33705371pfx.103.2019.04.23.17.12.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 17:12:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fa60ed75-12a1-7a82-ba34-32117f8d5a18@linaro.org>
Date: Tue, 23 Apr 2019 17:12:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 20/26] target/arm: New helper
 function arm_v7m_mmu_idx_all()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tudzBjpa/F98

On 4/16/19 5:57 AM, Peter Maydell wrote:
> Add a new helper function which returns the MMU index to use
> for v7M, where the caller specifies all of the security
> state, privilege level and whether the execution priority
> is negative, and reimplement the existing
> arm_v7m_mmu_idx_for_secstate_and_priv() in terms of it.
> 
> We are going to need this for the lazy-FP-stacking code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Suggestions for better function name welcome.
> arm_v7m_mmu_idx_for_secstate_and_priv_and_negpri()
> just seems way too long and unwieldy...

Seems fine.

> ---
>  target/arm/cpu.h    |  7 +++++++
>  target/arm/helper.c | 14 +++++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

