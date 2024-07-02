Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp2429170dlb;
        Tue, 2 Jul 2024 08:41:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkzx8RlbLqqXCewXIShbH360UosW9bxCnGr9E7yBjrBVgvEexy8uCNRb/wdrYOBA7CCYCcPEDxgWISKJd+71SfNAtfUA1o
X-Google-Smtp-Source: AGHT+IFGnaBc0mssOuIH7Pi6bSngiG/WwTPiZVgDtRoNinhai3BxDjCzvfmeQW4pRg6ZOUsJOiaG
X-Received: by 2002:ad4:574d:0:b0:6b5:d764:69d9 with SMTP id 6a1803df08f44-6b5d7648a57mr23824186d6.7.1719934879418;
        Tue, 02 Jul 2024 08:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719934879; cv=none;
        d=google.com; s=arc-20160816;
        b=Gk3cs+n11IIScSchMq5ZkXyoyraYZjwTwQI6SAJOtyulsTdS/7px5vahJVVYcgkUQc
         1lGr7bx52QXE1X80/7l+eFASVuAYtL9I+4OWkJbmKG+Kjj9H7HG6HzAjPJRmiZTW1Y/w
         ao2LDPDrTo9y61ViejbtjpKOhEPU8sCInlbv4fB+dIFyI8zTXgjjmmRrP9v4rIaB5BlN
         /fsfnviWNSbStQErPzssd3aJlL3JkPbCqsjH2DT1RcJTAo5PSOa4lSuAJJk8Y57DlSmy
         tabKggE5/2bm9AdFuIjEPMS1fJQmTicLRYtOpCpQShzzLDsf+OrklUoAIVc9xCxQpj2n
         0Avw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=stF7WuGpcrsQaV3ZUFr5l5WCk/9RTmiuVw2jUbyk6xk=;
        fh=vEhJ0w1cTOCYHff2NU9W09NoerGREUgzrcwmmENVr0I=;
        b=mX8aGB2sil80MKXd1LmKUwH9qjAwEFfHQvPmgYgWE+cVdiDPPyyQVQScydZuAELiZL
         hkfKen3oRjm+f6zpNL5l4fCmY/YJPMNRJsGOXyhkxSoP2Ge5Pnb9fwieEtn0CQ6aPkDg
         wmEKJFJ96q6XtV1im1DT5eIBVSuwaDAg5kGuM0zoHn5aE+CkRDlASSIDGY1vcvTRVDVB
         oBvL8oz2OburfUceROBSE7aOQlXy3+fwOJV95V+6UvU1ldDUfFa5/VC3JrtZxKmTV65J
         mrCKQeTfHVqSMEqbdgpFH9iQeu5M6/FBflnWsptx90UE7usKlMEYLuxybgrDRxynevyi
         +iZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qei5Sh4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5ebccesi111198606d6.362.2024.07.02.08.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 08:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qei5Sh4l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOfck-0004ol-Kk; Tue, 02 Jul 2024 11:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOfch-0004oG-71
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 11:40:52 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOfcf-0001Pw-GR
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 11:40:50 -0400
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ec50a5e230so43771001fa.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 08:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719934847; x=1720539647; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=stF7WuGpcrsQaV3ZUFr5l5WCk/9RTmiuVw2jUbyk6xk=;
 b=Qei5Sh4lqNuvjWCj8vTmP2yRlZ2GxHJ6Jv7pavzbUj1onSSg+18cEQU9uOY/lZGa95
 IcVYYlHcsAT470VkPf8FEY44g9fOw1BROkY+LqnZemakc1kKPewSBa5ubtKTydMELXTr
 yN4S75dykFnp8HcpjnBULlu2M4aMfBWzynZV497GPOXQ3QaORIWxYAy+pAq3D/OmiQar
 /w+KBA3kdRZQTE3Os97f24+5KU+mqlBUqSHwswP/wg0/Awv1Xqm1JazB8IMrjlfC8L7U
 M4y7q2VHc4+rljinoq+wPSBa7NVqhGIeHenk7XpiUZjycwbLVPdaF6KI0cAh4P9xkGCE
 rlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719934847; x=1720539647;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=stF7WuGpcrsQaV3ZUFr5l5WCk/9RTmiuVw2jUbyk6xk=;
 b=CTxHZsqbSmufBtS4sOwr4afWSmQRXUKlgadzDoqi9wJkXGbdLnI0EEfev674AAroGA
 1gxETL0gVmPw4HrrZ6AblnOv9E/Q9gr5J+P/9MYHTE6iDdZdXlANQAfkH8fJe9xi5PVZ
 Dwb5kJjUPeD0yO448MW7POMus23oCgGoeefGAW2FzJcBsaV/nRleJ/2CxcXTNTHWPxzX
 LHdpTO9pI1AbQ5N4dv9LKmWuDQCWnxvv7X+wx3yAXHxxorC5o8Hxg+nl+nwPe6SyAW1k
 aVjrwUEMKR3xQtn1vdEa9U00W3E91SikjH0mN1W0EoIMVjhz8tH8pvXciq8h/fEWWywK
 Y6kw==
