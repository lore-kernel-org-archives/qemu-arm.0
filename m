Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp98224dlj;
        Fri, 10 Jan 2025 04:47:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXEdFl0DfclHJO7gjh7+SrN2qrFhxD+r3lYa+uuPFsvpkh+atXg2kfvn6i0i5b2V1g1Q5Hmwlr9RjOX7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGDiy0FONBOgq9VIDrKWecFwBhWpIUfTQ0d4Cp9xMxT/VnplLZcqF4+ISxqVVzVtvXsoXon
X-Received: by 2002:ad4:5742:0:b0:6d8:99b2:63c5 with SMTP id 6a1803df08f44-6df9b1d9533mr148641276d6.12.1736513266253;
        Fri, 10 Jan 2025 04:47:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736513266; cv=none;
        d=google.com; s=arc-20240605;
        b=YYjuqBozElqTEObDpjp1YKPwyNsSsYLOQR66oK7e9l6vWcoLYQ4zrCy2xj6sWxb29D
         Y48DDMQrAPpreQ5opcIIA99kjhmFpTFW47Of2ZEAa6z8lr0qEZnipWpSX69u0vOQ5KqU
         9MHAQWdPR4baUn5F+Mi1zD84QnkTT39b3q6xXhO27GGAl2A6JgnIcSQ2//8IWGDnjvW1
         7S6IWnDmS1qVhwd/JCaxIrnqPuEyUJf15nE4Xlm2lATmZYeZ39eP6BIe2EpxuiOxQrjf
         PRHpF8utcbk9hR2n8/vmauwER1UiALjEQxLpdsYp4WQBMbtdU8A1/BT/U3C3dpIkmRkQ
         /hZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ghaTg2vDZgwqorFM1d/p1ei1Q5z7osvlhGyoa9AfN+Y=;
        fh=gf8enXdqae30X2UCbQCu4l85yO/FNfF0zee6Aknad1s=;
        b=Zz24K17iskWzgw6l7prvgKvS6KyzNg5/210SEg4HunE3x0+RkmfgYbJRT9QopQno2A
         D5tL2YteVT3HLcBG+Q1HchMvb2HbTToGZZ2OE2Ky7lmPlTFY1IyQbmU7XuJpUjzykq/V
         fo7qiJcuU9sc4p/8PEeh0Im3155DcFdyIe/X1giIorOhz907aK4NTf11hujPcsCX/RnE
         L/yDarqA8tZo3LzLQXUVhYsRC9NRxlk8f2Qqz2pZBgdxRXSVmwX1qFJO4aLyzTZ+PKAe
         0TVL7HTsrVlewsEaZhKxCKgc3/05Z6X2fE/73XW3cvVgYJDIPgc0SPLtgEeQioK6OeUc
         c5cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=umHrTZUw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfad8ada58si22004386d6.63.2025.01.10.04.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 04:47:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=umHrTZUw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWEPp-0008N9-VH; Fri, 10 Jan 2025 07:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tWEPj-0008JB-C1
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 07:46:59 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tWEPg-0008Vi-Tg
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 07:46:58 -0500
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e549b0f8d57so3325776276.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736513196; x=1737117996; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ghaTg2vDZgwqorFM1d/p1ei1Q5z7osvlhGyoa9AfN+Y=;
 b=umHrTZUwLm6lfvJFd3nNi2h7nU4HWailzDgp24P28nU/fu6ZBkA/O+WTLZA3xR/yXb
 pHNJfm8rPN4asZiNQwb09OtKly7OGG09ZLd1tzuyiYI1tWrdk09sDFmIhfYUFB0uAS6u
 kCQgKgJoCTPx9kCAAZK4l8nMzlDFJFczHLCSevd+FD+fESGZOWaGr7ny1oumkk9lNdXQ
 Dtiet09od0zPnrWO7IiXT0e2yVqevuNxoOb68DxRjxhkrpT5aqn9s8XURF+uZyG81xzX
 Tr64eqxfAVaFpOBw+cQgn62PRORrMRNY5pKpz0NR8J0nY6OxjhjsCfdOAgnL7u1WaYEa
 q/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736513196; x=1737117996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ghaTg2vDZgwqorFM1d/p1ei1Q5z7osvlhGyoa9AfN+Y=;
 b=AQGauyeNObhsKmn9JQjSPDs1/SV1ogPRSF9z7Ix+BRdfgPaMoYxJoMCe3+bHiv408l
 SaT10WFZwLCcxwsjArTq44Mv+9gVsiDI9i76W9uQqhpOGK5ff4EYuUkh0j7w6Li1qDzx
 t6Br/FadeHYMmWtPZ1fze+aQoXIeQ1wqjF/XftqiOwlUmJ8mcLoyfDR0VHIOPxZm4z+c
 OEYn8qqcT8ZfmfpRBxytyS4EkVZBGOiI3TnsjFJwk/evbMTTrK9qS1UGROXB4Reui5sO
 UEagZ/EiNZFmFiBkt3gHUgfua8OJLYnnPK/6J//YGij2A6DJB3MC4ZXUq5LNLDiVDr/s
 Lssw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyuZPpGVGbJnzoPwZ6PqC/NkKMnxhBIItXG0kxRx3iv8BDWd/LmVmS86rnQ6cDS5t3LVEYoMJnMg==@nongnu.org
X-Gm-Message-State: AOJu0Yxq1UJzg37vFIzBJgABqyGpQL2axPEyW8jOq5mioN2c2lboER9i
 bi1o4TYrPHzwjy45WM8nhoiSUXb2n+c+yCxlDvedmIr9e9laEjoOaFyH6NIod7KvQiFgcQ5AwRP
 dIUYfDVbQwAxoUfnxxnLImqkSvpnzQ0B3SvLJ0A==
X-Gm-Gg: ASbGnct1zu7yLEyXfD/mTh14E30oHd7xLjx2Rx2oYjXjcTpSHEOPRU1Th3Zm+6B7th/
 B2E5wAyXEoXYFjbbp04ygBVYNIro0gyYDEcPMXVY=
X-Received: by 2002:a05:690c:60c9:b0:6ef:5848:2a82 with SMTP id
 00721157ae682-6f531238a85mr82670287b3.25.1736513196215; Fri, 10 Jan 2025
 04:46:36 -0800 (PST)
MIME-Version: 1.0
References: <20241226130311.1349-1-tsogomonian@astralinux.ru>
In-Reply-To: <20241226130311.1349-1-tsogomonian@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 12:46:25 +0000
X-Gm-Features: AbW1kvZAlIET7DXkGkPTF_nY6EkyJ1EvHgV1b_Fp86Sdzm5IdgyE99TWlNOWqQM
Message-ID: <CAFEAcA-gfy-hRGzBAhQUf=A2b39wjVL04p_7GMcXfwBq7_vXZA@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: cast rpm to uint64_t
To: Tigran Sogomonian <tsogomonian@astralinux.ru>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: ZLz3tJNCMUcQ

On Thu, 26 Dec 2024 at 13:59, Tigran Sogomonian
<tsogomonian@astralinux.ru> wrote:
>
> The value of an arithmetic expression
> 'rpm * NPCM7XX_MFT_PULSE_PER_REVOLUTION' is a subject
> to overflow because its operands are not cast to
> a larger data type before performing arithmetic. Thus, need
> to cast rpm to uint64_t.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>


Applied to target-arm.next, thanks.

-- PMM
