Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4842235wrt;
        Mon, 15 Oct 2018 12:21:54 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61SZKmYFsTZsPECWtACXshVBCBAWC62Mp3oRR/mLVA/qrMlNtsQdaVaaOPdtGUY4mNKNeBP
X-Received: by 2002:a37:a84:: with SMTP id 126-v6mr17854174qkk.267.1539631314622;
        Mon, 15 Oct 2018 12:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539631314; cv=none;
        d=google.com; s=arc-20160816;
        b=cdp7Nux0KHPnUIgY1WBHS+b/8q9u4ZCDkYLInMYult8zC7L6r0Iu73UkuigLmUxRFw
         d4agv/sPaGcdo/OcAt1I9ajmh8gik92xNxlpfpR4bsxEDqBMlUIM8VxBd2gmxWBRUaDW
         SU56JReJ4jFoHnUblSZS2/mYhKGxZ+wT8tsqoQFOvVwiCm3ojDoB+mUb9fsjC58HOLdF
         mXNPdwlzL0HhepbtGtnAEedAUwB9ZFkPISGemgS0waFchDQWRy/y8coitmeddjfXda6K
         kb7v5DhsnlZUFm5MzIYbFmzrMl6d8AQEneY2+jI1fnOSVP72HEARX/g7CChHxPqXShQY
         qpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Se2IPKoHkPProEK9yz+TtOQI/eMa/g7ocGzPZwLu3f4=;
        b=o1wvrQLZu0xHSMS1WQk0O/pEVlSSoaIp3JOi+GEy2GTvO2IZ9KFTMQAXttAj7x/yRP
         0Arbr+NmJO4ZoVxmDk4AZHEZAPBT/aYXE9fJzvzf1RjodxiV7RcJrCbKzY9uyVVC5Sup
         7P37Rg/2omfyDRV8vb4xbeDksCfRvC2XWxxtfm8luqjRL43s16TSvrQPR9iNk69+kWQL
         yQ54jP+rD/QijBfkxs7hFw6EZNDTM88vjgE6phGdkfXZB73HOdO8FZlyfn84rC/0KvKJ
         rS+Xb3E2E0slhxyzXZd3eicboVXQNIhyU+H0jASP/NRDY8A773pw1Aq1sV970fEr3ggm
         le/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KQ/DjBSx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s189-v6si3422800qkb.46.2018.10.15.12.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 12:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KQ/DjBSx";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC8R8-00006k-1y
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 15:21:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8PY-0007zo-Mf
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 15:20:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC8PL-0007KW-Rj
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 15:20:09 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC8PL-0007K4-Jx
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 15:20:03 -0400
Received: by mail-pg1-x544.google.com with SMTP id g2-v6so9609068pgu.11
	for <qemu-devel@nongnu.org>; Mon, 15 Oct 2018 12:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Se2IPKoHkPProEK9yz+TtOQI/eMa/g7ocGzPZwLu3f4=;
	b=KQ/DjBSx9aG6lUAq1qH3aVvmvZbLrgPGSWh6Ut2hsSBl4Um4qM/YkCwsViU/AEZQe7
	AHGt/5k6p4XioVAYB2ma8tmZiq5Qc4gjRubrT8ZV1j42ubLXXiO4I+7gkcBXW7NJk5UT
	Fgl0eiB2EkomtLK+1PG2mDgo6hDBinNLJNkA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Se2IPKoHkPProEK9yz+TtOQI/eMa/g7ocGzPZwLu3f4=;
	b=Y3Y8gqrmcC2ZjPwED4SGABC/CWsaMFPiAFXm9ESFubOns/Lf9YiEoatoy3S2KRK+tl
	Dg6RYIxmd6XivLeahcP6e3lKyi5+BDmpMOZZgDHkUOpLuvvKxtpOd/boepm1pGPVYAEV
	9bhA2qKNLAtA116vayU9eKQ/hGIP/uc1KMUBm7Hjo78slzaesr5qJEFKzGiKSKfGcTk9
	avfgoUyVwJAfD2CMhgfWoay4sVmF7nes0W+J38ZN7gNf4coRfr9v715q1ugnV8KOe6ik
	jA47LlN+6ADVZmwxwqMLOOm02WZaBx60r3HzTFVdCT39Tz9Ej7e/3rG6P03DyOxi7mLY
	oopg==
X-Gm-Message-State: ABuFfohmbNrOo9Clc/kvIIAuzxLjt0W/slGrH21za4yiedr8rY43Ka3H
	3aZ+QpizDHppAwFnEwWmE95DqQ==
X-Received: by 2002:a63:da57:: with SMTP id
	l23-v6mr17473837pgj.179.1539631202380; 
	Mon, 15 Oct 2018 12:20:02 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	z14-v6sm19385987pfi.4.2018.10.15.12.20.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 12:20:01 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-2-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <34b01256-4f3c-3b33-8345-e8b480e446dd@linaro.org>
Date: Mon, 15 Oct 2018 12:19:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-2-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH v6 01/14] target/arm: Mark PMINTENCLR and
 PMINTENCLR_EL1 accesses as possibly doing IO
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fCCQ255N/hMF

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> I previously fixed this for PMINTENSET_EL1, but missed these.
> 
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
> ---
>  target/arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
