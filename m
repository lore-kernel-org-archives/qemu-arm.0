Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp388022lfk;
        Fri, 22 Apr 2022 04:59:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznXNoGS508L67OoBv9y2I3pLJNEx9efXdj+T5x4/WYfi5dfODAGRhXPrb6Jt4DAs0XUfWt
X-Received: by 2002:a05:6214:2a8d:b0:446:5a52:47f5 with SMTP id jr13-20020a0562142a8d00b004465a5247f5mr3134271qvb.131.1650628753330;
        Fri, 22 Apr 2022 04:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650628753; cv=none;
        d=google.com; s=arc-20160816;
        b=OX8RrwlvdkdAG4dTH3a0mMY0q9QwzKmmr/Pjj65xflmBCTGYLFceBiYTjxouD0apu1
         5voMiMOER1Q9eFEEvsWNZLp5EJ3QahkeYuiFAVi92o2pkGUOaktX9MdEIiFp1Gv/8vyk
         zevSfmxt32FJZp9bMMfmvv/8/BY25zE5PWmAXvpoX83JaKOAyp61mrA1F+cGmiqwZvZi
         btvBeyCrU3oHIlwPYQsr6T38IqKcTfO4I5C9IpUoZ2RWq07YtiH5q5LWXMNtOwqLH9h7
         t38K0OMUfsRntmfcXM13wdbczKYl1QAnOtli4JH0Qqbzr3XHqO8Ui3qiGclihgW5SFPa
         JrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+91j+eyuLnBb0q8FeQycIi6f5Iut7p73vFWwqDQ+9s=;
        b=rQaNiX/OjqnYfwYn7w+dIRwjZTatopHCQKVmJaFV5jf6UgDYkQ8W55sInCvCZECgb+
         6pOPQc1lqbOLOOkw0NJMPACyXo4vsjJsbBSfaz5f1a6HiETsOTcQXK5Av83weQYtrQgy
         jaOpwPkcP0CGJp1b5j8Lq1Xs/Ujej81yUSpbVuGYDLRmFZwQoOxaayDvkk0QD8I3GYTO
         gG3/EvoDsUkS3LH13BEwPH8hj7d6DmvyGIO2ucpY3AxBTjw81ITGLCc8pbkehWLhE8P7
         kHlFJZoEZJati4dshqYM9ConMdzSiczGKUjSM86zEAsMLZ4O/cLRrF1OsvbV15VbIylN
         Dlmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qBiAmSkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj36-20020a05620a192400b0069c3ca2dd3bsi2124760qkb.178.2022.04.22.04.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 04:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qBiAmSkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhrwO-0005cY-Rv
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 07:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr9o-0000iI-Lj
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 07:09:02 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr9d-0005UI-IK
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 07:09:00 -0400
Received: by mail-yb1-xb35.google.com with SMTP id f17so13825918ybj.10
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 04:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c+91j+eyuLnBb0q8FeQycIi6f5Iut7p73vFWwqDQ+9s=;
 b=qBiAmSkmsWnpfAeahvQp78ztBjQxfGHMH3fLfiDWto6th4DZDD2n7qzTCzKAWmJb9E
 MGFG3CwBgV9GM2jUECESmb1t6TTRhVN2UUOcOauvv6ELxY0LOdi2ReOwMRiODERgoDyn
 qYJnnYkFvclyorywrShklZmzdQB5beWXjLdDUM8P1fkHt9Nxtt34XFhRgPZ55jMOkI22
 fKTBDDcC5KXX00K0DWrcVnDMAU/dTqbovVphWYzMyVjgDV+SqCnESeJyoVrPjnUiA+vb
 o+HUfu7D5F7T6L4BwUao3KbxFuS1u6d4KHhI/gXR2/rZtGe2CxvUnSSyel2Ykm6sR1UW
 oVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+91j+eyuLnBb0q8FeQycIi6f5Iut7p73vFWwqDQ+9s=;
 b=BJBkTIa3wQg4GTkd3tP+YM06V638tmGx0ycqOGnVbxKTWw22IEe8q9ZHZWxrv8nrwv
 6bmhgzsvDdZ0SW8ZhYcaVU+gu/KUiOzLzphlWHoZGhSbgmBOA/ZvczE4qstatT8LV3X3
 jO15jftSTt+wYqWfVg1qo2fvf9IZRLqXtpGHIg9xNSQQVMM2BdK7LJ3H/TtRdJ9oUPzM
 6SR2Gj46U8rvZOfIkwB5dR6sMrUWyou+ZNk0uV7RS/oWe98dRuuaCuNLjGYGpoGMoD9V
 bkPNGPhZS7Nu+A+/wyS3ogHejq7llXfadrtSklJXQiPO9M5pREArJy/SOFazeDK1v5Fe
 Uo2w==
X-Gm-Message-State: AOAM531c9OPVe8oFrnQpWwz7qbuRBwfiKRcAPwiq+4UKQAic0KjuDJ/Z
 a1GKNMDS+prxlg1l81kyUs6Nfnt3pzXw17tJ38rwyg==
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr3806471ybs.85.1650625726246; Fri, 22
 Apr 2022 04:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-61-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 12:08:35 +0100
Message-ID: <CAFEAcA9GqUEyJKVeb9uJBV93LneGdRDeThX2fr_6sF=T4O_OYg@mail.gmail.com>
Subject: Re: [PATCH v3 60/60] target/arm: Define neoverse-n1
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YlWerOC+UdPV

On Sun, 17 Apr 2022 at 19:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable the n1 for virt and sbsa board use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
