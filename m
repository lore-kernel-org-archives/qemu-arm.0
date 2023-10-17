Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4081625ejc;
        Tue, 17 Oct 2023 10:20:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjcr8Gc3Jhhz4np8Af2r5xYg4Z5zFpz4ALdC2qqNraSA7MMEHZ+pHnbWh5eldY5hrmckJZ
X-Received: by 2002:a05:620a:1786:b0:76c:eb1d:c2d0 with SMTP id ay6-20020a05620a178600b0076ceb1dc2d0mr3410071qkb.28.1697563235211;
        Tue, 17 Oct 2023 10:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697563235; cv=none;
        d=google.com; s=arc-20160816;
        b=xDxjn1G6dQaEcbenzmSrYbA6RCF5xLffTF4cw1BTyVtWbhHcvDL/9Q6Mo5qUJe53/A
         gFK/na7xWvp9CH60HlEde3QwEN1hygXCMoXrGpL4uqjVBg6OoDd6F9L1ki62mu3Kkchr
         DVed0wBcUqL2PrerElXvrwM0hP7Qd0EjFc9jqJZvRv+7Durxc40Zp06ieznHVIknj0xU
         r/4FlRebaxRCdkwULxFf21tI+3tWdZSibq4NcmHB/nE9k3PkTyVmhQnWYzJdVlnoyrlC
         VfSe0G7HDB+V0t69cJhNzuI1jZhc0FI398zOqxJCd9xAJjTEqQxXPqoWSOFng06DJq32
         IK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=pJajnUNuQ8B5vQu51xkWmU+KD+1VOFyYtfMHMOHhv9M=;
        fh=nqXRx3npnpTVxo2KnLdNA9N7QyZ872yiJreXmfX1+tE=;
        b=ZZIbMLFIRpl5oZwk0T7UfTyDsI57K2S1g9WtU8CvIi1BxBKxgCwaU9n373sozy/tO+
         KiG74msb9XE84eFI0Sc0tGteR9r1bpzP6zTZ+jFn9reweAsvZuNWBfovR+6AlxxEkGcz
         IuwYzK+ox/cg7Vxpa2WfBnDqjuipK9RAShOK6tNlwgmsxwCKmez4mCMaOmmaJPnvGWdh
         E8Ef/maZ8uNzyOxAeJowqnbh9XNOS9Qb+YlBdOTwL4kZ2Y+9+u4nQrpWK6RjAs78sNxG
         qzmAWuZo0RWoAVjipIbaCy82WZIuBSiFAHTh+8UFB0KchnQlguLvRbK6g0BC289FsYcR
         LhhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQgsaW3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020a05620a249100b00775b23dc394si1471722qkn.287.2023.10.17.10.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 10:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQgsaW3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsnk8-0005cq-7b; Tue, 17 Oct 2023 13:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsnk5-0005X7-9H
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 13:20:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qsnk0-0004Us-Va
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 13:20:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-407da05f05aso6620475e9.3
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 10:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697563222; x=1698168022; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pJajnUNuQ8B5vQu51xkWmU+KD+1VOFyYtfMHMOHhv9M=;
 b=pQgsaW3hVjMelmupI96gifG+lcmYD0TsHgxbg9NmTHU3CbI/kjxgtMoY54h/HBwj8L
 6yRqIm6xozEyvbfMcw9WUa2t0LMvOUcTLAGIjUhS8KsF3fL2yYO7VIVEJGRSlUjzpYeg
 ZCtuIq9+6JIf6c82xoXqIU/u9M/kl9vtOR6vmdWNPiTmwqvSzG0w8Rhi+uQaRkbtwN53
 tn10p3GLNvRFVE3DxeVLnB6uywl/pSWaANf/Zem1u/zEYZKg5yk1zCSFk4KCDr3USTc9
 79oNpPH2qdnSq3IltcqETrCwljhdHTP9aj9djOr5bbfWJV3aYJdp32+mtIZ+yNKZpiCN
 uGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697563222; x=1698168022;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pJajnUNuQ8B5vQu51xkWmU+KD+1VOFyYtfMHMOHhv9M=;
 b=TOqKsVKSMB4VFrQ8mG5MOT3A37q0ljiWJmM1Bqjr/R/YQ3RdcEPgvhyZw1NBITVbjo
 ZTdDZYLYR1ILriZxsMRApuSvxf84b2pYXQrhgJDxjDNaUz2xTApNFB/yOFaE1ySVcV+Z
 0mRdcBR+n19aBcGJe5MgvYtFq+Jp89MVta3/UwmK9oq+AGiBlm0/KyXfhUz5fnFSMu7n
 oJb790ZAjRtRG8sw4QYgAWkOuy6wcttV9qNhJFf907bp2ZwmSIGFu7FAqifstubjdmZV
 mkul/S5UIq/VK5PGoHTcQdAGf8ePdLGHZMPQCGyxvD4pBwiX2VrzxzfvVdSgX0cIp63o
 9lXg==
X-Gm-Message-State: AOJu0YzDWU+JxI+rxyyRIDyqS4EJKvJsIKcJJrT6UAtPPO9XNxbUkLSW
 gIPwR0D6KvxaNvjcTYiSozC8ILalGT4zoTrAUGo=
X-Received: by 2002:a05:600c:1c26:b0:404:7462:1f6f with SMTP id
 j38-20020a05600c1c2600b0040474621f6fmr2144359wms.8.1697563222292; 
 Tue, 17 Oct 2023 10:20:22 -0700 (PDT)
Received: from meli.delivery (adsl-165.37.6.1.tellas.gr. [37.6.1.165])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c470600b004054dcbf92asm2294632wmo.20.2023.10.17.10.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 10:20:22 -0700 (PDT)
Date: Tue, 17 Oct 2023 20:19:48 +0300
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
Subject: Re: [PATCH 4/7] hw/scsi/virtio-scsi: Use VIRTIO_SCSI_COMMON() macro
User-Agent: meli 0.8.2
References: <20231017140150.44995-1-philmd@linaro.org>
 <20231017140150.44995-5-philmd@linaro.org>
In-Reply-To: <20231017140150.44995-5-philmd@linaro.org>
Message-ID: <2oo5v.5h3xlfdx66bx@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: /LLSmVA38gQp

On Tue, 17 Oct 2023 17:01, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Access QOM parent with the proper QOM VIRTIO_SCSI_COMMON() macro.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> hw/scsi/virtio-scsi.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
>index 45b95ea070..fa53f0902c 100644
>--- a/hw/scsi/virtio-scsi.c
>+++ b/hw/scsi/virtio-scsi.c
>@@ -761,7 +761,7 @@ static void virtio_scsi_fail_cmd_req(VirtIOSCSIReq *req)
> 
> static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
> {
>-    VirtIOSCSICommon *vs = &s->parent_obj;
>+    VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
>     SCSIDevice *d;
>     int rc;
> 
>-- 
>2.41.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
