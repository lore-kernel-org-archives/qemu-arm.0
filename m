Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp3720833dly;
        Tue, 28 Jan 2025 23:59:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6VHh0ejVmPrgqMU+TQuH39uj8rvxtWmdD0JTK9NocO8d7QGA44BZznl8N5TBLlKRULfMC93/p+v0CMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFMo90W1R50MGqj5uylWimqLGaXc0Pg3ACgLD2ZCRv4zPlAZaCeSRb27yywZ2pvvERQpQRn
X-Received: by 2002:ad4:5d4b:0:b0:6d8:9a85:5b3d with SMTP id 6a1803df08f44-6e243bf2f8fmr39974556d6.7.1738137559690;
        Tue, 28 Jan 2025 23:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738137559; cv=none;
        d=google.com; s=arc-20240605;
        b=TU1eahg+qYbjpug5RXuiv+t/j0ROfkU7MobZATk3539kUuy5nBVcaUqFeMGiaWGKMZ
         YFbr+DGFCx5oBtFz3iaVwhavivyDdkbvlrQzUdCierPhFsAWZuFxKi9SB4U6EGr/NG5D
         k6fWB3UJFjACQiN6ngn5CIwWPNfsMbb0tldK1zF4rzmzYwjDmNOyQiUnmr/Ju7HY2+fR
         kAp1WpvMF69JakKkzk/yBKlcxIEKoONFR53ZCuRQ109dzANioX+UzhseL8z7qRnWsbsX
         t8QbQx6vCcA8dbHLgHwGixMV9OKS4y+MkD+YaL8rvITKs4XGtwvutxqgPHbWIkUkXy9v
         BmNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=cuWbisE8YQaDu5kzH4kxkbx0mLqwSzF7bsjHZSNC/IY=;
        fh=+Kqc//B8mbRH6easbIRDMzIO43Gdv4hT3mCtks1rQR4=;
        b=ZUk6gIYEUohpJIgHXFUmOH8ot+UP5kZpQA6wGw0/ld79EaSZ4sNKV2G4FG9mGA5sI9
         Apoi6EbHRPLgeb2PR7h6A1fqIu/7GiConnrprcRFb8gjqGHsiNMcwu/M2lb8iHonzeF0
         Ww0fUSKPJ37g1sFiOBxWFhqm3Kgyg3TENMXWFsE5MXIOiEs9URjWoJLOoiNeXWrKUman
         uLjyyt3bDwCX/5ErcoZEhSpd5SjnZGt7ql/Mgj6qvwoSx8kVBzyxE3rblTAn7pi3mCDL
         guZQaF86xpmVGCk5ivhrH9zKzrME/rp3wtTfcngrl6ULL20QQl4xBA/ySFAsKyW93yMa
         vXIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WLeOqLiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20525c040si159522476d6.73.2025.01.28.23.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 23:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WLeOqLiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1td2yb-0005c6-Kq; Wed, 29 Jan 2025 02:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1td2yW-0005bl-7M
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 02:59:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1td2yS-0000EB-1e
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 02:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738137539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cuWbisE8YQaDu5kzH4kxkbx0mLqwSzF7bsjHZSNC/IY=;
 b=WLeOqLiWGO2EKcWac/h0nFaxNpvcfSodebYZ73xtbtTlnHqBwKPBH1TlwJPTTv3lQZ8lhq
 5F9HfLXI1d7wT8CQDOZPhy+wZ2uB/rphaz8EQ4agQdKTwZ5jqft73BLHcJeLNKyVmvokQ/
 6mD+0Zplk7zd4jV63Xwbh6Qqsex3Nhc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-cj499TUtOayQNVr0W-PPng-1; Wed, 29 Jan 2025 02:58:57 -0500
X-MC-Unique: cj499TUtOayQNVr0W-PPng-1
X-Mimecast-MFC-AGG-ID: cj499TUtOayQNVr0W-PPng
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38a684a0971so2936760f8f.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2025 23:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738137536; x=1738742336;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cuWbisE8YQaDu5kzH4kxkbx0mLqwSzF7bsjHZSNC/IY=;
 b=bmsX9FaGZeRgSD8dcGwkTjyJXq4CZXaVX3K3Y2AnmG7NPZc6Jpl4bt6EAouB4KlNkG
 If3T5rkZne0XE0Xw/tDn2V1T2Uyjkdi6osqH84mrZ87n182TBIjA5urtYjoc8mfxnT/0
 +z1+OUn13YUwXZqC3bDlYAKwMgSROTKtrEKjcuM/Erz/Rw3CDmB9Xu74EXCF1ROQt+di
 vJVUGzsbGlZ7e1i6VjBHYwiQOpO/+1gFtopRfAZTicdM0yEqA/7ZDJQalq/06JQ/z1Rk
 pwel2SXYYmhXR0NvpL02+zHki/BHquXkm4MldZbPEV/Pi5XjV+PlK2aEaAv9EFRzdGU7
 RGqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnHDKoMOtRQg+hM8xiMM2y2RsHwsqkor91Nri1xc7d31rvEuSg8YF1Fz/KCzufluAejqn/B6F2tA==@nongnu.org
