Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3537385ejm;
        Tue, 25 Apr 2023 07:30:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350YBPnX0bu3O6M5rrbCmIjGb917JLe8l+P3Kx69FvLrsKBh0iLJSj7o6iyEX1cnrFVTgfG8Y
X-Received: by 2002:ac8:5f0d:0:b0:3ef:2fbd:90c3 with SMTP id x13-20020ac85f0d000000b003ef2fbd90c3mr27458440qta.37.1682433021160;
        Tue, 25 Apr 2023 07:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682433021; cv=none;
        d=google.com; s=arc-20160816;
        b=YVGQHttLuweHv+EMiPtFCfKzkNEgwrXC5T8fA7jLPdPhuSb1IDRXXetPIAstKSfqek
         1Eb+z0BA1VDs3cu9wkiKVDxS2AxlW4sIsM3l7VH4D0gEYH1D6EVepJL1ivsfuCQx2EPk
         9/R6Km8LxfpO9dBj5qR2jgJ6AttAjvUzggxY0NikGanDG/h9Xj5kX0tHJ7n/BBMG5/yB
         sVdvnzlCoP43BitcnOq+RcN+bAPLuTWNh4HgxheIVDlcbcgRnwJaNsiv5y7DMd4ZGHSt
         6AsKnzzXqSJxBI+1aUHW4IkCgCtsjZiWe0u/pnwhLtJatXJWMHpMtRPyfbiO63FI7tqP
         D3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0UtSaUy6kTDPjr1M9TPR7k2zZAyqnW0ug7C0qLM//1s=;
        b=nPeAMfkCpUZIg08gh+B/94N9OcHZfR/5yQoOLr/f6Ssu7b2tHCwYrq0P7PS80fNCeK
         rT7AnT1ZKFNVJw7MxBPDzJ9CWc1Vze2rDGnzo++ZyFzhjNo3GY2us0rfL8shEjjYnGGs
         wGnKO4ecztFsmZUxcFcmDyH0x+Vz7RbJDK3B0/YK0m/SD+3OM0Ys4GMKctlr2nUmw8rG
         w6oMr1NsevM8zPFB2K5ysfWBfWH647ORAliX6EKnXEvgkLkfV2XU0HbtFD41qwJ/K9Jp
         OthqUTJNOnsXFTHBe0eCZdV+6xShS5zHT6GEcfYpOAHBzhUjmy5AjE77PC+kUhRzA03m
         PQdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtvgX+dQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a05622a008600b003e4f067e6c0si8763857qtw.729.2023.04.25.07.30.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 07:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZtvgX+dQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prJfe-0006DY-1G; Tue, 25 Apr 2023 10:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJfc-0006CV-07
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 10:29:28 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJfZ-0005fK-DP
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 10:29:27 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so117239165e9.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682432964; x=1685024964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0UtSaUy6kTDPjr1M9TPR7k2zZAyqnW0ug7C0qLM//1s=;
 b=ZtvgX+dQs/wb6dg2HokD+hzkiXRD/TsRQgDaqaNkVWBlma4qR5uJqgp3Z6V69notbN
 EmAwkrkWyctQmHi58pZaCO7rzKUbYvQkL0nbGngMbvwG8k86SWt3bYPWKfQmU2KrxHvy
 wft063eu5TUonm+o8sqLptRONzJQCmn/wUopghvqBaXvzhwidOXk0E5EUyJmgoTepewX
 lkATyahea72RHXt9JvoGZSxRa8qaQM54AQoHnYpd60yqmR7gNFMkJrHb3NmJ2Scf4Fl4
 7V3sHQGLruzH1RTuZwlhWxCobws25jC3VirzuS+Vudt77+b3JTZwktI05A8jf5n2S21l
 AKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682432964; x=1685024964;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UtSaUy6kTDPjr1M9TPR7k2zZAyqnW0ug7C0qLM//1s=;
 b=d+ENFhq/unCzjxYb07abc2Lmwd7wFVpyMvbZzK6OQLlzrREXPsWfGrBOkzZaxkRGHQ
 PGaPPYTDlSrrD/XRgNQWKkSeyg17hblNFW/BlB4hG/jtLANmS+P3RXYgwe4ZAGw5hKlc
 3dMz2PIdGTcOC0V85ysH9/nzbqY8LgqR2KGknkj0bESnbN9pC2sczYr8pNiB0RXMzCWW
 iYTjovOwEfz7gPHndneibNVlytCJBepKBx0oNabDAAT328E1/J2lGIAD3Q3jeUmrmQNX
 HIJs+Pg4aUKG9xxeRginBWYWa63HWh9pPw0Yu9/AkQpIH3ipZ3GipliVJXLX4rAidh1X
 W03w==
X-Gm-Message-State: AAQBX9ew5IfiSByak15hyjAzuGs15r6oBVprAhukUWx9l10fWHio7fHV
 sF5mkiM+ZWtVFyYXEFFZ5PeiIg==
X-Received: by 2002:a7b:c441:0:b0:3f1:7364:9308 with SMTP id
 l1-20020a7bc441000000b003f173649308mr10133897wmi.2.1682432963766; 
 Tue, 25 Apr 2023 07:29:23 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b003ed2c0a0f37sm15100854wmj.35.2023.04.25.07.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 07:29:23 -0700 (PDT)
Message-ID: <d4b68163-39a6-bcca-a5d2-196f8a0cb534@linaro.org>
Date: Tue, 25 Apr 2023 15:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 19/57] tcg/loongarch64: Introduce HostAddress
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MzhybRVnHyFd

On 24/4/23 07:40, Richard Henderson wrote:
> Collect the 2 parts of the host address into a struct.
> Reorg tcg_out_qemu_{ld,st}_direct to use it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 55 +++++++++++++++++---------------
>   1 file changed, 30 insertions(+), 25 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

