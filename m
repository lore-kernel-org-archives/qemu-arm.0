Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp428242ejq;
        Fri, 5 May 2023 06:44:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Eh4wRnAdqpsQEO/qX/6PIjD3fof5Guhy/BMl+Gd6DUQYLoJColA3P9QG9LywpglHG/rQC
X-Received: by 2002:ad4:5ecf:0:b0:5f1:31eb:1eff with SMTP id jm15-20020ad45ecf000000b005f131eb1effmr2665378qvb.2.1683294256740;
        Fri, 05 May 2023 06:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683294256; cv=none;
        d=google.com; s=arc-20160816;
        b=nrYBkbklT3hvC4H2ts3dfUzLwQ/i4Z/VCIts/LpyzZAQue2eudhijB94TNiZnKpigK
         gkWEP1nssTtXIA+i08VngJs7PZQ/LHGsB+y8m1waznshroJ5c3/F5u2RSlsPrmXtd01i
         qaZWayAw4+of5kvQ2bUqOkAFDdgGeZiaKB/sQHU7IAeemSgA/9/GlpsBeoN0E49b/JsJ
         MbWMocUCeWEoLLt34pnG2P95yOmnMvfotzBOkOh93SRBH5czVxSXkuQFN7IBj9Yz8zbf
         3joXC9Ny9XH4CUQ7IR8HY5is2wwUDMiy9infWuaYwF1WceodwM1mXwjGYowLyCyYlgk9
         CMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xhDK32Bol9UXXTKQq3zjHirjcRanRkrWKP9OZpm/g5w=;
        b=wNlYFKymTP47ABvnbxX7z3KXrXNdd0TMu0IlVYqgIYSB7nDrqGsLTIZO+eVb0l4+tz
         r5zqT5s1qLxp0EnVJRLMJSxh+kWbJ94tvfCKxy1oM4DsD/8c4PQdQZi+FnrjmqQRSn+s
         IfoI6FCHV0qgPsOh4Wmnj52YUDZzOv6/hlB4Mcnb3Yay9q0YXGk+eyR0r1XAR5D4W3cC
         SMhNKBEBiyR8kGojOhIluO0mJZ585HJfidTmZu2xWVZVhRooaLemkf6pJQsbfVA9zrKN
         H5FGw6QfhzfSS9D4X28QRqDa3rYbCdp1eJxN1KZxmKDM7TKmuN+7iRb6iujMyir5i3Hs
         rTXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPWhHyuR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a0562140d4300b00621056a210csi127405qvr.2.2023.05.05.06.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:44:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPWhHyuR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puviw-0001h0-Ja; Fri, 05 May 2023 09:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvit-0001eZ-Fx
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:43:47 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvio-0007qD-Pz
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:43:45 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bcc565280so2731252a12.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683294221; x=1685886221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xhDK32Bol9UXXTKQq3zjHirjcRanRkrWKP9OZpm/g5w=;
 b=mPWhHyuRduzbUsCYeZilRbA8NwZH3ja509KKS0Y1jQ2fVdoj7mtSGAvCqKRz/mqlNi
 RM3vRNKBq8N371zb6GhiTQCUvk8e1z3v+aMbefNYgp6ANNgm8KTSG6cEhjH5/oI1S0Je
 UEEeKk8si8skwrjYkREzHVNbXYSF7ZF4fVUir3uMXbK/I+e7AESSASZDL6YLici4zQBg
 mwjpCpB0XY3Cn7sI+lPDRifnu6RMYE34U3S0+yip21RI/88CXYdOyvgH3wMkB3QGlk7R
 jgASex+HkKBrf+4l4ImyBYFFTjadewcq/zCFNwml+8mpFnJIn3+5BFLlVfgHRQMZIWRZ
 RDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683294221; x=1685886221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xhDK32Bol9UXXTKQq3zjHirjcRanRkrWKP9OZpm/g5w=;
 b=KBwb6ltIB4CGt742jUvd2FE9M6y9dsJVWqILGld+kMSDZjeER+NRvAm7Xsw1z2Xwt8
 L5fb1ZiKvTBBhEV12HVnJAWXHIoXMG6g/p4jj+A/jFFlhHClPKOcSRPP51oZTCYFAwGN
 L5Ll+GzhVW7mvv05xnZDnu16AwU63vwcFS1ebdaRqaABtDsKpK96fxlFU0ow4AeL6OzM
 yTh1YBnIStNBlWk9MyYcWFYkVb05S4GxgGS9iBeIl7S57bUYw2E5W7UDfk60uyuthjB0
 SSdR6MjLW27Zr4DwCO0lgo3gqo+X7zWAmD557VW+mNMPVhNQwtyvV+ixI8fkTQpCaK1c
 dbAQ==
X-Gm-Message-State: AC+VfDzMqBFqetnOeFx4RjgO27Yiz9SDvSxZFRPiIfNTn+Ohye9AI3On
 a9Q7PqQnbl+zANLxxLDj+NmOKbS9DBmUqVtP6Qibyw==
X-Received: by 2002:a05:6402:1a48:b0:50b:c3bf:c9ef with SMTP id
 bf8-20020a0564021a4800b0050bc3bfc9efmr1631026edb.40.1683294220816; Fri, 05
 May 2023 06:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:43:29 +0100
Message-ID: <CAFEAcA_-uy0raFRZj-hPYeiTgrRsCcj8se8SWWrBFZ-7VgU1aA@mail.gmail.com>
Subject: Re: [PATCH v4 00/57] tcg: Improve atomicity support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: LnDlhvAlcrDF

On Wed, 3 May 2023 at 08:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> v1: https://lore.kernel.org/qemu-devel/20221118094754.242910-1-richard.henderson@linaro.org/
> v2: https://lore.kernel.org/qemu-devel/20230216025739.1211680-1-richard.henderson@linaro.org/
> v3: https://lore.kernel.org/qemu-devel/20230425193146.2106111-1-richard.henderson@linaro.org/
>
> Based-on: 20230503065729.1745843-1-richard.henderson@linaro.org
> ("[PATCH v4 00/54] tcg: Simplify calls to load/store helpers")
>
> The main objective here is to support Arm FEAT_LSE2, which says that any
> single memory access that does not cross a 16-byte boundary is atomic.
> This is the MO_ATOM_WITHIN16 control.
>
> While I'm touching all of this, a secondary objective is to handle the
> atomicity of the IBM machines.  Both Power and s390x treat misaligned
> accesses as atomic on the lsb of the pointer.  For instance, an 8-byte
> access at ptr % 8 == 4 will appear as two atomic 4-byte accesses, and
> ptr % 4 == 2 will appear as four 2-byte accesses.
> This is the MO_ATOM_SUBALIGN control.
>
> By default, acceses are atomic only if aligned, which is the current
> behaviour of the tcg code generator (mostly, anyway, there were bugs).
> This is the MO_ATOM_IFALIGN control.
>
> Further, one can say that a large memory access is really a set of
> contiguous smaller accesses, and we need not provide more atomicity
> than that (modulo MO_ATOM_WITHIN16).  This is the MO_ATMAX_* control.

I've reviewed as much of this series as I'm going to -- I left
a few patches for people who know more about ppc/s390 than me.

thanks
-- PMM
