Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1179212wrd;
        Thu, 23 Aug 2018 06:32:06 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxPajqr1WxfHA42w8W1zQvFhAYNn6Mb9Sj+Z719FXOifs4Sp0c9Rl5DX9j7AV5G3Ff0lZ1L
X-Received: by 2002:aed:3688:: with SMTP id f8-v6mr59540261qtb.276.1535031126330;
        Thu, 23 Aug 2018 06:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535031126; cv=none;
        d=google.com; s=arc-20160816;
        b=bFZ5o/reLDgsObap/wy59COgktv5gppjN24ITKGA8JmvXeqBhYOf0moWUB4S/NXvFr
         bcqif/RWCR8QKgwDH90fLDooKMW6Nvb/pIXUVPUI0IXAhUPCMYtx7XOBDmQ52/OYSc/y
         0dAkD0TlCNGGx5uzyXJ+aPE+6Ox/f7oUemmKE6D0tVdzUaJHgv1RuLrmSTn6ic+PQ+zv
         vt+s4DgjusvRO1JB/H/QQZugzqAtaw8dfW3uTOXpX2RXMeJ0c3DYd9ffXP9Pv8CHl5ok
         PQfSMkySGfqkvlqcqPEHnP6t3fevJK2pCJsPf7T2fvRBhPRAlUDVnMdWTYja0+nQlbWB
         bucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=aeAdQcuGMXvKWDuvtVlhWyz2CVReWLblEaMLvuzHBJo=;
        b=mLxYJFXDqUyKjlnlcHo5vGixb5tkj29HyoVixrjFFwzFG4t5mENnzd00wIw5r8SiHL
         TaQvGZgRXB2izKdOKAdA0UjxfDk95eV5SWuHCbZ5AkBxHGgb9/lJOOrDN6HOS/tng/nz
         mQNPmgMwP0hw7MBG8dCUvCHoSZq2tvzIqFYhTqOtU7qIE1eNfDVVtIotPr4Awpp+ygfj
         itfaTypmq+Kh4DkC4FoVNfolwajgSx4kmBVpQRiTHHgrL52IERo2ImBPnyvP2kXsVr8M
         AJ4aAEhOAvAoq5EULnWHaV/V/Z64ycKFM053npkXQ5dKLoqbfdfcc9KpEk455spot+Ut
         14cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HRgkBTlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z13-v6si386258qkf.190.2018.08.23.06.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 06:32:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HRgkBTlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36475 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fspiX-0002dJ-Qv
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 09:32:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fspiO-0002bj-6D
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 09:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fspiJ-0006Cf-VE
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 09:31:56 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:38936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fspiJ-0006Br-KM
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 09:31:51 -0400
Received: by mail-pl0-x242.google.com with SMTP id w14-v6so2418283plp.6
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aeAdQcuGMXvKWDuvtVlhWyz2CVReWLblEaMLvuzHBJo=;
	b=HRgkBTlAtBrNHLeoPmstfOggdxEqn2OT+xbANDEjVLmEBZ7Vyk4UEmMgZRQJZfAH5W
	nUoXmkza4oklxxWzdQk+tvi3Nq3T0cSxPcWxMSv5keEXqrhyaOxg1jI3xaIIGUhOTSNf
	jydcdroxANwBLUNvU8qp/ojKedQbZjvdSiTuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aeAdQcuGMXvKWDuvtVlhWyz2CVReWLblEaMLvuzHBJo=;
	b=obSdNFY7lElpFoFnNZXBEX8QCC2MFw8mLy4PHV62pVFP0sd3OCpAvhaBBsmhZLJ3sV
	iAHSWzW4orhq/R9VNJWK77MZ31pSAIs/bZ2bFg2o7LpEXuW/9lvcq4kC4b9oi6sHIIpr
	cw0dmu110an/dYMl2B3TKJ477IS6cZoYxtL9SXkPPQ+Wk9XpdC1MEnhXIoO+/iPLUKXC
	hIySyU5Wuc5XbzijqKAyXwO/G6bO04T+KTpU1304rXeuHOpoqZ6yOsHCU80LVRayQBYB
	P4laISpAh8xFTz+i0cK4nkdoBM6OPGXu8/PREt4Kj2yM34b47ASCtmpttmilugFuNY0L
	LiiQ==
X-Gm-Message-State: AOUpUlGGH6wev/p/byZQ+RfTx3A8akye0fHin0bV+aHOfAHhRJO5hWgY
	U+77k5kvpmrTBfNXqihTgnCeXQ==
X-Received: by 2002:a17:902:d881:: with SMTP id
	b1-v6mr29215781plz.191.1535031110723; 
	Thu, 23 Aug 2018 06:31:50 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	t86-v6sm1875367pfe.109.2018.08.23.06.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 06:31:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6963bd38-f7fb-dce0-f857-edc65e619de7@linaro.org>
Date: Thu, 23 Aug 2018 06:31:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/22] hw/misc/mps2-fpgaio:
 Implement PSCNTR and COUNTER
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
X-TUID: uQrnPl4WH0rM

On 08/20/2018 07:10 AM, Peter Maydell wrote:
> In the MPS2 FPGAIO, PSCNTR is a free-running downcounter with
> a reload value configured via the PRESCALE register, and
> COUNTER counts up by 1 every time PSCNTR reaches zero.
> Implement these counters.
> 
> We can just increment the counters migration subsection's
> version ID because we only added it in the previous commit,
> so no released QEMU versions will be using it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/misc/mps2-fpgaio.h |  6 +++
>  hw/misc/mps2-fpgaio.c         | 97 +++++++++++++++++++++++++++++++++--
>  2 files changed, 99 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

