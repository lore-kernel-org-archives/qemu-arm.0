Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22882C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:29:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd6cN-0000m8-LJ; Fri, 26 Jun 2026 09:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6cM-0000jA-AU
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:29:14 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6cK-0004qi-VM
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:29:14 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-66493875766so1203803d50.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 06:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782480552; cv=none;
 d=google.com; s=arc-20260327;
 b=U/RuOsVsm8m3bjvBpX1xnh2fz3KCNybNKpHkoc1o0h3zAV9rA19UOn8YwfYJMeUc2z
 W47hQ/701n5HCv2dh605WZUkSxEw+++r78wV9f+k6030XJZtJum/ggRzLLK9mOZUhyYA
 EEIR3Kgb+CiFkINF2DTB5749aNJKUnTTW5v8LGPpMYCMnhXb61v7r+vweKpCoss/wq8A
 00GlZKj45dDF58AMo6PA4bUd+XUJW1LL67Gnb0TnNGlHKH3vyOOIhqfpz365NkRYRz4a
 20xtZB57Et/eCecGhoBRx9w0+XYPsfKBZxPBJjyYZTesOAKxbRByVMj0DPUsp0vcTqkP
 l0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lq+9DCDJs4qcO94Qeuep0Dr5cUXp8On2jmGzG9pBI8I=;
 fh=/IAcyD/UffVGyGoiGV2B6Bq18FyYuJ5zYShHFD1eKK4=;
 b=Kj5nAO0knJIeoX1BeHLvrdhyadNVUB+749zYffFirZByxLADU6fzCRmATg5foyhRvs
 dLb+ppqAR7RCa6dhneso3GKHs6G5kMKxUu34luUVWdhFK7kDqncn38tf3YqdmNkJ6Hv4
 gxlKVYF4RkIDQq9WUqu7XIQq6wH07dPfflhvjtXhg5juc2756GlPwX88K6nod8RpL0IN
 tHtU8ByxTMn9Eg28tintETmiGoCc+IZpQA2zOlKzTxypG+qDOm1d11CkN6iCscvqojat
 OZ8nJEtzaJb3jNhe56cnnu6+g91u0gnX5gJOK+u8RroRRxa4tfsMDu2Qu/F9ruZB/+Es
 UueQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782480552; x=1783085352; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lq+9DCDJs4qcO94Qeuep0Dr5cUXp8On2jmGzG9pBI8I=;
 b=obkk92lUOFwY7cr3aBorPAnc5wVtjR6n8vY+vxK8ALJl5A1W4QNyg7ZfgAbCnVpV8D
 7itwqeo1y7t4ZHM6ozitPePLi8JyOnNfJ/e63E8voQ9wJkMs634qjZioGbohMYXIvkFc
 ox7KEE1cCKKxF2DtzZ26pRJsivK7nBPZDSq4ogTmwKfNxEIhwA+RvsvWIaDLQGWVXPos
 BzIDJyxY+BYMkxsjESovhXkio6k69HFQYa0zc6zCbpOzLgetAZOFI+OSfYUilYONk3xs
 SBbVijGH3jFqH4zL6PWT7mf9jggwGjwv0PQag8gH/ZcsEAnSF5IAZJBEJ0sD+Fffh4ec
 xccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782480552; x=1783085352;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lq+9DCDJs4qcO94Qeuep0Dr5cUXp8On2jmGzG9pBI8I=;
 b=Th5vrPsAFFgvRGxoJ4VaBLFHF0Ktkgm/dHBLt+MPRdfuvUjzeEhBx+fvR6pX92gCic
 up/kShVXyZ/cLXavg5A3lNK4ptAyeuKMoSQ3llPfcatpyV8JNK0rrR5RcmrPtq9wKKNe
 O2S+ci6D5gr79dk2Szw8fXmxyxzaipmVQz9DFbFq3qOryUmZ+vNzxAplCTvnKv+KqwEE
 Cz45uBCJJn7xfuZqzB7u/MWGlU5P3xjKhmBQLU+ycwYLqKdHmCM6p36eNuiSk3EzxsT/
 pAHLyl6pI0Ql6yOyyvT+7IsI81H8/V7JctkfD2iNgtTV8MMFnTGXY7NoQvPwjot1+v7t
 Xlqg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoeiNcMXU+Viw75e9MCopAtsDMdZ3gjWZAGizYU8IUo6M8Oz4jt6KHiJMxDe6EXbG8cCAlUYBSlOQ==@nongnu.org
X-Gm-Message-State: AOJu0YyC0aBoUE4q/P5eSfa5uqPXIyfxmpsp0tjpUihkQy5DjbsvZn1q
 XkDPGcWI3vjX5Dy2I2x/8O6AkqPEDyCMDHLh4mdfsu6EFZrBjCLOjI6IDgczXAlbyzlWUyE54QW
 QfmF4603le9vZagzvvvCfwWBogGI2npkG4LvXAsIJerFNULfAcHmzTQkWD+ai
X-Gm-Gg: AfdE7cnQy1NQ6nIO+QPPTwXK5FVUZhfD1aotRJPGNkSdZA0YtzTv8NtZUQqnFZNuhT4
 VWbyeTcsBZoesbw5snEEi0HoM0C0oUTpz4or5g1EKO2Lo/FKBSP52Npvlg80wigO9k7XRtiQBnN
 LJeev6gdRa4izZSbidklllcKot07QGTXgEGwjg+M9xr27wBZbF+kKzhbgkHnA8pYsi7n68JLu7C
 IxYsTecPAdpbCDXmtfqTeQpHhiW89VjxXIFSVOkUdIinmvW+l2wfaNCHuE+eWYUK5Wk4ZWtoYHr
 gDyULDJS2kQc/qblgxrCTTI06wyk0b0aT2qkHLCFWsYlChT3+Kybr7Cg
X-Received: by 2002:a05:690c:d1c:b0:80c:2874:67d0 with SMTP id
 00721157ae682-80c28746a0emr12934317b3.28.1782480551688; Fri, 26 Jun 2026
 06:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-14-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 14:28:59 +0100
X-Gm-Features: AVVi8Cf1IejgidtdI8ZQT8o54GbL-e3f9NFPcLZNZLmxzL3r2FdD808ls3BvTuU
Message-ID: <CAFEAcA-LGmm4F2s_Y0YfQcoLtOveG-aQvHP4jzqCH0DJAy+JsA@mail.gmail.com>
Subject: Re: [PATCH 13/15] target/arm: Implement UMOP4[AS] (4-way)
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

On Thu, 25 Jun 2026 at 23:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

