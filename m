Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1734161lfj;
        Fri, 6 May 2022 04:40:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrnYs9NZMINLX3DEU8iARvxYOfuAKpLLVAy5W+QYwQwLE9kgGahk9zj9L+X8vxPKEmpzQO
X-Received: by 2002:a05:6214:d44:b0:45a:8b80:4239 with SMTP id 4-20020a0562140d4400b0045a8b804239mr1986946qvr.10.1651837257361;
        Fri, 06 May 2022 04:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651837257; cv=none;
        d=google.com; s=arc-20160816;
        b=PlQMn6/shhTopwVxx89Fqv/ilJGjAUrgtWmNbvJoGXDVXin1YIkjopLbKeKX51E+Af
         SzKroyw86q1CUuXAt/tQjiHERUiEtzVhoAHdMpZZESobuIJqWVqkhEJqF+jy8Ak2mFUm
         0mG8WMI0y/hznVP2Jf+7BUekY/4E+zujtSb+3gONBh0fV4xpoQs2W4y6wIw3lOMWQmTr
         8W3IBLkXiChsg6UFLdOWhhn+v+tsEnKAE56Z1OWz2/vROorikgXKnGaDUkNa2S/oAlH3
         RZj5Er85iwjmyshp+PLg7iIv2XCJzaCuzZrG/5j0Me6uecQ/PPvpho5ZMBBeQ/KvBN4U
         g5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4qv0oi3u5b2ScllLPjMmYbzzYJRrnPViQxbHp1BLp+s=;
        b=Vxj7FIVFanAgD1uBDpnoVsPli7s81igLv6SgRQeOpmcaR+8tgPeFZWA7Rxq1+5Z2aQ
         jXn32Oqck8M3luM7Pds0GNmHB7IiBxHSm0N9Eq8svlKrZRfAN94HEYnYsazpJnYAotvK
         2k6UaRMhDTnTsktN21jwmqg9NM9B867RgJfWZYVdQRWfZG8gBcXP0VWWR4unngFRW7WG
         fQ8OGX1TFXFzC6oT8GhUDv4jWjfZ7mpqBf2Y1qlYn0h9FNmI7QKE86hx9GjMWcQ8OUvn
         HIfTw+TGnzwzQxZ5V21Aid8mwH7roI2vu6xl8EXziCSQmDUHqXV1X16pUfQ1D0lQW+P+
         xaEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vaQQ15vr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4-20020a05622a00c400b002f399378de3si2192927qtw.218.2022.05.06.04.40.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 04:40:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vaQQ15vr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmwKO-0004Xn-Qc
	for alex.bennee@linaro.org; Fri, 06 May 2022 07:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmwGt-0001vf-Lc
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:37:20 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmwGp-0006NC-8Z
 for qemu-devel@nongnu.org; Fri, 06 May 2022 07:37:18 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id v59so12317516ybi.12
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 04:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qv0oi3u5b2ScllLPjMmYbzzYJRrnPViQxbHp1BLp+s=;
 b=vaQQ15vrYazkDEsO08tpG7Mrm7+7mNaGBZEr96jA/nz0GZZIek/c/udqqhbq+TlmSh
 FwApL7qv6nS0MYwHXeyoWn1iRJ/HVv9b1ay1WshwFwhDDwIYH+l3mm9nAOuXD0ZSGii1
 2eSKFFWhRSDkke7+P088K44aRVmx3qtmgRfP5PsoYhnutflHLmHAbveQlrEy+mQoVdHX
 5PMChAUbugPr6mRbmJSGjSjk5PqgMdqXEMq/1TrM8McRMkYPLqwplHhNsbULd+HGvSFQ
 upWzAOpv/UZEFD6yOSSGdSan4YfHb1YePVRNQCETJ3NM+vdtfXUq9cI1Hzg6TWmXcuPQ
 iaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qv0oi3u5b2ScllLPjMmYbzzYJRrnPViQxbHp1BLp+s=;
 b=yCC97sHjjCPiWgxJPZxiyo4L4pxoxpVVki+/mGhZVx77gMI3IuI0B7+yeqZ/B3rDRZ
 TxUInu60MPKl1EFB870l5lw17dtFe5gYQ+NWojI1ntCBEHvCpK7OsIJrKNjPZMvrzSRC
 zSvxyaT4pYDXwWB+idk2qzLsSHFG7bZkch90AGnmwvRKv+uABclSqB8G7bKUiDVgvc7h
 b2JgTZQkxSzNI+g9JrR6Xyq0+T862HFoAqdIA7sys5qRvdcAaC9LV2MHRDzgAWx4jfD0
 SSBTGHS2774Ox1uNfKfcMNTOoodNrYQ+WbdLqGaKcj3SHszKw43GX4bOKRE5q79uWGxB
 Udvg==
X-Gm-Message-State: AOAM530tawvr79d934gixbnfruW0CoKUCLWTd6K2NtIRIBdXDfgSUTnu
 /XgcOCmgRcmthUWu7Zd2uHXtxbdRMnuRSJ5FMbZnGQ==
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr1925350ybs.85.1651837020716; Fri, 06
 May 2022 04:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220505185006.200555-1-richard.henderson@linaro.org>
 <20220505185006.200555-3-richard.henderson@linaro.org>
In-Reply-To: <20220505185006.200555-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 12:36:49 +0100
Message-ID: <CAFEAcA_bdHdyJOLGdxNKsyS32GeQhKRnb59v60Gg_ma4NMS85A@mail.gmail.com>
Subject: Re: [PATCH v5 02/24] target/arm: Drop EL3 no EL2 fallbacks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YLq/Ee4pyZMI

On Thu, 5 May 2022 at 20:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop el3_no_el2_cp_reginfo, el3_no_el2_v8_cp_reginfo,
> and the local vpidr_regs definition, and rely on the
> squasing to ARM_CP_CONST while registering.

"squashing"

This patch is a behaviour change, which I think is correct, but
it could do with being called out more clearly in the commit
message. Specifically, for v7 with EL3 but not EL2, we used to
register RAZ/WI versions of all the registers in el3_no_el2_cp_reginfo[].
After this change we won't, because we only register el2_cp_reginfo
on v8 no-EL2 CPUs. As it happens, this is correct, because
(as described in the v7A/v7R Arm ARM DDI0406C.d section B3.15.3)
v7 treats these as "PL2-mode system control registers" which are
not supposed to be implemented if the Virtualization Extensions
are not implemented. (There is a weird special case for CNTVOFF,
but luckily it boils down to "it's OK to just UNDEF it".) But
it is a change from what we previously did.

This would be a migration compat break except that we've had
a bug for years that we haven't got round to fixing where migration
of 32-bit CPUs with EL3 implemented doesn't work...

With an improved commit message:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
