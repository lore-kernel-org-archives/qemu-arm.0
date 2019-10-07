Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3803329wrm;
        Mon, 7 Oct 2019 06:31:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEMSEdUgUd9IgoGo5nhBRA6QC7OknTA7+T1MDIoo9re94hZJLOtP66dtNDnnsHT1Ob4R18
X-Received: by 2002:a05:6402:290:: with SMTP id l16mr29068440edv.178.1570455118622;
        Mon, 07 Oct 2019 06:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570455118; cv=none;
        d=google.com; s=arc-20160816;
        b=O2q9OEC0D+wpuF/Ze/ip9MJS1gwGkMq3E+nxdpPTv2ygPlu2AIhkT9uIjQzRdTztAr
         639BZ5FNuTnpIOV2CTWnM6r9FEucDIIFxiX9n43bi5o4uPUZWb6mgcCBLFdznDPxIBCS
         yIt09HWLJCR9ms8nzfn3QK4TzvREQwTCu3iGXMdNu0W1WM3dJ/ixeu9WOH93M/g/4MZo
         XKIfnPw2Ok0Nrki7j3kzgbrb9/fuY/nWkvFUa3q2ljtnUiJ2KUgku7XHOOtVLWISUMMo
         RgZWY4J8zB0ZMYOFIoo0LKxLTs0EawHo2lLUYHxbo1uRmeHLO6clicocVSl377gMZSUz
         Z/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=Ty3+UV2UYdUID4iGXSVY/z3+WgeWmmoLBQQph4dzJZM=;
        b=yeBSLLIA0x0RLfM0YOjYhRo+meAc5y9XDxwhX7V9OX/Twnaje57Hlhf9lTnZDCNKqc
         7VVnsXfGssQNpsw0tXeYJJa8RtxpuL9kOSZ1H6vKh1thPcj1C47BCfsjUaqxaW+NFrMv
         mf74amgeVuMfFna7F7ay4gHf59SbhImpVkmn0qZug/2TF7rDIIBsAV2ml6JZKa1b8qtz
         qKfUXRDDYYGFvexmwZ8dmwgl6xr4eoSEfWg6DjmCiEQRE2cYJb2qFsFXsxMcFHtGjwX9
         A/+p1TL4QM7X871cdaTadFOB1Yuh9PaCiq/rM7uPtq97ywHpeSslFLgAMWUFOmrGHFeW
         d7nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="hjBKa3/3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o32si8969389edc.306.2019.10.07.06.31.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 06:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="hjBKa3/3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHT7F-0000bx-KJ
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 09:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHT5t-000086-Bv
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 09:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHT5s-00056R-4a
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 09:30:33 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:41130)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHT5r-000562-Tv
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 09:30:32 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 206so4647004ybc.8
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 06:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ty3+UV2UYdUID4iGXSVY/z3+WgeWmmoLBQQph4dzJZM=;
 b=hjBKa3/3hl+qWwdDWAX31Gi7yZsLO7o3byHjKj+WkpBa5Ytfht7lLUjHgnrIqtzd9w
 gp/6UQZA6YSVi7uBUhIsk/TbuL7J6dTNrCiZhqoK/Yl8/K9dwuD1Uql7L+nO7unG/YKy
 WnHKlR3hvknqtM2rdW3jdpxN/Lzgo5+HVUoX11BZCXhgu6qpJxkiaC43qG7BkDDyn9jy
 3sWSA40GV90vcv+cYW3naFQGqqRxtYYDqsu8bM8FD72QYNXMTyvJmo/537MVACSEpcIz
 Wu7/XxPspyA6QgTF4QY9CfJhtdazA4HnDCweGRNChT+5Ak62gDPMvM1cU+VLMuDw1GXl
 auEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ty3+UV2UYdUID4iGXSVY/z3+WgeWmmoLBQQph4dzJZM=;
 b=Y7yeVg7yrdRX0R3epxLc1tFf3vzdkupxxVVrRp3cotqSFjSuXM8hwgThOLuRftA3D5
 j+jKOstgputpopkOMKbsPFsdsf4RxPemxnUymdSpBQX6ZryAREJFqXKHTowipKl/CnRR
 P2+sILXVK2HudX+fhD4D0yEexovoHsirRPO+SKMa2AIfqPXteyf1A594RlMrXnYnxfbS
 ce0Etd7BAufJEpjmiJMCZO+zfJWqmiqQnopuGj+GdjNiS0hJvQwwzSwD0+E3ALesO9Mr
 +xZA/yXejU0l0A5bZHnNnOZOCe4L9Yr16rd/dWHWnV7PoWZz+/b7DVAy/LuQdVOaHcBc
 kH4A==
X-Gm-Message-State: APjAAAUvz+MqX+Hg7NGutOwaR+kMZ6UVu+UG1ZoDhAfJDEcT3eluAPWQ
 PON/WnB7l2TbIGdbT87YbHffwA==
X-Received: by 2002:a25:f202:: with SMTP id i2mr11078174ybe.178.1570455031045; 
 Mon, 07 Oct 2019 06:30:31 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id d17sm3798974ywb.95.2019.10.07.06.30.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 06:30:30 -0700 (PDT)
Subject: Re: [RFC 3/4] ptimer: Provide new transaction-based API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191004114848.16831-1-peter.maydell@linaro.org>
 <20191004114848.16831-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <125df8bd-d352-3cc2-7dbc-004a84326570@linaro.org>
Date: Mon, 7 Oct 2019 09:30:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004114848.16831-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b35
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3eSO/7i/mORo

On 10/4/19 4:48 AM, Peter Maydell wrote:
> Provide the new transaction-based API. If a ptimer is created
> using ptimer_init() rather than ptimer_init_with_bh(), then
> instead of providing a QEMUBH, it provides a pointer to the
> callback function directly, and has opted into the transaction
> API. All calls to functions which modify ptimer state:
>  - ptimer_set_period()
>  - ptimer_set_freq()
>  - ptimer_set_limit()
>  - ptimer_set_count()
>  - ptimer_run()
>  - ptimer_stop()
> must be between matched calls to ptimer_transaction_begin()
> and ptimer_transaction_commit(). When ptimer_transaction_commit()
> is called it will evaluate the state of the timer after all the
> changes in the transaction, and call the callback if necessary.
> 
> In the old API the individual update functions generally would
> call ptimer_trigger() immediately, which would schedule the QEMUBH.
> In the new API the update functions will instead defer the
> "set s->next_event and call ptimer_reload()" work to
> ptimer_transaction_commit().
> 
> We use assertions to check that:
>  * the functions modifying ptimer state are not called outside
>    a transaction block
>  * ptimer_transaction_begin() and _commit() calls are paired
>  * the transaction API is not used with a QEMUBH ptimer
> 
> There is some slight repetition of code:
>  * most of the set functions have similar looking "if s->bh
>    call ptimer_reload, otherwise set s->need_reload" code
>  * ptimer_init() and ptimer_init_with_bh() have similar code
> We deliberately don't try to avoid this repetition, because
> it will all be deleted when the QEMUBH version of the API
> is removed.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

With the need_reload fix, as you noted, and one other nit,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +/**
> + * ptimer_init - Allocate and return a new ptimer
> + * @callback: function to call on ptimer expiry
> + * @callback_data: opaque pointer passed to @callback

Comment mismatch with...

> +ptimer_state *ptimer_init(ptimer_cb callback,
> +                          void *callback_opaque,

the declaration and all the uses.  Either name works for me.


r~
