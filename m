Received: by 10.223.197.9 with SMTP id q9csp934004wrf;
        Wed, 11 Oct 2017 12:32:02 -0700 (PDT)
X-Received: by 10.55.25.85 with SMTP id k82mr101880qkh.223.1507750322496;
        Wed, 11 Oct 2017 12:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507750322; cv=none;
        d=google.com; s=arc-20160816;
        b=cWdI8ZJUpZfWUr2eTt0zq2uZkc1pEpG4dBpm84gEp67ZtklTV6sw/ScsWCVpC3rg6I
         3C/mivce92Q3x2boHqeShMzZv/fNsCZAhTJlrBtaXb7iY6r/AXesABVk2mpXEP7oaNxN
         aZcLJMJNjhimt/ZPgCXTBUagd3DAMI/Ybbcnm+WR35xX2DTHeZshuUMagKd7q9TBmG+r
         Kj/1RfiAsgX+ZhKHseFCz0YhP+YpQj+OrZ1UxX3ptOPwIbh7FIn6hxYzwilJ9r3oW9sd
         mRNlbjBl0B+fQkRKlzWd2isI9wOo7MtDMYMN3Ruhby/8Eqf+Zd/gRiw8go4fHQAPTkXx
         aT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=u+jyrZX5IF1olUH8nrAPd26YMN4w/CFQW/udYcj4KxY=;
        b=lBa0xadotN4K8dSt04pYYKj632J2A/43W3VTNgSp5TWz1CtCrNlDK+fdniyZe0JTjC
         hKXOpW0ZYxKp57Szdj3Q/EeTp56GGa+ZJt4wj9GMuDCCvf+pBHC2SjbRzGooYpTS440p
         zdNANbYslw3VNipsao+X9JHY6xtsW6XLn4QNz0xwekNYvtzKGqnFx5YSctGPyqPpCPKu
         un6IYgmyywgH6pBcv1hOmaDMEPpWKK4B4t6pflpbE8KDU/8+qDbJR5k7NsbRe1TKkfVw
         59hGWgzwL4RNFrvZJVO0IU0if+3dLaoKDNr/6MEShprBUJj42rwDTZQwcA+21NwQMnF+
         n8gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t95v50ww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f35si1557886qtb.286.2017.10.11.12.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 12:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t95v50ww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2MjY-0005O1-6h
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 15:32:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e2MjN-0005MJ-TF
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 15:31:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e2MjN-0007Ae-1D
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 15:31:49 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e2MjH-00078p-Vz; Wed, 11 Oct 2017 15:31:44 -0400
Received: by mail-qt0-x244.google.com with SMTP id y45so3752477qty.1;
	Wed, 11 Oct 2017 12:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=u+jyrZX5IF1olUH8nrAPd26YMN4w/CFQW/udYcj4KxY=;
	b=t95v50wwWXi6eCAum80MxmObuscVXIxpdLt2gcQU8kKd6Cfzc7+ii0of0CgwcSOWxK
	T5CIv2MJm3gIp/wJC9a9pFA0qFbP0OPJAdlw/eCth04W8LmM/c4dDJ8BzUESqJVWMaAh
	3erF585sSEwcZWxeFflowQYrLb0AEusY8mMNQhpTcto6C4VNpVh2vMvVGV5YHW1v9kCW
	1xf0sKenw+n4js9lD40yyOE/WxRaav0fE6TafG28/jJpCBi1A1PvWTq930tQD2HxQwYr
	dV1Sa29D9Lh3SoqM/ySr7d99+zc+rTV2ZnUxeKAGKDefhNkF2tXQERl1Ozw/Hggq61jM
	e3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=u+jyrZX5IF1olUH8nrAPd26YMN4w/CFQW/udYcj4KxY=;
	b=pMn4wFucAxgTbTdgTuSB0kNGUAQ9itHdn58louv/muAt4AkcNTb9ngn+uUsmHTawjl
	iJkTqKP2i1yjzVmbghpFwjX0pO7XkhJK1CUNWme/Tj3qqBHlLXbs6oemjmq0uGFZZxZQ
	tjqGHZBXB6iPuX1cO0HweRJYfy0C+Cq+WWASs1AgXnxYWLHt8lo+cc3MIXK69/qw8a1P
	etWRfHpYagJsu22oQjFwo3g79ibED1oZiJHE5VUAz+D+5/8xi/6UJA/T1sU7RZAwCWcM
	a45Pj+HYLyQoKDNuqKCtxc/vZ5zhvX6qTWmDK695lf6pFSzP2xy9NRtKpKpdS2ajCRHi
	/6Kg==
X-Gm-Message-State: AMCzsaVnVsqsrMOsA1DvcWEfvYdgmQYgIEdVXkAatiCJ5t3IR/Wy5caD
	A8QRtxrUIsKqf+sziJfGaL8=
X-Google-Smtp-Source: AOwi7QADqPD5kh21HhnerPJaOUjlcL6XNFHmXS7XsPXQfgJ0ekHeH6eRxLuQ88y3vWPxZkYqV9L++A==
X-Received: by 10.233.221.66 with SMTP id r63mr128393qkf.79.1507750303014;
	Wed, 11 Oct 2017 12:31:43 -0700 (PDT)
Received: from [192.168.1.110] ([190.190.132.254])
	by smtp.gmail.com with ESMTPSA id
	q82sm8329651qki.34.2017.10.11.12.31.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Oct 2017 12:31:42 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507742676-9908-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7405d26e-f677-8995-737b-68ec74da5c8a@amsat.org>
Date: Wed, 11 Oct 2017 16:31:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507742676-9908-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH] nvic: Add missing 'break'
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tCIPv43U7Wze

On 10/11/2017 02:24 PM, Peter Maydell wrote:
> Coverity points out that we forgot the 'break' for
> the SAU_CTRL write case (CID1381683). This has
> no actual visible consequences because it happens
> that the following case is effectively a no-op.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/armv7m_nvic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 201e90f..be46639 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1447,6 +1447,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
>              return;
>          }
>          cpu->env.sau.ctrl = value & 3;
> +        break;
>      case 0xdd4: /* SAU_TYPE */
>          if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
>              goto bad_offset;
> 
