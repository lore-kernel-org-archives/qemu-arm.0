Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB07105F79B
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 11:27:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w10fL-00046N-1k; Fri, 13 Mar 2026 07:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w10fH-00045v-E2
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 07:26:49 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w10fF-00022g-Ps
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 07:26:47 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64ca09f2170so2211758d50.1
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2026 04:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773401204; cv=none;
 d=google.com; s=arc-20240605;
 b=dIq0zC4Vz5RM18ubal+yXkG0YXkLLPf5k05f8K1t9dl0dphyuJwnDHYKV+AZRxRBOf
 xgOAPeCyHO6DTIAMGgcRTyPXWPX6Zfna/+xoGzPin6XTpbi9vD7A0o7tBnuAqP20JGof
 vxwSgLLrXTbW+FDsP6dEW1ozhce8N49AlVEpl37LIatYi3VnUn0TwKeVM0oUoFoTm+ZP
 pQMwwxkqBrUxR0vIBcaMI/m4qQ/zfcxahtTEqKTQYSkikkvei40G7KZnk/L+Xkg1Cnlj
 6D0SnaV0hK9aoUmi3c1TUU9hxgTBZXOpkE9ZY84OrvbbdmSABHvpiHiMl9YjPc6NxfHr
 wBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ImeyKg8e1/RCe+sviCmGQ62cfhyCCC4fRWK0o9FNl5k=;
 fh=SS/WdUaMaRSrbHL9G/zrZ7X/4EJXnRTu4nTDtmOS5OI=;
 b=DqYu29Wr0xKoNPwpOjDQLp8OaLhkwhUTobLgrYDD1RhNxOaQjebgiVqY6wP0GOIA4E
 8ifm3WCzKMU7vY1qxgRnva6z5wjm6PjGkJmx5INIV7mjbxszAW3BMF4z0gtrPSRe0RYZ
 bZwJwk+HlU6qKc5S+h8IG03CAU5yzws2aWFiSh26U3ajtAptr9Y4ddpB6U9cBBuR17TX
 nYJF4uPPlLiTjz+cy9RG5CnG77mNKGj8heiH5CPDQQyDwRwbr9HtJP0F69lxWVnZWfNn
 UyPEUkUMjb+ixHNoiCs7c/08He6RmaRKO71TVaruBDBvB7NtSrJUBKav86VKERWDJntG
 p/SQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773401204; x=1774006004; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ImeyKg8e1/RCe+sviCmGQ62cfhyCCC4fRWK0o9FNl5k=;
 b=iHyk229CcWH2FOJExpr0z9ztBfxxb65fAMl6nGJagHktJavaaZ62/IgOzfJ2lzSxu+
 aFx8sQdsnBkr/sn3FDHs6htBqM9NlC57dhK977Gv+Rc9MMaD0Ur/1lcoPhvhxUTM57tD
 k5/blP5DYrqSH25Wrbq3p5LapJPDW6aUJESCjBTQS8FpZoGvI+EZ3Vlq/nohgMmX9Qkb
 mtiuV9TJsH/gyGIHE4G5d5Vf/W3zaqlhgRvVddvcsiAbn8ynIJYQ/kNrwyCp4ZYeUYFq
 /BZExQkk5FNxxhlG+YpVlxQay8ROWGMsD9RhqhKLlW4HPSauHNsr9V8MLHDRA6qREDVN
 mmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773401204; x=1774006004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImeyKg8e1/RCe+sviCmGQ62cfhyCCC4fRWK0o9FNl5k=;
 b=VyZnOADYgjnLmg/7Wn0V1jzZHLIHZcwiG8W+9XJ5bq+vRbMw2Eirtaafm7cpufpGrw
 1pQUOSPapgOhvlu2z4ZjU5AROeLCasFv/5Y7P9FvHbHHAWJVZsRmLKU3rH1PkdQYk6TY
 THbvqDRllV5YkJW4XYXSfBaOBuSMu7C6w6smvQW3iV7We7+6qFi2mcYARuaLRh6elmLm
 yQAixfgZq21zehLM1qhCrGTRDN3HdXu+AAHRnY6wdc23APS1kLhDrHwNl9t4k9IJ225t
 V5tUIqkzTFgJekDX9wJRa9/v5vlIggQSh4UCJMJ8b8gIrxZC5p0nhOp3GERtlTHAT4C0
 8frA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWS54NWvP+7W34wJAmSGFNste7xng2giPIdYtlVxKE6TucCaq3F151K1hbl9WWbgm70xr1qWjlDg==@nongnu.org
