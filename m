Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp216650ejn;
        Thu, 20 Oct 2022 03:38:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40WUtOlLhoyxHMW3cPZfn7xpbH8z4So6LwJDnf+I5cA2kqg51zzzoPqobR+1nDTA7mbl1V
X-Received: by 2002:a05:620a:430d:b0:6d3:9dc9:d83d with SMTP id u13-20020a05620a430d00b006d39dc9d83dmr8632132qko.224.1666262314044;
        Thu, 20 Oct 2022 03:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666262314; cv=none;
        d=google.com; s=arc-20160816;
        b=wTUMLjkxV9oO75RFGIJw1REH+V2pnqY3VtJ21pM+QqXOFW1fw9su2EJJ46BCN1R1uw
         3nPUMS6EPD83vPuTy/81dEHbLkigwAxJDuc62kA2fsBGYiqtZ/wpUx9sw+jHt458qXzX
         fVU4NVzsuRBVQcuXTHedy0r9Copt+UYmLSDVXziwZusnZ/WLcErnzFu/wzm6geravd5p
         h+0qLK851MqBz1jO2LrmB4T+5AJFN2H6VaF4gEktWDcpB6DBo//vGYuy+3nImEINMh5U
         OFy4LCTbUEZ+i8jajDr8kLVc+lCqBVCv7o1flHxQktz+UM3KTLUuUfGK1j0tVyPS7v8/
         TZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vmxbLN2R6MuATvg+iV+vlhNDZTX19j1xJBbJ37bB+Es=;
        b=XUH5dUxP8hw0K0+NT6bvpGDfUW9dctw+VlAJ5sbQKq5J81O/w65t8PTOghf3DpTfSQ
         iAuganC2MbRLd2hRZ9x4oP+lbMdodrI7JbSFjfxK7Knmsk9+SVFxn55X42vOEh/RfH9c
         WbZQJ+6DejV5lXi+6DwU14Kq+9mNddiy1CMD78q4lGIiZz4VcexGvLm060ZUzir+fRb1
         Rin9ZyKCrM23Fin1yrWrreVa1J/yCwBhxoA8Vs59DgevbJLmzikpB2c75LYGINCI5gWp
         gChyLAmY6nyTIicnyXmN+KrZ1hT7TcEntXqFwlpw9RX9BzKlNs8sMjTFdq8mKxc1mJa2
         ruww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YVWkNPtG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17-20020ac87191000000b0035d541b7067si9344113qto.129.2022.10.20.03.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 03:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YVWkNPtG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olSwb-00071o-8i
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 06:38:33 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olSn5-0006m9-8W
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 06:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olSkV-0006PD-3A
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 06:26:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olSkS-0007T7-36
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 06:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666261559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmxbLN2R6MuATvg+iV+vlhNDZTX19j1xJBbJ37bB+Es=;
 b=YVWkNPtGPaaAg5rL8eWhwg66+ccVUPNbTJo2OTpMlYlpAlavHGetWJ6D1/+pKvbgmaPZ/4
 tv0wM7jRKvm3Y09qyRqt0Mj89seNJh/hSTk3KumbQCSmsdvIJZ40Utd1cm67shdG4Ee3ls
 /csZaJFl2conPgaWvdsxoZij40NprCc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-0uO6B12hOlOdkoRiYpDtrA-1; Thu, 20 Oct 2022 06:25:58 -0400
X-MC-Unique: 0uO6B12hOlOdkoRiYpDtrA-1
Received: by mail-qk1-f200.google.com with SMTP id
 bq17-20020a05620a469100b006eeb0bbe02bso16795269qkb.5
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 03:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vmxbLN2R6MuATvg+iV+vlhNDZTX19j1xJBbJ37bB+Es=;
 b=g7KUgoT05vcM5GvatBF1aLFMpEfy5fQdHtGPMhPdIc2EIn8EIJ1W0yBqZVgxcZZlLx
 J+qjm5S2RJj1kQI0tupe0EZI44WvKd9P8U6LZQ1fyvlLSlLMtfyGLxmvEJc/T/uNieNI
 GxA8ERh/cYh5bpleK8mSRWeRiwhnDOP/n4eytCavijDI2y+bfDdmq+PTirI/svqTbacm
 zIHZlI9WGeNEEMZJLhr8SvZUyOywtSXx9OZ7kkMj/rd6aZaW+EPWxkwXyUg/5LsRFeyf
 s6nG9g31ve69NUykf/biLz/zgtbhUkGYnULert5R0wAhWLlAZpnuZ7xApqeiFlOHK9qI
 AJBQ==
X-Gm-Message-State: ACrzQf3SnqFtpRzjrArdcEI6sRNszMzEaV0qQCLK1zkK84MGXr9j3v23
 TU0Kw8CqxqaXRSjLo1QN8X7qWz6sxgcmDXvKk2zGAFpdgs+MGhjh5w/9i/fLeuc/5tZf6yI/5Bb
 1MLuSCiMD/3a5
X-Received: by 2002:a05:622a:1052:b0:39c:da70:3204 with SMTP id
 f18-20020a05622a105200b0039cda703204mr10048870qte.689.1666261557923; 
 Thu, 20 Oct 2022 03:25:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1052:b0:39c:da70:3204 with SMTP id
 f18-20020a05622a105200b0039cda703204mr10048858qte.689.1666261557679; 
 Thu, 20 Oct 2022 03:25:57 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-247.web.vodafone.de.
 [109.43.177.247]) by smtp.gmail.com with ESMTPSA id
 l12-20020a37f90c000000b006cbc6e1478csm7004392qkj.57.2022.10.20.03.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 03:25:57 -0700 (PDT)
Message-ID: <070bd0b4-f04c-0eb9-6a84-d031db28c4b0@redhat.com>
Date: Thu, 20 Oct 2022 12:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>
References: <20221020102012.3015662-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221020102012.3015662-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1ODTWBDBU/UC

On 20/10/2022 12.20, Peter Maydell wrote:
> The avocado test
>   tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> finishes wiith
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
>           # Wait for VM to shut down gracefully
>           self.vm.wait()
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

