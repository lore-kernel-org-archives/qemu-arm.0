Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2199585ejb;
        Tue, 30 May 2023 07:04:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4WCJCHDXRw7Qhyshm8ERjIejEBQlPrvYCfQrN+SgWCRnanUsGqQkgyYQQas+01mEUJaKLW
X-Received: by 2002:a05:620a:2cc5:b0:75b:23a0:d9d6 with SMTP id tc5-20020a05620a2cc500b0075b23a0d9d6mr1866328qkn.44.1685455493724;
        Tue, 30 May 2023 07:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685455493; cv=none;
        d=google.com; s=arc-20160816;
        b=X7DzGtyBP77g9WR9iHtrgaJSrma0GgCYdPF1ffHcaX/J/htP9Ja555sfFXDa7Vtchi
         fPz/5faw7Cr1DDCndrNCC8qe0xzyQP6h6NDjg+28R5kKWqhlD1NjqOHXkOo9qYgZDpJO
         QLqm6FXBaVb7hXr2I87liOvk7d1YeQmaCwn9xO/+RhCPesLEUpwZmZcjCYsV6Y4mJbTl
         fpRBBUp36WkYmNzFmygS02EqKwO7xhnUp8Vgp+GnMGE89oSer+4Of89XWRuSuuc3lB54
         aAFie2w9f3aagIhHoYxUMoOaUa6QuKVaipAdyik0DH8cpXW7eLqIhgtCCvZKzsWmsr1y
         kG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VMxvxbyHAFNP4blkIsfJB/tnnKY82+TDHpH2duTpjyc=;
        b=mHpuygvP5ztSUEgC3186PJiUaaCh6KBHZG4x25jN0h+0QOpGQHkPjScEH7UERZpvvy
         +9mowfQAhTB2/HUmKHMI4bp0qbwpu12X9kGOr2o1FNY0LkjHr3FbYExLvXU57wW0qFoS
         gLVVuOWuKq4g0hcUAMGW6j//FDLWIO16Iy9wxpkCZAyVI+Gx7ZGhwKa0DSdyCMPe68dV
         RA3FgRz3alkUa0eJoc/8keYjLKOBVvC0Naf9kB5TbuaXQkXCIRh7iqH0XFEmdSo2SVLi
         IEOXMsT4Q/DAWvEHiABeP3TGDSvBXVzcuWizPKRKx9lt+a3sZUzKa9QfWIXLJtG5/TfS
         SypA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wpqj+HsJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020ae9e00e000000b00758d48712f6si6336207qkk.146.2023.05.30.07.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 07:04:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wpqj+HsJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q3zxc-0008Pz-7z; Tue, 30 May 2023 10:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zxU-0008Oy-5y
 for qemu-devel@nongnu.org; Tue, 30 May 2023 10:04:20 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zxR-0004bT-KY
 for qemu-devel@nongnu.org; Tue, 30 May 2023 10:04:19 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5149c51fd5bso4274672a12.0
 for <qemu-devel@nongnu.org>; Tue, 30 May 2023 07:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685455456; x=1688047456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VMxvxbyHAFNP4blkIsfJB/tnnKY82+TDHpH2duTpjyc=;
 b=wpqj+HsJZ+M24aOMwkjzRoE49OGNaYQE/E06lL+wbOiNsBrXZKcpLpKqYx3PT4sOd0
 Whj2mpREYqlsIPAkR8qzBlf4TApu985D7nX1DlZ5+jtCBlY6vtgZQL5oNNqVdfJPT9iF
 49Y8ITUYC00X0r2inRIJN9x2DjeIPDykxXwJdMcditCNfQoRvF5b/SN+pRchcPquVSbQ
 97obK3SNH8CRGXYtB+9yQw/5kjCE+FZNOw4QX+DkynNuBR97RihwD6+WEsgEIO2LhfAf
 6j0ns6GVZQoQe3cArNsN3F0ZSMW8upyuS8/9KqQNwBWKyxvF/PmKkbDy+d+UuRVXGTSh
 tXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685455456; x=1688047456;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VMxvxbyHAFNP4blkIsfJB/tnnKY82+TDHpH2duTpjyc=;
 b=mEJyH6J6PunD5xiG3oGQVVJTOyYBp9/sFY46nACmp/RN2jTKOlNhLKHzf7JJ0PA/h8
 oKD9ARzLF95fV+IPnu27o+RqxLeQeOjc2K97Vej0S8e6ZnQosMdwh4sbWjntEng6pKfl
 It4p9k83aTZLcZIe5FNbFNDyj8DFQ5d7Gwa10u0pqZti2vGdMITJ+pg0aIuehZuESOs7
 w+DJZNhUQRwLAJR4wtEd+hqhA5r4AZOrZolpIX6JAsSyCjSEM4Fo2TJQoVwsLnwc9u8B
 c4B8ENcVoaGckpa/hWdIxyOD4TEbWdE0ViAMxWq/jZOYl1iRHCUkLbkeTzIWriezT9vI
 dydg==
X-Gm-Message-State: AC+VfDxRg0Sq88ue8PFaBVTSndOgJTQGNEoX8nzF5V4iZQJwQBP6e2CF
 nRYaEb3lBBJwllv8E0haMLxr/JWLDJ48LNwEWc9LZA==
X-Received: by 2002:aa7:d454:0:b0:514:9edb:829e with SMTP id
 q20-20020aa7d454000000b005149edb829emr1761877edr.18.1685455456110; Tue, 30
 May 2023 07:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-17-richard.henderson@linaro.org>
In-Reply-To: <20230526002334.1760495-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 15:04:05 +0100
Message-ID: <CAFEAcA8ZHk0iHTg7Z7PT72vzSs4CwMHLmAwFuhSvj8ecXSn8Lw@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] accel/tcg: Add aarch64 store_atom_insert_al16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Ng5ZZIsREIW0

On Fri, 26 May 2023 at 01:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