X-Gm-Message-State: AOJu0YwYLOgb/7T9sfYBuKdLryAmZGuqLfihZjVScUdg5CdNGtzF+U9Q
 bblENgwTLD3DrS8bFhH93LcfaWRZwgPiY18D20AH+5T3mdmj/MXdtAGS67V+epxTmqW2D8gQGva
 rSd0uBGwHrvbx8rRkhOhBpka1CnVCI6cyyXjw/gpoeA==
X-Gm-Gg: ATEYQzxvUTBVpeNMBdCpkL8wiUnuWat0TdIW2KDW95t7FV/eVHXJsaa+WR5k3V4aiph
 hXDAL4ynqJ+Z39TDF8xgx3vziNANsVbBNAHkj42BpCfMz4pvg6x6U2JQqGtJaD9SGD+ZVQ+N2ui
 /8YpqhlsM3sjLqhd+wS/gHSKI8gSTrSMqMdWE1bIMPpHtOMxzVA21UJO3saux34xaJb5qdeSPzE
 hsys25UsuxRLo9QRz4vCN5cgTlh9NYERwf7ObTHgdxIQUb8NM1vUJdRXC/D3zCVdDnGBK8TsuEZ
 cQ55xjNbFBIzCNdy42VAIvgoXvLJVfZu4E1ncaOSO2+lVftL57ZQ6xcSoFwP1u6Xzes=
X-Received: by 2002:a05:690e:ee6:b0:64a:f160:2376 with SMTP id
 956f58d0204a3-64e62fc21ffmr2097989d50.30.1773401204448; Fri, 13 Mar 2026
 04:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773301927.git.dingtao0430@163.com>
 <cb35c1b622674da7a2b70691402132f691933f2c.1773301927.git.dingtao0430@163.com>
In-Reply-To: <cb35c1b622674da7a2b70691402132f691933f2c.1773301927.git.dingtao0430@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2026 11:26:32 +0000
X-Gm-Features: AaiRm51fGPeoFMrznG5OT3ujvcRce3eHSSZTfAcg8NVtI3UuefdN9hd23jhDDlw
Message-ID: <CAFEAcA8+t_Us0wZ6=MQAJV7ZDWCNQ8pKVTSR86L+_wA3U9kpww@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] The LLI of pl080 should be aligned with 4 bytes.
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Thu, 12 Mar 2026 at 08:02, Tao Ding <dingtao0430@163.com> wrote:
>
> When the bit0 of the LLI register is configured as master 1,
> it can cause incorrect data reading, and even lead to qemu crash.
>
> Constructed 1 LLI item. The initial LLI register points to the address of the LLI item.
> But the bit 0 of the LLI register is 1, which mean read from Master1 port.
> According to the description in the PL080 manual, the address for the next LLI should be word aligned.
>
> Configuration
>     ../configure --target-list=arm-softmmu --enable-debug
> Reproducer
>     ./qemu-system-arm -M versatilepb -m 128M -nographic -S \
>      -device loader,addr=0x00002000,data=0x00000004,data-len=4 \
>      -device loader,addr=0x00002004,data=0x00001004,data-len=4 \
>      -device loader,addr=0x00002008,data=0x00000000,data-len=4 \
>      -device loader,addr=0x0000200c,data=0x9e4bf001,data-len=4 \
>      -device loader,addr=0x00000000,data=0x44332211,data-len=4 \
>      -device loader,addr=0x00000004,data=0x88776655,data-len=4 \
>      -device loader,addr=0x00001000,data=0x00000000,data-len=4 \
>      -device loader,addr=0x00001004,data=0x00000000,data-len=4 \
>      -device loader,addr=0x10130030,data=0x00000001,data-len=4 \
>      -device loader,addr=0x10130100,data=0x00000000,data-len=4 \
>      -device loader,addr=0x10130104,data=0x00001000,data-len=4 \
>      -device loader,addr=0x10130108,data=0x00002001,data-len=4 \
>      -device loader,addr=0x1013010C,data=0x1e4bf001,data-len=4 \
>      -device loader,addr=0x10130110,data=0x0000c001,data-len=4
>
> Qemu Crash.
>
> The result correctly after fixed
>     (qemu) xp /1wx 0x00001000
>      00001000: 0x44332211
>      (qemu) xp /1wx 0x00001004
>      00001004: 0x88776655
>
> Signed-off-by: Tao Ding <dingtao0430@163.com>
> ---

The crash only happens because of a different PL080 bug where
we weren't correctly handling invalid swidth and dwidth values,
which is fixed by this patch I sent last week:
https://patchew.org/QEMU/20260306152140.2191653-1-peter.maydell@linaro.org/

but we are certainly mishandling the LLI register here.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

