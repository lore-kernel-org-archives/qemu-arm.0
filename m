Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp641992ocb;
        Thu, 6 Oct 2022 10:24:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4SePtGXwK7sjB0zirJ43k84rVTjqI1ZdPTV8E4F71RsK+3JC7dswumnyIdbsDnolP4Wt81
X-Received: by 2002:a05:6214:2306:b0:473:f77a:85a7 with SMTP id gc6-20020a056214230600b00473f77a85a7mr1096233qvb.106.1665077094109;
        Thu, 06 Oct 2022 10:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665077094; cv=none;
        d=google.com; s=arc-20160816;
        b=1KDGAOqkeG77l1OfVklwMZ0R8o3RQ5xOnQrsllidAk67KBgVVJnStHAFn+HCVrTPQ2
         ZqBd0zLuZfCKhnKpLgcUtmIh4b/2VK6BRHZkWw7408PtUJJJB5i5yDZqRKGHxs3t88ld
         r8437fYuleuFeViKLc+nwPODwDvFwhS/AAmFu+4rAmEomUGx2YKSwJm/oGS9ARbR+Jsr
         BEuxwb2BqQCYCYtCBKyYrKrXwA67cU68RBSNovDLWuTOafQbULue7+c0+EGdYq+EVqiT
         kPNAjR/x//4M31xLO3sq4tUiXG6g9D+21Tagapdtsl7gbaF2G6fPok7wp5dDJBgtRxen
         ymkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zOMpRL+h7F9zGuHIDhDBvr/gm1SKgFYGmEHdgRf9kC0=;
        b=f3o/GYtY0bZroPCWrsRoElfxvu5Bsa0LOT0Gcm8kn7dEGEQvPjsLk1ZEk1YvpCuz8R
         rWdmso5/JmsPTUpfligEGOpvKW6xASPAZPqjunDrEv7uy1V+N4jF74TUipBG0BMkm6LF
         QKmXxZsSyX7W1ZBzyRi/KJivF6Xr4aO81CeIRM41fEkDBywtk2nr42eE+e4iT1j52la8
         lOHJenFHVm6esO55ijHl8cKWaZhcMo9tjlfRD5lur09lOoPSQKA/UNQyTEfdHFyYBaAZ
         wJl3u5FiwYJo01ghFuK9N+jRfItp7tVdS3nOtZBwrePtYIkt8VcRA5uvH9my+tdVF7vi
         sz3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NgAtzsjx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020ac81409000000b0039168924644si83921qtj.487.2022.10.06.10.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 10:24:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NgAtzsjx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogUc9-0007vu-Mu
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 13:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogTJ4-0005iz-JP
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 12:01:08 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogTJ2-0004LI-Qb
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 12:01:06 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q9so2234935pgq.8
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zOMpRL+h7F9zGuHIDhDBvr/gm1SKgFYGmEHdgRf9kC0=;
 b=NgAtzsjxoqUwOV2fM/EGV3QnHYTZTsEFuWoTazVzpT9XBPMeo0TtklTaJYtOTdE/+H
 0qUqJIFVLN0hSjBNJVs/rQw9+1UEB/tNcuUKi9RIh88OUc09vNUk8xJnOMuJ27SHElin
 MPyCO41hlRjpfOClP1YuNQ4QsDH28woL5V2AOEj4o8rZitwIbA/K6tkhSO9/4HRj+2gk
 HJRmbdXETxVpMFngtwyxvxyQAMk9N7tnIgqepbsP4vfAP10y2BDgQ6zPBaF11N/rIVmF
 jkjdJCmI6aysHFUIv6IC4LtXiiVj51PQnlhdjP8YVFv/Vkn851kU2BhV8TmrWBp9S27E
 8cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zOMpRL+h7F9zGuHIDhDBvr/gm1SKgFYGmEHdgRf9kC0=;
 b=g6kBJO2FCeWhWY1bsUOX2ubhvb2rYlBqmGfXu01WP9mPoT9ZWw+FtZZBQwy63Y7gjQ
 uXfhuCLXx4vk940gmTQuFIDSL9KlRMzouk97Xskvs/QNG6caVv0HU7GlNcOooWjCj2dY
 YkigixGLnzmbERAJ9tteizPKnn3NnqGIci4kIMuQk1z+13u2Qq1exjzm8B+eDE/mkj+i
 svlLfBFa1S4NopFNQxlu1Og3XJ9/r/j6TQURrUwj4aJ5YSI6mjLNwnwR6zGoOJvLA+jE
 9aclENoIPI8UJbYsen9q/zXUzERRM7UKqhLTsEXKyVvcUh78smVEWUi3vSPD5Vv2AFeI
 DypA==
X-Gm-Message-State: ACrzQf3xJWbbJIqO92rkxtGV25sh0SCryjDnfL6DFOUEc2CuI58RVmN8
 dSJ+l7WUeAGMeXJVXFVSwH/fXwuUNdr/6VIaYvFtfQ==
X-Received: by 2002:a05:6a00:181f:b0:562:8e02:ec29 with SMTP id
 y31-20020a056a00181f00b005628e02ec29mr567465pfa.3.1665072063037; Thu, 06 Oct
 2022 09:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-29-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 17:00:51 +0100
Message-ID: <CAFEAcA88G9GdQK3ZW_MbGW2=1sdHcwqp_sOpbjbG45Cwmgviow@mail.gmail.com>
Subject: Re: [PATCH v3 28/42] target/arm: Split out get_phys_addr_twostage
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJn1luoB0hDd

On Sat, 1 Oct 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 196 +++++++++++++++++++++++++----------------------
>  1 file changed, 106 insertions(+), 90 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
