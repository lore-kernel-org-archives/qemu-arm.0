Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1698201wrg;
        Thu, 23 May 2019 06:04:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqze4fVmFxUWNh0wn255mQReDaY5ITDo4ueb+00C90uzOcJROX1TlgtXGPPhWIFS7lM94+sd
X-Received: by 2002:a50:94ed:: with SMTP id t42mr97842046eda.288.1558616694699;
        Thu, 23 May 2019 06:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558616694; cv=none;
        d=google.com; s=arc-20160816;
        b=Or9W96SCmmjyZa9DJrTtqUnEIk8/Lr9yo7p8WDjpJgk0AzcsAJrnLgiOHzdJDO11SU
         ZgOq5kxwxsLWkVcv6L9lXoIqk6SjVUDvQOgjZdvOC1fdZG+HEkdPty8fwKg4dstdunOq
         j2nNg0zCbjuvk5jNw+gCiHluJjfeGeMo2E65+MSz9ImfVLM88GuZo08/emXwFiCU+MpC
         LEW/0Q8eVsbHkc9NKwAIcJi9dd+0+8+otGDdNTuZb7Vewj9sNHctpXx9ZL0DVwJklQ91
         AhVl1iIFHEhVFezDD3xlIyQQ7MhWRj23IGQOQA+DpKiJPaRtVuLPiyt+7T4OpUqh/+vF
         6uOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WCZbm231T6KfNQg+7M1SkxtoT7Ba/28Lz8Z9KDsyuSA=;
        b=KVgEQsUtHjv2M/bKbily6NCKypyjuQ6eoki/+owUrsrnv5wJetPS0Zy0BEVqlsgBQm
         KdPpZz6seZBCVwFTe9Pcxfmp3kTZ35KNlsVDVWWfKXjAF1hwj9ku9vVauF3ssPSYRP5G
         Aweq/gLCgFpnbQVaz46F+D0IIJ+cFjSDaziB4q7rxxlK9LpEPGv6r2Dcm9x2YaTFCFH9
         XbgG4jbZsHRC/UhVei4SuTvHhZjxQ1YbFvAs2H2hd7g+4iuybMkzv1EjWCwo+mHqjMBZ
         kE2KeZ1MnmQeeeMo8FdNSzlF2XET0CxXDDJzOgWZI+ux76tbsfrUN8CaodCZlQZO7PVv
         pg6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kPFS3D3K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m47si1416809edd.311.2019.05.23.06.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 06:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kPFS3D3K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTnOv-0001VL-LC
	for alex.bennee@linaro.org; Thu, 23 May 2019 09:04:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTnH1-0003dW-Mb
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:56:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTn53-0001i5-QM
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:44:22 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTn53-0001eu-Kd
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:44:21 -0400
Received: by mail-ot1-x343.google.com with SMTP id s19so5263032otq.5
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 05:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WCZbm231T6KfNQg+7M1SkxtoT7Ba/28Lz8Z9KDsyuSA=;
	b=kPFS3D3KpxNwPDsVvRbtsc6FPt/C3eNMzyQovzZElgDdnD3u7dpEFYa1dEszjR0fJg
	hWQ3PJ5QTt/5+z93CDIXcRNFqGMy7gwx6fUhWWEZdzVKbn3Ly61VwgZU7h8kBQcQR+Kq
	plxMG3fqnK35fPKuDHnKsKB99bQbG0P9stESHnZxQqytNNgSnCtLPBSbo/x6YY7d/hof
	gFrHrDi/8V6t/w2jmI1Q3tTy30N6FFW/kgl9BkX6t6p393HleN2T89bqH6ybX9QFXoEj
	tHXT6cd06dgHjMk5FqxM0clIu1pJqsEpCUDCGgHfLybqb+PkvFZo9+iTk1p4ahqrxbQS
	BR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WCZbm231T6KfNQg+7M1SkxtoT7Ba/28Lz8Z9KDsyuSA=;
	b=VR0O5ExHZ5Zr8KR7/5aQbta5IUezpxytXI6ZGlb0Z6xJg4cYVkFxC3IfyeEy6rzzJ8
	J0HOtgyjmOFgXRdGZO5Quhsry61ZQlnACGVIUGRmANeaON0IxrJLOXR1nLRnzzsxZ/La
	OeafeXEuKTfihcxF84ep8/9bqtVO2zvlMHZpsiUssnVCCHcHgZBA/O2yzTltyL2yjimw
	UaGvxrifMGqpIKbxIuiVV/LGMS/thg+LM2zqGZ8vQEpdualvF8N6GIxL8hY5dM0J23g7
	n9TJO9ok+W5l5NMVTwLocTmU54N9DP0+MkiSESsnncsZaos509UO0+aXbwJBa3zG1X7w
	wKeQ==
X-Gm-Message-State: APjAAAV7ea4DQtIFrXnjQVA/Omeqqvi2uUzPSDjQNElMdMvr3jTXpNBh
	gx74/z3mMen2uze+2S9AkxIB5S+6QjEZjvWnx6LpDQ==
X-Received: by 2002:a05:6830:209a:: with SMTP id
	y26mr27825265otq.232.1558615460427; 
	Thu, 23 May 2019 05:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190518191934.21887-1-richard.henderson@linaro.org>
	<20190518191934.21887-2-richard.henderson@linaro.org>
In-Reply-To: <20190518191934.21887-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 13:44:09 +0100
Message-ID: <CAFEAcA8rbLn53iP8SBKpDju-5n=u8ieWW6=RF8t37nF0UspNkQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 1/2] target/arm: Vectorize USHL and SSHL
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SENhcfeSZlZ7

On Sat, 18 May 2019 at 20:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These instructions shift left or right depending on the sign
> of the input, and 7 bits are significant to the shift.  This
> requires several masks and selects in addition to the actual
> shifts to form the complete answer.
>
> That said, the operation is still a small improvement even for
> two 64-bit elements -- 13 vector operations instead of 2 * 7
> integer operations.
>
> +void gen_ushl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
> +{
> +    TCGv_i32 lval = tcg_temp_new_i32();
> +    TCGv_i32 rval = tcg_temp_new_i32();
> +    TCGv_i32 lsh = tcg_temp_new_i32();
> +    TCGv_i32 rsh = tcg_temp_new_i32();
> +    TCGv_i32 zero = tcg_const_i32(0);
> +    TCGv_i32 max = tcg_const_i32(32);
> +
> +    /*
> +     * Perform possibly out of range shifts, trusting that the operation
> +     * does not trap.  Discard unused results after the fact.
> +     */

This comment reads to me like we're relying on a guarantee
that TCG doesn't make, but in fact the readme says it does:
out-of-range shifts are "unspecified behavior" which may give
bogus results but won't crash. Perhaps phrasing the comment
as "relying on the TCG guarantee that these are only
'unspecified behavior' and not 'undefined behavior' and so
won't crash" would be clearer ?

> +    tcg_gen_ext8s_i32(lsh, b);
> +    tcg_gen_neg_i32(rsh, lsh);
> +    tcg_gen_shl_i32(lval, a, lsh);
> +    tcg_gen_shr_i32(rval, a, rsh);

thanks
-- PMM
