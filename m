Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp861719njb;
        Fri, 6 Dec 2024 06:00:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzhGB9rZsI1NOIiuEaRGtNcOxxHAfr4+64Wt/WwpsydBTiRgkOCrOXDYfOn3fmGsCzZDxq5q2JRGLxEg==@linaro.org
X-Google-Smtp-Source: AGHT+IFah6ahSMrNEKqORuYaFtwOu+6FG4lXJTlzZnVnoxUBi4GkQf9Ge5ne6Ry5TNs7jzxU63hW
X-Received: by 2002:ad4:5c66:0:b0:6d4:25c4:e772 with SMTP id 6a1803df08f44-6d8e71f382emr53204856d6.36.1733493604268;
        Fri, 06 Dec 2024 06:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733493604; cv=none;
        d=google.com; s=arc-20240605;
        b=acpcsQSIFXLLx4pU1XsLZDDGqkDJfzxH1svj1QvJLtV8ThwM3+gCxr20AJ1ndY4+Ds
         OqekmxgWhF747/C6ekiE7j+W8GxLTZ5RuJPX9bzk8TNXTLIrUX1eRxcnaEwnmj9sn2nL
         D33AYyHhjxVv+V29tPF5IzyvDKHCAaWd7YM2o06HabrM1t/PIo9QxfA7XgcS7H/o2May
         NuiDUKGxC5IGMCKqge84hJmrgd6/FtUOUy9vuPZIs2hb2ZGtP5vkduf+ZECnqDT7E0Eg
         U9lCENPGrr48U27eezReFsmKMvesAvK8gUvS76HFMsro3Uvs7PsTGxuOBa6fQbfmNaQQ
         5WVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Heu+DjuRugi1CyfCTP7ZfewxpxCCssuvWbEqWWDC82U=;
        fh=rszIqI4bVj5fCC5M04q2yiN3Mo3Zlm+BgGmcMZwzikY=;
        b=YZdTP4aeuuNj2cg9gccTOFaLimsXZvIGljZG9aSSI3Lhs6DB50MoQkggXHDfzdgdpo
         LfRvPxwRlx0Qm7jnC+Dr1a17WJP6nHX03G5+bZkhbubRV7CowDfAiSGknTujrIZWcm87
         r7swsmQKabgWCzuf2iR7Z6/kuQXDUTKvXSztJAvam/GMfyAFZi8dEhnvHZH50YRAbVGQ
         I2ZiQ9riMD4u1zUYhIc0Otog7xjwk4UT3WW+Wn6BU+amBZDor3kVvNoqs3GFGb9sq0pg
         PHJ/7Z6mQVy0BkjvtL6lnYB6sUPkPyngCGuy5BDRduFsscTCg+PLEUGofnGSV6tDRy9S
         tAEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R4+FqWMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8daa0838esi50136776d6.287.2024.12.06.06.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 06:00:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R4+FqWMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJYrp-0000ty-ID; Fri, 06 Dec 2024 08:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJYrg-0000st-6o
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tJYrd-0002D5-2w
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733493561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Heu+DjuRugi1CyfCTP7ZfewxpxCCssuvWbEqWWDC82U=;
 b=R4+FqWMYGCUH43Rlsuc367x36vGQPPe1VwEDW7zDkIdUYFKmcRUso18aiftja2W/grvam5
 MYz5p16fCPhYFstHYWiK4mOIOPUyQlNPMWC5FcVk0KC58LPIvBaTfPSBbeay0vfeI7TRH1
 w2JqIpKOVMMtCtiG+kWdpHPa8YKwbYA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-7Xzxz5mAO8aACx3jHXvZ2A-1; Fri, 06 Dec 2024 08:59:20 -0500
