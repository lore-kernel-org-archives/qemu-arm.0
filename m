Received: by 2002:a05:7022:458e:b0:46:22f1:8c13 with SMTP id cf14csp424861dlb;
        Thu, 20 Oct 2022 09:17:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hvHbeXWPDTEUNS0gX2V2MJfbc1EcgBKq8FyOdQEjy2hYwc/vHfPNaRJyFHlkfH8WicUZ4
X-Received: by 2002:a0c:e150:0:b0:4b1:ae36:f0dc with SMTP id c16-20020a0ce150000000b004b1ae36f0dcmr12203814qvl.13.1666282676661;
        Thu, 20 Oct 2022 09:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666282676; cv=none;
        d=google.com; s=arc-20160816;
        b=yOj1rxD3UUA3uGSwjCaZrUEZbOIQqVqwtJl6aWgAB62tCNoRV6O+QLQw/iDUEGWMSx
         kP7TNeU2gjU6AbtnQEe94+hgBYFw+rbI9ghouBp3i6uQZT4LWxSUlk7CYjlrmQ9WazjY
         SZojqO431CVRi/+iPBw6s/EsJMHV9pypL30/GXoEJ+nrrTNo/gYG4a1OqUb7MS/bLCX4
         D5Yu95riyiVsjaSnwpkUwGC5vChMEFmz2u2iEVquyUgpnaQRV+tiixzKV8htG2pKGBXa
         TbRhUfgx0IzzWN/13ZqytrOSRWbZEajhGkCeKgvdpdLkMAL7o4MzRLvpPsGAJS9Hd3mM
         DVCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CacqzopRIDrN4tXf/pt3CM8u+XjcFphTFc0D8JIaXFU=;
        b=IqJj811+AGD94LowWD83C1a47gg2KtLa7uAQ5Zs6DhYk4ossz96M5I+ityNBpO2n0x
         MfrkhpG02z5bSazUd5MxihKGM3hpA1R/tO07PrB+LAnxhoo8oV3etWfBFjST5DxII46A
         EDqoCkBAykKEBaS8Jp04rzPPw+VLp1x4EtAUSutrpx3ki2GXavwhfdG2H+jurHrgkaY4
         czRcSxnF7Z5axDakm0Bk8qkrcQ8KHR3wbnZw5aP/YkyHJLUWpuMvwbDNacnkjCVJYw2A
         sK7LBG0uUc7RCeQhX5pstcabIhG4XMiaggRv5hv2u3qez06Tsnhp7umCfPX8/kIp9SrD
         NfeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GfiNExf9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020ac87e95000000b0039cc8321725si10854365qtj.286.2022.10.20.09.17.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 09:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GfiNExf9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olYF1-0003FN-Uf
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 12:17:56 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olXxC-0005eR-K3
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 11:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1olX8H-0004lY-CB
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 11:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1olX8F-0002HL-Px
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 11:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666278411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CacqzopRIDrN4tXf/pt3CM8u+XjcFphTFc0D8JIaXFU=;
 b=GfiNExf99FegetzoWvyd+PDsme0OsRAER3LPch11D0m0yjxUaBdDRSfxa3TSL/ibFjo9kk
 b03eLloRAwreGg4azdBFNE3NXMIc9v7MverA0gug0wZL7mghysq2dkwYq1ci+KYiZO+L2h
 v/D0TelOgFqLzchjoEsYwHt6NWVfY2A=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-rwf1W4zLMweNQLSw-4QcNg-1; Thu, 20 Oct 2022 11:06:50 -0400
X-MC-Unique: rwf1W4zLMweNQLSw-4QcNg-1
Received: by mail-lf1-f72.google.com with SMTP id
 u2-20020ac25182000000b004a24f3189feso7062458lfi.15
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 08:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CacqzopRIDrN4tXf/pt3CM8u+XjcFphTFc0D8JIaXFU=;
 b=dM2howEt2d1WHN6FZnSpXMyLB5h3uMzb81Qwx2I6e8raRhHhfbkf33Nqj9SzZyHZMx
 N3KBlBh2pF8BobN0h1/zN5wKzQ9E8Gahn18HE9lqtUkqIONI08r22kCs+UzxW6DTFp6W
 bVW1tk84lvWz6RwjY+VEHnUN3lwV5G4xyKA52khuXtIRQYbVEYKXLHrCftqxH3CEpKyw
 69xC5fzfIYx0v+exYpVXyiCixJQC+GTQ9BL8JTlOy2+Nx5zFksuafJ2NUC3vEhOFZZeQ
 zJqrpiQx+p9UI6MHAPL7N3FjrfTtE9j1VoyAonaEKE0vWSTdxlZpXOei4u1mXcl7Wcqt
 9acQ==
X-Gm-Message-State: ACrzQf3srIvRSPEI0HuQ8xL6Fh+cjhDT3sSxPaP1jIPHSN8+BDGqP+WW
 fr9lkBFzguKhvz4SHODJWJmR9APJeYMDmHZqHTNhOJ4Tq7nEuVLGWE956AXUQyTJbtQCaNrCvX+
 A6DJYTIt2uU43pRJ53hUPo7gNwjbw
X-Received: by 2002:ac2:5dd5:0:b0:4a2:2960:a855 with SMTP id
 x21-20020ac25dd5000000b004a22960a855mr5055919lfq.399.1666278406809; 
 Thu, 20 Oct 2022 08:06:46 -0700 (PDT)
X-Received: by 2002:ac2:5dd5:0:b0:4a2:2960:a855 with SMTP id
 x21-20020ac25dd5000000b004a22960a855mr5055895lfq.399.1666278406413; Thu, 20
 Oct 2022 08:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221020102012.3015662-1-peter.maydell@linaro.org>
In-Reply-To: <20221020102012.3015662-1-peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 20 Oct 2022 11:06:34 -0400
Message-ID: <CAFn=p-bf-o2ajp8DQ6eVJvMBakC2NYqwwiYkdyvCJspXZdsU4g@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: hJAiYLRcylrg

On Thu, Oct 20, 2022 at 6:20 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The avocado test
>  tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> finishes wiith
>
>     exec_command(self, 'halt')
>     # Wait for VM to shut down gracefully
>     self.vm.wait()
>
> In theory this should be fine. In practice it runs into two bugs:
>
>  * when the test calls self.vm.wait() Avocado closes the socket
>    connection to the guest serial console immediately, so the
>    avocado logs don't have the last part of the guest output:
>    https://gitlab.com/qemu-project/qemu/-/issues/1265
>  * when the socket is closed, a bug in the QEMU socket chardev
>    means that it loses any data that the guest UART has not
>    yet consumed. This means that the guest doesn't always read
>    the full 'halt' command string, so the test intermittently
>    fails with a timeout:
>    https://gitlab.com/qemu-project/qemu/-/issues/1264
>
> Work around both of these by waiting for the guest to print the
> string that means it has completed the shutdown process.  This fixes
> a very long standing intermittent failure in this test.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/avocado/boot_linux_console.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index ca9d09b0d7c..eed4b49e6e4 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -489,7 +489,7 @@ def test_arm_raspi2_initrd(self):
>                                                  'BCM2835')
>          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
>                                                  '/soc/cprman@7e101000')
> -        exec_command(self, 'halt')
> +        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
>          # Wait for VM to shut down gracefully
>          self.vm.wait()

LGTM!

Already staged, but just for formality's sake:

Reviewed-by: John Snow <jsnow@redhat.com>

