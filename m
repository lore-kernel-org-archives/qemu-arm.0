Received: by 10.223.197.9 with SMTP id q9csp174865wrf;
        Wed, 4 Oct 2017 21:34:01 -0700 (PDT)
X-Received: by 10.55.98.205 with SMTP id w196mr22179555qkb.322.1507178041367;
        Wed, 04 Oct 2017 21:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507178041; cv=none;
        d=google.com; s=arc-20160816;
        b=DX2XvDCS/+TIIzjNKAyqmG2tavW+HjpqwCfp4l2RtTLjaQBZiymTkXxgCQHLYubqoI
         a+shZDn26CpOGrx7dyCp9TqH0weA8EJBpTm05WTluPEsR85zUp+vLQWbB+CEy7VEbcls
         gpjhYqEW0G4zQayTxxs18vP+Worir9pqqCyaOl5ZhjO4n40y1K1lNzM747Vb9u9vHCEw
         gCXbC3Z+kiCk/c/6YSPCAgP8CpW+kVdZ7fa28dTFGYZZOghPD6O6YM9XoLKI5Z59L7hL
         5QB8VI3Ph9/+OlunNMetxxvIZZWIp9D3t1n4rWqVM666vs4vlRRP0Xy0SYUbzcGGX0wI
         52pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=bhh+jf6ETm/ZSLqVDBBRizheoHkxbh3jrsdCqqS7qYI=;
        b=GH3fFFH1LYVsgDqv7AsdQLlqDKUK3bDElmihhLb2uA0RniBeZmo9JoLf+LzqfN8rg3
         2Aodqg+s0mAm1EtSHNxuvjYTJKn8gkY390WxM8zZ2/M7wKjFiFpiqAUc4xjp+ewGp1Qp
         CBA5SYHovn8VZoh/COaTWP9/htSY9FgSJo1ZKNQYN3wqTd8YWhQIDMEd2mMQh9T6SUPF
         7KFzQsYy820sGsLr5o4J2aqIcyFSDQ0rgYixgcLlXfgl0PF5uH3txkTFj+6Z4i1K7dRM
         ypMKcTgspI4WCYaZcbS/Ltbx+NUCoCvNfU8TvXrEOPPszfDZHqN8Yl53Z/BtkwoXlIA1
         SpKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iYyuwxrE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u15si7702427qkl.17.2017.10.04.21.34.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 21:34:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iYyuwxrE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzxrE-0006ug-SW
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 00:34:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzxqO-0006dN-TM
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 00:33:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzxqL-0005j5-QH
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 00:33:08 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35910)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzxqL-0005im-L3; Thu, 05 Oct 2017 00:33:05 -0400
Received: by mail-qk0-x242.google.com with SMTP id z14so9325820qkg.3;
	Wed, 04 Oct 2017 21:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bhh+jf6ETm/ZSLqVDBBRizheoHkxbh3jrsdCqqS7qYI=;
	b=iYyuwxrEyizSHlx6C85IffS2rcxP8Qtrn/d3URXphSNcn2HdsfsruIhfYF4ApRo4lA
	KG4deQkY1wNzwQfyy7VQpdmUlDL0Hjl4kqAItfcNbyuZnjOEf66VkEJUPrAzSe+NurHc
	JUwAnjtG8GR5TcyAjNuTgPTEbzWyI8KbVWHgcPGUeuVDZ6o6Sh7tZ0JhM29F2CFcZ9c7
	LRSlvppJbu8svwxDSL314xTFtO/rflNRSm0xUEn1bRbPL2ejIHB4s0IhxnqOLUaLvBr1
	i4Z7nxCqV6NJx51WM+KyQTk55SIVPm69Nnzp36smbrXcwbPi1YcCps2prtAeeJuYy+8Q
	ORLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=bhh+jf6ETm/ZSLqVDBBRizheoHkxbh3jrsdCqqS7qYI=;
	b=o6PKvg/unCIdthaiuiQ31py0P0UMP8YRsVvNXXjRSuEO9FrIZR49DMfEL3R4lCDJtg
	qFLpEGZ+nLh6+jofJOtHfjKSfO7IDu54rehSxS3JnctkS6/7N8n4SzBBIA2E2NQ1ZfUI
	9+xHwzvFVSjMe+P8EVM4gEUUMObhLiAk78h4cXQ4OeAtFV0q2IEd3iuzksyl3r2NVMhi
	iD8ZNUrpyEShOWsDSfdyIZ79j4kZK17TA9Lm6IJtkSrOXfRFNl3yfOHtx5mkc7UAqGNy
	mIsaOscF0l6atmBIhsSz7tn2eBzn6LsJAhLgk6EiHPDChvca22XykHUcqi1x7HVEINYp
	v5zw==
X-Gm-Message-State: AMCzsaWCFGPDSOLbya/l2vO+nO06FaVqDFj8pJSkNo1jhPxQPKJVbuRC
	HfeHYEkUIJKCY9l4B6op74I=
X-Google-Smtp-Source: AOwi7QAcQULeiCNiWcsXpnRYayyccAE4Mvi9Iq+qmtYRws2/j0JeUL1lXgQXJ/mfAPdyouoFxxt2hQ==
X-Received: by 10.55.72.81 with SMTP id v78mr27904308qka.333.1507177985042;
	Wed, 04 Oct 2017 21:33:05 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u133sm10899354qka.92.2017.10.04.21.33.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Oct 2017 21:33:04 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-21-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <e03aefd1-81bb-10b0-f325-fdce7e60c7a6@amsat.org>
Date: Thu, 5 Oct 2017 01:33:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-21-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 20/20] nvic: Add missing code
 for writing SHCSR.HARDFAULTPENDED bit
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
X-TUID: j7/Ehr6Cf5QL

On 09/22/2017 12:00 PM, Peter Maydell wrote:
> When we added support for the new SHCSR bits in v8M in commit
> 437d59c17e9 the code to support writing to the new HARDFAULTPENDED
> bit was accidentally only added for non-secure writes; the
> secure banked version of the bit should also be writable.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index bd1d5d3..22d5e6e 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1230,6 +1230,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,

        if (attrs.secure) {

if banked then arch is v8M,

>              s->sec_vectors[ARMV7M_EXCP_BUS].enabled = (value & (1 << 17)) != 0;
>              s->sec_vectors[ARMV7M_EXCP_USAGE].enabled =
>                  (value & (1 << 18)) != 0;
> +            s->sec_vectors[ARMV7M_EXCP_HARD].pending = (value & (1 << 21)) != 0;

therefore this bit is present.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>              /* SecureFault not banked, but RAZ/WI to NS */
>              s->vectors[ARMV7M_EXCP_SECURE].active = (value & (1 << 4)) != 0;
>              s->vectors[ARMV7M_EXCP_SECURE].enabled = (value & (1 << 19)) != 0;
> 
