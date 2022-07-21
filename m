Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp3298463lfp;
        Thu, 21 Jul 2022 06:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s5OXIeqAbKcpzz60unWLUv8pgUfVYmxNGK3ztmSxckVpnGXU5nEfRPb7zQTgoq+vuDAnQi
X-Received: by 2002:a05:622a:10a:b0:31f:1cf6:70d4 with SMTP id u10-20020a05622a010a00b0031f1cf670d4mr133129qtw.139.1658408925599;
        Thu, 21 Jul 2022 06:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658408925; cv=none;
        d=google.com; s=arc-20160816;
        b=yvG8fde5wkYYbiYzEJ7lfZOtyIcvwIm388A89kYNd+H7OtZLIARh6UnpmLII1kGrKw
         UmL02gYIQ5m5Rc3cWQTFCor2yEsuKTNV5aYgDBgMBVQnqBojqujQKJuY4uUiY6twgwsm
         svetVNU4ENnYYc9VRkCjSVgI7mH5TEjLJNBeY0/P3VyZWN8rbxQ0ga1L15f5BOXROCJx
         Cn7szldG6dkIW4ECtsyTPBxLXGciv7YMn9roziYs6fRjaJGiomkkvBoZwwKoLaR0uL21
         QtI/PPsl3XwZq3y9EdiNpuWzgm0OGOHGou4L3tMLYJ7aTT70uTK5AKrdZp4LGvsWSu/+
         egoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BNMlqnANHJ9WpzqbxsQT+pCc4CSOqxnJNO+ACEGGAzE=;
        b=l6qlDfcSlKf5a7aDWH0bO08gnQBYT55wS8PqzrHIRFha03Rt+HU705W023hjm0xsfn
         ZoRFN7XgN3wkx5suJZc4SEFOKCdc56s0/5HcCceqKntkRWj33tTP0tPC1Agu3N1yaiNk
         /MNAKs6BOA9D/MqIernnU8So0P6d26J4P7ThanHvih/ur2vtKv/lpyyhoo+jRsMiQzqW
         RjUg2K/+wbUtYsBvt4m7DS3ArqlV43MQNSAe1w7fikA0+xjhmg6miwCU9nn0gA4Dapdh
         EQVrmXDkCcRsIG9f2axq8NFvVeTqDeSiX4UBhTxMCQYAofB4wg0udPS3ZqA8nAJMhGu8
         V9QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CapwChe/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020a37a80e000000b006b5d8eb30bfsi1139728qke.288.2022.07.21.06.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 06:08:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CapwChe/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEVv3-0005DH-1W
	for alex.bennee@linaro.org; Thu, 21 Jul 2022 09:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEVrC-0000tZ-Kn
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 09:04:48 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:41702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEVrA-0003Of-7z
 for qemu-arm@nongnu.org; Thu, 21 Jul 2022 09:04:45 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31e1ecea074so16251227b3.8
 for <qemu-arm@nongnu.org>; Thu, 21 Jul 2022 06:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNMlqnANHJ9WpzqbxsQT+pCc4CSOqxnJNO+ACEGGAzE=;
 b=CapwChe/Wh57J2GKOg7t3fW27tMQtVVP2uvz7iCjjO22hWqeXDTLo+a4BH05cfi+Sn
 5UPoWRRCg/z3VVbLIAeaD/nhiTCWV2KehjvksTVWthuSRqac/e3CMwpjz7wRUmvHMRw3
 hn1Yjzn/rRMSdRr0jBLgQI63ot4AbqGifoc48jtIkvQgLCzyotFEZw98W8goqlnhZVPZ
 qbiLgyThRv3QlG933oYM+LgLRSa6/M04KLoKzEDawjKoCz29/fsbNHjxz7vYG/E4h11A
 dHN9sPYa0BrHriJqG7Aq+Fjr6IWHb08sVuAIjhO1lRxptE7QJbM82GXeMGvXc1X6qcap
 g+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNMlqnANHJ9WpzqbxsQT+pCc4CSOqxnJNO+ACEGGAzE=;
 b=n+0r0n9Fekr2cZXXy28I5+zXZxHcCxBtQnvk8EHDQAhn1oH1h/DwIZ65iFY/uJRm3d
 DdxEJY8oY2FpIKNAuOCNEIQ+4ghsrhh+lytS+1fY5DnSrr0s7OBlwDvehzJ9LSRXIPyh
 t3Kl8/j5ebZyrVrmIoYFKCR0sx+BudFDO/C6zgQQlkt3JhqMrM3V0qtS0YoCJssQm1Xw
 QvLBJBDED3nRD/rGg6lYljNF65OfMU78ZwXI7ZvC2Mjkx0WuoskaxDq0qeujMwgav8cj
 /2j25pQPjsEnWApHlXmXYtMeYsfa4c+WCa2t2orBBtsianC/MXUveLaLu4vhMTG9sS1t
 bWyw==
