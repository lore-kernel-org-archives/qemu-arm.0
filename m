Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340D5105F799
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 11:22:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w10aO-000200-7e; Fri, 13 Mar 2026 07:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w10aM-0001zT-BK
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 07:21:42 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w10aK-000109-Mp
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 07:21:41 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-7986d231b3cso47362467b3.1
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2026 04:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773400899; cv=none;
 d=google.com; s=arc-20240605;
 b=ih9Nn/ZATx35Jfny58AxLLV0M/ghejR333mCAgabVwNlP+GEd4Tbl03BKpNyEIF+PQ
 Av4aUmHB1/oMIgzwl45PX92ekrHBHAOhhvxPYtaoMx4dkvapnaucKdhTJTLfVjOWa+80
 0GsdxDzncv8rcZ0MUb4uKdilFGw9uHwcg2ThPtUUCHvwq9egQKiDVCUAB+zLDoEjvdkS
 R4xjluFtWlLCTPJzDF+Rk+651lCyseLYrzfcBpWfeoRl3LEmh2DMiAvIFsyfWu9j5MNm
 bLfRx7fU8Sf4K9eUp62qpKBLf3n8CqYrri7t0AxWO8uK5JlTRsVt82i73JjJAI9LT3FY
 k2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=i7MHIa8+zCWa/p9y55Rg5QzXjj1VBh6YPCxDmtb04N8=;
 fh=sEWk1YINknzbp6RJZqgLz/pd+QwBP38B3aqbLNcdr3A=;
 b=XlNBx08x6TYDioX1iMlcCAeg1UtFjNiAX82Ns0D6qRdIzK2XlFObOJw0isxxNpgoYH
 4VV8+7dM7eJ2tSxpMQGCj4oouAQJU6c6cjbb6iLZNzHn8lOvMmD6KN+B0lqvlWe5zPMh
 eQsHenwmtC1r6A7W7+vxYUh/OHuLIZYkK+dZWQ9+R74Uavsgk7uOWYPFwqDobdggKgTQ
 6j8odeGC6JPk/uw6zMBqfPRSimesPm7r8+MaRQkbBeBlIvTRI3BgdeEtDH+4tnUSCZ5k
 XFCK23JcySNM7av0fLH5CSqv2P4XG4gMQ271PWzCos0K/AqG+LD2ZP9RCsipVXfOcOOX
 Ef3g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773400899; x=1774005699; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i7MHIa8+zCWa/p9y55Rg5QzXjj1VBh6YPCxDmtb04N8=;
 b=f2eYEdVsYtyHQfiPwqW7vVvLWxX6HSQlqyol8Qa8yA0uisZ4eHGtlEZF7tQQbwt+oL
 n9BxUmSuJO73WLS4tzNzmNRGQ+2KgNKByjZAzgIaK+rHky20Qd/s7+3NehKwxhSLCeKv
 o2dkdzQPTiSwso83KV03asiZxyWMMnOOQcOVSVxbcCeoU3z+Cuuo11hBBdqwz0VmUd+U
 t4bCmSR9dOxyC469I9psGgdPk36TvBfg6Bwp9i1WB8tZSVsMYcaDMaCPBVWO34TQcfw9
 aLuA1lCReywBg/WlzV0nb79jFDd08DEcwzqmGXMXbPer+6uHFQywhbPbRbVyPLEMBr2/
 ieHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773400899; x=1774005699;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7MHIa8+zCWa/p9y55Rg5QzXjj1VBh6YPCxDmtb04N8=;
 b=NauixKevDTsw9meEeST6BXqcE6IiZ42LFk9q6XmXTYMyoKijl3OsomGX2XmzN0Iv3R
 BaXbqHCKuLV5Oirq/guzdWu8DWEKu0DBiZoX3M122zITUfnnWQLgvFw9paINZUDQBRtb
 owSsyr5Kwy9JjGaKHF5ToABSdmt7eABbm2bjVksjmZxZIt1R9ZLCpRqnIyk8pkOab/nQ
 o+KDVWcBHzHhZgPukqOiSnNVF+IcUsX0EH/UY9H6JEXvcZEj+VswSbWrOuFGbw6XScZd
 9xtMCUoLXKCOg/cDbeyr5+a94zNPEAfnH4lIPZrRpzOPt/acl2sSo+YIauKOJMIQSvb4
 +v1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU40IydGfnqNl3pKRtfz6161RgQHh+ejC3Fvt2yW1btwibw743cgL8bS4tAb3kXwRZM4l1nWRLRpg==@nongnu.org
