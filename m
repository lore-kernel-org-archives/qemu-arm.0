Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1522577wrx;
        Sun, 17 Feb 2019 10:03:17 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYiCsh/6Mup4QtLgsHKSd0MmYXXjHuNeK0MD0e8DfPi6UHOGqoKSWwTXgSCQpjJVYXsPTi+
X-Received: by 2002:a81:5d8:: with SMTP id 207mr15534692ywf.197.1550426597492;
        Sun, 17 Feb 2019 10:03:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550426597; cv=none;
        d=google.com; s=arc-20160816;
        b=yuZd9CKXftuR7zjKXJQGxPCV4NrHmUNcmEsyJTW0mtIEEZ4SIyOzCyaT/Sn+ONx0GA
         O2pFjre1Q9hP3ghkrLJBcGCP++auf5hqgFzQYNvGRPNoGnjutfsjCea9OuDOHIMdkp3U
         5yl3hZ7ftTmubglkDuklSP1E/WUtJUWV5SI4q7bfpwU3QCI+0ssE+rD3CzVzqAmhNTFk
         iA89y3UB3pgZhOAknSUVkWDTiR3qXyvJGjyCCXLM8m12vgvHODsh8E3aJNgltX8ZpWWw
         eElhxMUG7oBRJAAHCJVjkVIxl3EPxh8HofuaZB0ANAEX7zyIMQPWhCfseeenTwjYitBY
         4adw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=ePsI+8aktUfeg5Rs+/Rf67i9hRN3LzGDiAI/xVSpxBg=;
        b=VbK/kkj/gmTXjik8dv09T4+tOtbNdGQXuDLiuKBnwOUprl+yncQnPsXKUQeGsP/4ge
         jWublF4zRB+KCTdLpx53zTuvyWzjLluGrib9v3tnP3iRGOhiTcmEsOUgWHpPjGCUobzr
         Y8cfKDo84qu7eCMf+oeuE7PQIPDLuwsk1UsTUAWXcp3JT1UlpuWCf+qt1avsgZXW++00
         TXBVmWAUytMpwBXeSEs55KaAs02uOcFnYRVKtONR81nWOuzFrh/bHpt4wnhUlYkS7F51
         wqvy1XygHAGh9YafjeLUU4tdVTZsvwkiKWOEv+8ULvsZaZUGLJtT9soBKNLPwiz3ZxCy
         gSHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ol46Jfep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si6078538ybb.174.2019.02.17.10.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Feb 2019 10:03:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ol46Jfep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvQma-00010O-Vg
	for alex.bennee@linaro.org; Sun, 17 Feb 2019 13:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQmQ-0000zL-8P
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:03:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gvQmP-00074c-Ip
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:03:06 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:32855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gvQmP-00074A-7q
	for qemu-arm@nongnu.org; Sun, 17 Feb 2019 13:03:05 -0500
Received: by mail-pg1-x541.google.com with SMTP id h11so4912510pgl.0
	for <qemu-arm@nongnu.org>; Sun, 17 Feb 2019 10:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ePsI+8aktUfeg5Rs+/Rf67i9hRN3LzGDiAI/xVSpxBg=;
	b=Ol46JfepA8fcagp52fNQMl0VX8tt+OmnoeROtODv2trZBX7W37DjqbnEy3RS/Ke6tE
	9twSn3fxX4ALTo6mTGGyaA0WCl+FPWF+O8JXzDbfO13RnRRwBPvCWD6+O9HyXXKTfUbw
	tFmgEXYmQ4jpX7aMyArUNXnFNLOclxG9tFBkSOzKfgNT8dVxbCrLXlTL2iNwd6VrVg72
	z5pDyF8FWFhU8HbkAWgVaM8sEq6p/NgE+PdtU1Utz4sN3G8auiAZW1N8KHcUZc208iwO
	iiYIuDd/uR4zFwBUuFijzLztIjnoA7IqK/kQJh06tW296J4CyqK3gucyZTxAJuX+gqKs
	RN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ePsI+8aktUfeg5Rs+/Rf67i9hRN3LzGDiAI/xVSpxBg=;
	b=PJKrMXFgIhzB5FnpL+w3DGUhLwGHdVPZHu/NzzLRtNj7aneQR2pqPTn3Hspmoj42of
	IbfvITAADvkGalNkK072pnXMzxOuhwEl9X5u8Q7ACjez9RfgVaYHqqmSU72AF3H98cb5
	PL3O4A8QKsKgkDchtePZlVKnDdQYaKUOq1uoYdFn6xgoXTrpML0C+mEZ89Oh1PdRJ7XT
	nyaxQBySUMx1sWcuOnR/a07WrPJJxaRU9CCNOBL4RcN6MxGXc9TfhQSZ+7cKE/4zIgPo
	3OF4vKgSubLhkTtWuR+ZPfYwIOCIlzh1/oyvw6Z0J7dX7JmLaHPv4oBv0L1kAmFpzxbj
	79vw==
X-Gm-Message-State: AHQUAuZgDy/CuEbwJOS2aPgVvEocTEw62kmL5E/OsGNoO/k0xvSB6K1i
	/w44WkoW4VQqItspK8G7SGi7sQ==
X-Received: by 2002:a62:9359:: with SMTP id b86mr20165545pfe.161.1550426584138;
	Sun, 17 Feb 2019 10:03:04 -0800 (PST)
Received: from cloudburst.twiddle.net ([47.39.62.139])
	by smtp.gmail.com with ESMTPSA id o2sm8379002pgq.29.2019.02.17.10.03.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Feb 2019 10:03:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <78c3ece6-248d-4cac-467c-7a4b45d4bb18@linaro.org>
Date: Sun, 17 Feb 2019 10:03:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/14] hw/arm/armsse: Allow
 boards to specify init-svtor
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
X-TUID: zWZSSkQCy654

On 2/14/19 4:51 AM, Peter Maydell wrote:
> The Musca boards have DAPLink firmware that sets the initial
> secure VTOR value (the location of the vector table) differently
> depending on the boot mode (from flash, from RAM, etc). Export
> the init-svtor as a QOM property of the ARMSSE object so that
> the board can change it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armsse.h | 3 +++
>  hw/arm/armsse.c         | 8 ++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

