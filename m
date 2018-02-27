Received: by 10.28.71.27 with SMTP id u27csp5348654wma;
        Tue, 27 Feb 2018 14:50:26 -0800 (PST)
X-Google-Smtp-Source: AG47ELs8U4AhQrucCi5nopZZL3H0w7z1yl3o1zcWCAC1tisu3I82eH7AcTuGvYQt6GRupQmiHkTP
X-Received: by 2002:a25:8142:: with SMTP id j2-v6mr10983556ybm.176.1519771825964;
        Tue, 27 Feb 2018 14:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519771825; cv=none;
        d=google.com; s=arc-20160816;
        b=0NFj68VSHzgja0ZhbQ4o7sJ4Rv36LjF5RlAaRwLDVogtx63aDkMxE/LRapRJPEftNc
         dwa4Cz6i2ewKoia2v3u/ypo6W8hhJCIxroSRPPMboCIC0c/DJblc4h9vJJKpDCxXebVu
         V8I9y8FsJPRLxRqMCYIf1LRX34F0G5FN3L9EKdrG6PkgyArtBegfyNFi1mWIBb+EeV2n
         7mKfgPpCad1E06HNU4Xe/cf7Xb9PeXd9hE5EJRBF/MQGhvdUn3XgnZQ5VHZ1Hxx0h0TL
         SkDv33bK1sluQIgjXIe7gYBbyi5F3VSFAMC7cSmApeMvKh92cc1Ohk3qi2MFjUroA++i
         GMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=qKY1FmcnntQTMrOJFycARAZSc+F6YlijGYxIWT6rcYo=;
        b=OU8zEf+yiN9W2P7PGucCW+DdigGb4upmU3imZ/lNtAJn/6EGpWohkB1WuT/6dMhFDy
         RdjlK25D2jVyiU/Hz2Pog5kxLZrxL2dGqzHsCTszhZjX3tXASfjCyuwHbL5iDov3EcrL
         UMUy4iPwSSuT1rBhfPrr6qGlnfXieezyY+U4oE/fMrLTcIT+8W7fTsZmgowSlgMVOg5i
         YxLveKeORlQn11e/3U56v8P7tmV+5iSK2/ov1fTchwUGDDsc9Xypb3c3ppInX1rB+pZW
         NvyaVZNRxYDYq7FXk4crmcOmCCgkU3l5s8Ervic3Pc+ipOgxS8vFHj4PwUzBaYP40Isf
         wtHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bKd1et1I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si37471ybk.372.2018.02.27.14.50.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 14:50:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bKd1et1I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqo4n-0006wE-Dh
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 17:50:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqo4b-0006tJ-8k
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:50:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqo4W-0004E1-9E
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:50:13 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:40058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqo4W-0004Dd-2y
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 17:50:08 -0500
Received: by mail-pl0-x244.google.com with SMTP id i6-v6so291606plt.7
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 14:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qKY1FmcnntQTMrOJFycARAZSc+F6YlijGYxIWT6rcYo=;
	b=bKd1et1I1yhMZ/JiatfvD61uJGdV9Ffv+MWRTcAu8jpZ+eXIWWgsGdZBC38aApk8ve
	TFQwq5XGwS3Oi8KZJZKdmsv7SEyFHpeSL9YuyB7pvdix+jGnaFh/Hw5x3eXJBn0YVx13
	vMOog0yQCqiX5Vc0IxRcKhYNtdFssK3DSR5oQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qKY1FmcnntQTMrOJFycARAZSc+F6YlijGYxIWT6rcYo=;
	b=r5BjrRrfXnZMjePiO9AwcYD413WCi5j6lqEBxDMhEyzZCqZ2emNp6Svw+qNZx9Umza
	SkgA1Gmb8Ix1lU4Er4G/e12ZjJphHwj/aW1wdBGUhC9zMgUjKda86LK2bB2C1GQ342M+
	zT2T+M2CcM8M+xdYrxFH0zLB2eQJ0gP/xXuGB1lZ1D7cOb4jnTF8uVB8srUEgXLSKoRr
	uDne1tbLvTDa104EbXN8j0nbxBAZftsMpsbVUb6wW+srPa/oCVqIT5ZC0brzjb7E0kTf
	ffxRL6UIp/1e196B4OnWK8bBHkO21LRJ1+ZcAt4qQdxomygi0vEl59XjusfKpDFUZ6TN
	HlYw==
X-Gm-Message-State: APf1xPCe9PWsaOi4oDKFs4qzRTjR40XhuBC7zmMSuap9PPSGAHOvOmmk
	7R5+fCpAz0GETeyrxgw7Ex6olA==
X-Received: by 2002:a17:902:887:: with SMTP id
	7-v6mr8094744pll.89.1519771806934; 
	Tue, 27 Feb 2018 14:50:06 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id v1sm172164pgt.62.2018.02.27.14.50.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 14:50:06 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <50272633-16d0-7e63-4ca2-1402f0449989@linaro.org>
Date: Tue, 27 Feb 2018 14:50:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 19/19] mps2-an505: New board
 model: MPS2 with AN505 Cortex-M33 FPGA image
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
X-TUID: HOVXGUHeDdMK

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Define a new board model for the MPS2 with an AN505 FPGA image
> containing a Cortex-M33. Since the FPGA images for TrustZone
> cores (AN505, and the similar AN519 for Cortex-M23) have a
> significantly different layout of devices to the non-TrustZone
> images, we use a new source file rather than shoehorning them
> into the existing mps2.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/Makefile.objs |   1 +
>  hw/arm/mps2-tz.c     | 504 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 505 insertions(+)
>  create mode 100644 hw/arm/mps2-tz.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

