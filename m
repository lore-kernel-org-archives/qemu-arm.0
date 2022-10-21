Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp915009ejn;
        Fri, 21 Oct 2022 00:02:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4y5nj9UyHky0Ctft9JH86AsrUxRaEEgdEEoCNlgcDPISTz3qG8EMHin/aqfzTP1i2u3YNI
X-Received: by 2002:ac8:7d8b:0:b0:39c:d6bc:8c5e with SMTP id c11-20020ac87d8b000000b0039cd6bc8c5emr14707319qtd.259.1666335763075;
        Fri, 21 Oct 2022 00:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666335763; cv=none;
        d=google.com; s=arc-20160816;
        b=dvyfK7cUZyTbaRlzLIMK8Df5JWi4Ta8KQG1gtSnoU5XKgyJpkiTLbYTtG4+EuLTqME
         OtJ5W446JhTfn//V4dKpI5suwG8qqUxfscB84L0Z/pYPkjszBMl7vL7/nuLH5079aRkV
         WIOkNGEm/Fe9qNrJsWhkreXnb03jm73SiyKc2CJL/SvvRB+GSXRDCV82c8QXaI/j4xEm
         gVgFlAiW1S42zefxNVDd7F+y+sEvXjtQpLDvlimXubs1VDwgGcc+CMZdNmH5W4ycMSTo
         +Yk6iksAwXA9XMvkHA1azlPOR1WIoMGgaTceNlCKWZLaCgO30eJInLzHrFVKmbt2c8bU
         Tgqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=c6P1kJ3+RZCXmOOnzZhCwC+wtSAstY5MFcuyoarUrWY=;
        b=xtys61xzzBfPwjLj8kmwHoVeQYkV43HzSKhjHd+y+3b6RydChpN/q+9As9O2Qj8wD+
         WTDpfRtWAv7LdwBxcORpNzx4JT936PfoMW2HGJAGQ+JR09WeDOkNMCmCgONUf8HFx8af
         rfr6Xr8xIkIamWbdm/6Yb2kV4EJNrCLarQSnSq60q3sDWZWd+yHXKyG5eKjIyP5BPqwE
         QP4nd+Kcq77jzda5p6oPpctId7fAXeSrSWbm4CMlKRW4em00J0GhA/+OSgWF7ldwSO0P
         tf4K9l4cUKkJJINkQtoV4E+NHSnzoEYkqdPB8Y4P7GZEJLFelmn1muR3nqvrFyv2v1r1
         tR4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=EjTarj4c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020ac85846000000b0039ce9587debsi8827999qth.95.2022.10.21.00.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 00:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=EjTarj4c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olm3G-0005Dn-IM
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 03:02:42 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1olm1Y-0003NZ-2E
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 03:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1olm1U-0003Ci-Kl
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 03:00:52 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1olm1S-0008Bs-Nt
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 03:00:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id q19so2879030edd.10
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 00:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c6P1kJ3+RZCXmOOnzZhCwC+wtSAstY5MFcuyoarUrWY=;
 b=EjTarj4ctnZDyQ+NGNhHsvKC51EgZzpuLShYbWBZKY71J7GG+iIXyIVy6rflEoi9P3
 Dmah9+mbIrDu4oV8201t7eO51odq62juRUo/Ha+2RYpJJbwdZkHrjJKfWK3RNyjupV7s
 Dq5SpspOF6eFghaEQqrGQXZJWcqAfojKNS8nvby4etz2KN0y3oavQnlEO+3Wu1yef7Yv
 /niYspcPaM/WHJ8rHsgBi3vjHlRSAVO97ZYv0Q78UBNZHbQIt4TlCvX5Z2xFzwJCfik/
 iJtD430jU7FpOsqKBb7W0ISupiU2zwoZsUbFRbTqL6AbtQ9TpKAubgVmV2p7VXWxEhQ8
 cqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6P1kJ3+RZCXmOOnzZhCwC+wtSAstY5MFcuyoarUrWY=;
 b=ARqwk8fXc+TyaiHsjpqDW5JPJcLO0YtUN6K7gUS7rEtemrcSK3wAHQlUKs1kS+8HVc
 tnDtmlsJ8mlO0rrdTwcFrT1WQQChCcmDzCQQGs8cNRM5ClHp1Doz1oZQCspZvuqoyPYf
 2yuWExJjyUxnkRNfa7CzzpGxDIsrNAWFpaWO7cmrpBpgVXJ+trjGm4AzrUD6F6B0oUVW
 pIvzmZrB6utCeaPReom8SD8IoPOwkQ+S+WIKVSBKXHF/FR5upmz0OuLav4vJzKI5g7ZW
 NtZTnVrsXbAHEmszoZwVXEB8X7TGbSKhL3ktUqeLrHtr8COfVurIm62Jka59Xv52gDcd
 Cm+Q==
X-Gm-Message-State: ACrzQf2alEdZTWVjCT1g8srfD+rEzNxYX9eoCVMWdjnS1UhNJjD3ykq6
 6rl4izxP94xq+WV+i169IgA0Og==
X-Received: by 2002:a05:6402:3512:b0:45d:4f99:6151 with SMTP id
 b18-20020a056402351200b0045d4f996151mr15605559edd.74.1666335648763; 
 Fri, 21 Oct 2022 00:00:48 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 gf26-20020a170906e21a00b0078ae0fb3d11sm11216442ejb.54.2022.10.21.00.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:00:48 -0700 (PDT)
Date: Fri, 21 Oct 2022 09:00:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org, qemu-riscv@nongnu.org
Subject: Re: add qemu_fdt_setprop_strings
Message-ID: <20221021070047.225ngzlqqwsvgbqw@kamzik>
References: <20221021055808.342055-1-qemu@ben.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021055808.342055-1-qemu@ben.fluff.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52f.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GKP9GfTCyExg

On Fri, Oct 21, 2022 at 06:58:02AM +0100, Ben Dooks wrote:
> Add a qemu_fdt_setprop_strings to set a string array into a device-tree.
> 
> Only minor updates from v4 to fix a couple of minor patch issues.

Please see the comments I made on patch 1 of the v4 series, they should
be addressed. Also, I'm pretty sure I gave r-b's on most, or the rest,
of the series, but I don't see those here in v5. And, please CC previous
reviewers when sending out new versions. Finally, why not generate this
cover letter with git-format-patch?

Thanks,
drew
