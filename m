Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7167491njc;
        Tue, 12 Nov 2024 00:02:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVjd6WPzm8+Pu73driaTVkqjVDK7dsLKWe5QyBrFt5Rg2V/UNvOgYN520qYt7xV/SFMYUaOye+lK29Gcg==@linaro.org
X-Google-Smtp-Source: AGHT+IFIgR/lfVdIczGVyZ2vq8Y3/R2BF+aIB+etiUcUg6vwGHJtQkQCGJ0gGK7hSwcFVAijvavI
X-Received: by 2002:a05:622a:5919:b0:460:850d:cbda with SMTP id d75a77b69052e-4630938b6f7mr269129461cf.31.1731398521879;
        Tue, 12 Nov 2024 00:02:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731398521; cv=none;
        d=google.com; s=arc-20240605;
        b=HR3VFY6R4QtsiyWJ1gZTu/LrHPPMRBxx1uv2HhyTwIGVswdwUMUjaUd892tx/u9Z9S
         xFXOkhqzx8CvTWkgMJtLoWW1fr9tJtlD4kJD8Qg+l5kRiLJ/1QU/nYcWW92LsyExLV6W
         YXtkPgkQQ4Hz3TBoZ2TfrqjWoU24i9U5JvFOBlJgtDMspfTTIzWy83otKRj/slv2yB+q
         YrpYd9WxqPFOhmDSqJfqUoDjKHRImf8zHNZG3STYsbeLm9t13nxMcD0G8GFadQYoECm6
         UNc3itcI1YJ1uJEHZi0nSuxoU44CxPoU+R0K7payOqXU/5e0O5iEaooLSK4b+zLqycwh
         xTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=me7m3Ff2If6PHFRvOPduTppYCU+VNRwj/tjOWdLC4rg=;
        fh=8rGvy/qMgyjovH11V1KPyVYNdp/Qi/6mi6rWzmRtUpc=;
        b=Ni9oxPZaJqOB5tKwGASB2hVmGXcaPBFF1Qxpl7HmNG02KHJJLcvdyktNG7XLOjdfe0
         6Es13e7Q9BcMYZajHlrj/4fRptOdAcgd2mPEpsnyhhIDKR85/LEZmq0oH8j8+BxQQuVy
         qpl9MPSsUCwAXBWDx4nokD6TFQXUs2fEXwkZv/JeUtdJ6p9QmA6UCmnWiTOLZJfJP5i5
         ad9BDhwl30grec1+vhzT4J8yyWl60YzLw7zDf4nqNEz3P83Iy6ZAkCXD97HtExke7qaz
         Xh0Z4vUVc7LXJNiDbC9NbQcw6IKCW9b/z5La3Rr5gOraPF+51i1DDFfwzPd/TMwh8oUl
         5Z3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=boxpQ9W2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff6776e7si127907151cf.600.2024.11.12.00.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 00:02:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=boxpQ9W2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAlqD-0001Qh-Tb; Tue, 12 Nov 2024 03:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAlqB-0001QH-1L
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 03:01:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAlq8-0006t2-4R
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 03:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731398489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=me7m3Ff2If6PHFRvOPduTppYCU+VNRwj/tjOWdLC4rg=;
 b=boxpQ9W2FlmNzfUoD7XRYU6wIao9OAmSU5id8q6sIWrDbNeM73q31oJp7PrH+wmV3efNcH
 NgSbR8c+DDbmdOyG+XYnPPSqZRCH7rnzVLfIKkTzAmFeP+KJIexlRlssEWqyfcfwnlW4Lw
 zZLquObQ2cY5sNXlWIOsh7XHbyD1yt4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-dsfdMNfBM6SeXY8KLz8_ig-1; Tue, 12 Nov 2024 03:01:28 -0500
X-MC-Unique: dsfdMNfBM6SeXY8KLz8_ig-1
X-Mimecast-MFC-AGG-ID: dsfdMNfBM6SeXY8KLz8_ig
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7b15a8e9ff1so752020585a.1
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 00:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731398487; x=1732003287;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=me7m3Ff2If6PHFRvOPduTppYCU+VNRwj/tjOWdLC4rg=;
 b=ghmgqGNcFmFsbCCrvgaYFPdJm8aQlvVhGLhy+4z4Qj7TSMqhHqGv9DRUo7nzc0e3D2
 p4N4dgX2SAF/zjTY0+l0bXvbkbDcQG69s5lNT7pEDN8thXhDx+jZDynieLhfnsvUQ8rl
 CWKb0Zw0vWQfTn0TgJgnhCxphrC6sQcR8CiEjFfOUyfyDM9wUVUxURbsgq/TakLzaeZk
 vgcLhKGs2ZQ6jMrNmbhncpCWD/nbnfe9fLW96nZZf5y407h9taL2m3werfAdaQjzvr0c
 lG+G9C7R/nchsyrXG1d9TU1e6WEBj//ZuNkay1Pvn4I/CB7hmUQ38W6wsL015GTQ/zHU
 +4Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXPJf1TyEpcjdtSLX5/pNkiHtrnvUhrO/Zgy0xoK9vAZ9uXIvV+IChw3nlwhysizHeWIHB3ZhY5w==@nongnu.org
