Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp507288lfm;
        Fri, 10 Jul 2020 02:31:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6GRyVoUGDV4hbXz3t1GTnVE9Lp6z4dFYOPAVMKUxlLPyj3YqkgRx3aU0cuu9TFSxeifO1
X-Received: by 2002:a25:3f87:: with SMTP id m129mr116560639yba.371.1594373515128;
        Fri, 10 Jul 2020 02:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594373515; cv=none;
        d=google.com; s=arc-20160816;
        b=KH1Efl33TGTW6QoY7M2IZmtm+5d0ZbHT3LBUxRsiAbRW5r+Mu8v78Ip7dwGDCdiLMG
         tCLn7iMnqzKMgMfQQTA0ZN74OU6q5lI103tIK1BfEvAtFVaf5BYo9IYDBlCm8XzSTgv1
         YEFGURMUnVcB6FLPCblbIp2ewSIuPfnUXIF08CPYdxKI4Kt1EgubK6UTDj0wmsgSctfs
         7yzCe3EZRHQYhP4lx+c2L9IYV9bc43DTok8/mgWUiCJ0m49XTaSh9Vj7axvo0YyndtjQ
         c1A4PNIlW5aHy9c/fSdcC5vnglMeG8NrKsY5xEQu6+9gELcr407EQ24GdNKcbGR+nJx7
         p1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l52sAvcIm5tmQUlv8CvRIOI7WmSWL5PO4yCvHNh3kCA=;
        b=0IZ9HdToM6DqsCkZlNHx71NCBP1E5Esg8Y95fnep6v1sg8RR1XbSjQLpaY74uzXL7N
         h4OO+Cwy/9aDn4vJfhqYME4jSGNghjeU5nEaxNMdnEaHIbltyRbqU33CmIImRo9fZv2J
         W3fXQgmmONO6+pas51XEqGuZNY47/wGVHZIqTuHWEDvD8Po5eiFbrcyLY3HVdqI1NIpJ
         gBzF9XgIP939/JP7eYrt+cvakqTaDxh5hktByDanB4B9Xzu2gi7TVTFvswX3qsnT0ya9
         6CHOLZ7txJugiJAj8Ph1ReL7rj/k9UenVFDn3r29Tx7cCh+6RaEAQFg+axtDjbKQrehV
         t+hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XcvakxNW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si5380917ybd.22.2020.07.10.02.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 02:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XcvakxNW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtpNq-0000fX-GL
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 05:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtpNg-0000fB-WA
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:31:45 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtpNf-0004f0-1Z
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 05:31:44 -0400
Received: by mail-il1-x144.google.com with SMTP id a11so4545651ilk.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2020 02:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l52sAvcIm5tmQUlv8CvRIOI7WmSWL5PO4yCvHNh3kCA=;
 b=XcvakxNWDtWH0vZPrYNPYgFjLaQz8KP/UnFhbgRjDXVGrPnbgfUeL5SYuWdNpBx1nZ
 ME0xao82HEIRpTgH0moeup9k1LpWsiemiT4a20Jwhb4MYVBT+JCXoIWUjd1vtzoSq2Wp
 CENauk2bM/ZUM93DT2+UjUIRHYWCaTE1R8FwV+IlBmWNTnKz+FTdVJiYVejD0RnVptdQ
 QiGTsLetNtuOHEh0HFAZHElWZ92oMYY9cko/Ob+14V/ldc8bWacTxNKGupShayG2oCGJ
 Wn8DeB8my1GZlLyAcijnopghSdd+561XlL2ZBrLExKCc4YXcFd3je55DZxm9BqPO0aCX
 L+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l52sAvcIm5tmQUlv8CvRIOI7WmSWL5PO4yCvHNh3kCA=;
 b=j923kKxN/lxEwfX4KX53gGHVT6Lm5DW1IONaEYiokiPUvycbUIarPEMENSYtaizVRw
 EKcWspQJ67gP+qMIT0pq/Td6U0Uncy+IawLZQR3Z9CSWCahbSKgjuZPaBF578U2HHeKJ
 UVHNnMBtKzbnbjn2Ti4xBjQGFfJgRbqWtS7UgxpoJ1cklfoIPsy9ERiFqltp37zCg6iq
 hHjg2mgs934SV1xF5VH3tQtqLyp4pbKQ6Gs6Z2R3PCH1IAOtwYUgr5jUY/ERGYxM3HkY
 ESbtGp95YiquqDkdvzVtoDANeGNOS8xi4GQsxy56WebnroBLwm/rNGaBMx5aNmX7ycpW
 dcIg==
X-Gm-Message-State: AOAM530rY+oA4n9ft8J+qHNOOM/EpEODmqmWXw6UyE3PJJxuYQgETqQL
 MazI+AQyqrvIHr1I2f0XQo0sfsNuzqYvMsuslIJnpw==
X-Received: by 2002:a92:404e:: with SMTP id n75mr10624672ila.203.1594373501717; 
 Fri, 10 Jul 2020 02:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200708141856.15776-1-eric.auger@redhat.com>
 <20200708141856.15776-11-eric.auger@redhat.com>
In-Reply-To: <20200708141856.15776-11-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2020 10:31:30 +0100
Message-ID: <CAFEAcA-ZS4YQkSCLqryf+7CDD-KTCLREtu_NRi_UjEG3_KWpww@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] hw/arm/smmuv3: Support HAD and advertise
 SMMUv3.1 support
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=peter.maydell@linaro.org; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SaeE9bJd6hvP

On Wed, 8 Jul 2020 at 15:20, Eric Auger <eric.auger@redhat.com> wrote:
>
> HAD is a mandatory features with SMMUv3.1 if S1P is set, which is
> our case. Other 3.1 mandatory features come with S2P which we don't
> have.
>
> So let's support HAD and advertise SMMUv3.1 support in AIDR.
>
> HAD support allows the CD to disable hierarchical attributes, ie.
> if the HAD0/1 bit is set, the APTable field of table descriptors
> walked through TTB0/1 is ignored.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
