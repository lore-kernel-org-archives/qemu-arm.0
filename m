Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B0CD6E79
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 09:37:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWstT-0002iW-Ar; Tue, 09 Jun 2026 05:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWstR-0002i7-Al
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:37:09 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWstN-0007Rn-4v
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 05:37:07 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-6604176b575so4888680d50.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 02:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780997823; cv=none;
 d=google.com; s=arc-20240605;
 b=idy4ofLzuPnhule0ui2nOZJKrsVOOOGu39XioDt+vBvYtkgE5baPibXX+w2aHHDhGv
 K0YkZIMFIciaJTrlhrxljQv5K7xXBlTrVuTxtcg7HyucAm335b1lpJNpCYwXl1JsidSj
 AimXwitqp6u+tugiIQ/O2Y4Zy66ZIgnFPukD5zuSV+JMk6puXbhImROzpfKmJL2NMgFo
 syFZmKPFBMSD5eKlwfG5dN2ZXNHUUzhNPy+6dML0AcGU2PmaQ6+2ZeNecMJ4AAdQfqe8
 koOuwJosSktp43C6b6WJ3YTGDSAm+MdJfrFWfvtekuOjHszadqYpQHwcbC2B7Ep42MSs
 quKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 fh=lIo5rtr6wibDfTsZ/EIDFfCyByKvjm8RRM/X2gdX2WM=;
 b=CV/Cp7DD6oIFSgkvGWqmu5E/mHfBv6TphV1dHqrLoZO0zUkvbG6herXoI7OSnSMHBC
 VcuSSZb/lszxPD1wbTineV5Z1Mb4NIy5pvWg25YY2vkOfUYT/imA2k46C7Ue2RHTg3Bz
 hv22k2tltg3zFU2XmAfTwJHcmr91AXXEeACiys1zYPjn1CMYOKzNKeBwvAtV9m7w/zoE
 wmZi1Y9TXL+v9OCwWPoa918kMFZ8ffxYnof1EYWD/3imOJ9kMaYqadjZNwQkWKKcUDaQ
 w19806PpGZBJBbf5s/zI+TcxpC6+p6wbHh3nS54rA7h12MxY8J5zW5GpVLs35sLJdUXK
 jLAQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780997823; x=1781602623; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 b=QoL0og2/TVaIRv7pChTKVkmdpChH1X9REQ/KbsKKcuPwKALDG8G5lemF1CCbz9y2cd
 C/RI0wKqFhf/mfVqY4+/iLJvCdbLPkzeahjNEUCGgJwVnEFNutKVKKvcRhXAKGWNOOba
 vlSIUnuSEcGfyid4d7TYNlDqjvznBWcbzkgP16yeHdnT3nZSL3fsiQPc/OAcJF0eVN+z
 g+B6XTxXklKQFTei/6x9L+mKjvNtfpAQgRHuQMa7ETKtp5Vz5aQxJ9t5+t/zZ8QxmldQ
 Uhr3zYvwhD7ThXIzMLwIGWxZV5Tv5UMKNh/dmi0QqioHkxwpty7xKFtMU8OfsAqQq3I5
 68SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780997823; x=1781602623;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+0BfXHM21QnV4863C6uImYyGFFQDfVOWFUWijIqoLk=;
 b=b9eCwacoF+KESYN4qZlzFMuun8XZqi/ifV3nkI3rBdYlzipG3tzXm6EgqgcWtooruU
 LMIQNcEtLaVDNnzRuU5r4lzRWKDN0iriEFhV5BcTIVAZ2H3gZiJbwttzuCpXrKR//Xgz
 EGEZw0Vi4T+gy36gAb9kfgElKKMriGLPPb/5IOEkZHnas3B/n5MApHAoaR+Sys3ZIgR9
 1j2VP39E+MKAbhqVqWtMA8vuGEBOGR6R23KIP0pWuM4Nb+pgL3LojM+qiYYQqGg26iWr
 eb6HSh1PwCtql/eFDgaO35XhnnClotstspodN5AsOYN9/6fbH5lyK54Ne8mKCW/SU81m
 Nbdg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ElPwn3MIhdJmSN0SWzT1jBLSJ47T97kmh6kU4NZIWZjG6Z/k9UeETDkOZbYN71Cyc/eOOxKhMrQ==@nongnu.org
X-Gm-Message-State: AOJu0YxbAlnvHYKkLUE6z/YUhFqLOjUeNhcDbMFMsDi1N4mTlbXKN8ZC
 R1ECSuibK5rCV44gOSfVnO3tvdFMRTSikuhR+oNCanopcnxv94poZIhbeD6kK4K2K7VuNAT7o9G
 PnuowD0N5GjHR4zQ09hbPicHK1a3fVTsxp/BEYRUSlQ==
X-Gm-Gg: Acq92OFrE9+HPvUDCIiwpLTpdMtHo4OF8sefNILGTR52jXoX8adC6U62uUC+RDbE6L7
 iDWHvzuy4MoOa6YPyNuDzEhuKbFZiUEIIygSPVMbO61IsVLI7ZDbpN6HeDysDXkSLDHZE2jPgG0
 8z5c8Ksf/k0h6EahZKD8hdSyZvM6WX7ndRSAjNP/VL6iRxIVjl2JXY7pOWsJn8ddhXo2ucRZcAA
 rx5k2NugX452eNhgoitxiDcCezEog/JtWW1JtoqzDyyViA+Q+4c5U7hCgWu0k+Oz+8xQvKCxK9m
 YrrANq6fD1Li3yaLX/Ma9FEN/lZwdlDTY+gSZmBJDycJj9cPrwlDNGM58p0DdqTLqdMbE0aNkuB
 RWg==
X-Received: by 2002:a05:690e:1762:b0:656:ad2e:9907 with SMTP id
 956f58d0204a3-66106f56450mr13771501d50.41.1780997823455; Tue, 09 Jun 2026
 02:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-27-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 10:36:52 +0100
X-Gm-Features: AVVi8CdPcPU6FiiIyB-180ACkYuxcLT3XLwgrHQaxdiQ8vvI1i4p17Yqw6_I2lQ
Message-ID: <CAFEAcA-vzc2YgqJhKvbANafBT6NNChekJ30VTH7QJ+4gQX0j8g@mail.gmail.com>
Subject: Re: [PATCH v9 26/45] target/arm: Implement MOVT (vector to table)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

