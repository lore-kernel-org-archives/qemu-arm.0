Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp264543njf;
        Fri, 25 Oct 2024 22:22:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9gZP61DDOvn2ZRPtVvv7ljU4J2PJACltayCIC2VtLtpQ1OYS395U0Fagytr2/9IYuGQdJ85PJhSVk/w==@linaro.org
X-Google-Smtp-Source: AGHT+IEH4mBVJfEfp4dHuA9ZeYLZhNPoejJqO49etTTOHm0CSK6UWgC+ihHmsyCgn0FSEMBH7I55
X-Received: by 2002:a05:6214:458c:b0:6cb:f40c:b868 with SMTP id 6a1803df08f44-6d18584e1afmr27717956d6.46.1729920132218;
        Fri, 25 Oct 2024 22:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729920132; cv=none;
        d=google.com; s=arc-20240605;
        b=jgKcwUCLArRM0kqwM+Ju5RXAfHUwtdOyVQ/WP2FBCfG9TeNhFXu2+WeDCjcA8vTOyb
         9MGf+a//sqKVwF6vLYPu7T+ZQwIBTswPWYE3XROvROtFoFLnoe0hlf/su9bUUWyA08lz
         z68ShEdMgg3psCFHzzjZnjjS617mW1YKORddYnnFuJQiIFwV69FKvGcT1JMxOrusqxLi
         ZCOnw7RS+p/JAYSWFLE2+q2VO7sxFD/mlKo+Z3tA1lvLZ8oNiBVURFUyZ2VTONGaogRO
         hDDxPeI9pR6tsfkk4xVZ7h3m5RJU+mHthih46+VNtt7A1ACsNbz7H7LiN/tYV/hAU9TA
         tcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ww8Iskq/8oBghySyWBt6sP9pJZ15tL0TXiwn42A5mRg=;
        fh=Wv7aRbXMfmzlx3jJ7ctOrR55Ot/2O7zIoSM3jbi9YDw=;
        b=Dj0Tp1XoMWYPdfcUy+eQE03cjiTNoTVqTbYlrpxBmwTMPFg533CwsvEfeNPZfL/fmh
         nDRNVTepaPpk63EQT6onaOPYd+5uUvphV3bub0Whm5Bu6dAMkw8phJp/IMc6XY93suRD
         kVrF4SytH4bkdTx1gdNmX1HadALe5hIEyMFrhyF3dngIJXkdtQg5BU33kv86KFntr0Xw
         p78xxWRdGJf69vGRBXP/V6GtrC7y7yy/T4Mg7XpkRuh4jObiPv/mhhbXIYX9l+KEGIcY
         sd0YU8eF1T+zZ/7NjkAOM9gbPxjJ3T60J57PR/K5dJ7j4e+yHRpkymo7AkUEpfh1mbrQ
         +ROg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=HO9AkuaU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a121f8si33686866d6.258.2024.10.25.22.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2024 22:22:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=HO9AkuaU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t4ZFV-0000jS-Ka; Sat, 26 Oct 2024 01:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t4ZFT-0000is-Dd
 for qemu-arm@nongnu.org; Sat, 26 Oct 2024 01:22:03 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t4ZFR-00060l-Sh
 for qemu-arm@nongnu.org; Sat, 26 Oct 2024 01:22:03 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-7ed9f1bcb6bso1760158a12.1
 for <qemu-arm@nongnu.org>; Fri, 25 Oct 2024 22:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1729920120; x=1730524920;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ww8Iskq/8oBghySyWBt6sP9pJZ15tL0TXiwn42A5mRg=;
 b=HO9AkuaUNTrxpCFjydvztrleGZtcQ5zmzgg78GnvlH+tZ8Mq7tZL7wwgbePw2vQq3F
 AWw9TpXvr1Sqlm7uG/tYvAz2G+0HaH1Krz/bvXHS5Amh1na6j+0VgtuFAQIYMpdqmTG+
 rlTnVuxu2yvDawUZOTv6fR3SgdmReJ0IxInGDGxg6eEjnDpdY24E6nCqL+KpeqM+jOMQ
 cPb0ftS9ZsPO7ynZt+lyAA2A2w++C1DMIYdEdvNQ7z1+ezE93XwZvVCTXUeF03SlA6/x
 NKoYhN1eUnrbrZA8CQ7T0AKGI5c5iP9fLzSZ+vvyzYIQvVNh4zhgAtxLAlRjqNjLeiYe
 BFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729920120; x=1730524920;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ww8Iskq/8oBghySyWBt6sP9pJZ15tL0TXiwn42A5mRg=;
 b=M/T9b/GpZu7fQuUp++vy0RovRp85dO/t/cZOxugmvVOhb8Nm/brRs/ehb98y2mgd25
 S89YgNoqp94q4auoMal79Wvm8IQg/kcRAwU4+cdRcOvfmah99hoVpkeAYSyyu/DpWppN
 XYGTlQAwUi+/dX62LNALetPxMoPm0URkQmqhL94z8/JyE6d7IXoeNE7QcdVK+++5WNY/
 5shiZDxeEuCpgYMystf+xwROqd2YfuNgdZEq8Vqwnv6qPzXyzKCRasiSIB/vO+9sHNKi
 vwi5Dm5R+blteLor2wgEvzzQFCP6qNvdiJam47JhR8r9K5I6WkEtq9fv1Ls4ocZB9KsZ
 2omg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9SPIDntzPTmbtsC5exA7TjSXIVljc0Xm+zcqGPG50pt4db+SZS5M3WbCWAyls9HNwhTHahLho8w==@nongnu.org
X-Gm-Message-State: AOJu0YyQt/TEBxN8P8iROORHXHH5kWwF8jpysCM9wLD/OolVV4oKI8YX
 KXLXfAmxqPe+fohlVcASBwVmeF26i7qmC0mLao+NEpYOl+s4V67K0J4uI/G5ix4=
X-Received: by 2002:a17:90a:4e0a:b0:2cc:ef14:89e3 with SMTP id
 98e67ed59e1d1-2e8f1071ca9mr2214961a91.15.1729920120452; 
 Fri, 25 Oct 2024 22:22:00 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e77e5a4ec4sm4555263a91.54.2024.10.25.22.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 22:22:00 -0700 (PDT)
Message-ID: <cc3be5b6-5a8c-48a7-8558-dc333234d9b5@daynix.com>
Date: Sat, 26 Oct 2024 14:21:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] gpex: Allow more than 4 legacy IRQs
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20241024102813.9855-1-phil@philjordan.eu>
 <20241024102813.9855-10-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241024102813.9855-10-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 53MMB+XcdzdY

On 2024/10/24 19:28, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Some boards such as vmapple don't do real legacy PCI IRQ swizzling.
> Instead, they just keep allocating more board IRQ lines for each new
> legacy IRQ. Let's support that mode by giving instantiators a new
> "nr_irqs" property they can use to support more than 4 legacy IRQ lines.
> In this mode, GPEX will export more IRQ lines, one for each device.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
