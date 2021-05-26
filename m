Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5016614lfm;
        Tue, 25 May 2021 19:13:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPxS6wWgSVI2k5wlAIPYj13qHhhX2xc2H/PeGNoJEa+DshQkP9hmYzsNVFKHCrstXsEDW2
X-Received: by 2002:a05:622a:183:: with SMTP id s3mr35540132qtw.115.1621995228106;
        Tue, 25 May 2021 19:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621995228; cv=none;
        d=google.com; s=arc-20160816;
        b=VxLWI/qzeRTqvKtNqljispMTtB1KahJ6++yalRqm4nZ/2Tg8WB3BakxRFXLN9+UnKo
         K+3J14WZwkE1IRV7BS3Uj09WXXsMgmdoyj+w9xZ05iyQtaBImD/QckqB3D4UrJx8zSoz
         lQHPnJ6zabPqh1zO8RcFPFfuksYOfw/dCryw5gh9YiOSrlsVfalZsUlRH9FuZzUMwWfc
         nUCY/HaugNTuqqd5hEh3SA1FGjv4ODJ45XFEsKMDMxrrUN33CrHpmr9SwEW0iXsnAcGe
         Osncj1/KWVjIMAUYK0BsosdHVBOZzoQKZ/pgIo+DgVWj5A7KVQgGNiDIiPjVw4lqFeAL
         e70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1ACUOCqdn17RVm5Hag3M2hwHGksegtAeTMD0aHzy6Io=;
        b=B8EbmokceGEtGvF3FR76kHsgQ386JO1fQgOKbWSmWKvnA6aIGRKk22JioxFaHrbgGg
         FcXZlGA5xlcsoYQ2z7aJZS471geSRLenHyGE+m9HO+G8UuRBR+c12baOtLhtU5GjVdnk
         PCu5dBuNMNtDHAiHYuZ4AhI8MD/oNHJo0QE53AXRwBmIXAWI/0d7HhkcDGieH5mxVApD
         85SrfQQAoClLpjknSz+ROAPRO7HhaMC+N16bZytVFGnGchOb0KAJ0DEY2+3LUUInsP9V
         e3vRgj0Z6v7YiGWj2t02ajSNUA8eDuSr7lXoLmRZXd9snNReuBxbFJUanDXwPqW4cHgF
         Fqzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qrQXyVyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bu1si773288qvb.209.2021.05.25.19.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 19:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qrQXyVyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llj3L-0001eO-F9
	for alex.bennee@linaro.org; Tue, 25 May 2021 22:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj2W-0001Bj-Oi
 for qemu-arm@nongnu.org; Tue, 25 May 2021 22:12:56 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj2T-0004UD-Fi
 for qemu-arm@nongnu.org; Tue, 25 May 2021 22:12:56 -0400
Received: by mail-pg1-x530.google.com with SMTP id v14so21569738pgi.6
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 19:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1ACUOCqdn17RVm5Hag3M2hwHGksegtAeTMD0aHzy6Io=;
 b=qrQXyVyq4QwWLodHiKbngIZmMttCwZNmfiYBNokad7jPpp5yeXzKqM0jzSotuYa7h/
 ELtet1bJq5C/4sUhZM9ppd+/xqW6nm3Xsl6cv4F0h02PUr4I8Ff5AD1fRfvAKM8NJDQG
 RyVLTWIR9iDNtNJ7NKi7RAEjsbhkw1GOSCKInULcU9HTFLe8Nd7MZ2EDtmYSKbJwBE4X
 kEIliKxUWZMuyi4qw7fuys4TzpliKdKC4D0hBuL427RvuVBiylC5Z+zMKA74GlTLEGTW
 4d7jFl/L4OI2EiZqEFVnyJaufrHuCihSzuy7ZbTjgTdzFVH3uTq40Eg99FMtgbKCpjdK
 Fp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ACUOCqdn17RVm5Hag3M2hwHGksegtAeTMD0aHzy6Io=;
 b=uTxsShHdJw1w5HFSAUSOrB13yjTPzu/E7onm68IF6AZ4k7JLENwUGnuHRPIBFVv9AP
 XNnzXzEEYTN3th9tr0K38cGXKbbDcu357zTMXcEqUqoE0WEvDy/howZOo+YinWpKe7+v
 LRnQ65O+bdfXr+iXa+qS/ttiMRhhfFzBFNcV1rTfU8VuCn5jN0GdVuJc7x6aj4KG7+/w
 glufUjobZW2Cu0smUb+sKg4xfipTc5CpuS/ACjlhoim/b8GV8IJHyUyWdBLltMj/HAmD
 XSHE0eHWsYlfQmF4my6mV2i4KSd2sMp7mCx5InCSn2CxHt+IozDUqswnejKML5PF+MNn
 YjcQ==
X-Gm-Message-State: AOAM5311a03KUe0tBG3RzR42Pos4KZiFSZaWBaP4htcivwds4hEjCgZJ
 P0cUVBANLQmWAl+B+IFNhRy63A==
X-Received: by 2002:a05:6a00:1a4f:b029:2e0:754b:88c2 with SMTP id
 h15-20020a056a001a4fb02902e0754b88c2mr33161712pfv.65.1621995172039; 
 Tue, 25 May 2021 19:12:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 13sm14779492pfz.91.2021.05.25.19.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:12:51 -0700 (PDT)
Subject: Re: [PATCH v7 02/23] cpu: Restrict target cpu_do_transaction_failed()
 handlers to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae262a9c-1ffa-b680-4aa6-d7256fa6947a@linaro.org>
Date: Tue, 25 May 2021 19:12:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SPpBLu5xnAeN

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
> In commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops")
> we restricted the do_transaction_failed() handler to the sysemu part
> of TCGCPUOps, but forgot to restrict the target specific declarations.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/internals.h |  2 ++
>   target/m68k/cpu.h      |  2 ++
>   target/riscv/cpu.h     | 10 +++++-----
>   target/xtensa/cpu.h    |  8 ++++----
>   4 files changed, 13 insertions(+), 9 deletions(-)

What do the extra ifdefs buy us? Surely the fact that the symbol is not present 
in the user-only, and would produce link errors if used, is sufficient?

r~
