Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp3052179ejc;
        Sat, 25 Feb 2023 10:39:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9P4Yy8uNjcig4rvQM76xfZNYxizDCNdw3AomyrJylvZB5tLf8FMuCyZVGh5IZsjfmKglrO
X-Received: by 2002:a05:6214:1c49:b0:56e:9d06:730d with SMTP id if9-20020a0562141c4900b0056e9d06730dmr41391445qvb.49.1677350361785;
        Sat, 25 Feb 2023 10:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677350361; cv=none;
        d=google.com; s=arc-20160816;
        b=apuvJ0uCPUXlexH8IxPy6tvZEG/AlJu5+1SF/2OHG++1GmcpwF23qFQyLH9HWube13
         6UHFw+jExNM1JYDR1SOTglLHMg0I2ii/wLOcbqIXREQap1MADVMn6I++I00Em8lxqku7
         BQH0hgXnNP2UGtOC+Vu6E1qSocaSJychdcROc22PxLLyY9ap46nR3mf8tR88NXm+2F+w
         FqESf8b8L7SCBYMhc6yyPWmlV8XBqaqi2oFgx5XVgdaHYQvupWlkdEtuRFjFJLof9+1B
         E/TDnSVgGmO+itCEo608pLjJelx2iJn6Zr8EWYa8UlU+8NReEBc25K7ttN88SvCW9KKs
         vV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RuFK10TSCPDhZ5zBq/WmlGFcwRrVgs2wOo2eDDnr2Bs=;
        b=Z0RkvyHBpbLS4jiZRXgymUycqxShukUZhTTfqQAsf6VU1fMghIS7YM9uW+2w1cmDeN
         6B1eTVoipJQy223eMhG7bcsUj29TpUHE9zfU+DsAxo9Ih/86+cPmL3eF3dlpsLgOEzpe
         295m71Dga9Ymv8cqNyNR7ehhrRME3Wkp2Z96U3G8+D6B3KKa/iTY272R/YjogeSIacMH
         Kx1ADasLRT8l/+vZbBP1rJr+xbni2y0sWi9IL0m56+0Bezn6d5/F203C3mtqCt2rEP/v
         TVKHlHjVXZAUx/TFK5N7NIo7JZXnXk7C0wTR99BbRLM3+z4YyNxqM7KJxtMFKeGErlUC
         MIhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mzId2zgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a370705000000b007426e323882si2112629qkh.700.2023.02.25.10.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 10:39:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mzId2zgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVzRZ-0006mM-9C; Sat, 25 Feb 2023 13:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVzRY-0006lH-5b
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 13:38:48 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVzRV-0001rF-MA
 for qemu-arm@nongnu.org; Sat, 25 Feb 2023 13:38:47 -0500
Received: by mail-pl1-x630.google.com with SMTP id n6so1388466plf.5
 for <qemu-arm@nongnu.org>; Sat, 25 Feb 2023 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RuFK10TSCPDhZ5zBq/WmlGFcwRrVgs2wOo2eDDnr2Bs=;
 b=mzId2zgTauI/9PoxrdAKlNXH9F+3gCng7qE6pVQZ8rF7L7iSKMWBdMQzzmIRtJvSwn
 ia8tSvqqzFz7hab65FDgXPB/rGNUkcm/I1dIVXB5Vw1o3uIUyTg2aFunrrTLsBKiUSSm
 1wdSI+xMWAaFMXc5vaZtypkDO39C0M74Mg2/WJ5yM3wCIli6qnewazOANQqfTZNVl6gR
 zSJXw2jcou2LLq32WRKKxBhuA/hy/c29vwT+v4ausvHrOaPRxkTgtQ17lnc9ji/pm34c
 cjBilkyB4u3oYZj0436Xd7tdmbxc3florVEjPo11yyBltZtXaoKnwOBDSEases5VaAi3
 iZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RuFK10TSCPDhZ5zBq/WmlGFcwRrVgs2wOo2eDDnr2Bs=;
 b=ltfAWq2mIau63xSNDQ/8/7yOE1++cIB0y5WWVP2VoNmBel50YucpK/0BFTKXy8xRxG
 q1+oiBf5Y1HTKwa25xpOZ7Nx6FbxZl80aoNQae4b/Z7aBJsZV/6vvXBS2unmxEuTxj+E
 ObXwlhXL6ZQTVlfiuqGyl7qGLfH5MXN8jA0IWGllyB81oarNYKrrKZvq9CNkoKWzY3ma
 97WjYtJDMH6dueCSviMMB3FbhEwfGTrnvwWDrTpjr6xxNGWF4Z3bDTzwqDUlT65O6qtq
 UYanm6e+T9/wsP5IAdevrjxuFJN3cYyAEEkWRD5wDeHawGYXbeFf5es36m8Xx+s95PgB
 hi7w==
X-Gm-Message-State: AO0yUKVaCogdGMHCsnB7DP59IxydwDm6DH0VERQMKPzgSBV3mLr1+z98
 r0c4RnuvsJtrL8jBRGwehUG1Uw==
X-Received: by 2002:a17:902:f687:b0:19a:a43c:41aa with SMTP id
 l7-20020a170902f68700b0019aa43c41aamr20247109plg.66.1677350323998; 
 Sat, 25 Feb 2023 10:38:43 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c08400b001978e84753asm1576942pld.65.2023.02.25.10.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 10:38:43 -0800 (PST)
Message-ID: <06a53b69-b58c-168f-7e7d-bf7d028ebccd@linaro.org>
Date: Sat, 25 Feb 2023 08:38:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 74/76] tracing: remove transform.py
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-75-richard.henderson@linaro.org>
 <c12cd821-59e5-36c3-0231-f81e3a4e1433@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c12cd821-59e5-36c3-0231-f81e3a4e1433@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: muRrG+hGRhHy

On 2/25/23 00:22, Daniel Henrique Barboza wrote:
> Richard,
> 
> Not sure if I forgot or missed something but this patch breaks my build as follows:
> 
> $  make -j
>    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
> [1/885] Generating trace/trace-hw_hyperv.c with a custom command
> FAILED: trace/trace-hw_hyperv.c
> /usr/bin/python3 ../scripts/tracetool.py --backend=log --group=hw_hyperv --format=c 
> /home/danielhb/work/qemu/hw/hyperv/trace-events trace/trace-hw_hyperv.c
> Traceback (most recent call last):
>    File "/home/danielhb/work/qemu/build/../scripts/tracetool.py", line 19, in <module>
>      from tracetool import error_write, out, out_open
>    File "/home/danielhb/work/qemu/scripts/tracetool/__init__.py", line 21, in <module>
>      import tracetool.transform
> ModuleNotFoundError: No module named 'tracetool.transform'


I saw the same thing on gitlab, but not on my laptop.  Weird.

> It seems that tracetool.py is still referring transform. This fixes the build
> for me:
> 
> $ git diff
> diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
> index 5393c7fc5c..c361815bc1 100644
> --- a/scripts/tracetool/__init__.py
> +++ b/scripts/tracetool/__init__.py
> @@ -18,7 +18,6 @@
> 
>   import tracetool.format
>   import tracetool.backend
> -import tracetool.transform

I also removed some code below that used these symbols; they themselves appear to be unused.


r~
