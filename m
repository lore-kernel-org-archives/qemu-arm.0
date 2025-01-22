Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp746481njc;
        Wed, 22 Jan 2025 04:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXW9do90FEU2fNQfMliOg+SlBp9PWpDxW3+hk2Mq2qs4D0DY5Iwc2Fiw9/PF+4yN4pBfTUbUXeEzkFPsw==@linaro.org
X-Google-Smtp-Source: AGHT+IFzZNVU5ARX+xKQoByLj3rir+53NRwvkNgiABn63wULGQeu7VyHZeKOBVU5AUFG3sn/0U6l
X-Received: by 2002:a05:6102:15a1:b0:4af:f6e5:2b46 with SMTP id ada2fe7eead31-4b690bfc4bcmr16547856137.9.1737550004830;
        Wed, 22 Jan 2025 04:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737550004; cv=none;
        d=google.com; s=arc-20240605;
        b=F1LuZYIdolPkgI7aWMnPr1KC7BpYkGKGOMttoUP4rM9bArizOGTGBD1QJa1zNiIMY8
         eIn/n2seDX8MZNE8hb50by8jkhpseTkAxGSxFmivsyYdZjhFKRQcTyMmVSbf/ofCyV39
         a+dTHEcctDue12rBzg9AkTz2/PNAjV46ZVyYooTnP5TGpusw/Qmlq2uB/2mW6BbZybAl
         Z7eegGSNA+aeViIdR6DgIR5L3oIYL2pCCZqiKXND+Kg8LQ67UTC0eMRJakWG5eVDQcWf
         2/aCi5YErbD598F8hye0ZHtXx9tA0QvJn4lYB6uBuTuqBiV0lzYjkHe2pAL8YH5FSiDg
         GiXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=tHsJ6GwRs3JVt8elqaum0FFLxAjKW/xZT9S3GJuRLik=;
        fh=nDcSTD+hFo/GX3JF67CLNfbHspx9kmBRhejRlRpB730=;
        b=fYNSUgqbkiSee/oXwYqAg2/qmIABbKrHCUecKLUFfBzPASYv9HYLWx6byU/P6Ibdok
         4y+a6OfIY41HdN77twib/12CRBhPRVxC9NmSiy2qsiGRUzQGD19geyP3tDFlJ0lRqo9O
         IYcBGpSIUjxG9P5tKT2NAdsGNzfEM20YBO+07rCcTGDSLtjXVtqdd7Xk1ZVWJyHZwPxV
         Mbrv/GXjLns0rl070TWfGo9BjTSuQVanEsdSDo52cy75meCn8yhdp4SM20Gq9lX+okv0
         5clOaXjjSHF5263VAnKrkujPR4jx//Gx7aJu03y7kFjGPz7ykm7QdIG0zo6t01wHx22c
         fQQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=EBXtZLhK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b68a37f309si3357188137.672.2025.01.22.04.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2025 04:46:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=EBXtZLhK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1taa7u-0000KD-K4; Wed, 22 Jan 2025 07:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1taa7g-0000Ib-OA
 for qemu-devel@nongnu.org; Wed, 22 Jan 2025 07:46:23 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1taa7e-0005TC-GN
 for qemu-devel@nongnu.org; Wed, 22 Jan 2025 07:46:20 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5f63c89e72bso1384083eaf.1
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2025 04:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1737549976; x=1738154776;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tHsJ6GwRs3JVt8elqaum0FFLxAjKW/xZT9S3GJuRLik=;
 b=EBXtZLhKlkHgkSbdtIyeHwOA1rFZXf0s0w1ZHc94XKN8P3LOwRuD7z9tKD9vvgDZa5
 ek2MpEOcBdkV36kwlkNj4Nbz+RpON31T6wYfHDfqI/Sz/64Jkl8AwcMSL4P1szkJBOl3
 JLwcolmQSJkas21qO85FaJy86EmsjzDexpTumHUCoRVa4B+uUY9fnlGRL2fAap2Y8Wa6
 fumAEDdlmovBR5jNK4ywEKQ+pyxgKVig5YvOJXnhwhFjTf9Qk0mzapeLqNlYAV3+Yc8E
 +LsVFiT7qe48JnQA9fmum3hsYmndPyYSxkk2fbS8y6Mrm6W+rXKCx64BD5gUtM3tkiFN
 mUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737549976; x=1738154776;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tHsJ6GwRs3JVt8elqaum0FFLxAjKW/xZT9S3GJuRLik=;
 b=C1TFExygbnaXRPMlSzaPi6cA/u0KQBsyh8xDfHrCY6MPoNFxO+j6KR/uFqyf3/gh4h
 8J2Q4A1dOmYRNcAZAVWCJ57fgfqrO1g4vqnToj0R/GNrrQUHtDpBHzstYws/2kfmroka
 54pYhc7PfnnvVYEuN4QBB3Zr6sE97g3CQjK4bEgn/aZCRHt+TMwGTqPdDt9p+wnCMIj/
 pUeTqQOl8ZiDSEdIjkEEL9FUxpylQTmCR1UmS0JlTb+IxSjx+06efVTtGOCooUmmNcR+
 7IaK6zJpyHWpQSGOLwXcB85UiR4yAGC5JkX5DvDkvj55xoYIjQir/JLoH2AE3RO3N2Nj
 /gbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMtuSSiCNKU17MHP4fN8ub3trCCAOrHd1RcsV9k670k8etztbK0Sxzv/JZKNhQC4B2+FVL46K70Fy1@nongnu.org
