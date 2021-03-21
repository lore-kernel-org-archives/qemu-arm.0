Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2959892lfg;
        Sun, 21 Mar 2021 10:36:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyevZA9ppUiR3scYtqjHLUy0HYwhOHiBPSPMo/EsYobg4ainIPUvRNnj4at9tAs0Ro44J9U
X-Received: by 2002:a05:6638:ec7:: with SMTP id q7mr8329447jas.54.1616348181320;
        Sun, 21 Mar 2021 10:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616348181; cv=none;
        d=google.com; s=arc-20160816;
        b=W0OulBd8qggojV5YREzVowlOEwywr/ykTv2W6gsSifX+Lch1rcSo6g7b/QK1oojyMR
         90N2lfur0hLlunU0F9xPExu/d9pFDumEF28+NC8UyjKu3gVRfQGri4n6gx0gzK2eHuJJ
         0lsiERYYO+f8k8id3RInOrMePWMgZFgea9IbZWl+Az09gc7nlTpRJOucDjXChYz4wzg7
         Hpmfz1yvxwqLsuPS0SWcRVmueBy65mYv1fRAEKUa/fmYaD8UNxzhtAaWUZfR3qpxO9+R
         q1j/rHwRP2/c15e94Fu3yLHJ6Y7afVyyV0ozr96epLnREkO24EFxB53qKEiXuzwmrEsn
         gKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VfJL4/Z7HnXfUS9+T5UP4fnBcPNwiD0rqWKK0TaHETM=;
        b=wkHG1O++j/Ata2Cy9sJsO6RhavkNPZX4VpsRXxxVFwC1m92990XkOOrjcOJNs10/ok
         DFprBak0gOAD6i39SXnKCIi70vJViFfP8cQyfmtCFy+HCIBg5ZAjxqUQqB7OrTVXf0Vw
         JMur0V2fY9qTMTzo63zf56KBI5qg4jqDOuTOFndMuEdR14dw5cZaHhhr4qJ90XsUyW6O
         BluWhzGEVf2gUmQm9vr90QfXtkwy2tlV1hN5tojskzFHEOEyNW5uoHbHxnMZz45Jl3wi
         CAxN7oX0MzrRRqNetbKEb0wWMOJ0Xer1ZPtrq/x5dNzU6Nf4vRqSupwFpPzSsv3lpOlU
         rBuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="rltJX/tJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si7901650ilb.141.2021.03.21.10.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Mar 2021 10:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="rltJX/tJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lO1zw-0001Jj-JX
	for alex.bennee@linaro.org; Sun, 21 Mar 2021 13:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO1yF-0000ro-KJ
 for qemu-arm@nongnu.org; Sun, 21 Mar 2021 13:34:35 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:36679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO1yC-00053O-6d
 for qemu-arm@nongnu.org; Sun, 21 Mar 2021 13:34:35 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id x16so7608341qvk.3
 for <qemu-arm@nongnu.org>; Sun, 21 Mar 2021 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VfJL4/Z7HnXfUS9+T5UP4fnBcPNwiD0rqWKK0TaHETM=;
 b=rltJX/tJPb0CM/19giJbxgLx4l5tyi9L5+RvA6jQEGHZFN2Ix78iWwUeVu4x9ehyjw
 3ntqS72TKhXkLJWXOw25gdW8Y0N3biHa4wnCWrpYe2xSuvcLr9cyENogKwB5TzQD/Nna
 3fN2dQvhlpfAtU8+I7/cP0+uffBWkhfLbtqYYSHQb/XTa6l7EZjcliANVL/WVvn4aHS9
 5PGuV6/lMO7VkDJ8J3NZMQUw/G6EJ+N/MQDZ3tDrGkgivmVqiwsHva8xCUIjwUnOu1Fs
 ABOJVxwGAg8aKAGRzoI2rxrD3FmRdbC8n0dcKLioj3i3Xq0U8WqSlKYgwXrk3O5SxNDl
 4h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VfJL4/Z7HnXfUS9+T5UP4fnBcPNwiD0rqWKK0TaHETM=;
 b=qqF7RCzPFhzXUZR8E7LX1m6THV9sROlIRlvroz5NSBo3LejkMTJaegNEtTcHT4xOkW
 UhI671poyIn6Xkeg4ACVjFItiPOnJlIyGIoUJVDw+18QD349rFbucoWCLhwu0g3oqa0n
 ThxuTZ5QzJB/mLWYsv3x8AjrVWzfN/pzi/326QsBwo1UkJ4r2/WdSGSEoPK+jTUTdwQ2
 56DgXPiN9Vw19l7AuhQAhmUzBHuc1TdjMpcKhFctkOsvanhTG2gzHSLK+lRYl6p0Ez4I
 T+pzBvPof6qPcu9vTefEJtcatDusS6Sgb2T8OKcaK+U+xaXygf3u6hB98JWc4neEsv2H
 E6Mw==
X-Gm-Message-State: AOAM532V0z9YKjZBKUHHj4m9llfJ85uLYx4xAP9Vy3+KONs7jXFnO+OK
 FbkmlhqqfzghZnznamy0Mz/yJg==
X-Received: by 2002:ad4:5ce7:: with SMTP id iv7mr17667892qvb.7.1616348070155; 
 Sun, 21 Mar 2021 10:34:30 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm9005696qke.53.2021.03.21.10.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 10:34:29 -0700 (PDT)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
 <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
 <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fefde0c1-5670-7cd5-4f7c-ab11af6aeb62@linaro.org>
Date: Sun, 21 Mar 2021 11:34:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aldy Hernandez <aldyh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gavin Shan <gshan@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NYcrdRdnekZR

On 3/21/21 10:50 AM, Paolo Bonzini wrote:
>     Another workaround may be to avoid compiling exec-vary.c with -flto.  I'm not
>     sure that my meson fu is up to that.  Paolo?
> 
> You would have to define a static library.

Ok.  With an extra -fno-lto flag, or can I somehow remove -flto from the 
library's cflags?  Or unset the meson b_lto variable?

>     I have filed a gcc bug report:
> 
>     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
>     <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696>
> 
>     Hopefully someone can address that before gcc 11 gets released.  At which
>     point we need do nothing in qemu.  Aldy?
> 
> 
> Good point, I can give it a shot too just to see how rusty I am... That would 
> be the best outcome, though we would have to check LLVM as well. If const 
> doesn't work it would indeed be prudent to include Gavin's configure check.

So, I've reproduced the testcase failure with gcc 9.3 (ubuntu 20.04) as well. 
Which means that there are at least two releases for which this has not worked.

I think Gavin's runtime test is unnecessary.  We don't have to check the 
runtime results, we can just [ "$lto" = true ], and we fairly well know it'll fail.


r~
