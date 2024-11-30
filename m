Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1307211njk;
        Fri, 29 Nov 2024 22:15:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWE5CKAe0O6rHOa3LqSRq/EMukjKsfTF8Ww/bJdMooAnhvZonjtI4xckp7/bUPUhsnDSSgHlNNGNRdw4w==@linaro.org
X-Google-Smtp-Source: AGHT+IHmxU8HX96f9hoS5QOkKbdnr0CMq+hNTwU3O8mTirpX2xfcGjQoct2TQv7pdye4bLoKILZm
X-Received: by 2002:a05:6214:130e:b0:6d4:33ef:588e with SMTP id 6a1803df08f44-6d864dca39amr183807746d6.31.1732947326194;
        Fri, 29 Nov 2024 22:15:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732947326; cv=none;
        d=google.com; s=arc-20240605;
        b=j1lvQFk4RKTUbDqGlpE8vehemPp0E/82nMpVbkG/OPZrygE3Y93KUuCDp0EFzp27i5
         ojOYjB4e5jpmIb0XZdLAZLRh9LSUdWs1Zd87E/yKCJ0NkcK0JDWOzlkgBpOBum5O8FHR
         OPFTWoS3fL1+b8sXhF/gbWLHbW+q9tLdr5htU0cpHBrkRG/grsTnnShrT1honmEF7Pqh
         IE6asrQIzXnj8gCw/Hoi8B7AUiQe/yvkdi86gh9lnhWsh27jiZn1UsS4I+zfdgIM24aL
         irrjei+0RuR77hKOEFt2QvJ8JlaaAqwwmGEiXDm3/2Dz3g2HeS1lPQHRfw2nUUnkT7CX
         W2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6v8c+4n8PNASpPmO24mcFTCtnVQLOXWkdrZBdPE8Ne0=;
        fh=7CViPd/H73lYyKdPakg+U/xrjHldSNb/E8jyVdZPHXc=;
        b=PN/B31OjYNaND53pM1Mv29505WbM/AMxisAZjJGVppZuj/VAZPp4pEvcw+bglfZLUm
         CWWxXoVbUir4vcABscuTtqqNuvYQ75/aZmEIZWduUNXxgNpqjOL323AKivcaU/ct00NT
         yIB01pyZGcsKJ7qcVo7mIVaOhGXfffYD6Upy//NRJEqWlAlvPmRnsELkiqPB4FdVBqOD
         0GKkJpBx3WmoKyGpi+sN5MBUmknr3zItUUmjPnGTdawMUNhK+mgw0Pc/oFYGl+hUJM82
         RK95WuYbrWWqRzmIZ/FVlV0Ckg6AQrR6WX0kXEzvs/TZTIDzNjtOgEmbeoLy5C5pYYQH
         hG3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zSNt7BRc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8929e3ab1si8565016d6.159.2024.11.29.22.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:15:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zSNt7BRc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHGl6-0005f3-Mp; Sat, 30 Nov 2024 01:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGl0-0005NV-RX
 for qemu-devel@nongnu.org; Sat, 30 Nov 2024 01:15:08 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGkz-0002PJ-3a
 for qemu-devel@nongnu.org; Sat, 30 Nov 2024 01:15:06 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7250844b0ecso2165011b3a.1
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2024 22:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947303; x=1733552103;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6v8c+4n8PNASpPmO24mcFTCtnVQLOXWkdrZBdPE8Ne0=;
 b=zSNt7BRcvNLiWe/OT0QLOHu6mzu3YD2F1paIYjYo1Tuvu/YVHEOB/T7IQ+CxZb4kyp
 iBjw8wnhMAM7/jsPLMTaqjqj0QWrbvB5Se9u05tuWbP2txP198/Gmi5yc98DUOBwrbzj
 8383aD+C70Yts1Er3u61EZ8ytZ5u0IafBvRgMLmsDGFmJsS5NWXzUCct1bVkT5Dz5+dY
 Mh/l3cnytmQ5m+TUeSB2yqakp31+i1lqxEDTqAVNhDqGZnG1+Q1njAY9kmkjjMDxyHLB
 yts8fKrJvP+yJI8yJKIUOEGAxBIHc6TVBhe33sMaomk4YyvPLXQHL0ZNhq4O/+kOyGmg
 9kRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947303; x=1733552103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6v8c+4n8PNASpPmO24mcFTCtnVQLOXWkdrZBdPE8Ne0=;
 b=dy+nCLqyBCYk/CGQMEI7ZFbzNZ6SqsvYKmB85UU+n6HKYe5NRYG3UbtmaeFXByzH2G
 ZB52r/hjE0XxBKEe8d91qHuu3YXkP8Gupw9GvbSUfPZEOcf4rPUwMXt6/IgAVcAf7bhD
 P8Tl3oLm9OCjO6QRCC8qwh7KBLbRwUy8uT08JkY2TTMCyXnqyf2HaWzP/c2Gl9IjpNPD
 A+dnHOYjlexl0/nqp445ijdc4uaujKhDH0b2012bjBsBBmX2a4WjJEr5l2z01cxDH+5Y
 O5+H8UDCnD79SR8eStFFdW6mnURLFLxhQrMH1Q+krtJtkr2aYRv31rPlChafV4FE5g3j
 XeLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo1F8bLaQdKfOG3IJ3FJybGeSFRnGXs6iDO9+CTVpotQezkGxnhgDTI5UyW7dRCHrVY4bahdC7blKD@nongnu.org
X-Gm-Message-State: AOJu0YxNIfvFD2cAXqs6BK88d9Ga0AqDfn7qOieoONaLKerIkaKIoYyr
 qhwG+UfjKxKfAa96aFrbG3/xaiUnBI7zVKIhKqgmXbZS3lU7RKYwAVd5UFhtuO8=
X-Gm-Gg: ASbGncv1AnLgKtQm32+r+4eMhjVDWEhJOEfl7cwOxrT3rS/5oDcbdTG5IMzuxSWMw6g
 PX7X/fWCYcrZ6RbKYN4RWQtMwFm8hgjiJ/0ExVfRkF3E8PKtxExdWqtNB5I70taJhM71LxBfNnB
 z6pePFO578SiOP7rdUgIg/nVYEW4A8/fFA9NFFjkZzSAht0XDI2DtwerC64ygpRSmxlS6KtSvbq
 T1cWpRobFKDg7iMWaZUp2pO40RJ1FTH9VXxOR6LRv1donshmn8fL1Pi72Hz3zY=
X-Received: by 2002:a05:6a00:23cc:b0:724:e582:1a06 with SMTP id
 d2e1a72fcca58-7253003ea94mr18622709b3a.9.1732947303281; 
 Fri, 29 Nov 2024 22:15:03 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72541847925sm4461764b3a.176.2024.11.29.22.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:15:02 -0800 (PST)
Message-ID: <260151ca-34b9-497e-be7b-35af781a5aab@daynix.com>
Date: Sat, 30 Nov 2024 15:14:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 07/15] hw/misc/pvpanic: Add MMIO interface
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
 <20241129152506.59390-8-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-8-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 34SPPVlYQQlo

On 2024/11/30 0:24, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> In addition to the ISA and PCI variants of pvpanic, let's add an MMIO
> platform device that we can use in embedded arm environments.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
