Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp269068ejn;
        Thu, 20 Oct 2022 05:03:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM59jzF8bnAXgGRahK/ULZJ3PYtyVH1+tetGWbfyAZ1GIjkb9eoZLgg+ftYmFDS6Cl8XcZ+J
X-Received: by 2002:a05:620a:4505:b0:6cf:9668:f274 with SMTP id t5-20020a05620a450500b006cf9668f274mr8869278qkp.603.1666267435799;
        Thu, 20 Oct 2022 05:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666267435; cv=none;
        d=google.com; s=arc-20160816;
        b=ds8LkgJUUly+2vn2gAsSfCOAPSOOW8ZL6btwD1QslZ6tUs3bexg7l17KKOUQsI/Bxk
         6Rs0+BdfUBEEfZKTexTnF4Wr8Zz3tH4Ztl5tpQ8ri+GnD6XR9SzFD1FBHihYa2SVKK+/
         27ne8xEdmVJc0jNa2mJZHbSMGVNJH/dGV6n34fbuET/m0R8xhFBBsu2SUALaJBQ79nWW
         mRvkYixXd1FdAi05qkxPMP+TKX7fJu28aYzdnlh8SchKgwWNsQj8jmDpmLjJWjaAKEbN
         12sd/M4YntsahrLyuTmXTx0iQX/He1/Wu+Y8T0j+DjCQ7jyBmK41wu6RCU2NbDE48Nth
         FSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EF8OjhrYu/hVyDOPfsX0RBb0o+HBEomyd0T1PfIj4C8=;
        b=U8nIelNYVZjqyoHOOeBZvQcJ9cOxlQek5YAJoUHGSRdZymbknn3w2B1Smhk2NKXhht
         FzkCBhPr8AnuXjchrCX6oK3BXX7xz9naCNRkULQu/mNa3oRhpbafnIzh0PSGYYhv58V5
         ZyjOph474HowZ2p3y7GMPXQvDxuNn180wh7vn8UL/Ykp0x6mCo6BgpJvCSuxD2aH2Xb7
         ZKauLL7sN9w9uf2KzZVasYAbJ5cDEVtCYPznb8jBtYgY9JtvSQcgp+wdxOqDOE/sff++
         EoeHajefqgINJD8rpDiWPl7RUpNv9EQtkS/qriQxADxfRA69tbpZTVg3wtfAbxr5pzlY
         d3fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dUlOA9nF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020ac87245000000b00397d84ae982si9922003qtp.728.2022.10.20.05.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 05:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dUlOA9nF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olUHC-0006WK-Ho
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 08:03:54 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olUCl-0005q6-Mw
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 07:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTEm-0006ju-Vl
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 06:57:22 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTEl-0008UV-62
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 06:57:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id n12so33571762wrp.10
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EF8OjhrYu/hVyDOPfsX0RBb0o+HBEomyd0T1PfIj4C8=;
 b=dUlOA9nFarJEaFBQwuaVbLRWfEdgIWbEVgqDAii3cPSYmuMOooXTrC0p/NV6CoJArj
 zB6oNascpOJxW3g7LOX4shucKDHosJRoU5CVACayXBUmiDOl/KL1ZxG6/G7EBGzqn3pi
 qScxes0a1ikdmqE7x57CGZ53XXpteAM2FCX4ii3+EbmN/LJ3gXmKxuvFkaApE7D6RKgJ
 yASPzHuHeL8fTEUOrFFHkKnjRMTQKVvtFnpc6y3/HuiTQCd2wC0L7zf9WPmk9v8WMO0L
 5SWBb1pHRAT3+fVt9P1gfLWZzSmoYm4br+hhANNKe5UEoCrmUbc10/DaNpPxNLKLDjwh
 qJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EF8OjhrYu/hVyDOPfsX0RBb0o+HBEomyd0T1PfIj4C8=;
 b=HVptibXqhTSloyXOk1b1E3Q4CBwU1xwSfuzUKZ7KztKj21442+pXtWp/S1h4eTogCG
 e8MeLN/uB6jR+2U7OsogtexKhiSY54I7s85z0AB1skDwvPSEydFXck8aHxOwjPI9R32I
 nf3GyIUVVw9tpwJ9b0HaZ3/VJwOAuY/INyye7r2Ct5ofCalBM5hwcQoat5eM86+reOW5
 rFX27vthUbdDjgyvRLFHXxUYdocmpmyvSUmfzOAv7M4ZCDYA/y7ySX4p+q1hX5mn4JFo
 Lvc2shf+Kn3jrciyQ+PQWQmGZxHYaHqolbz+9WfPG3xul9KoBX77TqTpgqqDCI6HyAWG
 BLig==
X-Gm-Message-State: ACrzQf2ZKmL6YrEFvi6ZS8eYKdLBlR2rZHNBP4rJNHhpWOJ/GIFFe5XX
 r2W83fyxagqtYum1ROTZDQtiEA==
X-Received: by 2002:a05:6000:1683:b0:230:d0b5:72c9 with SMTP id
 y3-20020a056000168300b00230d0b572c9mr8662141wrd.336.1666263437304; 
 Thu, 20 Oct 2022 03:57:17 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 o13-20020adfe80d000000b0023580e7a2c4sm1826739wrm.86.2022.10.20.03.57.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 03:57:16 -0700 (PDT)
Message-ID: <ef5ffebf-1e5c-aaf3-2b6f-87c140858351@linaro.org>
Date: Thu, 20 Oct 2022 12:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
References: <20221020102012.3015662-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020102012.3015662-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8BTpb7Ey3P/e

On 20/10/22 12:20, Peter Maydell wrote:
> The avocado test
>   tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> finishes wiith

Typo "with"

> 
>      exec_command(self, 'halt')
>      # Wait for VM to shut down gracefully
>      self.vm.wait()
> 
> In theory this should be fine. In practice it runs into two bugs:
> 
>   * when the test calls self.vm.wait() Avocado closes the socket
>     connection to the guest serial console immediately, so the
>     avocado logs don't have the last part of the guest output:
>     https://gitlab.com/qemu-project/qemu/-/issues/1265
>   * when the socket is closed, a bug in the QEMU socket chardev
>     means that it loses any data that the guest UART has not
>     yet consumed. This means that the guest doesn't always read
>     the full 'halt' command string, so the test intermittently
>     fails with a timeout:
>     https://gitlab.com/qemu-project/qemu/-/issues/1264
> 
> Work around both of these by waiting for the guest to print the
> string that means it has completed the shutdown process.  This fixes
> a very long standing intermittent failure in this test.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index ca9d09b0d7c..eed4b49e6e4 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -489,7 +489,7 @@ def test_arm_raspi2_initrd(self):
>                                                   'BCM2835')
>           exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
>                                                   '/soc/cprman@7e101000')
> -        exec_command(self, 'halt')
> +        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')

Yeah :(

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

