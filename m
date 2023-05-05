Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp410703ejq;
        Fri, 5 May 2023 06:16:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ56nw+z9BbYgfm/biuRvwJs2R9a5qiRD1qxMTJFULm4Gh/0I5UEpHadLthueCqPUNfrQkLN
X-Received: by 2002:ad4:5be9:0:b0:619:27af:bc58 with SMTP id k9-20020ad45be9000000b0061927afbc58mr1500001qvc.18.1683292599543;
        Fri, 05 May 2023 06:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683292599; cv=none;
        d=google.com; s=arc-20160816;
        b=tfUDZYPI84vwx26fE3CNMhBOyW7rUZA9dQjBfnRTsXRWa2yLjrzwsqLiNM9XY9Ico4
         DVVqxaOJmO2ps+sg9+ZWHGWM6LkeH7PQIjJkCCXro4k8337ZwBlDUJ9rcnR9Cr0q+hh+
         H5laQ1vVJPUuvtGQql58FZix+zALc469v/PtSVuckkf91amBq29lUuATA19C9ywpOZTn
         HGnwNB7Ul9DJreBy7hjSVyETzNSZpSTfieDg9WosMMioNNglOLkuj+MDYXhl/bUpTqp6
         A8de/EzMFVd+gFv8cRpsSphwQIm2y31WHZlNyNHXwe/klhhFvESBQ8atdgl7uAB99aMP
         mhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ksokDlqGyof+YvdYVqLNg/mcRdiA2tk9KOt1P1Hhccc=;
        b=W/ThtdBkWX98PeKNMl6YliWLWRVz5E0u0iy/SP/hKZg3cZ9qveQoyrlSCn293bqUPr
         smmrpoJG2AXb3F7tpkDfEPcEiMwSYkMNSv/t7xXjbnLMKM55XyaESwtJ6aDEJ40FWIVA
         r0chFZJjQNvCcUEa+X74bsxfqNN/DHun1rzIHaNqjCuhJvgIIqUT79yCS+d/HPC9cWqp
         i5UNBjDUzPUeGIthxMULUVq6wYJ/55VKQ8Rk2uUWTwuWgYpUoJC/YHXRUUymIPzrTd7E
         OEow2aBRUuaiLeWqcVWtL10DXJfXHRTZZkV+Mf+qBz9610D8Dg7U4+lsWWIUNldMVHYJ
         Ve7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxWyVOIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020ac85f4e000000b003e2b529e7ebsi561826qta.53.2023.05.05.06.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxWyVOIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puvIN-000642-TT; Fri, 05 May 2023 09:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvIK-0005x1-NE
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:16:20 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvI8-0005dW-I7
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:16:20 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so3358363a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292567; x=1685884567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ksokDlqGyof+YvdYVqLNg/mcRdiA2tk9KOt1P1Hhccc=;
 b=mxWyVOIJqGRKzXytHMDvB+IXMOHN0IC9asjSTvMtrsYhtuA9NxkB7EQe404unsZ9B4
 gw5lBH0fRTVxqUNaiMm1/1Bh+p+njj0czKnAVxal8SBTRJasao9T4/Zv9A1jGhWxoh3M
 tXrt/83osP9prKUI8X4c1IpsywNEhKPPuyLDEF2dky+p8B6LJa7nzTxqT9XZGyXvMY/S
 XBFr9OewCyTyFdwqBHBUc/359Ej18WBxdUlEl+AZ/0/xhADxzHVn3GfhxTrryGywTcME
 MxkMo+FgfuVk/nP5uX4cMUHWgdYiPRU+9ncumAyHVBmyAhKE6q7IjCYN1nrgfgdadV3s
 NhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292567; x=1685884567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ksokDlqGyof+YvdYVqLNg/mcRdiA2tk9KOt1P1Hhccc=;
 b=hej1s1YndQbn8ABg+Z9jOH2aIJVN/+jVzK9K9x6KIWrUE756wKwdYVkAyv6cUPYqht
 agy56ASLHpSxH8G/wp49u4ATNDCpF7A6BPEFMWONcCWUNeAVtddwqn32IiXR+HIfiBv6
 MrqUTtZ41Ctisns/7yE4zuiBkflZrpKEnUELmjBzOOpctPkcskymc0xU11TrbllZ3SZB
 OwIE3cGppWsyU8BpNeH/cEnXxX2yR8UubkjiqvVULCcEzJwsoqQk8Jvw3jycVQVwqzNN
 ve3HK4DymQfhkUJcxTJbp/MCP8OpELH+4z+qWDtJKmV9tTmhGQ2DEW7w1pNXgOutpsz+
 nGuw==
X-Gm-Message-State: AC+VfDz/UKKZ92coFSaP12orhn4Y6whSvqlw9lrpWbB0yB66cqdvzCAk
 erjo+cPf+ZiZq2wqe94NgQDgGWDSlizpmsIokrn5bw==
X-Received: by 2002:a50:ed06:0:b0:504:8014:1554 with SMTP id
 j6-20020a50ed06000000b0050480141554mr1208785eds.28.1683292567007; Fri, 05 May
 2023 06:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-46-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:15:56 +0100
Message-ID: <CAFEAcA8g0Bpy00C1iAGRMYGCg4GtjNrYVw_L=vhxR_WyK8H5+w@mail.gmail.com>
Subject: Re: [PATCH v4 45/57] tcg/arm: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XrvJjyczM8VX

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No change to the ultimate load/store routines yet, so some atomicity
> conditions not yet honored, but plumbs the change to alignment through
> the relevant functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
