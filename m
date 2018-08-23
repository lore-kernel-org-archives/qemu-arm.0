Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1442496wrd;
        Thu, 23 Aug 2018 10:54:09 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYUp1LbpuecCj5UU5dCO8M0VFcyXpfo/RRbnECClZbued6siqMBlxjwYhxQemYGBQ0WLsnW
X-Received: by 2002:a0c:885b:: with SMTP id 27-v6mr21173356qvm.115.1535046849213;
        Thu, 23 Aug 2018 10:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535046849; cv=none;
        d=google.com; s=arc-20160816;
        b=vyDZTW5cWBLBd2UNIWm0fpjsbuGJH57id19uXGAC6tiOrqVxfwzQrLCCoRUeeElnhk
         FrLRFo4FLNR8tJujzOH5Y1xZ7/gHfuoQQdl4GlGg8oA3x+vJCSUTvRN6H4/OKwLtygOa
         3g6A4ZDfO0UZc/1VEsVESrBqFurOn4a6lI6Ijuropvp6iWBo3nWKWrBAVDxkjB7Kb8tY
         QTswc4MSGXwfvjPPXRiqSB11ZOzlY9HUBrt6QdmSVdu7LU2D8hBx3LU4TE8dUdP2iDGW
         TsEtlIw4TQ1LPjeyAjJ9jdVSwRx8Gao9vQpZN5P8LhkztjCyFejOYhpuzN3zosMShFjV
         p8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=F/kK2ffLZ8n5XfUYO+Sc3mMLRxPoeCxhf6MFrNZJmHo=;
        b=Pm5BMhrUe/M3qxQKi6OCyzeMPFTWXPjS+QelSXTzIcQYvHjjnMRlL93KRcbgwavpWO
         6RhPS4dk70t11BrwpTxKjIOZ4tmJyTv+ezF8s/WqpqfS34RCPvLPWfF+O+M/Eda2pOa0
         8KnVGmAgvuoX5Bj69fW/Lxmqal+PIjuzseEsCRjL2lai2oCy2/coMJBUB8Nff5v25x8Y
         5kHvjfcRa1wqAvXUVRm5f6nX0ciTcTsd4mScVYsRg2OCOIR95Cuun2NHjdgjYUiqCyY9
         woIFKslnAQnAHOGxWUxy0hA5OUFJ7uEspRY+g5cm/xTJvNU9zsy2OC2KvYSWaJs9haxo
         Enlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CcKI2P61;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i15-v6si3294570qvf.119.2018.08.23.10.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CcKI2P61;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsto8-0005LH-M3
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:54:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstRc-000440-Ml
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstRX-0003Nh-Lx
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:30:52 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstRX-0003MT-DV
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:30:47 -0400
Received: by mail-pg1-x541.google.com with SMTP id h8-v6so2962433pgs.4
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 10:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=F/kK2ffLZ8n5XfUYO+Sc3mMLRxPoeCxhf6MFrNZJmHo=;
	b=CcKI2P61A7nfvsGas/Bq1NMPH8pvepITCN/wdnNP2PtZHylmaOKs4COLrZWqxanNSH
	gO1HoaDaxUh17P/sz6nTBS+gc7iv/Io5xdJTt6GQppbb3qvn9PPYu3DispmnFxzMt9qV
	UsWCkDuPyd5zsFdawFEvOYAphJnksDRhAfn1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=F/kK2ffLZ8n5XfUYO+Sc3mMLRxPoeCxhf6MFrNZJmHo=;
	b=NHVq7LWv/PolbmwtEBsiHNXm4oep6mk8W/7fkX4DYpREx5gCj5IRZX/PfyQFHjdJtD
	hzQL9aiDfDDeFIqt67CyNbb+Yx5hj5/iIERWWkX7VQpPrvN2IhJqx+QGV5NQWlODmD0S
	e5APxjwBMQ4wTTGzvKpdKohFXx28VzQ3pCCbcqdh+UcssOEeR2LWMu/SBz99HtyKk6kL
	zK7h7rDbTEqq/0ScGnz9CAexKoDgVsRaIAkZKM67IkWM+m2v5MBKtwxPmgqKYqckdUng
	hOIKXf4k5jgfNJ/UV3YtO7T9WGy4G4FtaHsYFSC3ObWXKVnZEvwS9MCBYbCuqs+2Zm+R
	tqSA==
X-Gm-Message-State: AOUpUlEhc4TsYjUaRUWywngo0hpzGF/SKsP3P4PgOB6g27plpMO2vMHQ
	IALnsQnzFG8Wbu4BuBM8dlzF8Q==
X-Received: by 2002:a62:8acd:: with SMTP id
	o74-v6mr63855810pfk.12.1535045446629; 
	Thu, 23 Aug 2018 10:30:46 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	t19-v6sm7494593pfk.182.2018.08.23.10.30.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:30:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cf28bb5e-d391-521d-738f-e72d9a80c37a@linaro.org>
Date: Thu, 23 Aug 2018 10:30:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH 17/22] hw/ssi/pl022: Don't directly call
 vmstate_register()
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CouAnUy7YFET

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> Use the DeviceState vmsd pointer rather than calling vmstate_register()
> directly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/ssi/pl022.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

