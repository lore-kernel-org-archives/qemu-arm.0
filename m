Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2480209ejb;
        Mon, 20 Feb 2023 09:38:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+6ildk/lTEhvwqtDRP4BpeatigBVSaZn/47yXD1v6DKV6xyuS7feIKhWHkhVcAVqc7emSe
X-Received: by 2002:a05:622a:1356:b0:3b8:4951:57b7 with SMTP id w22-20020a05622a135600b003b8495157b7mr3127235qtk.20.1676914680146;
        Mon, 20 Feb 2023 09:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676914680; cv=none;
        d=google.com; s=arc-20160816;
        b=ilvU2vvaclbAXqUCgxSbfZr3sPp9r9H98XdmO+b22FEtPh3KyWqfcV1pJ5YdV5kSSo
         N4mI3kNg3DCunDYkqCMkcZTrtOlmLszMQhUBF6jLq/AY05ZbSttZ0iPCa/BUrFpzF5Ck
         nMOxQl70UGSCjR/SQVN+IhD7v4EzY2ooUArrcjlLzvqqGZCSdNDcR7nfuIOdkhbF8dOT
         GwEkInrOFuLHQlhPN5iDHrG42Tr97AjagEgt8a5Augz4GL7Lbq6yyvNH9tfLlkt/PIaD
         Dc+fhTobweveJktKSjVSG74JgSrtStP36tL/GG98wh4kcYSKeM9gj7qMHCbnmgnCOLzA
         bWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2bohxXLr1BfTy/poubrVhXXEy8MGhXoKryYmKOezeZY=;
        b=RPf1W7bd1KEVYLR15mI/sFj0b/7WsW9XEuxzZwedC97+9EGesZkuoEFdZZ3AdtOg9x
         W4yP4Zc87leY+d5LSZGXlpg2qlcZ/SkSxtp4ENpylaI6FRhASamrhbNXUUnB+hTkDDox
         J2FuhyWDpuChVCrbiPx7fJ16m5R1ngS1NRMHcZe/A/yRe0NSJcGHg1TLOrBAaBz+YkMf
         ZqJvqiPil/+1TC6AYGcBPrQyjmsR8BlUzHoE6lAytEPcHc1J+PdX2Nf1JZWo5MH1m5wI
         5+sIynGHRIM4oDkAZ3Pw0rgyVtf7FKWU1DTjlbdmwwngBN0REYKq07NKnIebwvCKQwfh
         nJOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hY1CmKcG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a05620a040400b0073b64657be0si9559937qkp.137.2023.02.20.09.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 09:38:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hY1CmKcG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUA6l-00005i-Hm; Mon, 20 Feb 2023 12:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUA6k-00005Y-Tl
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 12:37:46 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUA6j-0000gw-5e
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 12:37:46 -0500
Received: by mail-pl1-x62a.google.com with SMTP id ko13so2957046plb.13
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 09:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2bohxXLr1BfTy/poubrVhXXEy8MGhXoKryYmKOezeZY=;
 b=hY1CmKcGhb/t3/2y8ZzmDkMfG9fqiX/Z09aXGBzXO50DDqRh/iX4LKkQlaY3+BxUjk
 r94/KNimiOWvN/U0ypZ0V8s2L8F9aY1jJEsz8F1XJJzftDusYGgjS6dODXHdjD5O9s6/
 7TEAsYomA+D78zc8OaXUu8LP9c/B9sYwhw9RDJBaWK7sUeaza0agNcr5B0/UG/ctb9oo
 XSPPWIxmHnSXlBRiA7+O+vg6FT75UjVxEzwVP/mQqZbmB/jHeiLLZrUvS9doH1VEVRO7
 8X5OoqpWlsnuiInhamhksJVwMtBZZcQlFMzUCPGDge/8K8LL+bVC912JSo5JgTz3xOFr
 Dkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2bohxXLr1BfTy/poubrVhXXEy8MGhXoKryYmKOezeZY=;
 b=UQ5Fw9nTlV0daArqafa5z2YDF+isdW/S4ishO9dyJepJ8V40Dq5YdTBBihgKZ29xEp
 TxzKTsvxrchFPowNobjYeRALmnzymbfSWKp4skk9Kexjbmk/3XpN5O8znnTt286weDC6
 Kgno4q7lJjv74rDbKXVYQ1c0MR9RQ4ftAElDNbUjWhtIx1bVXCNRL6IQlpcJxfBquDyh
 +oi/wvSuYFntqAyF++HqdPIMWQ+DxhdBAS1L+jsk4ViWNdouGE0IW4lZp9MrHPTWr/yR
 Vt1XNXsUkveBTwzwsadM0wAavc6CvPs/0yhHpibrKZgo0AmdoLrDacdUJ9q1E19xwWoo
 d3QA==
X-Gm-Message-State: AO0yUKXDth8IzmBZZeHQnXf67ES4sKDLC/0D775LkwBfqnuhevtZ6F3w
 2gQ7PwkvbddNuPWp4x1bK8dsckoiIyJEZHbnw1th1A==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1051728pjb.92.1676914663817; Mon, 20
 Feb 2023 09:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-15-richard.henderson@linaro.org>
 <CAFEAcA96L2V0dvnrygnr00PsKkAcko30h+RCKUMcAJGv0utH4A@mail.gmail.com>
 <c6d768e4-6f48-b68d-26f0-227d70bce82e@linaro.org>
In-Reply-To: <c6d768e4-6f48-b68d-26f0-227d70bce82e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 17:37:32 +0000
Message-ID: <CAFEAcA8sfvQFFArnkm8aGXSvhB6t+vg52bdQCPvLu26VXRkNtQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] target/arm: Support reading m-profile system
 registers from gdb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>, 
 Luis Machado <luis.machado@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cnkKLhpQspA/

On Mon, 20 Feb 2023 at 17:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/20/23 06:02, Peter Maydell wrote:
> >> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
> >> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
> >> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
> >
> > Half of these need to be in org.gnu.gdb.arm.secext.
> > These aren't our own XML features we're making up (if they
> > were then they would be in org.qemu.something), so we should
> > follow the existing precedent about what registers go in them.
>
> Now that you point it out (and I should have checked myself), we are kinda making them up.
>   The only registers within upstream gdb m-system and secext are MSP, PSP, MSP_NS, MSP_S,
> PSP_NS, PSP_S.  All the others are our own addition.

I think OpenOCD's implementation includes more than that:
https://openocd.org/doc-release/doxygen/armv7m_8c_source.html

> Should all the rest be in a third bit of xml?

Luis, do you have the specs for what the existing implementations
are doing here ?

Ideally gdb should document for every bit of XML it is the
official owner of (ie in the org.gnu.gdb namespace) what the
required and optional register values are, including details
like the register width (which I think the two existing
implementations that output m-system disagree on).

thanks
-- PMM
