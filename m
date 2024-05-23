Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp896689ejb;
        Thu, 23 May 2024 00:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXZ7KPQIn4EK532vYyTjGjgpXiL41DcWOKwRLaqMahvjPa5qrtNZ2VYHTYV3x48ZCZBzapY6P9cWD4rKYRzR5I4bb9p66v
X-Google-Smtp-Source: AGHT+IHXtIT61abBLBFAzwP9oIvKf6RKSCBDJLZtkSWzpqZyHSzjCjv3V53CizaICK+gnHDfX2aT
X-Received: by 2002:a05:620a:1026:b0:792:927e:940 with SMTP id af79cd13be357-79499440e90mr437264085a.18.1716450516108;
        Thu, 23 May 2024 00:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716450516; cv=none;
        d=google.com; s=arc-20160816;
        b=b8yD6pc4Cvj4NwBZb4I/SMQ8yUzyvOGRr+3N4CklRb5uEYJPAg+rfW9CK/WEYigLuC
         VVE9Y9PruLdSNUGkKMCWIDSwBn6PFY+Is0YL0PTiYkMH3LZeyMZBtJSh7DcWD7BpVrnN
         GGvwpSt6S/aahEarru+yyzNJXDjBZEg4JnWcKBr2Xz2GgR/8hKBYW+mX0TaAnja77l8+
         z+5+EkpQE6/6op6GYVrfP5cdAsYlJOcr3iOo3C6i1+wDijgmUXbiTXL8cZWq2TGpcsug
         RE1zp9JFb5ByBV4IA2+TUM4nDMZJOrC0dp5AVRfKvuuKBl7NVUEJuuv9fiXTnbCPBU5h
         T5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=4rdqYFkyNFnGGla35++FglrsXfHudAsuNgYo2FmltAA=;
        fh=vpCixXoM6+tTd1AGs+ISLqy2WoWpFnc4JtYaaECAFKU=;
        b=ItjL9EC3WHlSzuH67IgRW1zZMPFPsMrsCeEjnvRVSlCJGPzZcAX8z8ysmK/y71OsMU
         lF9x9MYKncV2tO6SQYgXJ3FAapl0XWId5GDleNKPaZZ5cI+iF3AkV+9nGpzpLbkqzuyT
         2TrTeZ1Pxw/i4rhTk4lcNurc/jE83nINtrFW3Mjn4Q3SGQfuqtm3tmYDCXw2HC1vfV9Q
         jfvECiA2FgameVqAwCMjyjpulXEQ357GXvWXydvy7uz+tPtN7P6VRIrZpzyEHDTwEeOI
         8rRrDjPnbUCr3iAqsx5uO3ggYUL/CW+4n3bMsb3erUDvBwQlr3WHOWZJbkFGYJ56XU7i
         s2Eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dyvjaO/g";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7930179c15dsi1789694785a.131.2024.05.23.00.48.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 00:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dyvjaO/g";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sA3BV-0001i9-Mq; Thu, 23 May 2024 03:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1sA3BU-0001fB-DU
 for qemu-devel@nongnu.org; Thu, 23 May 2024 03:48:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1sA3BR-0004V7-Az
 for qemu-devel@nongnu.org; Thu, 23 May 2024 03:48:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-354de3c5d00so733636f8f.1
 for <qemu-devel@nongnu.org>; Thu, 23 May 2024 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716450495; x=1717055295; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4rdqYFkyNFnGGla35++FglrsXfHudAsuNgYo2FmltAA=;
 b=dyvjaO/gv2IXeGFVlXaHc9Wik2IiwHAbejWX9VmtXN1KOGfFzUsDgRSClBTLQnLzEe
 t+dxL0gTdn/DMebrAnmJjYVJTyR/9EoU2EMCq0jqGfE7YGQOKIgxEyLd6nhYLWaBGh4e
 y69stnGWqqFl2jdS+oGcq35nKDopy0DfSwFy/K3oIEEdl1KxAjImhk9CVGbd73cl1Tr6
 BlY7qBiUMgkrg6eZsvjf89wM8N2/ZYRZZC3ng2FfVZWRrGbEtNC1XyhmQSYWeXt9Kk0n
 iQ/vwDMyyQJlCLQKuQH2veqA7tr5dMNw9zCHdd4luNTdsup9tJF/4NNADx1HmPcHpZTQ
 EKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716450495; x=1717055295;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4rdqYFkyNFnGGla35++FglrsXfHudAsuNgYo2FmltAA=;
 b=OPbav+tZG0xWbOlWRJ0ZpGXDi59A82POttM/lMzLgewWd70gBX2v0RgG5H5IuOCRhW
 g/PExwwp2NYK7csa0R8gmSO+rUcsikTrEEW87TTI0N4mPKPsf5Ftb8HaGm1CdMmyAUXl
 WOfg2Kr5Sefb67pBXG7ratZEFTRYQHjtbyjP11kKe5+SR9mJu3Mk1lRHrNqp/Oh1voLj
 8Yk9Igqkl0XMntvcXk7cen5Vko1u19PwImY4lD8y4fE+RTPBNCM+0QNZtpaPxntXSWAW
 gz+VuBLUsEJnnJSMPmh3ZmSlkLM3ePemXxDV3NYUy6EhALn3xMi8xtaYjTX/m4Ar8Qdg
 81Qg==
X-Gm-Message-State: AOJu0Yz5JvT6hvpWop2MYjQx3KjQOXkXbjBQyyV9lLlfNFBNNoccy/tO
 nojEbGhCYLyfvbo6WJuuwvZOWvJASxUNAOvHjQySkjJZ8sHbqauwiwUfBQGRTsJ77mA4+950u5W
 +
X-Received: by 2002:adf:eec3:0:b0:34d:9604:3500 with SMTP id
 ffacd0b85a97d-354f74ff878mr1180049f8f.4.1716450495200; 
 Thu, 23 May 2024 00:48:15 -0700 (PDT)
Received: from meli-email.org (adsl-49.37.6.163.tellas.gr. [37.6.163.49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354fc0212c5sm435954f8f.83.2024.05.23.00.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 00:48:14 -0700 (PDT)
Date: Thu, 23 May 2024 10:48:04 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: edgar.iglesias@gmail.com, sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Bcc: 
Subject: Re: [PATCH v6 8/8] hw/arm: xen: Enable use of grant mappings
User-Agent: meli 0.8.5
References: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
 <20240516154804.1114245-9-edgar.iglesias@gmail.com>
In-Reply-To: <20240516154804.1114245-9-edgar.iglesias@gmail.com>
Message-ID: <dxhod.epa52okca38f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0wPwsxPgxZph

On Thu, 16 May 2024 18:48, "Edgar E. Iglesias" <edgar.iglesias@gmail.com> wrote:
>From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
>Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>---
> hw/arm/xen_arm.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
>index 15fa7dfa84..6fad829ede 100644
>--- a/hw/arm/xen_arm.c
>+++ b/hw/arm/xen_arm.c
>@@ -125,6 +125,11 @@ static void xen_init_ram(MachineState *machine)
>                                  GUEST_RAM1_BASE, ram_size[1]);
>         memory_region_add_subregion(sysmem, GUEST_RAM1_BASE, &ram_hi);
>     }
>+
>+    /* Setup support for grants.  */
>+    memory_region_init_ram(&xen_grants, NULL, "xen.grants", block_len,
>+                           &error_fatal);
>+    memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
> }
> 
> void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
>-- 
>2.40.1
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
