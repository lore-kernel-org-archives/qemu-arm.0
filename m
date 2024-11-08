Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4949690njc;
        Fri, 8 Nov 2024 06:24:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjWOiPGBAjfpnXjEq+3fakoMKI8Jd9Cz1UxTzB3Vrc646sgnGS/OVqFs6DN1d+R1fBcqrOgxbpsb2fJg==@linaro.org
X-Google-Smtp-Source: AGHT+IHClRtLcqFm/KO23btugmSPyqmzFQ0rCafMHAOs2bID1qJjMibrXVZ1L+ETDS97/5eufZH9
X-Received: by 2002:a05:620a:c41:b0:7b1:4276:ea4e with SMTP id af79cd13be357-7b331db7d5amr389626485a.13.1731075864032;
        Fri, 08 Nov 2024 06:24:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731075864; cv=none;
        d=google.com; s=arc-20240605;
        b=hmcjPePNh8Q1WZ96nMlRVExEqqFMejcIz+ewnD0vUX9eE/EMByNSFH3RSVvbFajY6o
         BriTIgp/3D7U8Cwym+ibSfyNb2IRh2ScyRnvV6E4AMDZTJW//vY6ZGms1bv4+eA+3prz
         Q5i3/H87RCiMBXl02msxzs7gdlLsytByw5c3qJ9FsnhuX/zFnKJVwl3bC1ES0uqv1Q5Z
         gMVx/TRLthEd42ItlVqqQbGsyD+7sEn4qA0v2jDCxpwoG7iUmLaKt7+9VRG3v6bMi1c6
         Vbc5xZuO9wmuztLApzDPAwvEkUWs1O56g4h+FUMU+o2fgAdk5bAb7fZ8yn8ao+hoHtf6
         0kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=+tUMkjdrwLZ0bqPC4ZvTSYSeqboyLwMPPT4K7e2QoAs=;
        fh=Thk+6NE4QETa+Vvam2mWiD1pa3jxs1KSEj+Fke2InLY=;
        b=P3hYIK5EuKjd7keOTd7ro1Dz/qytFcaYBCIO39oZE9xjpLUtRxmtTju7K6NmnG4NA5
         uzqHVbD/TWcHWASlwcHFkYNxFr1YNT29iJvdjpc13+oE7vkoBcVtjPN3MQ+enl23RfFO
         9/e4JeysA9/khXpP5v7vnIHOWR0tRbLUZsDildIlQ8ErABpiwL/eIIz/GeqlpS+HFKHF
         p0hfSAihigudwrHf604EfrfZt9TJ5+RrmgNoy4QLZYwzcei9Q4/l3eGdNF9NVU1c4bb4
         /Oas9iDz/aYB/zcJlmo8R334Obh2ALHh5dAhQqgnKjQlLynDV6kBPqmx0FTy4ghxXrqE
         PI2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=wmvBFUh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ac3d625si407937985a.112.2024.11.08.06.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 06:24:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@minyard-net.20230601.gappssmtp.com header.s=20230601 header.b=wmvBFUh5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9PuE-0004IS-TK; Fri, 08 Nov 2024 09:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1t9PuD-0004ID-DR
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:24:09 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corey@minyard.net>) id 1t9PuB-0001tz-NI
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:24:09 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-27b7a1480bdso915386fac.2
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1731075845; x=1731680645;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+tUMkjdrwLZ0bqPC4ZvTSYSeqboyLwMPPT4K7e2QoAs=;
 b=wmvBFUh5sCrqYzs12XiLDXmEnvRUkmGrcz9xnWN60ICqcgoH+590NT0s9oS0qnyYLz
 s1kXtlDya/P+DJG01qEzrM48T1Iy6asT7toQbgWqWSYd4tHfi2l9QV6Pr2vTCs3KgCSt
 SBI7jyIi+OkvxyZVTpldPkCU+n74iK31CU2P3w1/ptLk1EDuhaXsnjwCpKRNXBMaY6BA
 Baozbnh2Z85HDhGOujBvxqJmnWJG8HBfbw/T2VDm7CnXlwjvsjR+EOzkHPVANpzBQ7HS
 qtJ+LblhKtXlXkVMCKWmvyWb0iPYmPhU9QOmSrU0Za69uzXUdv+r21xmG4xZrM2jK/eL
 KvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731075845; x=1731680645;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+tUMkjdrwLZ0bqPC4ZvTSYSeqboyLwMPPT4K7e2QoAs=;
 b=eT3lVqxM/8gKXFbeIh1TmrcaSn6naRA60g8xoTcC0sEoHlPFuJCHMk6ecKrPcqftFe
 Ql3td/3NyJJArucwkodArMyZhozY3/9NZsjJtv8isVW/H6V+HDdyHhWtZdE6KmxAWpY1
 ORgqFkmk2/WAgfB2vOTsTMdsHCqurgieeUsF7GcFG4WavbxWJqqN09Sz5m86iyaylg9Q
 g3tCMaECEHJ5wlRkwVp9l/pVlnAuN+WtXoOjSy+1KUEP9Yot0x99sD70FoZJS5RKxz+x
 23ymc4IML6tz0sw2TReIOoKLvsCpsePet1vz2zRQX50kpptukgtpJmdYf3PoMslHLJua
 Qcyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKB1sNUKWsRjH0Tb1EFH9usyVvXWObqfABiK8iQ2NZ54r86nB7Su4ZO6ii1UCW7nPLGIM1Xh8d3w==@nongnu.org
