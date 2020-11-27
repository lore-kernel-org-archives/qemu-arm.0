Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2582917lfb;
        Fri, 27 Nov 2020 08:48:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzax/ZAH/YyQtKos+wHCIqprlAaMxu5uM2WGaaZXo4jFuGLnHcF/fnc6Q8anYKkxaSpQ4mP
X-Received: by 2002:a25:282:: with SMTP id 124mr10542273ybc.400.1606495699791;
        Fri, 27 Nov 2020 08:48:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606495699; cv=none;
        d=google.com; s=arc-20160816;
        b=L72f9juEQ3XRy/Y3YPIpfbcyQWGNIEy0g0Aa4N/SbZRCtn8eDiG0gGi9kh3vwKIE4y
         4G+0GqycD6YDa/iUn3wfF0Uk/pazqlSgHiUuNFOBK8d6V3J9agqqE+UJQG1m3VVzK9D+
         22wPyYcnM4fj5XtxTUPyO2j+ayNeU74L+5oSyOR8gYZmn1PcTk66heo8AhUZ222OxSSS
         H/PcIsCgPNf6t0haHDtZ04Vy0Q3sGVX8QgB4teqCSmF0nvek60FyAqbDkeOSlpVJKigW
         QpTRvtejVBAgXF+F85Hx717CY6lnYeck6RVAIoE8E3Hm5eMjpzu+ABfcZ9kG+d80yIxc
         Cf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFI4g5tKIg+8FkTDm8TF/ivYcrUKkhGXo1xF1itZwZQ=;
        b=HHlNEZlucimH+m9XyZNlzziKW97AbQvgJZLr1gV6gF0GLJWXGxcZM2vVtJ5lJDQjit
         zw4eJ3LpuG6TRsYCa9Xd1weKZdMIwbnTy5oAnVIQInrUd3ZL4P3mrP3sC434x81Fvn6k
         dJt7gEs3+56lBfiXIzGbr/T022bgKgYr8dCTLlkjInxwMdJxT6+d9XkG0Q7ztYFO3jQr
         qaDYCByWoErFFExXxNIXVdlh9Wx87Y5uDhRulFIBcj03S11UT3Q187BZfjYXQw1AtFh8
         KIEbq9AQk4ZSqJTrznoTcaddlAW4tmI6JfGpochsDhn3BA4B0/6OAWPv4jVZx32nQbk7
         ThlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hGncZYa7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si8223588ybl.133.2020.11.27.08.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 08:48:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hGncZYa7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kigux-0001q8-7D
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 11:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiguR-0001oQ-JD
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:47:49 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:36396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiguL-00058W-D1
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:47:47 -0500
Received: by mail-ej1-x642.google.com with SMTP id lt17so8475296ejb.3
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 08:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFI4g5tKIg+8FkTDm8TF/ivYcrUKkhGXo1xF1itZwZQ=;
 b=hGncZYa7UMJRHo8ItFhGUq+3J/LE/mnTXhKU546TTu9YmPmlE+ZkZuLSXKwPLAa9HK
 PrlK9bFBWqZIN7KQGFdDHJWQ49qPagWn7YQi6Is9OW0vERLLC/u1xqRJvx6JERXBBVOX
 xsjyRiOyed6nVYj+aRgiXV9dQkweZCwSyB113jFTZFtYY6USfFDoq894y32LmMqh5Cdd
 adBawl7Vw98CDLlUiOelrWzREBZtuy7PgRthIzm0WxEFjTXe/LiWspldO2uCqCNjHKPb
 xtaIen81RrICxmcaXuyu7hVGRxbkbFyix11WAh4NwSKZFBVARV7wnW4yTTGyeXWPQOZK
 L/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFI4g5tKIg+8FkTDm8TF/ivYcrUKkhGXo1xF1itZwZQ=;
 b=j/Ty4djXjE/o5k/LXc79LPw1U+Th6PAYoXH7Yf5ivzmwg9nbTxzCBJowPYc3+psOHT
 Op1PNTCkfn+FVDmpUmdMjo6o3w6rmPXLxsoQpT9xWiKLt2FDPAd0YhntBFg7i2pZiVrG
 4xYE7sCucYKNCNrHzCEnib0n3k5ekqazev7HBXkNiRCOleFFWnepl+PbSMrXAhUNDZmS
 u31bV/1hhrgoqO5jYlZ1FexlXJCB1WTFS2Q4vkmq5+CGVy8cShldCrRxVM957E3+SqAX
 Ez6OlgLUJ3vXnc/Q0ZQOTJzLjXqW4yfvG4vNIsmgrYPIsanBIU/TTtE4dUG2vGoZRmLE
 imXg==
X-Gm-Message-State: AOAM530wdCc8yhuUhPy00GVCRNkp4YY5ViYfC/9bwJBS0eCwtsOOkIZt
 cPUqA++yHAWsNbyyqdwRtoZljQrZZ3fH+9xqBic9fw==
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr8186261ejd.382.1606495659277; 
 Fri, 27 Nov 2020 08:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 16:47:28 +0000
Message-ID: <CAFEAcA_Xo4ptyVhJGXvO3B4FJh86W-Oj81f_nxMbaZt-DPfLrg@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DoQE8nRXu8oe

On Fri, 27 Nov 2020 at 16:38, Peter Maydell <peter.maydell@linaro.org> wrote:
> Having looked a bit more closely at some of the relevant target/arm
> code, I think the best approach is going to be that in virt.c
> we just check the PARange ID register field (probably via
> a convenience function that does the conversion of that to
> a nice number-of-bits return value; we might even have one
> already).

Ha, in fact we're already doing something quite close to this,
though instead of saying "decide whether to use highmem based
on the CPU's PA range" we go for "report error to user if PA
range is insufficient" and let the user pick some command line
options that disable highmem if they want:

        if (aarch64 && vms->highmem) {
            int requested_pa_size = 64 - clz64(vms->highest_gpa);
            int pamax = arm_pamax(ARM_CPU(first_cpu));

            if (pamax < requested_pa_size) {
                error_report("VCPU supports less PA bits (%d) than "
                             "requested by the memory map (%d)",
                             pamax, requested_pa_size);
                exit(1);
            }
        }

thanks
-- PMM
