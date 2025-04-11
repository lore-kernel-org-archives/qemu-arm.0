Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp539009njc;
        Fri, 11 Apr 2025 08:54:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnTBggIZpaonBmDH1jwyUoyOng8nJcZ5bqRkZrcfCCMMfxQ9Vi1pnS3DCS7kvY7Kp2e9g4StwR7ipJCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH/Hh62IDD7N6WwSK/IEp3x8sI1qjfNZUbHBS36A+Imvs+3E0+I/Ct+zAy4kpNxcuOR7bOt
X-Received: by 2002:a05:622a:202:b0:476:6f90:395e with SMTP id d75a77b69052e-4797753ac52mr51224281cf.21.1744386874203;
        Fri, 11 Apr 2025 08:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744386874; cv=none;
        d=google.com; s=arc-20240605;
        b=koGcDiydelFpr60HnSzV5B18C6l1F3uPFb1KAga25LBQOWkOkz3ClRPqZc/PEbRvXy
         k1JF7SH2Ivoeqg5Ha3akAOUiqcgbTsgAtt9VEetB+WdTLCvTcrfkdtooMlo1u9T+UhT8
         aOSEasI4h2aamXNz1F2Z5LtpPdfPUKE/NRqd0Qw9yEJf+bd9dRkp7esxU/9hJLLU9ym0
         6ZGt9U0aNTvYUDCwGV814EWeWMy8NnL0U07eiS2w8/iTQ5tAuGEMM+6RBHlO508GtHAw
         DPajErWB3xmWzCbh5rpJp0JgpY5uTobiamJMA2bsPXPidh61LwUJsOwtySm+U+jFv+KG
         a/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=Zxrq+N80RuzDVSPuAHUYR/rKs4RpqdvhVkrYkA6WyDI=;
        fh=aTXBRWvcUi1tLADA5DrDnV7F47mfdIt5smkQi/SmRpk=;
        b=Yz8Z+RHckFj+zWmvEpwVXPJevDk98YInIe1MgYTVBXs0fM+3jUxcY3CTnNE+MrzODn
         icKBvTu6XCrbUq6iHOZQVrvTqtbPed0iNG6vqPTJ7ycNeWmWiBRnT/gGgEXLmvfsWdNB
         4qABihvuftoBo3+banWJPyWs/MsddZiut+aSCxLX2fvAiduFhvrm+3gCbLtWO9LqcqcY
         lJCNAE/nGl5Lab0vO4SkpQ35ACLYPUd4rycLHF4pERwLMpEyWc3fA8mnORr8x17hfpW2
         VxIsGyzjOZYTRYgwKBnvzB5OgHfWFN6uRvHx1uzriclxGllE0/2c8EMwvujezLbNXD/3
         YoHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796eb1fb23si32750931cf.148.2025.04.11.08.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Apr 2025 08:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u3Gi0-0001fG-CS; Fri, 11 Apr 2025 11:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1u3Ghw-0001bA-K9; Fri, 11 Apr 2025 11:54:20 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1u3Ghu-0005qg-3a; Fri, 11 Apr 2025 11:54:20 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZZ1T04yC8z4xN1;
 Sat, 12 Apr 2025 01:54:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZZ1Sx0wbcz4w2J;
 Sat, 12 Apr 2025 01:54:08 +1000 (AEST)
Message-ID: <cd0a32b2-9d1a-42f4-805f-307f3e2a7bbf@kaod.org>
Date: Fri, 11 Apr 2025 17:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] tests/functional/aspeed: Update AST2700
 functional test to use vbootrom
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com, nabihestefan@google.com
References: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
 <20250410023856.500258-10-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250410023856.500258-10-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hVG8tCjcatuS

On 4/10/25 04:38, Jamin Lin wrote:
> Refactor the AST2700 functional test to boot using the vbootrom image
> instead of manually loading boot components with -device loader.
> The boot ROM binary is now passed via the
> -bios option, using the image located in pc-bios/ast27x0_bootrom.bin.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/functional/test_aarch64_aspeed.py | 38 +------------------------
>   1 file changed, 1 insertion(+), 37 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
> index c25c966278..971f548534 100755
> --- a/tests/functional/test_aarch64_aspeed.py
> +++ b/tests/functional/test_aarch64_aspeed.py
> @@ -36,43 +36,7 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
>               'c1f4496aec06743c812a6e9a1a18d032f34d62f3ddb6956e924fef62aa2046a5')
>   
>       def start_ast2700_test(self, name):
> -        num_cpu = 4
> -        uboot_size = os.path.getsize(self.scratch_file(name,
> -                                                       'u-boot-nodtb.bin'))
> -        uboot_dtb_load_addr = hex(0x400000000 + uboot_size)
> -
> -        load_images_list = [
> -            {
> -                'addr': '0x400000000',
> -                'file': self.scratch_file(name,
> -                                          'u-boot-nodtb.bin')
> -            },
> -            {
> -                'addr': str(uboot_dtb_load_addr),
> -                'file': self.scratch_file(name, 'u-boot.dtb')
> -            },
> -            {
> -                'addr': '0x430000000',
> -                'file': self.scratch_file(name, 'bl31.bin')
> -            },
> -            {
> -                'addr': '0x430080000',
> -                'file': self.scratch_file(name, 'optee',
> -                                          'tee-raw.bin')
> -            }
> -        ]
> -
> -        for load_image in load_images_list:
> -            addr = load_image['addr']
> -            file = load_image['file']
> -            self.vm.add_args('-device',
> -                             f'loader,force-raw=on,addr={addr},file={file}')
> -
> -        for i in range(num_cpu):
> -            self.vm.add_args('-device',
> -                             f'loader,addr=0x430000000,cpu-num={i}')
> -
> -        self.vm.add_args('-smp', str(num_cpu))
> +        self.vm.add_args('-bios', 'ast27x0_bootrom.bin')
>           self.vm.add_args('-device',
>                            'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
>           self.do_test_aarch64_aspeed_sdk_start(


I think it is interesting to keep both method for the tests, with and without
the vbootrom.

Thanks,

C.


