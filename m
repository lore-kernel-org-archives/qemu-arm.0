Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1862502njc;
        Mon, 22 Jul 2024 04:57:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXmHYf9Q3C215ZPLc2BY0xKdqvDBiK0GzxkiPblT2CpRecvr4xaVgR6Hb4v4DGJqXGl7XZQk/h+HK47OyvEflEyAT3Kikp
X-Google-Smtp-Source: AGHT+IFMHCMD9Q46gFS7Of5W3hZjMM0OJGZaACN5RgQM+2whtY2+iYltKjKkxLmllzUQSq0ywK8X
X-Received: by 2002:a05:6214:224d:b0:6b5:4e07:2a55 with SMTP id 6a1803df08f44-6b95a6dffbcmr126579056d6.29.1721649453793;
        Mon, 22 Jul 2024 04:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721649453; cv=none;
        d=google.com; s=arc-20160816;
        b=Ia6BTF+1+cXrJOs5AAJQ9Zzi3PrfU2g6N7zTEyOOBdKL5xDp8pg0HfX7BYWcq+YEnH
         stlSoQ//+mZ3eMmB7hdSRMhjJRvW4IDwzQ2yRDH9oRtpTC2UBTLS+y2zFtsOvm6L3imF
         kIhiioh/B8Zc7dYiiI/g1F4A2//jEyBKwQcCRuLuD3Z7PZ9fxnXD10pcmWE+mi0+LHqW
         +ZO1Z6f0+zyMOnvnRhvWFmI0neQWR4w8T5wAmRLBUoyXihraS/cHB0WgMPJBMvJ4QURE
         lrlOzM7iRuVDPV6sCxB4coCwzpPffXa87aXdlk62dvsTLFp8oPhTv+3W6k/epSKqQ08Q
         b8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GW53BARDoHWD00cOBNaBMr/nIXFp8X8VrLnIPXNfOYc=;
        fh=F6cH8hrXWmLTuYs5dpktS+pHxjR9+IvRkNY9XI4aRF4=;
        b=V0aIT5hCoHMRcJO47HO7UCJ8y4Kb50sdHEg4cFBHvy/3iRY/QGv49JVIeBVLfgm/Bx
         Vrz2eBkJ5KfQNumC23wIThrulwbsfuAaCciAUsVWkaGEIV+iY1uzn2PW3NLt2zdSzBM6
         GdSNuaHT9j6ORaZMIHuNvWOVi/OcpFPkMmP1Zx/W3Wdc1+Z4/rjAHIYbeMTxigXgZft/
         a0Ew46pqxwyJR+VyOobJs9jKGkEta6gVHZ+4OaukhB47zkxb3t2fcUfX8K8mj2NVJMe2
         dWMyMgbwnyieT+7CpAPw5k2AVDZy9x5ROwbUpO/6qlOp1ndqv35+t41hRAWR8DW4Dpyi
         iVgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tpF6/HHz";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acafc283si78410736d6.489.2024.07.22.04.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 04:57:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tpF6/HHz";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sVrey-0005Mr-WF; Mon, 22 Jul 2024 07:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVrew-0005Aw-9F
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 07:56:54 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVreu-0005VX-HP
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 07:56:54 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52f04b4abdcso50516e87.2
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2024 04:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721649410; x=1722254210; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GW53BARDoHWD00cOBNaBMr/nIXFp8X8VrLnIPXNfOYc=;
 b=tpF6/HHznAzles/kesbsNdG9niaCcRq36rZSzPo3jkU1wQq85vWx19HrftlXJC3KqW
 Jr/78XM3Y9mwdrovHbUBMyHzCwIlD7t5MF8VeUd1VD/cTmuTFBEtSrIL4IQOXdAnySNl
 J1PodGISWnERdjuBwF81Sf4QeMsc69EketA1a2Q435oyesMqRCRtOBnrkV2w1BDUkNO2
 z92DMlB9R8IPYFeBBeqNTMpZKq8/yHyZu1SY7l5fNhra2xI+UZOCUq/dMd0F0apXqPcr
 svU0yxpXMmP8GbbrPPw/AsI2zHPGa+Hgh7Xf84OmF/pfz3jm1ZlyefkocgSSwZBVcLYw
 kEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721649410; x=1722254210;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GW53BARDoHWD00cOBNaBMr/nIXFp8X8VrLnIPXNfOYc=;
 b=JUsJwTKZ3wEeSW0wq6xAeejK4X/Ya6mv4EY+1X8jRB16kpIIdCbKM7wOn0mDkk2UZR
 2+RIhU4z6Js9WIsRxQ4Pv6Q6IQsI5UnyqRoWEd81dVV6Kqaad6+wjLrU7Sx26NcxXh3E
 BgpItGkePn5RWcPVfp2B3Rks6NaDWLjnrVuyv/CkbeKqX4cXKh8NMI5XA8GY1KWiS+6C
 T7E9pdLMLTsWKRvhg6yRpldyurW45MHx3atQ5NzHA/QehzR4K9S5UWOGv6K8+nvn8WYC
 sma3gzWgvD6sdFAM6R014/cMKwHPd2PTPy8yOUY+9M7Ov/DGbovimnylEbCRCwbioI27
 +B1A==
X-Gm-Message-State: AOJu0YykYxrdxMx6SZJFp02G/VS8N/JVBSa2Oll2jBBMilqWj29Mq7FL
 s5MEEHG5rzUCkNOiLSjSn8r3OHPi3ZbcaZzD/477+PIb0M62Pdxa32KIoWlsPYoOwY/ki792MYc
 mTuua/IhZ9FngjYFCK4DzUEmj8otagMrOSdKgbk8FZJnOXtuK
X-Received: by 2002:a05:6512:3d1a:b0:52e:7684:a385 with SMTP id
 2adb3069b0e04-52efb7e8f75mr4258408e87.52.1721649410248; Mon, 22 Jul 2024
 04:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
 <20240719010707.1319675-4-richard.henderson@linaro.org>
In-Reply-To: <20240719010707.1319675-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2024 12:56:38 +0100
Message-ID: <CAFEAcA_+vkQfkDY9eYF02gQ_89CrCb8t8gW2wbo2m+3pHskK0w@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] target/arm: Use set/clear_helper_retaddr in SVE
 and SME helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: jxOTqfZk2i4O

On Fri, 19 Jul 2024 at 02:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Avoid a race condition with munmap in another thread.
> Use around blocks that exclusively use "host_fn".
> Keep the blocks as small as possible, but without setting
> and clearing for every operation on one page.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
