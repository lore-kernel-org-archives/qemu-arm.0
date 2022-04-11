Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1755320lfq;
        Mon, 11 Apr 2022 09:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHRVSY7Hdew1Dle/VnMkJ6177A7X+BOh4vt5sJxNY1TQ5WfCm3zNZvTZKHp4Rczl975Nqw
X-Received: by 2002:a25:d2ca:0:b0:63e:f52a:989e with SMTP id j193-20020a25d2ca000000b0063ef52a989emr12442202ybg.497.1649695492374;
        Mon, 11 Apr 2022 09:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649695492; cv=none;
        d=google.com; s=arc-20160816;
        b=YeNfSnGNTGV3eaMCDS2uSeKzZXYVgkUBHxKSXI+zSRK9SXvhvzfzzsK/o7GLOkrPIW
         coMhdAe9Jj9mZlj3e3XYe6pAU9uceilkH804K3qWDSlU9unKwF4CAgSNYxkyvc1B92tr
         xG9teV3UNR6QVN7I7xS/16PcRu+ZBUCqdRx6fnAO5/ckGZqnIWSF5tuWe2I5PKx7WVco
         1Ljy4/CIQa1obwPcrw28uFs2n7QernYoFqw8B0I6qzaqA9oMRYugBDnvE2DB2XFJLKp9
         Fs6NauEZuZJPMYuJaKKfNCCvKr82zj8lJLBz5nhOAg5QnN7VoqS5NVcAJM02Gx/+PR0v
         m6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I1M5IfmsxMfPBWC7kMQ0VDwWxmnmVjAtSlUs71etqmI=;
        b=rZ5LC5Ub0oN4bNf2Dz3LKvVMqskvTBvHQEjzjVf/LLU65Hu5fyKTzK4AtxZYg1NDc/
         BqgBJKc64mFs9plRXnM0zdFP9GG4iMp4wwDWJjjSp7/mbdFyZbecbH3w4vgDQXuxakFw
         FR39sJzec9AjIhU3KDj+Y3AkvdnGbP2OqiYkeSi6aTROst69gG3QHF+Q/0Yinp6tarde
         ID7YIxoWAz/7QbNKBm0wxbBxJ6aP4CWZr5jQN+XUIXPaghRWToFzQQCpB+zuJnZzhiFE
         nl9Kl7RhrKtEOEcz9LFbiUqYhqiZm4yKRz+X+LEnE6n3cJiJfe8T4Ej36Gy00qldiJbb
         NfeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=clgTQBlf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a250607000000b0064126a9600fsi3331293ybg.548.2022.04.11.09.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 09:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=clgTQBlf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndx9n-0002V9-LS
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 12:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx8a-0000Qx-TJ
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:43:40 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:43993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx8Z-00022g-G0
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 12:43:36 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id t12so8011806ybt.10
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 09:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I1M5IfmsxMfPBWC7kMQ0VDwWxmnmVjAtSlUs71etqmI=;
 b=clgTQBlfIQz1L58kZcgxzE8Z67aWuyZqQQymbJzNIre9LsnmeMvbIDzufkFDZzI27c
 pnRDjGpFv4JFXviYSD/Ocra5e4QTKtua/lvxj/VymwOe/xeIxJb5zH8GD7GqFhLFh++6
 pFvAfpthGTHeJj3ffV1E4VJdihcnb61fFwiPQ3b2zyOW/UMXusVn5GvHC8vSOIQ1CNg0
 981ok3F+tA1q0Mt/uY9QWmdtwfMpRE+OOzrWEUgVcIXsCY3KAGqGddmoL/qJzNjxfOJQ
 EoW3n/j8HqAkrubfgriiJx+vxjVPCFaGM8QicW+C29rHTuxzCbUcGiwM0mqq3FlFYbV9
 gI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1M5IfmsxMfPBWC7kMQ0VDwWxmnmVjAtSlUs71etqmI=;
 b=1FaIOMSsZtZYOpGJ5iIyg1WbNLKXV1DPms8xdpiX2zxJcIgA05aT9EIgaa8HL1z/iS
 nXGF1h7OPXE6aWWhMzQNVU3dmBkzXFNC9Tu14M20yD8wtGOGzIMkBSu2L1Qr9ghlkbGB
 OSeyhgdOhDS7LwFM8/WVYRkqfuiZwn4vsVN3MVKI9IlHfEGwTFmaW38vJlz7GMQKXxwO
 MMFCTIASxqG61t3AKP8zXHXftuJdQk9DyVlqKzB3NVW2/siBxj6fPXZgbn4U3ic9kJ07
 zg7xrVEyHitv3XlTwOx+53XsMU7gL4WcQ1Vtxd6C3JV2Xh1qEr7rbZ7AOK5IVMICAQWE
 RIaA==
X-Gm-Message-State: AOAM532ifXo7g+ZAgFPUAWBstiuBYz5tvH2ywJT0MgkZsmOLH8h57ddF
 +yxuM4k96wpBzkTYTctCnWe0YLY8F2sav3Qj7QoCCA==
X-Received: by 2002:a25:488:0:b0:641:1c71:b0ff with SMTP id
 130-20020a250488000000b006411c71b0ffmr8342842ybe.39.1649695414208; Mon, 11
 Apr 2022 09:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-5-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:43:23 +0100
Message-ID: <CAFEAcA_z4FVw=pcwcbxCxfU-WHOKtc_Ah_F49wseWziUghEEqA@mail.gmail.com>
Subject: Re: [PATCH 4/7] target/arm: Enable FEAT_CSV3 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
X-TUID: NmC3GWC7nQou

On Sun, 10 Apr 2022 at 07:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This extension concerns cache speculation, which TCG does
> not implement.  Thus we can trivially enable this feature.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c   | 1 +
>  target/arm/cpu_tcg.c | 1 +
>  2 files changed, 2 insertions(+)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
