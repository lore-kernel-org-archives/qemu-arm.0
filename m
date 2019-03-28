Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1194304wrx;
        Thu, 28 Mar 2019 16:21:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcmtJhyfCYZ8Zg754K8/qVGAAxhQoKFCAcMwHxIkto+obwYwrID5huKpox99Rr6VzJFOvb
X-Received: by 2002:a5e:9912:: with SMTP id t18mr33020246ioj.157.1553815272591;
        Thu, 28 Mar 2019 16:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553815272; cv=none;
        d=google.com; s=arc-20160816;
        b=xVpWyTLDp55NhsuyPh2S1qEUwBgAIo9Ood5Q86E8pSG43cFdAzZhsKloF3lFTk1AxZ
         Sn/xpa0AxopT/UK6HSdsjC8PhHEI5HW7o/IzRn5BR/lOm59jREoAr2jp8k7QVXkgMOKi
         phhFdoWiXihX/y8HxmTKr9H0nRK6BVCS64Lypse75vVrvvpMccUDvbvi87bTwnl0oa8U
         1fc9UCpKpKm/njw+ahBmIXP2sF0rvsnSJZkTo+BGHNYLTB3mxJhLguKQ4ngR5Kfc28V2
         7V/Lje8fHQc6pzhw2wqFcD4X+CpUqfS1vcwFqS+yzuYvA/wujOZ3GLJ6FLjytK4f6ULo
         REzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=bmerzysxKbRdU5bsN8hWY9nLeA6oUdFMlj2pO+biQVo=;
        b=pez0Z6z9IedUaHjirvutIpVID2CsHarDh+nrjCFyZnAQuXtY5bGmEpznMECA5DUfQv
         cA02Hhriz0ZfNdRAsUvgJeWcxMTn6KkWakwi027SBma2cBRUq0SPDsKjvg9ifCeRuU/n
         8GOTFhVsYPiEG9ZPkzPx+uSlduDVvpaFiPhobu7maZqjKcyGCgK1kT6gKEj4YmsnQPPs
         L5X9Xwr0Gd6en2RQlXfNwzEv09OofsxGzkaXGL22yOKBWOVK/pKHiIT9Do6ukRTL7brM
         AH68ILlqNJaEZlybfxVGwV/kFF3pgkr7MY7ZsvZUFEKBGTDRZztASuIUIzVYyvFFNPjY
         2ePg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y5Sx1mMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n65si142836jaa.1.2019.03.28.16.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 16:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Y5Sx1mMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:43166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9eKd-0001h1-R6
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 19:21:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frasse.iglesias@gmail.com>) id 1h9eKQ-0001dn-4L
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 19:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frasse.iglesias@gmail.com>) id 1h9eDr-0007wO-08
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 19:14:11 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:45577)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
	id 1h9eDq-0007ui-HX; Thu, 28 Mar 2019 19:14:10 -0400
Received: by mail-lj1-x241.google.com with SMTP id y6so290173ljd.12;
	Thu, 28 Mar 2019 16:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bmerzysxKbRdU5bsN8hWY9nLeA6oUdFMlj2pO+biQVo=;
	b=Y5Sx1mMSX1gF6u/b4tNuUKsEGOkZQbfJRvZzysp9nmevEq51JY+wtz0f0D1LuTT/ig
	vYIbCHepsxYS7up7dLmWYLgplsjV7n6UcPzS/rrpFUxrLQt6TK3lZS5XFSCfnkijdiRq
	TS/s0UWM4sqor/yYHtQmfSnzrpX+h05SL33MQUR0931ae6uHg2NvzuZx7NfR70gfPWWi
	CWn6AENv6xfoEj4TinOGaLc2+MkYV+bW5BTYsNr/SkKH6Lmt+D8CkUjyUwK2iVLYqNgY
	t6KL1gdSZe89qVLpyBoRN+8P51r3WuFGcb+TLi6Sxk8NuCywm53z1EpbpcwXnN1l+dyQ
	S+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bmerzysxKbRdU5bsN8hWY9nLeA6oUdFMlj2pO+biQVo=;
	b=sQWk9jyFDwdBf+RlmWMZ5VlsbEcNJwb9y01VYvp2Rtiic8TKPa3cUbTbqOFnvdpCLu
	MRS+6f0JPpXsw1ZbBBR/Ota4UmeEPUXIQZCWfkoU6+xxqREs4kracqPzDZhPhwwAUpho
	V8bbbHTjq8tqrGwZwoiErA1yhkZsj2kgAPusvBGOyhkxgxe7KWQaA0d/MYGh5Xn2Uuh9
	u+TVPsNxemHZ3XmLv+soC/KZFklwXm8yprjxpTsKUcYK+EcQkSEVMtwUqunuD3IO0vNf
	Um9af2GFJak8/wlnY6xWlB9TgYiAr9pkY+WBOsu9W6QLhQfVFEaSI6aBQ/pB/UN+DNM0
	Eh2A==
X-Gm-Message-State: APjAAAVnqyP9JWEVWhqOEC+wNKkXjyC28PlKtQfvPUMMcweu5Vo2uP/Y
	H++z/DNo7eboCkpB3tFjf/0=
X-Received: by 2002:a2e:8905:: with SMTP id d5mr9701673lji.59.1553814848538;
	Thu, 28 Mar 2019 16:14:08 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
	by smtp.gmail.com with ESMTPSA id 73sm73521ljf.72.2019.03.28.16.14.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Mar 2019 16:14:07 -0700 (PDT)
Date: Fri, 29 Mar 2019 00:14:05 +0100
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190328231403.emk67uj4vtjxianp@fralle-msi>
References: <20190328152635.2794-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190328152635.2794-1-peter.maydell@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1] hw/ssi/xilinx_spips:
 Avoid variable length array
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair@alistair23.me>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H5tYlT14RsXo

On [2019 Mar 28] Thu 15:26:35, Peter Maydell wrote:
> In the stripe8() function we use a variable length array; however
> we know that the maximum length required is MAX_NUM_BUSSES. Use
> a fixed-length array and an assert instead.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/ssi/xilinx_spips.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index 16f88f74029..c615058cc1b 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -429,12 +429,14 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
>  
>  static inline void stripe8(uint8_t *x, int num, bool dir)
>  {
> -    uint8_t r[num];
> -    memset(r, 0, sizeof(uint8_t) * num);
> +    uint8_t r[MAX_NUM_BUSSES];
>      int idx[2] = {0, 0};
>      int bit[2] = {0, 7};
>      int d = dir;
>  
> +    assert(num <= MAX_NUM_BUSSES);
> +    memset(r, 0, sizeof(uint8_t) * num);
> +
>      for (idx[0] = 0; idx[0] < num; ++idx[0]) {
>          for (bit[0] = 7; bit[0] >= 0; bit[0]--) {
>              r[idx[!d]] |= x[idx[d]] & 1 << bit[d] ? 1 << bit[!d] : 0;
> -- 
> 2.20.1
> 
> 
