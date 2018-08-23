Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1438433wrd;
        Thu, 23 Aug 2018 10:49:20 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPztEexcAwCO1TiSanx14d+mSNp1w8XRrumG+29sWWxU2HbIrdqyzkHQjX+oMVMS8o35oM+x
X-Received: by 2002:a37:5c81:: with SMTP id q123-v6mr54719548qkb.8.1535046560873;
        Thu, 23 Aug 2018 10:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535046560; cv=none;
        d=google.com; s=arc-20160816;
        b=zvvGc+X2eLZGBBjtQp7dhJdObK34LJJQstPDwS3iBGkRqz90KQbJZlpMs/jygX23qA
         wsoDbhw/rREj7lp8INrKpcBcjtnIhZ/qpU7pux++PFgfa4tqypA6TOlQEmvRApihD01D
         nOpnNUsG3Owc7dLwtB/hTS1TVeq/Ih4N+hhRVq3j2GH3/p1vEaqCDCQ781SFUi1UW1mM
         1DGNxaKlNqecNx/rQ5wZm9bFVsUJeJ5w5oco6onOJY0kTus2Fx9pZKIbgqGM6OwAysX6
         oKgmYAihEx0xJ8rV8jKEVfdMroPKr95iv/XdcehZgnxAzfiU5LDp1Dpz1pUMtQEPPA6q
         MW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=qao5Qb2lwktGofjmqUIl1FOAcH+Wajy4ln/Vf48Z60o=;
        b=vRw70T/oL7mfLutomqksQ4Jk4B49tYd9fRqlD4OORjZz5RVK6Xgb8iDL8Wf8z2EKHj
         l3cTwuwQwSPfoQClFbvRVfxT+Y3OPYtq/SkW72nNguKEFe3mDaOZqbMHhs9qnl42jf0W
         UFiNmH+h4d9zgUskJ1RGcQQ99Ggebm28iNI+ZQWbnSunhWaU1sn6ldi6hC1eTqxJkPVX
         dfOQS9GuozFFCA57vubmyTw2edJEr9h07i1jK4qFetH3bKFuNPdqER/aDLkDzQQFU4Ju
         jvQKgLwO+B281AUtdGl5uvj7Nr9RgKTSovel6IuM4jT0Pf6iVC5ZjT6JkXojNCxGIh6g
         pKjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dLZm/iwZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c10-v6si5118173qvc.108.2018.08.23.10.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="dLZm/iwZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstjU-0000l1-7a
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:49:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstUJ-0000kX-3j
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstUE-0005BZ-0Z
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:33:39 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34914)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstUD-0005B0-Nh
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 13:33:33 -0400
Received: by mail-pg1-x542.google.com with SMTP id z4-v6so2971577pgv.2
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 10:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qao5Qb2lwktGofjmqUIl1FOAcH+Wajy4ln/Vf48Z60o=;
	b=dLZm/iwZd+Gj3B0rMXvjCfcOknjaPE4gnZ0IrPpbi0L6GRR2Vn76OXhXg9TRrLC1gS
	cJUMme0cdND4vjgKmKHz5zSZ1wTXpYmhIst4SaXBr93jInDaQtVLQ4rQrxksRftCpJsM
	GewwBML3ua6ZOEEGsUdPtYiynt8Da8Ddtu49g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qao5Qb2lwktGofjmqUIl1FOAcH+Wajy4ln/Vf48Z60o=;
	b=TJmDIAxB/qESrAM+qoo/qmnx6WBo15ZO7QMgmNGlReROPShNBPNNJ2KhAWCWtvh5MN
	vqP4UvcZEV3Ey/W4oc+nTyloJBxziDg8g7mEe7202XNWdFyN3vp+24ZpURVarUz9RBOu
	Tis12xSg1CgrQ0iUi51t9GRHY9Kdki9CBPlmIWRRfV+XfdoD9K3zjnw3KzcPNL0IxK7/
	Dqndrn353Q/KUlpcXf+aofaS9+AvlNROADgJBb0wKeLTRV7EFGsp9mS4hWKafAQeKgxY
	x2RSppDhZo2G7NT4ECSdxeAtTnrNjm5lG1hsNpJrW9rYfpU+Tc98IQhLAOqF2zp1aBAW
	o4Wg==
X-Gm-Message-State: APzg51B/ipFzBRVXPfZXwS4Z2eyRVkb7ydaanlMBGrn/neFP62pBLEjs
	9D2ubY8SgJn+GH10w+wfHFtFqQ==
X-Received: by 2002:a17:902:b03:: with SMTP id
	3-v6mr5809494plq.277.1535045612846; 
	Thu, 23 Aug 2018 10:33:32 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	l27-v6sm10727597pfi.180.2018.08.23.10.33.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:33:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <25543a01-8243-1389-3650-d3bd03fa16b5@linaro.org>
Date: Thu, 23 Aug 2018 10:33:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 19/22] hw/ssi/pl022: Correct
 wrong value for PL022_INT_RT
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
X-TUID: z4wcCuf9Eak/

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> The PL022 interrupt registers have bits allocated as:
>  0: ROR (receive overrun)
>  1: RT (receive timeout)
>  2: RX (receive FIFO half full or less)
>  3: TX (transmit FIFO half full or less)
> 
> A cut and paste error meant we had the wrong value for
> the PL022_INT_RT constant. This bug doesn't affect device
> behaviour, because we don't implmenet the receive timeout

implement.

> feature and so never set that interrupt bit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ssi/pl022.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
