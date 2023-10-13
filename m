Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1320942ejc;
        Fri, 13 Oct 2023 00:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn+VfLUnhUf/EpAXX55Q8ko52Hic789EgLfjNO5bbr+Mjxx9JsKgTvTh8ILSmZjJCFIWXP
X-Received: by 2002:ac8:5c10:0:b0:417:d1e7:5e9b with SMTP id i16-20020ac85c10000000b00417d1e75e9bmr29109071qti.26.1697181961147;
        Fri, 13 Oct 2023 00:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697181961; cv=none;
        d=google.com; s=arc-20160816;
        b=yevOaG/8jKR7TWIUlT+sHuaQj2RPtY8QdBrimGHw+m/W5QnNDQHPzwfEKnCGI8QlkI
         NIfglMHf2yqJbwyZMlfD+FgkdlYoyGrnqnIwa405bsSJ8n1GFNM1iCAW8FUhm0fk41YL
         3Bbjr+v0fr+3hGLFs6XemG/6rUzUH9n1FpGZbLw7ZA0DjPSnspgEfiD6HxMuFrOt/JjU
         /ssSN3BEtLvJAl8pFKbzVR4Twc1CklqqEB4XiFCQI5TwDip2igbJGZzbgIO+zCRa2HvU
         ZzXE7uywkemL28jVZQjQFRpk9ryAJY4N8RhJ24MdTH7Fp9ahQcAXgaOGEy9WDAbjTKiv
         Lyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=dtCZK8dBbcxuYHbsVWjjRmynwuPVyV8w8htevWks//4=;
        fh=UdNEYSzikysUeU+utvCCETmJBAJUHzZF9kKn1YRe3Tc=;
        b=Li+o9ShDbOu9YdNx7+CSkslWQw3h+oX9+TJ4WLiIFMbzSb7qkN/ULFwkHTRF9HFxC7
         gdpO92bRpvIA4/i7GB0fW7Rv7pTRoJLJ+eW10io/yglra9yIgNCSfNPa8m+KOJzTlhQm
         9HxbD5CVQE5xLPCXUxg8OLmf3yuE/HW1DrWsIiQ0Zap/e21Ufi1h2UkI0Wb/q1I3WInQ
         wD5B92osISQxi5s8Ldv+Rk2ZQVBBx8JB52NCSHaOg7UOHnWjfWXQHmzgo+RK2I1Uxyg2
         vRPOtvnF41P83v3rhFAQZpQy8JUifhy/u3mY38a7ZK73MwsH/hDCe1tlbUfB58E9mooY
         7M2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgkmaK+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020a05622a034600b004181abfe1c8si800983qtw.345.2023.10.13.00.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jgkmaK+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCYM-0007Ms-0H; Fri, 13 Oct 2023 03:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCYK-0007MS-BT
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:25:44 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCYE-0008Fj-4A
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:25:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-405361bb94eso21721925e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697181935; x=1697786735; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dtCZK8dBbcxuYHbsVWjjRmynwuPVyV8w8htevWks//4=;
 b=jgkmaK+rFNY67pZxbZp3xZuckehz/TEZJfupo4pJ0gATugk34yLnnrSQz3vVZv0gVA
 7bRDu+TXXC5rPKPQsRzTWoz1GbhpaiO89GVSWFZkzSs75IpNM+BPG6z9tunf3qPtmDuG
 cWpWVGc1oz/0RnfgjG3gVqzoO8fK1GScW72f5+Bu/ekxl0gpfor+RfZty+Sgum7i4X9F
 iIdkBklavf+ohhvyabQ9+49sR23AgFT4WZxtGaQAPnPaCR0rnIwBOr+oZWxokcLumngr
 rep80m+xbzRNvJkELGcZQZ9ICSdVO6Ycqkd2NKpPjt5kzQWahE2X6j5nvpyufdyLBeT8
 KWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697181935; x=1697786735;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dtCZK8dBbcxuYHbsVWjjRmynwuPVyV8w8htevWks//4=;
 b=exXfrDT+y7stZSA6bywvUp3be5JKQ8GeC59/MP5wDzeerQwin7ZmUocsj2aLdCc72z
 HZdCeM5PpBb+gmS1luIMDNG6xz6B5+yDXO1pcchCHYAcnyISWC3rvBd4M36PXAp0M+OD
 PkzD/nMh+ezkungtw0BfOJPPFNOiGxrHVT4QVjaK2W6IKBXQqs4y2hk8vWLYbcqC6dt/
 yMMYuJ+3SlZ2fxw3tskXfSrazenuP1Kp7BJ/K2GpaXNB0S65L+P9eObcy32w2QcgEl2L
 o8xX6HcopNavrPM4NYIKcu7mHJyO41B6SifLX5YJJHHMio3sOjqI9ZdjITwxYQemTOWu
 l/LA==
X-Gm-Message-State: AOJu0YwcXOSY69TA/SgO9cx3FATNRKWAgmnIlWRRFsHodn01ATfda2Hq
 kfahw5kSG63dlJfynL2vIHK2uw==
X-Received: by 2002:a05:600c:22c6:b0:405:3a65:1b4c with SMTP id
 6-20020a05600c22c600b004053a651b4cmr827280wmg.6.1697181935064; 
 Fri, 13 Oct 2023 00:25:35 -0700 (PDT)
Received: from meli.delivery (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c230700b0040644e699a0sm1736790wmo.45.2023.10.13.00.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:25:34 -0700 (PDT)
Date: Fri, 13 Oct 2023 10:24:46 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-block@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Tyrone Ting <kfting@nuvoton.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Bcc: 
Subject: Re: [PATCH 03/10] tests/virtio-scsi: Clean up global variable
 shadowing
User-Agent: meli 0.8.2
References: <20231009100251.56019-1-philmd@linaro.org>
 <20231009100251.56019-4-philmd@linaro.org>
In-Reply-To: <20231009100251.56019-4-philmd@linaro.org>
Message-ID: <2ghyk.0d8hmxqy8w5u@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: gz+nk1E0Itc0

On Mon, 09 Oct 2023 13:02, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Rename the (unused) 'allow' argument, following the pattern

s/allow/alloc

Otherwise,

Reviewed-By: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>

>used by the other tests in this file. This fixes:
>
>  tests/qtest/virtio-scsi-test.c:159:61: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
>  static void hotplug(void *obj, void *data, QGuestAllocator *alloc)
>                                                              ^
>  tests/qtest/virtio-scsi-test.c:37:25: note: previous declaration is here
>  static QGuestAllocator *alloc;
>                          ^
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---
> tests/qtest/virtio-scsi-test.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
>index ceaa7f2415..db10d572d0 100644
>--- a/tests/qtest/virtio-scsi-test.c
>+++ b/tests/qtest/virtio-scsi-test.c
>@@ -156,7 +156,7 @@ static QVirtioSCSIQueues *qvirtio_scsi_init(QVirtioDevice *dev)
>     return vs;
> }
> 
>-static void hotplug(void *obj, void *data, QGuestAllocator *alloc)
>+static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
> {
>     QTestState *qts = global_qtest;
> 
>-- 
>2.41.0
>
>
