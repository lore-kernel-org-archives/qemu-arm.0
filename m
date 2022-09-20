Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1780864ejy;
        Tue, 20 Sep 2022 06:22:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xP7AA0kMhv9WjLD0VaAcYWK2eue9GhOR+Dqyeeo22THPc5M94ZYMYfs/1trdS7IzoH5d+
X-Received: by 2002:a05:620a:2495:b0:6ce:bbe6:5bb4 with SMTP id i21-20020a05620a249500b006cebbe65bb4mr16700282qkn.674.1663680123718;
        Tue, 20 Sep 2022 06:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663680123; cv=none;
        d=google.com; s=arc-20160816;
        b=xXAsyHd+fQyrZxN/PFWREYoUBhMJ1bYIQKr70OCe9WvcCYAHVRnmiKQRiNSq0uX2HS
         +4H+p5E9/Z5GgGdY9YRBF3IleVxxVcMd3JUd3Rq+DzELyHlP60cUVVzUDy3rXzcE021U
         6znSmrPHgnMx/dnGhP5I5J3qMbTrGuAVs29nlhunBFJx4mbSsdy7YhNcQBR4IyUGKwyo
         97zQg+aaiKPWMcmnm2Kz0QqWb2/4tFSMwAPsPXkSbkTmU/A4Wb2Ea3WygFUaXKJqZKFX
         kmGNN0xcPSZg1pfGPP0xqMCvYSC2nPA86iDeEQVyDkQaqXT0AjGolHGQVrlhIUNpOCFV
         uZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jlJejkRqyElVwOwvIhKpBFmTuh+U/608/IF3/ae+hnI=;
        b=bmL/sxXB2Rkz4P7gB24BUGL8BIRYwD59tYbzC8RL3BxeGyjLVu/Z/MuDgmJCDeXyms
         g8WCb3pgzWXHP5SQHkrNm3ob65oTCbf1ZlldbRcABoyWJ6PMH3Vx3IABExWLrf25JbTj
         ZNj8L1xTXnuH86lo6pWioCQkmD0lKwxo313Wv2R67WhTjrwLMAVW1LX4salB/zfavVpe
         1tSe5lAw29ZLaSUDgCnQ6Oum0AXUcLbJsJ39lnd83/52SPmtKL1eCB2kB10NtCJ0DSrR
         1YDw5CvApVgFhbpDutDzGOyXDynKgE4Z6YWe7XWUYBR8I6WAYYTBJ9/R0N5r3goXpe8t
         UVbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CL5sqHy7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy13-20020a056214242d00b004738a5034c5si963638qvb.528.2022.09.20.06.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 06:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CL5sqHy7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oadCN-0005Gw-24
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 09:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaamN-0002br-Cg
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:47:08 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaamL-0007gg-Ec
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:47:03 -0400
Received: by mail-ed1-x52f.google.com with SMTP id e18so3234031edj.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=jlJejkRqyElVwOwvIhKpBFmTuh+U/608/IF3/ae+hnI=;
 b=CL5sqHy76H7xFtCYLA4vApbmYJaIPPjjQ8oGkfkoh2Eitm1ysrGgdac2QgVfXNoN7r
 xjCGS49VVp0KdX0/ZH17pNKJAAmzVIkkBck1wCHCmhZSgXCGaXTogVHYzVh60neuAYD8
 nf3CzyLs4qrne5dift4K9SyGToHwptDpEsvWhHKJFyQhnDEN/sXXhxDL9F1JU7M3Rmb1
 LrrIPZcAEvVPTW0pEXbk3V+H8XXX8lxzwzSgraXETCdhwbtQsueocWnz2BeIPK+BgbKH
 bhsDkIxaqINZ9sneA1T3+KGVdiNbtYCvPcptKbkT8oa6x9o4y72eNP1JCjDmOc0DjQm1
 ZjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jlJejkRqyElVwOwvIhKpBFmTuh+U/608/IF3/ae+hnI=;
 b=Cply8Qd0XU98s9ZeRKvICXFM855NEzQID8lfpekCb7rXcKKhnDcdAtozY9uX3kFnkW
 vgjcxdO6wJx3F+YxzzcX+BASEmtQW93sPBBml10Xu9pO/zQ8aZ2iL2VyJpxkxlMNM6Q+
 zxhTBciuuhe1eMesZrLEndkpWm+PHGDmCLuILkzgOEepBNzaWolhI1uqHCzd0pYOkC1j
 xUiQC5ui/yJHPtaTZaozYOHFR/hcveeVJJfoNhE+gEJOBcHevORJ/+MrBdPg8iNTSbOB
 IZiqUhM4W8UJ2wSIlL/XD6gkFpCsJj+hbFPV6oKi4yo/e8Oqe14SMOmuy4N6F56ugNrI
 iXaA==
X-Gm-Message-State: ACrzQf0UXLVI96EUlyB+nkYGLkd+qxmShmPfnpIct365QhQ3syydhiW9
 +qAVdHsiC3lmpxFes6u7/CVtVhIddiYTrlvPxYVN4A==
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr19834437edw.53.1663670819679; Tue, 20
 Sep 2022 03:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-5-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:46:47 +0100
Message-ID: <CAFEAcA-1OpVvGU-tQFfii2U_QumtVGpk08WJhAsyK6X2LxxsgQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] accel/tcg: Introduce probe_access_full
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wqVJYFY5gKYm

On Mon, 5 Sept 2022 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add an interface to return the CPUTLBEntryFull struct
> that goes with the lookup.  The result is not intended
> to be valid across multiple lookups, so the user must
> use the results immediately.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
