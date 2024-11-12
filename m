Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7150591njc;
        Mon, 11 Nov 2024 23:14:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXPVGjIlRx3rcmwiDz7EMOOeLuasMmUxuMH7EiSjqE+7KgLVxZOaeCpPPuxe1XTeglRZD0lCwXZzzfYDA==@linaro.org
X-Google-Smtp-Source: AGHT+IFXaTjuxwZinMf+PTJPKLNshqBjZqxwZ8sIFq1GkyaZy5Wr+4kMtYvPu8l6jKWyY/OH4tAx
X-Received: by 2002:a05:620a:408e:b0:7b1:f1d:d0c4 with SMTP id af79cd13be357-7b331d979b4mr1790936685a.31.1731395677267;
        Mon, 11 Nov 2024 23:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731395677; cv=none;
        d=google.com; s=arc-20240605;
        b=V4ybr357iEcYB4MN0psdTuSHm2UKjxib8+VCxKmMTr/q1vlZI9Ve1XW1QoyM+aoWFj
         +J1ZEYH/1dEi8wBnJUnhc8hs+h/EpZhfWvMYEQTC1aOvFK6iC6LWAMUkUGRm9N+f0m/q
         kH5Z6QC2h9+T36TtUa5yrm2MNufQ4CbzyWlYw/tVviJQ4PP0kACC2W7JJFL2BopmWglu
         3wnNd1ZjtT1nxMUGZQpQtApfaetqq3j6vvGr8ceUw3P9olmX+uQRMok6i7HxuMcIbcQy
         VPCJ9L3JrwIPj+k5V1Re5It2460bwONXWjVB6XcmgiZzraSqbiudFJwXwy1JC5XKolmX
         0Swg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=zb8U/+doWBa05XRot33wTgCEXY9Yz0wFm0qnpMOM0Es=;
        fh=mR5Hg1ir68rV8KV3Gipk1DBlo4HdErxKE3U5WeuipWE=;
        b=BUZozu8elCaJqFeyz+aB1YeEmB4CM01xkulJrVzR0XKARQOKTl03+DNM2gOpThsKXC
         P4bCa1ESRoGuCu6t60Te9H6W42hEh59KQ0o7J83B79r2/hs2FHNlz4S6eXWUQw+V0FqJ
         FoUZFL+KrQ3UPfDMMo1iBsBgmQS5B48KaWF2tLlsFMoVGfjEWUAI0G/u3yPaV0W4ICs4
         AJGxH70rkldMa9M6z37955DyS3w4fVECFrZ5vnccXJI1JpN2RwYuKggrkyM24GvdFFiE
         kqdm7ugS2knxU1ypctFK05WBL3qxu7ez9AXhqiAp0brQmlzv0EKvltb46Qy2Ng6b1twc
         f2ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSJBHjr1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ab9153esi1288890585a.0.2024.11.11.23.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 23:14:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FSJBHjr1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAl6Y-0001ev-8j; Tue, 12 Nov 2024 02:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tAl6P-0001aX-Nc
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 02:14:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tAl6N-00072v-Ik
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 02:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731395654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=zb8U/+doWBa05XRot33wTgCEXY9Yz0wFm0qnpMOM0Es=;
 b=FSJBHjr1STIdVr4zVSHNwlS3LZel7r2gHI6yyfNy5qtksmIKmPkN5QfWbzY3tlgEonxNme
 uoj3/rdZ345+Av6H1mzwEfa2rHBSKatuMlEhFnOo/SRP/R5Csu2uyc+hf9hgtma142yUu3
 eRR0wktYVckaZvaKfPykcPZr9UGnReQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-FvdBt90rMuy8O2RotFpvbg-1; Tue, 12 Nov 2024 02:14:11 -0500
