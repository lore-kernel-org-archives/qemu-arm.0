Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp8856ejf;
        Wed, 10 Aug 2022 09:49:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4pZww11HAXGQMYBQ5u2SxlC4JtG654+XDa7e7ZoG6aH3JYfATCdWVx2qG2z8aWpzsixXT0
X-Received: by 2002:ac8:5843:0:b0:31e:f855:5a7a with SMTP id h3-20020ac85843000000b0031ef8555a7amr25410928qth.307.1660150140388;
        Wed, 10 Aug 2022 09:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660150140; cv=none;
        d=google.com; s=arc-20160816;
        b=MwjlVJqBUr4BjKnGq1lOOBnj55qR1NssnqFOBVyDAGJEe1MR0B4igjDAVXtxNJHC87
         gEJy3RaCQNc0sNJLLl/0oitCNC//BX/GzQsjEin4zOvv8sGCJGaarAM3o3ZOIVkPL+cH
         XIaT4NKdf1QIKVMaRGOIyA+oqgkMguMTZHnGZRZ0vhdzVwycRaCtChMONJbtTiPa+LQK
         FQO3NL+b9Dp9ZebzioloBS1alCDHBcfydCLtmuJ7xKneNqMMsrIpkppkG88BwEPzQ8WQ
         k9oOLrZDIYY/K3kNkF3ZsOEPV38wEiBeHB0MulEq8zOMKz+k68LIgX6yktBCNg0XsCAT
         U8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=tNqpNUl55dURjmOoDIIeRz/Oe+X/6cGqsZptlEpA/Tc=;
        b=qFlhR+o0BWaj17auH/jWdsALf9KEVf4R5O/mBrgjrpBfH3pmQPYhagi63DGOzCszW5
         c9EN4VN3IuAC6kYNlhnNWzwARAT7hAz1Q7eIS/5B9O2F2sZ+JXamzcmgkCJOJs1RTE4X
         wmuFoD2+vAX4cLyTlTtWml5Pkk7cQ/TpwwqfBcMkgLzvzhIDdHOOtDNuk6dtrZiNStXr
         o8vLdGN/jmJ7zz8KoRV7Ow4D3aeqGngNdC5y13lc1ZmGnuC6n7A6JzPOc/B6r+3C6j05
         0XMHPLk9QtwFCNdXw5OKdAB+wRdz18zKCwAHJlsQxcPdkwENh/1p/kRZiUPZr3zK+ZQr
         oEQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCvnu+6v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05622a180d00b00342f651ce5asi141083qtc.540.2022.08.10.09.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 09:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCvnu+6v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLot9-0007Fg-Oq
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 12:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLosr-0007Dy-TC
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 12:48:41 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLosq-00067e-42
 for qemu-arm@nongnu.org; Wed, 10 Aug 2022 12:48:41 -0400
Received: by mail-yb1-xb29.google.com with SMTP id n8so24231964yba.2
 for <qemu-arm@nongnu.org>; Wed, 10 Aug 2022 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=tNqpNUl55dURjmOoDIIeRz/Oe+X/6cGqsZptlEpA/Tc=;
 b=xCvnu+6v0rd7a9YmUbz4ldOZDtZgYfDlb1W5JwwXYJKjjPGyXTJoXkDD8dlZMRDuS1
 WZ12Kt/ee4Iy8dmj8aRYtbMyRHlklo7S7nHKdTduuB5ebhVVMQ375KwaroasivElg6zI
 qu3x+BXM1kffq1280pooOWJIeCjjZgTy4vgMqqVYZLrg2TOMUk9OdZvZSXlFBMhTvAzS
 0+RGC+fEppuSJaosfoKbpZhnxS3v2QWYR1YFmWtVq3tk4pur5/Ll5Lfk8JolXHBglzWB
 aUr+M6w4idy45kuS9vVJR7Kf2f4UV1f20mNfIStpcJ/6CNeJ+KGd6h8TavV4cMdQSJyH
 YUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tNqpNUl55dURjmOoDIIeRz/Oe+X/6cGqsZptlEpA/Tc=;
 b=yXICTYeoImds+qTnviVh5BJKsauN+f9r4C2bN6b3oc1X28uc1IbfWEdi6+LQV9IdCE
 faQKW0LOonSh+HHE8GVH8rZjvA6PBPMAZ9R8/BIUo171KroorikEvkH8bYxrZ301/JEX
 7EW2DsQhTWVj1A9CgTk3KbnTa/8vPnRuIWVuRqQKGG28yTMYhm5QLV8ZuhDxZm/GMHAM
 e7EWKEOiLBw/NuxcR2zkNLIfVj68sosgzl1xiRRjEDkhz1oHR/rHMYB3uwwSfpmxYcyv
 vCT7P/3Vdfuriphch5SI7oiAnBmFFXHRPihaJvR7Z6CPdhGL5ekE8HJ846CYHCK9kSC8
 pf0w==
X-Gm-Message-State: ACgBeo2wnGpWSMrNy50mAOYOU41KJkHB88Q1pxCioxhYlB9Fmlu25Ye7
 YMqRTDZn57snuT6sSQ+s7BV0P8JgpTraW//ChRlkaQ==
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr25359730ybq.140.1660150118827; Wed, 10
 Aug 2022 09:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220506180242.216785-1-richard.henderson@linaro.org>
 <20220506180242.216785-25-richard.henderson@linaro.org>
 <1d915529-cd32-82b3-42ad-4d202d3590d8@huawei.com>
In-Reply-To: <1d915529-cd32-82b3-42ad-4d202d3590d8@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Aug 2022 17:47:58 +0100
Message-ID: <CAFEAcA-FQ3W78c=kwzZZ=wCuCbPWO=9vxG7ge4wnEZR6qBGHVA@mail.gmail.com>
Subject: Re: [PATCH v6 24/24] target/arm: Define neoverse-n1
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hxYaYRoeVfMr

On Wed, 10 Aug 2022 at 14:14, Zenghui Yu <yuzenghui@huawei.com> wrote:
> The r4p1 TRM says that the Neoverse N1 core supports SPE (the value
> of ID_AA64DFR0.PMSVer is 0b0001) but do we really support SPE
> emulation in QEMU?
>
> The guest immediately received an unexpected exception (with EC==0,
> at EFI stage) when I tried to boot it using something like:
>
> /path/to/qemu-system-aarch64 \
> -M virt,gic-version=3,virtualization=on \
> -cpu neoverse-n1 -accel tcg \
> -bios QEMU_EFI.fd [...]
>
> and QEMU shouted that "read access to unsupported AArch64 system
> register op0:3 op1:0 crn:9 crm:10 op2:7", which told us that the
> guest attempted to read the PMBIDR_EL1 register.

No, we don't emulate SPE. We should probably not advertise it
(we might do a no-op implementation eventually).

What guest is this ?

thanks
-- PMM
