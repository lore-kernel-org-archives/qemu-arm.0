Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F3510F284F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:57:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AUm-0004qZ-3Q; Fri, 27 Mar 2026 12:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w6AUl-0004qJ-BR
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:57:15 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w6AUj-0006bn-8H
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:57:14 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-64ae222d978so2403676d50.1
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774630632; cv=none;
 d=google.com; s=arc-20240605;
 b=N9Cd+2yJI+0m/x68qvAo/Odr2BwBoXiCTcF8Ae8eGy4qQ2Hy+czhCxJ/kQtwEvKW+D
 isNnbrZ9LhKlnbsjOZq6X8O/ehsKPgKLI0MwDHnXPNn9pwkhBUZ22nJTuWAxMCvD2HxD
 E2qNZ5juKqW3v5koKL8FNIZhhKIqZfYp3NiTdoJDbfoxkT+tevnViHXjx93cM7fNeqKD
 aUaRZU2Z0xOZ6TzmY4qzPwO8U548IkAnmyOZQoSz4iR9Zh29R5AOsKjUBuoW+swttYqk
 ZSvXGaYgPBHJzK6EZETjZeZAIvSv4opi7lVYOdRUCEoosXrwKtii+JTKjzYFY8O6olyE
 ooOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7JCGMQMhzFkGK+dxoPGks94i+If7ffYjM8LNI+e86ZE=;
 fh=y/6p8HSQVKmUOwjHSMO28jU0rx498PPD4OxiJ4HXU5s=;
 b=JMF3rW8Ws4HzJl06GidaPJy+aHJ055/8gNs6d0d+GStpSKVbAUCa3RNC+fJh25Q7uc
 2YUNqtSQgbsy4fVrwpfxHQUnL0ddkRPKH4hwsECemqoZHbfM0gDNi2G0imfcZxD47iy/
 TFl5SvgkEeyx7D/mqIeumtLl8MpIVPqitMnZPO7xpo6841anSpo5OymYxviGzrQaTq0O
 gaKQoI4kAnRwMGVPWUYYOTbSdh4EWvGRIa7B2Ryj5V7CJB+mylnBtvfl4GIuVjEDK+P6
 wxhKv3MsbIz1UpeDK0Rr6sdOwszlkiBS5IXL10SR32fM5mLfPygCJ+UhDyxmylF9SHJi
 +U6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630632; x=1775235432; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7JCGMQMhzFkGK+dxoPGks94i+If7ffYjM8LNI+e86ZE=;
 b=n/QAz/+fNmRBiukivYdKxiQuCJSX0VTxsCzhaiLPX2xm+vy4D4m6rk9julOvOhDvjq
 ryNUKefN12nD5v3mmsYNBWt54nMT5SAQBwnmXp/D0xjOruyItwhrD8/WsrAbgp9f38Od
 UgJhwyR5qVgSLAODiiihaxKjkY1VHbC1GjhdZiLD4gxdoCQ7xydcxRZBMs8KtXja8W6T
 DC9qvMIBV3SfAR3XvLccKYl5usb4rc6NJT+z1NN7dkBhf1wJCY+yhDNA7bysOst/kLGm
 08jiAKJIselhjgsZqNtOAPjmm89rP7XbjKSNYSIwi+8OEk4m4ObI02UFoFhWMkBk3AEk
 ptDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630632; x=1775235432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JCGMQMhzFkGK+dxoPGks94i+If7ffYjM8LNI+e86ZE=;
 b=GTIiPnPXFHwpxFLBSo1Hiatvw3ZGjlD8F1YWSoOSI95wDJxJsPY+UQA8nlP5TXw7zV
 /8hxpsLxu16vzOdssm3ILflp1x+NfkCeMmRoNrpRElfnRbJDdEq7DwbhRt/BO7HEVGyh
 n/Z+8zUb/7DPM6CMW8ovt1UZbQacRzQ/3kKkpPnNn23WbL9Kv/6PpWE4Y9ur13OStbFP
 5Sa4k6j8BTC87h0gaqmmXbzqjLOoVkKBMMb0Ab6HZ6iNlNBEj2hxBAjS2mLO46gULmSH
 vh3KiagtAa/pWJZIV7n5EEd0TuWMCxXrl+wPBhfP54GcLMIUy2pu3Wh2GwBG0rpDwpfC
 lyOQ==
X-Gm-Message-State: AOJu0YxZEV0S0fsEsn16TF/Wq85X1bYMlfu+tcLqfgkKur8BZ4Pxiiqh
 h1QR+96ewwCvak0itHLZL98oZ33kGZ4JbWi87veGzMtd0gUj17H8KW4kt0wEqEZBwRT8qJn4lGG
 lUnAZ9w+abHbVq5NQwMvk2LJwu+6JXGtQyHaQE6m4ng==
X-Gm-Gg: ATEYQzyqFb156sQT6/Md+8JhCja73tKPvoS1hHKjwTO58ZYp/nz5/dGXyiAOqpmWDBh
 9HM03emlmeq4IEDkq9RKHCS5qoL20dDdeUl11X11HuF49zcvnz2wI9dwJa3roBPQulNnrG3Qiqt
 dHWTgPFVodUcNYcBH6TT9Yf9FI5utjgBEVLfO1lArIzn6FCDNOzu/wkaACTF+P32hqZ23qv3qpu
 ehlyCT55Clp2926Yca8MOFi6ylJPsyqBQ67w5/L6TlRmuHlBs2612UyIoovTsPrtpER7pDnhM4K
 tafhGVHzAUDsOUKi+6jcghb5zzCNDlqT135t+R8pWvNRuDiUF70yyyr57purHsqCzaoLDzpgbrW
 0Pg==
X-Received: by 2002:a05:690e:d42:b0:64e:f86e:9de5 with SMTP id
 956f58d0204a3-64ff720aa0dmr3237265d50.23.1774630631562; Fri, 27 Mar 2026
 09:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260324160321.96347-1-zenghui.yu@linux.dev>
In-Reply-To: <20260324160321.96347-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 16:56:59 +0000
X-Gm-Features: AQROBzDEQXjlEgKgzwmbPbcaIZOCJlaxBRcfJG-JhAlQBwfjFOjwC9GOzdt9F-E
Message-ID: <CAFEAcA-zMUr=-x=h6VRJY+dSRf5MVM=PQ+P_V8+R1pQCx5wreg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Don't skip access flag fault for
 AccessType_AT
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 24 Mar 2026 at 16:04, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> As per the pseudo code from DDI0487 M.a.a (on J1-16021) AArch64.S1Walk():
>
>   // Check descriptor AF bit
>   elsif (descriptor<10> == '0' && walkparams.ha == '0' &&
>           (!accdesc.acctype IN {AccessType_DC, AccessType_IC} ||
>            boolean IMPLEMENTATION_DEFINED "Generate access flag fault on IC/DC operations")) then
>       fault.statuscode = Fault_AccessFlag;
>
> an access flag fault should be generated for AccessType_AT, if the AF bit
> is 0 and !param.ha.
>
> Besides, we should continue to not raise the access flag fault for
> in_debug = true which is what we've been doing previously (before commit
> efebeec13d07) for LPAE and is what intention of the debugger access
> codepath is.
>
> Fixes: efebeec13d07 ("target/arm: Skip AF and DB updates for AccessType_AT")
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
> * From v1 [1]:
>   - handles in_debug = true (Peter)



Applied to target-arm.next, thanks.

-- PMM

