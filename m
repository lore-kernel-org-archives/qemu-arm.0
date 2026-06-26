Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4561AC43211
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:29:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd6c2-0008Ts-2P; Fri, 26 Jun 2026 09:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6c1-0008QD-71
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:28:53 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6bz-0004nd-SE
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:28:52 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-664345f8645so1235339d50.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 06:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782480531; cv=none;
 d=google.com; s=arc-20260327;
 b=P/V4VPr0mjhi3VbLiTKhm7BM3KfVXJFMMKy8pzHmcYyucOCw0/RlZf9Qbzk70woqt3
 p+RMRN+NexhDyLe4zfS/EA45fx1uf7gT2UIm2izy/Q4Uv+lk/mWgBwWAKItwCHylsKs/
 0oU6S7IzPAd4Oj2r81CyEmMBT8xTxNIJMbW56wOXJe3HuSjh6NrjV1lb8qsV/cdTms3E
 SQSCBtFXmnm7GgUYr8E+dQNiJrCTlPL7GnvMeTNACM3LI5hEYOR5WdAJ7dFvBzF4a/GD
 JShhjT9omqd5KeYxSf1WB1L+hRmEOUU7nLb4TKkGSryiJOgyf4DOaXAQ2pgkGaFuir+Z
 KoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=16rcxC9eKTWRh45+UkrBUmawBkQjl/XSO1guN6LYfy8=;
 fh=YAWowKZEEQncJqqeZoB6ctxuGFcdUVA1xJrd3uuEr/Q=;
 b=HcL0VoV6h1HgL4sZagvtHHRodSo8I59d3W5t6eVjiHLia8Lfwv9qrMo9hfQxiTbRki
 WLaNbUtkwl2Ged/HOD7ilWicWhdatQa8kTdRIkrwuuN8JD1li96puOihHrzKLpxdwNud
 Nl7tn1BdcbBoc4sBIep1sFqpAswKlQzj4bn8uHSjCYw7NOSzy7M8kZAijQ1I0IA3LzEK
 r0wK00XXNccMQkDUmmLAMc5rgrPm5AXI46qcQ0hQ1v3dWO6NBwycmuIm0oI/OBHamEcr
 3OAJInVRyDDoiPJdibPkaABtNp+hdIZhkxVnOTRu5qWUz/3QiL1PKYdhi3Wq6HsQU4o7
 ZNTg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782480531; x=1783085331; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=16rcxC9eKTWRh45+UkrBUmawBkQjl/XSO1guN6LYfy8=;
 b=YBfh7mOdU+tNKvRb1ReJmIfQ3bh2pzfl27NTPB6+ke9ugjR2591IHgQe9sVo1d+qGO
 y5MG726IW8b/8r8RsQlNDLCFzl8gRf/Wd3Zg06CKQB2UEarEolJTME6C90w/IkL3dOCD
 ukZ5RQJZHQm76ivL2GpyU5T17d0tLUgxA4RhwqrNFkZAIMAU1bMv54wQNAWUh5Sq/x6l
 xMHgXmE311+ZBEecmAGyu1iBq1imGhPWnjB7ifVLkL7lkboRj7J+FXkE0MXB6YMzRiK/
 zOzTE7boN4TD4nwWuIMJ5kP+/LEEGQsfeWLBCa7AbTbrXDJ7pYjCpSfscVhnu0ooe7UK
 uAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782480531; x=1783085331;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=16rcxC9eKTWRh45+UkrBUmawBkQjl/XSO1guN6LYfy8=;
 b=a+kFQR/Sx1nBBrpoixa9r+tikdinUeZbEyBxAKq2Gg3Zr03lzRbj/V0DDkFV09N/yX
 QN1bFq7hVMZ9z9P12YLSzRpAZBA+H+I7FjC+yzlh/Cki/b5x5o++eAogWhT5d1vBCJ3d
 72DwtbwvlKv2Parz9GCUtL+QJzf0GsAiAoFtv85FoGDFlDXvmg6UQuds/GwOsVAbdINU
 nonx3nRHeEl9djXqzibDyVASxzfryLYSMLthnGaIksOW46TPZpfRfjxnKgW6M77fTSk1
 Ki1VoepKk+g/XayqJEC7mQSyAupjxr+ja4Sfp4NthgO/7VrdA+iTjOI0qT7hPadeH7Le
 WzHg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrL7tR1THDc01/ipmXP5GkyFh5nEgKJzEYuXXEz/zt0/WqYdQ3ypW3vRCknEjkr6/wIL/BKDtknSA==@nongnu.org
X-Gm-Message-State: AOJu0Yy7TSwKi5BKebl7MA/jkOAKoZGVX99s/M+vql744vVopi1M4yVc
 imuO4Hb2kEk6DvOioWTBldTOOOD3md31z4lR2jXBHDzxLV0Ofj3V+kOqFP57XhX+VYkDfgLpV42
 qnkFgakIDMkA91Ekii4pA7NZJQ/VOxZtu8DgAwOCNUA==
X-Gm-Gg: AfdE7cnAbyeSdc3k8C4IC4fx7mMSVqCcH46rJLpVih1SWN1tWKqVlPo+rcHBDQSqlIw
 IvPL/LHoaGCReAsEyTrOo7dTWVNkmCzx84RHktOPVz3ks7WZRq4uGjvEq1/i+PGxMkzBQbtksuG
 psNdE3azC46O4frM78BY1XqWtmnlhNTRelLZnyqRD3D3TNnWK8ZUWmbGxU50xV16Apf01jn2BjO
 SvQsAxR6+K9SReG2cbFaqA2mg0v6YD0ebuTXtJpIycnYn/AIpx0TNa8LUjCahpsoRQ/XVesXC0F
 4FIX7064CDAlyJ6po7FyYSly/8Bak2zpx36Ww1NaezlYo0byqwq4394E
X-Received: by 2002:a05:690e:400a:b0:662:f9a7:e4ac with SMTP id
 956f58d0204a3-66487ad3f30mr5808494d50.6.1782480530662; Fri, 26 Jun 2026
 06:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-13-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 14:28:38 +0100
X-Gm-Features: AVVi8CcCFu1kIVMimi3TBAK3hQB4Zg7mwVn12hs8AohEK9baX5z-cQQQqZSgHy8
Message-ID: <CAFEAcA9iTYy0BHBiMWS=isNhaS88umkELtp117FTFk8A4rN9dg@mail.gmail.com>
Subject: Re: [PATCH 12/15] target/arm: Implement UMOP4[AS] (2-way)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 25 Jun 2026 at 23:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