X-Gm-Message-State: AOJu0Yx8RF4i+K2LmiYLc2VwoicOy3UtbWh5iDppBFWQpQrhXR/EO3Px
 e8Hsp8Xw19WvykoIT2YeeoVWCU8o3ND4x4pAntqg9Yt6lG6jirnLDl5wTQJPiqPaorAX0ZNgvQu
 BfD4qH1cBvEjODR0Hc13uPbGGesve3c47duK+O2ry2oYasJEFHA==
X-Received: by 2002:a05:620a:17ac:b0:7ac:e879:1a20 with SMTP id
 af79cd13be357-7b331e88c15mr2436770585a.1.1731398487665; 
 Tue, 12 Nov 2024 00:01:27 -0800 (PST)
X-Received: by 2002:a05:620a:17ac:b0:7ac:e879:1a20 with SMTP id
 af79cd13be357-7b331e88c15mr2436767085a.1.1731398487307; 
 Tue, 12 Nov 2024 00:01:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b32acf47a6sm568556285a.120.2024.11.12.00.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 00:01:26 -0800 (PST)
Message-ID: <a84a1d5e-bc7b-46c8-9ab0-5e2470a3811b@redhat.com>
Date: Tue, 12 Nov 2024 09:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] tests/functional: Introduce _console_read()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241112062806.838717-1-clg@redhat.com>
 <20241112062806.838717-2-clg@redhat.com>
 <3bea84f6-098f-4956-a40d-651b567212c2@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <3bea84f6-098f-4956-a40d-651b567212c2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EUvPYPu8Qr25G0a8dgoDmauzCbUXiS1eJG-nvuRa23U_1731398487
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: baqs5Cww0aDB

On 11/12/24 08:11, Thomas Huth wrote:
> On 12/11/2024 07.28, Cédric Le Goater wrote:
>> Interaction with the console has been a problem in our avocado
>> tests. In some cases, the expected string does not match in the
>> output, causing the test to fail with a timeout. These were worked
>> around by sleeping before reading the console and even with SSH
>> connections in some places.
>>
>> To fix, process the console output char by char and not with
>> readline. This routine was largely inspired by console_wait() in
>> tests/vm/basevm.py.
>>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
>>   tests/functional/qemu_test/cmd.py | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/functional/qemu_test/cmd.py b/tests/functional/qemu_test/cmd.py
>> index cbabb1ceed3c..bb39857e6cae 100644
>> --- a/tests/functional/qemu_test/cmd.py
>> +++ b/tests/functional/qemu_test/cmd.py
>> @@ -12,6 +12,7 @@
>>   # later.  See the COPYING file in the top-level directory.
>>   import logging
>> +import re
>>   import os
>>   import os.path
>>   import subprocess
>> @@ -78,6 +79,20 @@ def run_cmd(args):
>>   def is_readable_executable_file(path):
>>       return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
>> +def _console_read(vm, expect, expectalt = None):
>> +    output = ""
>> +    while True:
>> +        data = vm.console_socket.recv(1)
>> +        if not data:
>> +            break
>> +        output += data.decode("latin1")
>> +        if expect in output:
>> +            break
>> +        if "\r" in output or "\n" in output:
>> +            lines = re.split("[\r\n]", output)
>> +            output = lines.pop()
>> +    return output
>> +
> 
> The idea looks promising, but I just realized that this is breaking the console.log:
> 
> $ cat tests/functional/arm/test_arm_aspeed.AST2x00Machine.test_arm_ast2500_evb_buildroot/console.log  | wc -l
> 12
> 
> Without your patch, the log is way more verbose:
> 
> $ cat tests/functional/arm/test_arm_aspeed.AST2x00Machine.test_arm_ast2500_evb_buildroot/console.log  | wc -l
> 232
> 
> Could you please have another look?

sure. I can add a log.debug.


Thanks,

C.



> 

