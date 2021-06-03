Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp204111lfa;
        Thu, 3 Jun 2021 05:58:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNQh2Y0VVPl90UPg2mBaqmBoxjCMTNHNkQLPICWQ/sskLcbLVgLXZdrXZYriVYYasqSMQU
X-Received: by 2002:a37:6244:: with SMTP id w65mr2877848qkb.304.1622725132544;
        Thu, 03 Jun 2021 05:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622725132; cv=none;
        d=google.com; s=arc-20160816;
        b=g5hjU1lnDirxkWqcW6TYkPMhoKUSWJmIZavtfDY8IbR5/K3C3raOnN9sFPzgjjzvvA
         qkYKU14g2KxBGFl+w5/H/dW12J8rJaV5G0SD8hWCcKYZRMcZ0Wv320ZQQwOgL67wkLCB
         c5VWsjXiR6k31dvpPCQXHB7RdQfTArk6kVA+ObVboDsyzg4TVYRwGJG+Twqr52td7N21
         tlcyRAXwBa077YrKpR209PQv+CmdLzi8hA28Z5w1kZ9F7nf1+iE5/OnzgNALOcaY5w9r
         BtK1BFeT9a+nYNSqG/QjlF1Dt45Ip1Ml8RjCUDcboQt4bW2vacuS597kYqCJWP4KiBm/
         faPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QQIvVpx31q6wXMgO40cinFWb038Lva1Yx9996rq1+wo=;
        b=La9KQxij2eF/3FwlCaXvlrR2ph3elYQEMkQIrAq9FE9tvanx2kOQyTp6iYgrTkk7fB
         pinrZazQtw38/UQ3U9eGUac7OEsvgqhlHSwQBLEz2nTzFFUryu0np4OxHjQgjxk99Lsd
         XTdUiZxwt1h+BklJW+JgveBtv/VyPB3BeJb79pq+2H6/tkw+PNvW04/Busu6+E7CQun8
         L6U7n1rEIAc/mV7W1CTPbb/3GxWd9bGUMtVAN5E3r0dYY1qMFD42FpickwhRNPkdmq3a
         dydHkbl7CNiWEqETNg5LG/8RaXW/N2Ca1yR5W6TS90R9Gl5uvu2lMmP/nCvrTGYV5148
         StwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U0re6Qnq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si1727785qtr.293.2021.06.03.05.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 05:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U0re6Qnq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lomvz-0000aD-UA
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 08:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lomui-0007do-LE
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:57:32 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lomug-00069d-Am
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:57:32 -0400
Received: by mail-ej1-x632.google.com with SMTP id ci15so9040587ejc.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 05:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QQIvVpx31q6wXMgO40cinFWb038Lva1Yx9996rq1+wo=;
 b=U0re6QnqE/T3JsI6hzDMpGafb3qdt39f8j1CDHYdVXjtYmHl1DqEjTMq0LAmUjSWAZ
 iBjyPNEJBXt/8loNmzQSLcN3hMKMNS4tR1apfqtBnjeNjVsyOAtHyvpH+G9k3MkeVFgL
 ZavG3YY1/myS9V0tgZJ0y1qbWfJOpNXH0tsC91yIqeurpOQKiM+DdU8j2o2sYBz4U/pd
 3SCqJ0Bcu0XJtcTDREuCVpR6ZGD+lrVolncKviBEfAfoYkMMe33NIVxFS9N5PyyrzPOK
 Trx8cKkhX7wJMtkOCzMp9G7fPvLMKwCaH6D5Sfn6hpS+U9eOBKgFXcQRjCYF9OkIhMJR
 tUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQIvVpx31q6wXMgO40cinFWb038Lva1Yx9996rq1+wo=;
 b=EuOnm5iWGzL1H/eLnzNsQ7jtG9LaMq5uX/PAQSNK/ZYUZNBwinOJJr/huv94zv7Xr6
 bM8y2cJCIZjknVtmfoocRj82BY9bgBQP5mswisBtOldQWnRUllnR5jRr2tYzB9b9l4UD
 ctt+ht92bJP7OvaHjnFdskMMTwhXthbXybmHJ/345x6xm9dT5n8AvevlTJe8P/AT5U+C
 HaZ1wwi+jAdTLa0NEnAZSqKHISjKOc4Vsmb0VTR7O6mEloP7P2gf9w3Ovh8+OMqLxePc
 ZMckcE1mZiFTxjKynejrJSpju2wxjotCXmbvDYqeKcxdEBXlCfseyWVbfqBkBTZmG0Zu
 BJ1w==
X-Gm-Message-State: AOAM5329Hckls8TjVv1KQff3laehr35F3s2ll4laoyUlXhCapqyXgK+i
 PbzFJGQ8ZgLrkOa8DUMkvy6oZM18CcdGbOiQp8R3lg==
X-Received: by 2002:a17:906:4109:: with SMTP id
 j9mr11239264ejk.250.1622725048132; 
 Thu, 03 Jun 2021 05:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210603110012.1182530-1-jean-philippe@linaro.org>
In-Reply-To: <20210603110012.1182530-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 13:56:55 +0100
Message-ID: <CAFEAcA-mGR3S_z7OEYhQwCOyYO_mX3QkbTOO_vcY3yz6OtbDUA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Tolerate spurious EOIR writes
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oYgPInyg4kmU

On Thu, 3 Jun 2021 at 12:01, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Commit 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access
> check logic") added an assert_not_reached() if the guest writes the EOIR
> register while no interrupt is active.
>
> It turns out some software does this: EDK2, in GicV3ExitBootServicesEvent(),
> unconditionally write EOIR for all interrupts that it manages. This now
> causes QEMU to abort when running UEFI on a VM with GICv3. Although it
> is UNPREDICTABLE behavior and EDK2 does need fixing, the punishment
> seems a little harsh, especially since icc_eoir_write() already
> tolerates writes of nonexistent interrupt numbers. Simply ignore
> spurious EOIR writes.
>
> Fixes: 382c7160d1cd ("hw/intc/arm_gicv3_cpuif: Fix EOIR write access check logic")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 81f94c7f4a..1d0964c9bf 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1357,7 +1357,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          }
>          break;
>      default:
> -        g_assert_not_reached();
> +        /* No interrupt was active, this is UNPREDICTABLE. Ignore it. */
> +        return;
>

Makes sense (and looking at the comment in icc_highest_active_group()
that says "return -1 so the caller ignores the spurious EOI attempt"
it is what the code originally intended).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Shashi, I guess this also fixes the assert you were seeing here ?

thanks
-- PMM
