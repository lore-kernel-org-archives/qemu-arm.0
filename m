Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4427219lfa;
        Mon, 2 Nov 2020 18:19:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzctNACNtuWPSFsOV7dkuY/H7kN/EhSGPDZEVWPtmtDXg+iLYG1fPhoe/A8qDF73jdu5ZwS
X-Received: by 2002:ae9:e70c:: with SMTP id m12mr17864660qka.52.1604369994509;
        Mon, 02 Nov 2020 18:19:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604369994; cv=none;
        d=google.com; s=arc-20160816;
        b=NsHHdpf/06+lHKGVonNSHYCIXeEvGhPk5/oqvjWJ4CUJuyd/dcFMmKIJ1MdqkwZ9Nl
         0WDQNwb+/gv6x6vccuOglkxHfvfI0ksTnAE1gRKa9gRjgalodn6/Flr93R6hXOEslo5d
         CPPPDV7DimABXtFB/7c2Ce+mD34Zut3qISccM8dIW/Eg72v0y77jidu/IBhQFHHyoY+h
         p1/EZITbz6Y4OU8ICBffwU/IjoTjT9eKde8/mlHn+YSWcwUqjTn5ibGuK58HTzaDd3z3
         110ZIEz94zrCU4slEWZ7Zj4O6lJXCTONwoYIMKYMDD8ZqROvo0SQEwYyKPL67SexlZeq
         IHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZLShU8l8nGVanUwnbwUmc67eR4WJS0nl6uROTb3rb2A=;
        b=kB/NMbkod+3ANMIn5LeBk/OnWOHGmZD8uRvCRSBXCCC5M3iA+KqOjXku9AKC5kEmiY
         MBZOlgKmVg1NHXNdAI2yueXA41TsJ2OJJaIBXlQrPgv85LzvRhm69IZNegwaYnRLVIav
         prIYHNttBUYHKDdJRR6KFMgI0hg6OJjy1eUy6rfsIiDJKD4H0qrSdyjQv7stj3X4UvOf
         51L1digVvQ8KPtqsoQPCyw0o7bk69RZYtjQ+JWk4Vy0hRli0yY9CKYRMNlqQ16bHUP5i
         FD4EH81X/CnTVeli3tLRh2H5PY3sVLYISvt7h3zVKWw6cCJyE0tntiksKZG7U+rGQgAb
         G1Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VCfyTdT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9si4929259qtv.6.2020.11.02.18.19.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 18:19:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VCfyTdT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZlvN-0002Rz-U1
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 21:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZloE-0005g0-FP
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 21:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZloC-0004Db-Rc
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 21:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604369545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLShU8l8nGVanUwnbwUmc67eR4WJS0nl6uROTb3rb2A=;
 b=VCfyTdT7VpUXQO8gk3XXxTK2LQ62bQiCy6XaYaMmz9yJAoIiPGmjMlpwjD4xsbIZAjTK8Y
 ydeu5z5GupQaHmHLMzjDZAhOXwj7RwoZjSaMNlfyhqWV563RX4uuRcA+ePRTJOQUtj2JbJ
 kHTFYeUw87By8/GColoVckz58qhvQ1c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-8Lt1vOktNxysA8UBHEFGqA-1; Mon, 02 Nov 2020 21:12:21 -0500
X-MC-Unique: 8Lt1vOktNxysA8UBHEFGqA-1
Received: by mail-wr1-f72.google.com with SMTP id n14so7197805wrp.1
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 18:12:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZLShU8l8nGVanUwnbwUmc67eR4WJS0nl6uROTb3rb2A=;
 b=oLTI5ET6uC4dboBNZBzl4FyGEdIiCnqbtUW7Go/wgOkiIXxvuVH5gLN91XGoFYCHkF
 tx3DguJBqidbLm5APqs5YuiA1bDpMqV8nKOVxMRXzP9OVTy8w0RwyBRfyeidMTAb7iTD
 k/Bv+HKAc7eravy5gTP0Rs2+Wk03OV6DlONcxt72XqYJ1aTbu8kCYMYOuys23MLsjfIS
 NV77Vu44BtMpBgiletmFrXQteqqfdu66stnEysgKLZJLNFfgm6JA401S4UPShGSJF594
 gNyWPgXBu1J5bwn3JLN2XY+RcmH9nGKcG5xRgCCal4HSnI54i4vj7fpZd6msxc3H1o4N
 CC4g==
