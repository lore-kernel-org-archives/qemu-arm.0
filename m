Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2023018lfc;
        Mon, 25 May 2020 06:13:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrDAn0LaIVRQYnK2YCJP9xJcdvkWPkTFA5zEjVLSQzRYvp1EAI0q8HEbPBfZShFdaZruVS
X-Received: by 2002:a37:ef12:: with SMTP id j18mr18607107qkk.306.1590412399876;
        Mon, 25 May 2020 06:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590412399; cv=none;
        d=google.com; s=arc-20160816;
        b=Rag5SalznX49sr7QvKQIjpjzBeucWlEVbEvQ/npcDT3Xs+2zWBNERUToqKJpDrgbza
         Vg+kI9IZr8kIZ4TlvWm9A5SPWHWh4JrgzkyPD46aY++ac1MfDTL+32m0LbUyCCUq80Yq
         f5TJ7hVQO4bBPby3Mp5Lo+Kgk/l1g9P9DNZngP355kCeeOnQlfUwXYTjIeChxnwZiKwy
         bZCBiluGc5jOTAwEGpMuJd3i4wJZGjydrSiny+JVCBwPYx4C51Y8QV1sY7VYawmLcj3N
         u9wjYCOno77TXv/QDzyM7oeOqNyBM0jwefT9SHIazVQtzBM4YF60LiimtIqp07u+RJpt
         z+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=6Asb8qh3vzfVJ8VsVryFQmM6PWVGQrwTaZUO4GFR6AE=;
        b=BbMBAMM8soqtc0LEFXzEbY3IbrXI2/m8iyBUR7ViHVROgC8Bk7Rx1oWfx42ElP9IQY
         ghoHVifwtDtbO33pgkfo1m4Pydrovqs10/70ky17mjfKIGOnFNuej5VApqKXQSD+KWXy
         0bPfeuH4fLKsch3fDa5QNjynZK6DY8ldFSFPPv8N5OuqJIIz6gWOo/v5EYO+dqg+TwFU
         rC1dt6q/3zC4t6y7r79TVR/N8hTF9WLMXT7vBqxA+LvLbw2r99bSJCIag7fCddbiBcAd
         cyTxdnJgkFeycu6fCsIaYiDUXzK6qJwt75P5kRiWi26IrNdvPMVTq4JdLh3OUc3TLsXJ
         UqDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VNOhJH65;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si9948117qtg.256.2020.05.25.06.13.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 06:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VNOhJH65;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdCut-0001Dw-AB
	for alex.bennee@linaro.org; Mon, 25 May 2020 09:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdCun-0001Dc-0E
 for qemu-arm@nongnu.org; Mon, 25 May 2020 09:13:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35931
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jdCul-0003FZ-AQ
 for qemu-arm@nongnu.org; Mon, 25 May 2020 09:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590412389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6Asb8qh3vzfVJ8VsVryFQmM6PWVGQrwTaZUO4GFR6AE=;
 b=VNOhJH650HtHaHXwMJkhdC392tsOwLZQMCoqHKFxauOL5hN5BhIFjVjtrjfVTggMXTlJCw
 9KGz/vXV1votPPpAvEpeRuc7s8UHhIs+9EIW50Kz5hKdnz403VudlHfPcEzWi+c/BcuULq
 l/CjJnKRCyqtzDHz7Su+JOn37YbTaAg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-3OUgans9M0WPBA4rRiLQyA-1; Mon, 25 May 2020 09:13:06 -0400
X-MC-Unique: 3OUgans9M0WPBA4rRiLQyA-1
Received: by mail-wr1-f70.google.com with SMTP id p8so8212740wrj.5
 for <qemu-arm@nongnu.org>; Mon, 25 May 2020 06:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6Asb8qh3vzfVJ8VsVryFQmM6PWVGQrwTaZUO4GFR6AE=;
 b=fVrpwH+DR9esTECTs+SptCtVYqwy138AG3x8TLVL4S/GllWZjbOwJzShmiGMGoJ6k8
 GrOeZsiGKjBQAYkF7uDnDUcomu0DNNcrd99qCByDAe/UjvzCM3Rsf0AbpZzQAcjbQ7My
 ohAJOg73w8gHGofdGy45znLEmGrcfWCRucJuJKThLC4RtBYXaDXCrPfb39CwRqdoA6L/
 aQJVpUcAti7O8RxQc2INYyRWGqO5Lg/oc6QHIGnJT4LXYA8KoS0v/Cmv7Ieucv2Bypvd
 m1iUv/5MvlsPz8e7rB+lH0Dra1OpOD1KjfFdc+ekab6J0Eooo2ouqdtxYr3dh+MQkUu/
 v+cg==
X-Gm-Message-State: AOAM533J63+ZravOqAl27ZfBFUG12j3SjiyUwp9hPeQPhi9NkFfAhNgP
 mzPrYN+nHrNs4J+KMu6We0dB6BzLJZXuY4xu1rsiZexC90qcpAiuO0LgFSODS2gkkE3H63dsbcl
 8pN0QS2h7ewyV
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr1325249wrs.292.1590412385018; 
 Mon, 25 May 2020 06:13:05 -0700 (PDT)
X-Received: by 2002:a5d:49cd:: with SMTP id t13mr1325214wrs.292.1590412384641; 
 Mon, 25 May 2020 06:13:04 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id g82sm1710886wmf.1.2020.05.25.06.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 06:13:04 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Add a boot test for the
 xlnx-versal-virt machine
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200525072630.22280-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <53caef52-ad35-d44b-02a2-e0acd441b9a4@redhat.com>
Date: Mon, 25 May 2020 15:13:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200525072630.22280-1-thuth@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 01:44:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 60dEgo1n8Q9y

On 5/25/20 9:26 AM, Thomas Huth wrote:
> As described by Edgar here:
> 
>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg605124.html
> 
> we can use the Ubuntu kernel for testing the xlnx-versal-virt machine.
> So let's add a boot test for this now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/acceptance/boot_linux_console.py | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 0653c8c1bf..430a6c3b43 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -307,6 +307,30 @@ class BootLinuxConsole(Test):
>          console_pattern = 'Kernel command line: %s' % kernel_command_line
>          self.wait_for_console_pattern(console_pattern)
>  
> +    def test_aarch64_xlnx_versal_virt(self):
> +        """
> +        :avocado: tags=arch:aarch64
> +        :avocado: tags=machine:xlnx-versal-virt

Thanks for adding this test!

Please also add:

           :avocado: tags=device:pl011
           :avocado: tags=device:arm_gicv3

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +        """
> +        kernel_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
> +                      'bionic-updates/main/installer-arm64/current/images/'
> +                      'netboot/ubuntu-installer/arm64/linux')
> +        kernel_hash = '5bfc54cf7ed8157d93f6e5b0241e727b6dc22c50'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +
> +        initrd_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
> +                      'bionic-updates/main/installer-arm64/current/images/'
> +                      'netboot/ubuntu-installer/arm64/initrd.gz')
> +        initrd_hash = 'd385d3e88d53e2004c5d43cbe668b458a094f772'
> +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-m', '2G',
> +                         '-kernel', kernel_path,
> +                         '-initrd', initrd_path)
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Checked W+X mappings: passed')
> +
>      def test_arm_virt(self):
>          """
>          :avocado: tags=arch:arm
> 

