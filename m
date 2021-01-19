Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3489512lfq;
        Tue, 19 Jan 2021 08:59:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyePp8w3gpyl8z91fC5ICFCAgSJK7r8O7t5zA8zb9xtmRdSnVEAH8gLx+AOA5rmmqZdgRzb
X-Received: by 2002:a25:4258:: with SMTP id p85mr6815070yba.423.1611075592910;
        Tue, 19 Jan 2021 08:59:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611075592; cv=none;
        d=google.com; s=arc-20160816;
        b=SjwCXFMbxOg3ArkwxJs2h5rZNydaVcS3kw1qShs1l3gCAd/AGyQz+gqP63SUjsOxsY
         8K4abDAQUm5+LMmNtwnM+a19voRS1H53i6m7W5bqof0kndpKvgTX88QgvXTCBhveU+xG
         Z51OCZXWi0MmVXgdUai9Bg/MFfn/SjEuH6aLZGLdTLVx4nLpl4fhOXPXLqkPFi9SQcOf
         GuKILxuAmM3sdqg6JTzmmBMn4cUgl22Dm08MAr/MGNsjuuadN8jfoN37F/0+iUaailLC
         +yVYEXWzx3U3HlMo2W7kVUn37qICGJtlpy7mobGjEeHfqJJMYT65mGzod3Sir1HpSAQj
         DHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oRoULs7q7/xf60wCfWU9kPfmr16BDxgD+lP1vebTTHI=;
        b=DbjI6lwluBI73B+3i89YdCxHnwmRB+INsLO4L80pSzd3I/BMp/nQlBK4pyAV69q+OM
         uXC4bjGw+/NuqxkLaYEGnDregkq6W70Fo4qfk2Nw1lr8WQTzPAaaVIIOt8brlGL5Yjtf
         rwM+SHJXW/+4UmRZ1TMEE1XCtMKBagLCK1zuG4mazQ8zPJbuNvrvWQbcT+4R7hcXeEpR
         w6SpN6XYyuTXpToio46TR+vjjQCX/0BOVX7TscLYSoOsrM+Ijj3U3jHST3HmugeMpod/
         FZ6sSUxdm8EzIQNDulV39J0H8fr5YyHJhfUiVZz9ujDFvh6dWSmJGQVkkL324Q+8PUdn
         ulxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VbX7UytP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w133si23040328ybe.292.2021.01.19.08.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 08:59:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VbX7UytP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1uMC-0005cO-7g
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 11:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uKa-0003Nt-6m
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:58:12 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uKR-0002gc-Jy
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:58:10 -0500
Received: by mail-ej1-x62a.google.com with SMTP id l9so23789580ejx.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oRoULs7q7/xf60wCfWU9kPfmr16BDxgD+lP1vebTTHI=;
 b=VbX7UytP8Z1hLcF93G7kCejalNPuvRYfxO4A2p2fEZAZowdWzqnoLzSLW2FDkuaSdM
 GTkCw572TGn7h9nPEfge30zypcz3a5/j+qHtDDxo8CXelxlflGVvbONAu2NVyoKAuyxV
 HcOT5SX5GMKpePTXCDMO4NtqOnkP1B5ill0WylZUg20ixfxKn7BwsUOUcPT0kpomg0si
 GdsAysQ7MRpx3BvKz3nuwe9oCaReCNcfa33tnZ825uNIvLSh8AWCzjXYXpDKpWN/jUn4
 rjpQSo6OuQetxAWCanrO9dpHAIh8YJMBACtkPFd7VOXUtBA8QZ1NeA/9skkldI5ATiGO
 9loQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oRoULs7q7/xf60wCfWU9kPfmr16BDxgD+lP1vebTTHI=;
 b=PMEoMjx1pjL+kHeGDrtgIJFT2OYWUTdPUpZUGLJ0gesnhXoUUoRIHHarSacm5eovpC
 Gi+4qiTM9rquw89qXqNV04MQsQlxH6JP4OeNEiI4kMgBYE95VEFqp98lOQ0Xof8ug+8T
 mtXf4wGWSecTVT/VUMFJR/8uaBgy4eb7w3V26HT/buxSuFBSYLEStu4UPDD3ePK8WsD1
 xIFwXTDttugIk2e7wWP2eVRZysOShXCrIKFniEPbInY/V/iEPvlfDB8lkAf3UY8XzrDi
 5SuA4EeDfKl9GOfPbS4p0jJYBtmeCk7i+v7HGrdhEiDdsLYmnyEOzOOzft/JA9X50hW5
 s8jg==
X-Gm-Message-State: AOAM533cR+FN1fDyDdZrFi7E7e9H3JNT898QjF83P6Xx2B+8A53PmrCV
 ojpE8yG/PL5tglHtpy8KGj/Tm1PVnhnhkRxZB+LeDw==
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr3470066ejb.382.1611075482033; 
 Tue, 19 Jan 2021 08:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-6-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:57:50 +0000
Message-ID: <CAFEAcA9WcN22Gio2h4Yh1m3OosKp4DPGp7oskStqxEegpT-8QQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/21] exec: Improve types for guest_addr_valid
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: i6xPo/ikKrEc

On Fri, 15 Jan 2021 at 22:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Return bool not int; pass abi_ulong not 'unsigned long'.
> All callers use abi_ulong already, so the change in type
> has no effect.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 3f9063aade..5e8878ee9b 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -79,7 +79,7 @@ typedef uint64_t abi_ptr;
>  #endif
>  #define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
>
> -static inline int guest_range_valid(unsigned long start, unsigned long len)
> +static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
>  {
>      return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
>  }
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
