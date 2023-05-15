Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6648112ejq;
        Mon, 15 May 2023 09:59:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7nVQZJgMyRqe9QeNaioE/pcJrBa6z3x9i4j5LlWMF6EGsmvJyEAiWwigFLuXp5sNiu+UNE
X-Received: by 2002:ac8:5708:0:b0:3ef:3af7:1c39 with SMTP id 8-20020ac85708000000b003ef3af71c39mr53551503qtw.27.1684169945062;
        Mon, 15 May 2023 09:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684169945; cv=none;
        d=google.com; s=arc-20160816;
        b=CJ1wwrjb3I6dOBOOWu5Um5SH0COcONYcZXCWXpwiSA9Mh4km7htIPfvj/e4jMZ13lP
         ZXEaBlq0kUqnap8L30BR2w7jBpNMdp+5kAUgmldCXhzk7mSFj+vY0GU1e45D4SdhCIa1
         OVYS3xMG9E4vhlVeVHg7KXdVLXiw6t4IM5ZIY5OCPp1nlToydncq8hTU6brxCqn7BdbP
         e31iY7LgsI3M6dRpjdmfl/Z3sG1w7gFhwtIINDikZPORzkgw+cGCHQxN0qtiBCywl1OR
         6Sl4kb0jCJ0XAPfXRTf3lUQQtJU2hb7/07/qy66NgcAkbvk+p7D76d6CfnMRr3z+/Ye3
         2rzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=b4OCMiDfDyTFriSSkoYEhOCXf/XQC+aOzomW7l+TfrA=;
        b=Jqk4zqrEgHNtF3zGNEa7ai+O3I1vtZE33Y9B1uvbGgpWZFGEd5E2oWdiDhe9bhOvQM
         Bo7vV/rIWL0WkrvBu4NQkF17KOtCvlvrgXfJx4zJIItKPVZt2jngHVgW/BxJh9pvjw+z
         NOIPgNgTi/Mt11JNkCKnK2mKzryPLlzpzZOyaXu+a/l0AeLK68c7qjWRriiv79ahfrV/
         vNvonf5ibd61FVYGojhhJ9LzKZ+hbI4QEdBClbawQrEfsDrrP1D94swf2Aukyyuujv+4
         HofXr883ohmvbKJhoiJvVMbmGQftkEZMrMAlLi7bNyDJy/uPLclasC8b0m0Z2eDi5vH9
         WRwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GnO07Bs8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020a05620a01f300b0074f72971619si133012qkn.592.2023.05.15.09.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 09:59:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GnO07Bs8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pybWz-00034S-Ek; Mon, 15 May 2023 12:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybWx-00033a-Ej
 for qemu-devel@nongnu.org; Mon, 15 May 2023 12:58:39 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybWs-00055L-Jn
 for qemu-devel@nongnu.org; Mon, 15 May 2023 12:58:39 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso23565555a12.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684169913; x=1686761913;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b4OCMiDfDyTFriSSkoYEhOCXf/XQC+aOzomW7l+TfrA=;
 b=GnO07Bs81b6/FcEz2aNZMhSgSphuiZn2CAZGLrdFeYLfNBANnY/kQdzr1Hj7Qxr6gm
 JeusKRQ9AV8zzq74sdKDjcErc0ehS45/5ROBHyqTNF01zV+Kn4drHOG+ZkaI1vcc3HN4
 Wr9rnSxLq3CNY9k+ez3/9DmGlStMnlyvry2uiOXNsHEnYqZV7gG0j/q0Jbg1n5uWohzo
 fF6ochmRSPJDXoNTivgl1cLZU7FpWpgtiRC/jvGVQkLBeutm6xY6HPw1wRFpuhLnHhh8
 kavUwjQ3p5Gj5r9n1bDRMz8ocbAprMekrDPCKXrHLDI7UsYOIdHRc9KhppYXWEezwmqh
 KaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684169913; x=1686761913;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b4OCMiDfDyTFriSSkoYEhOCXf/XQC+aOzomW7l+TfrA=;
 b=UqnXXYkbk4AzcLppLONv86DTDmWrIj8J1+Js/MBzPu0IB8fA1g3GK8InMBwmyYdaUK
 sdD2E84vg9/wAoPfQ0cmftCQZ7V0ei1vWjHbErIl1pFId34eke+SZx3NLo9GfU/frvmW
 9dHO74N8JiU2uSalotrAqYb9uXGzMlLoUYN8ohljWgID4iam1ZOHTRZQ51tnckOIrRIF
 M82ApcJns6SimXT8TyGXA8v8XTLRiCyhUTz0IF15ZfVJUMV8ttLy+64N6gEgyiekn4Wh
 M9fTz+gFYmYrn6FO1ZwXF64polrrTfCd5yMWhVUB4KaIZfCP+9Ut0ZI9T1KGMF/pg1bq
 ayzg==
X-Gm-Message-State: AC+VfDwNt/A0yCOAD2jZJs5/ErYRkgm/XLwWk1BEBwTGegV19KqML6vS
 h7626w//rJnJh+vB6e0U2p6pV0iizz9XmmH9SAXaJZnVcvzii1ks
X-Received: by 2002:aa7:c546:0:b0:50e:412:5a50 with SMTP id
 s6-20020aa7c546000000b0050e04125a50mr11192852edr.29.1684169912987; Mon, 15
 May 2023 09:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-21-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 17:58:22 +0100
Message-ID: <CAFEAcA9WtSovrA2z-8NDvBzyfWwbkoR9MUjNa1cXLLxXTtedzA@mail.gmail.com>
Subject: Re: [PATCH v5 20/54] tcg/arm: Adjust constraints on qemu_ld/st
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: /7aMaK3enkD/

On Mon, 15 May 2023 at 15:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Always reserve r3 for tlb softmmu lookup.  Fix a bug in user-only
> ALL_QLDST_REGS, in that r14 is clobbered by the BLNE that leads
> to the misaligned trap.  Remove r0+r1 from user-only ALL_QLDST_REGS;
> I believe these had been reserved for bswap, which we no longer
> perform during qemu_st.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
