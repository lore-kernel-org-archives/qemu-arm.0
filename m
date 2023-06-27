Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1407682ejx;
        Tue, 27 Jun 2023 05:43:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7gyF6rrFAqCn7t9N5g6q+cC45jdggosn+cQ91L9L3VqoEl74b+s97RaLV2z3kOSh4dwn5R
X-Received: by 2002:a05:6214:2265:b0:635:4113:bb07 with SMTP id gs5-20020a056214226500b006354113bb07mr11478438qvb.16.1687869817825;
        Tue, 27 Jun 2023 05:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687869817; cv=none;
        d=google.com; s=arc-20160816;
        b=u30GMPyMh06L6qDj1/9geXIvLJcp8XKmx1GleR3tD18u09cR0yUcf7H/5C4tLRBcxF
         ZrK1Z90fHAZw0zKKuJGrGdG0GkVbsHQqAdugTVwx0q+C2I3Vvf4nml289yUIuxH7cEn4
         XaIveRsQ6pDhJw2VGwn+O5VHBVqMRtAYHImeMM0iguZrfwqpkhZqo6qrmoph/TkqTb00
         kB85my4FQzb16f/Pdgi9MCArf5o5YS1V3YIeemENp0vlTG/473RdXJz17p9SZylljRzF
         XlkQBmekD5M7aSu/5xIazNL6p3ZcFlbnPVZV2nxC+tTevoEIjwGY+gI0aXXodowN3nDr
         qzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1mTG0cvKU+zMeoqHlEai9X0XN4bdRY0Fj+S2ZVFglsw=;
        fh=TZ3SxzYDRdeSHrUGYCqpR0aWpnEmk0xJVMOqphAVtnQ=;
        b=r6fuhz7Ym3rvQuDEwVdWfZ+7tfzKEiCr965oaF4lV7U7tHTILs9XUEABfo6SspBWTA
         2iWC6Qusqh7C3XavfyTL8a3EVgGptTsdTQXZa6kqq7n5KnR9Ho+rVt4ivcFi8Yt0IOn1
         QbveX6pz4qrrGGIdGiwP2PXMk5MBc6uAWYfwgNiKi3vfB3IdqToU4hPNP0TLvdosN54s
         r6hYSeu5w7BT/kg8uRORoKMXiMTgkE9Jqz2xG93ezuTf7fQnwY9e2YkNohCIMEpt6hr9
         R8tQNZ2P+moauEkAF5snxdJRuXyAdx6ErhCmav/NIb3IbMjJYizB8XFaolHIlKpT4CpR
         7ILA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JGscvSjG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn16-20020a056214131000b006261e6b4780si3200901qvb.197.2023.06.27.05.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 05:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JGscvSjG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qE82h-0006kL-0G; Tue, 27 Jun 2023 08:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE82f-0006fq-MI
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 08:43:33 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qE82d-0001Zn-Db
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 08:43:33 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98de21518fbso442098866b.0
 for <qemu-arm@nongnu.org>; Tue, 27 Jun 2023 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687869809; x=1690461809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1mTG0cvKU+zMeoqHlEai9X0XN4bdRY0Fj+S2ZVFglsw=;
 b=JGscvSjGoIt5zVRLMj+z4pQB3/0FtPmXup22DqGc0zhhp0riN4aIMg20E/BBLW2E98
 WdgKEMXAsf/vjSlW+0rzfMzh92/bntJIhsUWrs+pYQ2RCqNBJn7CruxkEX4Num2CPpjq
 Cu1VAziumpAykPKlGGwPoVrLybX8oEiiXC+oMQ6cOOpJ6MspwTxN5xTynf2HfJc/4PuS
 agFOT6HJF3FjtKyGBOUzZ4+wnAxZAWbCIkMijKhC8/MTL7fmrPW4o1umQGjvwNPZj3qk
 Dv8C/gAh/xvAnE5RsFwiY2mA4XOXlcUBSuvjWJC3jAaqrWkQFNjoTjLU6ISTyg2Xge7U
 FZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687869809; x=1690461809;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1mTG0cvKU+zMeoqHlEai9X0XN4bdRY0Fj+S2ZVFglsw=;
 b=F0r5uAlHgnTQOK0hxpq+FvU2MKs8HXJiSGfM7q2agJlBNiE7Of/5ThzknFcCSPMReF
 wy/qqBkA+82Ky/x6m+P75dudulMIrfSXTW/+1Fc0MqmY6pBOH4mVfYJ9sHg7+gUvK1Nr
 HaS37Y86ipr+1qMZgGUB+K0VnO0tkVeisGz1FA9akkHvXIZJWunAmcuEeOkqHD778taI
 6wN6rRj2hLxY8+E+fMTlna3HyQE0J8WQ7+Hd3TzRQIv6M4JwIeyGc0PQSeNU2HWTVx2a
 K7UCb/eR80jKPXb6HdY9axLNdbGk/qhYHdmZgv1tB5/iHXQbjkce0nGWk+OM7pkk/hp4
 GdJA==
X-Gm-Message-State: AC+VfDzYlUbT63oPo+WU4j0QTzglMl9UokqbxMeYGNaUlYTXuYrcn2mX
 PtmO9SSr+UasECSHaE8ObY5NOg==
X-Received: by 2002:a17:907:a42c:b0:991:bf04:204f with SMTP id
 sg44-20020a170907a42c00b00991bf04204fmr5098434ejc.60.1687869809706; 
 Tue, 27 Jun 2023 05:43:29 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.204])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a1709061c1300b0098dd3981be9sm4477872ejg.224.2023.06.27.05.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 05:43:29 -0700 (PDT)
Message-ID: <7b6c659f-a9d3-c883-ff53-3226c8d31bb8@linaro.org>
Date: Tue, 27 Jun 2023 14:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 16/16] accel: Rename HVF 'struct hvf_vcpu_state' ->
 AccelCPUState
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, xen-devel@lists.xenproject.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paul Durrant <paul@xen.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230624174121.11508-1-philmd@linaro.org>
 <20230624174121.11508-17-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230624174121.11508-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VYw8lf4KGKDj

On 24/6/23 19:41, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState.
> 
> Rename the 'hvf_vcpu_state' structure as 'AccelCPUState'.
> 
> Use the generic 'accel' field of CPUState instead of 'hvf'.
> 
> Replace g_malloc0() by g_new0() for readability.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Not even built on x86!

Per IRC chat:
Tested-by: Peter Maydell <peter.maydell@linaro.org>

> ---
>   include/hw/core/cpu.h       |   4 -
>   include/sysemu/hvf_int.h    |   2 +-
>   target/i386/hvf/vmx.h       |  22 ++--
>   accel/hvf/hvf-accel-ops.c   |  18 ++--
>   target/arm/hvf/hvf.c        | 108 +++++++++----------
>   target/i386/hvf/hvf.c       | 104 +++++++++---------
>   target/i386/hvf/x86.c       |  28 ++---
>   target/i386/hvf/x86_descr.c |  26 ++---
>   target/i386/hvf/x86_emu.c   |  62 +++++------
>   target/i386/hvf/x86_mmu.c   |   4 +-
>   target/i386/hvf/x86_task.c  |  10 +-
>   target/i386/hvf/x86hvf.c    | 208 ++++++++++++++++++------------------
>   12 files changed, 296 insertions(+), 300 deletions(-)

