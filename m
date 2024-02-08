Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp16713ejb;
        Thu, 8 Feb 2024 02:48:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrIj6lfcKFhAZJRhXDVEduAnRXg9EYg57sjOjuwDicyZRYi9oOqFPyFCrBrcBADaOjmjfN
X-Received: by 2002:a25:6844:0:b0:dc2:470b:887e with SMTP id d65-20020a256844000000b00dc2470b887emr8553393ybc.21.1707389305904;
        Thu, 08 Feb 2024 02:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707389305; cv=none;
        d=google.com; s=arc-20160816;
        b=Urnj3qQ6FFCmkn2w/UmHjQRPRnLcWSBW9n4SN5QuAUYe49iyGAkngjTSwd6ILdh1f4
         jAMk9L3w9rA7kALDycHQ+SpuGWezJWw1JNsSDEXvdd27loESB8bPTxHNEgpeIMgF6yfX
         MXCjpk3GG+61oidzgpyune9tCsyhPNUNCdT+VOPnjxoYgJTdpfhL3v1BBbJKhgORVkCD
         nXzkwWchexDBgv0lJm09Ppvn+o2/whoBBGIwDv3uMTY2aOJQ/3mhdYJjxHIwrE+YrHyq
         LL+m4TI2QzC9WbW2TTGMa3RPdTklh1gy1tWBI8MxJUkJmG22E5XxvQ5PWwwclZfY3nFD
         76VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=i1RjzGXtc8b/dFiKljzwEpkXvIyxAciDbn9c6btJVx4=;
        fh=nUmZj1xDBX58SIRRW8CwcdJ7pscCdxw5kR6pykuwBn4=;
        b=qddGFIIOPhA4uFfzM84nwSl8t/XL4vGB7nVR2/UwzMBlRQWCzQr7rp8WthicXzbYFy
         Bj8G561lo2EdKMIBLvnq9xm6CWEZDkMq6j+/5XOpbuLAuOMmiODV3+rGXXKU/L6+OY0k
         sulyF41wJUX3XkVNUS273zc4wbnJHfES+CmfY6L2iUD9zje/7IcgjT/69XtRC3ehFTK1
         p4BUqNrDkspEqrfBQt31fgOZNrPGt1/NEvYwKjGb71W6fRB8Tvao3umu5ZQjqJlZO81/
         XFEA1uIH5uhv2qYEWDCRGWF4D6xVZNQa4vo0YIrjgrAvph8vaCiZqk7atjLFUF79ZCSA
         d58Q==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aVzuTaKE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWmiYeeocnW9N6CKFov5Zj7UizzvmI+QPjz1n9EggYfeTpioAJM/vioZzBS1Lw//G6w4nlmMdiuNUNfCehLqWKiICTnDJ3V
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020ac85e46000000b0042c0dc588f2si2936529qtx.702.2024.02.08.02.48.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 02:48:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aVzuTaKE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY1ww-0008U1-Ti; Thu, 08 Feb 2024 05:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY1wv-0008Sk-Iv
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:48:09 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rY1wt-0006a7-5O
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:48:09 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51142b5b76dso2717737e87.2
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 02:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707389285; x=1707994085; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i1RjzGXtc8b/dFiKljzwEpkXvIyxAciDbn9c6btJVx4=;
 b=aVzuTaKEbHuHPbpvAaLLoyJ4qdZYN2gnNXgfOi7+PlWpRX4F1diVOR0/Rr9v9uaHim
 KaLDS0XNTQJyf0W0w5iiqu8Nqj9d7QvSyc8enl2tBauQFyYJZJkVALEfD+gq3Doj+IFi
 1bpwZAmk46GJSiOmQMDxLwu2cwT1Wu69dJr7tyM8J/kPlj1AsvU+7RrjsTgGkmfbhwJr
 DvB59i+t3QoZanaAGi8AvSA6ZWyrxYKw1SdBw2Gev10aPPUBRKZgjCJZMo2OWTU4icGj
 8gWogqOqiRds4AiwrhCSR/QFizPXvftVS23Tx6cLDW23kXnfV+rHX/frLB6KrEMMbTgR
 JtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707389285; x=1707994085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i1RjzGXtc8b/dFiKljzwEpkXvIyxAciDbn9c6btJVx4=;
 b=VqtSMg/EAFt31AW2gVZgehmPBNX5gqkZAnSybyRB09ZQ9l3PVlfC3C40+IA8n0rGi1
 Y/gU9zmFEUlvHheb4R5+EP281mPtdgEdGjKVyG1UyujdEmhca3MoKL1K7EezLDFYdvP9
 WdKsoNDUfC5RWDFhVmQaWgl7wOD3i5d1yo373xaoxTA3Ah+9uwqA+aDdt17tyFlviT1b
 Iqq9wvPWkQglQDfp/QUGclxxA8mjmvAQiFvGAmpcGEheF6KNY8+ec9k7J8JzZpkclbQy
 QAQHYbQ4PX5T5qAmPOKM8WTP8HGn3nt6qxthWiZMyyPBbLF74RUrhFhJlxQ/pxk764BM
 W4+Q==
