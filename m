Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp607168lff;
        Wed, 16 Jun 2021 11:43:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRYuyBCo30fcU1PHN9u5CkI7r0F7AJQuIgcghENvgh+xJ8di8AQCoES3hcYLn/Wn9oPwAe
X-Received: by 2002:a1f:8d8c:: with SMTP id p134mr456790vkd.19.1623868997662;
        Wed, 16 Jun 2021 11:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623868997; cv=none;
        d=google.com; s=arc-20160816;
        b=fumpqLMjnRWqH2pmGeDcrq/TqEA0pw6iAWmiSLqtf8/uExCcB669obxAbdlhnFC+Ta
         7a97CUmaq5O5Rf6URbbAP3MlgGmNLwFdH4P11vSEL92qqTNV4MeQYp+WMpo5ssUAhdM4
         qNB/0zIjx8EU3Ls6M0wBTojwHWr9OpWjEW5XmsXvOx+GbBsEmuXj4h2li71j6p1LojKd
         IXNboXN1jFgONkh2nWC+sWJh6KqYRGbBOPk9jBhA4bytdN6va4InkCEMk03sBus6hBjO
         VV6Q3aW6n0WRhp4+pkxQUXKLnHaKCOg/DtmlvjRLnL5EDO+w9gSpe2r2m2Krx7Qg3HEN
         8v+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EykM4BVmd9aMzqfNPxJYF4aaY4kjslMU+NAnrQ6usHo=;
        b=A7WN9Covh6see/jd0TW00iyCTolMtrJm3PspIWEyx085aAXywA1EUh9i/2VA6IgMN7
         5sbIrPfKfUY/yuE1g6njAFY/9xv+myTIni509LtymK5+GbjR1fNIAYlzJjl8dVeP7Wot
         py5SKXWf/0XMl9lOSMGdjkOnNGqUmrT/+6kQHyVuK/K+508yqj0nukxTkZJup5+hQ9Hf
         fpyv6yArshWfG2YVvT9Ag4bBfMgrzV/kv+uDFArGQKw6bx1bRZxc2cAHnk85xuirVo5S
         z1GcHHRKowXaal3oD4XohGZip4MFmPXZvR7KU64vB53fZI8hYF+DWh9XlKZ8hDcqsn9Z
         k1lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vrVFaeWP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si2050553vkg.14.2021.06.16.11.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 11:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vrVFaeWP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltaVQ-0006V9-WD
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 14:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTz-0003HE-H5
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:41:47 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaTx-0003eP-P9
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 14:41:47 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t13so2703364pgu.11
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 11:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EykM4BVmd9aMzqfNPxJYF4aaY4kjslMU+NAnrQ6usHo=;
 b=vrVFaeWPbxBGmmqUE199JXZ6Y7wBpam2i31kNeKmQcuVHrWewoOYBlvK4XQ//0eEiM
 4VdxJM/4Q+wYDWewWrnke1dEzfT9Lk4S4xRU8YuRtF/5LeHzOSp7engTmxKd4G+Q6Vzm
 b9L+0G4LRazZQYXN6Nn6pSjL7e2vSKTbViDGvHllkVffw1a2siRsqyIyv3Cga5x1yAGv
 RewDgeqavzZRvbvKbL0zNwVEgfU38XOmS2m5Soxe4wII72Tc/g/qExheZ09BLIXnxn8p
 y5H5u7rb2Ca9EH2e+oJ998T4vAInKo3vGsoZnD2b5oZb7BULAnOEgqK2eGb1XoVkZAC6
 vpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EykM4BVmd9aMzqfNPxJYF4aaY4kjslMU+NAnrQ6usHo=;
 b=MIMJVvaBhI3NRZRNrBUA7m3EjYO/WfF0n4m83ptzKAnrnv0AhgSJYyspwLF77l4ood
 iLygVzjzmsfhzYcvLeDjBNFZH55ezh/chMKq11x80ARmypxVpyKJSeLV6E3aIRNrnTEX
 lebXi8pkzbCduHt2/ZG+LDHtOM5gMWDBciOQPyuBcXtkGUfJvDJ8sbbo0woyJcs3dNSe
 wzFAAYKZJJTd/jcWQZhzArveghvlCKgtonkgAYEjbG+qNY/4LV/mKr3b2qURGPEn+xDa
 /L8a/vipI0XVdmqzzJ+OLhRrINVG69+rzhUpYMrLWoIOVvIjH6hJlMmrqQBE4d1hK403
 Ynqw==
X-Gm-Message-State: AOAM530FYwwzNxOGSMQ82rllvO7s/wnPCFvSW3kSNjJowoQ3m/3hNUDn
 w8ZWrvxmdPS5ZGsLBaYuLNSKhQ==
X-Received: by 2002:a65:6243:: with SMTP id q3mr984724pgv.297.1623868904174;
 Wed, 16 Jun 2021 11:41:44 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u21sm2800010pfh.163.2021.06.16.11.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:41:43 -0700 (PDT)
Subject: Re: [PATCH v3 08/13] hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT
 cases
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <873776e3-b2b9-b8ad-4d3b-594450c8f970@linaro.org>
Date: Wed, 16 Jun 2021 11:41:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ds77v6BctEZj

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> To allow further simplifications in the following commits,
> start copying WRITE_I2C code to the READ_I2C, and READ_I2C_MOT
> to WRITE_I2C_MOT. No logical change.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/misc/auxbus.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
