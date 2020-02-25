Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1963390lfg;
        Tue, 25 Feb 2020 09:41:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsOiLDtUeJp0sxEKsT2EHe7pb1DtXH3s3t8TGWV8bxMMSxNm5aT/46jRp7mPzR06SjouPX
X-Received: by 2002:a0c:e014:: with SMTP id j20mr53750297qvk.165.1582652469062;
        Tue, 25 Feb 2020 09:41:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582652469; cv=none;
        d=google.com; s=arc-20160816;
        b=Gh5DR1//bHBKxx+P6A4K3+4sg0wBqdB17KL8M3d7LAltsyqB8/men8FpYwFZong+Xa
         LV7b/fCJT0Tg1qzn21WEkZ1bhumEVx/YS8FmEHs5Y6akd4/Ob+HgDAKakXJkRU64Psq1
         lwx8OPgT3b9YRMj7X8Ns4vSqlx9TQV9Z4bnnNV0YY/zd8lrdGfiWgTtuNAXIpC4JQ/hN
         P0YtTojvp+eicpsV1zsY8R57PQ0R2PAE1JezXzJpj8eBPL8SOIzm4V6Diw8ZGqmHjBPE
         10tnX9AnqOT3Cz8HDeY9Be4eLbQ4T+qB8eMR4UE3sLLCl1/SChAjkZ/c7fu2PDgS8bHA
         zu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pb+/U7imqyjzXMGZ86kKJoVY+oZrtOAWihXbdJqs4gY=;
        b=DI/H2VnDzhNbe8DqdebeweMHe6m1kiZn08ZRI/qfjq8ndnYAuxr1y5TbxrM/rBTLnp
         5BoPMZpSnmu6GqKJakW5/Dje1JtrEYdvNaGrQrJaAn2z3z92bLq453WBsH1vIV2bsGcM
         K6KE6SRzKB/Nyhc+9kQqQfsJAjywz4CdWjlm3r0B28ixzKptq1Mb0JbS1lI8CJgBL8FI
         FEwpAjkBkZ5OyrMcUhDNBt71X9kyEL0ozJKE/9qA91bwIj8tQjsYf/F7HHioFqtfMcYv
         KrkCY9bX1yg9UG6gvArZPlv1czE2co8/BmtC+yOgIU4enSqvKp7bcrUdWHWa1FhJ7gTq
         pucw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TkAf4wU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27si98974qkk.170.2020.02.25.09.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 09:41:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TkAf4wU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6eCi-0007np-HW
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 12:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6eCa-0007nU-FX
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:41:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6eCZ-00040D-Da
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:41:00 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33906)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6eCZ-0003zN-8a
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:40:59 -0500
Received: by mail-oi1-x243.google.com with SMTP id l136so157659oig.1
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 09:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pb+/U7imqyjzXMGZ86kKJoVY+oZrtOAWihXbdJqs4gY=;
 b=TkAf4wU3xzXpOmr3fN46lsAYoFvvcMGIMXblkykfUQVM32bVxlcSwTme3DJM9ANJYr
 jw8GSz7cyNdQxefp0/pgD0ly8yxzXBId0+o5pHbKNU3bwk7b31ssisUlTvYjkuIM+BOF
 n/HhTIsMgsnlEy7ACJSAlaz43GHhCQhg9aqMOm/eA7PgLd5+3j3LX2TTeUTZFxmq8xGs
 3n79Ir3U5jLJrlqLOra1ooVhjI/yCEdwd2W2qPxkCK7xiPRep9S55iLczSR9GBAdMXsH
 xTKQg/DIMstZhGIGNZ7ZV3Cpjv0Ss3urNBB4X6qGMnERNDpOMxC/YBbu7z/DvTFkeDOr
 cgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pb+/U7imqyjzXMGZ86kKJoVY+oZrtOAWihXbdJqs4gY=;
 b=ljCZlWbHbwpw726Bg40GqnWp3s+iyjEuAIRVe576Ux47T1VW0io3qImb2tpVI1QPvC
 MFqWgjJGYUhaPgobunSCEwImUGZiRvFILqbkp+RQi79/W5RJOjM+jwoc3JKgLKtALvEA
 ljnFauoVTvLriILyfIU1PQfDRgNGpzmbx1jF7Ss8OVTqRZkkNhW/qCJnTastJ1cEhleT
 8qxlB9VQAXoFjXemqGCk6dYzPJmrZEdF+YaHNp447E22B8wiAFhMBEL7TGmw3bqOyh6Q
 xciAnqxqn1ji6FqPAb4bV6GYnGQ7OeePcaOWcQBoySrQld0ZOTyuIYrr/YOvBPAXFfm2
 nUdg==
X-Gm-Message-State: APjAAAWHqCint4qGT9Zf3fkLBa5/QaZ8cO8QMX5XA9+XmMBV/ppqAo0K
 gULQLQ/UC5RVd6eET2050/BeUe1fpsnqE24OL/1/Yw==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr50497oif.163.1582652458251; 
 Tue, 25 Feb 2020 09:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20200224222232.13807-1-richard.henderson@linaro.org>
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 17:40:47 +0000
Message-ID: <CAFEAcA_EgToSVs5CqZAwMog=-ZT=-BSNWCgC3+9+jqvvG6m+Rw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] target/arm: vfp feature and decodetree cleanup
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iYIYuPExWylJ

On Mon, 24 Feb 2020 at 22:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The main goal of the patchset is to move the ARM_FEATURE_VFP test from
> outside of the disas_vfp_insn() to inside each of the trans_* functions,
> so that we get the proper ISA check for each case.  At the end of that,
> it is easy to eliminate all of the remaining tests vs ARM_FEATURE_VFP*
> in favor of the preferred ISAR tests.  Finally, there are a couple of
> cleanups to vfp.decode to make things a bit more legible.
>
> Changes for v2:
>   * Replace aa32_simd_r16 by aa32_vfp_simd.
>   * Add aa64_fp_simd, aa32_vfp.
>   * Improve aa64 has_vfp/has_neon check.
>   * Fix some "any" tests.
>

I've dropped patch 5 and applied the rest to target-arm.next.

thanks
-- PMM
