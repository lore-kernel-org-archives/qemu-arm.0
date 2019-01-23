Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1272547wrt;
        Wed, 23 Jan 2019 15:45:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN44MrdVDGTFzAq5h3dX7bkMbnbpYXL2NSo/NfsafTwrTdaB6Y+xq9DSJwZny98/aaA15ScY
X-Received: by 2002:adf:cc91:: with SMTP id p17mr4821308wrj.118.1548287125402;
        Wed, 23 Jan 2019 15:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548287125; cv=none;
        d=google.com; s=arc-20160816;
        b=yVzd5gFxqXEd6BD5YBE/FijtQKBK8qoz8NwfC9trg+2sbnYa+Y/b+WiPjPiD+zj7MW
         5dlLpBGbXYDXYz5/u5PAfNKMtk2n2YRcOKLj68qp2OYdhJZnH9wDvSJVB7RJgmutejcG
         bx6rkb15PEPzhpBNQlj3UdtVdSZ2TtLpwE/4DIiC7e84+yddiKuDddxJadfpP261gZMR
         TlVxbIuNWv1b2h4SjTDowVh/ThIST64ytt27Ld870YotffLwzmyEoPZ8xcJKT4nGNabW
         XbeotLt1qEleJ02qF6P4CFYZP4ujCKrbifTOrv0hTYCBS+oLhZ4G6bfqOHdjl5I275ZQ
         vPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=KOs72l0Fq4xHuesvp68Lx3whNvAJMxxf/IuKyNhBzRU=;
        b=u6ZGywqXzE4psP+cXgVxv3aw02KVdclWfEKlFzVYGx4D1Fxza/qWdTcLEZti+fiZuK
         7zd45gDNsR6NNwISfrTWdtZSLvsb7r1p2gaEAcVfNlWOUW1/XjjW9CFW0ieMk4MIFpVs
         578Isqm6v/1/etxNaAc0BGK3m3hPwB4yG8/pfUdvKxMalBfvgjso7l/Rsp7C268FMRQJ
         oxA/uWR2E3j4QBTWmtjJOF2aDZb3ZVd/v1cqDLTIMhC+emFc+nS0fDkKM4lsJQPr+6+e
         eG9hps7LhTQo2teTy5q550Ryan19VF0RIWV85Qtiiu40FcC+z+1fUmjm54E8T9Fp2bdR
         IeTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDtibjNr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si29199850wme.192.2019.01.23.15.45.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 15:45:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDtibjNr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmSCy-0007Kl-Ds
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 18:45:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmSCX-0007DK-Ae
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 18:44:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmSCW-00020j-ME
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 18:44:57 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gmSCW-0001zm-FR
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 18:44:56 -0500
Received: by mail-pf1-x441.google.com with SMTP id c73so1967929pfe.13
	for <qemu-devel@nongnu.org>; Wed, 23 Jan 2019 15:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=KOs72l0Fq4xHuesvp68Lx3whNvAJMxxf/IuKyNhBzRU=;
	b=eDtibjNrOplMcA2QM6WlJwlHPJJFXtCOiF+TtDvQZPSUJn2lWdWR5Bw3sJ/f86kXyl
	4JR1FVEWUHldxMAnvdzKGrLt3DJlbqXKixWgPmoAkCjRlebDIhik5FA0CrIfCsal0v+6
	fNaEiXQ+pGzH3kf6L9kL68LqAqTxfE0WrQjhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KOs72l0Fq4xHuesvp68Lx3whNvAJMxxf/IuKyNhBzRU=;
	b=G25eA3ToJAgBLEenOoThVRy1YyFgvJp2Nxpd8U7mOIkdKf6KLZbRfDVCxIIC6QE6PC
	uTXEsveyA5PSJMI1RRkdzTUQfHj4gN52xqmrsiSVCh3JoNEc2zycjE8Y3uppT2cFP1iF
	mbQ5L0IuTjkKjZqlpfhppj9hL8dSpTOnpWV6rb3oPeYZFfawcu4Hy2ed+a1L/P6KoTDU
	/NLq1fk3ZYuc8Qc5ALu3/Q0ycgPv2B/o3qzHbBLTsXqt1kRlSUXUSMn114nyTYrgZMiK
	9dBjKcSz4uqRFwLclyhfRcJujTCJVRSkFq9Z7MjkPedrYg4VBUBfvXgZSA/Xew7Lsi8F
	T1XA==
X-Gm-Message-State: AJcUukc0EdJM5exnoBFdUqm0DzcXAki58TykvpzbhEbz6PxkmMUaC45o
	glDdMdMC/9VCjMsraFLJ+HZGH3mGdGw=
X-Received: by 2002:a62:190e:: with SMTP id 14mr4068595pfz.70.1548287095432;
	Wed, 23 Jan 2019 15:44:55 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	c7sm28187691pfh.18.2019.01.23.15.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 15:44:54 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <33750f3b-3515-5271-986b-126e8986da59@linaro.org>
Date: Wed, 23 Jan 2019 15:44:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 02/23] armv7m: Make cpu object a child of
 the armv7m container
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
X-TUID: 0DDpLCvyHj4i

On 1/21/19 10:50 AM, Peter Maydell wrote:
> Rather than just creating the CPUs with object_new, make them child
> objects of the armv7m container. This will allow the cluster code to
> find the CPUs if an armv7m object is made a child of a cluster object.
> object_new_with_props() will do the parenting for us.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armv7m.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

