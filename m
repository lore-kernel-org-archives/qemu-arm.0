Received: by 10.223.197.9 with SMTP id q9csp745209wrf;
        Thu, 5 Oct 2017 09:48:16 -0700 (PDT)
X-Received: by 10.55.24.73 with SMTP id j70mr28241352qkh.310.1507222096100;
        Thu, 05 Oct 2017 09:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507222096; cv=none;
        d=google.com; s=arc-20160816;
        b=x+NDjCrnWgoP+3Rg+jDnINsgjqMzwxb9eQj3QrxK1z966XBvbFsyeL9ApmnObpMyJ3
         kXuKAXQ1Udcj6UmPREfDWjGne8i3wlQ29oW64xuBZjYi7Vs1DAA00NTLt7n8G+7WaVOm
         myC/zXGildzEDY5TlorFydWRTPRXQS6SaSHP0vk+q44fKuJ3sFiBvddQLgQEylluSL2T
         bgg0sdOLTK/TRT2mIXEZ9i70VTqR5z53KALjxGfUUa2KQhNKON/8i+T5mF+2dBVKJmTf
         BsZy1NRQFvjA7DDBZJuwawFh9diZMpH54v7RcsXQ+vC/zawZxcnrq9NVLgM7bAXMDT9O
         VFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Fm+FsUQwnNdyykN4r5Ur2XoTlqH5IA1Tj/DyCgZxRmE=;
        b=qZ89nyK6L6uj0riTPrp2sepidoKhqAlT21aEF9nDqecRRF9D9sjk9InfSm+iVvaTno
         g94X1p4Jbnl3bE3zlwXB6XO2oq3P/K1zCot51qcNqokmifyW8ahFtSMOz4L0q78Zmlc4
         KhLGHpcS+qQYSZN00bLelEqNF00X0V1k6RApydwA1lDvimgAOoEQxBrK825F7hCprcio
         NbV58QhLYYBrSGx5Iqgnzs3weEhnikvBmhqDFbMgSzPoJZTBJilfyyWASfH4rUbaSuti
         XblsRDopJVg0FLfADqiNvTEDRDXSedIh/bMIuogeX4ehK176i9VSs8ozdrKuwbrGoTX1
         0fcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bTCAp8g9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h33si2147634qtk.307.2017.10.05.09.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 09:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bTCAp8g9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e09Jn-00063B-IR
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 12:48:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e09BC-0006jd-Qw
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:39:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e09BC-0001Pc-4W
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:39:22 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:51301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e09BB-0001P9-VR
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 12:39:22 -0400
Received: by mail-qt0-x235.google.com with SMTP id q4so26502985qtq.8
	for <qemu-arm@nongnu.org>; Thu, 05 Oct 2017 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Fm+FsUQwnNdyykN4r5Ur2XoTlqH5IA1Tj/DyCgZxRmE=;
	b=bTCAp8g9U4xqrEdhJhSQgJodCJd0SqjlDq02R+1tO1HO75DNFaeRDetGy7Em4DbT9a
	spUArfTgE1Lh1mF8wBiIniqpcwG3zEqNmhDb8TMDe03YGS7ml0UxTYn8jv22g2V+FtWS
	3nve7GmR8DPNDRECJtQ/3dEBc7+cQ6c+/SpZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Fm+FsUQwnNdyykN4r5Ur2XoTlqH5IA1Tj/DyCgZxRmE=;
	b=AS82hPcO6X50wPdAt4aA+jqVQKUzSPlHLKOS+C5K1xPEjeEVmJgqRCYPG7Iy9xiV9P
	AiqS8ZxRqhzoOCUruobLhXpEzUNAjb4uJpEpxdDmZXLQC8ZHTtkEZ6xHmP6yZhOcm05N
	0RkcT00DWX1MI4FSc/VwKthXmlEa22vzUUfc+4Tf70jA/ROMujlWA2glmXuR9cBLJXQO
	zPw9WqpUfIxMdsyXkY6W0k2NfTd5x/yx/R9Hi/CDS5WU+dVHaq4K5QTwaK99qQHxONBB
	nw0qxXwqEE7Lx7YhJkVBBo0NW9o/RgjNVjoH3IZruxjaOWVyhK3jhKu35NOMkL36UmVJ
	ovJw==
X-Gm-Message-State: AMCzsaVF+DvUtUp8IjvY6vcw3J9gKxbMzgS/zbN0u+mhApvPJMLoiAiq
	JeA5rtZJ827QcSgs6FrAsn0scQ==
X-Google-Smtp-Source: AOwi7QAB5mVQcYYHY2ykD7QE/HiGqDrUtrEykZ4JLN8fVpWmJkx44dmLj5I4vzSozzOjjwbPjUBJCA==
X-Received: by 10.37.21.133 with SMTP id 127mr7047305ybv.265.1507221561336;
	Thu, 05 Oct 2017 09:39:21 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	g204sm3537678ywb.7.2017.10.05.09.39.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:39:20 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-10-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd1549b3-a381-e75f-3d16-cad584f5ee17@linaro.org>
Date: Thu, 5 Oct 2017 12:39:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/20] target/arm: Add
 new-in-v8M SFSR and SFAR
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
X-TUID: xDdelAlzl919

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> Add the new M profile Secure Fault Status Register
> and Secure Fault Address Register.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 12 ++++++++++++
>  hw/intc/armv7m_nvic.c | 34 ++++++++++++++++++++++++++++++++++
>  target/arm/machine.c  |  2 ++
>  3 files changed, 48 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