X-MC-Unique: FvdBt90rMuy8O2RotFpvbg-1
X-Mimecast-MFC-AGG-ID: FvdBt90rMuy8O2RotFpvbg
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a9a2593e9e9so387678566b.0
 for <qemu-arm@nongnu.org>; Mon, 11 Nov 2024 23:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731395650; x=1732000450;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zb8U/+doWBa05XRot33wTgCEXY9Yz0wFm0qnpMOM0Es=;
 b=ndn4eMGRRIZ3YZv1EmxtOhuug++Yaas0MXdw3NFk1UyL5JWzNXYAXE05J1Dk/ZEEp1
 25va4gO/hGMgspTS+e18BhsMYuzbnM//PJUKYjVyZgUSqCxuZYI5Fql3l2ksLmgEOPC9
 e+MREqg6Jaw+0FuQqwy2Dtj+zt4wb4atnDRkjnNOv0YzEHj6Csg9MAETRZwWOIkEil35
 qMTwJ+aa4PwUNtxABjd3jRfQ9kKCrk0nWAOjxqNN0ceg+0ll8DpiU6Yan4CEmHUN/hjY
 PJkVxt8KIQiShxml5UTKmu/rDg5J3xDcmjW0AXha+Pox3AejDOqjQIoEAr+NDZewqSgV
 fRlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+5vzRwbe4syZK849LSiHC3tAfY2/S4uMF1geauIu1eqU58hYb6Kc/AcGdcFS6ULvzOxwIfxDw6A==@nongnu.org
X-Gm-Message-State: AOJu0YyGGXcRUk9NU/XTvoyD3or6B/X6eGu8l3k6Bxsr0NIrwtVeAy0r
 r5N81Ajti9mWzEHeV7ihHhINPQZT/Ra9OToAjfYihsE5Vfv3Crb8PtRgyh/+T2PEJs0RW7/qmcw
 kF7qhXEJZm4ohsrTLzoktL8uH+OVBRglX0MXvYfIfSgcIY66Wvw==
X-Received: by 2002:a17:906:4a18:b0:aa1:e60e:6fe7 with SMTP id
 a640c23a62f3a-aa1e60e774cmr27884366b.11.1731395650169; 
 Mon, 11 Nov 2024 23:14:10 -0800 (PST)
X-Received: by 2002:a17:906:4a18:b0:aa1:e60e:6fe7 with SMTP id
 a640c23a62f3a-aa1e60e774cmr27881566b.11.1731395649793; 
 Mon, 11 Nov 2024 23:14:09 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-175.web.vodafone.de.
 [109.42.50.175]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a184f8sm675454766b.15.2024.11.11.23.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 23:14:09 -0800 (PST)
Message-ID: <f97df212-9094-4ea4-ab9a-3ca3f88a0c81@redhat.com>
Date: Tue, 12 Nov 2024 08:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] tests/functional: Remove sleep workarounds from
 Aspeed tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241112062806.838717-1-clg@redhat.com>
 <20241112062806.838717-5-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241112062806.838717-5-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bpsEwlOzqjKvs8bezNlf3q6_itxIACEcGrNEmJ3nrgg_1731395650
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
X-TUID: zfhEElX8DYoV

On 12/11/2024 07.28, Cédric Le Goater wrote:
> These were introduced in the avocado tests to workaround read issues
> when interacting with console. They are no longer necessary.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/test_arm_aspeed.py | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
> index bdd5771a794e..07a8905e2365 100755
> --- a/tests/functional/test_arm_aspeed.py
> +++ b/tests/functional/test_arm_aspeed.py
> @@ -136,10 +136,8 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'
>           self.wait_for_console_pattern('lease of 10.0.2.15')
>           # the line before login:
>           self.wait_for_console_pattern(pattern)

Could we please wait for the "login:" string now instead, to make sure that 
there is no race between detecting the previous line and the real login prompt?

> -        time.sleep(0.1)
> -        exec_command(self, 'root')
> -        time.sleep(0.1)
> -        exec_command(self, "passw0rd")
> +        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
> +        exec_command_and_wait_for_pattern(self, 'passw0rd', '#')
>   
>       def do_test_arm_aspeed_buildroot_poweroff(self):
>           exec_command_and_wait_for_pattern(self, 'poweroff',
> @@ -210,7 +208,6 @@ def test_arm_ast2600_evb_buildroot(self):
>                'echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device',
>                'i2c i2c-3: new_device: Instantiated device slave-24c02 at 0x64');
>           exec_command(self, 'i2cset -y 3 0x42 0x64 0x00 0xaa i');

Could please you change the above line to wait for the shell prompt pattern now?

  Thanks,
   Thomas

> -        time.sleep(0.1)
>           exec_command_and_wait_for_pattern(self,
>                'hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom',
>                '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');