X-Gm-Message-State: AOJu0Yy4cefkUpB4Ko72TpzyLr8bykgEPu7+DTMQPl/72lOniHghOdeH
 1yHJLWTaxrCY5uiMG/FB9FpQ+aNODnNepJd9BCSXXFfz6VXkgLyF0ZDDv4EiiOI=
X-Gm-Gg: ASbGncvq/sInPG24S9vWtcMuHmwz336+oRMi5jCT8n3wO7NPt85+w4jkbjOyCZRCBCp
 8aRAdXSwnVx+JptB8v9Q3rn+9FZbFVgbluQGUXKpSOY9Q8/UYr07cdZXhIIJnwuk1ReTmIccQRr
 lRCmgYbu7zc38hPkuU4fVjsG/fWjTfn/o8zCxN0wMNnkaqhu2wSfTopKM/IO6IxhYDF++dQTcPl
 miZ34GrxbQXq10XGSFXGagfmKymh7zpfvFXAPlIT/smJJsN9QZMHgf1XCyC7aa9sXoTsQj6Sg==
X-Received: by 2002:a05:6871:67c6:b0:29e:362b:2148 with SMTP id
 586e51a60fabf-2b1c0ac8b88mr11653499fac.19.1737549976376; 
 Wed, 22 Jan 2025 04:46:16 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:fcff:2202:9088:5355])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7249b37c670sm3838700a34.8.2025.01.22.04.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 04:46:14 -0800 (PST)
Date: Wed, 22 Jan 2025 06:46:09 -0600
From: Corey Minyard <corey@minyard.net>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, minyard@acm.org, its@irrelevant.dk,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Subject: Re: [PATCH v2] hw/misc: i2c-echo: add tracing
Message-ID: <Z5DokVWHDvdZO1jD@mail.minyard.net>
References: <20250121105935.3069035-1-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121105935.3069035-1-titusr@google.com>
Received-SPF: none client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=corey@minyard.net; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: corey@minyard.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dyAm371JfzwW

On Tue, Jan 21, 2025 at 10:59:34AM +0000, Titus Rwantare wrote:
> This has been useful when debugging and unsure if the guest is
> generating i2c traffic.

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  hw/misc/i2c-echo.c   | 8 ++++++++
>  hw/misc/trace-events | 5 +++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/hw/misc/i2c-echo.c b/hw/misc/i2c-echo.c
> index 5ae3d0817e..65d10029dc 100644
> --- a/hw/misc/i2c-echo.c
> +++ b/hw/misc/i2c-echo.c
> @@ -13,6 +13,7 @@
>  #include "qemu/main-loop.h"
>  #include "block/aio.h"
>  #include "hw/i2c/i2c.h"
> +#include "trace.h"
>  
>  #define TYPE_I2C_ECHO "i2c-echo"
>  OBJECT_DECLARE_SIMPLE_TYPE(I2CEchoState, I2C_ECHO)
> @@ -80,11 +81,13 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
>      case I2C_START_RECV:
>          state->pos = 0;
>  
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_RECV");
>          break;
>  
>      case I2C_START_SEND:
>          state->pos = 0;
>  
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_START_SEND");
>          break;
>  
>      case I2C_FINISH:
> @@ -92,12 +95,15 @@ static int i2c_echo_event(I2CSlave *s, enum i2c_event event)
>          state->state = I2C_ECHO_STATE_START_SEND;
>          i2c_bus_master(state->bus, state->bh);
>  
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_FINISH");
>          break;
>  
>      case I2C_NACK:
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "I2C_NACK");
>          break;
>  
>      default:
> +        trace_i2c_echo_event(DEVICE(s)->canonical_path, "UNHANDLED");
>          return -1;
>      }
>  
> @@ -112,6 +118,7 @@ static uint8_t i2c_echo_recv(I2CSlave *s)
>          return 0xff;
>      }
>  
> +    trace_i2c_echo_recv(DEVICE(s)->canonical_path, state->data[state->pos]);
>      return state->data[state->pos++];
>  }
>  
> @@ -119,6 +126,7 @@ static int i2c_echo_send(I2CSlave *s, uint8_t data)
>  {
>      I2CEchoState *state = I2C_ECHO(s);
>  
> +    trace_i2c_echo_send(DEVICE(s)->canonical_path, data);
>      if (state->pos > 2) {
>          return -1;
>      }
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index cf1abe6928..d58dca2389 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -390,3 +390,8 @@ ivshmem_flat_read_write_mmr_invalid(uint64_t addr_offset) "No ivshmem register m
>  ivshmem_flat_interrupt_invalid_peer(uint16_t peer_id) "Can't interrupt non-existing peer %u"
>  ivshmem_flat_write_mmr(uint64_t addr_offset) "Write access at offset %"PRIu64
>  ivshmem_flat_interrupt_peer(uint16_t peer_id, uint16_t vector_id) "Interrupting peer ID %u, vector %u..."
> +
> +#i2c-echo.c
> +i2c_echo_event(const char *id, const char *event) "%s: %s"
> +i2c_echo_recv(const char *id, uint8_t data) "%s: recv 0x%" PRIx8
> +i2c_echo_send(const char *id, uint8_t data) "%s: send 0x%" PRIx8
> -- 
> 2.48.0.rc2.279.g1de40edade-goog
> 
