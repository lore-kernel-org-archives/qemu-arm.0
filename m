Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp986654lfq;
        Wed, 6 Jan 2021 08:49:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsy+cHdCAxNHEbSgsujxaJPln1DvOIlY8hZ5+ZwPHnZoNtzns74eU73uLV67i/fZZeRWgC
X-Received: by 2002:a25:9d01:: with SMTP id i1mr6991484ybp.359.1609951750287;
        Wed, 06 Jan 2021 08:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609951750; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2lRiWXZcS9k/399Ooy5BKmvETZ07XSNpbaV4KHN6QmWAdzIiU2Tgvg5VW7Lryd4+E
         lS3Vt/caR17VtpTIbv7Zlep33ekgCGCVGiAQaqchFbwp80+Qao9Snx5UgEIh09Ghe9FW
         oE3sqiZeHApdBiZfWt59D1bccgPTdpsAm7rEv/w5DTiTK4fbDMQEoGywbJWsP3nG+ppr
         pZz1f31hmnaZsO/8cimsTD8SNJA81eZRiaj3kSCh4XctQO4sEPEGI9qMB3IyV6XI+3Ea
         3gvErnZdU5xxd5wSJ4g/eGty8ZZYbbajap6xjCmcR7Vas10ujqwJjLcZh8Y/VA55vPVx
         Nf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=M/G24nIvDK6KKZyQruRYz6q/vvCi/hK+tlUi7T69iOM=;
        b=J6BaOjSrNl/OeRbrBEP/EDtoY4tr9AGR7HPzvk8uCp2oIPBaxNKFItOI8sttU2/Kgc
         CyNlsUbGAlDbwE1VTT5+YWKieUih6x99tRnKV7c0QFVUuQ7YPzrXk6HkxGdfaAaJVhRz
         3PERP3gFvUSBorgRf97uFcL7XZjwujAUSNKqBK019ui5VABbg6Ud+gUGy6Rr96sR6/FS
         JAIJ4/XzkJHYax3iSUqTsKbb1ds1vpV+EJkzNleDRuAIW0PDSqIDVwqJ3++ix2163fFC
         nVi/50k3YDCij0MmdZR1W8F3Gg6vUxyxU4W2MbAw465z8YCePQXEwTTOKthF6awmTvDh
         Tcmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="EbDBm/+I";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si3084564ybj.230.2021.01.06.08.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jan 2021 08:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="EbDBm/+I";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:42216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxBzh-00057j-NA
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 11:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxBy7-0003tM-0B; Wed, 06 Jan 2021 11:47:37 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxBy5-00030y-He; Wed, 06 Jan 2021 11:47:30 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c133so2933096wme.4;
 Wed, 06 Jan 2021 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M/G24nIvDK6KKZyQruRYz6q/vvCi/hK+tlUi7T69iOM=;
 b=EbDBm/+IjSUwV1jMJYNNfBYJ1e7Oa6O0jTLjLgIkJc1h41LXIV9wH4OqOepC2QlR3W
 38gCPzB5olTiY4nE+XPJADaFNHsIHRCwnHkUJ4SJNREqYzojjcTouOpu3FVGAEhGbQ1Z
 D0cIKaQFV0WfVgvy57EngCOUPSw/83OwRSSH07S2qiTk4X6cSb1vBV36zXJTMqyb9/6b
 Z+ieyd8F9VMmltkMUJOWo1lUSP00oV2uwagkN4PSYv00I210KaL7KCO/7R73RRraLJbM
 mks4uQquYNRk5SURYfT7Mvgefo7m5oEaPFYZ4Md9LRQa3pXpkM6fjsd0BuuXdiio+X0H
 dH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M/G24nIvDK6KKZyQruRYz6q/vvCi/hK+tlUi7T69iOM=;
 b=Fcb2kdhQnJBnB93y0Rm3YQCOcCPDeS+hcjf5X6taSqnvrNxkhK7nUxhrryoKegWpSf
 dcnC4YThTNg/rsRYce58BAdVzvXjrAE/qvwGN9/N6D74sxzFfoawC+3d2K7EDB5UDqrQ
 9BxyZgz/fORZo/fMT1ZoxqJPxlejl0EEz4XbIRX1Kr1nSt8DnTO0hoTXjldGt4fG/qBj
 xarB8rvL++uXN4MM8wXXHDYw5FQOQHr1iUC4X2ciTTBiwNDmLlROtj0IZzWAChj49cnf
 6YMMUDFTw0IgIrVUcnhgCePz3/OwPbWwunBMrqp3aMdQUudLDzWxsx9x4+rK+kEhiKzw
 KXNQ==
X-Gm-Message-State: AOAM531v9+PacIr8u6YZ0r1dw6gyFRV4MmoXt5BrQ2DcdGq3ZF1dvqmB
 Iecoa0ldmqP7HP0SER79nkw=
X-Received: by 2002:a1c:6383:: with SMTP id x125mr4443878wmb.46.1609951647363; 
 Wed, 06 Jan 2021 08:47:27 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id w189sm3693625wmg.31.2021.01.06.08.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 08:47:26 -0800 (PST)
Subject: Re: [PATCHv3] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210106163426.9971-1-maxim.uvarov@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7c639f40-e42a-44a0-3a1f-a0ddc8413e83@amsat.org>
Date: Wed, 6 Jan 2021 17:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210106163426.9971-1-maxim.uvarov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Jose.Marinho@arm.com,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Vd7WEeD60Sx

On 1/6/21 5:34 PM, Maxim Uvarov wrote:
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware).
> Use the same gpio 3 and gpio 4 which were used by
> non acpi variant of linux power control gpios.
> 
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  v3: added missed include qemu/log.h for qemu_log(.. 
>  v2: replace printf with qemu_log (Philippe Mathieu-Daudé)

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
>  hw/arm/Kconfig        |  1 +
>  hw/arm/virt.c         | 24 ++++++++++++
>  hw/gpio/Kconfig       |  3 ++
>  hw/gpio/gpio_pwr.c    | 85 +++++++++++++++++++++++++++++++++++++++++++
>  hw/gpio/meson.build   |  1 +
>  include/hw/arm/virt.h |  1 +
>  6 files changed, 115 insertions(+)
>  create mode 100644 hw/gpio/gpio_pwr.