X-Gm-Message-State: AOJu0YwQ0QxyeSguP4+5Bnsp792sxi3aKnccp3VHtL8p3OZIl0ZBnZh5
 zUePTUvUiyy8pTdprs/YUI+Z1VCp19WG1gBePVrUg/YsOGZ+iWyhmIeOZecsrfn5FwhBWV8zi6H
 XN6ijChebBZUlpmGQoJV9wPwW1ReXl5SYoRh3r2jbqdX8fozDjw==
X-Gm-Gg: ASbGnctXAEiGmxFEqdG1xCi6szjDrd3ou7WGTNW6YRbwa5cLEoiZa4/PVQG2HDLTNoG
 c8eWp9V3JuD9232y1bBE+vWD3wAnSTngXve2gwRRUH4YGBrgGuZdZFpEn+W8xbaiwND0JzEOxnA
 bUzEEiLIXgJM0FLy6xS5X/Qg2bpr8LABindeHIymXKiT9+Ybxx3SQrZ6y3IO7cyRBe+/WqRF79s
 VxeynAwQfesElimA3p0EXXoG1GV+53Q3FJqPKpE+rpcIHR/XXMH1Ylmq/5waMP+U0ZOQRhzkwxP
 6ns+ap1FSR6Vj+C1HmDCcvr0WwaWsmOkTs07
X-Received: by 2002:a5d:6481:0:b0:386:459e:e138 with SMTP id
 ffacd0b85a97d-38c520941b0mr1231635f8f.36.1738137536231; 
 Tue, 28 Jan 2025 23:58:56 -0800 (PST)
X-Received: by 2002:a5d:6481:0:b0:386:459e:e138 with SMTP id
 ffacd0b85a97d-38c520941b0mr1231612f8f.36.1738137535911; 
 Tue, 28 Jan 2025 23:58:55 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-234.web.vodafone.de.
 [109.42.50.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d6d7sm16486722f8f.31.2025.01.28.23.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 23:58:55 -0800 (PST)
Message-ID: <98b2cdec-dcd2-44bf-a81e-91521e2bd446@redhat.com>
Date: Wed, 29 Jan 2025 08:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] tests/functional: Introduce a new test routine for
 OpenBMC images
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>
References: <20250129071820.1258133-1-clg@redhat.com>
 <20250129071820.1258133-2-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250129071820.1258133-2-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SXugp_Uzf6Rhz0paRj49HTv0dUE2xvzOrkYjoNwOy_U_1738137536
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VRDfbKXTpgU2

On 29/01/2025 08.18, Cédric Le Goater wrote:
> The OpenBMC images currently used by QEMU to test the Aspeed machines
> are rather old. To prepare an update to the latest builds, we need to
> adjust the console patterns. Introduce a new routine to preserve the
> current tests.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   tests/functional/aspeed.py | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
> index b52358bb8c61..51c821944842 100644
> --- a/tests/functional/aspeed.py
> +++ b/tests/functional/aspeed.py
> @@ -23,6 +23,24 @@ def do_test_arm_aspeed(self, machine, image):
>           self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
>           self.wait_for_console_pattern("systemd[1]: Set hostname to")
>   
> +    def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
> +                                   cpu_id='0x0', soc='AST2500 rev A1'):
> +        hostname = machine.removesuffix('-bmc')
> +
> +        self.set_machine(machine)
> +        self.vm.set_console()
> +        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> +                         '-net', 'nic', '-snapshot')

"-net nic" is the default anyway, so unless you also use "-nodefaults", I 
think you can simply drop that?

> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern(f'U-Boot {uboot}')
> +        self.wait_for_console_pattern('## Loading kernel from FIT Image')
> +        self.wait_for_console_pattern('Starting kernel ...')
> +        self.wait_for_console_pattern(f'Booting Linux on physical CPU {cpu_id}')
> +        self.wait_for_console_pattern(f'ASPEED {soc}')
> +        self.wait_for_console_pattern('/init as init process')
> +        self.wait_for_console_pattern(f'systemd[1]: Hostname set to <{hostname}>.')
> +
>       def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
>           self.require_netdev('user')
>           self.vm.set_console()

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>