X-MC-Unique: 7Xzxz5mAO8aACx3jHXvZ2A-1
X-Mimecast-MFC-AGG-ID: 7Xzxz5mAO8aACx3jHXvZ2A
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385fdff9db5so1041292f8f.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 05:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733493559; x=1734098359;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Heu+DjuRugi1CyfCTP7ZfewxpxCCssuvWbEqWWDC82U=;
 b=lP9SS8XlotG2DY89ZrR95XlG1ah1qi44k+6V3PryFZsJLXImNwx54Btnb7gmf65jcD
 MR6UahYF/fFMZv96ALD96KVjF1DxLHXv2UiYQc3YXFPPcXD5XRxm+L0rsDXLbMoVI59f
 m50PeA8Dcr+YCfhrf3dqPqCitlRYxJ51AVRHMVDlc5bs5XCA06Z6Lld4rzXObXgCstkU
 loXA9QnxTMTj+4KDR/iuYNDXjnYeKu1cgJ+klHe6NJD9bA8v1MDG8KJOYfPWamWX6Qmt
 56xe4qyzc9WEZ8RjgOlrMp+p02vgE4p2w0K98l1IDefNW6q0ChRxg73f6NCkqTTox2t+
 ExfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfVIL+pDokAXJx3T0p08xGohKCdRYPsg4FMqOcVaQSMk3pAE+a/qkz/xxM4gfTMKmv/RZtYCBMaQ==@nongnu.org
X-Gm-Message-State: AOJu0YyBww7ztf5IbW6ZS4iLyipOiDPYZ2cJhUAUkc4xHUOIFsgZ7WcM
 9WFdvGGiRQZiTa1E5DrNuD8NeHdBrMhGipDmApzOZbkp155fXZx6hltZhdLnpfxKuigMPmOQeAB
 512iOuQHi6oZVtvLL02CFA5Fi/RK6gUu4JAFRgik8wE4R/jYP9g==
X-Gm-Gg: ASbGncuEr65xnYp+cljEoWUxvRUQug6qnepK77cl/Kz3KaC26no37RX4r7Y9MJWFb+r
 41EdFIj9vOpbARNqyCEfeMz93g2jpSIXxPV1h4FnrrQHXV32odch1pjCwhcLWzBh8FKDAukoZEF
 e+i0slbRwbmC/ZiYN0iKhAcMejX42G0ua6DEFO+Y65Rj8ra6j3yQ8alHp8Xsn1G7w/HmQJa/MH9
 C4chix5cR545siUSZDJFb6vS1GkayZsAzhJKN253Wgtfp5kQrcAbDLxlr9+tuZGqnUFk2lsqFTC
 QTLAGA==
X-Received: by 2002:a05:6000:1fa9:b0:385:f092:e1a with SMTP id
 ffacd0b85a97d-3862b334f24mr2495227f8f.11.1733493559012; 
 Fri, 06 Dec 2024 05:59:19 -0800 (PST)
X-Received: by 2002:a05:6000:1fa9:b0:385:f092:e1a with SMTP id
 ffacd0b85a97d-3862b334f24mr2495201f8f.11.1733493558685; 
 Fri, 06 Dec 2024 05:59:18 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-244.web.vodafone.de.
 [109.42.48.244]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862c1d346dsm1826061f8f.96.2024.12.06.05.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 05:59:18 -0800 (PST)
Message-ID: <fad4750d-6b4d-4258-a351-a8a79b376992@redhat.com>
Date: Fri, 6 Dec 2024 14:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] tests/functional: Introduce a specific test for
 romulus-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241206131132.520911-1-clg@redhat.com>
 <20241206131132.520911-4-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241206131132.520911-4-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qypl-xufhPSbU8LWsPKFwxbU4EUCXs_eJlRt0YKAm2w_1733493559
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: URK+x17IimUG

On 06/12/2024 14.11, Cédric Le Goater wrote:
> This simply moves the romulus-bmc test to a new test file. No changes
> in the test. The do_test_arm_aspeed routine is removed from the
> test_arm_aspeed.py file because it is now unused.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/meson.build                |  2 ++
>   tests/functional/test_arm_aspeed.py         | 26 ---------------------
>   tests/functional/test_arm_aspeed_romulus.py | 24 +++++++++++++++++++
>   3 files changed, 26 insertions(+), 26 deletions(-)
>   create mode 100644 tests/functional/test_arm_aspeed_romulus.py

Reviewed-by: Thomas Huth <thuth@redhat.com>

