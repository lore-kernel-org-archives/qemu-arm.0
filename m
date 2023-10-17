Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4082264ejc;
        Tue, 17 Oct 2023 10:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExMOcQviue4QbOWfh7o9rU7faMvR6tMeJA7Xvy88e4P9jcL5lGfMVajjFeSAGIH9RQOR6Z
X-Received: by 2002:a05:6122:30ab:b0:48f:8891:29d9 with SMTP id cd43-20020a05612230ab00b0048f889129d9mr3530044vkb.13.1697563301474;
        Tue, 17 Oct 2023 10:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697563301; cv=none;
        d=google.com; s=arc-20160816;
        b=rlkmTdqtDHgDqkHr1eSnpw+9b1j90Rcm4b0mxSGY+YoiMvCbLtXYD7ngTHH94rsUV/
         ChtQ+guZwZ8knlla6oaZD8h26fgUZpBPdzLCA60KJCvYdSdiT4xZRMkzQRTarIQz1LYc
         Nh/0I51zPmIfdVj5vv/4IbgXYukzncC9ZO7J6YaYCRRT/wlFl+A+gR7vNvgbzqnTUZfk
         /8SLh2pMvpGy9I1b8unB3I8SdggPB/rRJgNa2nQefkQQmtulzd8WlKAnL2uI3qlOTWsv
         xcIQaFddXIgI68V25tf27Zlwrwz+fWDgn/Enz7f2MrCVAiy8SOr2NImz+V3cR3HcubTu
         JYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=IYOQ6o4VfRBqL0+OOnxoc/gz7GiPGve2ZzadNPgd5m4=;
        fh=nqXRx3npnpTVxo2KnLdNA9N7QyZ872yiJreXmfX1+tE=;
        b=Zpvi20I2Q343Up/Bl+VrzCgcfoy+o97c6JkRXCmxI6RYQglMrb0n9uJEfPqSGQJOmN
         SQ3aNimjdbmBeqvfpbro1DmG7i5/YidTD0Kmv/cWJpRgsi/b27xXiOROXz9ZV1QBlvhX
         MjeNwiZe9fVXJCcmIxfRjwdoqIf1dmSbDuH3i3yFpBb5XhAGbZmmn9eyEvRh47AVYpU1
         Hgw9KUGpQVwDAGQzPrIVtIgex4UoGkaT+ggm/cscqWhicaycrIFdnsWwKUBLOKg0FL0C
         JrW0Z45DIHE0EaKuq+oAq0IVy6uGSgYuh93wMJzN8XR1SvbL5ifF3OE35+FM63xjoxV8
         u5hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YipsglzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a05622a130c00b00412083895d8si1494380qtk.461.2023.10.17.10.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 10:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YipsglzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsnkt-0007Bv-GC; Tue, 17 Oct 2023 13:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsnkn-00076Q-Pw
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 13:21:14 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsnkl-0004eo-GI
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 13:21:13 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c5087d19a6so57459661fa.0
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697563269; x=1698168069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IYOQ6o4VfRBqL0+OOnxoc/gz7GiPGve2ZzadNPgd5m4=;
 b=YipsglzQwiPH/5j+yB6K/IW2tTvp/C7P+X8s+fn/LnV7nkh63RU6owi3aLEPQSMyq5
 PtqB7lZa97K3rxVUsJF/jl3J/ZhWU8iewbI8TjbGoiwG22qeMgyPyQh2J9orH8FeOmoE
 iwl6jTiK6VgAcnkIddv7pIzanTUKF7NoGPT8SevoQ192Sv0JldzqjhOTabT9sQp9EmEn
 78k36MVlqFlbPmWXFGsnyMoktudgfKLDhkVIjPQjjVj9iQjNXZXoFNYBcnZdD2ERh2u1
 S2O9Ez61wEqvJ3Z+rfEAu/492moO0OGjBczrVyCfcEqTIewwc0Ukednb9ARZKLDYTDO4
 0xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697563269; x=1698168069;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IYOQ6o4VfRBqL0+OOnxoc/gz7GiPGve2ZzadNPgd5m4=;
 b=XZ8fOmxoQolIBovHRw/Q8HGX91mOoLXMLqTppGqGA5l776vJ+Y1K25D8gsko4+ir+R
 uqyss3CmZ/hSa6fmDlNr1UwUWYt8sPvrddigfDf+STJ3Fp9Wv2Vw7shjgbtGk59EOZ1X
 NSI2OdOF3Ptu1GBGOy6QfwrliypcoA3WEbbPy6VOb6jz1F/149atYa1gLHyrFa9mOFRO
 eRe2Q0RpjAyJW1xRZffcTMQABLYH84kGOZiBOelty4K+nUj9nykchF5NPsxYkVyG20pz
 8M5i8E8Upn1TSD2brqMrKn2503TltIs2a1YBN/EQAWBJ0hWAoQ9okIBJ8NVtEHw+EVQ1
 2Zqg==
X-Gm-Message-State: AOJu0YyR2UzNLAHOn2zUdGlgXxucBsbLdV9uQbkRzmWkGAJSmSK0qJ3t
 oOgXmSvFeJqSfdpg4vF+gWb61F8V5Mxr8hSK0Bo=
X-Received: by 2002:a2e:aa22:0:b0:2c5:2fcd:2598 with SMTP id
 bf34-20020a2eaa22000000b002c52fcd2598mr1979242ljb.8.1697563268861; 
 Tue, 17 Oct 2023 10:21:08 -0700 (PDT)
Received: from meli.delivery (adsl-21.109.242.226.tellas.gr. [109.242.226.21])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c430300b004076f522058sm10321068wme.0.2023.10.17.10.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 10:21:08 -0700 (PDT)
Date: Tue, 17 Oct 2023 20:20:27 +0300
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
Subject: Re: [PATCH 1/7] hw/virtio/virtio-pmem: Replace impossible check by
 assertion
User-Agent: meli 0.8.2
References: <20231017140150.44995-1-philmd@linaro.org>
 <20231017140150.44995-2-philmd@linaro.org>
In-Reply-To: <20231017140150.44995-2-philmd@linaro.org>
Message-ID: <2oo76.4h7yyj4brumn@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lj1-x229.google.com
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
X-TUID: Y1+uuApmEep5

On Tue, 17 Oct 2023 17:01, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>The get_memory_region() handler is used when (un)plugging the
>device, which can only occur *after* it is realized.
>
>virtio_pmem_realize() ensure the instance can not be realized
>without 'memdev'. Remove the superfluous check, replacing it
>by an assertion.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/virtio/virtio-pmem.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>
>diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
>index c3512c2dae..cc24812d2e 100644
>--- a/hw/virtio/virtio-pmem.c
>+++ b/hw/virtio/virtio-pmem.c
>@@ -147,10 +147,7 @@ static void virtio_pmem_fill_device_info(const VirtIOPMEM *pmem,
> static MemoryRegion *virtio_pmem_get_memory_region(VirtIOPMEM *pmem,
>                                                    Error **errp)
> {
>-    if (!pmem->memdev) {
>-        error_setg(errp, "'%s' property must be set", VIRTIO_PMEM_MEMDEV_PROP);
>-        return NULL;
>-    }
>+    assert(pmem->memdev);
> 
>     return &pmem->memdev->mr;
> }
>-- 
>2.41.0
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
