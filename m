Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp258816lfb;
        Wed, 8 Sep 2021 02:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu/CTnPVAYEX9xDeh2VByb3AYfWXmuQX0MaqdQ5+wVuE6uf2RbmbxC3pGuigSnNhlbFAtH
X-Received: by 2002:a25:bb93:: with SMTP id y19mr3812963ybg.266.1631092785257;
        Wed, 08 Sep 2021 02:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631092785; cv=none;
        d=google.com; s=arc-20160816;
        b=BPc5KBwI3Oure5U3n93D8J7VyZ//uDmr3uvtYDumQqduV+ndysrn6hA90vIXV9iUXo
         VFOiUS50Ul2jb8GkNZcUc+efvZrFTo5L1Z/2V+mMP3gHmJQ42Z/ycHBBvVO7ma2n4VZ0
         ugCpVNrkswEs83M46AWU4K9Olb/SCjGqJDoX7Tm8NLI4tEiDvmkM/nH+HGQW+wVVjrDF
         lmYfqm0AXp9qSQfWK4Hu2aNWVSnTIRRJDjVL/T/O1R0BDE+Okp89bP+qQ3K+p1RLXKT7
         aWI9IAMQ1+elv/mS604t6t82NnL3Fxx3JkTqFeB9anTQD6iGlDHDDBc9H/Ql0ImIXr6c
         5iWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zfkAKvckiHUBOnhbwSX7IQ1MbXNPzUdNaVKWFOa6Tu4=;
        b=P/JwYB+KtEXHEzYv2MWAkMYNfx9LAsY9Mpbp6YvM5mlloFma/BE9Qpiy/PLIONwFz/
         jNAYMgwS63+XL/TkJ680EW4oU9cmqEVHW+ov10X/Va2c7ER2HGhKh8wzaJn/p3aMI0fc
         RNuAbMpH4h7cjGhjF0brq+XVMICwDPCN++EnBLe6BojhjWXqoBdI2JangWz8qiqHpsq9
         oCCjSVS7FfWcuc1KkBt1cDfDXnr1rW1J7X+nz1a6JSnCPqQ3giRzTVIXHnrK/NzB95eK
         QpgGVp3XfAM7voMqdohDVuubbyAqgUsPcGmzTw0qzKBBP2id5N2mUAFaNku8mGMfeaU4
         Q8xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TCdr/EAL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si1798835ybm.290.2021.09.08.02.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Sep 2021 02:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TCdr/EAL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNtk8-0000il-Kv
	for alex.bennee@linaro.org; Wed, 08 Sep 2021 05:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNtjj-0000fa-Sv
 for qemu-arm@nongnu.org; Wed, 08 Sep 2021 05:19:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNtjh-0006UD-Ir
 for qemu-arm@nongnu.org; Wed, 08 Sep 2021 05:19:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u9so2192713wrg.8
 for <qemu-arm@nongnu.org>; Wed, 08 Sep 2021 02:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zfkAKvckiHUBOnhbwSX7IQ1MbXNPzUdNaVKWFOa6Tu4=;
 b=TCdr/EALVfiBpf593ys2qhh5aTUx/y3TaGqIuaFKzU+zY1yNEGGx5vxMlSQCw/uYFN
 3T56O9oSnPPj9SZG/KqulpNfRdNOIDLESV2xbn1si4w0aU+EK8ppB9efGGgva+1TGMdi
 nySTNLz43UZzlBWAuWFn4VcolzLHLmB9vjWx6Gdf/wDUqK20ECumh5IFy/jLISFub90Q
 jmDzHyctXq5Yi9V/O3vMfYAJ0Huha+/VPKTFB0DPHnDWaR+w76kzJh+1F6VLN2SsTZia
 v9UWsZoYj73zLgMhKicspO4ea5tsZCOkUe+w2gBZ3uKQe9qRmTjXPBUSIyJ7DLIgrOEt
 bfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zfkAKvckiHUBOnhbwSX7IQ1MbXNPzUdNaVKWFOa6Tu4=;
 b=q/DxWdBtWHEjDhZeFTf77DgcH3Tb4GeGVG6pR9pzi5a8cuiqm/5HoVBFX4bMHYFadc
 d7fsMao82U8BY3GetFsXSVhP92bOxfiF/TqqJqrIsFqzi4O0ZecTyKmhO3uvMkkOqfCw
 Nar6s7mTBgkbYmjJufVdQY8W1ToZ6GLKG1zUIIwOOfRDAVBIFTA56JKTiny3rqgy4Ncw
 xvj94bqonEGflVwLRzPbwecvEld2Ev1ArfWSe71rZ0k5jrDd3GVqhgPw6QXAzRWxQYaw
 +6tWyHQiJyEaRJVgXbqw8ZIZvHddCoLWLZCSeRjaQlNx4+SlcTZJss1ZRyQGc9mt6IJ3
 T0nw==
X-Gm-Message-State: AOAM530WWzU3tG7fQS7RCqW5Z1Qf4jbfO26vTSfV66CY9DpuOQHs8n+U
 qzW4OUKIhkwXSVA4iAda3XAEwPzRzx3Ho5OfUQg=
X-Received: by 2002:adf:ea90:: with SMTP id s16mr2830731wrm.235.1631092755991; 
 Wed, 08 Sep 2021 02:19:15 -0700 (PDT)
Received: from [192.168.1.165] ([139.47.33.227])
 by smtp.gmail.com with ESMTPSA id a9sm1048157wru.27.2021.09.08.02.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 02:19:15 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] linux-user/arm: Report SIGBUS and SIGSEGV correctly
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-5-richard.henderson@linaro.org>
 <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83aac1b9-35a9-bcdb-c424-6852cbb25305@linaro.org>
Date: Wed, 8 Sep 2021 11:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QW1baOfjFViF

On 8/26/21 3:31 PM, Peter Maydell wrote:
> Side note: for cases like this where we can tell MAPERR from
> ACCERR based on info the exception handler passes to us, should
> we prefer that or the "check the page flags" approach that
> force_sigsegv_for_addr() takes ?  I feel like the former is
> nicer, because in a multithreaded program some other thread
> might have changed whether the page is mapped between our taking
> the fault and getting here. But maybe that's always racy...

Both ways are racy.

After having played with SIGBUS, what I believe should happen is that we clean up the 
signal handling such that we can pass through the host MAPERR/ACCERR, remapping any fault 
address, after filtering the write-protect case that we care about.

I'm not sure how much effort it would be to do that.  Certainly the test matrix is pretty 
darn large.  But perhaps it would simplify the huge SIGBUS patch set, and thus make it all 
worthwhile.


r~
