Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1306572njk;
        Fri, 29 Nov 2024 22:13:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXiylBEQoHh5xOJve2RldtPXtF0JybGlafrZqR+RNa6J2Bbv6DZOQnEgWRi8v5DKj3+mq219k4i8hWGNw==@linaro.org
X-Google-Smtp-Source: AGHT+IFHXfvSEM/QA73yJsaB2d/09p4yi1bhcGmbpCkIVBlFUJlWodcu5qSH2THzzeHw3Fv+5qpo
X-Received: by 2002:a05:6214:2248:b0:6cc:567:d595 with SMTP id 6a1803df08f44-6d864d06ee6mr214524176d6.7.1732947225170;
        Fri, 29 Nov 2024 22:13:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732947225; cv=none;
        d=google.com; s=arc-20240605;
        b=Zk1CaMwTWYNAXHIm+MSzTL+fylYyAGP93p1y8qwc4krLR+Z5qUnD1+n7fY1RV4qaSV
         PUM3UB0o6Y0efxvpB86UjTxN8uB/1A50M/WoLbSarNOUp3j0T5WPbcvp7J6RtQ4JqRGA
         Vca5OJnoHhHmy+3RI/hzkPVUn6wg0pO9WgnNfOsFxN3J9U6+paIO6nAcLcZuuh4zlz8M
         TSkNzV4i6dS/wHnQy9s8SQvWPu3toY52h9i3VmIOqhtJtRAiFk8SzxmxJXr6iOkdBxvn
         HMAgqz+ttBApq3KHqPIUz6fb2LDhm3/641ZvbTzP6ODwrNkgxCCebAPoNqZqHQy1Inty
         Iweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xStmvMus9MgEzCXx/nEWzr58YQNuNR1BqlwJ+N/QWGA=;
        fh=U/NRvMUfCVCht3+O59Kxx+648jDDR+PndHGUXgCXG2A=;
        b=SmcBHBnc9mdaj+a9VA/0tOK0k6TN0trl6UBTrV0bhy++560KzkLUHbEYvKzYgF+kiY
         xPFdm1VsW8T+wOtc2qhV0igB+IxIhEWLglS/5HS7MRhxiKvmv2oAMWu6sVdRbBSitQAx
         nL5KyCaCXjfpJ2FJfF7hAqGeyAC9+6J/3+fgSzf52zXNNAek8qez10W87dhZ8lbg/PjA
         KA28mrj65EITOIi1HmYGje6yb3bLT8pCRfqLMdcjhAjpckFuQ/Py8pW9mKJZVohztgpN
         i/rCIib/b+qUS9vB+wQkGKrDzZnK+rC1spjTlfEX6HRt8AVWIZszQmxSLRDg6KOVpvLG
         XDDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=cqKWrzlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8963c1242si3294536d6.448.2024.11.29.22.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:13:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=cqKWrzlA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHGjS-0003GU-5p; Sat, 30 Nov 2024 01:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGjR-0003Fg-HK
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:13:29 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGjO-0001y8-B7
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:13:28 -0500
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-7fc88476a02so2186608a12.2
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 22:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947205; x=1733552005;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xStmvMus9MgEzCXx/nEWzr58YQNuNR1BqlwJ+N/QWGA=;
 b=cqKWrzlAgpV6EJStXsW61pKod+mcG+rXeYWcmvox0vk949FqKvqOv4wvTKKz8ZoAfX
 FgUW8HNMXB6FoHanhDVpbcv1jJdU5uydJgf2NS0GqxhbiZLmXfbG25hNUwrd0og8WYAs
 N6haPgYgrCeAtxSQ0wMCUsJgxH6Qp+ztZ+wrlmkDWjPXA3W0I6XbmZnAYQq6AEMSyAaP
 oWPC6J0qqDQri6//0Egv6jswEXD2LXxlvQQ0xdUg1c/nrgJZQAtQNPpSkeZaHJmil69P
 ElZXr17qFXKk7mN+LiROESs6WYsqMRKNxLxQx27by/CjSteJCnTxzsSuHh2kf0QgxS98
 3TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947205; x=1733552005;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xStmvMus9MgEzCXx/nEWzr58YQNuNR1BqlwJ+N/QWGA=;
 b=LWGbw5NHGp2XV2ysP6/RZ9Mih96ncLuFsiwl2LPbBwRJPWED2nKHZ6co9/rERFTU+l
 HduGdG2FwNF4ts0wEJGOfeFf+9DCvNuKB4+jVUZWsE4B/M+zNnPq439npJGPrx7B6Aar
 OkqW1JjByLybuCTMoLenNnIzHeU9JMPZEgpMyusHHSQ0fNCSFHjThiCXgGVVr2oEl5h+
 mUa19cJ1S/5GLCcQda7Si1wwGCa5cUJuJWJK+f9BRndCI+FscTiJPq/HsBY5DzokFHkG
 U/j1mpwxr5FRM6+3Sml1Q38tebS5BKQyF86bNkfLqSt2cADEsVQO1WAEQFOpIH5TK1mI
 zF1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIKg5mlxpBVo//0jCaSA/SGZST+shvRXbXm/g/siwsoD0gOTdkt1wVqKX9f/URzUJqzoyuXkOEZw==@nongnu.org
