Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4080988ejc;
        Tue, 17 Oct 2023 10:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDRYwrRLUVgw1JfExPmR6XmyWE2f9UPp30mvGhxZcHpcJrADKti2GW6BJ3738f76zQqC0b
X-Received: by 2002:ac8:7f96:0:b0:417:af0a:70a0 with SMTP id z22-20020ac87f96000000b00417af0a70a0mr3603355qtj.14.1697563171432;
        Tue, 17 Oct 2023 10:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697563171; cv=none;
        d=google.com; s=arc-20160816;
        b=C3KhVAmbhYQ6NYMsLaYjrStiRM5Au8d48Eb9NBbS9fVyIWuUm5/7HYpIAhpjTbWVA4
         tFdf4FxiSu5tQAZaJ+Kpo5cOItSZU4/mZ2GthZa+MhxsnJqDTs4egM4wRhLjvb2lvuYh
         CK8hV+d30N3o4UZHEL7GiN0OWwYO0EsMAuTcdLD272nkzx2dSfzoKaxRbT84+u8CXG2k
         Aw1oE10KJD1oYjpIjmYctMC7HiElOLYiCgOCu8hHs5tFFKidj4Ol80DmjdDm8HYv4zAp
         7yTh9FykQQoF/BkrwFFVnf5T9GsZUYt3g6kJ5M+yaJ9Y+z0j0u5fmBMRQKQsJiHbqB7w
         1dPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=nYJAR0AMsb/6+NQUw/ZXkNRr+jbwIu4tVYQkOMbEmaw=;
        fh=RmgJRFYYA9EyHn7ynSU8JCK5R1wLwXai5pYQb4fH60s=;
        b=hFPkQ6I4WDeL32vHR926R+WlCGV14bNqaV3O1nfpMGaSYAYKec21BLbJeyxcVi4BSm
         aUJfsv9i/ksH4AI7MxN8+bglGU6SK/thpibSjtSjCX5cUQuvS/VUbyZFXyQE97tx32WW
         nJzVouQxuuVrQ1cuggAFtfMaGhVz0y6QBtzbL/IeAmyGsONnFiFQsDD38lxkoLsO1x26
         7+/CaTsG133dlnUWnT3yGt1YXaZt84fsqPpkSPMKtt7o+tku777H7InoxbN/Z850XzEh
         rMWiR2kG1hSXK6AVkjVX+8p3Fsa1YM+jVfg06bIOU8qZlf9gEDyPeoC7fJpfZlc4npNk
         98NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CpaZoUyy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020ac85890000000b0041985eb503csi1499403qta.693.2023.10.17.10.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 10:19:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CpaZoUyy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsnj1-0004IO-Jh; Tue, 17 Oct 2023 13:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsnj0-0004HR-1b
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 13:19:22 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsniy-00046E-BC
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 13:19:21 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3296b3f03e5so5004510f8f.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697563158; x=1698167958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nYJAR0AMsb/6+NQUw/ZXkNRr+jbwIu4tVYQkOMbEmaw=;
 b=CpaZoUyyyA7+beCn8Oj7O2A3dDPfW0t8m37X/852Js2YpeQmhQ+NfdWXyy2wjua9Y9
 8UVZItElU+F9eJ5uao4h94uEGe6uXYPVCz9ar7wwFZCJKNNN0e5kwqk0aDcFSTnsfQFQ
 5B0DAoUehVTpIzzFj4QiFhf0/pwIUMqSXG+KhnteEkej/jD9qro/H7Ev02yhqplA9q3b
 AOGQhdHQVRz0tlCRdlMmfjvceRR7xtaEsjIMnRguMZy4L9wjhSuWud/efxb6UURs/ToN
 B9QHDE4TBm4fW9emYy80WXho/ej3/AF4QpXpwtzY1YGLOaeOCcZKK5LyZsjszKHO7cGb
 PCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697563158; x=1698167958;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nYJAR0AMsb/6+NQUw/ZXkNRr+jbwIu4tVYQkOMbEmaw=;
 b=T6Lkecf4unSE9PJ5VNfSVuX/+V4Wtwg2YEGSRMgGljUNYdRBs0EV5PqaSGp68u0ffs
 0q1i/NwADO8tLJqyIEqXiClvfxpXHuxYbzMetYAyL839hQ6L2OhzaPz6DvXT0xgnbEqr
 2gQUBY5wto6Kh/xLBeCH6NtT0ks5Yxi3WRV32h2zBW+wFpUzClNipeNm3uD8wFn595oK
 EQ1UUnu5+Ufmmzhm8F/fmjNhZ+wNOoe6J29E0RII0VDx2eyFngT+hZG8nbnel7/nNFSj
 5BUAFzppQkcub7RDOWBdaV+zuZhQlfssLF/io649RaFEmUYETXMEBKrFD+TtydLe+M7m
 /oLQ==
X-Gm-Message-State: AOJu0YxOgNe82qRk0ImCvn6+fC2E4iuf1/NYlyYgXw9x/E49U9bQPBmx
 NijiQ7UKA8dvIqAEKcZn2gpf+w==
X-Received: by 2002:a5d:6ac5:0:b0:32d:9a2b:4f83 with SMTP id
 u5-20020a5d6ac5000000b0032d9a2b4f83mr2644258wrw.33.1697563158158; 
 Tue, 17 Oct 2023 10:19:18 -0700 (PDT)
Received: from meli.delivery (adsl-165.37.6.1.tellas.gr. [37.6.1.165])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a05600000d200b003233b554e6esm203897wrx.85.2023.10.17.10.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 10:19:17 -0700 (PDT)
Date: Tue, 17 Oct 2023 20:15:40 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-block@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Bcc: 
Subject: Re: [PATCH 2/7] hw/block/vhost-user-blk: Use DEVICE() /
 VIRTIO_DEVICE() macros
User-Agent: meli 0.8.2
References: <20231017140150.44995-1-philmd@linaro.org>
 <20231017140150.44995-3-philmd@linaro.org>
In-Reply-To: <20231017140150.44995-3-philmd@linaro.org>
Message-ID: <2oo43.ni0pj3wuvqqh@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rn3g3nSAA8xe

On Tue, 17 Oct 2023 17:01, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Access QOM parent with the proper QOM [VIRTIO_]DEVICE() macros.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/block/vhost-user-blk.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>index eecf3f7a81..4b37e26120 100644
>--- a/hw/block/vhost-user-blk.c
>+++ b/hw/block/vhost-user-blk.c
>@@ -405,7 +405,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> 
> static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
> {
>-    DeviceState *dev = &s->parent_obj.parent_obj;
>+    DeviceState *dev = DEVICE(s);
>     int ret;
> 
>     s->connected = false;
>@@ -423,7 +423,7 @@ static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
>     assert(s->connected);
> 
>     ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
>-                               s->parent_obj.config_len, errp);
>+                               VIRTIO_DEVICE(s)->config_len, errp);
>     if (ret < 0) {
>         qemu_chr_fe_disconnect(&s->chardev);
>         vhost_dev_cleanup(&s->dev);
>-- 
>2.41.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
