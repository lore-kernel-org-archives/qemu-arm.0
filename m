Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2366106ejn;
        Mon, 17 Oct 2022 05:51:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6UFAt0zYBw7lXu78yOWxo8aNpydLnXcZS1vKjAIqdxeZog+oXZNVRWy1Ez1x3RET3sGYJr
X-Received: by 2002:a05:6214:194a:b0:4b1:60fc:b89a with SMTP id q10-20020a056214194a00b004b160fcb89amr8141524qvk.119.1666011088374;
        Mon, 17 Oct 2022 05:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666011088; cv=none;
        d=google.com; s=arc-20160816;
        b=nu47GUkorXo0tthooqhUhXDRJWY3YVQ1vqqVa3N91lsogmb/d07N1wKsgvAltTB5ud
         7oDN+Ylv30yQUD/w5ffkLn+e1HhV+rqcF4yZ1MLim1iilKqbfvP6mZbUPElasuWfQ6p6
         Je5LlUB/Q1rNr1XD/AyOJIiyFHEAxQ0IuOU47IVVJs5KHWLUc7Pl8Y9XstUdGGycGQCB
         oS/BeKMnsuTEt1g7I3fhzOUIhnZMCFEqfQxRQ3NhvXIic6GBl+90b45Coq60Hdd8n34B
         bhdVq3Vm/YgUD3QX/CBZuCzKmndxXwFqctY8MhSfrpotX+9gHp90t9fjGe0ylW9aoqan
         0yRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fUjZYkb6/ANakj9ydHI1gVMvMtu/fFtDZpL8n7svyeQ=;
        b=bfTE1NfORF0Zti4H8Hc5HshXbs5ZDKXawKaRwfE9MIVMAWwcCCVeDX+1zumnn+GF9g
         pPNeH29CljouYMX/GUXmV+r3/LHssqSigYQ1L7jAQvYHnhe3l4UdIFlttEnjZGiAHZBx
         0oPzV+/VtDpoGNq/Bsz8BodgTK2KFgLRmP8MPzr7zdMhJ1B/Gbmc92NsaOkcyJQLugK0
         sbQXhRfTrC1lHt/wk28ayz6Q1WOWAUpttAljyi9yp8+cai+gmx0p3J7Jqhn3NKiAW4Hm
         +Dzi0q08cRAftYSujGehhdagI6NLXQhbUFZpc+e+w0IfdVHhDGcr4i13hjCVv2Bf7XI7
         Hn9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k+05r8t1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a05620a284b00b006eaa4d5345fsi5647265qkp.153.2022.10.17.05.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Oct 2022 05:51:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k+05r8t1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okPaZ-0001Hl-OS
	for alex.bennee@linaro.org; Mon, 17 Oct 2022 08:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okPYy-0001EG-Nm
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 08:49:48 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okPYx-00043W-1y
 for qemu-arm@nongnu.org; Mon, 17 Oct 2022 08:49:48 -0400
Received: by mail-pj1-x102a.google.com with SMTP id pq16so10898546pjb.2
 for <qemu-arm@nongnu.org>; Mon, 17 Oct 2022 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fUjZYkb6/ANakj9ydHI1gVMvMtu/fFtDZpL8n7svyeQ=;
 b=k+05r8t1Kd7vaOHT8Y2aGn7WSemBNQf3TKg1GlQuoqXz9Ri+KefWf/vPHi+YE9tbgM
 gpn3Ux8x7+ygbrIOwwC/PbFUrFrGhsfRKTO+yTxEtgPvJYPd6hbz5hRPBCQFGgkj7+tp
 8z80GP4F3ULEMYxKqYnicseV+0ehyJFnGeHgnI3z9J0bWFt0KBgKpFPhnM0k13zGFEMf
 hN7OFPiYNGFDBKF1zl7Iy62tgY4jo2qsDDHp7J1rsotDuflQ+d+TkjeeuayqcHVs5zU8
 e2sCwTfpwTEHrIsZxLAssI9tryAWeob6BlKBuluONeTehsO0FkwSXvSl0j0+VpDXF1Jj
 wXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fUjZYkb6/ANakj9ydHI1gVMvMtu/fFtDZpL8n7svyeQ=;
 b=jb6gkGeauruNV2ZHlqyihd7bSZ1YOKBX4LRUD4kcEyiNqUrTMVOnoWCEKWQEHQH1Xc
 GbxENvsaoJz98Ye9R9MuTnWcqZybRp4yZz5ZOtLGS3CTkbCCJqlDwgDX+lgd1eLawqBe
 1+ulUAGyEt+wp5TqzNXX+tXRCeBGYbG6kFpzlJH3pXtra2t5TB6/P7wF9GLWSf5Tf83+
 CiwfHQgUMfMEDM3sv+R409PXMGILU8aREP89UWje8Ys1+vD7tt1TjVxetwXsYiu1EV+4
 46OIx/u+cMibo52Ns7IzuBISxaFnH0DXRHSAV5laimXZ11BWj9rl03/NHnNM9x2WQntf
 mgBw==
X-Gm-Message-State: ACrzQf336e/hwlVdhCmYEgaYuOZ7k6WRKBC8YJjF3qHeL4Vk01T4byvt
 nMV69FJ1o6mp3BCY6EQVWGGcDgwfw+yYm65JCOAI/Q==
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr11900381plb.60.1666010985450; Mon, 17
 Oct 2022 05:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 13:49:33 +0100
Message-ID: <CAFEAcA-Ehruh02RtPz3a1Hi5zVp1BMJU4j_657gqxSXYiu7gJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p1Xcpo2HeIfW

On Tue, 11 Oct 2022 at 04:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   * Rebase on today's target-arm.next pull, including 21 patches.
>   * Split AF and DB enablement into two patches.
>   * Perform only one atomic update per PTE.
>   * Raise Permission fault if atomic update reqd to read-only PTE.
>   * More use of S1Translate struct, which is perhaps now mis-named but
>     more generally useful/used; suggestions for better naming solicited.
>   * Other minor updates per review.

I'm taking patches 1-12 into target-arm.next.

thanks
-- PMM
