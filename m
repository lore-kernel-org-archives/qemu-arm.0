Received: by 10.223.197.9 with SMTP id q9csp839534wrf;
        Thu, 5 Oct 2017 11:33:36 -0700 (PDT)
X-Received: by 10.55.130.197 with SMTP id e188mr29723250qkd.203.1507228416343;
        Thu, 05 Oct 2017 11:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507228416; cv=none;
        d=google.com; s=arc-20160816;
        b=IQYu7e0DbCxqdGRqrrvVtKrP+zaIYb0es+3nkNWgf2yqf4oxJDXW3NRKrYXLwUN0eL
         OiBm9JxAFuI01RUBDzF6dbwiDQY6YnbhvczZVJrzoH2bpL0142Vm50E/6Q56Ibodom5n
         zdD/Rh7PGLJJshVnDSsq+oEmlHjo1Qfzn15/bob//zHEEtHBfft7+S0AaTxu2IsdrBkH
         JICQMo2BDY4TC6uiw63+7o60yVqm7FTBgVpzJqIjkhKWqpqqcf0EjdlZJiQe2BLjZsky
         gUj13iOrqMEOxfjCK2jOtSF/zHvn6iTde4PsDBSmDaXIq40L7uYVolsthZ6AnpR34fli
         UQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=/EurHjaNTg8Vlsp45K/Pn3l3mE6RVw544ONZLeOsiVg=;
        b=Fw4f/vJVgP9HAhYVPliR+RZS7RafgfDbGLc1PKrbKxUtggqLgRwT11F3pWBavU6/YL
         gMvj+wGaK9dHwpFWp6C9WNUN5B6adWgu/sEY99gqpVjlMMENCGNSHYnYhWGC8jmvJ3mn
         RD11c7gOg1pzEJ1uqnJxgMXl11hAuULCJvjZjPuPbJp/GiAJCJNkoMyr6LtFBWQ3Vmnq
         emRhiG9yFayeSZR/v8x3du9EojE07nJF4ZUXx131Rnka16Fi946A1FPQ2OCxXFdloaDb
         D+2eWgL0YOSMTLS7me0t2i+XYCKG9kPFMv86RW+il8RBc+HxkR4YeaTWDRWT/QrDcics
         CTgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cn2hhzpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w30si2036691qtj.11.2017.10.05.11.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 11:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cn2hhzpJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Axj-0002MG-Pq
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 14:33:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0Axb-0002Lr-RA
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:33:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0Axb-00011o-1x
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:33:27 -0400
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:45060)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0Axa-00011T-U2
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:33:26 -0400
Received: by mail-qt0-x22c.google.com with SMTP id k1so16162892qti.2
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/EurHjaNTg8Vlsp45K/Pn3l3mE6RVw544ONZLeOsiVg=;
	b=cn2hhzpJK063Lbh6yYrY0Jx4rz7gZuusRfasvMQBdQNt3cJuKQ/XxdKThpPgnIG4Bh
	/5USUpdjlzwhkK7OJNdQVMZcmHK7zOzsh3HjtR+QNduAD3hrD9CNUuw4zGQIEckCqZ89
	jp7fG7/X78+McIf4vD3Wjy4F6P1AG6pmsmdxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/EurHjaNTg8Vlsp45K/Pn3l3mE6RVw544ONZLeOsiVg=;
	b=PAYypXQ9e28M6S/RjiNsQMqDwKfdzHajwoRNdGQvGVulETa8+ruuTOnGvt5P4mga03
	F6ddRYdx3EmCUtevPQezAMfvs8mfqQ1POkmS/ceYOpJYHYHXwwJbTfJG9d5HqwAbDfgY
	hdcLLKFrMWPANFGUGlpdLkKt1bSUMykHH2sQGiFeD4v+pdhxDx1nKq0MZObXwW8etEJz
	QzlGbpF4U1nB2XcjFkqgJxZv4t5txbidxUOiOqQQaaxYdlaSDogjo0S73G+FuIpx8wxC
	hUEg5XttyklCvnRPQhDEiX+tsa8BWaihtmfBhPlgTabzfS/wB0tguOODpxER31mYcPTy
	xs9Q==
X-Gm-Message-State: AMCzsaX1le++NoAFdtqAyVe1l/eBDgBjiJ3gSbzHD4tc3uKzz0eUCE29
	OyrCNKeBa4S4BoDbIbDCAtY3TcakVb4=
X-Google-Smtp-Source: AOwi7QAWLJJyhIJkmuxGdrunNGu2xXBpswN43EKuilaeF3priylyyBYaECd9DQwdtFYw0stHX8tc2Q==
X-Received: by 10.37.35.137 with SMTP id j131mr353177ybj.287.1507228406356;
	Thu, 05 Oct 2017 11:33:26 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	x185sm7201480ywa.73.2017.10.05.11.33.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 11:33:25 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-14-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c54401b-10b5-9d2b-4a7e-51e9a40f2408@linaro.org>
Date: Thu, 5 Oct 2017 14:33:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-14-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 13/20] nvic: Implement Security
 Attribution Unit registers
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
X-TUID: VI65NRZKs+KJ

On 09/22/2017 11:00 AM, Peter Maydell wrote:
> Implement the register interface for the SAU: SAU_CTRL,
> SAU_TYPE, SAU_RNR, SAU_RBAR and SAU_RLAR. None of the
> actual behaviour is implemented here; registers just
> read back as written.
> 
> When the CPU definition for Cortex-M33 is eventually
> added, its initfn will set cpu->sau_sregion, in the same
> way that we currently set cpu->pmsav7_dregion for the
> M3 and M4.
> 
> Number of SAU regions is typically a configurable
> CPU parameter, but this patch doesn't provide a
> QEMU CPU property for it. We can easily add one when
> we have a board that requires it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  10 +++++
>  hw/intc/armv7m_nvic.c | 116 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.c      |  27 ++++++++++++
>  target/arm/machine.c  |  14 ++++++
>  4 files changed, 167 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
