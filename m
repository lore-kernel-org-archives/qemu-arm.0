Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5108445ejc;
        Thu, 31 Aug 2023 06:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGS8xmEqmdvslmrE87kPpnw/xD06kbDpAzXc+iAUtaN8hYcJLGi8cTXE/c5EoIXZZVL/P1
X-Received: by 2002:a05:6358:90d:b0:134:c279:c81d with SMTP id r13-20020a056358090d00b00134c279c81dmr3480135rwi.20.1693489719648;
        Thu, 31 Aug 2023 06:48:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693489719; cv=none;
        d=google.com; s=arc-20160816;
        b=e+VPsj2fkuSNRlVu59A7G2I8lNOJchmNwCn+vkVJWDyfmGhGwHEfLIesF/TfJhzLYt
         zhZQfoGKeodkmfYkPTOqdtmNuJxmTDfIH/qoL9mah+d/tlgMBJymNeViKzhml42ZN05j
         a30Ihd+OfLrEk/fZdrKoENfwoZ1nv45/QQAUGueuW9j5B8k51oAP8vyRXRLaSdC78ptr
         xt9n0VxHJJ/+ALl5wvCvPtOtIdaVtD06w0NFihqPim7HTKyvQ8pnZQSONodXFSINocZc
         uVTeTn9jTnwJJk2QcAA5La4XYd5OKYr1e13E8RqPljUQSKPwk96UL26LPWJQusIImYvV
         T7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ylGHSm+VMkIhxBp03m5mU5AD9oDrynueHV9319MFZyY=;
        fh=0GhSOk+qK1WBQUsPekH2ZQ+vuBVcbIJttzPkzNDBkXQ=;
        b=s8yDOlnoH3qcx7QeG6kjCJELt193hly4YsSHGlASqvGXQl+wqHoTx/856Tlgpx3X6s
         u6SKB8QvbrP6/n2PVYjBp4JMDcwIVn+Ni83nKMTbFy0uvkz/RYt0XPMmnjEM7EbEdqVu
         D4jqu0gcy1egLS2SDAHbe55wWdHJb4VHB+qyBoIXyaynms+r051CwMqiTNKYRgPtrN4D
         WcMb4i7PRGXuCYR91XfiRygpAHOK1SLs2+OGFQSHMwd1u2ojGbudzLTs2RIZ8JiL4Pga
         2cMrCD8e5yM4MdSN23RNXO0nen2dwsYcgLRWj7PEM83W/j+/Cuz1EIDDzFldxDBFmUdV
         Tj2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sLIm/KH1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05622a148b00b00403a8c9d151si890651qtx.451.2023.08.31.06.48.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:48:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sLIm/KH1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbi1X-0004ZR-JJ; Thu, 31 Aug 2023 09:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbi1M-0004Om-Mv
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 09:47:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbi1B-0004SQ-DE
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 09:47:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4020b88bd03so8079105e9.3
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 06:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693489631; x=1694094431; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ylGHSm+VMkIhxBp03m5mU5AD9oDrynueHV9319MFZyY=;
 b=sLIm/KH1cYrfjX+prPCBnRdCY42XuBLC+YYuNojx+ZDRaMgm6YNcJe28BOcPpvi4bp
 YHbLjnvgwV0h7Wdj8+NZa4UPxK7K1OaP/VZq22JppB9WL7gUjt+mePNpMRi6MQ/GSpOQ
 +qaxpJ3lw5EP1yZ9ltB5xH07QVY2lvdE9iFx9J8LtlnZvI/bOh/LINCejij2LlaFyfWi
 iAed7RRg84igqqtQXiktnpayEy04rwFQ9WLjDGNP3OaI5Hu81scm/r1nYDqpjnrYTrox
 Zy/1i2KQp+1U3gnccR3WWeSZt6DxxE5UI0muy9vRyFqoszNLF0FU91+viy7KvRmOxjut
 YG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693489631; x=1694094431;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ylGHSm+VMkIhxBp03m5mU5AD9oDrynueHV9319MFZyY=;
 b=hIF9buCevuUhgAyDNfCJ3HwviI2egG1YiVCR/tHGUJLG/TN+jmaiuNxOy91e6xtSfq
 4yovgFZJaJAlnNmYjRz/5mD87F+OTq5EKYZRoIEM6/JqP3f0fi8GWQ6KhEGd8e6wSStT
 3pumRzDenq8Ej8gavv9lt+62MgYKPLfpmu+j20d5VBDOi1zSI5d+O+h+6aq/97npNM4i
 ot1b09NdjvC5tAdHtynbYrx4usXsnlF5U2x6Ii3sv1R+KhDIXzeaPPrCEm7Sr3HG8mFe
 lljIM0eHi78E947mE1E3gv+R5RxovrdX3N5mae6jr4FBOMN3qsA9v++5E8MA3sKPI2Qo
 lcMw==
