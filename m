Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp218170lfg;
        Thu, 11 Mar 2021 03:55:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGPnX8Mo+eM+88Ot3vHPf7XlITyA+/jJ8i3Y0RWDqZ7rzUbrsUPIyxcnb3G+/VyoDHn6nW
X-Received: by 2002:a02:11c9:: with SMTP id 192mr3142470jaf.135.1615463750197;
        Thu, 11 Mar 2021 03:55:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615463750; cv=none;
        d=google.com; s=arc-20160816;
        b=wLkTRh65wiVCT9wP4qwP+1lRo3J/5rv1+EdMcJGFWid+VYpCwddPmHiz0K6sso1D4A
         GLhlljhLjkBxIMb+82hhIPTwol9g0PsHiOVMEKP0WhWSIJ6/4cH/GZFKbO8Jz6BYqVfn
         8LWgiqxnE509CrUi07/+6GGBRWpPItjiU/25/pO8TwyVL8KSfBCsNENq9IPRvsVgz/Ef
         z2+Qmd5QROQD6E0/3krHgABYKJeQx+F4cV/auDLBefBmnOwdreyRaybDsGM4aUJOlLJI
         ZhGIJTxAt8lmK2sn+OzrziDD2eLA5QE50I8y58qbS75R6FRoli1G5rIQNltHecnYlze6
         dW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ngoTJXYonkmZMmfjgy+YZG5PZCuSFl953vdeTF7axBs=;
        b=wn5pYrjCDPYP2fkwPFhreKxYKYbMpKrQs5KeyD3m7144j1ndwrbSHmcDEXO5KccWrf
         av+R+VARHBHw7HIrDV2YkFG/QZPIhr16fLuGzlHg7sqRLm9HU5N+G26LbfIpiydSGI6y
         7o+vbHrWBVXjDVa55x1cnCjJKqp/h8W3LEBSMvDicof+tkRfP/ZP/1AvkamfORn3VYHO
         9qQmpQzY0ASiqyEI2Tj/U8NM7DMUJPLB2am6fgG6TTu+ZCl9BPRRj5lDPL0UBAS0GOyx
         1GUvhGCCmLx9bpzvMlspj9Pa1ULCSibY0CSAH8Err6zTcp+4SvGrYO4FNz9zH5KvYaGh
         oHSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aUG25z0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si2950361ilf.35.2021.03.11.03.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 03:55:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aUG25z0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKJuv-0006dD-Gl
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 06:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKJul-0006aN-MG
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 06:55:39 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKJuj-0006bQ-Es
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 06:55:39 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p8so45612072ejb.10
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngoTJXYonkmZMmfjgy+YZG5PZCuSFl953vdeTF7axBs=;
 b=aUG25z0GYO5iKLOi0WH3QE1eMjVOPf3cdsgnKHWtoA9qi29ox8nnz4o5Z4DlTprCdd
 0+X0q1QdfZ2t1ceqqd18emww0/zr/a52YijAWaDbNHF3VGnBIWRskLPjua48oAJCIxtq
 jH8LHdUFtX6gvj9/YMESPd3XvkXwEFbKFLs83Kp9k1LRPVsCp6NxXr5BZLMZ4BKPf/7b
 Anr7DT/xQZ18cTm2q6/F2cGqwCsYdTOv6rlccyzFELplcY2yRWGA0QArerLREHkAGKJ7
 1WTWZ6hFdkGWq2FKLdNgWyhprpgl/QwbSPg2IRoqZToeGTGTU+kt84BDDp7C9yb6ig1I
 RB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngoTJXYonkmZMmfjgy+YZG5PZCuSFl953vdeTF7axBs=;
 b=dkbsSAgA67UpI78njR6s+tS4gAfphuAR4LnTUgv8eMM2G32Nm7QmP0Dpt7PwFeDuyj
 uLtB1qOED24f82u6ZBE/7NQt/6RejQPPaJ3uIc8JD0eBijZIxYxahSxXB34FLQAJvWjS
 BS0OZKShUVrUv/K0+xyWs6/9UXnOAtJ3dbW429fLQ8rTm1bVhIyWzeu+CZo9ZQkQOjMg
 yD03w8AXyaXp4oexVEilE0jp5UryARqHD82vawpXdwO9zHtuntRN+7agzb/As0xD7ia/
 LALM5t3OP5iSBuMhGYdVUuMbd+7FdE/EWTN8eRAAooaWwS/MiW2gDd48jGzBKgpJiZhp
 m3Xg==
X-Gm-Message-State: AOAM531JR1Y7EJc9dFah3Qwg6iAZ2LjPyRXrEoWJqdafnixot+Sy+V3N
 eqzx0VZe93n13igvs58W1UXnxJTadwnXfmb1nhmDqg==
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr2703960ejj.4.1615463735220; 
 Thu, 11 Mar 2021 03:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20210308224637.2949533-1-edgar.iglesias@gmail.com>
In-Reply-To: <20210308224637.2949533-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 11:55:16 +0000
Message-ID: <CAFEAcA9oej-fc_hHsXCNQdikRzANwNEANxFqyK2LBJ9KOsGUbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm: versal: Add support for the XRAMs
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nTXoygsXRe8Z

On Mon, 8 Mar 2021 at 22:46, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This series adds support for the 4x1MB Versal Accelerator RAMs (XRAMs).
> Most of the controller is dummy, but it's got enough to make firmware
> and some of our test SW happy.



Applied to target-arm.next, thanks.

-- PMM
