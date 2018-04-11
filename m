Received: by 10.28.71.155 with SMTP id m27csp880979wmi;
        Wed, 11 Apr 2018 08:55:04 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/32eXcsHmQr/HR/7UJyNuBJvLKo3Y4QMAl7gAU1SqrGTKrjDq1dyRtZ/1OZ24d4hZRQgow
X-Received: by 10.55.24.15 with SMTP id j15mr6483173qkh.243.1523462104010;
        Wed, 11 Apr 2018 08:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523462104; cv=none;
        d=google.com; s=arc-20160816;
        b=ICCMbEaqrW4BNePGl7Y3tLAC3GQrNK4oGKlyuRupzLT3tQ6ZW1z761EgqHhXX9HccN
         mYTjA/44tcPO5TIlPyoCJvhBuvRLJ1w3qPfi4r3Sg5yFUHWa4I47d/Repi9YnQEisC2F
         OHXuJCExXoSm5zqkRuDB5SU5kTbdqCGL/LOlaxGrS8jyWzw4tenPtxZIm5pkhNiWpJEd
         r7qIkxMbRWeXK6XFRKgaFz3nzCNNW6RPFeCi98ipj/cL16D6cI/uDVkxxLoBCL/uFgSl
         Nz01QznpAgus+ZTDuBKLjKVBhqwkCMsNRl6zS6W5ZMd7g3OsztgqQ5RyY8X8CZrJ2ghk
         CtCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=AHgAh1iAgHMG6Z5vd9yHaPrBGQKFgoyuhJ1MDI/eIdM=;
        b=TaMoArwfPYf8XBjd7rIlQ7SWsGGmUsAW8mUx5T8InS+kyUXWn6JXNYIBXygbg7ED2t
         s7JSjcCu2RLZXxTmZokbKe83zgJt+R3lqHQVO4rbCXe+640dMDWenxjwCFrmZ2mLJzIN
         3062QcxQiVs0txGH3ZTO2/RZu15qWMFexKKxFkotJbBcjc/V6Rzb2WNNU2UFWRELiUOY
         /TiLVVf6d9CpWbv4w4D9oeld/+3sb3cywdp+a0qcoovxCYJt2KZzxPH86O+84+8Qq6Wl
         9dc7dndHpA9nHvKt5k/4VAfDkg0zYrmnQCBQ3Xx9enJ2M5VB9Nvme2EC6G2Z9XSogaPP
         UNdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HDg4xQ/q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h136si1842958qka.343.2018.04.11.08.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Apr 2018 08:55:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HDg4xQ/q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6I5P-0003fe-IW
	for alex.bennee@linaro.org; Wed, 11 Apr 2018 11:55:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f6I55-0003Uf-DK
	for qemu-arm@nongnu.org; Wed, 11 Apr 2018 11:54:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f6I54-0002ni-BS
	for qemu-arm@nongnu.org; Wed, 11 Apr 2018 11:54:43 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:41622)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f6I4w-0002fo-NN; Wed, 11 Apr 2018 11:54:34 -0400
Received: by mail-qk0-x243.google.com with SMTP id s78so2334869qkl.8;
	Wed, 11 Apr 2018 08:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AHgAh1iAgHMG6Z5vd9yHaPrBGQKFgoyuhJ1MDI/eIdM=;
	b=HDg4xQ/qdQ0bRF3+tGHT+nU1riRUor8GqCNvd0+HUVLcSew/IxnRMJvYFhv6tcehNi
	U7Vc5Ufy76sg9kfmq/PxW4yKnGXw9T1MfZEg1KyEP4TliMqs7AVv+h4/MAEtqRKzcz7u
	QuDX9oO/H2Mps0B5kdwfo66B9H+LrPpyKw4z69c7GJDI3xeSfEA4sD9Gvn1/I0QFkvYO
	sTyM/UYPbz3fry3KfYUodmej3K70vduTnDVOM65dsticcLuQjNsT4/7N8OwfZUbYfp9L
	MxazxNiA5XoRdTjgMMfU6Gxid2oEFkW3Ss/AMUnn6YBoHsMWJJ6MvhPtGoBrl967AqH3
	ZzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=AHgAh1iAgHMG6Z5vd9yHaPrBGQKFgoyuhJ1MDI/eIdM=;
	b=CXv/yTKl/G8ZEGiQF4PPrNGkZSMUwenjW3HJeq/qu5GnFtYXz1LVqor/1aOzxIC3d3
	mHBdI+9SYAaSA++yhdlrUkqVcRzqvCJAc0+YdeB+TufYsrsM1kmhCBJY9yoxW0k3KCD+
	j3SvKVRnWn7NedNTtKBxrE2/GKifxdZKEFfEqB5aYSmOx+PbGM+oNl9nH2O2xFP39n0N
	rsWPeHBXrsgE2Sug65Tw+lDlxo+LZ6i+hbZSVOexUr4np/EHJveyXgGNEAqju5Q7yQlH
	UVtss4CJZz9YJ7O3tm6A8JVHbTnvajRpB4u/rDL0XGbsRrVKKSADZDuW226k5yCy5zd/
	3oOQ==
X-Gm-Message-State: ALQs6tAjgnA5YKfrHm9jRTXZT/Z4/pCJkfOXP2jGABkGoG5S+Dbnz4Sd
	pjcQZa1IGOZkRc3a0gLqQsQ=
X-Received: by 10.55.10.144 with SMTP id 138mr4238407qkk.214.1523462073988;
	Wed, 11 Apr 2018 08:54:33 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	t82sm1037637qke.52.2018.04.11.08.54.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Apr 2018 08:54:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180410134203.17552-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <c996f23e-b8cf-7c6d-5557-cb7b03df6bfc@amsat.org>
Date: Wed, 11 Apr 2018 12:54:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180410134203.17552-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH for-2.12] hw/char/cmsdk-apb-uart.c: Correctly
 clear INTSTATUS bits on writes
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
Cc: qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lql/VCKCmD22

On 04/10/2018 10:42 AM, Peter Maydell wrote:
> The CMSDK APB UART INTSTATUS register bits are all write-one-to-clear.
> We were getting this correct for the TXO and RXO bits (which need
> special casing because their state lives in the STATE register),
> but had forgotten to handle the normal bits for RX and TX which
> we do store in our s->intstatus field.
> 
> Perform the W1C operation on the bits in s->intstatus too.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1760262
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not a disaster if this doesn't get into 2.12, I guess. I think
> it's missed the rc3 boat, so if we need an rc4 for some other
> reason we can put it in.
> 
>  hw/char/cmsdk-apb-uart.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
> index 1ad1e14295..9c0929d8a2 100644
> --- a/hw/char/cmsdk-apb-uart.c
> +++ b/hw/char/cmsdk-apb-uart.c
> @@ -274,6 +274,7 @@ static void uart_write(void *opaque, hwaddr offset, uint64_t value,
>           * is then reflected into the intstatus value by the update function).

The comment was correct :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>           */
>          s->state &= ~(value & (R_INTSTATUS_TXO_MASK | R_INTSTATUS_RXO_MASK));
> +        s->intstatus &= ~value;
>          cmsdk_apb_uart_update(s);
>          break;
>      case A_BAUDDIV:
> 