X-Gm-Message-State: AOJu0YxKiu2YiMvKNAWZ7swHOPZxuJmUNiHJKcHtj+dykSkNcxEfgkJL
 I0LE1jbd4hVILZDlzv5BfEQz8g==
X-Received: by 2002:a7b:cb98:0:b0:3f8:fc2a:c7eb with SMTP id
 m24-20020a7bcb98000000b003f8fc2ac7ebmr3921584wmi.5.1693489630688; 
 Thu, 31 Aug 2023 06:47:10 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a1c6a17000000b003fc01189b0dsm1978739wmc.42.2023.08.31.06.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 06:47:10 -0700 (PDT)
Message-ID: <cc5480f2-f37b-c011-e291-597b8cb2e2f9@linaro.org>
Date: Thu, 31 Aug 2023 15:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PULL 39/41] meson: Fix MESONINTROSPECT parsing
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20230831125646.67855-1-philmd@linaro.org>
 <20230831125646.67855-40-philmd@linaro.org>
 <cc0e09e8-8ffc-741f-1ac9-5cebe312b684@tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cc0e09e8-8ffc-741f-1ac9-5cebe312b684@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
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
X-TUID: NyznXf3hIu/s

On 31/8/23 15:06, Michael Tokarev wrote:
> 31.08.2023 15:56, Philippe Mathieu-Daudé wrote:
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>
>> The arguments in MESONINTROSPECT are quoted with shlex.quote() so it
>> must be parsed with shlex.split().
>>
>> Fixes: cf60ccc330 ("cutils: Introduce bundle mechanism")
>> Reported-by: Michael Tokarev <mjt@tls.msk.ru>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
>> Tested-by: Michael Tokarev <mjt@tls.msk.ru>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Message-ID: <20230812061540.5398-1-akihiko.odaki@daynix.com>
>> ---
>>   scripts/symlink-install-tree.py | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/symlink-install-tree.py 
>> b/scripts/symlink-install-tree.py
>> index 8ed97e3c94..b72563895c 100644
>> --- a/scripts/symlink-install-tree.py
>> +++ b/scripts/symlink-install-tree.py
>> @@ -4,6 +4,7 @@
>>   import errno
>>   import json
>>   import os
>> +import shlex
>>   import subprocess
>>   import sys
>> @@ -14,7 +15,7 @@ def destdir_join(d1: str, d2: str) -> str:
>>       return str(PurePath(d1, *PurePath(d2).parts[1:]))
>>   introspect = os.environ.get('MESONINTROSPECT')
>> -out = subprocess.run([*introspect.split(' '), '--installed'],
>> +out = subprocess.run([*shlex.split(introspect), '--installed'],
>>                        stdout=subprocess.PIPE, check=True).stdout
> 
> This turned out to be wrong on windows.

Doh, thanks for reporting, I haven't noticed on the list.

I'll repost without this patch.

Regards,

Phil.


