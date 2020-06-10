Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp268366lfc;
        Wed, 10 Jun 2020 00:41:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpZDQ3CoHoVUNvksEVSSFfk7JrD07hgZPtoVsgRXlEc1YeUvz/cJ+Paob3Z5UEBNq/X3bv
X-Received: by 2002:a25:3f85:: with SMTP id m127mr3340875yba.228.1591774896963;
        Wed, 10 Jun 2020 00:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591774896; cv=none;
        d=google.com; s=arc-20160816;
        b=xL6O4Aal1+J7PEfPQLSW2p+9eTTGi0z/GMKiyiMJzXpln8iMwLJXHeRvyI5b7abmpK
         Mz1L+rSlI1ENUJD65PMzkIAOJIsa0h/180+YttpFDOg7hcpy2xhIK7BRjOAZaYv5tUwB
         lXWtnIYY4Rx6Q6W0NxL2mXNAyinIQUUpbXFp44Iah+iL64/QDiSCYTeaUT35VRpcavl0
         IgDEG1vN03rxwuZfO4Q2hop0x7KGw/4MXWSzpDADR8KIfPxtIvAdSDd6wNHkT56sqDmx
         HKZMBciUW1MTnKNHC5g7w4mQB2Jq9a7DjzUo1P5ngRLPmKXYXtoOrqkUVGh8Pthgmnvv
         JOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cfO2pRBMUea/f08k171Tm0HoqV/aqMV1dOcb4YJRjT4=;
        b=OJNLYo39Vuziym7Wm58RJpASWSTgAEotr+tMxRcdStAXVVwY1NnBffjQMRhrpGXjyj
         uB5z3qAivw4aBdXCueQ34ZM7wOCjNuVoDtm/caWAY9tVTeCoA1FMR9ZQAfRQCzRNfeFL
         2jfiVSm0StBpzCxFr19ZfnBDLApf8SyYcEe6aNhKY2nbfsN6ztIDiiAA8hI3agj27yLg
         632SYFySyvoTNNPzt2zgkxY0/WUSKy8qp4C5+FzHlifG7aYv13EPLPwuigjqJ9xeOC+6
         IdhFRUcMnaYIgLsyjZk2fcOXoxOo0BZcMhqZK32o2Xirq89D4QlZ3rcX8CAdQ2rfYeje
         mAeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="i/chn9dk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15si4628551ybs.467.2020.06.10.00.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jun 2020 00:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="i/chn9dk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jivMe-0003V6-Ax
	for alex.bennee@linaro.org; Wed, 10 Jun 2020 03:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jivMU-0003Sm-5C; Wed, 10 Jun 2020 03:41:26 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40470)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jivMT-0003Qf-CR; Wed, 10 Jun 2020 03:41:25 -0400
Received: by mail-wm1-x344.google.com with SMTP id r15so835115wmh.5;
 Wed, 10 Jun 2020 00:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cfO2pRBMUea/f08k171Tm0HoqV/aqMV1dOcb4YJRjT4=;
 b=i/chn9dkJ9I6L0WcyFHf14vz/I9pINZYnQUCpNBxpp6SKsGm6gs1DPPgTcidTbRF93
 EilJKmCBJ+tekmzjBQHw4B50iDuxeWc/w+wOO2pBLUbg39wepHuN7jRFJLJLf/TJiz5S
 n63JUDUoBzG8ATF223O1EsXW2IuI9W1+q0/wXQEewDZCcmtFQJZ4pFHDSwNxJR5MrYJv
 SdIRvarICXDSRgqneItQrbvActeSJcjNRkKd1FCJacie0hnV9VlXjOChmlD9l0/TWVe+
 Yu2UdF7X02XqFh82Gebrnj2u2rpbUhgkxfjStgzx7eV4/XXLPto7TrFv6aFNOOTlG7d2
 3Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cfO2pRBMUea/f08k171Tm0HoqV/aqMV1dOcb4YJRjT4=;
 b=Ou9KK0pCyMiTdp/KQOr654tcJlNg6XP/u8tDBrYn7m1WjC4nWMUBxr5r8/ysbh2WMd
 l82Zd7b7K1WTkUDjWqxg1GnvRs9OrDyN91NiEMYDd5tzEPEks70JOVJ2cxEcJ3m0QELZ
 TR+6ZZEtExWcdSKWLSNHFr9EaNqtTdfhKXkg3NhIZCFUiUESvpXSxSZYZQ31onwYoN11
 bFA8c4+myDawQz4Pm9VDcWhWxk2Spm4b6RtlHO8fjnM+ud0D/H7cJRriw6VUmWMeciUX
 OA8+v0nsjOb30XWl0Cqcg41XalD8FqiiRm8LThBO1NCd4hjlBJnXVL9SgXVhr/5oEIKE
 iJKw==
X-Gm-Message-State: AOAM532V3U/K2AD3D/Y+vIIqBIrOMin++vXKZYTKBUIyRA+jvzAYpZe1
 6jbA9ag6+Kb9sZWu0vO0yTI=
X-Received: by 2002:a1c:4105:: with SMTP id o5mr1799062wma.168.1591774872482; 
 Wed, 10 Jun 2020 00:41:12 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id x18sm5633596wmi.35.2020.06.10.00.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 00:41:11 -0700 (PDT)
Subject: Re: [PATCH 0/7] target/arm: Convert Neon 3-reg-diff to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8e374585-bbc4-1850-a836-4f02a06a55a4@amsat.org>
Date: Wed, 10 Jun 2020 09:41:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +t/bAwISn36F

On 6/9/20 6:02 PM, Peter Maydell wrote:
> This patchset converts the Neon insns in the "3 registers of different
> lengths" group to decodetree. Patch 1 is a bugfix for an earlier
> part of the conversion that's now in master.
> 
> I'm definitely finding that the new decodetree version of Neon
> is often easier to understand because we no longer try to
> accommodate multiple different kinds of widening/narrowing/etc
> insns in a single multi-pass loop: expanding out the loop and
> specializing it to the particular insn type helps a lot.

I agree. The TCG ARM code is well documented, but the decodetree
view makes it easier to review. Kinda obvious when you compare
with the TCG code in older QEMU architectures.
Personally I also find it easier to set breakpoints.

> (Or maybe it's just that having to read the old code and write
> the new version means I understand it better ;-))
> 
> Based-on: id:20200608183652.661386-1-richard.henderson@linaro.org
> ("[PATCH v3 0/9] decodetree: Add non-overlapping groups")
> because we use the new group syntax to set up the structure
> for the "size==0b11" vs "size!=0b11" decode which we'll fill
> in in subsequent patchsets.
> 
> thanks
> -- PMM
> 
> Peter Maydell (7):
>   target/arm: Fix missing temp frees in do_vshll_2sh
>   target/arm: Convert Neon 3-reg-diff prewidening ops to decodetree
>   target/arm: Convert Neon 3-reg-diff narrowing ops to decodetree
>   target/arm: Convert Neon 3-reg-diff VABAL, VABDL to decodetree
>   target/arm: Convert Neon 3-reg-diff long multiplies
>   target/arm: Convert Neon 3-reg-diff saturating doubling multiplies
>   target/arm: Convert Neon 3-reg-diff polynomial VMULL
> 
>  target/arm/translate.h          |   1 +
>  target/arm/neon-dp.decode       |  72 +++++
>  target/arm/translate-neon.inc.c | 521 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 222 +-------------
>  4 files changed, 597 insertions(+), 219 deletions(-)
> 