X-Gm-Message-State: AOJu0YynTmqW+AUAjHawr+ZkPm8pAD5AF+5Y/BLMBJUS32TxJVbBC14J
 7uW+z/4344lga+QVMm0Afa+y/04F8dVQeudtwWucm1Ao9eYa6d3UxeipGiduKWB5cxi4RYVWqbo
 1reZul4hNAlRFUsaN7KBs1LeIDRfieMN76esP/OtIBw==
X-Gm-Gg: ATEYQzyXKolink3xhWilVoizRgeiFDOk2+Yud7n2v6JqNKKmkZYxMOw2FqkgB7F9wDm
 VnlMXVN977CjYsVOY63W/9krLkCLXWwGVeG1DIke8TiGLF7K2xgkG8fPMt9L1Mg+QRy/2iulFMu
 u8Kf1SISuRUn4tkUgHMkoSYKSsujwfr9ajus9EozECMUOfdy/WccknU3UEzVZCkfjmMBvO6hOQs
 hOAjeJhqa79a2ixJVOk9nhK3QnGlXsxTXfs3MxOiG7WZ0Icp9ytVmjRamBt38ooBgpfNQdf/fZF
 RQhZHG8YAGY9hU1ahmOJTi+BlbZ4DRkO/Vo0qLW1eGyB8v91/yy/MdTuZOBQIZ0nMeY=
X-Received: by 2002:a53:8581:0:b0:64a:d5b1:f899 with SMTP id
 956f58d0204a3-64e6287021bmr2196407d50.36.1773400899094; Fri, 13 Mar 2026
 04:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773236195.git.1774596582@qq.com>
 <tencent_7A1227883216A4103DA25F5A585E86DFE307@qq.com>
In-Reply-To: <tencent_7A1227883216A4103DA25F5A585E86DFE307@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Mar 2026 11:21:27 +0000
X-Gm-Features: AaiRm502Be4IkcFLcBJtFsipIg0rjAboayLuc5jK9wxT6XPXjlrdlfp-jvMZisQ
Message-ID: <CAFEAcA-N_2FiPze83xt_4Y4+SfEfhpxB_MFsW365Ot4euvXnmQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] An interrupt is generated after the DMA transfer
 complete.
To: 1774596582@qq.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 11 Mar 2026 at 14:25, <1774596582@qq.com> wrote:
>
> From: TaoDing <1774596582@qq.com>
>
> PL080 cannot trigger interrupt correctly. Reproduce this problem in a simple way.
>
> In the versatilpb board, the interrupt output of pl080 is connected to the 17th interrupt input of pl190.
> By reading the status register of pl190, determined whether there is an interrupt generated for the corresponding input.
>
> The basic address of pl080 is 0x10130000, and the basic address of pl190 is 0x10140000.
> Read the value of the address through the qemu monitor.
>
> Configuration
>     ../configure --target-list=arm-softmmu --enable-debug
> Reproducer
>     ./qemu-system-arm -M versatilepb -m 128M -nographic -S \
>     -device loader,addr=0x00000000,data=0x11223344,data-len=4 \
>     -device loader,addr=0x00001000,data=0x00000000,data-len=4 \
>     -device loader,addr=0x10130030,data=0x00000001,data-len=4 \
>     -device loader,addr=0x10130100,data=0x00000000,data-len=4 \
>     -device loader,addr=0x10130104,data=0x00001000,data-len=4 \
>     -device loader,addr=0x10130108,data=0x00000000,data-len=4 \
>     -device loader,addr=0x1013010C,data=0x9e4bf001,data-len=4 \
>     -device loader,addr=0x10130110,data=0x0000c001,data-len=4
>
> Qemu monitor
>     (qemu) xp /1wx 0x10140008
>     10140008: 0x00000000
>
> The result correctly after fixed
>     (qemu) xp /1wx 0x10140008
>     10140008: 0x00020000
>
>
> ---
>  hw/dma/pl080.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

