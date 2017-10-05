Received: by 10.223.197.9 with SMTP id q9csp845709wrf;
        Thu, 5 Oct 2017 11:41:23 -0700 (PDT)
X-Received: by 10.200.54.3 with SMTP id m3mr33359700qtb.195.1507228882954;
        Thu, 05 Oct 2017 11:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507228882; cv=none;
        d=google.com; s=arc-20160816;
        b=s9R9EGw2aO6XvKyT7Te6lZKW+9MZm7sj8wQfHWxj053EOlF6v2jD3ffGletZY6SB9e
         SZE2xVPvpEOqzQzM731RJCeXeSVFogu3/Y2oRjSzku6rNs27NXjxcf3azxx4Q6SWCoU9
         lgEwqEctBbVr+WeNRTjNK05oWMy22d/Q4aXDHlOzY6HC1Qkw0qE5hpW8C8ljfVXH9vXA
         qQx2YTmcyDpdngNLucs1ofKNZBRyEWpGVVDJZtnmqHxNdE4rD7Wi1A75Kpy9a1ALD4E1
         RYXmdV75KKwSE/P707xyh7I25H1vjfV52myMcxhhe9dB/8nyKr3tuLeDMy5GAXZQT195
         tlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=fmBpAkvldfNCOKU2cOGlLethne9hGjo4kM8XR9gg8Ok=;
        b=sVBwPLW+IjRTDOjIPbe1si+6bT0lPVo/jmtpyj185ZbQ/9zYPxuj2k4TWWKskuR8TA
         vM2Leao6u3BMRzf+nDXfz135Tyjdoj4vbWLIhuZoVMnltfgXTRtuFf8PjTOw14keJa2q
         TH650MDvIYNSI4P99yww0KmkBosErjj2ZEukUXuLXGatp4bByWPBM9NKaetx6YxO6bP0
         8Xap/QnBB2M3pcZsngc8oWX+3WuPV4LZjRoxu8SmaBRvf2J35NfiTFBQxAf3nUZn58nN
         iub6H+isPCt302stW4qyIqPDEHHcGv9b5puq44Eo1F3aB0ugkFa2lBUO1ZAXR3A/dCYO
         TblQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DsO9hFae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m68si6570522qkm.552.2017.10.05.11.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 11:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DsO9hFae;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0B5G-0005PV-EF
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 14:41:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0B50-0005O4-M7
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:41:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e0B4z-0002tA-Vg
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:41:06 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:51501)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e0B4z-0002sX-Rb
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 14:41:05 -0400
Received: by mail-qt0-x236.google.com with SMTP id q4so27196621qtq.8
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 11:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fmBpAkvldfNCOKU2cOGlLethne9hGjo4kM8XR9gg8Ok=;
	b=DsO9hFae75NwighosiJagdHAStRk250hAbcE0c/0EWGbQ61/sr54ZnXOyUDBJ0TIJ9
	XwvnQm3df0rv8TVgMG0XVR4R2z6LtqjVFsgztvHRxawjrUbcwWFyoUL4l49jg8cD0sae
	AOZtLnkm1NbtS0C/N8/Lgv3T5yoMSq/+GSaPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fmBpAkvldfNCOKU2cOGlLethne9hGjo4kM8XR9gg8Ok=;
	b=ow3hyIpaRsCxHKXKAm9AiB6JDx734c0jqYcInBTCdeWfCFXgkmM7QkCqqFqUQyeziy
	9czfJ3iZtJnRnqpzTDB6OLMCT7DYBjj/enryx9KmOrOT0yitph7L2CjVg4HFbKrIxGNn
	64xsDwCbAFaMML3ekY/S1xfa7aTlEv+DveeB1rPM5HzOp2ANbo2REulhYmVBz7wvb3Uu
	BtMdQn4wSrfzYEfrRp7wi05buAD6yeJfamSWAbcUClATj+3Mi2XldTi20fwTp1Nh/jhH
	DTQrVh6dbRXhjquv5OYckk4NkRCfXSjJTqIbJen+ngbHA0Aw1OL4nh+03SZA54fXTLKt
	FpwQ==
X-Gm-Message-State: AMCzsaWz5LUT7vTeVU6Bk1GNyIfwxyswqNmZu4fFWaHi4gIdKPZeGy58
	u2jbi7H7lFwmwAihBjhtnZwzag==
X-Google-Smtp-Source: AOwi7QD0c+cLyRmKTIwhw4UcdGTPhhW+c90lmUFCVKk2LANTrWHyVB0kgeZY5lmmW4VTDqTdqQWakA==
X-Received: by 10.37.9.71 with SMTP id u7mr7460748ybm.283.1507228865250;
	Thu, 05 Oct 2017 11:41:05 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	r10sm5075019ywl.39.2017.10.05.11.41.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 11:41:04 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-16-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <440f5fa0-9c35-63f7-400d-2504a6e63483@linaro.org>
Date: Thu, 5 Oct 2017 14:41:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-16-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 15/20] target/arm: Fix
 calculation of secure mm_idx values
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
X-TUID: KEvftdRKjiij

On 09/22/2017 11:00 AM, Peter Maydell wrote:
> In cpu_mmu_index() we try to do this:
>         if (env->v7m.secure) {
>             mmu_idx += ARMMMUIdx_MSUser;
>         }
> but it will give the wrong answer, because ARMMMUIdx_MSUser
> includes the 0x40 ARM_MMU_IDX_M field, and so does the
> mmu_idx we're adding to, and we'll end up with 0x8n rather
> than 0x4n. This error is then nullified by the call to
> arm_to_core_mmu_idx() which masks out the high part, but
> we're about to factor out the code that calculates the
> ARMMMUIdx values so it can be used without passing it through
> arm_to_core_mmu_idx(), so fix this bug first.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


