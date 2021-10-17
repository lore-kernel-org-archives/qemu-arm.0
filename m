Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2141844lfc;
        Sun, 17 Oct 2021 08:08:20 -0700 (PDT)
X-Received: by 2002:a1c:1b89:: with SMTP id b131mr38567580wmb.71.1634483299905;
        Sun, 17 Oct 2021 08:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634483299; cv=none;
        d=google.com; s=arc-20160816;
        b=vtZnm3HmAvLsi3neMZu/KFCrhY4pl+vR3gEyZJXgDPYehCFDKNwqa9vN8njCgPsI7K
         52FHKEXjkmT/3ZO2nEg40Lq3oVeUwZEwLLcSjXR49VxPJga2/n1XyxxP8xRJqL/O+ljU
         1A0rCERpQm2MgLhiuyx94ZODFb+PG31ti77OPfcL8dTcnvCqAC5jAEU/di6ayhTZ+s1/
         3rXzt2UBZ5oNRNgWNEzYEfL8+WhpZSa2D+RUEisRf50uyMFboFO6qtSsW64rtivkittg
         vAsw++UwKJvgpWdkFtTiaV3zfLAxUQq4VtNmjMWLJvXJcpoIcZz7GCWo37qXbCy51Rit
         ZRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=i+u8FRU7kdRK4Ee8DvlELkVGjRjvfkFu9EXe/Z9ecZs=;
        b=RJmMYozPz+a+atnVkP/qZhR43/Rv9BfGXE2BMlRLKhh/Ple5zK455w1xgIoxgHGM/a
         f8Zl+CgRa9NkNPiZjH324ka65mcT4mTOmHPDMBZbjEg0PELxTfiiTJKWlDO8lsPmPZX9
         dndMuGlhS81QRioDSc8rIGFXiiyQcEehnI1x6UIPuVHFf4Xqc+zjRuM/GBNr0jKYSfqa
         4pkbUZ6WqZA1oYlyZHNklnQVkVIyZfXe/d+fcRy6XDypCRaG21r2vqQh4iNv8Fi+Q6dt
         Y3ttPKThBlwkUEW+ZoTVPmNySGw/LrFzzkTwX1xfEKnUUJwX+LPD2FtycQrGfdjaGesW
         rvQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="phUkSHl/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w7sor3396019wrn.46.2021.10.17.08.08.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 17 Oct 2021 08:08:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="phUkSHl/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i+u8FRU7kdRK4Ee8DvlELkVGjRjvfkFu9EXe/Z9ecZs=;
        b=phUkSHl/oaRD8X92M2Le6z1opyjOQjeRpVcltW4afkH1MoO+vuD5gk3wtxD3L0W330
         asytJ3GX5jlNpr98WT3BU5qWTs71lQNJUJVTDLRIWepne4qQfP7IaHr2JHNp99feHlyv
         xPF8UDBlHOQA0VU/5lHuuDy01Yp/YDGi9M1oCkcU6wJHxg9UXJX21Dw1u38rndJvSmad
         uryRP81UtsiW3OuS+s7TCXhPOnUEfrjluvjRFzOELQqLB9L4QPC/isEosEgyw84m2zfz
         g/65ffChdMqVc5zG4Tk7m4PgMaLdoNyaeHhDz1okEuQe/8pQ+2lNqo23pXy8GSJXjhNx
         MkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i+u8FRU7kdRK4Ee8DvlELkVGjRjvfkFu9EXe/Z9ecZs=;
        b=uicQnDlf9a0GkkKmfpr5CsikurlOAR+iIgm+5bqcft+SS35Znj48MGsZz+y+Yu+9Hf
         ihJlQrfpSwiodU9cMje4zDtYnjAeL5msZMZ+G0/3+VUt+ymbwMaGC2jL1FloxgfuRAwe
         63hvaFPWFfTB7ErBisGrGqRtPkouPZLAW1ymRQ/+s/vCAz0E/x2d63A3UtUIz9mmVJB/
         jE5J0efG2GzT+xjN1qPyYFDL2kLobYYekqH5VXUz7+wpbfFx37EqIImI+CTwCaFjcedt
         i+zTC5otW3J5GG7N3TPjwT0UVs+tEIuYB8EJDAvfBehfK4yMN399xJ5QtPz3zaXmqhUf
         ixGA==
X-Gm-Message-State: AOAM533fbiniotSsGce8ccpXGKM9YCm2N5kis+4L0Z+5iQJcbRR5+mCB
	cQI5BrV8LBcpz1wrNlbDa4mdlcksomI=
X-Google-Smtp-Source: ABdhPJxVdjiAUK76n/EJK/Q+7CRlPm4Bvzx+3F7t2getEza//JHFO91UWXSjhAcUqms4sM0rfD890Q==
X-Received: by 2002:adf:e749:: with SMTP id c9mr19241327wrn.272.1634483299605;
        Sun, 17 Oct 2021 08:08:19 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net. [81.36.146.213])
        by smtp.gmail.com with ESMTPSA id c7sm12577112wmq.13.2021.10.17.08.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 08:08:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
Date: Sun, 17 Oct 2021 17:08:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with recent
 RPi kernels
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
References: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: Pv73+8PKZ1/S

Hi Benjamin,

On 10/17/21 09:48, Benjamin Herrenschmidt wrote:
> The framebuffer driver fails to initialize with recent Raspberry Pi
> kernels, such as the ones shipped in the current RaspiOS images
> (with the out of tree bcm2708_fb.c driver)

Which particular version?

> 
> The reason is that this driver uses a new firmware call to query the
> number of displays, and the fallback when this call fails is broken.
> 
> So implement the call and claim we have exactly one display
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  hw/misc/bcm2835_property.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index 73941bdae9..b958fa6a5c 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -269,6 +269,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>              stl_le_phys(&s->dma_as, value + 12, 0);
>              resplen = 4;
>              break;
> +        case 0x00040013: /* Get num displays */
> +            stl_le_phys(&s->dma_as, value + 12, 1);
> +            resplen = 4;
> +            break;
>  
>          case 0x00060001: /* Get DMA channels */
>              /* channels 2-5 */
> 

I carry (among others) this patch for the raspi4:

-- >8 --
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 3b3f5a804d9..8bd149211af 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -36,6 +36,7 @@ static void
bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
      */
     BCM2835FBConfig fbconfig = s->fbdev->config;
     bool fbconfig_updated = false;
+    int fbconfig_idx = 0;

     value &= ~0xf;

@@ -290,6 +291,25 @@ static void
bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 4;
             break;

+        case 0x00040013: /* Get number of displays */
+            stl_le_phys(&s->dma_as, value + 12, 0 /* old fw: unique
display */);
+            resplen = 4;
+            break;
+
+        case 0x00048013: /* Select display  */
+            fbconfig_idx = ldl_le_phys(&s->dma_as, value + 12);
+            if (fbconfig_idx) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "bcm2835_property: Only one display
implemented,"
+                              " requested display #%d\n", fbconfig_idx);
+            }
+            resplen = 4;
+            break;
+
+        case 0x00040014: /* Get display settings */
+            resplen = 0; /* as old fw we don't support that */
+            break;
+
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
             stl_le_phys(&s->dma_as, value + 12, 0x003C);
---

FYI I plan to respin Alex's recent series with these patches:
https://lore.kernel.org/qemu-devel/20211004134742.2044280-1-alex.bennee@linaro.org/
as soon as I get some time...
