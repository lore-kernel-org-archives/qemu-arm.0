Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4081341ejc;
        Tue, 17 Oct 2023 10:20:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn9Epxn2kaxAhg4kjk46hhqtZ6xgWhxgoAwjEJmfxu5ZjDI3xQoPwpxhAjDrp+LPYLp5cj
X-Received: by 2002:a0d:d583:0:b0:595:e1b:b978 with SMTP id x125-20020a0dd583000000b005950e1bb978mr2996734ywd.21.1697563206353;
        Tue, 17 Oct 2023 10:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697563206; cv=none;
        d=google.com; s=arc-20160816;
        b=QyXI78mGGL08YxLeDo0AsxvK4IZBZJts5/kSUcr7ny3iT22ddrbPCz9s1iRAySSrlv
         2/RWTdJZoHJEbKzJDuL4faWdGk3nw4NEA+egSJ9aupHx8lLriIuSs1AyzeaBn0oJXBUN
         1hNcvMTtFH95EZ0IyC+ACv3drk+OEIkUFO3RMadPjbdfmX53Lf9RZsf8NztL4jub3bzh
         H1wDAgLpKJoI0TrJgdTp6EUdpuHPf949liGhJG1oOgrwBbTDv4Q/0uTNmVOsiVHwHLDK
         b/bjMQg+ipupM6Q+1ZYWciY+jkpvIozF0GLTCuhgpDZO1wQjrpgWVeR31WwFzgrCBVRj
         J+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=Hdv1QGcQquHUfS6KKbJt8qrZI9q9oxSm67P2iVi590Q=;
        fh=nqXRx3npnpTVxo2KnLdNA9N7QyZ872yiJreXmfX1+tE=;
        b=cn+aDDsipwpho4nWOZLOCLEJI8GLkhyMNjfftiUdTUs1Nc7bQjdhiIQKL18wGRDmGq
         QQZnbZTL6fD5tO07bcq9RMe9T98ajX1IVvAD4qV3HKmYBj/yEkELdTIbiBtrtEcDheH7
         8gh7pnTY3ONR0NsvWE6Z3THpwfgo2N8xqXbKQNoQ9XoDEakn3NPUatSw3KKVMjP6ougw
         D+Ry8/+eRkNWFGA7uhKrVztpg7OP85rzzfNWT4tYxyTT4FXodlar+hX2cWlkWznZSuEb
         CjzF6Pps3xnhzUvignBHrO+WK5djFZ7bcaVWcD72jyIxCiCNWiapWd/hmAl2HC2M1nvV
         cNNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cR2DzsJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020a05620a404d00b007756924fe18si1437606qko.681.2023.10.17.10.20.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 10:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cR2DzsJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsnjZ-0004tP-I5; Tue, 17 Oct 2023 13:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsnjV-0004pA-PU
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 13:19:55 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsnjP-0004Ay-Gd
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 13:19:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40839807e82so931525e9.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697563184; x=1698167984; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Hdv1QGcQquHUfS6KKbJt8qrZI9q9oxSm67P2iVi590Q=;
 b=cR2DzsJfN0TRiBuqbNxk+W0HjjzIiBOt/NyRwWZ7B0GCZeQ/1Xl/4LRPuzhmfPg8Ot
 0aziTiQxmzvFLTeZ4+2774SMpEmq1ujIWDDyeT3J+U+vEmuBmWHwRolGcakV0CiNS4So
 LRLQ1E4SsvzuX+N2XJevJLQ26ZKA/3RUl6hua2EHZ/U/yNxc7+hNA+As4yWr+oI5Pr7h
 DGpdMEiXyaubGHQaJ96S9oJr4w/s4JGxcdpbY5jrZ99ZsP5ZBh1iuOYqMd2IMHkiEhkY
 +fW+WMRAW02Q2YvPwDPMlIaJUElUJtnrCDtvVhxhg0BfNRNpsaAIsYbq8xdinooFDSh2
 ntZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697563184; x=1698167984;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hdv1QGcQquHUfS6KKbJt8qrZI9q9oxSm67P2iVi590Q=;
 b=RfIjgLZvVFHyGt+0EXKHYrCZJwoIdKqlhap5blgNwdDarWmTtCyEdNPD91IVUkYBtv
 pnE5QRGTxVNgeE9fxU5gr9BatlfKrtJ1q74zNl/+X6a9P6D9K3HVDw7jx07rwc4vVkzd
 aMjMOqqfrZeER4PxhQ7ylzeGdyRrDmG/6LBRPJQ6eKjzqmfCCbtHaW7VwrtBaJ93nTqB
 jy76I66nfV8neFQtbY9UyEf20h7prBQ/mAHI6uBhYC/mdzT/n0KG32muPp0gueUR468/
 ewealxS4lI1z4ND3x+BRJ3wStnl1vc5Vo7SdoHg9cA6KMBJd214keEJsZj4p1oaj1NQc
 /+EA==
X-Gm-Message-State: AOJu0Yw5L39wRlw0oDV3iyReFO8hzE+kdUQJ15pDi802YvKPWkHOyM2+
 bPYzxcSNQJZ8XTIHenRg4ljFCuof4Wbt4uAHRFE=
X-Received: by 2002:a05:600c:3146:b0:406:51a0:17ea with SMTP id
 h6-20020a05600c314600b0040651a017eamr2560496wmo.10.1697563184310; 
 Tue, 17 Oct 2023 10:19:44 -0700 (PDT)
Received: from meli.delivery (adsl-21.109.242.226.tellas.gr. [109.242.226.21])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c19d000b00407754b998dsm2429187wmq.27.2023.10.17.10.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 10:19:43 -0700 (PDT)
Date: Tue, 17 Oct 2023 20:19:22 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-arm@nongnu.org,
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
Subject: Re: [PATCH 3/7] hw/display/virtio-gpu: Use VIRTIO_DEVICE() macro
User-Agent: meli 0.8.2
References: <20231017140150.44995-1-philmd@linaro.org>
 <20231017140150.44995-4-philmd@linaro.org>
In-Reply-To: <20231017140150.44995-4-philmd@linaro.org>
Message-ID: <2oo4t.qv8sufbzi8x0@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: VjVxgyCz1DHN

On Tue, 17 Oct 2023 17:01, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Access QOM parent with the proper QOM VIRTIO_DEVICE() macro.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/display/virtio-gpu.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
>index 93857ad523..51cb517999 100644
>--- a/hw/display/virtio-gpu.c
>+++ b/hw/display/virtio-gpu.c
>@@ -1132,7 +1132,7 @@ static void virtio_gpu_ctrl_bh(void *opaque)
>     VirtIOGPU *g = opaque;
>     VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(g);
> 
>-    vgc->handle_ctrl(&g->parent_obj.parent_obj, g->ctrl_vq);
>+    vgc->handle_ctrl(VIRTIO_DEVICE(g), g->ctrl_vq);
> }
> 
> static void virtio_gpu_handle_cursor(VirtIODevice *vdev, VirtQueue *vq)
>-- 
>2.41.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
