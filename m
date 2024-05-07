Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp1902104dlb;
        Tue, 7 May 2024 02:43:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmT0AyBiOVFsGglScA+AAHcUdOPZva3mKVbXGF1fwmo2QSsu2k0xlEswtFZ8OXj6621uj8U5PDqaJXl1+FpFIwImIHYsGb
X-Google-Smtp-Source: AGHT+IESiw9U76B5FlxE98Lr0qADnaofOuzKmV0zgkvzQ2+npAj1ePObpzkuUZAtf6XJzsv6yh/2
X-Received: by 2002:ad4:5ae7:0:b0:6a0:a990:ef85 with SMTP id c7-20020ad45ae7000000b006a0a990ef85mr17378338qvh.9.1715075037845;
        Tue, 07 May 2024 02:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715075037; cv=none;
        d=google.com; s=arc-20160816;
        b=DQ3AIRIOPFj6IZtNB1LWKnPTWUZq+yfIuDr3CoqeOytO/wuUgoIVTS50QMwpGlWUNb
         C8Xq71jUZtt4/PhWB5x2XcX6ExVFLKl4ZNORg1JeOXy4ddN4T3GTyFy48krWtnrWWesJ
         fkizV6W2IdkWJCz7nTK3QuUuAjKEiEdgw1fx15NZMqJYu7QceN6NQutqUJ2tRiSNRLsv
         VoFey1gZkbCawy4ikAQBJ821br4HanWPyqi6rIoXcM47rFQJVDeCjmgQSH2fMKuS55ft
         IItrOKOnJA0QtuNIk13NZnBKq4tLEeu//vNtLZMwIZuB5WYXAdOUAxeWSyB/syo6V5jf
         4vtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xVsF+p+sXkKcJb/3iL2WMFEAO55fzk/3b9eoESNXz4M=;
        fh=9CBfzGI9narARvEouCqLQtr+6itT+J5CDFl8VyfTW3Q=;
        b=KHvWYi5chkHNS/3SKumKk/Cnt2K0OG4xs7DpCS6OteoAv0aiRFRVCxDS0AK1aIO4Uw
         50DlA0Tb4hk5u7fQIqaR1qoQpLE8/eVpTu9ug4kkv1jMVGSkWH1n07II+r7u+qgLehmI
         SovWhVpynsnpSkT5nHwPW9exdhI6x8gGZKE8h8rB3LSGcffvsSHFHXSzU+qq3xgbDP3w
         7637TUrrdKFwIcFKRC8l+cpTav0QtT1mKA/PSMpDYYnDajQPwjlFK/z/gurWcJN3JDlT
         ob1kxw2EGCt6vROa7tvjFUtCNTF8zUtnoYQHdeMrxgzIQg4GS9buMmnRPPM5wMn6cC/m
         fBeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqscTgER;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1-20020a056214040100b006a0ccebd224si11295693qvx.239.2024.05.07.02.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 02:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqscTgER;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s4HM6-0005SG-0F; Tue, 07 May 2024 05:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s4HM2-0005E3-KZ
 for qemu-devel@nongnu.org; Tue, 07 May 2024 05:43:22 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s4HM0-0007Ul-VP
 for qemu-devel@nongnu.org; Tue, 07 May 2024 05:43:22 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59a0168c75so742200566b.1
 for <qemu-devel@nongnu.org>; Tue, 07 May 2024 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715074998; x=1715679798; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xVsF+p+sXkKcJb/3iL2WMFEAO55fzk/3b9eoESNXz4M=;
 b=eqscTgERfbmwwSAHko+OK1Tn113CgytuwN4dH7HwPNh0ZZzLbYB4P1gJbjvv8gB9jE
 pYixPKNd16prNAan3ibSQxeso9yv9/CVEnY7yPxnYbDN/nf2Vu6V2+qArcUqb9VTuXkl
 EOn7vOoGGQqg3GE7BMt+cF9cwE0O5YewrIEcvly3DHexUUNlrDX0HCEkyiTYyJN3Q3mi
 g4DwGF1lat/bz6GGgXlgvmu4xW0eAhLFi4Q2hiox55GVVxnnGH2ZFyfJkQaySdsK/2sf
 ojFIxZA+T6BCSINRDBdx+3lX4Yxs4HQYztklksxn/0UJj8RlCmWeP+ghf+IlHjYrGJ/C
 1kdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715074998; x=1715679798;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVsF+p+sXkKcJb/3iL2WMFEAO55fzk/3b9eoESNXz4M=;
 b=fZloPNxugYpc7c7l9Zk0U8aTnbgWrukxVCXqRabZ44mGF/hJjfubUNSn9wBHw253vW
 g3DoNUGoNu3dBlM8uiCpoxZIIoon6lmej42tvgOsjQYgIPA4u4i7zPaCz7vhHN50mgeI
 cJWfr3YCmNIwbAxSG0inY4O3AWTwyYTIk4AOWlhPZujaoKhk52Dk2j8nGQ3RpQmeBTD3
 qG47QebC7CD1ATc2XgfBMMBhXLArp51aLZGHCZWhdL8MSEN5ohv51dV58SIpNDp3bmYi
 w1egpQyGaDRYlrVI++JVQCrRmJMDfISydg+KO8lTPPW2/bbqF4Favz6983erUcinlgiy
 Bscg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Dfj8z5N40i5A+Wmm2eAlO98Zm5o80YjIFSEuyUuhe0Jq1nhqw2cXSGYl3cxZHoBIZNSm9DHgpG1irrFVuhhwGS7kHBQ=
