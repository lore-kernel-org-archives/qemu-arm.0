Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp97577ejf;
        Thu, 22 Feb 2024 09:55:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWpEgN5a2gotR5RTzdbGIXW1MJv0efgkbzH7m0+1LPHEaoriviIcMwRl+ZLxgPrQCyrit9+g/ctywXSGixL6d3YYiy5zILX
X-Google-Smtp-Source: AGHT+IHl48ENkzt+xlkkUhsPrSPGfh8mC2psHPx805IUzN0zCQGqscizVUf5Grji4wYVak9N66ya
X-Received: by 2002:a05:622a:3d0:b0:42d:c905:63a3 with SMTP id k16-20020a05622a03d000b0042dc90563a3mr26743738qtx.33.1708624527281;
        Thu, 22 Feb 2024 09:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708624527; cv=none;
        d=google.com; s=arc-20160816;
        b=xJOZom6uRyz3kCfbIu37Ks+ZfU6EU9loZM+QNyShPQ8UcSoalvpiVnBSOX5Y0BNqd7
         VewtylmgVjyalEuQEggrxpAZjq5nS4XfvciAID5DclJRv0iYQC58Tiyzbu8awyRvSf2s
         fznBaw/ivAqfS5rFkkzvwvnGUSGhe3GZaCvafiayvZ1cOAA6yK09za1z+KnWi7wT1jOh
         RV3U2pfzWr6rbMLGyYVn8t2veSDTHQMqhappMjBVnIW+7eX3Xi5wM3p4NQdRZpY43cxZ
         C5UPcO9iRDdeZ+rvjwVfquTGBBq54/7ZEmXCivdPAzy/iolnuoNCDacUW3C2/9TkC7g4
         hPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bx3KBbR0xVU0uc+ydHpKxX1ggOCwvwbxtqZweBfpygA=;
        fh=6kS8sj3CEvGnQOp+nodyHtSUOKt6m5gchaFUjC6/CZQ=;
        b=wdEyPCvh6XZGBKA+VT1EleTaaTCdMcEqKq0MMppU75wvoSlExNWCsvNapxvD6D9Sny
         cElqbqiDqu4TfCKQ4S45q//cZsxhyK7efLtKoJBXQ1/jKoDFg2PqSj2uPEcZm6TbReaz
         iFyiYhDjda/pe2CwmBFR6FTR5JYBbhocfHbgxlxadKpBEQlkB76o8Cxx8W+OtFb6o7+x
         hX6FTMAcfOgIvZUtmNf4uKaDAvOca8HPpSWkjQook6/cgoUyWTdwKiYGRhElsSbcSOUN
         9dsLaXsl52wE8WhfNHlHDxEGvNlc/5mzY72hAh6WSI0TFs7mnzZ4ZSDiOzwhltTpYnUZ
         tqSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3zkSdLS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020ac86604000000b0042df128ecd0si866184qtp.218.2024.02.22.09.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 09:55:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3zkSdLS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdDHl-0007nJ-8N; Thu, 22 Feb 2024 12:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdDHi-0007mb-Nu
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 12:55:02 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdDHh-00080o-2o
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 12:55:02 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5649c25369aso6531105a12.2
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 09:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708624499; x=1709229299; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bx3KBbR0xVU0uc+ydHpKxX1ggOCwvwbxtqZweBfpygA=;
 b=k3zkSdLSPCfvtJ7oy1vk2zBqZVAh0G30HUEKR1A4sl6T91km2VIZF6UHRy37AwNZwv
 JnmhE3CjRbtn695QFFhuUhp0arbQ/PYDuHh1yGlWm09UCKoP0vkJSk0EDp/HvHi9Mczf
 qgKmOBnWcXSAPlGS8uYZjqkbbpfYcqNzYXWlcwcULRrVDT+MhYAT46ToiTQolSiV+Jx9
 omgwjZVdCOyeU/Pc6s9L/TTf/vw6uyrN+vHOTtQ1nTKf5iJXyeYv4RZDrmtnFO3U6pwk
 AXpG2ZGAmMBWSUBTryZF1+xGTTQAg9ctRXmmo4yNLalbfXOsCgM/R5kAFr0ZObMGeDHw
 JzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708624499; x=1709229299;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bx3KBbR0xVU0uc+ydHpKxX1ggOCwvwbxtqZweBfpygA=;
 b=CXEGg1VTPWwvTrkqYwn75/GrOEre1otb/I6bswm4g9jFQgZo3Obc+2D690D/N9AMNF
 WtoxolWPoag+kY87MG+hMMQQy+pX7Z+FQF74rtMLBa+6d8TkOjgnAOVSsWjNFaW9EdKW
 hkva+deg8zzrWotjfMdSCyZXGGuSDfivzibcUcU8CPdvmn9QS/W53/xz4HGXM+g8PEuH
 VTBh00iCP1W9Us6ul7B3OJ6aEjp7SQk855oRpwRfzS61bd3FaDLq0dyUNG0w5tTmFwL7
 xN103xAl6u/Q9uA+gAk38iF5VJLAyHmBHDy+plx5Vft7J+Yk6WdeR79NTpoOMLhy8bZ2
 XBqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZwGU1CxsS/fXJBW8eQX645auVsY4yDrQ5rbduR2rx0MgaSqEWJ3UwpBRGTJPra2lWJ3XFxfFKLFwJwwHffZKTUgo2
X-Gm-Message-State: AOJu0YzBmGR+ZaarPehTmeWXUmsf1XKKQgyXfRBuGtF+C0T2LcU95vt1
 ss/SPURtll0ycC+IQbpBSfEcGRBMe9NrpkU7q4mzr1RizE5Ca4zLD2kYXxF+xWDO6DgEIBzOJZv
 agRsiS3TwLU/3sgreW4eN68vBsfu1VyLxO8NBJw==
X-Received: by 2002:aa7:d851:0:b0:564:59ba:2cf3 with SMTP id
 f17-20020aa7d851000000b0056459ba2cf3mr9086898eds.9.1708624499395; Thu, 22 Feb
 2024 09:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20240220134120.2961059-1-rayhan.faizel@gmail.com>
In-Reply-To: <20240220134120.2961059-1-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 17:54:48 +0000
Message-ID: <CAFEAcA8GFFQ-L6zGcft9q8arJxuggraHYRhcAf4q+Oi+VMSP3Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add support for I2C in BCM2835 boards
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, pbonzini@redhat.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 0DpNpGPulS/b

On Tue, 20 Feb 2024 at 13:42, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> This patch series implements support for the Broadcom Serial Controller used
> by BCM2835 based boards for I2C.
>
> [Changes in v3]
>
> - Add SPDX license identifiers.
> - Fix a few minor whitespace issues.
>
> [Changes in v2]
>
> - Fixed and simplified writing to status register
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/481
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
>
> Rayhan Faizel (3):
>   hw/i2c: Implement Broadcom Serial Controller (BSC)
>   hw/arm: Connect BSC to BCM2835 board as I2C0, I2C1 and I2C2
>   tests/qtest: Add testcase for BCM2835 BSC



Applied to target-arm.next, thanks.

-- PMM
