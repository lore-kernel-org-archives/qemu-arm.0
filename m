Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp793453lfk;
        Thu, 18 Nov 2021 07:24:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPa+6bIaoO9B3UIJHDy192swoUzEftJnvKSdPRl+dso5X2aIRNTqxzzD0I3cJpTnko2MCM
X-Received: by 2002:a92:d843:: with SMTP id h3mr16364537ilq.91.1637249079048;
        Thu, 18 Nov 2021 07:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637249079; cv=none;
        d=google.com; s=arc-20160816;
        b=cO0YXXPFd6i4ajt7rO5nY2vvMS9R+oogEYmeQHMdJBs92QcdTiFLdLnDhgEhGGFmzr
         4MS5zq56nU9SKArcz7p+IwqDDAobaUrfSaeQMm13qLva0X87Jz0evoIdoATT19fEncwF
         cO1UlVREOxjCNEwcjKDGNI1TxnFImmHAWPRnNFG6uPZPTdo6cKLdjsjG8rBHaSrFOPrT
         gMFJX3bG60h+ORwFVC+hzH8lcGf/sYskw0fTQq9RGkpsQzXDPwz8AnhP36dFjQ34IK8B
         p++613+pjqc1MdJDhYlRN9LHzl8Di05bssRfPcOIGP1VDQGw0lC3jZh0IeBAzl9A9fgV
         C1SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=fUEVQKR6L4zAdyD+oFPmawM4+m6owiyS9CmmsyLYvP8=;
        b=O6aqfZRIAdxx8nXj3Wlhk8KkTuyqfSSJWSZsmvT21ENHGhFoettAZMqFml0z1U+YPB
         2hBMRnG+x+Kp4n86NqKKTplnKRwlDrDTPkYurx8lyY3GAEhLXHt9Q+L1O2tO0zAmv1Qu
         Kbso04XBr8Dbaob8kAF65nukc/4VZ+XCnXU3umnybBT5qGkXasUD3Vr1gd3kWS2ryClw
         sOenxFNP/zeFTP5/FrCzSe+Yw7Kp2vfMsMTieTNkQMCp9tBnwRD80/MG9F36/gLIpSYn
         oTdcPGFSudBdnudcMJEuN2YDIJxx0ST9elrQX99Z5ylStLadQQgKoewnOZItUKFZrW6z
         +z4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=KRqnc9dX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay32si8917630iob.102.2021.11.18.07.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 07:24:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=KRqnc9dX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnjHC-0003Be-4G
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 10:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnjGo-00039m-4l; Thu, 18 Nov 2021 10:24:14 -0500
Received: from [2a00:1450:4864:20::330] (port=56138
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnjGm-0004om-CC; Thu, 18 Nov 2021 10:24:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id p18so5665079wmq.5;
 Thu, 18 Nov 2021 07:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fUEVQKR6L4zAdyD+oFPmawM4+m6owiyS9CmmsyLYvP8=;
 b=KRqnc9dXeYRUV+kdMAn+XnBb/Hz5sozUAGo2y6KFhbwEm8XHmDNKIntd+WRCwGE305
 kSS2f5KSqGn8XmMqiTocmYctq57ZCRBGcHNkhlCxNruMcRLbYj97Z8gt5+5yy14srxWx
 dbCSzS64zLGly414nA8A4l6RwU0zdybbFGqIvB9Kis7ehQHTUNfU7DdjuCjaZBff2fq2
 xagfWMXqOXo4QkcXeCHPAxzPIfGTektt8lVC94goZ9I4gLRLBhmmmdjSaA+aEUsl3Ajf
 d3EZd+24HkKFXX6WMmuGPky/hrlkHpfsVLJt//zcA7WQNMBZjeQcZhrkk0SLrlfm23Yq
 rCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fUEVQKR6L4zAdyD+oFPmawM4+m6owiyS9CmmsyLYvP8=;
 b=0s5//9KWA+zPgeYQhHbOcvki3hSsw1STdUQDCitl0JKba0654lPAiXGMvQGiupsC0Z
 xqIf00N4BX2z7MXL5vb3aQh3NX0i6EmSeLhB7FxdqPg5ldbVSMwmLsanEBiKGnkjMuPD
 8x1Bpfj/vMmpG8OFdSU+/7+W5ru3rflXhM/G3B474JgOwS7Uts0nEpcE+WXDmw3DUIvD
 bt/1vLUTYtErlQ6mEasvhv7YaMbxixtspgtudoFvJTua1REN4uHgq+ZXGBesj4Iy3r6f
 rqwbWBJuEn1lSU7ORN+Q72xD1E0XLxKHePVngJIdTYN65+NqAcxbQw3KmNX+m+s8cYIe
 hE3A==
X-Gm-Message-State: AOAM532eYCv5JbZ4yjTPHrY9AckvZ8cBLD+dnHHsyRXz9n7x4fAR9/6k
 Dxci7aoFp4B34Pc5zlx6QSGQJF3mAxE=
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr11203154wmq.34.1637249049927; 
 Thu, 18 Nov 2021 07:24:09 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m14sm278574wrp.28.2021.11.18.07.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 07:24:09 -0800 (PST)
Message-ID: <382dac41-0075-8c12-52a7-996a9b044d1e@amsat.org>
Date: Thu, 18 Nov 2021 16:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] hw/misc/bcm2835_property: Add dummy Get/Set GPIO virt
 buf messages
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, qemu-devel@nongnu.org
References: <436e3f7b8f6d989a01ad0d8b9b226cbcbe0208c0.camel@kernel.crashing.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <436e3f7b8f6d989a01ad0d8b9b226cbcbe0208c0.camel@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.084,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xt4R/5YxF35k

Hi Benjamin,

On 10/17/21 09:48, Benjamin Herrenschmidt wrote:
> Without these the RaspiOS kernel tries to ioremap some bogus address
> and dumps a backtrace in the console at boot. These work around it.
> 
> The virt-gpio driver still fails to initialize but much more cleanly
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  hw/misc/bcm2835_property.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index b958fa6a5c..62037c0630 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -274,6 +274,13 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>              resplen = 4;
>              break;
>  
> +        case 0x00048020: /* Set GPIO virt buf */
> +            /* fall through */
> +        case 0x00040010: /* Get GPIO virt buf */
> +            stl_le_phys(&s->dma_as, value + 12, 0);

This is not correct. You tell the kernel it can access the virtbuf
at 0x0000.0000, but the raspi_smpboot code and raspi_spintables are
stored there.

You need to store the uint32_t value in BCM2835PropertyState on SET
and return it on GET.

> +            resplen = 4;
> +            break;

Regards,

Phil.