X-Gm-Message-State: AOJu0Yz8k/iJXNauAUDgbY8RuSJEHo0vuhXPNHnuRjnu3sF7/yQ+nTGs
 9Ixb4YMRnAEcNgF3znUZ3kIM4Ghx113aEm4ewIBMgwvRGxbT8DAIuK1Msrb0sCU=
X-Received: by 2002:a05:6870:56a0:b0:287:32f7:ef42 with SMTP id
 586e51a60fabf-2956009917fmr3238060fac.16.1731075845319; 
 Fri, 08 Nov 2024 06:24:05 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:44bd:cb9b:52b3:1883])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29546f48400sm981515fac.48.2024.11.08.06.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 06:24:03 -0800 (PST)
Date: Fri, 8 Nov 2024 08:23:58 -0600
From: Corey Minyard <corey@minyard.net>
To: Titus Rwantare <titusr@google.com>
Cc: peter.maydell@linaro.org, minyard@acm.org, clg@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org,
 venture@google.com, wuhaotsh@google.com, milesg@linux.vnet.ibm.com
Subject: Re: [PATCH 4/6] hw/i2c: add canonical path to i2c event traces
Message-ID: <Zy4e_glcDMZ1f7FJ@mail.minyard.net>
References: <20241107195453.2684138-1-titusr@google.com>
 <20241107195453.2684138-5-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107195453.2684138-5-titusr@google.com>
Received-SPF: none client-ip=2001:4860:4864:20::31;
 envelope-from=corey@minyard.net; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: corey@minyard.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uCJdt5x9rZKQ

On Thu, Nov 07, 2024 at 07:54:51PM +0000, Titus Rwantare wrote:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  hw/i2c/core.c       | 8 +++++---
>  hw/i2c/trace-events | 2 +-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index 4cf30b2c86..d238311776 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
>             start condition.  */
>  
>          if (sc->event) {
> -            trace_i2c_event(event == I2C_START_SEND ? "start" : "start_async",
> +            trace_i2c_event(DEVICE(s)->canonical_path,
> +                            event == I2C_START_SEND ? "start" : "start_async",
>                              s->address);
>              rv = sc->event(s, event);
>              if (rv && !bus->broadcast) {
> @@ -244,7 +245,7 @@ void i2c_end_transfer(I2CBus *bus)
>          I2CSlave *s = node->elt;
>          sc = I2C_SLAVE_GET_CLASS(s);
>          if (sc->event) {
> -            trace_i2c_event("finish", s->address);
> +            trace_i2c_event(DEVICE(s)->canonical_path, "finish", s->address);
>              sc->event(s, I2C_FINISH);
>          }
>          QLIST_REMOVE(node, next);
> @@ -321,7 +322,8 @@ void i2c_nack(I2CBus *bus)
>      QLIST_FOREACH(node, &bus->current_devs, next) {
>          sc = I2C_SLAVE_GET_CLASS(node->elt);
>          if (sc->event) {
> -            trace_i2c_event("nack", node->elt->address);
> +            trace_i2c_event(DEVICE(node->elt)->canonical_path,
> +                            "nack", node->elt->address);
>              sc->event(node->elt, I2C_NACK);
>          }
>      }
> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> index f708a7ace1..e5f2dc643e 100644
> --- a/hw/i2c/trace-events
> +++ b/hw/i2c/trace-events
> @@ -9,7 +9,7 @@ bitbang_i2c_data(unsigned clk, unsigned dat, unsigned old_out, unsigned new_out)
>  
>  # core.c
>  
> -i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
> +i2c_event(const char *id, const char *event, uint8_t address) "%s: %s(addr:0x%02x)"
>  i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
>  i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) data:0x%02x"
>  i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
> -- 
> 2.47.0.277.g8800431eea-goog
> 
