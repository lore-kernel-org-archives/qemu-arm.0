Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp199378ejv;
        Tue, 7 Nov 2023 01:52:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTxc4HE7fUkMxKG7RBfySq1zqFr6mywGTuDLyeadhGN/c+L8k5D0j3AQQz4cSnhlwpnXh/
X-Received: by 2002:a05:6214:4115:b0:671:7955:606e with SMTP id kc21-20020a056214411500b006717955606emr28308030qvb.49.1699350776178;
        Tue, 07 Nov 2023 01:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699350776; cv=none;
        d=google.com; s=arc-20160816;
        b=LDWut4j7ir+nnNrba8+g3ghfxiLGROiLyoH1s7WMOTZqOIhpubszjIVqmYegJ9LJmg
         TKLtIX4OO8LFwX3/ngGHDGNTlHHHut/flh3+UicIBrnNsgA2pHSWV3klQT3hmDOuW/IZ
         KrBVHHBSih81FKj3g/gMiIB+3t1AeRKUlZl8JD1/yTcO6IVulVg6wJUozNNC6YgtIYJv
         xuKDvhGBLqrzqhmx/qjWPxqsndY2Av5P9z4cpg/TGmM2rUBfyK8Xc5HgcOi7R1poO+hF
         DpnLapVFWFVg2OUGPp8MD2KHTx2C8mmNZdvZD/r4rKwYBu/y4Rsiv2ZMonzWMZrkaA3g
         Jrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pNHHqSn01kEIqgnAJIMJl9RNUSlTWE7+Bits6YQfQNM=;
        fh=Dp3UB/0C+rKU0ZUEgky2fON9wx4Rk9/8n9mBE/26pXc=;
        b=Y8rAOnQjQqzyhzXV4Rob5tibtGawpPo+E45FMK38r9SOoZfjdITblEdh4yd6+bf6LA
         n7v9k4TKuXQ1U6AMRB/renAEP2dA6tXiiVGk3QsEltSn29Bv4ZlW8sj2wavS48braPCE
         s03sJEzqpwXJFMdfTZs51g4Yy6c2bSVsxiBmclbD8aRcsv0g7lyteV0c/K9RRedSj2JA
         Mry2gFwXvvYpDgL++yCgo02Y9ED3xMc6KqUkjlVKrYyjM8OGNLCWZRxesejBkeRqT8pu
         lh5jakg+H3wrkKFyJP4cUDlkETJuU6eTOnZqVLfEsm+iki7w7OiAO8Z6ex85vAsk/1dN
         kGPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmpZfFph;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a0cc204000000b0066cfbbee518si6887403qvh.389.2023.11.07.01.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 01:52:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmpZfFph;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r0IlB-0000sY-Mu; Tue, 07 Nov 2023 04:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0IlA-0000sB-0t
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 04:52:36 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0Il6-0007MQ-7n
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 04:52:35 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso9049205a12.0
 for <qemu-devel@nongnu.org>; Tue, 07 Nov 2023 01:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699350750; x=1699955550; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pNHHqSn01kEIqgnAJIMJl9RNUSlTWE7+Bits6YQfQNM=;
 b=XmpZfFphL2UWDICHJAw0HcxNAfEi9bUiVTToNQkm8uzNSg/pKLrfWNJZKh5eJX+yxg
 +rB5WFarv35KUsvVfH5WQwvn8zZ1tUJPvVkJPxAvPs/W3BhgYfg2bG+inbvoGHkgF/iE
 T5wQF5snybfhgrkLSrzNzawkeig/ZIxqszDOe2Jc4SD6zNlBw8DOi1XC6e1Ujeh/QEpq
 w1PXM9XrL2M10++mOpZAqmgx6ROsVwDQEDOhxL+dTlRpCp6YfLUmznF9OMGkKcPlmbYY
 LQWtZPkxIb+Xc7N8wAO0LOf+MVhHn7dtcN6aABMwS6dJvTsVgK4AKu7Rdz2CTp2jHSrv
 warA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699350750; x=1699955550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pNHHqSn01kEIqgnAJIMJl9RNUSlTWE7+Bits6YQfQNM=;
 b=PiR8k1g+qRjH6O5ynCWNS38vgS+uz60q8b6IkWz3kyFzHi0UjsMO9vGljleMi+O6IQ
 OixEIKWiCEHMTyhg61NxptZf2ijabaLae1BDQ7T5Ljsg4jH1XnTqQqOyrQUgggKyPLu8
 Sa/eGQj+QYI4DZLTL7JAd8r2JBBQuGT3GYxAEpXeVa4DFaYz+hXIil5pDRoURPlYGf8a
 NaKARF3EPBeF+7tQH2MogBDSnWR/i+gKkN6ZobSsuD4XeycMZlDgk0w5IUGRmFVROK4O
 tvJW7f4ySiyH1+mKCGrtVrZoJVyGHkZcRe+yZpeCrvQNqtu2S1gpwCNeyAGCw3xBFILv
 m8aw==
X-Gm-Message-State: AOJu0YzT/596HTNkTciemTb56N+OR102VMCAx6lAJpOuTCnAcE9EgKyZ
 qNpZbTn4FeNvwPQnV7lgSMvE3w==
X-Received: by 2002:a50:d553:0:b0:543:74e6:9da2 with SMTP id
 f19-20020a50d553000000b0054374e69da2mr15821839edj.0.1699350750262; 
 Tue, 07 Nov 2023 01:52:30 -0800 (PST)
Received: from [192.168.69.115] ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a50ed02000000b0053e8f1f79afsm5229252eds.30.2023.11.07.01.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 01:52:29 -0800 (PST)
Message-ID: <9a5c5b2b-db9e-421f-a4d5-b710c532566b@linaro.org>
Date: Tue, 7 Nov 2023 10:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: XLNX_VERSAL depends on XLNX_CSU_DMA
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 Francisco Iglesias <francisco.iglesias@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20231107090346.2614924-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231107090346.2614924-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Nl8fR3Sx8sg+

On 7/11/23 10:03, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes: 868d968004 ("hw/arm/xlnx-versal: Connect OSPI flash controller")

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8ce288a40c..fef992a402 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -484,6 +484,7 @@ config XLNX_VERSAL
>       select XLNX_EFUSE_VERSAL
>       select XLNX_USB_SUBSYS
>       select XLNX_VERSAL_TRNG
> +    select XLNX_CSU_DMA
>   
>   config NPCM7XX
>       bool

