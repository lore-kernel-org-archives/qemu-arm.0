Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp1948260ejb;
        Sun, 30 Jul 2023 22:17:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE7GBFLdig+PIhRFgJhx187wkuTsSbxvTPsOKDiv05wYj34W5OuQ02FYpSIrUbA54m/TU32
X-Received: by 2002:ad4:5226:0:b0:63d:38e4:e372 with SMTP id r6-20020ad45226000000b0063d38e4e372mr8146509qvq.30.1690780676120;
        Sun, 30 Jul 2023 22:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690780676; cv=none;
        d=google.com; s=arc-20160816;
        b=HVenFbzx+kdi7gRJmJU8TKtTNoQNVVm1r26G/GxHHnnS51aIke484AcxV/SyCw1lsK
         D5ztIUrCh63ZDmMp90bdGZpifHUn8wAaiWRNZw8FxbArGumGN204YXUw7A6Xq5agr1Nc
         fxVwCGS/kiwLGSVnR8wlLFAG2fah+kpPuSmrsw2fj92vWQRNe/oPph22TTY/ux2N6cpa
         nEikO1kOcPbIE4nPYO5p3Cd/YPevlJnrJ6axP+SgbcLYZ16ddbnshjMFVFTPj0cLYYy+
         fO702PcH1TU60duBEZRBwDTCogtAB+pfcuktbySApcH9XkVgWpqKdRrHlEWNt3k/NUZn
         fZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AoEIa1w1zIcR6B8FEKUW0i3H3J9XH95FNC9IRDhPOWY=;
        fh=8XC0BaeNgWErJzwlK8fac1YwsabmMBEwW8ogCd05VkI=;
        b=amuAoA7VZtDvNJU8ZIyXFtt3f1ZPNApuG6RoU1hRD16BMmRiUHFugYD4Q5saIZ9J7y
         bKkF711hufuEzqEMq4sNIzAlcyPubOUIzA2AEAy9/pExON+27ZfGiU6i3P6vbGT3bXCd
         H4HnKE6P/OF2VtzSocz3eESkvEdYbNddQjUfO7UfYL2Sh1Akn3BMKu/CU6nOGYeldsIB
         EFHrvlNH1V8/KfeaVN26zNGv3v5QvF+6eQydefG3l4FLTMcSuH1glBN/UVdm+wCr3Ct+
         chibrXriZZSsy7aU6E+0vgHas7ffXPKkuXT0b55vRLrH366oO1COqhWW0h+t6dSzfUKT
         kM5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JjLbGWjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de36-20020a05620a372400b00767d5b81886si5505208qkb.458.2023.07.30.22.17.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jul 2023 22:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JjLbGWjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQLHa-0006b1-F2; Mon, 31 Jul 2023 01:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qQLHZ-0006af-1p
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 01:17:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qQLHX-0001DG-Kj
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 01:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690780641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AoEIa1w1zIcR6B8FEKUW0i3H3J9XH95FNC9IRDhPOWY=;
 b=JjLbGWjlBl43f1VEiNaaIgKahPmr1DX9XobMINUd6W6QpCfQfdIPGyZYZDxLLZi1JR6Ez+
 ufTDClIA4VdE/WMu+iYDbtmXEj895839c4xEc/gy91e8t9MybIFNsNYmwO4gOva4Jyplfj
 Rul5GgLq19YB+twImf5SLpV6/glWgZ0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382--CxFSEA0Nk-rh8tXlmC6DA-1; Mon, 31 Jul 2023 01:17:20 -0400
X-MC-Unique: -CxFSEA0Nk-rh8tXlmC6DA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-63d245b67abso53557906d6.3
 for <qemu-arm@nongnu.org>; Sun, 30 Jul 2023 22:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690780639; x=1691385439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AoEIa1w1zIcR6B8FEKUW0i3H3J9XH95FNC9IRDhPOWY=;
 b=HFzmJzfyRD14i6iyhmGH3BayfQuAUu/1ne5q3jLzJVN6ZV5PHk8sAniRwUyM0FheZ8
 RH22BI91Wo5VaP95kOQmenx38nFVJi4EvxuGvgq1c7jDeDLH9Kq224AOpP4EBE+zrZgx
 lnCgunOpOROAag2lPXFKNTeX1SajI7jlwtMb4jXPZdhO5yLr8SRIa0BGl0K3m+p7FPGZ
 RXlE8YlI3QRmVx8tTp6O8ap7cWdlA01nNExcAaOSOxnGsLD4NyoP139j/Ac/x4wDvgVC
 ilPArdfPDxQYu5jFlas0tm5TevJezi9wdq8MguketYZh1IAKsZC4HNBwYRhY4nu0jj8V
 Zl2A==
X-Gm-Message-State: ABy/qLajrBhTq0PPjpoUyKzAMLhKxk5F6z6FfMpK4Q3FMgGRyJ7B3A5W
 JfI55a4qv71fTlmS+VcKGSJNZ8ef3CfL6p4M7pVV7FUsRbI7wdnBt6s3P4v00tQEdWJ6lUUuuZP
 g9Zdlzq10vAia2lMq6Q9b
X-Received: by 2002:a0c:f002:0:b0:62d:ef66:ff1c with SMTP id
 z2-20020a0cf002000000b0062def66ff1cmr10288678qvk.24.1690780639698; 
 Sun, 30 Jul 2023 22:17:19 -0700 (PDT)
X-Received: by 2002:a0c:f002:0:b0:62d:ef66:ff1c with SMTP id
 z2-20020a0cf002000000b0062def66ff1cmr10288668qvk.24.1690780639488; 
 Sun, 30 Jul 2023 22:17:19 -0700 (PDT)
Received: from [192.168.8.105] (tmo-080-212.customers.d1-online.com.
 [80.187.80.212]) by smtp.gmail.com with ESMTPSA id
 w21-20020a05620a149500b00767e62bcf0csm2994759qkj.65.2023.07.30.22.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 22:17:19 -0700 (PDT)
Message-ID: <2ec3f8f8-7c6e-f3d1-dbb2-f0700b606603@redhat.com>
Date: Mon, 31 Jul 2023 07:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 6/6] qtest: microbit-test: add tests for nRF51 DETECT
To: Chris Laplante <chris@laplante.io>, qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20230728160324.1159090-1-chris@laplante.io>
 <20230728160324.1159090-7-chris@laplante.io>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230728160324.1159090-7-chris@laplante.io>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: qaTzL+3biUtZ

On 28/07/2023 18.05, Chris Laplante wrote:
> Exercise the DETECT mechanism of the GPIO peripheral.
> 
> Signed-off-by: Chris Laplante <chris@laplante.io>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/qtest/microbit-test.c | 42 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
> index 6022a92b6a..8f87810cd5 100644
> --- a/tests/qtest/microbit-test.c
> +++ b/tests/qtest/microbit-test.c
> @@ -393,6 +393,47 @@ static void test_nrf51_gpio(void)
>       qtest_quit(qts);
>   }
>   
> +static void test_nrf51_gpio_detect(void) {
> +    QTestState *qts = qtest_init("-M microbit");
> +    int i;
> +
> +    // Connect input buffer on pins 1-7, configure SENSE for high level

QEMU coding style says that // comments should be avoided. See 
docs/devel/style.rst , section "Comment style". Please use /* ... */ 
comments instead.

  Thanks,
   Thomas

