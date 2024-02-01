Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp250042ejb;
        Thu, 1 Feb 2024 06:03:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLLojZgttv+lCpyHjVTZ2jxiX1csbQpFRtiE5oQ0NKbQneLoxL1iQvBy8iqpANV+mR0HWa
X-Received: by 2002:a05:6358:ed0b:b0:176:520c:c6a with SMTP id hy11-20020a056358ed0b00b00176520c0c6amr5170482rwb.9.1706796212917;
        Thu, 01 Feb 2024 06:03:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706796212; cv=none;
        d=google.com; s=arc-20160816;
        b=WQDsjGp/fDoZlCGK7KWHO+KDyBo7cae8YHFKXtnZ1RBY67Yq17wpGXErLcX1P5mQ57
         RO2ZT4vtiQBz484up2X1HjAmo3Nc1zoA/amoezoyvQuuIX9QQOsvN0DCQaAjJpQRAuZ4
         6227TP183aQNS24EWOq9c7N+39BkWdrnBsWN2FKY1uPRIz8krN/rhJhJ+5rQ9O1X/b1o
         8a2HH6zJw/YDZQ5+x49QJL7o9Cun58Aq+SF5UXZgxiIgtU4MSzSl76WSN9pVwU/5Zfwi
         UhM2l7jNYBico3KnRrbJ5OlKb6LVjE3IXQgXIiAgENMlOfF1EvQblja97U97Ido5bs68
         Db/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ySb0fSZNi62tgNa9LuMn6W2UNfmcsml8mDxQriq7QUU=;
        fh=STt0ZJw9oE3K4aOg+hPKC/lmihQgPaFHNHDFYTST3Z8=;
        b=ifMbhmJ0nFwn4Rou/Z2Y7gw4ekEcXKA0Hlwq2h1wqrCc+HAxyALg/wXy86ZwajcCCY
         GKvEMoxp5j8MjQa16hZ7DdjrwHkkX/P2KiYUaIikzZ27S8D4ntrvBCdZlQT07uPeE+aG
         QysWW1gWPjfSuKOwxDQUwOMPuxJ83EkZ7Or9azJGCWPW96qkFLmYw+4I1KobUCObehun
         F0JBiQUbVXURCL3t3Z4yOJL0XxkE+TBe6fa6uBlShumHBu8gldHhHQH2Igfk4+z4qxhB
         O08gqEvjoy0xNqbHJz6U9H3JI61E6jNQMcHc3FEWBalek/513FJ2ljHdLkaiYoqGmRET
         wbKw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wO2eZ2tv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVlXxs75dNBcb01a8Uu9hxERi43UAh45VxrDIOGR0qgHj6MxA/xzqN31OC/TSE0vMOgIPyMjUB7HDaCBZWUaEgBbKu7s4VA
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6-20020a056122054600b004bd62c9424csi1822355vko.83.2024.02.01.06.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:03:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wO2eZ2tv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVXd3-0000TL-H7; Thu, 01 Feb 2024 09:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVXcg-0000Pj-JP
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 09:01:06 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVXce-0005Iy-EN
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 09:00:57 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55f19a3ca7aso3967219a12.1
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 06:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706796052; x=1707400852; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ySb0fSZNi62tgNa9LuMn6W2UNfmcsml8mDxQriq7QUU=;
 b=wO2eZ2tvVfooE6m+zXoTNDy831yg/7+VeKpfwKJtPUirKsbhLHtWwsZtTT+faoSJ4G
 /HRnTq+GyvaVahZPQpQeJy73BKj+vTp9gqHLw+URG+FI1nY/LnAg4qvU8mXKBXQxbRC7
 1R+B8Rtko4hTDqibRK95EduVpJJVkfMoN5YgWiZW4wbPnt69ufdJpHBsX20uhGd2SCxq
 cMoqk13bVjONOeC5TMMpco8a2tfCP35HAY6+gWsg9LZ7Inie8uP4N9Z9xZy4G1YLc1lQ
 o8XSAiD6UZiyGKvxfAH2wlzfk+uvZ5hNOIWcssFbcewUkcoNFNxgaTM4pdJnqE/k3S7h
 OWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706796052; x=1707400852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ySb0fSZNi62tgNa9LuMn6W2UNfmcsml8mDxQriq7QUU=;
 b=Orw4OyFA+K5rQLoGqVaw/jdgVxTl9t1yYvG50D06LW6Dhalg5Fks4SD0SLzRXTXc3Y
 Al/1ddfy3DMXwhNPwSd7Ksp77ItOjhe+U2aOCpt0TQhx5GKEXJ7wkBgnHQ6RleppCure
 /78f/B59d2x+U5C8u+wBnqu/VgANXZbT/wF5XBgOcmYoTW1FvmGyHoMCCKqMfi434mVW
 E/vnb9PXxt0YM3ueFjpqkg/3HMwAIiOmcKLY2napFxGhP/wR8c4fPz6dF/BAZ03+w2gC
 VsRtGx98w2B7GRlY88evg2gzlCcjqwZfILQ/QGLlw8Qvst/SY6SvBAgy1dY/ThAgEFMk
 +5Iw==
X-Gm-Message-State: AOJu0Yxv2NiMvgAidz7Zxuih5ebN84oFfc7HczS0Xah16cjwGccwuMIA
 LNivKDTT0kxs/BCEh3lNFJO5bg7Gz/iRJpilWJQXoeD5aWkN1xEhifp5GkLUXQm5fbxjbxG3KhG
 o1lgO6SZmxHSwq1Iu1q+ktq7Kb28yWc4b5uRZ3A==
X-Received: by 2002:aa7:df8a:0:b0:55f:cacd:d0ca with SMTP id
 b10-20020aa7df8a000000b0055fcacdd0camr891886edy.1.1706796051709; Thu, 01 Feb
 2024 06:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20240129151828.59544-1-philmd@linaro.org>
In-Reply-To: <20240129151828.59544-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 14:00:41 +0000
Message-ID: <CAFEAcA8rx+kgSX9ofkB19zsSe-dfp=QNA-BirQ81PsrVkzmOVQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] hw/arm: Check for CPU types in
 machine_run_board_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 Hao Wu <wuhaotsh@google.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7cGjhZQFpBEj

On Mon, 29 Jan 2024 at 15:18, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Series fully reviewed.
>
> Since v2:
> - Rebased
> - Remove default_cpu_type (Richard)
> - Added R-b tags
>
> Since v1:
> - Add missing QOM parent for CPU cores
> - Dropped Aspeed changes (C=C3=A9dric)
>
> Following Gavin recent CPU type enforcement cleanups,
> restrict more single-CPU ARM machines.
>
> Supersedes: <20240123222508.13826-1-philmd@linaro.org>
>



Applied to target-arm.next, thanks.

-- PMM
