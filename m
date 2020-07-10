Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp581599lfm;
        Fri, 10 Jul 2020 04:07:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkqScZ32qP3nn9id/PfKt7ZgsLQOBSz+7zyBn84IN/DPjkZX7n7U1cKvvALBoTgp05lvM2
X-Received: by 2002:a25:4c81:: with SMTP id z123mr18021179yba.433.1594379241948;
        Fri, 10 Jul 2020 04:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594379241; cv=none;
        d=google.com; s=arc-20160816;
        b=OGxvNE5nlLskz4hnCjdxh9kWSOaO8JVGEnx17lNZwAMP3mea0GYK69RUw4vDBJeogm
         pHov94USs3rAJ7OVetRpUtcyTo/wBmatp/R+aw/4cV3jbe5K8oxOH1892vSlxjdkK6jJ
         Q8uajXp89B67STjP4WaRzJ77Cq9u6j1GBzirbjpwfhDCn4WouSzAkrZaTY5PfzkmyOV7
         Pm99Y845tq119IIjCavZxRB2WtASA/vrg80D9d8sWPVe1SILEJtDTdx+hvxKz1VWj0cI
         P6GK7qA+LpuuEeApybGqXTbCPCatoCi0Gyl/0XlFzXB+230PObHi2wNb+Zv4SNAAuA/i
         bnNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xnXdh8oSQlqOdWk5oiWIM/x6Ix8ycMlgSMO6IWyXku4=;
        b=VmSoMZHuXRXtixa1EAbxtLOEiuiwAqtJSyUdKPniNU/DqYhxaoyZzxbcx5ABEqhliB
         oShYkZSHHn+hc74LRsAuBdQX+jErELqi6U1uWG/DWUl12xwurn8rd1MZKjJfyhfDVmc+
         mJg4i9ypqdCT5e95I+S68XEddBpUoFPEZ/RNy7dlW0eppkbMxq65hx4ZU52bAzSo9CDE
         5sJa/Yi1Bw6oGwvNUrsy8degqjNiSe8JiKPsQPf8lSDxkcxwq6RcLUEjVQBxV9ZwEi8s
         M1idLTtOwzKQRVbYLi67Xe9Us3M9DYwd34yG7ZaPAu2ld0NMvx2uqKXgZSkiOrEi5/GM
         c3ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u+kRtzdg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r71si194287ybr.17.2020.07.10.04.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 04:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u+kRtzdg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtqsD-0001UW-D6
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 07:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtqs8-0001UJ-1s
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 07:07:16 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtqs6-0000ND-FQ
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 07:07:15 -0400
Received: by mail-ot1-x342.google.com with SMTP id 18so3917980otv.6
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2020 04:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xnXdh8oSQlqOdWk5oiWIM/x6Ix8ycMlgSMO6IWyXku4=;
 b=u+kRtzdgLjJHuywTiURO6iYLtE6rHZIQ0t8t5n7TM7FJmuzk2c6XVLcOBfP+4F4Ebw
 lFucZC6NREFaUCInR4ASj+YheZd+dw1F4kITwgAqN1hs0PLck2Z9WUfK7A2OYCnWeRKY
 c/wfh6H1p4Y5cyYv3q1vsGhEMmxIDwSwwHFYBRWGuXf0cR+yp5tmW2/FfcbEeFVXJ3mh
 fzY4wFa6KIg9pxk8cTyPGLO7VNpXhwxGoxZZnl0b+WQb8H+D4VwvPbj9ztfC/4zlVxZv
 ZmWldBmz8XgmODXYNVHOFIPFvkTj2ayOHb9XHHBHgx3Gvbt+Mmsxhmm80nnINhJKP/Pw
 BKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xnXdh8oSQlqOdWk5oiWIM/x6Ix8ycMlgSMO6IWyXku4=;
 b=OUu9+a3RQ5YntpvlbxRwcftMB9yXnsv3F7JXEx3qfxt546l9sCdykXzkZGJaImPPLi
 A8neZlGX3gl8yOG3xOIInclbdEAwt46ick7OUYqq6iku5WrG0G23o6Nr4ja26E7lkccj
 30NBKJxPA04NdYQ/e3Xlv5HPnLcl15owgzqVPrgpaFF08jJIeClidGOwtTaU+76JSFfr
 Eh+b+nUVQtXvLgGT5mya3huax9b0FyerhIU1JDacC0AOUbYJjAaXfgQe/l0mj0b8qFfA
 G5+TIdl06hPB13p0Qul7+gFXKr0dq6wpbN9mFNnLkRK2Pq4akY1JussTpHUnLD+isRtR
 8oLw==
X-Gm-Message-State: AOAM532aixm+TWf2L9cvZI5usxWjB2J1x4i9xX4eHBPkC1aeQYUpBWLW
 Znfu6+hlkLdcq14s3tJN1CzUvS1Mo7iFss7Py8tgfg==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr50911267oto.135.1594379232994; 
 Fri, 10 Jul 2020 04:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200710091940.641296-1-mcascell@redhat.com>
In-Reply-To: <20200710091940.641296-1-mcascell@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2020 12:07:02 +0100
Message-ID: <CAFEAcA9XQUcdiy2x18Zr+EYDaJ4hY-1Bd-DgL6-j6sJi5Ow+Gg@mail.gmail.com>
Subject: Re: [PATCH] hw/net/xgmac: Fix buffer overflow in xgmac_enet_send()
To: Mauro Matteo Cascella <mcascell@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Rob Herring <robh@kernel.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 ziming zhang <ezrakiez@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l2Hc9DTFAnTn

On Fri, 10 Jul 2020 at 10:20, Mauro Matteo Cascella <mcascell@redhat.com> wrote:
>
> A buffer overflow issue was reported by Mr. Ziming Zhang, CC'd here. It
> occurs while sending an Ethernet frame due to missing break statements
> and improper checking of the buffer size.
>
> Reported-by: Ziming Zhang <ezrakiez@gmail.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>  hw/net/xgmac.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
> index 574dd47b41..b872afbb1a 100644
> --- a/hw/net/xgmac.c
> +++ b/hw/net/xgmac.c
> @@ -224,17 +224,20 @@ static void xgmac_enet_send(XgmacState *s)
>              DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
>                          "xgmac buffer 1 len on send > 2048 (0x%x)\n",
>                           __func__, bd.buffer1_size & 0xfff);
> +            break;
>          }
>          if ((bd.buffer2_size & 0xfff) != 0) {
>              DEBUGF_BRK("qemu:%s:ERROR...ERROR...ERROR... -- "
>                          "xgmac buffer 2 len on send != 0 (0x%x)\n",
>                          __func__, bd.buffer2_size & 0xfff);
> +            break;
>          }
> -        if (len >= sizeof(frame)) {
> +        if (frame_size + len >= sizeof(frame)) {
>              DEBUGF_BRK("qemu:%s: buffer overflow %d read into %zu "
> -                        "buffer\n" , __func__, len, sizeof(frame));
> +                        "buffer\n" , __func__, frame_size + len, sizeof(frame));
>              DEBUGF_BRK("qemu:%s: buffer1.size=%d; buffer2.size=%d\n",
>                          __func__, bd.buffer1_size, bd.buffer2_size);
> +            break;
>          }
>
>          cpu_physical_memory_read(bd.buffer1_addr, ptr, len);

This is correct in the sense that it avoids the buffer overflow.

I suspect that we should probably also be reporting the error
back to the guest via some kind of error flag in the descriptor
and/or in a status register. Unfortunately I don't have a copy
of the datasheet and it doesn't seem to be available online :-(
Does anybody have a copy to check ?

thanks
-- PMM
