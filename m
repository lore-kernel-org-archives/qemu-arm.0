Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1881028lfk;
        Sun, 30 Jan 2022 15:38:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkgchmEl8qXvjPRCbgBjQNbadA9Dxgski5XdGuuQdseBv1wOz/kmWlPdgfDDRtTrF8pkSK
X-Received: by 2002:a25:86d1:: with SMTP id y17mr27548865ybm.243.1643585886525;
        Sun, 30 Jan 2022 15:38:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643585886; cv=none;
        d=google.com; s=arc-20160816;
        b=Lr2J7FFzeCXZbp8tXDK9li0erN2XJSQiHyaa8jPZL94VNxaeEAgbMjhHyTOYaHC+lp
         ubfnnep2sHHWtLiIs3tLiBm7BU74R60LXPo1zUxEsrp4QKJ/A2jOb0eiP+m9vvXNr37y
         j1sGNSp7mAnHpbLViY8f5qsfAv4N8c4daK/QFadVjAMcw3RyP2YmgwESToFp2KtZXotp
         NUKpP3ygGqkfzAosJn7mmMWwxIcGWJ7uz2iO9Ldt0jCKkIt1EcRR6Lh48eoi2/e2Ghsc
         aHkAHX30pgXCDGVym6hPb7Gtphd3cw8hDrLjJPAVWNkfolHJxIDMdwQHlWDJUVLuucM5
         aLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CzkPakoi0PJ0ai7zLwa78NGbtgZh3QjahtLwMCd1yJk=;
        b=afVRUPSTtNrtyM+11CubiOfPm7HPIUmZpDAIHB5IBycukKp0RsUaexErH33qbYsGcK
         Ho2DJEJISn/GP3XUlyeHbt1nr4fMv07qYZosRMj9YnK2n7fr2w2lef3IOU1DqAgegPEi
         FFloq3FtFv/S7oLOxB4Lrga3E0Dh2uquPsL4Yhb5kygKFULawfAxG1ZPh2Op8KM7fTuC
         gCQkWmX2r7utfQF4ISEBbmePdu2jorGxv1zyOj7mabDDCDDoGKz/psYXHy40CEr/Q/Wc
         W/zTbQHnuT5DkElHwuj830BRWplfxr1m3GPAFnBuAmueV6HRZLe9OG3cBhkvRiGlroSD
         pUYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=WM+FdkSx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si42244003ybu.552.2022.01.30.15.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 15:38:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=WM+FdkSx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:38626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEJll-0006F6-UX
	for alex.bennee@linaro.org; Sun, 30 Jan 2022 18:38:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJkw-00068b-6C; Sun, 30 Jan 2022 18:37:14 -0500
Received: from [2a00:1450:4864:20::432] (port=38548
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJku-0004As-7c; Sun, 30 Jan 2022 18:37:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id c23so22016193wrb.5;
 Sun, 30 Jan 2022 15:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CzkPakoi0PJ0ai7zLwa78NGbtgZh3QjahtLwMCd1yJk=;
 b=WM+FdkSxKiqWm8htA3J8Qv3ZKwK+fWUwvbEPP2ZUso7Qz6vRiESWqLE5kgW5C9D/7u
 dNxdNflaM0Z/ieqjXGz6rZsxEqclvTdeUMpsigxWyr8R5k+jBDltsgxgk2HGtVuQikcL
 0iRgyIE7AQLbbhnwuW+NmY4IkcTq2ccN/7eXzFYcMffAF2TAaZB6hwOicebR90WcVIDd
 EX676wQ6F86HveODAK8kQdMQ6l+6/skBCaKBuvfvS7AkoNSPu4Cf2kO4kBhEvpdL2Ufh
 1p1qssyFXywp2eYvVB+eQlO0DFHvcPUASKgJM5qjX4UUFF/yZoGV5tLUscsQdraReCGs
 21EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CzkPakoi0PJ0ai7zLwa78NGbtgZh3QjahtLwMCd1yJk=;
 b=mR4LU7YqaVdGS5YM5I3qwaiJdCqREJfWOhP6LJ5D9RfdeHEyMyUjB2tIiV2PJw5XxJ
 azNdFZKnOoogEuNTc30kHr9zvAuyr1f2ynf/Ly9jzmOaJdVHVgjoxR/sufpaCn1viDl6
 /m4i6b56Kzg+jy7y5b1sHvNdF3ckxsKhRIeY2f2FXAw4EbMaI2bidtKxBW0rW657FHFF
 s2vz3VEY4YCTRyO1CqpTIxmz/ic3uI0gb6OsEft8EL7BFdF0WmaAKdx7X7fTeixLZzy4
 ulcSgQUQ+esjptHvaQ2ApSkoHNT+iyzPRqMgtM9q4e7TH4NMGVYiLke1pLDa4Nys/eN2
 uv9A==
X-Gm-Message-State: AOAM532OI61TVF7RZ42j7KIq0KCv1rf6pyo7KzEq5l+pQ+lbC3VlZN7W
 ZrW5NFF/JSyXEN34geCVXYM=
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr15646252wrq.171.1643585825619; 
 Sun, 30 Jan 2022 15:37:05 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l6sm10873446wrs.51.2022.01.30.15.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 15:37:05 -0800 (PST)
Message-ID: <376cacec-fcb5-3b92-1cd3-d8a352c414af@amsat.org>
Date: Mon, 31 Jan 2022 00:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-7-edgar.iglesias@gmail.com>
In-Reply-To: <20220130231206.34035-7-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: haTAHiDIpHVb

On 31/1/22 00:12, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Connect the ZynqMP APU Control device.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   include/hw/arm/xlnx-zynqmp.h |  4 +++-
>   hw/arm/xlnx-zynqmp.c         | 25 +++++++++++++++++++++++--
>   2 files changed, 26 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
