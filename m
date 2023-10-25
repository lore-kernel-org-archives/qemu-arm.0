Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp3023465ejb;
        Wed, 25 Oct 2023 13:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj/C434aHcyjHodFlFqNTZU2vYhwLNT3hodjp71hQI5ReVeGVuXCFXeRgIUazxRgJMxwis
X-Received: by 2002:a05:620a:260d:b0:775:9766:cb69 with SMTP id z13-20020a05620a260d00b007759766cb69mr15793989qko.75.1698267523222;
        Wed, 25 Oct 2023 13:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698267523; cv=none;
        d=google.com; s=arc-20160816;
        b=onb42z0fThBUvJXx3V6L33jKUTiFOgQLROKOq0Hq5Mq5eafbNbd5oxQammplPYSOrQ
         mx66IGoXaV74/NQYXLOEqcQNPQ+FX9ptRX+ZcAJrGmIQLdtX7EQ/bP1HeP1rk1LX8NyX
         /MbuohsroAOrmI+FDasSMJkFWQM4ptqbWTxDKnBizQmMzfUK9arc/tRg/gvawhVlpU3U
         ucTqoHHuxtYpQLYwG77l6WY+9NSFFg17ql1rTrWMT1R9IGpVj6LG/oH13q1Viz4yTwD0
         rer9uOKvg2rVWOsukWvIRrriY83kqTCwCBo9kEtyPCS6Wv5pFTkEbMyhGeXInhp2V9OP
         Tl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=yXWjzG5jUnJmH7+mrUUwQgwEEUUwD7cCSXeDwD3aXRs=;
        fh=gHgTXW+HYQlfXOTlyX5PQSNotlP/s1ZHeLT9aaJYBuQ=;
        b=qK1NltMDg6gIV2SBChOk9gLPT5SATp30rxutqrmop1fO8xnu9UJzOv+TOLDWb3/UAs
         LePr4UXNYYhFr81vSeerINJMvkQMKLK/472s435xmslN+LhOm/DyYLBTFRKA+amHhnNG
         zjEfxFjy0YXzjONnQOqIL4mTPPjrIV/wZV56cKUha3IQmCmDER0D/GX9e8DYw3eohXpu
         QiFJW/rz1Jy7qaUjBerpRTGk2X25IMo4hfduoxLf0/r6NjIcbOBj8BS5PXbiQmwRffHu
         I2wqxsyKHoqIDKR7Up411IuJgp6MMzIP0vjqN8AcKJ6cQF2mIt2zxiua1QmGaRWOYdDc
         ItYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o28-20020a05620a131c00b0076daa449cb8si8175564qkj.224.2023.10.25.13.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvkxI-00064u-Gn; Wed, 25 Oct 2023 16:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qvkxH-00064e-5N; Wed, 25 Oct 2023 16:58:19 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qvkxE-0006zA-PK; Wed, 25 Oct 2023 16:58:18 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C5F1F75609B;
 Wed, 25 Oct 2023 22:58:13 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8AC8D75608E; Wed, 25 Oct 2023 22:58:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 88732756087;
 Wed, 25 Oct 2023 22:58:13 +0200 (CEST)
Date: Wed, 25 Oct 2023 22:58:13 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 14/23] vhost-user-gpu: skip VHOST_USER_GPU_UPDATE when
 !PIXMAN
In-Reply-To: <20231025190818.3278423-15-marcandre.lureau@redhat.com>
Message-ID: <bc6d4505-df80-8179-0201-7eb396a22547@eik.bme.hu>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-15-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1446413130-1698267493=:42723"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Vfl3B/D0mQ9q

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1446413130-1698267493=:42723
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 25 Oct 2023, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> This simply means that 2d drawing updates won't be handled, but 3d
> should work.

Does this silently break guest display when !PIXMAN or I don't understand 
what this means (I don't know how this device works). If it causes missing 
display without PIXMAN should this need pixman or print a warning about 
that?

Regards,
BALATON Zoltan

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> hw/display/vhost-user-gpu.c | 2 ++
> 1 file changed, 2 insertions(+)
>
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 1150521d9d..709c8a02a1 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -307,6 +307,7 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
>         dpy_gl_update(con, m->x, m->y, m->width, m->height);
>         break;
>     }
> +#ifdef CONFIG_PIXMAN
>     case VHOST_USER_GPU_UPDATE: {
>         VhostUserGpuUpdate *m = &msg->payload.update;
>
> @@ -334,6 +335,7 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
>         }
>         break;
>     }
> +#endif
>     default:
>         g_warning("unhandled message %d %d", msg->request, msg->size);
>     }
>
--3866299591-1446413130-1698267493=:42723--
