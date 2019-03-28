Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp987570wrx;
        Thu, 28 Mar 2019 12:14:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw64ugnPObn+TZL9CjH8RjDHB4XN5Gyo9kGXLkEPVEL704f2+30Y1YVcUPL0Att3Pbevnyk
X-Received: by 2002:a02:1306:: with SMTP id 6mr30285068jaz.124.1553800488177;
        Thu, 28 Mar 2019 12:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553800488; cv=none;
        d=google.com; s=arc-20160816;
        b=z5buktCQmbXwCnPj55Zg2lF/ox1g24oGT7mGATGvbYwUPL57rT11PI0SRySd3uRDkX
         2WxP70B2Rwear2LuDYS9+Djjn1gQmQDJJqvERuWEPDK3CbsLihziLO6cMdKULxbWV2AJ
         R4uz8KLf1YOQoUQ/6K6bSQCN8OE4so7bmmQWMeqRhYCDMrP2SflPya6usCzWEIlzsukJ
         7/q+be3JsOEGzuwHWEq27/7FX6Gqnynz7fSO5VTqbt1x0hSWTnmJOKvXXgyVXv/kKejW
         ndm2HeIUFFBik3X9XKMuLUKGPEr53OfuSu4fXofVpEwfwM91x2wPspr+89NdhmCCTEbT
         z4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=EZ1627dGVx4SjsHIJ5lLB++IMuZtN2ZUbs/HF9l1Z4g=;
        b=OJp6P+F2BqlS5qP3he2yhWOfjoSxOSzw/dz9CF7X3OnBjJae9cfgly57N8b7ZTK9+B
         EDixqmgBzfIZEBkoimq4IT/t6bVF37RJiRU32ZwuTsEgov7mIiH6icU4csJy5C2+LOqF
         VrC3RDyUunni6zstTVHTJNSKDkW9WwOBe9HEemnM3EuCOcgnLTJSlX4W/PSzpEHLFkJg
         rwUyUDHcbEJ9/kWEhWnIfoSOuqRdF0+CAVqzCXfK/6kkZD1D9anyr5U7EzWfs899fcuf
         51Gs/4mIeh164shk8mqv+WPMwnRc4hXk8fx4+YNpVL1IqioJV6M+3eRTR8oIAR6+abzb
         4ocA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vvw/2Sb0";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y35si2218509ita.127.2019.03.28.12.14.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 12:14:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vvw/2Sb0";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:40980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9aUB-00011H-Fo
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 15:14:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h9aTi-00010p-Pl
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 15:14:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h9aTh-0005ye-VH
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 15:14:18 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44374)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h9aTg-0005xA-Ew
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 15:14:17 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y13so5666897pfm.11
	for <qemu-devel@nongnu.org>; Thu, 28 Mar 2019 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EZ1627dGVx4SjsHIJ5lLB++IMuZtN2ZUbs/HF9l1Z4g=;
	b=vvw/2Sb0x3O9Z3IqTHWyefnVs6aJ7iD3KL2oi0+noBSwUUUfCLed57fjn8iFZp4nt6
	pk3sGzhaUOtd12lvqUdLvw7V6a2/d2dCrHl0mMdgFRRAuQKG9+ZGBRYAoyTUKimkX3v2
	4m6IldGlN4rznarRi7I15mnjR1mtu/YsVSjuT/7xMd1Sl21B6d0tVB5qbJPEPPgZpBco
	tjAshIvLx7uY8wv4VdzqENt9LI53updXJAmAyflm2g1pDKtM10qpkTgudkBYn3Unnoe3
	RnjNh2CkTlnY0MzJHgbuUqC12WEGlVRokr/o/BXe9VrFuO5a5BGws13fAppLm+fSErhb
	+uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EZ1627dGVx4SjsHIJ5lLB++IMuZtN2ZUbs/HF9l1Z4g=;
	b=IzDs+2U60jO6mWu1inrOhxTFyzPVTqfF5EOCTYDjOvFJpyv/Ww0hdmzbeFHTB03sbn
	K17Hl86J0F6Ld/4J1XjopeFP+7H7Cd9FP3X9Nm4iEgZFg1BZSJT2PhSq5dSdCkz0HQq6
	0M8LXnZM2ZI/lElBvdGQqx2Av4ivXWgfQdu2g7CYtEBHJ922Wxj0Is+LQpZlD25GMG88
	i1QXxKeoh2qUA4MTkJIW7ifKd+hWm52uQw/Ki0Xl93lakmLyJ3sddYREU/04e/uSuPj+
	X8LUG+YPqU7wwhv92UG8nxnu3OlXCQt9283e7OMXREZ3FkAQxxQaDk9UhNHSazSZv29k
	T1Lw==
X-Gm-Message-State: APjAAAUrMDHhiuaDw+KbX5KH0D/bm1zh7ThoF/E4OwfR2qG5w5W26c4y
	4Juzc2LX3xLNNC90gUVF2ltbMA==
X-Received: by 2002:a62:5797:: with SMTP id i23mr42674121pfj.12.1553800454236; 
	Thu, 28 Mar 2019 12:14:14 -0700 (PDT)
Received: from [192.168.3.43] (cpe-66-75-72-255.hawaii.res.rr.com.
	[66.75.72.255]) by smtp.gmail.com with ESMTPSA id
	l64sm20696249pfj.173.2019.03.28.12.14.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 12:14:13 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190328143003.16702-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <121a87be-4322-399b-4d5e-c4fb8580794c@linaro.org>
Date: Thu, 28 Mar 2019 12:14:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190328143003.16702-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::42b
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Stop using variable
 length array in dc_zva
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
X-TUID: Ntv/Qwi+rmgn

On 3/28/19 7:30 AM, Peter Maydell wrote:
> -        void *hostaddr[maxidx];
> +        void *hostaddr[DIV_ROUND_UP(2 * KiB, 1 << TARGET_PAGE_BITS_MIN)];

A very fancy way of writing "2".

>          int try, i;
>          unsigned mmu_idx = cpu_mmu_index(env, false);
>          TCGMemOpIdx oi = make_memop_idx(MO_UB, mmu_idx);
>  
> +        assert(maxidx <= sizeof(hostaddr));

ARRAY_SIZE(hostaddr).


r~
