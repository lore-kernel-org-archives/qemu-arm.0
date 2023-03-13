Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp387588ejb;
        Mon, 13 Mar 2023 08:19:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set/vVrNDSAwe40P40r2qJXdXLXFs8lJWAEDyZKibhtwA01debUjJo1AIREXa8qytq22XiX1Y
X-Received: by 2002:a05:6214:3006:b0:56e:961a:b454 with SMTP id ke6-20020a056214300600b0056e961ab454mr20096609qvb.21.1678720743482;
        Mon, 13 Mar 2023 08:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720743; cv=none;
        d=google.com; s=arc-20160816;
        b=zvJY2GZP+7cWYe8qYxH+80PdvczlySxvDRx4mqH3Eia/WOfnlCaZXOPRjq0oo3XfBC
         70g4DKvIaGM5s/0SgZGxtmdzMSNkUbWOLvFr+FJJtvkG6/cwiSbvSRahvwm53/mfrmPi
         VFP8VHikFPcJ7sYwIb8ZhVN/fuWOFIqFJKBlvvLpPlIatjg0XoKVyfgYQ5hnxVz25Byo
         aMFlSgtT1JYvY3Z6mEEVKIblxkRpvLsM7Z+NUFTzGvjSFTyBk2L94r5otHiCv69RVK6D
         9SHYhXN46eFAH7e99wDAxDC3jkIBltqYYMnYpyYdIiNZ71ICL0TUbXyBBEKVYJOAKtxy
         NcVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/FxbcIBMjcx3ILsGfqyiSecPE4Nz/JkkWnxGE3Y/Py4=;
        b=D8k/p0uKxPcUux3jpox+L/2lX3dXNaZe8/O5hlW6h102ttHXU8l8Xvyt69zxRVvLjV
         QxEc2bvpfKDSoYr+9ZP4opmIdXKf/PiFjlW4AiA+vksy3eFV0Ij8l5XjRzQN/qebeYCG
         K7fvd7xw3OuFe+KGk25vq3/yfDVU0yPZE5SP/P3f/IAzp84DLH/Wf9+9GDtho/WM+k9w
         5z8RKj2bRFVnSdrsfphyPS/3GJVCmqYvCbLytnGw+UxNd5wDlSZVW1YhcmLBGChdmK7h
         WLM0Lv4rWo412JSGUWYgpLBk1L+XrBa5140bHIVF2WfNomBptSumb90etm7lxSdb2OQ8
         TxMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qvAg/fWU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a0cdd89000000b005a6040a842bsi2347803qvk.544.2023.03.13.08.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Mar 2023 08:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qvAg/fWU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pbjwJ-0004QW-Gx; Mon, 13 Mar 2023 11:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbjwB-0004PG-5x
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 11:18:11 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbjw9-0001IM-Iw
 for qemu-arm@nongnu.org; Mon, 13 Mar 2023 11:18:10 -0400
Received: by mail-pf1-x436.google.com with SMTP id ce7so7824759pfb.9
 for <qemu-arm@nongnu.org>; Mon, 13 Mar 2023 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678720684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/FxbcIBMjcx3ILsGfqyiSecPE4Nz/JkkWnxGE3Y/Py4=;
 b=qvAg/fWUFeEj+bEwEK4c6yCpsQ7NtphUoaxaT75guRa5BTsZW6rlFVygw6H7taXyg5
 K5zMmyDRKsOMzG7gY8jNouIn4pEcRHaSWLPRGPXLvEq1RYBySPOLVyACVtn+2PRlmQA3
 b5Gwv9rdtzHeUOa3/+cQDHKHxvaTE7NIUgXb011Br6ozbNoGLzPinab5dhLPRq0zb03X
 PLiFlmgqV6fuQZ119fazTsICoSFb/j74QiYTLFM0uaRmr7K3Mt5EF+2Jnk5Ih5bxi8Tb
 6oaYcKfZSCUymeQqgp37YZPVciU0XxKSPHUvVjPHOkOIRJgQtbd/9sY+GFvqeDc3bDD5
 HoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678720684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/FxbcIBMjcx3ILsGfqyiSecPE4Nz/JkkWnxGE3Y/Py4=;
 b=fPidxMC2hJ93VgXJ/8CRi5hRcjNaQpM3PT0ZIAhh8k8P9b8zZkVPuGM/HGNrx5O/gx
 mVtvf3wqUTxfiUj6Td2Y7lbLfd8wJiqlba3PRk/AH3HCIK56654VKiGKZDFL5nygv12T
 nJpFTT1yw9bkB5XnlICjMptPHDsZ1nN4mFLmt1ldFFNfHbIu2OoWPT6OZqQg9DIY01oG
 lkamLoqL7mGPVC/cPufEJom2upgq+R112tdKXDFvb6CWMkrmLHKt2VdO/L0rWGXimoAW
 hYBDi1Mw+S+B37SnvfXR/C4Nf/4qh9uf+BTU1fbii+bpFt1h+egvn/E9/MbIuWy9B/9k
 YTpA==
X-Gm-Message-State: AO0yUKXDG2dcVvnVfkrFjbXf+nLnwUU4TMpFwV1ERthS+n8OPLyIlOVj
 lLk6NV6KVemGUxEcaZPfbBXID3n0eDPa0ICSA/mVzw==
X-Received: by 2002:a63:7e11:0:b0:503:913f:77b9 with SMTP id
 z17-20020a637e11000000b00503913f77b9mr11725676pgc.6.1678720684203; Mon, 13
 Mar 2023 08:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
In-Reply-To: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 15:17:52 +0000
Message-ID: <CAFEAcA9zQeop9NTJb6W-fSZ+rdODRvE19914syS9sDApEiHpfw@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm: Add Neoverse-N1 registers
To: Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: mydFZB/24T/H

On Mon, 13 Mar 2023 at 03:39, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
>
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A. Since there is no DSU in Qemu,
> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> ---
>  target/arm/cpu64.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
