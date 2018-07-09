Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2504408wrq;
        Mon, 9 Jul 2018 07:31:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd7Wzi28y9X2pIY9bEXHdhVFsX+/EAb6Hp63rlvwA6wANn3nmRUurzwEIg9aaA9aaNvICbO
X-Received: by 2002:a37:d9c4:: with SMTP id q65-v6mr17561033qkl.401.1531146687656;
        Mon, 09 Jul 2018 07:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531146687; cv=none;
        d=google.com; s=arc-20160816;
        b=g9ek3572s7u05+7krGvqbKUn7mWkqOYU+kiLQo3BI39HW5vifQD2bOjdzzouikCgwL
         xUUGsv4xIBog4794EXmXyZgWykBiVgPxtfr2WSl1bhaEJmVzq37q5Rj+gibKjjIRz6E4
         d89RnTHG2hCO09p3e0FxLfR1ta5U36m27I4rq8q0Hxz4UyX8Qiq8R1icZh3tsMIDX0I3
         7z4twACh4f8pE1kKGTyFh3asyb+LlYmFl42DQlvigeYuR+rNAOayi33tTv6VVg4O5sGc
         3E/qdvbE6giHdur9gDMndKuXQuAIJNtp7FusyR/HKH6FK1lJBwQRB+ylQi4pVb02bA92
         d3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=SuJ8oPxdhIvXEc7JgWDQz9oC0vaKJQ5DwXHa0Bvv+vI=;
        b=zY0GpVATnxtqK/+F6NrARInNDsbO+XU2bE1CQjQ2aCNDEXF/8QLZXbaQE7J6NLvAe2
         mq83J7enWznh0Rm++BaAdHlQmCAFdFMQTYecZOodP/ZUlrloSL5A0aRMFc0MTRZVefVp
         NkCO+rVDZTtmb6mKPWrZ+K2cL8/GrnshsknIW1MXTzansoEpxX3aDRAfCl4T/iTu+MGy
         DbI0g5Q8g3wSZawKIx1X+gCSRLKng1XkqUzwIH+bh6SotUUFLGLW+VxClxx06Z3Y4igb
         Dn9TtH1qL99DbVo4IUkVOCVzUbtnHcAuHUM5QjIqaVSvaJY2d8sG4zUyUbF99yd6W5Pd
         SgZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KuCjn1pW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q123-v6si948003qkd.355.2018.07.09.07.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 07:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KuCjn1pW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcXCJ-0004GL-3U
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 10:31:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fcXBr-0004Ey-1o
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 10:30:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fcXBn-0007Ja-3d
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 10:30:59 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46362)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fcXBm-0007JK-TK
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 10:30:55 -0400
Received: by mail-pg1-x544.google.com with SMTP id p23-v6so1148892pgv.13
	for <qemu-arm@nongnu.org>; Mon, 09 Jul 2018 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=SuJ8oPxdhIvXEc7JgWDQz9oC0vaKJQ5DwXHa0Bvv+vI=;
	b=KuCjn1pW+GMxw0OCKLHCkku9OOzlK6u3lwc9Ei5SZoFXSmIw3gj6Z8Wj/WCOw8FGYr
	T2ernnJVX0PNjXKy/jri8nJnxoKBm9FC+YFhd3X3TDxL+n43Z3+tOl6cXlW30j9yYS9B
	lWDf5+t6LiBTloxwR5I5VL2SdmdKzRQ1kCvkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SuJ8oPxdhIvXEc7JgWDQz9oC0vaKJQ5DwXHa0Bvv+vI=;
	b=hvMv/w9CKUn1Pg8yaetrBYGca8aG5ANHn7frdvwbP/ZD5SUOvi664ON9yQnG1SM8si
	05foLMG6iwpIF7iy0r0Am8k9Jxt8+ffL1edoW2auQd3I6QU3LFYf1ejXpcQQwu2q0S+f
	fM8WvCwofRrgSXbGzjD+cHnsWoi3boWQWP4xFvowmXgioBU9dHZKEGXCtXerCuemlwjq
	E+R8wjMKJQrfewVivh7MaasMepNKfls/LF5HvcHxX1OpFd9DTxANGDRVRaIgcQdQ+QhC
	KF8g1/PGNLrhQNbl12BnluXdAn95AHVNXG/LZiuLO7qfEPxIiV7vBrVzvmxEBCC2moys
	IWbg==
X-Gm-Message-State: APt69E3tN0KjJGL47whCDG4TnEDWuUbklNj3/w1OqW+fsd1sobXglXH1
	oE0dDVgzsEpdxJY4sAqnIEt37g==
X-Received: by 2002:a62:b29c:: with SMTP id
	z28-v6mr21818909pfl.8.1531146653793; 
	Mon, 09 Jul 2018 07:30:53 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	f10-v6sm28241426pgr.30.2018.07.09.07.30.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jul 2018 07:30:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180709124535.1116-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7fafbf1c-9af1-cfb9-24c7-ee9a00ef9d4e@linaro.org>
Date: Mon, 9 Jul 2018 07:30:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180709124535.1116-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0] target/arm: Use correct
 mmu_idx for exception-return unstacking
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
Cc: Adithya Baglody <adithya.nagaraj.baglody@intel.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7EW1cAC4rALi

On 07/09/2018 05:45 AM, Peter Maydell wrote:
> For M-profile exception returns, the mmu index to use for exception
> return unstacking is supposed to be that of wherever we are returning to:
>  * if returning to handler mode, privileged
>  * if returning to thread mode, privileged or unprivileged depending on
>    CONTROL.nPRIV for the destination security state
> 
> We were passing the wrong thing as the 'priv' argument to
> arm_v7m_mmu_idx_for_secstate_and_priv(). The effect was that guests
> which programmed the MPU to behave differently for privileged and
> unprivileged code could get spurious MemManage Unstack exceptions.
> 
> Reported-by: Adithya Baglody <adithya.nagaraj.baglody@intel.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
