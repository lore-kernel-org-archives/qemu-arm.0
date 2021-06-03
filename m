Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp486130lfa;
        Thu, 3 Jun 2021 11:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6lbKpmRHEgYOJhyjejF+6HMwFHF0DMPjaBcTTUe6U4IAGQoIdplcjbdd4uj44ZlJbW1VE
X-Received: by 2002:ac8:5c8e:: with SMTP id r14mr949009qta.248.1622746597953;
        Thu, 03 Jun 2021 11:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622746597; cv=none;
        d=google.com; s=arc-20160816;
        b=L/bfa6gK9UmrkzXkmoszYdNpc9FLEQlqsIMzwOeZhGLjGU3jS+1mOVOq+YcB1uqfoE
         gSqevDzjcfNaZysBleIHJzebd2HP3RWUMfm9mQHWk+HqO0BUatL/k0zIHDCDihvdGsD3
         NoUiW60gAj2/huJtwMmvbu1DrxsJh3cqOtey1IwooOfUG0ErnkreoNjQw71wEG8W8sCu
         TaH3aw4MFOXT4f6RHFKHYoPlw/el6nIG3mTIp2hp0fj1lnpG3iBzvq5T2WZ1TFicsJ2D
         GKQ8Nlj8h3yF7VI1bCgDQg9/b45WXIczs5naE6hsUkRKdcIyUfu9dCo+GXSCPJ94FWcD
         PXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GVzmCQhcIKDolak0F4jGs4P4SEmiZUbXv7oOCo1SZME=;
        b=guAEKAw5dGR5+znmldOMza7Nl34RMZU9bBy4aStqy+mvWGfk5JwDQrp1NKvA3f6l/r
         cWXyfZkF0ox1AOwq8LV7il7vxKq3GPzZBDgx6oXwBh/a1p5A7YPu+lvyU0CN/bW2xDcj
         Y2ONcyFZ4IUobw9OaZI/yhkOlvOHB+xLi5YekzhjpOwBAJJsTiJ6KL+a/UYbaXqU4gK+
         yeNzOW1NqpoSlBLrWsxJ5TABaeaUOtekIDocEyp902KZu40vKrUaXguDqDo0RH8YAPzM
         e7LE6X0fs0pgXn7P9uQiMoM+BhscxHqVknFVb4ogJ19MR1ciCr9fF2ejhooh2L2PlVSZ
         UhDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWSKuoNu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si2293703qky.24.2021.06.03.11.56.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 11:56:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YWSKuoNu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1losWD-000500-5t
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 14:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losVr-0004z4-Ge
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 14:56:16 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losVp-0005kF-EZ
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 14:56:15 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso4484394pji.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 11:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GVzmCQhcIKDolak0F4jGs4P4SEmiZUbXv7oOCo1SZME=;
 b=YWSKuoNuRER0E2SPwCzrVahlkBXL6Amn1tI/i0I6xSXepxAtQMtk4uLXHeg6C2O68h
 1yv8qD4/NBdaDJbzHaiZyKS5oi8EOnYDuiT8MUw2YH59DgHu03I9nvB/VDN5Wz67/vRq
 Ug1DBqGeEhUhI0EggVGW8DKz+YqRinAydsAsTTBNpXgf2ITSyQ2bWsvggx6PlFaE0iyv
 jmfrliQhKgO550A8/uYABLObyYMHY4p7rTmKjC6DUJA2MjhKPg9slJ72Boo5ApwLudO2
 jsB5N4fNIeSMwoBjwTFKmzHLRK2DLf09lnfxRiRDGFz0DPYKQ2BVM8U6vlnLVYp2mA8P
 PD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GVzmCQhcIKDolak0F4jGs4P4SEmiZUbXv7oOCo1SZME=;
 b=lSwFoOVN37dZ85PmJVxTp7BP/SexulYYjyHyIKJ1tcDc/+OzHXDQ72j28VXRHAsMNQ
 6hKEu6jS0yq27YVHUn3iNsbhKXtkFkLcrCd7N4vVm62Q7q/3v1G63+oIDYEj1eLkuQNC
 ir9YF0r/ML4JN+Bs41nV4IaGrY9encb0kNfsKjW0EIZPF85EDxnpFxW+CEOvgnrI3mN4
 adOh7ajmIm5TI5PAfF/dgmWB8M2FGwND79MLKnYziRg2ek6be/jAgxqs7eXr3ZJJPXQE
 46YVnRBaAlVLObXQ8rNGmFjE2CpOFIJMJtw1nca6akUZ8xiNTjK4eBDJIh1VGJNqDkfa
 dTCA==
X-Gm-Message-State: AOAM531AC4aXppKuvuoDxJMxGcrYrqb+HfUtQT/T20tc6k6lxIMfq+/F
 XgKFvG0GocqbVCAXo9mKoUFl4A==
X-Received: by 2002:a17:903:31c8:b029:10e:d206:cdd3 with SMTP id
 v8-20020a17090331c8b029010ed206cdd3mr456719ple.85.1622746572094; 
 Thu, 03 Jun 2021 11:56:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m14sm2973549pff.17.2021.06.03.11.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 11:56:11 -0700 (PDT)
Subject: Re: [PATCH 3/3] target/arm: Use acpi_ghes_present() to see if we
 report ACPI memory errors
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210603171259.27962-1-peter.maydell@linaro.org>
 <20210603171259.27962-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d77a000b-17dd-8c24-360b-ef40a8bb6b9b@linaro.org>
Date: Thu, 3 Jun 2021 11:56:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603171259.27962-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rJGoplQVyM7w

On 6/3/21 10:12 AM, Peter Maydell wrote:
> The virt_is_acpi_enabled() function is specific to the virt board, as
> is the check for its 'ras' property.  Use the new acpi_ghes_present()
> function to check whether we should report memory errors via
> acpi_ghes_record_errors().
> 
> This avoids a link error if QEMU was built without support for the
> virt board, and provides a mechanism that can be used by any future
> board models that want to add ACPI memory error reporting support
> (they only need to call acpi_ghes_add_fw_cfg()).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/kvm64.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
