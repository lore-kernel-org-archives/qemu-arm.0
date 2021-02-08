Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1396200lfc;
        Mon, 8 Feb 2021 10:31:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/K57kdgI2By4T27tZ2JuO323RIRkq48hs5IZT+8gnjyo40WKkBsDsuUhjO7C0k/m/NWVP
X-Received: by 2002:a25:31c3:: with SMTP id x186mr26807389ybx.500.1612809064209;
        Mon, 08 Feb 2021 10:31:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612809064; cv=none;
        d=google.com; s=arc-20160816;
        b=OfekVKf0i444kcCHRn3WnDhgulZqCJ7PckGSdN1s+vftVBzaxPv1qCqeistDJX4L5V
         rSU6W77O4KTkDpB2086j9xlagdZ9yFyS3+f6HBUNvYMWzjwkTtI+3ADyV3GoIQZ4Lm1Q
         3t7Sh0WopYmavSNW3R0Y7itqMI2YxcGOIgQZGZA8l+TEb2RPCnb364Hq/Zj8zKaOOg6X
         ry0IXRrYVHVxfcuoTz6dy27iGPpNbQlkGg06sjKqzyHntDsyynNAxYz+9HLcUnhdhpCU
         ZOSTOx5MhDcMAT+ZQp5h8+J1qfzpuWgy06dvTTQns2t3r1ki9If0M68HDvVKZ2AtCq9U
         hFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w9NiabmO5CzJfZ/zFcfyiUkofT/HxE6L7y1PJoRvMxw=;
        b=e8IQI2oAkCN3t5a6gcq5edrr+CANMVFLAXiEgoITcdiu2SBmsRlvc91HStrCDnUpvC
         g2hy4Rq4m82OJvu84vysh+QrwQzZWUZWTNLs+9BaahgjpsGHICZlFyyM2VSh7OdrC3Q1
         NUu1YIILlRV9mI+U1ZQwMnWXsb49p14Udj681VkS4I7xqdWZSSbH4Lc8uApqkmxzyqTV
         VpW5NEccziYo75sPeLdjeva5wLjE0MGm70Kye8N96ZZXhomvJrOb85fLsdH9knN/eOvl
         bg+DT3xxqGVI9yURtf4GAw28Vk6EDLk0kZVVfZlxXaTlR8ZG4XEty8P6WIPR/dn3ZnWf
         F3eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t7MWugst;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si19893712ybj.22.2021.02.08.10.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Feb 2021 10:31:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t7MWugst;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l9BJP-0000DX-K8
	for alex.bennee@linaro.org; Mon, 08 Feb 2021 13:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9730-0005PF-2j
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:57:51 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l972g-0001Mx-IA
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:57:45 -0500
Received: by mail-ej1-x636.google.com with SMTP id sa23so24886389ejb.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w9NiabmO5CzJfZ/zFcfyiUkofT/HxE6L7y1PJoRvMxw=;
 b=t7MWugstWbRds/zCmvRBYaIIW87Cd0IQ/TzBq3iMS22suu71NdpCGPsBJ3EPgQUCAX
 CaYF+dsjXzqANiNUTErmMK5PwROOCfx5VpXz/CaxADLdw2ipxLX5LN61D6Xr7szVH4tF
 QZdwFZdfJsovk319dhPZoPedGodA3lE1std1Frfu7lFlSwp580RGa8K3Zr+L5f6TXBKc
 QrvPe6DzEUkE3X7uRJX+XQrdPDdIldjaH+/2+0fJQUL/DQVf+CUIFWOjN78t6hcJYM+1
 8H9iRbtV8G8TBfH6HMThNKHXildLRGgvo8nocIcosLszbFyT+kuGDLp+LPqPlmYUpyEr
 tfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w9NiabmO5CzJfZ/zFcfyiUkofT/HxE6L7y1PJoRvMxw=;
 b=jWBRm3eWAP23Gnj8PjgAVoh6HOtFazEVS+Twh6ZwEpNN+N9C4nXFWxuzCh5sJ3qpqh
 r4gKkJ3q2lozhCADk1RmlzwAO/QL2izOlsZSSdCZEDA0fg7eCKgXUWKEAdGqJL5rm0+5
 HUlLckudDRsdxx9fVix3pkjXv9rsjTlZ8koifhwJTIL0Bb9a8ZXo6IY1BTbx8X4yIZdl
 xDT0K9GUK2DYeTYhoDy0zDTe7aGhrgrPlGhFNpa9RTP+BcH8GDOULOSg6Ux6XXZWZp+J
 vMUzyn8qVPBx3heEaLkYAucuk5gCV1eiWvJLgkRqpPssrsUnj12nZrVgIAsg5ruIFGxZ
 3enA==
X-Gm-Message-State: AOAM530vzhKfu64DCyGQAYh5HHqXiUXlwhqwl83Rg/6B/39L1A8J5K4X
 LpoyXupIUNdr/1UO1RkgzqlgKzkccM43ulGf3bkG7w==
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr17152203ejc.482.1612792639269; 
 Mon, 08 Feb 2021 05:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-20-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:57:08 +0000
Message-ID: <CAFEAcA9e7XhcLma7tz6hfn6fbukZXbKt1yw-DEemV6vQ=SxQow@mail.gmail.com>
Subject: Re: [PATCH v5 19/31] linux-user: Handle tags in lock_user/unlock_user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lp1+kAFP6EpR

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Resolve the untagged address once, using thread_cpu.
> Tidy the DEBUG_REMAP code using glib routines.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/uaccess.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
> index 30d01f8b30..c696913016 100644
> --- a/linux-user/uaccess.c
> +++ b/linux-user/uaccess.c
> @@ -6,36 +6,37 @@
>
>  void *lock_user(int type, abi_ulong guest_addr, size_t len, bool copy)
>  {
> +    void *host_addr;
> +
> +    guest_addr = cpu_untagged_addr(thread_cpu, guest_addr);
>      if (!access_ok_untagged(type, guest_addr, len)) {
>          return NULL;
>      }
> +    host_addr = g2h_untagged(guest_addr);
>  #ifdef DEBUG_REMAP
> -    {
> -        void *addr;
> -        addr = g_malloc(len);
> -        if (copy) {
> -            memcpy(addr, g2h(guest_addr), len);
> -        } else {
> -            memset(addr, 0, len);
> -        }
> -        return addr;
> +    if (copy) {
> +        host_addr = g_memdup(host_addr, len);
> +    } else {
> +        host_addr = g_malloc0(len);
>      }
> -#else
> -    return g2h_untagged(guest_addr);
>  #endif
> +    return host_addr;
>  }
>
>  #ifdef DEBUG_REMAP
>  void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len);
>  {
> +    void *host_ptr_conv;
> +
>      if (!host_ptr) {
>          return;
>      }
> -    if (host_ptr == g2h_untagged(guest_addr)) {
> +    host_ptr_conv = g2h(thread_cpu, guest_addr);
> +    if (host_ptr == host_ptr_conv) {
>          return;
>      }
> -    if (len > 0) {
> -        memcpy(g2h_untagged(guest_addr), host_ptr, len);
> +    if (len != 0) {
> +        memcpy(host_ptr_conv, host_ptr, len);
>      }

Why the change from checking >0 to checking !=0 ? I'd rather not
have to go through and audit all the callsites to confirm none
of them pass a "length-or-negative-errno" value here...

thanks
-- PMM
