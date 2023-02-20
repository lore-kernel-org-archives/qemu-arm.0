Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2436920ejb;
        Mon, 20 Feb 2023 08:39:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9O2N7MQ4KBVKiFriG24YC9KI9M4TzlDsGFod0omh6QCS9Df1gnpKNcJO8G0vH5rx1f2WzJ
X-Received: by 2002:a05:600c:80f:b0:3db:fc3:6de4 with SMTP id k15-20020a05600c080f00b003db0fc36de4mr549927wmp.35.1676911180433;
        Mon, 20 Feb 2023 08:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676911180; cv=none;
        d=google.com; s=arc-20160816;
        b=f7fgmaOFXZvWIvGLlFJnw/88dIwb0SZNTbFbJeTyQC/khCzebowakyo5Itihw4zo4Y
         0EK+5lo+vcNvgZQfGoc1ik0BUJLUQ1WF/WT/3/C0pQnuk7yHVjk9a7KfJsS+GI90Yh+H
         ka+FCaE4ovhsry+epS7OElYFxAsvgwZOIfyYJ0KIkCwIs3AB/10zbGUPu3vw+aZxPMjp
         SvKY/tGxGt1nhcQkohQdzmBgddvD8ZSGPnFmeRMQ9pbQSvgY1McjwLkL7B6JzKO9xKzF
         0jbm2wdqbBUzjBU2ko3zRoQYlbuw/YlcV7383amx9mzwcEIBpD4bV1C5NVPA/+6al0LO
         lkDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=HDXMvHASq77DJBZWd/uBnhP5N1Mutw0f3xN+JB6m6VA=;
        b=nyh2Dz6sUbMYVDhLsG5CLnH3XHDhoQyxxlhnSeh/Sdou/fiq4fYmy1G+0lku1BQsd+
         rM0+aq1AbUDZ6K3+KJhdR+ynwZDMDGWkoucV2aQiSprWjoHQlDQUb+FwdxmQ5qm3EogQ
         Uwl4WQ36Pxio/9wPfv3v/1EUg1VTeDIDxCmrDa247gTXuaZtZDxeT+MchKL9rD46EgKg
         oALrjHVZZecXJFUiOzEivT+UfdabJgUd3EkFcmS7u785FPaogHfmwTZsBXd8nk2NvtQB
         CieMoV7MmqvvxcRpd6iQWzrLET2DUS5Ufx3uccNVt+YZFu+sOa7a/4wFcIQx5uzPqSuU
         Co1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sCOszksU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iz6-20020a05600c554600b003db0fc38e26si12290257wmb.60.2023.02.20.08.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 08:39:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sCOszksU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU9CE-0001hE-Jn; Mon, 20 Feb 2023 11:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9CC-0001fT-9Z
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:39:20 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9CA-0005ao-Ri
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:39:20 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t1so717602pgi.2
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 08:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676911157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HDXMvHASq77DJBZWd/uBnhP5N1Mutw0f3xN+JB6m6VA=;
 b=sCOszksUzOAxDyH/0d1OeQyUB5XRRUpLho7w2GqALdDpi4Eh3Wuil+/BpSZDWfZXPm
 tHB6Umby/jfE3bg5WIQV9ZL7zvwV4Zpv4OctDx+C0aoh+5t6rFwUP2lNp6ZKOXIwyDf4
 IQV+FAGC9An8ckxQ9q4lV9wOYl+Bv1J6WuBTxvBeV+g1Aiv2jTz2XlExsLOTVLPsaids
 HH09TPSJTbbFCU8d8Aeq1tqjLJnr116ii6Tf31UipLhXHT6iKLXYJYDchArYosrSezxk
 o2LuyLjmZsVnNfceCkgvbaWNitX5wnnr7E2LyBrFzRhQL5q9W9m1A9GgiuyZaxZn09YG
 5Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676911157;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HDXMvHASq77DJBZWd/uBnhP5N1Mutw0f3xN+JB6m6VA=;
 b=oMr4XpBY1VBJDw/+q7jA+O0ASCftd6rorcRl+FxqiwuXkaLI0Vs0V+8Kxl9sn/3dJR
 FY8y7tdTm9MLSuRp3o11VMaJXqdnvdf6p2lXnqbw6/K1kJbbLp5Ba5NwYBLL7VhWawVE
 6m5G27U8Hg9QqdKek01QPIqvRbJAC2jsA7HkCdnd4C0tcVehKzRUlwtYEuW8EncugMeF
 hT9PIMKxL3G4ACaoWC9D51h6kbkMBzBtJRVstfD1qAQmUJOjffTrEm16lMpSYdccqek/
 /JEHP/Ice6FiW0kfRlNU7nCZtJC1i/yZuxP8mZg0A+T0tr0wHS1c3rVNXIrp8sPkY7yf
 ewBA==
X-Gm-Message-State: AO0yUKX4zkrs/OpJsJ+PKjZ9jGImsEEcm3MLI2fMTcEbWJajxyajobyQ
 XuW8oE+79n3SVA6AFQ08qCQ2YzqRHE43adShFDrpmQ==
X-Received: by 2002:a62:164f:0:b0:5a9:babe:6cb9 with SMTP id
 76-20020a62164f000000b005a9babe6cb9mr407548pfw.48.1676911157144; Mon, 20 Feb
 2023 08:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-11-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:39:05 +0000
Message-ID: <CAFEAcA_9uk6yiNxF6XgmC-A1E9Lr6hUK-HN_YQGMRA3-BbqbVQ@mail.gmail.com>
Subject: Re: [PATCH 10/14] target/arm: Create pauth_ptr_mask
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0+e1q/Av68oE

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Keep the logic for pauth within pauth_helper.c, and expose
> a helper function for use with the gdbstub pac extension.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