X-Gm-Message-State: AOAM533QXqQk84iHjLLn8wGQkCtmDCwvlgANj2KHFeJMQsxizJhSUo+k
 AvfUOXpAsgTf7mhnGSKSTkK1ODWKi03KdydXp3mWnQFrUEKRUf07enBLUOaJfxOB3Q23CuYvd4s
 UPKG6PGokf7bi
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr22565738wrx.278.1604369540551; 
 Mon, 02 Nov 2020 18:12:20 -0800 (PST)
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr22565709wrx.278.1604369540415; 
 Mon, 02 Nov 2020 18:12:20 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id m14sm24233009wro.43.2020.11.02.18.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 18:12:19 -0800 (PST)
Subject: Re: [PATCH-for-5.2? 3/5] tests/acceptance: Skip incomplete
 virtio_version tests using '@skip'
To: "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201102144245.2134077-1-philmd@redhat.com>
 <20201102144245.2134077-4-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <974b193f-cf4b-832b-b963-e4a72fa14028@redhat.com>
Date: Tue, 3 Nov 2020 03:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102144245.2134077-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 20:52:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Michael Rolnik <mrolnik@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fabien Chouteau <chouteau@adacore.com>, Aurelien Jarno <aurelien@aurel32.net>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XosaRoaan9za

On 11/2/20 3:42 PM, Philippe Mathieu-Daudé wrote:
> Prefer skipping incomplete tests with the "@skip" keyword,
> rather than commenting the code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/acceptance/virtio_version.py | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/acceptance/virtio_version.py b/tests/acceptance/virtio_version.py
> index 33593c29dd0..187bbfa1f42 100644
> --- a/tests/acceptance/virtio_version.py
> +++ b/tests/acceptance/virtio_version.py

And I forgot:

-- >8 --
@@ -14,6 +14,7 @@
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..',
'python'))
 from qemu.machine import QEMUMachine
 from avocado_qemu import Test
+from avocado import skip

 # Virtio Device IDs:
 VIRTIO_NET = 1
---

> @@ -140,17 +140,20 @@ def check_all_variants(self, qemu_devtype, virtio_devid):
>          self.assertIn('conventional-pci-device', trans_ifaces)
>          self.assertNotIn('pci-express-device', trans_ifaces)
>  
> +    @skip("virtio-blk requires 'driver' parameter")
> +    def test_conventional_devs_driver(self):
> +        self.check_all_variants('virtio-blk-pci', VIRTIO_BLOCK)
> +
> +    @skip("virtio-9p requires 'fsdev' parameter")
> +    def test_conventional_devs_fsdev(self):
> +        self.check_all_variants('virtio-9p-pci', VIRTIO_9P)
>  
>      def test_conventional_devs(self):
>          self.check_all_variants('virtio-net-pci', VIRTIO_NET)
> -        # virtio-blk requires 'driver' parameter
> -        #self.check_all_variants('virtio-blk-pci', VIRTIO_BLOCK)
>          self.check_all_variants('virtio-serial-pci', VIRTIO_CONSOLE)
>          self.check_all_variants('virtio-rng-pci', VIRTIO_RNG)
>          self.check_all_variants('virtio-balloon-pci', VIRTIO_BALLOON)
>          self.check_all_variants('virtio-scsi-pci', VIRTIO_SCSI)
> -        # virtio-9p requires 'fsdev' parameter
> -        #self.check_all_variants('virtio-9p-pci', VIRTIO_9P)
>  
>      def check_modern_only(self, qemu_devtype, virtio_devid):
>          """Check if a modern-only virtio device type behaves as expected"""
> 

