Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3878169lfc;
        Tue, 2 Jun 2020 01:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQuSNXrFkDMYE94x0BYC9/f7ng5p3pu1qnPsfA14NNYaXsoJtYbHBgwzo9Jk05XUqecgkp
X-Received: by 2002:a25:3505:: with SMTP id c5mr19039808yba.455.1591088354485;
        Tue, 02 Jun 2020 01:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591088354; cv=none;
        d=google.com; s=arc-20160816;
        b=vF4O70LGOoQepuuoGBw/LU9T1ic0i2DQjuFMRc0nj2iKVm7Ru3npKB9tHutew3IH9h
         3yTyT3XiSWY3ZDmXRpSBVEQ+yMKELCfkpRByofxozhTHdUgg4iQTYnIV9r1YOKtHJBHe
         F0dUZXDCwHIw/KlTh4cbjy4jJa48SVB2p+yagx6KixljEcCr3yiQ5DEJ+ERSvDK5nDPD
         BDoYjryql0ng7NxlTy5dRD99ohoy6IOw1di4F0OWKU7/KVdtl9uFOzgg32fZ4jRIlkfw
         +N6+G0LzGrigr+S9Fk2ZLRwBJIOAZHN6Jr4Tn5zd4fMjuRwgl6obyVwYNtSz1b5+lYey
         lznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iHO5jShazTDsI7/JF6fXAn1gfieZIHrI/ms3Fsh3d9I=;
        b=OH/TlKdX4hzBITlMtxyKVI+TMUpgS2EM9sxOdqFqE7V1Kt7YyQa1GGRNz5I1ASKWXs
         gHyUQ1BkxCn+bJmp+9bNPHd7BFR9y+w5pdSXzhy8+wDSS05KjOWBdmU10D/DMjrFVUkb
         LZVwdFq+SK9ZOcwzN2cgI+lKPFO8nbnk98h+qeS3La7xBTz9KFpm4wtb4pYFU9rpkyaW
         vzrMQUxNqsU6URr+38HiAr37R37OHQ3hpcPBvj3aukwYLh8W4WUz1LHIFSEgUb5g66ys
         pe+mAwYfh21XdwUDB6pTZJpaW1aWTKlF9imqg3qrpDnmfi1+eV8i2Rw3i3NUiizbIunK
         aKhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WGdrOXgD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si1620987ybb.243.2020.06.02.01.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 01:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WGdrOXgD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg2lN-0006vA-LW
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 04:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jg2kS-0006Sv-VW
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 04:58:16 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jg2kS-000757-1Q
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 04:58:16 -0400
Received: by mail-ot1-x342.google.com with SMTP id e5so2972659ote.11
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 01:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iHO5jShazTDsI7/JF6fXAn1gfieZIHrI/ms3Fsh3d9I=;
 b=WGdrOXgDMPqchpBbxH4g1tixVwptD0nOMdka/aD2kiZn6SeZjzuYSaQZEnk77norkd
 WrR5XctNyjW2Djb87Poj5MV/LA8Lmmuo1JqLpLG0tJLo/KvBpRfVn2qwIGZeh7jSv9l2
 7evKRmCK70Xh7vQfHQAdGFBwYoAdU6Ya2I8Zf1mujvw0ZjN3Fe6yP8x8JBcrnln8Z9n8
 nIi+rGYLUqWW8uNZeWUlBkn/kb2Au9FkxjgqwYlEFIlXjA4vNAqn/rpEEWG6lQ7kW6Zb
 fDIo6K4OeKHyx2ULbQydIagvOYRnLwMh2K+/dzG3y58Nc8aOKeqCkxhAbVWpm15plG1G
 Jjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iHO5jShazTDsI7/JF6fXAn1gfieZIHrI/ms3Fsh3d9I=;
 b=odHgfr9PZ7EsNFAODkQAwybseqI1VNYCjmn/NxtcQ517k9I9QrNQKkIalwgdokUWYX
 6mPs2fFuY8zlHNbM7uy+XkqEY32sEnwKvlCPs12poCM45lBFcmt6Aesemgw7JI2NvgES
 sdCR4A6sU/BqMmHfeqofuwwAjRgTt0HM25I3aCEzZ45sIGkdzIutLl+ePah32v9NeVmS
 GlxwDMqsR8MF4mVT5rjXh2G9Y9DyUxYBrM5qNtUgZLjjzb2GtJyLXfmONBPZLFLlLbbe
 5xLdRx9ZTGG+hg8EieSmqgcSkXOsmP8xqKv/wZQxeXlN5JKrovh9tGFi+Cm/47+3ka/S
 N/mQ==
X-Gm-Message-State: AOAM532Xxt6l0m8wkOIfae1JJF6I+C28zJHzYIKmXzOiiTvP3fMnRzcX
 ++S2zXGqrMDxzo1LSIc8U/iKyKx4fhbTxk1N4YYQWQ==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr2772448ote.135.1591088294698; 
 Tue, 02 Jun 2020 01:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200522145520.6778-1-peter.maydell@linaro.org>
 <20200522145520.6778-10-peter.maydell@linaro.org>
 <eb20b110-d91f-21f7-8726-d254a828b0df@linaro.org>
In-Reply-To: <eb20b110-d91f-21f7-8726-d254a828b0df@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jun 2020 09:58:02 +0100
Message-ID: <CAFEAcA9icWyJv_u04Rq2yJQMM59WcnJuO4j1gqnUPvvva=rL4w@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] target/arm: Convert Neon one-register-and-immediate
 insns to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gP6TW2HwQlDo

On Tue, 2 Jun 2020 at 00:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
> It might be clearer to use dup_const for each case, which would more closely
> match the pseudocode.  E.g. here,
>
>     return dup_const(MO_16, imm << 8);
>
> > +        imm |= (imm << 8) | (imm << 16) | (imm << 24);
>
>     return dup_const(MO_8, imm);

Yeah, I did think about this, but figured that keeping the
existing code structure was clearer for purposes of reviewing
this refactoring series.

thanks
-- PMM
