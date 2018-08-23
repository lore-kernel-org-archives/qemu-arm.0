Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1428672wrd;
        Thu, 23 Aug 2018 10:38:00 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzyEzyxjePMMBO4tkdBT9XNbRqQ5AqvLO4EjSAb0Nj3kbIRe4aHafkrlfgD7gG+YjtHzydq
X-Received: by 2002:ac8:1699:: with SMTP id r25-v6mr18452952qtj.23.1535045880632;
        Thu, 23 Aug 2018 10:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535045880; cv=none;
        d=google.com; s=arc-20160816;
        b=nUo9aZ0FH+dXJJUgSCCX6wcQk/V3M52jQPlg69cr9mbTXhpU2IkNaULPvtDhxrUDAn
         Nc2ICoPM9/xD3gND8pTsrOHtqPNDzU5bL1j6fm0HaNTaU9IcGRC5js9ZUpajSqD5yWr+
         YdbPOoMVQAgI/AP7Wi5ouLvkT0YBUMd88/WuW/El8PABAuGJO1Jypm1JtUTUqchiEfF0
         qXovK3FV+okVukOQI0p6vPIITu2HZjRsvJCisDsf9czUmO3kJzDTklVhNETiyj+7DDu2
         s08xaFp2Na9hC8phKBrZwjl8BxcMabm2v3YC6te9SnghtDzfgWuc2JBeKmu3GxHPBhqt
         q5pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=eu9rLuGluh4oqS/+vih9itWcG6VE0qx1bp77Sy3IKgU=;
        b=TajPkOZshalF4o+o9iI07d+vrcuAy9OAnU1U4rimeutnZGdsww6v+t5UrolPqSoYc3
         mCX29v/WMgdglqXQqqaDssfWDlWyDvSdtd3/Jr23RSAgnlNyW1OnS7LhAYJrfE/y3NCe
         xlHa1OxrwIkCQUA/XFL6jYylISeicLRAwBljNLBvpP4+ZQnjHwTfGvGnsVwVt/QUc/3F
         5e2/jdFwtoYPcJzEao8Si8HHgnDUieRKIB5dM4HoGsKkyKxFqKXjMxcYWqUy3ql8H9oF
         b2kQ5t2GTkQ0N5ja/xxRAy+Y6hlBtla2KZwgfkDagoNv5iR19XCvHLThobP/oUuowkNn
         pttA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GM8L3K47;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m189-v6si3477760qkd.19.2018.08.23.10.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:38:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GM8L3K47;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstYW-0005oL-3Q
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:38:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstSb-0005Xe-Qw
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:31:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstSW-0004EO-QN
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:31:53 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43779)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstSW-0004Dn-I0
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:31:48 -0400
Received: by mail-pf1-x444.google.com with SMTP id j26-v6so3127726pfi.10
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=eu9rLuGluh4oqS/+vih9itWcG6VE0qx1bp77Sy3IKgU=;
	b=GM8L3K47/20NPy1n+MDQ+i+Jo/Sii1GItHOz9CM018YdQuO/vDjA8FtQdnaf+ngN45
	3UhKLgeaRLGz0wkGxdmgUSioQj8DEFpUexWl41Ho+hUJJEZyL06eLbjwmpgRU6xWyU+A
	C80J08uAPWJSLSxqo+2V/UUJoLxdgF6gCj/xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=eu9rLuGluh4oqS/+vih9itWcG6VE0qx1bp77Sy3IKgU=;
	b=shG8bNL06BMSI14IksnXGCs11Snb08CShoOcpn734MLK7JA+2synRsfDC53CAB1RmD
	Xu/qdElh2KVVD36aNWTcrFNxwPjjEcGbKJA0g7DUTlOJK2xesoCyLMMKkzznpLz6PFsY
	qNIx0EAEUpyamSE9P7338xemVTW/tj0RDjk/mVd1jV+7JoOzLbzO5xQcfu0DazHj1Wuw
	HAyc9SJTWqUwiD++LdGbn1t9Zoa8llZiUXmTtmDIMx9lElRlTmQaL/SUXqeaiAZR7G+L
	8M60zak3mPIyjpP76iQ+asTLNmcT8874CvHwg67J/Nx5nGQEbkt3yUpPWBYdXj8qXDeX
	umlQ==
X-Gm-Message-State: AOUpUlGA9FvDMitJjISB7fBpKS0+mU8xgWZ4O3sqKRg1qexCMK38JjoP
	QiY9bSlCMRQhbzOyXkBhRdHcEw==
X-Received: by 2002:a17:902:b90a:: with SMTP id
	bf10-v6mr20783669plb.160.1535045507649; 
	Thu, 23 Aug 2018 10:31:47 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	d9-v6sm13126573pfb.86.2018.08.23.10.31.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:31:46 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b13986d6-576a-a8f6-a555-a23ec95bd25a@linaro.org>
Date: Thu, 23 Aug 2018 10:31:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 18/22] hw/ssi/pl022: Use
 DeviceState::realize rather than SysBusDevice::init
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: coiKYkX7rCJl

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> Move from the legacy SysBusDevice::init method to using
> DeviceState::realize.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ssi/pl022.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

