Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1445747ejb;
        Mon, 20 May 2024 06:34:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjg+iBtN/NnigONFN8ool2uXCKu67RzR8CWpOxMOBSbHNG6y96ndt/5pj0ks9LQBHpMt6rPcmCPLvkIn3e8LPWIbDgBa4a
X-Google-Smtp-Source: AGHT+IHW+4p9SSXnzJpebNxC1LKfvPBJD8v7bidnnmjcbCxXfwRAOfLR/m3jZcytVjRNAtv/J/+O
X-Received: by 2002:a05:6e02:1546:b0:36b:3a3c:f1c3 with SMTP id e9e14a558f8ab-36cc16f88femr330631365ab.30.1716212047958;
        Mon, 20 May 2024 06:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716212047; cv=none;
        d=google.com; s=arc-20160816;
        b=vox599tK5v5VFmC/bIjhaWp3xwMCT73bl0iAcmL3EvUSdHcBF2I3hURr7D5gSnu1SZ
         bPM+G9qWL9IYbwBBlWbtvbc/PoG09DZN7MK4s9SBuA7Uvq5wWAKU3CjfHNxaiXcyY43n
         EVw1XyCcMft1YEOpTBZyVkWyORjHd3jN9pzGs/nP5j5pavx3dbXGuxfKKYPAo4iLSEVS
         CaNjKqGZHhYWsREnKXzWRFjn1IKCtdrfrJDtFhVEbzbV+U9geXLUF8rgXq7RPTYCRx+y
         PmmDam75T3Tn0nj/Nib67u0y2/YG9JDMcqOozCoopZlDdzhreUeSZi0+Ho+kDmOzJKcH
         SfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/xhUt7Ys5fiocTW2IHLmuS2NWIIF3Fg1f5heled7zrM=;
        fh=jt9WyA5S+0wO5//f2kClh7ihONdU/ZRvtR8jIFwrYjg=;
        b=P1FrQKWD9E4z4tMCGj8QEfIefxxLgCaaTUos3AVCCp+orLIwLao73Cr1cGkIInYMlC
         E5fxi8V9+Zz0Em3YjslK2l8Ay72g9uvi/F4bFfv62qkyuICxeac2Q0rVBmExeg7wAWJs
         gTt4ZY8eFhpOcX4IdqhiZDvfZD7tyg8HatpRnEro/Ro0jSkRY0BqBHMy8n2Eib2GPHmk
         TClZqMrDjgmlEAUomkFJAfh0Nc477wb/T+m02LaUZYmKst/1+bDDM+qfge0rFP4AtZ9/
         aBPIWTkAWxSMOIyaw94oQNhvMI9+J6Hyr4fcQbf1HrA59JGgThb+kKnuxInOBX4+zo1G
         TF2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UqDLfwdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4806cba988fsi3986573137.184.2024.05.20.06.34.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2024 06:34:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UqDLfwdS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9397-0007Er-P3; Mon, 20 May 2024 09:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9396-0007Ej-AI
 for qemu-arm@nongnu.org; Mon, 20 May 2024 09:33:44 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9394-0004X3-HX
 for qemu-arm@nongnu.org; Mon, 20 May 2024 09:33:44 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5231efd80f2so4642341e87.2
 for <qemu-arm@nongnu.org>; Mon, 20 May 2024 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716212020; x=1716816820; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/xhUt7Ys5fiocTW2IHLmuS2NWIIF3Fg1f5heled7zrM=;
 b=UqDLfwdSinJ9fQZ3cSZFkJZT5lJdwZSev8Jii7dnsYOs8TlaBKnRS2N/s6qhDbuaxB
 pd72QX469YJ6YMoqJBJxHQGts/n8VQRrv8Xsyyf+Xl4iaOLyi7Lta8YIQp315Thrjrm0
 MvQG8lyyo+C99QERhb+k3CjyFsdwum+q52tBzg71OEI70bXlJiZzbdHlbWr/2ZanmI+q
 68cQaSGXny3MY4oBBvcrj4iSInD12vB2g4odyBjg/M9jQfEtdJZe5DJhCKczKQAlmW48
 MXj4+iEK/p870kb2N1xNF/Tn4SlDo8n2ihDdttmrloO5yMenE/3vs7b9FPzZVaDY5EHZ
 DnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716212020; x=1716816820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/xhUt7Ys5fiocTW2IHLmuS2NWIIF3Fg1f5heled7zrM=;
 b=Lczp2hmjY17ugqcwhncbB+CLZ0OjoGPvQ3YO6/blEMxlaDWi/vrPaxJ4/VIRI6Ng8O
 VcqCcC7TQ3Y8DCNQprjOa5kvtx3Q1R3SRvP3OlNLW6CnVVaJQE3xsjfZmT/VPCAs0OG5
 AJlemoaM10cWtqQwJPjCHz5Mi/xdiXEPwpnNBKljDO1otYup+8ZP3XrYkDIqjnKLnH//
 TyUJQM6E0766Rs6WGGICCToyhiSLSTnJZ8oPnE8jX0sI9cwwKI7IAOThGLMw56sy93Pv
 jJzHIqorAsgtueKtStdGWmoybM6oNlYZn1iroQRbH7XwyTtoq2fU83N4h2+284zhhBRt
 5Kyw==
