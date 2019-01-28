Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3466876wrt;
        Mon, 28 Jan 2019 08:29:51 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4sfmQFvndfMXlQylCffuOJKUX9QULAFum7vdlmQDQc/TwIep+wYBkIctc3lvlI0EqoYEdj
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr17711091wmk.149.1548692991257;
        Mon, 28 Jan 2019 08:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548692991; cv=none;
        d=google.com; s=arc-20160816;
        b=N99L2xDui9g00zkPBLPPc2aUHWwLRNXCO2SR/1TduMNzVZAt40y7PaEu3eRZSMMLtG
         XLFGVRD0NVAI2JdNnVNlmdCS0jN1Z9+EUesafGT7jlN8Hmm0s5TaH7WkzEVXc/7Km1iK
         w9IrL1RxNOFSnh/s8Zm/wOp9UluskyabpIDXM0LXHJsmT3K1kf4uMsCRM4xM6mvzH9Y6
         GUaBrf3vPzm89zam92TK8dYsFjUXIiFe00YaYeInd4x7lobTQweKIDVC2tx/hMWrSJBs
         xqv9o0AILuOXq1VsQ7mPJ9Q2F3tN/FvjMNnyIR0Nc7ZfnMw7heV906FWXTmZ9DcyvfvO
         jpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=dTsNpjWLa4APd1nSqnylB33PyBSt6Ruj8PB+DFMSBPA=;
        b=RZsYgZ89afN8Q5UyJZmutEutfgawIDUbWXbZ7j5GSoiT+zHJ8gY/Ilc0hBle9QYgg+
         FTuVaVyf4x/Nl1BoCaLFGUPBoRKtRc3EAoUD82oymOIRPlRtCQM8wRLTcXJSqDZneqIC
         L/d6ZUuuSw5iH0J3iUHjr9fdbP+mhxN1qjNr2TQYmiWZdB5iDzdwuLSncCZ4W2jqAq1c
         3pGIVi7LcOsXUoQ/o3gnInmuRSvnhpckMfcIsabCTZ8I1ApcT8KIptujOIeuOV9fk22I
         QYsj8BaBflsAdlXl0podeoCeKhpc7iUUbYUZ6GbmfsosImRUayJPtiLMKiGBD6HTVsqI
         xpcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gqAIZr0l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si38990663wrv.4.2019.01.28.08.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 08:29:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gqAIZr0l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go9nC-0003bC-7K
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 11:29:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9iJ-0008Jb-Gj
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:24:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9iH-00061Y-4w
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:24:47 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37407)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1go9iF-0005oV-4I
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:24:45 -0500
Received: by mail-pf1-x444.google.com with SMTP id y126so8218553pfb.4
	for <qemu-devel@nongnu.org>; Mon, 28 Jan 2019 08:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=dTsNpjWLa4APd1nSqnylB33PyBSt6Ruj8PB+DFMSBPA=;
	b=gqAIZr0lma+hAuH5G5AIbKv0BqX/XXJNXie95M9ju0vof0GAu2Ni0LnPV0VwdNubn6
	sQWiQuuwNj4zvG/QuGpsz5DfwlG2VCdPIxN2oikZKz4YppCoc7oIqDuW2Q80/anWtyMx
	9QfHlI7bjCMGOPd6O+jPu5QzeI2gfKNIKLYCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dTsNpjWLa4APd1nSqnylB33PyBSt6Ruj8PB+DFMSBPA=;
	b=rOfutYq0Js++LU76esVPw+rlZ7/8q7l4gj9ZhnbYYoNyveKbp42yUfQpdZh1NKoOEj
	2ph2TQupJfBZMrzsBZFmsYUaed+qk8qwhOpGCfu+3czn6WvUTJRxRYsmNT8lOxrHDFbb
	vhpkL/kA5chdb6pmT303W1CAvnr3NU1ulOucTRo/xTgAoY3iNqCyRLlmynO2psKjYgBh
	p6D6ON3gceBAzHpsfpignvwbLnErBtBo9GkwMz6cvvGvwv/axQaYYt9dhtthBmnkfNQX
	HBaKmKJuZmg12BxjuI83rUOsOLPXNqM3FhFboVsI8Osoe8xnBVhKgGkkPzjXghFC7r87
	Loqg==
X-Gm-Message-State: AJcUukc7fj2yWF+6PUGz3XcONIKNXh5hU0N2yrdv9858epunBgH4MYxe
	ba3SmLsI7BeNzz88diQ4iPr2sQ==
X-Received: by 2002:a63:e001:: with SMTP id e1mr14190996pgh.39.1548692658540; 
	Mon, 28 Jan 2019 08:24:18 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	u8sm50236726pfl.16.2019.01.28.08.24.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:24:17 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <12b083f4-4342-f448-5355-a91725daf609@linaro.org>
Date: Mon, 28 Jan 2019 08:24:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-devel] [PATCH 17/23] hw/arm/armsse: Add
 unimplemented-device stub for cache control registers
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
X-TUID: sfiC25vJod/P

On 1/21/19 10:51 AM, Peter Maydell wrote:
> The SSE-200 gives each CPU a register bank to use to control its
> L1 instruction cache. Put in an unimplemented-device stub for this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h |  1 +
>  hw/arm/armsse.c         | 39 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 39 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


