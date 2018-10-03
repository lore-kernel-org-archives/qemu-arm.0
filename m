Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp16012wrt;
        Wed, 3 Oct 2018 12:50:21 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61+rv951eRH3Eq6/LBBnjxp6jGJssU/WZdp1b6zuzYd3X5Iq70PmSOEsK0+KNPLzi+OBEtt
X-Received: by 2002:a0c:b137:: with SMTP id q52-v6mr2644145qvc.211.1538596221355;
        Wed, 03 Oct 2018 12:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538596221; cv=none;
        d=google.com; s=arc-20160816;
        b=LLGiVttZmgtXDcBbF74DV8ajTX5iZgTvTo5xxh/5/uQUcgSykssyvgDOw3fuqA5AhH
         hZLQKeICrP41oevXdoY0E27bXbW3wfSUdQjFfUqbgxHgmgVrVeEHZVjDXzL8DrQZxS3i
         b5RZpGhK7jk70HP9RFlogiiG/vQIx60yYyCHBZIMvtytS+LWXAsf7pGW85khCTOtYapX
         znXJT0H4MlMp4+JpQZJN2mQmzDSIrIarJvcY3Y/B7Kw7bEsUN+GH2eynJdDJFjvksiQs
         +9xr+eX2nEyUIVQRheyw9GxO0b7YUp8hG1RGNSpOHfiiXpYFWhBoYHAqEyHGuQOcM5ZE
         0+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ZSRoJl3gEjMLt+WXb093nzhqRsk4bl1ERYHkF8HbDBE=;
        b=ZT7QgP6OBDtt87WsSydbpo/fFcBe3D2nffmG+TJ1qOJk0JjyEITbZaXm/uzja3/qf7
         GlSxVRPZfL7gk69+Vq9AfOvhoWW6SzzRnMr2AKLLPaszvYzTrZRCFo4CU5h26k6esAu3
         chDSDtXCTqyK39tXMrDUxlHn67hRD9gtENn7VC55Ef6zb4vTKcvDmFcLCPTYFePZ3m1N
         1T+jUkgDyNO/xWqlv2ng4yXP6YtX8PYRPUR2H1o0RPm2URGe0aVr3EaMlwBfo8W7lQTf
         TQzvhZF+qMUWQwT31He2VwfFmlYHBXl7oUuxjaZhg9QRthaxbx7fqQjuWLf7TkX5FZbQ
         eQ5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kr5rZFkM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v31-v6si1515840qth.252.2018.10.03.12.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 12:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kr5rZFkM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7nA4-0001HB-Sy
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 15:50:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7n7N-0007xM-Bx
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 15:47:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1g7n7K-0006NQ-7t
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 15:47:33 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1g7n7J-0006Is-V9
	for qemu-devel@nongnu.org; Wed, 03 Oct 2018 15:47:30 -0400
Received: by mail-ot1-x341.google.com with SMTP id j9-v6so6812804otl.2
	for <qemu-devel@nongnu.org>; Wed, 03 Oct 2018 12:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZSRoJl3gEjMLt+WXb093nzhqRsk4bl1ERYHkF8HbDBE=;
	b=Kr5rZFkMACi1LPi97e36o9Uf/Bfr/xkjGnOvCsDIkwMcQomFdLgOyTJG+tpXS/s2mx
	/kGJzZomCzGyPyRM0BaWDTnp6q/hr9YFkDJR6TqOjWjF5bS/eRW62OSFaleMEfnUDckW
	Tz2onSDCJGmRm8YBXcXJ8eSt36aln4bSUxzbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZSRoJl3gEjMLt+WXb093nzhqRsk4bl1ERYHkF8HbDBE=;
	b=fA6wDc/n0GKtFkVhCmADJEPR9VwMzLEvqiY68ayNZfwsKGYZXGVd/JjK5+NpQnGQDm
	vRW1deWJ4fqRu9DiD2HvO837w8tWPjQzkoB0P1tx7DfS5/IEkHzPpSZKUql2rM6+W9jh
	LJP2swqrCI9a0poMD54mk/y1wtuTtQ+OMEiCKjirSNK5+12wPRUEwgxLj8C+podS4HMF
	GS1652TJHPHh/CFrPfivkN69mPF38gE7iA6EcDA+Gw4ZVpXj2a48AvmDYtZnigQuNerO
	r8iFHbNIwrFCK9jiyI1MgpBqilhmTcTSWTUaRCZV6gbVn+XwfZW1WgeLTe6zjhqQmZ3K
	ngqg==
X-Gm-Message-State: ABuFfogdk8XO+n+QaOCaiMyOp0HgXINftObPXp3RT6VXSIPTmZJZD14x
	dxOsy2+wG0XpciGtrlGCqz4uxnmLfSJCOg==
X-Received: by 2002:a9d:3886:: with SMTP id
	p6-v6mr1840976otc.227.1538596039707; 
	Wed, 03 Oct 2018 12:47:19 -0700 (PDT)
Received: from cloudburst.twiddle.net ([172.56.13.153])
	by smtp.gmail.com with ESMTPSA id
	r83-v6sm694595oia.55.2018.10.03.12.47.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 12:47:18 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20181002145940.30931-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f84fdc9b-b3a0-3e0a-19b6-cccade36dc97@linaro.org>
Date: Wed, 3 Oct 2018 14:47:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002145940.30931-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] target/arm: Correct condition for v8M
 callee stack push
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
X-TUID: Vb1jOrZ6qshl

On 10/2/18 9:59 AM, Peter Maydell wrote:
> In v7m_exception_taken() we were incorrectly using a
> "LR bit EXCRET.ES is 1" check when it should be 0
> (compare the pseudocode ExceptionTaken() function).
> This meant we didn't stack the callee-saved registers
> when tailchaining from a NonSecure to a Secure exception.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