X-Gm-Message-State: AOJu0YyM93SGwdfUG5e/Blmg5Lj78UHQFQotH6ERtVmyq2CtfCjxGXze
 WaGj+wA9P4ZgK9pb/O+epTcELxR3PSR7HzhMibDwuwsyoPNV4raM0mj4N+T/+QrqqDjY20Uzhgj
 ZPXyiX7I/erQ/7JROaLYsoP4JMwRJZ3rPOUBZVA==
X-Received: by 2002:a05:6512:3990:b0:51a:f1bf:544c with SMTP id
 2adb3069b0e04-5221007483fmr24088259e87.52.1716212020497; Mon, 20 May 2024
 06:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8DAt+o-XZepg8xtj4i3xLW_yChwPnDZVM0O=rW8+9qJQ@mail.gmail.com>
 <20240507130038.86787-2-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240507130038.86787-2-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2024 14:33:29 +0100
Message-ID: <CAFEAcA9+uOJ73Ot-1T4P=Uwk-oMBtJxm9ZEHWESXHb3yuZTwPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc/arm_gic: Fix writes to GICD_ITARGETSRn
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: IqsVNTaTOv8E

On Tue, 7 May 2024 at 14:00, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> According to the GICv2 specification section 4.3.12, "Interrupt Processor
> Targets Registers, GICD_ITARGETSRn":
>
> "Any change to a CPU targets field value:
> [...]
> * Has an effect on any pending interrupts. This means:
>   - adding a CPU interface to the target list of a pending interrupt makes that
>     interrupt pending on that CPU interface
>   - removing a CPU interface from the target list of a pending interrupt
>     removes the pending state of that interrupt on that CPU interface."
>
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> ---
>  hw/intc/arm_gic.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 20b3f701e0..79aee56053 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1397,6 +1397,13 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                  value = ALL_CPU_MASK;
>              }
>              s->irq_target[irq] = value & ALL_CPU_MASK;
> +            if (irq >= GIC_INTERNAL && s->irq_state[irq].pending) {
> +                /*
> +                 * Changing the target of an interrupt that is currently
> +                 * pending updates the set of CPUs it is pending on.
> +                 */
> +                GIC_DIST_SET_PENDING(irq, value);

Looking back at the 2021 thread this is the change I suggested then,
but I think I was wrong. This will set the pending bit for the new
specified set of targets, but it won't remove it from any CPUs that
previously were targeted and are not in the new target list (because
GIC_DIST_SET_PENDING does a logical OR into the pending field).
So I think what we want is
                   s->irq_state[irq].pending = value & ALL_CPU_MASK;

> +            }
>          }
>      } else if (offset < 0xf00) {
>          /* Interrupt Configuration.  */
> --

thanks
-- PMM
