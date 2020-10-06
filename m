Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp494467lfq;
        Tue, 6 Oct 2020 02:10:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMi4iARda+XTPVRrE4J/SoIhPp4lad+s/d6Vh1VwlD+QGJQNClK5NB51X7B/WvEOyxErcP
X-Received: by 2002:a25:c845:: with SMTP id y66mr5251027ybf.80.1601975428948;
        Tue, 06 Oct 2020 02:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601975428; cv=none;
        d=google.com; s=arc-20160816;
        b=hiIsBze3A/3SLjsIC5wRNCsvFjwxl/JYUPOy5xupB5oPR7DUFgyUQ4OgWowVQ2owm8
         H7r1JsWWGrHubWhvkDq+D4ezyl57245rbeMN4Of9n8b+DCKbrBsYTx/L4/ngWMGyNgbw
         rh5ryUwV4j3sxLCK7Bsfy+G+Ya+h4c6hgcue/XWCH/Jh1YTC9RvLTNakqtN7mGaWDYBa
         2bpsgahs7uJIylhrK0wJFWW13RQTB0oKAdApDU0x6TSjd9ybedTrUmV8Ndxh7qq7vsbx
         HlHjE+KBcZmqVGK9zAL4jYY54jxDFmSFjlZmVY/GPYZ+BioWTRH0/dvhVYjZNa+5UC5n
         MhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rMV/CuyCUzetR86gKWAzorahfaIMTIJGPrcF4mDgVu0=;
        b=GORLOKy46a/VdTqVWkEd/sZXvxBDQoXFCxcYoRXicwR+pg7Zos/+2gnY29qJKJiHW2
         y9F5nAa1AUjgkbFZ2jTsY8Y6sLUFqFdQ0g/jmBcalVqHFIFQjB+s9HuCmrkzJdjWaVMP
         n+0lp3vByeGx7ZRwAl6kkCuzuOOlCu7996ZT6lOuvMcQDMnaZG6xt/3BvrXTW77odxQx
         LdLFW7lTbUZ3xjbmsoqkdzxVs9rENJOxbLE0swpPQdRuIPj8+6N5wER+bDW0pdMDxFTx
         e6g+y8bJoawZ9fNFlZD7dc/xp7IZtYG2VYK5LZBISREbXv06LUMsNVzTFJYhVe1GdgU1
         qx7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PTi8ML5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e70si2838735ybf.339.2020.10.06.02.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Oct 2020 02:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PTi8ML5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kPizM-00034w-C4
	for alex.bennee@linaro.org; Tue, 06 Oct 2020 05:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPizE-00034j-6A; Tue, 06 Oct 2020 05:10:20 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kPizC-0006Zt-DY; Tue, 06 Oct 2020 05:10:19 -0400
Received: by mail-wr1-x444.google.com with SMTP id h7so8943645wre.4;
 Tue, 06 Oct 2020 02:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rMV/CuyCUzetR86gKWAzorahfaIMTIJGPrcF4mDgVu0=;
 b=PTi8ML5IfVISD21TgbF+jdMiYB4iGoLnjyF905KT6OPm/FUIFPGW8M2AljLQmwQVdN
 GikXhgaMemn2BPjBRt4N40jfq5o81lbZoxh7jJ5yGdPRhKEiLsxTCYMR8LlQc2VQLwRj
 0XMVsa+FYoUA0Ydco5Seijlip7SZdN8wzYjdpjaP+IlH+ZopP4ORomxmWwF3G9I7wFX7
 vjiwbyR+a8nr0n9qQb9WmihSXRne+5zrKJQkfsFtfvj+LCh3E+wiLytge2V/d5Qgzi9M
 1rrVlb+bYZuJfWb7vtLuADDU3SuPSO+26LbNs7H7gePBbDQGIA7MJJZ5KHUULEPEw3z8
 hL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rMV/CuyCUzetR86gKWAzorahfaIMTIJGPrcF4mDgVu0=;
 b=SU4OBEZ1+WfVRHjryskWFEs1i2oBLGsovGPDNJApnR5TTJRDH5Jol62D9rHq853RWW
 3CjRkvO5bY4b58rHxPg31RILhr2h3oS+WrmsMlh2YKYPZmgRqoPRBtIJR8taPys0Hm75
 wxyTowBfQli5PwyFF8830QmwDGbpa22G92FZKTXCIfzBfDk8HAPii59zYNIRzupBMnUs
 7wjPTgsB/qtf9PSCGf8gFYt2UEwIULTnn/7IIPd4RksvMkzm9X/Jfhv/FAeE57IF2+cq
 EtvGa63rc4vbzENX1q1122N0r9RJBywbSDE1J5UyYPcRFAi7JBYMgOE+2aMiTo8o69VM
 i/1w==
X-Gm-Message-State: AOAM533Dn3YgSGPgp8jM7JxXBpHLKm9Ig/7xn7CUO/iCDYInfBzQbH5W
 KCgpJ/Gto2eAJtDh55vD9LM=
X-Received: by 2002:adf:e552:: with SMTP id z18mr3577630wrm.50.1601975416570; 
 Tue, 06 Oct 2020 02:10:16 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id 1sm3722051wre.61.2020.10.06.02.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 02:10:15 -0700 (PDT)
Subject: Re: [PATCH v2 03/15] hw/core/clock: add the clock_new helper function
To: Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org
References: <20201005195612.1999165-1-luc@lmichel.fr>
 <20201005195612.1999165-4-luc@lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <21c16fba-085c-98cc-a313-b790850c6813@amsat.org>
Date: Tue, 6 Oct 2020 11:10:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201005195612.1999165-4-luc@lmichel.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xSteJrGMhtLd

On 10/5/20 9:56 PM, Luc Michel wrote:
> This function creates a clock a parent it to another object with a given
> name. It calls clock_setup_canonical_path before returning the new
> clock.
> 
> This function is useful to create clocks in devices when one doesn't
> want to expose it at the qdev level (as an input or an output).
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Luc Michel <luc@lmichel.fr>
> ---
>  include/hw/clock.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index c93e6113cd..a67c4c008b 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -93,10 +93,36 @@ extern const VMStateDescription vmstate_clock;
>   *
>   * compute the canonical path of the clock (used by log messages)
>   */
>  void clock_setup_canonical_path(Clock *clk);
>  
> +/**
> + * clock_new:
> + * @parent: the clock parent
> + * @name: the clock object name
> + *
> + * Helper function to create a new clock and parent it to @parent. There is no
> + * need to call clock_setup_canonical_path on the returned clock as it is done
> + * by this function.
> + *
> + * @return the newly created clock
> + */
> +static inline Clock *clock_new(Object *parent, const char *name)
> +{
> +    Object *obj;
> +    Clock *clk;
> +
> +    obj = object_new(TYPE_CLOCK);
> +    object_property_add_child(parent, name, obj);
> +    object_unref(obj);
> +
> +    clk = CLOCK(obj);
> +    clock_setup_canonical_path(clk);

Thanks for adding this function. It doesn't seem justified
to have it inlined. Can you move it to hw/core/clock.c?

> +
> +    return clk;
> +}
> +
>  /**
>   * clock_set_callback:
>   * @clk: the clock to register the callback into
>   * @cb: the callback function
>   * @opaque: the argument to the callback
> 