X-Gm-Message-State: AJIora/xK4DFDMzQi5dRYv8BmgmQxTaX//fLJ/oDYGHq9mRjP/mebnXH
 9KDUvLMzV36ALZSUtMU6Vfe5j+ZTWMv24LW2MUL9uw==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr46046827ywb.257.1658408683085; Thu, 21
 Jul 2022 06:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
 <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
 <CAL7npF8d6LZHZtLWe65JiwQW+X-48JxLa2xBoGdxjJJWpKx-Fw@mail.gmail.com>
 <CAFEAcA9SM--_+Ret6fZwvWNe0J3E8TE-+do614TtTpi0rbAM9A@mail.gmail.com>
 <CAL7npF_8ErAn2cvFBQxVCdP96uKpdRQMs_3aL_UW5OLzm3Q=GQ@mail.gmail.com>
 <CAFEAcA-cTzrA6fZXw7onDJ77NMwjBrSFVwADYmttCgdOf9ODYw@mail.gmail.com>
 <CAL7npF9H_eKi0jA_m-wV=jSHy9hc6re7TpTe2ni=9NYK4CxRpA@mail.gmail.com>
 <CAFEAcA8xV-BdhvwvkzRHxqqEX9BAwDJGwHS=koBRbDeGHwQHEw@mail.gmail.com>
 <CAL7npF9bOP=bPtyFS-K+HgXGy9+W11M0ELRJMqQp1-JB_jVx1g@mail.gmail.com>
 <CAFEAcA8hbU7PJK-YvOkbjj2F2PBW1M9J10DkHqUPXTSxYOS-5Q@mail.gmail.com>
 <CAL7npF9neZUWweuZFqDkO5mh5=tZj3ybjZUvVoF932cJibpRiw@mail.gmail.com>
 <CAFEAcA9CnC5P4Myf1qMO=DLas93+kSVjNvnj6Vgty_yvdjH5vQ@mail.gmail.com>
 <CAL7npF8KNQKyfeW5ONY53+_u6Q4H8BDtY386Eyt-+gxaXdBBJA@mail.gmail.com>
In-Reply-To: <CAL7npF8KNQKyfeW5ONY53+_u6Q4H8BDtY386Eyt-+gxaXdBBJA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 14:04:03 +0100
Message-ID: <CAFEAcA8hVyCwMbQ_ZNUgw8Nfb3wTvRk3gvUr8RC3gSH7Pkuv_g@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Umx7oJWa113a

On Thu, 21 Jul 2022 at 13:22, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Hi Peter,
>
> I already did that with my application, here I send you the output of strace you requested using the application delivered by you.

Thanks. There are some clues in there at least. From the
host strace:

26585 14:18:22.936490 write(1, "Remove timer 0 536880\n", 22 <unfinished ...>
26590 14:18:22.936513 <... rt_sigprocmask resumed>NULL, 8) = 0
26591 14:18:22.936542 rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1],
<unfinished ...>
26585 14:18:22.936566 <... write resumed>) = 22
26590 14:18:22.936587 rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1],
<unfinished ...>
26585 14:18:22.936610 futex(0x905ac, FUTEX_WAKE_PRIVATE, 1 <unfinished ...>
26591 14:18:22.936631 <... rt_sigprocmask resumed>NULL, 8) = 0
26585 14:18:22.936651 <... futex resumed>) = 0
26590 14:18:22.936671 <... rt_sigprocmask resumed>NULL, 8) = 0
26591 14:18:22.936691 rt_sigprocmask(SIG_SETMASK, [RT_4],  <unfinished ...>
26585 14:18:22.936715 timer_delete(1 <unfinished ...>
26590 14:18:22.936735 rt_sigprocmask(SIG_SETMASK, [],  <unfinished ...>
26585 14:18:22.936757 <... timer_delete resumed>) = 0

So the problem seems like we're straightforwardly deleting the wrong host timer,
rather than being something complicated involving race conditions or how
we pass the signal handler the ID value or whatever. I'll see if I can
work out from the code how this might happen...

-- PMM
