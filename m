Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2191572ejb;
        Tue, 30 May 2023 06:53:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LISH3x94RvKHHylLn0bUWSJ5LjzYAETSWWXWedQ9q6seNPJsaMvvL7XoJUy0LRi6BjB5M
X-Received: by 2002:a05:620a:2851:b0:75b:23a1:45a with SMTP id h17-20020a05620a285100b0075b23a1045amr2104322qkp.32.1685454789702;
        Tue, 30 May 2023 06:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685454789; cv=none;
        d=google.com; s=arc-20160816;
        b=sI+z8Sjm6XKwxBEBg7eCT347zmIfT9IBBvRJkId1brBAuIcZs1p7jHwdXKXRm2i9YW
         UsZxwnbV+PMZv597vK9OVy0gB8DEKKX69gabcaDU5IPPv+zORRKMrQmYpkXKVUH6LKKZ
         ZRxYVosLDQdWR9U0hB91O9sfGDI18UERZ3CMd7Pf73/tj8/kFp6Xe5rs4JFjujzqDNo5
         5XtJRm2UaivQdqcwaal1DzOjjqGTy4CYR475HEC8RCvgZvJcHpGE1lrdklkbu2X+O96D
         OBN6D8RgM/AyA1KJHAU+AK9M2Z2qFJa9Zlbom5U6mZYQfLCSRNO/tpNUuElPRz1vfbp9
         nlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=00hkDcTKeUxAOYBEp8EsIKjLJEzdU0MdBB7bslm+fVI=;
        b=0fEOff4b9V3+NWNJ7TLIGVs3I64kzgNcFjNPr7om5z4UCHZRMd4v9ZoY5mxIjPX8vT
         +zmfVsw1nEiFelfFylwLTB39ObX7dt8C0DC7wZGyzavGwRUdYHvmnmcvD68pLsK5fsI6
         LixizXVMuBIvJtzrN8JiaS/yQkO+cUxuatX3hTPcrBTH5JCr0SG16W5JYFdkIcKVVSJ8
         NeT5fpuiZbLPA/q240pRojO2bkqE008GfOa/RzOjTAbXJagCYj6QHCPZ7pUE663qYqUq
         ea2YNJwC1FPMcGN9XGfu20SYoTHU7rT97cFYNg9L71DukasIvbdwQxsHdlJb8nuLugux
         oGXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daiWbq9e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020ae9f10d000000b0074acaf141ccsi6415649qkg.676.2023.05.30.06.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daiWbq9e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q3zmJ-0003nQ-4Q; Tue, 30 May 2023 09:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zmA-0003kj-1w
 for qemu-devel@nongnu.org; Tue, 30 May 2023 09:52:40 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zm8-0001Xn-Jb
 for qemu-devel@nongnu.org; Tue, 30 May 2023 09:52:37 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51491b87565so5816251a12.1
 for <qemu-devel@nongnu.org>; Tue, 30 May 2023 06:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685454753; x=1688046753;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=00hkDcTKeUxAOYBEp8EsIKjLJEzdU0MdBB7bslm+fVI=;
 b=daiWbq9e+0jFjM0yc2r/vHSb+K+DlJZm77V+NVB8ou8R8a8ygCdGmlyHbUHV6+y+Z6
 BVYn1rEHe0/Q1EFIZbj+5z4A/ZTgm4QLmPhvWatHhkdh3tT8H5bj51+0TY4vDKptbyrq
 M1kpm0qYUjfW9Xxf1p8MOEilTZeI3zrXSbsdvGpLSn7DHKOtWcUfzAJfKfCv2Ax4bPfn
 h/dPJvrNj6oCDdTL/rqNPSQ2wbZax4KQXIwa6CxTZns/cmid/NSdVgFwiF63kp0ZuDOg
 rt/AAjJxWKud1G+EMbOXHjYMgBOtN/sNaIM6YQ+SBUwvbSD5LBp+3UvQSlBFbQcHftMy
 j8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685454753; x=1688046753;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00hkDcTKeUxAOYBEp8EsIKjLJEzdU0MdBB7bslm+fVI=;
 b=KBVEvpVBK+h9fU6cIH5tPUnSI5XQybzoVFPq2h4CBUFOC2WgfNHx+VwaU2tDX6k7lO
 3ewC0vjXmZfON1e9z0CL/JbXyB8dI3SQBGedH1ALtlwn1Ny7iFhNe4PMTs9JwqP9F21i
 3Kei2O1/0SUNRSUr1TspQJX5/8zW+SsxloL/X3BtsRNSL3LWdaFG2gF1UOkCWsDrcPoO
 HRf8xgrLI73T3F1lPgT6nsyiN48ueYNUZ1BTPlpRA5YJIZnAEM8Rc0INEVOSDxDrLiBX
 Sq7cFjyfhs09VyZ1nBXG0rJUbckzcMAE3ipdmcxaw+m3rbGxOj5pdB9rTsgH9ovu0Xl/
 MnIg==
X-Gm-Message-State: AC+VfDz8FdiQ7FpgX77zk4lGpEB80p3c+OwcmufOIh5ctSeoSFE5MRLk
 Po826L/XYf/3yNPzG7X/bM5LCTiIhOzZ3JrozsdvGL0v5hcF/qsy
X-Received: by 2002:a05:6402:5178:b0:50b:d5e5:519d with SMTP id
 d24-20020a056402517800b0050bd5e5519dmr1687949ede.4.1685454753596; Tue, 30 May
 2023 06:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-8-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 14:52:22 +0100
Message-ID: <CAFEAcA9f_cqYv-64iSckU50b=B95-5moAi+BPbEadvbgsKcsZw@mail.gmail.com>
Subject: Re: [PATCH v4 07/16] tcg/aarch64: Reserve TCG_REG_TMP1, TCG_REG_TMP2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XVH2wVSt0dVG

On Fri, 26 May 2023 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
