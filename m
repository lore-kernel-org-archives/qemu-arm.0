Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp952490ejb;
        Thu, 23 May 2024 03:04:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYWMPMO+33b2XfvyYaxcJNfCEPvuz+FmR3mn2NnQg/iltcRdtHiQ3DKBk32OojKX7YRiyTFDjflf7ot02npCifovHfXqx0
X-Google-Smtp-Source: AGHT+IFqGwE+XPW55N8xdKzDIE+859ff/R0m0bUK3xj27ErZG3WeTr/T2Qjaqh/8pwJI3Sk604mw
X-Received: by 2002:a05:620a:12c7:b0:792:a252:befe with SMTP id af79cd13be357-794a09c0e26mr279664585a.38.1716458698572;
        Thu, 23 May 2024 03:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716458698; cv=none;
        d=google.com; s=arc-20160816;
        b=znPu7sglNmQ8Qs+6UcLY5Rtunh9mlF2EGnGNAUKJUcVvi5Uc4mQ/y25P3WJ8B7h8qG
         +jsNHm6yAZ14F88bxVJwe27X1xiYEDzA/zmLPwD9q3eBBOLO4TJOTICs7wlvHbEtEZvq
         dnQqSba8RXVvepWDQx1fyYbE+/1Yvchq9qY+NhTYTpejLKf2TR7Xm6Y17fV3kUQSKDxu
         qM7tBmqeoYaorrMq4RzhumhdF8aWFvsdEXzo3uzcOOV6101xZkrbslkJWJlkU9AuSzt/
         Iyqi9wgwSf90Mf4iMMh6ZygIROAELV0OPov29wdXt2dUCXoW1MYmnN6B2+EWS/4YimTB
         CA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gseeate5nXuN/96Nm4Hv3YwY4ngTp6AnC0AphvtiByQ=;
        fh=g5qiIB3yEsFq70trL7Np0/ttYREEkslML0+BLQzdy3E=;
        b=X+2Xiv5H1WAbAIB92ohhkBn+y6PNxKPKwlbb86iuGtHnEBhOPKsMehZrR8nfMk2XUb
         /T8BXcKOgTXWYDSCXhr/EPeZpr1Gkd/Y3OgvauQnx9lQiaHZz5W4I/JTvLg9/XzvEgfe
         rwfg5r17XfOJkUqYK3TdkNugKXEz72vcAFk4a/d/LptljGeT/i7VBU3uyqCym29uaois
         4dtvfex3bF6vpHPF+r2NtUeqae/2n9gwnvaiNQ/UfJHENvDQiizpqWJXCx71J5+oGUKC
         aaY9mrN2YGuDGtQXMt2r/pvrT3P+grx3r075n5ETZPXI47voVNVaXJ2riiFlpZIOTefz
         xwZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f4RVfXgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf29a683si748116285a.211.2024.05.23.03.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 03:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f4RVfXgF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA5JN-0008BE-IP; Thu, 23 May 2024 06:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5JH-00089b-ER
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:04:33 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5JF-0004u0-Lf
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:04:31 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-572e48f91e9so12427365a12.0
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716458668; x=1717063468; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gseeate5nXuN/96Nm4Hv3YwY4ngTp6AnC0AphvtiByQ=;
 b=f4RVfXgF/Uif9/vJpy2HLvbwX/BoIDIz9/Orw8vUgKqEK9MKLPJDjTxrUJELLcjqwX
 K0zkyT2Gp0w9QalpKO09H5mLPhygZPCIXytvfvJrWtyY2aY2Z+w3H64gV0ct09ySWBzB
 ID3RxER7JGnWod7yy3IU2xGQFqmtA+VRewQ4Xa8ctzOnpHAjRJ1Z6C+erZdmu2fCscPN
 sUR96TxRx8gzb75bd0OPlM4FZi6iVsgdS+eHmaANjvdggfCTSPB+qBMpFaTzleCA24sA
 99M3FnLL+gKU189MXNpLsQDmK6Ot1mZS7x60fzILOFzokySqwqiHaKSUDaPUeqm/Geg3
 bxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716458668; x=1717063468;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gseeate5nXuN/96Nm4Hv3YwY4ngTp6AnC0AphvtiByQ=;
 b=pytKRaLJ5WQQ69zimYzHP7IVAQ3iHAxuMBrYUjUyqJVyG2BF8QVlDYnonyb55l/NdM
 zwvQUhJQwPNWbX+nxtINVLUcJLHmwhef89qHOYpAa9rW8fz6qZx054X4ktLl/bZLwRGv
 x7pTjzUjg0AmY1VCo+4rYtH00he/6A81s8rnCPLpc1u5x+cZPZKDq27LHrn4WKZC5LXO
 M4OjO8lbzF6vbjCki+0hkvJN/Zi+h3ciLdjSiOog29gj7fJgZBWz0950l21tN7jOz6m5
 qBS89w4IAWVcrMxKzuegvzVCCOBcGwMEZyeNYBoffgFaU1740rWHiXPpiBw7/rOwGOcE
 mwDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2h87r7R8fhj8Moimsv/UP967dWktudWjq/8qvs9z16j9369/J/yZAAg++ymzp/93RtJs540yF9oIfdihbKr+TVHer
X-Gm-Message-State: AOJu0YxBx+Jv0quJsmkGE+6halWYppRFtrHBXnNmu3ZfXTTFNMU6HO5Y
 7pe+pbl1nYzPTPRt2FGERV1wFW+vUAcxnofCvCFpnhBFjZTs0wGvCRXZ15afTRkJJQlUwYaeLNu
 34sHPB2bvVxUti2UaySCBaYMT9dqhe2E04xpRwA==
X-Received: by 2002:a50:bb03:0:b0:578:258c:1091 with SMTP id
 4fb4d7f45d1cf-578329fe356mr2699807a12.4.1716458667920; Thu, 23 May 2024
 03:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-5-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 11:04:10 +0100
Message-ID: <CAFEAcA-U8XsO2ScjeGXMgqJLvVbEFWdp0s7KOEh7-ZK8-evqTA@mail.gmail.com>
Subject: Re: [PATCH 04/57] target/arm: Convert Cryptographic 3-register SHA to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: KbpeFhVh3H4C

On Mon, 6 May 2024 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      | 11 +++++
>  target/arm/tcg/translate-a64.c | 78 +++++-----------------------------
>  2 files changed, 21 insertions(+), 68 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
