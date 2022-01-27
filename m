Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4327185lfk;
        Thu, 27 Jan 2022 11:37:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDq1CE9yIIVWDg5Wg1MLH2n5EGuCXUq66LfEd9cQmqcBRmgfTtmos/F2sGiXKvGx1A7hmL
X-Received: by 2002:a25:cfc1:: with SMTP id f184mr7497465ybg.708.1643312230385;
        Thu, 27 Jan 2022 11:37:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643312230; cv=none;
        d=google.com; s=arc-20160816;
        b=XClRTCrBu85kbwDWAgaSyeMnGxof0ikR0G6sPu5S7NhO2QTrdVzoYAlUfx406sZjXl
         NbTjkl9WMV+/jAL3AipjUADy+VwZT5CHRKr6e9IbLSQSBltP1lRRNBmHwpep5Q3U5j8B
         222jz2oLLq86lCM0isFXiEA+e+urJnJQMcIYvgq8xgdCXOvGznlMLPzYcnckY0noHz2x
         JlR0VTswPqgRc8Lekne8I7FNfPGxednSd4q02bijKUfZtJJppS1EaJpQmx1+v9cLPUvE
         CpVU2Q4eeUTWMbsoQTUaV/pyrynwgi5zaxTssfVHOjbnB6NVMkqan5Hi34R4/A0Puso7
         LvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mcZuOLroxzlzn7tNEC7D6xCnhbf6fPXeI65Sw/+lR/8=;
        b=LTE76ZBFpj2iW6ooyHK+jPzKT9zVXFS18h5jMbk/eA3ymVPtaeN/JBKp8k4fBST5o2
         hg5v/m7qS6Q+dIPL0cStwkqvNk0TRyfNiJ+d+DlRA5SlCpcmSF3MLFMs7ooqOufAilQi
         k4V/kHDDGre6RJFK6/6fDisb5mip8QjQBO+9z/9Nl3uaqmcap1Bkj+8Uf4GNVvlY8DNh
         NxZEx/Jvsz6QvsjLGGdGhdlWHEXmwnLPq+LWrBsC2Vygu1oGIMU6DtwvM9EWXsNlV9eg
         4YwSHQ1Ex5uTgaPQ4L3+7XLCiYmU3AK8YfqHvRAoyzmnKCGl/vz4Q16Tm9kNkUu8x8fb
         6+rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w6ZCMkmB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si21054447ybw.763.2022.01.27.11.37.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 11:37:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w6ZCMkmB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDAZx-00036Z-Pb
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 14:37:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDAZZ-00034I-0v
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:36:46 -0500
Received: from [2a00:1450:4864:20::436] (port=36785
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDAZX-00020I-5I
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:36:44 -0500
Received: by mail-wr1-x436.google.com with SMTP id u15so6674404wrt.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 11:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mcZuOLroxzlzn7tNEC7D6xCnhbf6fPXeI65Sw/+lR/8=;
 b=w6ZCMkmBpw2SsRtusNISGq/pTlwmuaNQsxI2pFr6kcsb6VJsUN1KP2A5ZNjtOGgZXO
 i0WcDeLuNIc/cEdoYaIItkOOk/cV8LvD08+56kMA0ijCWvetJ89oCDg/SlI/Vt0fOtA9
 cHUrh8yHeGtTqQnA8togO9JY0+tSH61RBAybORkyZ0A9Ho1kh88eclQiEFUC/mFn3Vug
 yvmAghzfenw398ryVCBvASPjZLgWZs82PePIoAs8mDWLlXxCTyH//FnJkAuMiFRBiWP+
 e1V57fpLZKLYL23VnZaYsc4bRKREEQadIoSFchyX3ipSEKGGoeSLH1qpCcpf3+Z/3rVn
 ohnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcZuOLroxzlzn7tNEC7D6xCnhbf6fPXeI65Sw/+lR/8=;
 b=AaqwYi57D7ZpSZ5Jm+GOv0rfhaSDvHPoOXedktkFuCzVgPBdaRDvBo/dUvm/AZe2BM
 yU61knzyGX2NVIneieriyt2FsIXdc0yIfV62pxCtXqbSSIn2n+eCI9RaymiRL2N9eSrT
 TgfqJkYr23sT9O3weOFjxgcgPlJ42SCwGRn9ctyUSnPzMRSLY3qq0op44YG8dkJvIGjH
 4PfMVtr33ZL0FNL5CZEI2WODuZi9blzhTJXQ1LfdOP/8KBtM6n+Sp9wbUnrhSrnuS/Jp
 vLT5SwXXKWatRLWoAVC49yusRtsU8W36Wo8PR4+gz9JHvdpZ8s8HufYfEBI1mOpF3YQ1
 6mVg==
X-Gm-Message-State: AOAM533LQ9F+imLZZZsIY2Y6q1k+iW/asfJ4hOtjzg+4t2G055ebchRF
 sSrIhiHdJeQfElJpa+DtsjZHNDr+aceOc4pjjpTStQ==
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr4446975wrz.2.1643312201381; 
 Thu, 27 Jan 2022 11:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
 <20220106230936.417020-2-titusr@google.com>
In-Reply-To: <20220106230936.417020-2-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 19:36:30 +0000
Message-ID: <CAFEAcA-9naSHGZ3GkqcX-vawzkyn6mybeWVMcXb3e_aAgCqjzg@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/i2c: pmbus updates
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: minyard@acm.org, venture@google.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x/1svYJ1GNOM

On Thu, 6 Jan 2022 at 23:16, Titus Rwantare <titusr@google.com> wrote:
>
>   - add vout min register
>   - add PEC unsupported warning to pmbus_device class
>   - guard against out of range pmbus page accesses
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

Hi; these different changes should be split up into separate
patches, please. Each patch should do one thing and only one.

> ---
>  MAINTAINERS                   | 12 ++++-
>  hw/i2c/pmbus_device.c         | 88 +++++++++++++++++++++++++++++++----
>  include/hw/i2c/pmbus_device.h |  3 ++
>  3 files changed, 92 insertions(+), 11 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f871d759fd..6349e3da1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2790,7 +2790,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
>  R: Bandan Das <bsd@redhat.com>
>  R: Stefan Hajnoczi <stefanha@redhat.com>
>  R: Thomas Huth <thuth@redhat.com>
> -R: Darren Kenny <darren.kenny@oracle.com>
> +R: Darren Kenny <darren.kenny@oracle.com>
>  R: Qiuhao Li <Qiuhao.Li@outlook.com>
>  S: Maintained
>  F: tests/qtest/fuzz/

Looks like the whitespace-change again, same as the other patch.

thanks
-- PMM
