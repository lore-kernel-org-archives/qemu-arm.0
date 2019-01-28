Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3461154wrt;
        Mon, 28 Jan 2019 08:24:09 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZs9Pgmg5qvNxaF99hkX3I4IO38WxoNbln1Cg9BkmG3n+/Fj1l9NrOUqWJGDDKVmSm1czVX
X-Received: by 2002:a1c:8010:: with SMTP id b16mr5526904wmd.57.1548692649246;
        Mon, 28 Jan 2019 08:24:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548692649; cv=none;
        d=google.com; s=arc-20160816;
        b=tMpzvJaJLoEryugnznBmRkG6Qlt/iSnFT3A+41U9AHmYLQfYW563phU7uNBWy7vroi
         LyItXIAm0YlSW7wW1edVAk3LYpKegnw9i2reCGubbuqgZK1573vOyr2rvrBgZfV4DHJn
         nnCsgmKAkPQVI60FCLQEWk8Az1yAP51uSba8rZVRo3xyW55zHpggiamsrUTPdJ+gbegi
         9sJH3c3BXZyptUj1JUXi7/tPRaek0Cp56e9fur9jk3FKws04/Veol3rU+VPAgDTojhLa
         1f4nzGknrxLpzPIMB1DwjjBnjHDkkVCGi//0hHHBZHukVoDk48XGl/t9WdGb3tCG2+Wr
         E/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=PkBjBhg/8LvRpLHx/oi3wuCsmTcDsJO1SwAP4ojNs/0=;
        b=GyuZid6hS8QVfrc5Hp0bJ/dDUJLGu0vyGqJp6qqbgfhMefC4eXcQnfHSmzztk64WGa
         a34fPz55zwWyO8+UiCliCkEdIkJV55C7/flaWct/WVAPtOm9FQAQPg2zGXT8tZCi2113
         2A/vgpCIcXaK4rSmA8+fWEGDQp2yFvawYwTJW8wout3Zva0RHZbJiBqeUpgvdwRnOqRi
         XpR60UFzsHnjMST3oTTVtI/gUYvsayyoew8SXkxI9WzWovgmnqPJ9i2C6mjAJ0koY+5P
         QDgV98oy/tSNOQkPnSddL78itv1cJfhUT3YVTgN9JeLAFcMa1Q4zh2ZDioGCjUh/NO4p
         FaXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KL5eyl9R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si42482059wmf.76.2019.01.28.08.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 08:24:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KL5eyl9R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go9hf-0007Q3-7X
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 11:24:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9bV-0002TR-Lg
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:17:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1go9bU-0001U2-7Z
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:17:45 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38681)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1go9bT-0001OA-Ou
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 11:17:44 -0500
Received: by mail-pl1-x643.google.com with SMTP id e5so7947482plb.5
	for <qemu-devel@nongnu.org>; Mon, 28 Jan 2019 08:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PkBjBhg/8LvRpLHx/oi3wuCsmTcDsJO1SwAP4ojNs/0=;
	b=KL5eyl9RFhGrJxx+MilByZCH4N3iUTkF/8nMMxgCMsKAkCr5JuoykbBc8mKrFCR4xB
	XkRrk7bpBwQsVEtU9WQkoQ4Q1WqUTOtBbuacwpxd4vbdyfYT+eUtud5jRTmgdjrz9Tg4
	4+IN8ivMRVoLExaYwKg3kS7Y1zNviuLMY8Cgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PkBjBhg/8LvRpLHx/oi3wuCsmTcDsJO1SwAP4ojNs/0=;
	b=VeSpIJltwAZWgtLiq8D0pdh3kFJui1U7MvxtRcPZTClqlqhsEyUAGQbBR3o2CKGoAR
	oSia5932dfJ45n2Q6zv2jeBFvbFCx/RrH/5t/XaD+WP+Ow+OHZaJ7+fwg7utdn/cucBq
	Uhbh9g4FzBOW6/mDZiDXE9X9cI5soz/YVAOFmog4gmIet9qSqowzh1H1LQJo+QtmEY1C
	3EnHWq+vFzaISN+CJ9BR0uG66TAQdWglCYnVdmBvJBS8/zmD7Tl5xQQNDyIbVARKFmNN
	603Sq2A2hhF1RQCH+TX4RbbfbGqH5wh106Ossb95UnFxisWFkMs3LOYGNy/lhBxLJlKH
	Rrew==
X-Gm-Message-State: AJcUukfhoK8PYpC8V3Un2ZuIZHqS4xOKQbu+03q0Yz9xpXuReKfZZExB
	0wAHrL0plvbPQH306v3u62e9Vg==
X-Received: by 2002:a17:902:f64:: with SMTP id
	91mr22326132ply.132.1548692252774; 
	Mon, 28 Jan 2019 08:17:32 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	w128sm44232153pfw.79.2019.01.28.08.17.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 08:17:31 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b1286c90-6cb6-7ec2-4c9a-336f4817548b@linaro.org>
Date: Mon, 28 Jan 2019 08:17:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH 16/23] hw/arm/armsse: Add
 unimplemented-device stubs for PPUs
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
X-TUID: 6okEl9oiQeZ/

On 1/21/19 10:51 AM, Peter Maydell wrote:
> Add unimplemented-device stubs for the various Power Policy Unit
> devices that the SSE-200 has.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h | 11 ++++++++
>  hw/arm/armsse.c         | 58 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


