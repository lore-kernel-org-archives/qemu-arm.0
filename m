Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1392861ejc;
        Fri, 3 Mar 2023 10:31:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9XhDd9Ev1dICkBqBETXm8BY58isO5VTNdwX8gbURiVHPKmtjBLx/2yVUVi1clbyEFuQfFa
X-Received: by 2002:a67:f9cc:0:b0:421:9426:cae6 with SMTP id c12-20020a67f9cc000000b004219426cae6mr1352281vsq.30.1677868288549;
        Fri, 03 Mar 2023 10:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677868288; cv=none;
        d=google.com; s=arc-20160816;
        b=W02aFREqRyhnGAWT2MB9KpO+qSXptdV+gHJX9Vwvd/zlMZGYYO8t8xPYoYxfTa73GA
         wLHtSyVo/N669h/gN1v3qG8E6u9XHtSyMRgGi6NN51Wku8FQ5a+97WlM3EOPr5EvR2A8
         Lj8EdzSUSzYtmIxdmeGlP88rohiezP6ikqCGEWcOPGMXQlKfeU8DhQfnVp+GJfJlgY0k
         YAn+9oH1AHJdb+s7xT/WNfApvy41sAxfdqsb+Qg2wZvLvfExHYlktKH6N6euhs8bvteL
         PrUNNm3uAQe0LvsJt3KHnr8K78TdVyJJetZY7Kk+qv7unJrKZ91aaWThFR9iSkqZx2PA
         Ubtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oZux0quuPx+Noz6V7vLj5a41efC0tjDhtOCWCzoNsuE=;
        b=GDerxkH+98Ivowipi5iPtGU/b3FMSLCQBvwMaHdmyz0iSfSt5hmkJBSlCSBoRW/XYe
         1UWtLs6h6VnzkG1cLO3kuTXqlxUNVcdv93ofk5eoZNnWhsbrrgJhPiYWIg9PQAeFT6St
         qcoy1JKbcQRLfjx9vvajR/uVjyfoIJJpFeyosoV3r2qx5D/6Q53AX0KLRqD1r2o8CmlA
         ewTu8KC3Dd49N1Dok2H5qG8Fvkpo7kwqOTq7m3aWx4WcxYIf4BpGth64ePdRKm93Aopb
         GRgJwXchRcr9w2u1bpywQNAwNPINJ1g+7pLTWlOJVI0bKZ9d+EXuTnVZGTkRr3xIh/Aq
         PgAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5aDSXUm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a67f747000000b003e91e54c1d8si804411vso.701.2023.03.03.10.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:31:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D5aDSXUm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYABa-0005Go-Nb; Fri, 03 Mar 2023 13:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYABX-0005Cu-8U
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:31:15 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYABV-0004Dr-F5
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:31:14 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso7073736pjb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868272;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oZux0quuPx+Noz6V7vLj5a41efC0tjDhtOCWCzoNsuE=;
 b=D5aDSXUmqstiusj/TI3tZWl2LjCg/XUE1lwaYqgR0OAUy11XiglPdPkPKgWr2CRwdy
 J3KrXMHdeoiAX09KW07mpiDU+i1xEb0M/msR7vUpqFFe03w59NyvilWnUJXDl+tNRbmd
 MLY8yfMlH4vtHz9YrXYoTWaBF48j+67jIl98YSf0U/DTGzGc8cgqtBPzZj3h8y227GUj
 ySi7+SCa9H0EwVtouxcFC4gRRDMhZsH3s+ADuwdCTQqKWcx7RtzAV26sIRLJNcUnI1xc
 98gXOQRYluYbOgxuly6gmleoqO3ABvAqu+RkH2AVH0tjTf8KnykM8MznfLN+DHnW/E+M
 b3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868272;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oZux0quuPx+Noz6V7vLj5a41efC0tjDhtOCWCzoNsuE=;
 b=kLXs9wl0uD4W4VQMbT+LON2vGgZD1r14akaz6vzRGSVfvNFgPPjtrq/eOPf9OKqlkj
 dHHvGd3EO+fhjghfQFW284niBjoItE6NdwCKeXi2GKDWjMjgUdENLJ/GK59+V0opJA6N
 q+uWQZ0bXGmjl6O1ttAR4n39uIQuUQBosvBXbovy7tcQpFSPivSbctEBDeHL79AFb2O0
 PtQ0+Hqv7pMfEGZAUu2FU94xYDtaxn1r1XgzoejVUFOAvwEDVe0eQXrmvGWMv3OcxbMS
 T9pj/llwgMZs9ZDsmqmPwY5/3j2j0p+VFnxhFvQvCTZgcxd1ExS/lSUghKiwVxn8uH6I
 IgxA==
X-Gm-Message-State: AO0yUKU2+FpPxBvzQNIuxUtKfGnQDRl/qILkhrPj/fpxw+f0LsdRdbUA
 uBzFADzyfv6adw1mPOzWggYFVjm9AMDLUqzUTvO7Uw==
X-Received: by 2002:a17:90b:f12:b0:237:5834:2808 with SMTP id
 br18-20020a17090b0f1200b0023758342808mr995198pjb.0.1677868271762; Fri, 03 Mar
 2023 10:31:11 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-76-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-76-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:31:00 +0000
Message-ID: <CAFEAcA8KF3ZzziqXSD1r_wcW9BRG8C+YtfG2LM=pUT9kma5ZRg@mail.gmail.com>
Subject: Re: [PATCH v2 75/76] tcg: Create tcg/tcg-temp-internal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: 0UU3NlyExc6Y

On Mon, 27 Feb 2023 at 05:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the  tcg_temp_free_* and tcg_temp_ebb_new_* declarations
> and inlines to the new header.  These are private to the
> implementation, and will prevent tcg_temp_free_* from creaping
> back into the guest front ends.

"creeping". Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
