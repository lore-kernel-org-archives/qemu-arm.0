Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1520840wrx;
        Sun, 17 Feb 2019 10:01:16 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZcYZGCo7TiHFqlFVr69Qs+qbTe6ZbHcrgArWE1Wnz2zK1NMEkYjcIUGMwRMAaj8xLg0hZz
X-Received: by 2002:a25:3281:: with SMTP id y123mr16283025yby.55.1550426476453;
        Sun, 17 Feb 2019 10:01:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550426476; cv=none;
        d=google.com; s=arc-20160816;
        b=G3HkXNQsxaL/RBZyzLmBFDILAXRbU30sn2Vks9+zTklt25OfHYWthB/rShp9LMw+HV
         inp/kcr2zTMfjuPxg6ao5l0Pt/GioMnPSJrt/b5Mn1JQkR9Z+3Ye9bq17P93oKzuUPag
         ojse3HTmyiolP/9cN4iP1tiX/NCg/mtnucbaS1eZm0/t6doZ8NaJqKQvqKVEmdS9u+is
         YoGPR2Nsl73NjeFc6gCn1UwYd0oxky6p7INfPUx6mpRRalJ1xqt73WtG1nzDBiSKuqjA
         fRUDKmd0uqg8X5jrnjq6Ba3PuV/1YZjiZmQrSxb7Jid6bBhdT3gdRehgEeSqbXWqBLaI
         t5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=oj0n68F7ot3uZyxwh4JIyqjsd3ZSeP/ULLhsAkdNZSE=;
        b=aiOzl0n3GZsGrVOB/aQQmH2rp2qK96Gt+c8GSWQSoccS0DxZLuliv1DO407TuYrsZ6
         kJvCeww/0sqljMJ0bI1tx9V8WiNUbFq93mxYAG/wVLeu0b/ISPcyY0Yw1qoc8L8RgXhZ
         Pce0np/MlSf2/quFP9DXBLaFIq6bUihk+632hjEyiOb8IHhIdqUB+CrcQ/TVZFQumgaA
         gb/F3j2JmfiRfJEiEygitUAgaLEFovPEVbnZ2Eczo1NWovfQ2+7US8vdqkx4ebuy7llm
         wuguN37DJoX+1wpa1Y+ITuj1p46hOgey8Lim+LO7sfbdl7VY6U/6cX1ROZmfCWd7XSsm
         MXoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K/6WK6r4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si6277543ybm.212.2019.02.17.10.01.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:01:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K/6WK6r4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQkd-0008SY-Uq
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:01:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQkU-0008Rh-I3
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:01:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQkT-0005ky-QE
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:01:06 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:46051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQkR-0005hQ-LY
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:01:03 -0500
Received: by mail-pf1-x442.google.com with SMTP id v21so4353437pfm.12
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 10:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oj0n68F7ot3uZyxwh4JIyqjsd3ZSeP/ULLhsAkdNZSE=;
	b=K/6WK6r4BWwpdhFdpXMAdvbvRfHbIq0TbAMsOdNwhP3HOT9/2bB7GcT6EUjE/3esNs
	qvvaMHdKf2xvjt9wG2blXjwlxU0y3xq4zXOo9MUfbLulFOCTLk8tWynNPBAWztb/UrJR
	yoiNwuKCBJoLHMszfw93M4n4p+X2txRantn8XfoDi+vQzqpgVTdPTFdiT4r1t0jcKD6p
	KcYdb9AxfM1bzxBvaTXTYhfjRGDnOEtHQQfRhf3cl/QICbKLNRqNriZBB58QH94dvcGi
	Xb0FAjcW8LW5zkhPPL5FiH44yh8H1suSqFjnxqglM9N5sSCCLFPQlq7kfoDPjrl+tO85
	aulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oj0n68F7ot3uZyxwh4JIyqjsd3ZSeP/ULLhsAkdNZSE=;
	b=Ok5CB6WUpH7eAIY4OHCOSTs+Y3kgtQ9Q0zGLnNdpcz5BqACKNAfTI+07FbZbDzzJHE
	afUYCb9aKTd6n1EOV/MduoL9gkI/lxPQASUVCmGPvrHezOYpQry5Tro1edFpjR0HEgaC
	afOUCTZEuFzC9ZjmRd70G1WZLpeUoM4mgIJS/iRPMyGOWJmhTQD6/hX9whYWsqBoWvGy
	ZlDlGOgtE9PtU2gd6+lgI+D5XZaCDnfYbGUO0tA41MQdg4HebPX+jSKeBAiJjcgDq89d
	Ey4EQzJGP7Zi279CseNrEJrM+YxE+QY7bKvENDiZReuqois33TZIZffcxiEHoRC7mQaR
	Kbew==
X-Gm-Message-State: AHQUAuYATZaVy1P66n/HH9o2M5/TEQ6VJ7Wvxh8etkzdDdhChMBSNd+j
	grkJ+bVq+MyXc6SuvfHiC8JgmQ==
X-Received: by 2002:a63:5813:: with SMTP id m19mr15071752pgb.294.1550426462293;
	Sun, 17 Feb 2019 10:01:02 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id
	r130sm22984690pfr.48.2019.02.17.10.01.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:01:01 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <49f30287-716a-567d-577a-576d14700e07@linaro.org>
Date: Sun, 17 Feb 2019 10:00:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/14] hw/char/pl011: Use '0x'
 prefix when logging hex numbers
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
X-TUID: fZMvHNfq75Ej

On 2/14/19 4:51 AM, Peter Maydell wrote:
> The pl011 logs when the guest makes a bad access. It prints
> the address offset in hex but confusingly omits the '0x'
> prefix; add it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/char/pl011.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