X-Gm-Message-State: AOJu0YxHyrkXNo8VzIODBPARW8uMy6VXP7QeVEaXl2/QQUFNM8Io0iuS
 cmBFPgpTNyXG/CwTS1KsfDYUE0S0VuGCCVibNN3jmrLmz3zyJ8s7NgHF60oBQEjfYZNxENn0ySa
 TMPOlqb1AnhI6WVbnAdPJqq1mMpBL8x4YJfxy5Q==
X-Received: by 2002:a50:ccde:0:b0:570:5b3d:91f with SMTP id
 b30-20020a50ccde000000b005705b3d091fmr7926980edj.23.1715074998248; Tue, 07
 May 2024 02:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240503153453.54389-1-zenghui.yu@linux.dev>
In-Reply-To: <20240503153453.54389-1-zenghui.yu@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 May 2024 10:43:07 +0100
Message-ID: <CAFEAcA9Jh9udZEa0ebzO--V+K9inA49TWf9jCv=Kn7RtMqhpZQ@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Fix encodings for ID_AA64PFR1_EL1 and debug
 System registers
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, agraf@csgraf.de, 
 wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DWt2jtqhtpIY

On Fri, 3 May 2024 at 16:35, Zenghui Yu <zenghui.yu@linux.dev> wrote:
>
> We wrongly encoded ID_AA64PFR1_EL1 using {3,0,0,4,2} in hvf_sreg_match[] so
> we fail to get the expected ARMCPRegInfo from cp_regs hash table with the
> wrong key.
>
> Fix it with the correct encoding {3,0,0,4,1}. With that fixed, the Linux
> guest can properly detect FEAT_SSBS2 on my M1 HW.
>
> All DBG{B,W}{V,C}R_EL1 registers are also wrongly encoded with op0 == 14.
> It happens to work because HVF_SYSREG(CRn, CRm, 14, op1, op2) equals to
> HVF_SYSREG(CRn, CRm, 2, op1, op2), by definition. But we shouldn't rely on
> it.
>
> Fixes: a1477da3ddeb ("hvf: Add Apple Silicon support")
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---

Applied to target-arm.next, thanks. I threw in a cc:stable tag,
though it doesn't sound like the consequences of the bug are very
significant.

-- PMM
