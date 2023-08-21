Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp3471055ejs;
        Mon, 21 Aug 2023 04:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrG7S+tIoFLQDK5gTGw2VjMFduG0RaUeWL7+7qt1EOkswzK5KouixWA3tJ51aqaai+pE1+
X-Received: by 2002:ac8:57d6:0:b0:410:9b0f:e67b with SMTP id w22-20020ac857d6000000b004109b0fe67bmr2876084qta.22.1692619011189;
        Mon, 21 Aug 2023 04:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692619011; cv=none;
        d=google.com; s=arc-20160816;
        b=QDobwZ7Dy8BqeAOu3+qV3Y23nInpX0Yx3cfq9/SMdZE/hiZZ2jt0wK6zbXYB0Ak8d8
         qMzYP1sJvU/96jRkOo5DoCXjl8+JrBB7zGg3tB5v9Pngk/V21JdwV61McSYL1hiwFUva
         FW3wORIqIpkxZTVj9kyGQLtrBMcV7iV6rwC6/LFJ/9wvhA5x6/I9CZofaQs2jVlIPA/h
         eTM0geWLp5wXgEC9EX4V0t+20dXCr2tb7H2AaCa7/B4ab76tFBG631rbcnETsfU+9nLZ
         iM0+mvIVbSiS0t+QPBT88vcbESPhndeZtthZJz4HCWqClr71KN33rew70NTCeA9CNExi
         QEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BHbqbw9lCv5JbzlWO4/rmwrp+1ykFuyqXQjbq/f4UEY=;
        fh=qQktnNHMF63/lvoaUW87qKTlrnLutpTDl+gH+pSxVgA=;
        b=o85vmEPqXjEUFL4bDUXkO+/pJZzEqccSU9Pzaxbm0xA8yRRSgj/3LN6th+FSGuizZ7
         xmqDifKSBCnhiEXvfmKos/petIPpnujHV/AJXfMm+qo0vD9HN23t215bZSalCsC9CzP+
         /gu1wlZznuNDdbg6s2YzSBqV2/0HB8Hnj54cgimAVc1GBoUEKhJV3uZHoquE8JDPIaVa
         KHDAbrRXUs3zl/fVbvNuJ7rbHWTiphxqdYo5eW87cRqMw22QXnqtl5ir5vinZVpp5mge
         fJpEFoE0R/2KOvQUiW0B6EOIplK8/euPQrCsscF8I4EL59DJdBBV4PpLEX/j6iT8H9Kr
         Tjmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lcswyzAe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16-20020ac85850000000b0041092ca3dd6si1875012qth.306.2023.08.21.04.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 04:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lcswyzAe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qY3WK-0003bN-CF; Mon, 21 Aug 2023 07:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qY3WF-0003Tz-DA
 for qemu-arm@nongnu.org; Mon, 21 Aug 2023 07:56:28 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qY3WB-0003yZ-W9
 for qemu-arm@nongnu.org; Mon, 21 Aug 2023 07:56:27 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-523476e868dso4031353a12.3
 for <qemu-arm@nongnu.org>; Mon, 21 Aug 2023 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692618982; x=1693223782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BHbqbw9lCv5JbzlWO4/rmwrp+1ykFuyqXQjbq/f4UEY=;
 b=lcswyzAe8h2BcwHoioN+dlMVvqacPRm/sOyA6gsNCm8fWcopANlrAgP6SMxMOghiHl
 cVKdMMSk8Wrm+HxETFENh/iOYub35K4hs1Cr6VNTpFHRf3JIHLVWpzILa7aHJ6jLPlF4
 ewYaykupV4ElZmdc3fy/iuu/WFSR6fPsXGVNlAi3JOPNg3F7z3LaBbRrp+aYZ1Am4tWk
 uoDLSHbr1JF0FrM64sKuecjNxNy0vI9T5u9Y4U3ddDOhf6DezEkMtUoueiabRnQViqB6
 PJyylQD1FvwqSECjQZeOGXnxbLS28NRQnKp1xXqH6adUZZuZn2ZNLWNFyFaqmPmBFA69
 fifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692618982; x=1693223782;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BHbqbw9lCv5JbzlWO4/rmwrp+1ykFuyqXQjbq/f4UEY=;
 b=h76sD7FAZ9XGEUul5tjVj5aVbj2boYwNlBDeurwZ8q9cf1DUjpCHSgio2+v2+uyukz
 VbAmoezMoE0hqw6Cu2bld+rnHuB6i0icLRAEbYaF4EkMPX05+4Jh20rU1qRZUTnek9vo
 +dZ0t6Mh73jyVh8JgKhCd695Mv2WknxyqfYrcDWmVzM5bXL59z5Wh9sNIsP0TGsGOPaW
 El9+p/xLRy2mGuRiHc/CQwaRtMLMwBHbBa5SYiQLD1klgg+R/XjZdCj0wt9ipPBrS/z+
 zJfIFz/phbksFeGoFnlE4v+dnfPyKj3CN5P92+RfHJiXAt7fdWEpMyYinPLg1wn8/1h5
 vCdQ==
X-Gm-Message-State: AOJu0YwGBUF1V7tFVqhN6lGpceRLFARxqUe44eNsLlViEXvqb683ySFm
 38NzZu77vktMdhiQrbOEFIu8CGSso2rFSxhHG1mB0w==
X-Received: by 2002:aa7:d6cd:0:b0:526:9cfb:c12 with SMTP id
 x13-20020aa7d6cd000000b005269cfb0c12mr4985171edr.38.1692618982420; Mon, 21
 Aug 2023 04:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230821022025.397682-1-richard.henderson@linaro.org>
In-Reply-To: <20230821022025.397682-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Aug 2023 12:56:11 +0100
Message-ID: <CAFEAcA9n_AMw5LYdwhgmsGMRCzQ4uoEtxUyjQjhJp+AALVUZrw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix 64-bit SSRA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SB0EU7TCeBC1

On Mon, 21 Aug 2023 at 03:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Typo applied byte-wise shift instead of double-word shift.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 631e565450c ("target/arm: Create gen_gvec_[us]sra")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1779
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm-for-8.2 with the gitlab URL fixed, thanks.

-- PMM
