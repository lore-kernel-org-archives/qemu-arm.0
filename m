Received: by 10.223.197.9 with SMTP id q9csp720142wrf;
        Thu, 5 Oct 2017 09:18:44 -0700 (PDT)
X-Received: by 10.237.54.163 with SMTP id f32mr12271980qtb.170.1507220324553;
        Thu, 05 Oct 2017 09:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507220324; cv=none;
        d=google.com; s=arc-20160816;
        b=BbGcqNgmnJCC8PUDH9WlVVpUenaqTnzFtWgNynv+hwBQnYQPIkENoFcS8m6KKhXxRc
         +udVkdUVHQ6LYT6hozhkEmP8BaW8vB0cNhYJqp/rO0eFs4ZRGeTpaweJHDFB/MklZV8O
         30+xIadIdNzycXMw57S/UhBAjenq2oWC4nnrndw9EhNYYvkVgmA9suutAWGEKs5FuDcu
         7W9lRQKx5uTB/uLAS6JIz8i2kV9zy+hUXEODBUlKcCYxzsunQfx0QjjU9/QRkC5RC+LK
         LhrPd/lYDn9Pk+pTNUvVPVq4+kgjcJCwlil1yIhFn1gOksLidgFjaBi5zWT6ScG1Ba7w
         KLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=7zvqxY9I/RHPVA/Udm4gxmLPmScxjTN1DPf+cyJXAAE=;
        b=GH33I3+98omnXuTelZppM7JpPssLZZAurnF8oeA6xFaJkkc86h76nSdRCX/SJXNQcV
         VBD8Yui6RZcoCE6fHboD25uNrDVPvetI4Gx0vb51zejLxiDf9AsAFZXsWHvXIOnb2fTL
         GjOS+ji9+4hwFnAcP2Ear0csmHskh/DJj/9PKTg55rtpnvn2A8G6NBuo0Dk0jPmmyupM
         UxaqUn1CTAW3I4xGTWf5X+PFGPmAsoyJ8MkqMZlNmHIouBapVJWyMM4xP/wwHs5i75Ps
         lVTeiuWEkZFcy7YDjzucYJ6yE9iCOiES1veHpkS6SbIjVcqd/U300hsGtez776XD1in4
         QjMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gKGC4wSO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m68si6329516qkm.552.2017.10.05.09.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 09:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gKGC4wSO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e08rE-0000ou-2x
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 12:18:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08r8-0000om-SN
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:18:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e08r7-0005tg-O8
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:18:38 -0400
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:48323)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e08r7-0005tT-IM
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:18:37 -0400
Received: by mail-qt0-x22c.google.com with SMTP id d13so25701335qta.5
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 09:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7zvqxY9I/RHPVA/Udm4gxmLPmScxjTN1DPf+cyJXAAE=;
	b=gKGC4wSOGOCiwFL6dNIBZSSZy0y3af4BMfddeToYv6iZPHAFPHLVXbl0dGubGRuRDD
	3Yj6PKO5S7f3RLXzKlRPU6ZggO18laLDDuSWKDiJr+NKeLv0OQWugCFo0pFKY4aOnwQK
	OQHQqWZTOfqEvofURrb2TKD7T4I/anaZynbfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7zvqxY9I/RHPVA/Udm4gxmLPmScxjTN1DPf+cyJXAAE=;
	b=aPuRDnngCChfjh5uSEBhShM3rDsmtpgFTeN/vJfVY5uHmy/aIOfgjcYzscuh+iFb94
	B50tKHpFDmE73U6TJZ4vad7ySNt7WkybG37LSO1In0thMpP4i8MHSz6FOw19fgERQr5K
	dwDW7a66lcFYdLcWb2TLJTD+d+wOAS1MSXJqy9ow+t2uTeCXOHvN0a519yqsFN8gObLA
	rePU2k9fuC9ig05BBuIaxW3zlV4kGFCgqzNKlWPT5nqVfvyIaNfHvwsDpa8L3P9qSmZJ
	hSYhxZx2feInskyDjbNV/zZL3vS/lniv7eczqF383/cECiE7EJWCwiY9lg2VKTQbO33y
	clBQ==
X-Gm-Message-State: AHPjjUjjGio6zJpyAUcNYob5qViQURZWUXK3HqM1QNh61q/rhuzHcR7X
	g+NQY9+dN+/B8ip0NhUvnmSHXGu0jb0=
X-Google-Smtp-Source: AOwi7QD4U2mdIlFWuXzfb72ehjSIHw/eNYTdIMUTeBpc+Izbep4RYPXpHt3JoQoks+LUMc/4LajJBA==
X-Received: by 10.129.193.5 with SMTP id f5mr20749389ywi.453.1507220317049;
	Thu, 05 Oct 2017 09:18:37 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	k16sm5079682ywh.18.2017.10.05.09.18.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:18:36 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-6-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c36a6fd8-f3cc-6f7c-6499-32c414e6a4cc@linaro.org>
Date: Thu, 5 Oct 2017 12:18:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/20] target/arm: Restore SPSEL
 to correct CONTROL register on exception return
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
X-TUID: Au1fTnQzL6et

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> On exception return for v8M, the SPSEL bit in the EXC_RETURN magic
> value should be restored to the SPSEL bit in the CONTROL register
> banked specified by the EXC_RETURN.ES bit.
> 
> Add write_v7m_control_spsel_for_secstate() which behaves like
> write_v7m_control_spsel() but allows the caller to specify which
> CONTROL bank to use, reimplement write_v7m_control_spsel() in
> terms of it, and use it in exception return.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 40 +++++++++++++++++++++++++++-------------
>  1 file changed, 27 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