X-Gm-Message-State: AOJu0YybEM1actHA4KeAbrkowNvoGJwhW+5v2Wym7+K62kDYQnJTeXKL
 QhmyFBgWMEVQ8TR+MhRtTL05KHMoBKXBRSxCxyHeZRXXc+p0gzlXxiSlDFCYT54=
X-Gm-Gg: ASbGncvJoIdNP+2NqbrXJCcChM32SQzoIwR19D3rAWkqbdIvvlkPro3XsBSiPC4c4ir
 iVeryO2KG5p0t3CG/k/8+KV8k3jcgGJi50Z9MHo7vENqPZkHmvjTTTX82ekYsM0mUmPc4k/R74t
 sQ/iBVGfVXFbsTisCbooWhswXhEjT6coTNGwzxVgJ1vReOvjPQYko/CN9HYBGiO3Yhrw4PDBVJ9
 qB3rDFYZv1tcYB0/47ZUZzYG9/JzB2aD7ht7rpCze0buIUunnevGpptTxPkJIM=
X-Received: by 2002:a05:6a21:789b:b0:1db:f68a:d943 with SMTP id
 adf61e73a8af0-1e0e0ac3600mr19037693637.17.1732947204635; 
 Fri, 29 Nov 2024 22:13:24 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7254176f4c4sm4620630b3a.60.2024.11.29.22.13.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:13:24 -0800 (PST)
Message-ID: <8b8907e8-cc08-4dd5-991c-496637d39b61@daynix.com>
Date: Sat, 30 Nov 2024 15:13:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/15] hw/display/apple-gfx: Introduce
 ParavirtualizedGraphics.Framework support
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-3-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-3-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4/csEHDhTOAt

On 2024/11/30 0:24, Phil Dennis-Jordan wrote:
> MacOS provides a framework (library) that allows any vmm to implement a
> paravirtualized 3d graphics passthrough to the host metal stack called
> ParavirtualizedGraphics.Framework (PVG). The library abstracts away
> almost every aspect of the paravirtualized device model and only provides
> and receives callbacks on MMIO access as well as to share memory address
> space between the VM and PVG.
> 
> This patch implements a QEMU device that drives PVG for the VMApple
> variant of it.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Co-authored-by: Alexander Graf <graf@amazon.com>
> 
> Subsequent changes:
> 
>   * Cherry-pick/rebase conflict fixes, API use updates.
>   * Moved from hw/vmapple/ (useful outside that machine type)
>   * Overhaul of threading model, many thread safety improvements.
>   * Asynchronous rendering.
>   * Memory and object lifetime fixes.
>   * Refactoring to split generic and (vmapple) MMIO variant specific
>     code.
> 
> Implementation wise, most of the complexity lies in the differing threading
> models of ParavirtualizedGraphics.framework, which uses libdispatch and
> internal locks, versus QEMU, which heavily uses the BQL, especially during
> memory-mapped device I/O. Great care has therefore been taken to prevent
> deadlocks by never calling into PVG methods while holding the BQL, and
> similarly never acquiring the BQL in a callback from PVG. Different strategies
> have been used (libdispatch, blocking and non-blocking BHs, RCU, etc.)
> depending on the specific requirements at each framework entry and exit point.
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
