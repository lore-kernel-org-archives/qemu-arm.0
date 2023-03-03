Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1412393ejc;
        Fri, 3 Mar 2023 10:51:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8lP0Vqla43NwjgihcdSX6T85N8wSNa6a5rsJ3vEPw97ZSG50n1FVnRJhpBA2upC1rJMKrs
X-Received: by 2002:a05:622a:8:b0:3bf:cfa6:55a1 with SMTP id x8-20020a05622a000800b003bfcfa655a1mr5120504qtw.12.1677869512355;
        Fri, 03 Mar 2023 10:51:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869512; cv=none;
        d=google.com; s=arc-20160816;
        b=iMy/jAgG9EcviHJNuiCX5DG/ncOrUqRA3Nr+ows5kMbT+O01yLFgzaZ3DsryYi/Qw0
         fCCjen+VfNOr22pkb5wuUZ4tHCeuV8wktdJTOxkcOULzAwhF9VtO2EVZ5YY3Or5E/3XJ
         eP4iBTkI/5pDkG6YeJ9LpsdpJ+ElgrjXia9Fob6X0WtaH2FsU5NVsZio1iAeVxJCdQxX
         fTy9ojnbZELVKx0QwDu/5NvjyG5QUIWS/6K3/hX9mZnijP0xi8E/wRyQVVbO2CVQ27UP
         Xi538z0egLkf9bSL2XYK2KtvYEay1vrak+52Ehne8fdlmt/LRwd1MJThfnHgQi3ywkYE
         jpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ALPUL8uwoAfU/QHFL9aVWTpTrYCD1YH4dCYE+cs8ML8=;
        b=UA9oA63VFXD18IJwBx4tDjfqe57QXKmYfTa0xHYhsH6GuELYo9cRnTiBVrgzOIdnuN
         B/mZB2N3noUtldUP2kUfY9HxCdB704MCvdLgAQV7fioOEioMlTltmO5NEd6Z8pqzwuAP
         Ycg4T2kYTry9EcLv8FJ0wX/zfx12QpreO+uL1Re2NomGcqV/VSX+MzJaAh0yjXWPsMXE
         gYsL1jzjl8iOwDqxu5AXZklBUeEOIv4bx3AiGVPjg8hMp4SnSs9/rliSjyq0ikQJns1J
         NEC0wiB17F9d3gIBH+fZClnz9KnZAHmnAoXTpaadjPIkP+EvebCPRyzl9EZRMfKW6MUj
         waTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iih0BUNp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194-20020a370acb000000b007061c7f865bsi2160229qkk.5.2023.03.03.10.51.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iih0BUNp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAVA-00029s-FR; Fri, 03 Mar 2023 13:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAV8-00028D-F0
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:51:30 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAV5-0002R4-QK
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:51:30 -0500
Received: by mail-pg1-x533.google.com with SMTP id d6so2080293pgu.2
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ALPUL8uwoAfU/QHFL9aVWTpTrYCD1YH4dCYE+cs8ML8=;
 b=iih0BUNpURSMD3E52jp+EUcAciKINeqr17+i6O5Z9xPV4S6jTEWwcWleL2aw8SiFT3
 +lAAeViha8T8OvAN6LWhcxfJHI2Car9clbq+uLELrfOmhd+Qi1mFKmsOqBu4xiUwt/19
 s51iKCZkZ7dFvcyhErb+QtluEPlEk9od5NyGK3eefvXmVWjX3Bt/E+VMsBjT3fwMphLj
 ii4gpYq/P4uNyHX+nHs0cG3fqzQ3r0Hdw4ERn64V/gOyTSlXhRZaKbs00hddwrPWhYQZ
 0jc7srZOawMidx2MyCSWx61ZL+LDcZq26YsNkrcgpJQD4XXD9a6RXwHxZjdRej7u/zgx
 7Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869486;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ALPUL8uwoAfU/QHFL9aVWTpTrYCD1YH4dCYE+cs8ML8=;
 b=NCfPLWYxSVqTHqdLntXRzWdFfI9jxOEUIVLyFmYCcCMbpIywJ8+Gb06/J3WcXziqpu
 +RoGtzAujN1ISt+mM6mgjm5n0pOTyv1FHX43d2v7ZKpL05cy1ZGJKKAPlWcyulmtOJ3s
 trDnhfVrAxrtFB28UyClwucNECxvkGGV4PHYb+CXBj33qLmEu6AJL3w6bDDo4sSmZxvA
 Z/MLUDWdu6JNuBLozUDyNkcIhx5s7kITN7m4isrgECOzA5s8mmVFguIPQkTiuDPgkOFh
 pXOBfcBGYAgfInuJ92pW9eAumla2sCYVwoIn0VBXliGrJCk89BqtmtIi5aa2FqJ2vcPt
 66JA==
X-Gm-Message-State: AO0yUKWrsX3nXFOsVpeb0lpQ9057B2ts8Nmirp5u05d4h4naIN1wmkC7
 vF8P2g88ELs1cOR/4gRarudLuExhgbAsRlp1Ac2scw==
X-Received: by 2002:a62:8348:0:b0:5ef:95c9:6a88 with SMTP id
 h69-20020a628348000000b005ef95c96a88mr1312158pfe.5.1677869486290; Fri, 03 Mar
 2023 10:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-65-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-65-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:51:15 +0000
Message-ID: <CAFEAcA9WbT=8a7PnZh+cmDWU9EeJbv9dcM7MDMhcpUWN3m6VUQ@mail.gmail.com>
Subject: Re: [PATCH v2 64/76] target/sh4: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DLhNM1HxmSLW

On Mon, 27 Feb 2023 at 05:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sh4/translate.c | 110 -----------------------------------------
>  1 file changed, 110 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