X-Gm-Message-State: AOJu0YzZa5+prVfhve18BUp5CO/jT1hHfHsp36IAyqHOSyfCOIa5y+OD
 lWCApbMSgIHlGcyWe8382sttUL12/wbzlBYmZKIRXeZXqVY6exEXY0Pw0vvxMRw=
X-Received: by 2002:a2e:a912:0:b0:2ee:4e67:85ec with SMTP id
 38308e7fff4ca-2ee5e337908mr81930911fa.5.1719934847322; 
 Tue, 02 Jul 2024 08:40:47 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.209.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b61bsm204781685e9.17.2024.07.02.08.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 08:40:46 -0700 (PDT)
Message-ID: <b72e40c9-c2de-487c-a9ad-a52c1f286d77@linaro.org>
Date: Tue, 2 Jul 2024 17:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/char/pl011: Avoid division-by-zero in
 pl011_get_baudrate()
To: Zheyu Ma <zheyuma97@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240702152750.3017426-1-zheyuma97@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240702152750.3017426-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0jHD7kg15Zi1

Hi Zheyu,

On 2/7/24 17:27, Zheyu Ma wrote:
> In pl011_get_baudrate(), when we calculate the baudrate we can
> accidentally divide by zero. This happens because although (as the
> specification requires) we treat UARTIBRD = 0 as invalid, we aren't
> correctly limiting UARTIBRD and UARTFBRD values to the 16-bit and 6-bit
> ranges the hardware allows, and so some non-zero values of UARTIBRD can
> result in a zero divisor.
> 
> Enforce the correct register field widths on guest writes and on inbound
> migration to avoid the division by zero.
> 
> ASAN log:
> ==2973125==ERROR: AddressSanitizer: FPE on unknown address 0x55f72629b348
> (pc 0x55f72629b348 bp 0x7fffa24d0e00 sp 0x7fffa24d0d60 T0)
>      #0 0x55f72629b348 in pl011_get_baudrate hw/char/pl011.c:255:17
>      #1 0x55f726298d94 in pl011_trace_baudrate_change hw/char/pl011.c:260:33
>      #2 0x55f726296fc8 in pl011_write hw/char/pl011.c:378:9
> 
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display \
> none -machine accel=qtest, -m 512M -machine realview-pb-a8 -qtest stdio
> writeq 0x1000b024 0xf8000000
> EOF
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
> Changes in v2:
> - Enforce the correct register field widths on writes to both UARTIBRD
>    and UARTFBRD registers.
> - Mask UARTIBRD to 16 bits and UARTFBRD to 6 bits in the pl011_post_load
>    function to prevent division by zero during inbound migration.
> ---
>   hw/char/pl011.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 8753b84a84..ba5f7cfbda 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -374,11 +374,11 @@ static void pl011_write(void *opaque, hwaddr offset,
>           s->ilpr = value;
>           break;
>       case 9: /* UARTIBRD */
> -        s->ibrd = value;
> +        s->ibrd = value & 0xffff;

LGTM but could you add a definition instead of these magic values?

Similarly to the ones in the top if this file:

   /* Flag Register, UARTFR */
   #define PL011_FLAG_RI   0x100
   #define PL011_FLAG_TXFE 0x80
   ...

   /* Integer Baud Rate Divider, UARTIBRD */
   #define IBRD_MASK 0x3f

   /* Fractional Baud Rate Divider, UARTFBRD */
   #define FBRD_MASK 0xffff

Then use these definitions :)

Regards,

Phil.

>           pl011_trace_baudrate_change(s);
>           break;
>       case 10: /* UARTFBRD */
> -        s->fbrd = value;
> +        s->fbrd = value & 0x3f;
>           pl011_trace_baudrate_change(s);
>           break;
>       case 11: /* UARTLCR_H */
> @@ -531,6 +531,9 @@ static int pl011_post_load(void *opaque, int version_id)
>           s->read_pos = 0;
>       }
>   
> +    s->ibrd &= 0xffff;
> +    s->fbrd &= 0x3f;
> +
>       return 0;
>   }
>   