X-Gm-Message-State: AOJu0YwjxdTvmELYUv/uJcMn5g88VMNcTThPv19vIFqUpCtRncHITNqR
 42wXv1PlDQ9LRNJQRVO9ZF0l4L8RXmll+J60xE9YwryZFCjztvZ6j5X8czU9/MY=
X-Received: by 2002:a05:6512:2039:b0:511:6534:61d4 with SMTP id
 s25-20020a056512203900b00511653461d4mr3927019lfs.35.1707389285044; 
 Thu, 08 Feb 2024 02:48:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU6MH6R2HQS+w7WCBY4wgVKrPk2Ie2EpmaLhdfs4Nkxcn12rLgwWDUWNqzaPzAKqhiowZe7po2FD0SAyGbU386otS7IEdNh31cWd5VgQuCNnGYSvYS1dhCpyJ2WQwsUXkeJTRvhAop2+8JdwSPQ1EqcCldv
Received: from [192.168.237.175] (226.red-88-28-0.dynamicip.rima-tde.net.
 [88.28.0.226]) by smtp.gmail.com with ESMTPSA id
 n38-20020a05600c502600b0040f035bebfcsm1249802wmr.12.2024.02.08.02.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 02:48:04 -0800 (PST)
Message-ID: <ffe07fee-0cda-4517-a64b-031cb922d806@linaro.org>
Date: Thu, 8 Feb 2024 11:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iothread: Simplify expression in qemu_in_iothread()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
References: <20240208101657.15962-1-kwolf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240208101657.15962-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: +bYIV8qrjrgA

On 8/2/24 11:16, Kevin Wolf wrote:
> 'a == b ? false : true' is a rather convoluted way of writing 'a != b'.
> Use the more obvious way to write it.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   iothread.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/iothread.c b/iothread.c
> index 6c1fc8c856..e1e9e04736 100644
> --- a/iothread.c
> +++ b/iothread.c
> @@ -404,6 +404,5 @@ IOThread *iothread_by_id(const char *id)
>   
>   bool qemu_in_iothread(void)
>   {
> -    return qemu_get_current_aio_context() == qemu_get_aio_context() ?
> -                    false : true;
> +    return qemu_get_current_aio_context() != qemu_get_aio_context();
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

BTW using the same pattern:

-- >8 --
diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.c
index ec98456e5d..d074762a25 100644
--- a/hw/nvram/xlnx-zynqmp-efuse.c
+++ b/hw/nvram/xlnx-zynqmp-efuse.c
@@ -582,7 +582,7 @@ static uint64_t 
zynqmp_efuse_cache_load_prew(RegisterInfo *reg,

  static uint64_t zynqmp_efuse_wr_lock_prew(RegisterInfo *reg, uint64_t val)
  {
-    return val == 0xDF0D ? 0 : 1;
+    return val != 0xDF0D;
  }

diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
index 301e61d0dd..bdd73bd181 100644
--- a/tests/tcg/aarch64/sysregs.c
+++ b/tests/tcg/aarch64/sysregs.c
@@ -183,5 +183,5 @@ int main(void)
          return 1;
      }

-    return should_fail_count == 6 ? 0 : 1;
+    return should_fail_count != 6;
  }
---
