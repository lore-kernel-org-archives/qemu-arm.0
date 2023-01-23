Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2903189ejc;
        Mon, 23 Jan 2023 04:55:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvJtrqjIbinZ5jVoXPdD2RI0BIQti2ZchV/jZ5vtIE4xZTDbzfi9tlrQQqtLXqtPuu/Fo5o
X-Received: by 2002:a05:6214:3784:b0:535:4fbe:137e with SMTP id ni4-20020a056214378400b005354fbe137emr23855573qvb.36.1674478527037;
        Mon, 23 Jan 2023 04:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674478527; cv=none;
        d=google.com; s=arc-20160816;
        b=uSLd5FYEVdcFr6RQpSh2zdzgJHdTZf8tVCTpN+aVFfmWdEfQ58F9c8LMr+q3Q7aD0c
         t868mxmhyX9+j9GF9QqrdIToBY2iixLk/17TFCaRCQ7fAmrY/PoiaHgjIjsENWJsQQ2K
         0NkRPM+vY2jCF8Sye4PHduc6v7qp1F9yIy6qpPkCkDS3+b5b9DZDytMY8KBvh+VnOKW2
         Sdl1c3qUyln560fKGhMBHi2SKKiW7Xmh8tygr8dIJNZf6xTZiQysFlAVO9aO68NCAZPB
         7vs3lSHZVkaF6cCTTPr7kJxS9xLA8IgTn76tG/tWs5Lm1mOCH7w+axt+tYRgBS1Ql78l
         JrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LsymGaurdbvzt3AMVJ70iIgIZo8AfIsH09TZhMekPQw=;
        b=JBahcHFsXtVWXmwYOTPFEzyMRGIKuC+HampTvljnQwjxya8cCG21iuhlFJjYsffl9A
         HI5452vpGLMgcQyw7kyFV2QQDmZeH6pUOYCb+u3KIPxkd+vrD7WVfrzKLIyl12Rf7Nz8
         zsFg+XZKIwqfsalhdCZqCDURfxCj/QzHeS3+rW0lbPkidvFhShZ2cyl+rAKn0hIpFTry
         L+Zvjg/awDgmsvoXovjC4Bp30SGECRn4y9sfYx85WdxMD7syyiTE1CSHRUZKmdlRTXzC
         ij2jyDJmkqFUM12mvd4OHgETnqAJzo9oMmkzh8Yqe4sfElo0cNulV0AdnoEs1Y6Jf8wE
         xHWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hEO01prM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a05620a04e500b00705c3b92486si24210995qkh.684.2023.01.23.04.55.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 04:55:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hEO01prM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJwM4-0000aD-9B; Mon, 23 Jan 2023 07:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwM2-0000TL-BL
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 07:55:18 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwM0-0002YS-NS
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 07:55:18 -0500
Received: by mail-pl1-x62b.google.com with SMTP id b17so11276803pld.7
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 04:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LsymGaurdbvzt3AMVJ70iIgIZo8AfIsH09TZhMekPQw=;
 b=hEO01prMoNcItP0JlIb9UXa+j+tao72cQhNdDVFhe9eC5kq2Vct6ebLgeWjP8C9FRx
 Z3oYc8OF6KqQrshhfBtVDJ+XnmgpKyaaMk6C0AFPFuPRV/OBtrKYDuEMbW3xCEOw8mie
 HTO/FGopZ3rzOxZ6S5KAop9iENj8xebTB8Ox5q8D2UflydqzadL9i5Lq8ipfYmIWMV3g
 D7v3ASp/NnhzWtI73XA5N+GM62PDV6gD4Bqs0l+0v97cfKQNSNgriDwJkmY9710VEL1J
 aMj+DFEvhM+VugTyfLDYJt18/SbH1td+w70iY15lzDjxUvBYdLp2iKa7bBcqDLrIMq3M
 r45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LsymGaurdbvzt3AMVJ70iIgIZo8AfIsH09TZhMekPQw=;
 b=O7DftUW6HARneP4ZToig5c3IIFTw4+BNiJVX5niKoUXy1zMGfTI9VJzGxvKvfWP7ul
 5nwXAThSv5YboqMSYisHQ6LeJeLkw3SKihI5/DG5DuRhTHxLyslUBFruChpAakyuJhfo
 TJGYg5qdEgYnEa2+wADxmk1jeJSDWZFlaFEQQ+ltZudbL/HL3W0Rim/G1vQA72NUzjFf
 /H9zoqDoNGYss54xGzgCr/hB7q7AzGrp2+3Wwr9A2FRPbBU06ta+o01og4XQa08dI+9N
 7SgbqCkaqPNtgNmZd98OxaQ9QRH0DweHoTgkR9VYxMUSSYQYtfSt1CderIdGi87U+P3y
 e33A==
X-Gm-Message-State: AFqh2kpCxRONBFH2B6FAxv2Y0rvA/P+1QN+YLLco0T7kxHfwBOf9FcYx
 le2x2K4Ny3WmTEW8uw+t1rM0B7N+QZP2eFlqd9KkPlEv3P1/1Q==
X-Received: by 2002:a17:902:f7d6:b0:189:7bfe:1eb5 with SMTP id
 h22-20020a170902f7d600b001897bfe1eb5mr2539057plw.9.1674478515382; Mon, 23 Jan
 2023 04:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
In-Reply-To: <20230106194451.1213153-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jan 2023 12:55:04 +0000
Message-ID: <CAFEAcA9p3AftyMk26RZgcpoTMT8xFoOVVj8kHT1dM6O9oaa4yw@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: iF6uTdMlBOcs

On Fri, 6 Jan 2023 at 19:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Here's a short-to-medium term alternative to moving all of the ARMCPU
> cp_regs hash table to the ARMCPUClass, so that we're no longer leaving
> dangling pointers to freed objects encoded in the compiled
> TranslationBlocks.  (I still think we ought to do less work at
> object_{init,realize}, but that may be a much longer term project.)
>
> Instead of giving the helper a direct pointer, pass the cpreg hash key,
> which will be constant across cpus.  Perform this lookup in the existing
> helper_access_check_cp_reg (which had a return value going spare), or a
> new helper_lookup_cp_reg.  The other cp_regs functions are unchanged,
> because they still get a pointer.
>
> This ought to be enough to re-instate Alex's linux-user patch
> to free the cpu object after thread termination.



Applied to target-arm.next, thanks.

-- PMM
