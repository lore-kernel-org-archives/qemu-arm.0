Received: by 10.223.150.237 with SMTP id u100csp3766099wrb;
        Fri, 10 Nov 2017 05:35:38 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZX+qa54nZxt1yVa4gVFHa6sxMBp+4I4WfRw0GG6oxfjsP1th/9sULU0xzIx3NUMFCOck6y
X-Received: by 10.37.162.129 with SMTP id c1mr245717ybi.419.1510320938878;
        Fri, 10 Nov 2017 05:35:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510320938; cv=none;
        d=google.com; s=arc-20160816;
        b=PX4lGkCZ6twy6TXrvUFIBsazFHe/ZrnhOdtHJF+Mkk7e/U7SZx2kCENr8OLXJLNAn0
         8NUvOD1wynOBMAo2YxzxCTK3ZrmRPWkCuWzuYwkKVWHtqrK876pvibL/oMShgD11+dwv
         orY3OkwDsZ/CBNCkZ4E94SJEizMTa166Qf7HTCDtCIkW0RuVLCYe4VjYzpaZEzDhyXl6
         N0LovbbI0ZPtlz1tpvscgqcEjYHUhNBARNeuHaaWS7bkR8k040XV9wXENbLN8n+kHefq
         reXPbnL0FKnylIPP+YS0Mdnak2kMy0jorM7ZVOBtYXMhxJvjC7xrSWflj7Rvp8CVADQ5
         q0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=TIkll7NasPem3yxhKV6qwpsiyXMWhedHNd9UOBO0fow=;
        b=pUYitx9DxcxD+BUOCwRGf2kuV26YHWxuoMOa5Baw3lj8Z8SXpRjGiM6hJtsE596Hhb
         0glcyKPkrkZ4nTgv+80XSmpA5xf3VQCRgJFhTK6ds9aw71n1nrTUd2SLSilfpTr2nvU1
         BXpPDJsegeOovksxOI9EbBp9PF1QKbDwZW9JiCLMKpVTaCp/yFXa8CePT4UEHvPB3Rrv
         MkeLwczgjNBr6bJBnRmUG6+3CeQNhCV6wDG5ZcqARs7EBW16nkHPXFSvCrZ5F8nLYYva
         9wPdVJISRMUrbxNVHzjNzu2xY0/HUrBNYm8K7QREOQlBFtUT5RGdlmfNII2eQ8ZsnRS0
         9I7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YeH47eUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x131si1033861ybg.660.2017.11.10.05.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 05:35:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YeH47eUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eD9T8-0008L2-B3
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 08:35:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eD9Sz-0008Ir-4h
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 08:35:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eD9St-00080G-B5
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 08:35:29 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:56634)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eD9Ss-0007zI-Ro; Fri, 10 Nov 2017 08:35:23 -0500
Received: by mail-qk0-x242.google.com with SMTP id 2so11065318qkg.13;
	Fri, 10 Nov 2017 05:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TIkll7NasPem3yxhKV6qwpsiyXMWhedHNd9UOBO0fow=;
	b=YeH47eUPF7qviXxpA9OBWfcnVbyW3r+4PpHXamsOlHlSwA2oXLe7/+EgzoTVA886tH
	O62D63ahKPMMFgEnDIbcKEAmeldolseI5FNMS67V3rbyfgM8le34uW3IM9evpOb1CS46
	rAQKsi01ZvyK+Mp5jd/x/h2CMvhDrEZyMyf7ddLCeQGrq3KfxZP0ID9OhIgklmorBmAC
	LIjmT7EQ7WfM6Gl7kWuzm5+KETeYB2x7KRr3XZXRQHKD/AIcVn2vR4sdJRRsLXr+59/u
	GcOIiEQlCiRS0Lo2kuHnU9q4al+jE1GzzR1N+2TQhAyg1bKRhwc3y7XiUZbyP7wYXlgT
	yNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=TIkll7NasPem3yxhKV6qwpsiyXMWhedHNd9UOBO0fow=;
	b=l1EVIVGmui18E9sDwtk4U+BKtpcXONiEm+U8tLFFfUleb/NBMQCywXfU+qs8f8xZJJ
	5rL95DD0EnZZpVx0et4Jpng3+/iz4o/mKccKkSGbOK1ePlhxvHSFrmGibXHrtNiUNL3h
	BCH+jR4RY9s+fhPLnCYI+J9+Kev+NpN4RUxuvMkBH5cof6nu1VTRDuAFlrTerVnuSF1Q
	F8pLjFOEUvTkC7s0e2Tl6UkcpBs2g6dm6gx+C1HRLOkiai2ULdAvOMW/XoPeu8nmTG+M
	WnA+VK7ZlpVlT6PURdemlKFypPoxN2PWWzT8bfH8h684XMZ2azB5TxEXgomgkejl8IBe
	RYVQ==
X-Gm-Message-State: AJaThX4I4WVR1+ChMsRprYRlccBYXiNnGBLPxiCYHhEM8OAnJMlZ4TFP
	y4uie/1buL172+mdf1gzi6w=
X-Received: by 10.55.5.210 with SMTP id 201mr550664qkf.151.1510320922271;
	Fri, 10 Nov 2017 05:35:22 -0800 (PST)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	f63sm6192784qkj.78.2017.11.10.05.35.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 05:35:21 -0800 (PST)
To: P J P <ppandit@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
	Moguofang <moguofang@huawei.com>
References: <20171109115814.28232-1-ppandit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7441e865-c6d7-7fbf-3175-63ebdf7291e7@amsat.org>
Date: Fri, 10 Nov 2017 10:35:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171109115814.28232-1-ppandit@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH] highbank: validate register offset before
 access
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Prasad J Pandit <pjp@fedoraproject.org>,
	Shawn Guo <shawn.guo@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XuAs2e6FSVpv

Hi Prasad, Moguofang.

On 11/09/2017 08:58 AM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> An 'offset' parameter sent to highbank register r/w functions
> could be greater than number(NUM_REGS=0x200) of hb registers,
> leading to an OOB access issue. Add check to avoid it.
> 
> Reported-by: Moguofang (Dennis mo) <moguofang@huawei.com>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/arm/highbank.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index 354c6b25a8..94df151454 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -117,6 +117,9 @@ static void hb_regs_write(void *opaque, hwaddr offset,
>          }
>      }
>  
> +    if (offset / 4 >= NUM_REGS) {

I'd report that:

           qemu_log_mask(LOG_UNIMP, ...

Cc'ing Shawn & Rob since this might also be a LOG_GUEST_ERROR.

> +        return;
> +    }
>      regs[offset/4] = value;
>  }
>  
> @@ -124,6 +127,10 @@ static uint64_t hb_regs_read(void *opaque, hwaddr offset,
>                               unsigned size)
>  {
>      uint32_t *regs = opaque;
> +
> +    if (offset / 4 >= NUM_REGS) {

Ditto.

> +        return 0;
> +    }

From CODING_STYLE:

Mixed declarations (interleaving statements and declarations within
blocks) are generally not allowed; declarations should be at the
beginning of blocks.

>      uint32_t value = regs[offset/4];
>  
>      if ((offset == 0x100) || (offset == 0x108) || (offset == 0x10C)) {

Regards,

Phil.
