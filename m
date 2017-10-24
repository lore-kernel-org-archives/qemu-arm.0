Received: by 10.223.161.27 with SMTP id o27csp133328wro;
        Mon, 23 Oct 2017 19:31:25 -0700 (PDT)
X-Received: by 10.129.164.200 with SMTP id b191mr10485956ywh.1.1508812284965;
        Mon, 23 Oct 2017 19:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508812284; cv=none;
        d=google.com; s=arc-20160816;
        b=c5J9o/wWgU+w3+QFqvIcl7C/gaEjdq4jiaEHzKGF4O9ThiQy48r1cRW8Yo8DPt6397
         A395jJabFLkxGU5DPPS+fNf/+zCqZSQnVfLVr+dd7J+a6kGRDMn9soA+e8r6MFwozRLo
         SgY45zWOCegKeEU/Tj3N/Hz/rA6ydIy9b4vKBws+ccs5PLRhd6ajnsFUWHTLuKxRY11i
         WLTpLwJ7AO70seh+cuQQ2Xb0LVzKpbe/NwSqgBCjP1j/NXkvpboihWtsG6oNddJQYEeT
         2SBGQgHSN+dwsFFrVQ8bKODzV8kPJy4YEtI85gvx2sUFuDYuX1B/GGOwjsFwjqDFBSjG
         rGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=T90ClcnFYEHDPXrHPBR+/xJ5zQBHJN42G42kokoyU24=;
        b=HK1JflQ4neOEYVo7NUsSsN780uKM4vTD7ODhKUAZkgja8p2kpfe5RiY1GtwfN+wjr7
         0O6JatNODNWf1iq65KtxiYkjdNlVVaknQXnCrA42ZPTxeO7PZnQBIvBP32L7SrqOfgO+
         Xb3010KF3XSMlMp0ifAsNFtChaLQA+saPz5XGf97Gq5b1+LEr3QPPcs3QcMaeVF2p8SC
         JCfpTmROOlE1Gwht5eblt6BlxSyHqKquGNLdFAqUL8vmQBSplH9y5DhxHupGzkPW/Dvd
         mZrE6Osd+VWQDnNdUmLFRwEBcDRxixW4cyXBJkDGBVVldWnjEE8i7AZNVqQ7im9IjdUZ
         ZDlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n0gySCm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w190si210844ywd.566.2017.10.23.19.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 19:31:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n0gySCm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6p00-0004eE-Dl
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 22:31:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6ozr-0004cp-GO
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 22:31:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6ozq-00044U-Fk
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 22:31:15 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:51946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6ozk-0003yf-SE; Mon, 23 Oct 2017 22:31:08 -0400
Received: by mail-qt0-x22f.google.com with SMTP id h4so28679122qtk.8;
	Mon, 23 Oct 2017 19:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=T90ClcnFYEHDPXrHPBR+/xJ5zQBHJN42G42kokoyU24=;
	b=n0gySCm6Jj9G3bA3fDgx/g9yuapsZ5YPqVBWWrtUksDjeuAd7lqM+2jV0hKa0lRu9s
	U0xuWRK0bC3Rq8cyqnRZMnjQCas1B5HCjxjHjhKbcSISvHS/sFkIRvQ+F8UE3UILTDe/
	KcO4PlIEZ0entQcXOLcT6bMDeDsH4a2InuPTBNbeLDeruHtOnmw8IqMiplKkTtS7WXuw
	vPwqai/FXwgkUiDnOyt4+VRCrP5pcLmLcrUx2c0DunqhPCd7YkPezDb7aQmzz94iZzbx
	bOLEGohsglSTFtT+ZTXdtmk7hEwxc0DbpGCdSC+J2GvtvbpCS+CyDEU1XNli+ux7q/e/
	OJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=T90ClcnFYEHDPXrHPBR+/xJ5zQBHJN42G42kokoyU24=;
	b=g2KrpQdx8USSA4Rqggw9k9BAo0K58JrGZNh4bvOgabYh7TvC36z2G5VPAPlwkkWsWI
	zseoTkUKoKc73LgQgfaQkM+nI+57UZKPwvqu0nZygr3l+0Kftzcg6cs2L7X1nnZr8zUw
	ucRNwMStgjBddDWfzDy9EkBuHCfei3HjNTDIaycwZGnWP8+bgp5oTj8eVpRudCkYsbMK
	ZsrpYzm03KOVLk39YqqfomE15I3G/8l1HolxiTwC4BOQ/JU/egdk51wYZ4tmhrX1pah1
	QUosaKkZv+T8pd3WSbuDA3l5YTUFH6l6Lxsb7VxpNqFa45Zx93c8C7SoapDYWjdYYWDL
	30cQ==
X-Gm-Message-State: AMCzsaXb0cmQ34twT6reBlyL01YGchcKiSsbcu6P7H5dvRgFbV/uOTdZ
	LtPfFYju3sjkZA46CVfQ2YRw1FBK
X-Google-Smtp-Source: ABhQp+SWRydKbOMANMsQuynxaNXFdnKA7ZlwKEpfyYDqNYhVGlSmopjxrdwkkQr0a7bF8g8S6Y6W2g==
X-Received: by 10.200.48.151 with SMTP id v23mr21202810qta.97.1508812268104;
	Mon, 23 Oct 2017 19:31:08 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u48sm5794347qtk.77.2017.10.23.19.31.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 19:31:07 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1710211105550.27209@sstabellini-ThinkPad-X260>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <410334d8-4c51-bd2d-84be-daeefab85041@amsat.org>
Date: Mon, 23 Oct 2017 23:31:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1710211105550.27209@sstabellini-ThinkPad-X260>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: Re: [Qemu-arm] [PATCH v2] fix WFI/WFE length in syndrome register
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /cTwvBpPKcGf

Hi Stefano,

On 10/21/2017 03:09 PM, Stefano Stabellini wrote:
[...]
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index a39b9d3..6f74589 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11380,17 +11380,20 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>              gen_helper_yield(cpu_env);
>              break;
>          case DISAS_WFI:
> +        {
> +            TCGv_i32 tmp = tcg_const_i32((dc->insn & (1U << 31)) ? 4 : 2);

this alloc'd tmp var needs to be free'd.

>              /* This is a special case because we don't want to just halt the CPU
>               * if trying to debug across a WFI.
>               */
>              gen_a64_set_pc_im(dc->pc);
> -            gen_helper_wfi(cpu_env);
> +            gen_helper_wfi(cpu_env, tmp);

as:
               tcg_temp_free_i32(tmp);

>              /* The helper doesn't necessarily throw an exception, but we
>               * must go back to the main loop to check for interrupts anyway.
>               */
>              tcg_gen_exit_tb(0);
>              break;
>          }
> +        }
>      }
>  
>      /* Functions above can change dc->pc, so re-align db->pc_next */
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4da1a4c..a89518f 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -12325,12 +12325,15 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>              /* nothing more to generate */
>              break;
>          case DISAS_WFI:
> -            gen_helper_wfi(cpu_env);
> +        {
> +            TCGv_i32 tmp = tcg_const_i32((dc->insn & (1U << 31)) ? 4 : 2);
> +            gen_helper_wfi(cpu_env, tmp);

ditto.

>              /* The helper doesn't necessarily throw an exception, but we
>               * must go back to the main loop to check for interrupts anyway.
>               */
>              tcg_gen_exit_tb(0);
>              break;
> +        }
>          case DISAS_WFE:
>              gen_helper_wfe(cpu_env);
>              break;
> 

Regards,

Phil.
