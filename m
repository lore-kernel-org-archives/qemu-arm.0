Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1150754ocs;
        Thu, 29 Sep 2022 09:42:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43rqLEEeK4VAWtd5PdM5yI/GaxLJLSNyEIkf8x+CzJBMqo9jCGW9BMQXBbJjzHxeVWfP/F
X-Received: by 2002:a05:622a:1827:b0:35b:bb7f:6851 with SMTP id t39-20020a05622a182700b0035bbb7f6851mr3151045qtc.457.1664469769964;
        Thu, 29 Sep 2022 09:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664469769; cv=none;
        d=google.com; s=arc-20160816;
        b=04UjDkulMN/cr4vyonSMQXiVcYK7oqt4/vWrLDvEVoil0vIk+BzIP33griTgSgGb7l
         xwEiIiZQoUyfVKxoIjjrQxx/qRIGQM2m1xgQ/fZpMBgDw6916QUAspkqLaT5S8tmP+lU
         M8f7xlY5POdpMqiUPo2t7Nr5kBiOUhj/5P0TtYPlGvc88u1hr41EMPt13H/jZwddN1Ah
         hbdJmDYD+LJB19cMBGxrq/kLIgh2PubEmdtLfwxU3Y6/8Dr0cwBG6h79qZwtmH7A3aHS
         s3nzeToI8usfxDHHCj4DTgki7ddW6DpPVBYMFTufQA2LgClt7LapCIXNA86Uk/kguqFW
         WGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kOw2PfsqjA9PeHoLDljprV+sUjfX8jWcZQWDNyq0/FY=;
        b=IznXixMkZA/rzfcW99yDaGudoDUYIPWN3ViUt3jPARjPhCQ80NkvhdO+6o/aMROkSY
         QoD6QFvILzismffY+IVCzD+pmCB+xos7gQ8hl3cMVIwhBY15CbvaAmEndY6NcI76Q6+9
         P8ufC8OBEvZUmQlEMSbwKiFqxAQ4JYhhdTVuRwXS6MYO4r9qQR7oTTBhLx5GOmd6mLs7
         ohjjvDscWWk6CTb2Vqw3xLmmgkYCzx8v6YwCUeDJRLLRf1r1HEBIJY0SDr4aLNcSNY1V
         vORJ3kWceyUkSyhwDfclK2gM3khPQabpLmhUVYA+8JPpN2cvVHHJ8ckgSSJG9lt+qD+k
         fwjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tH5GV7ne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a0562140dce00b004aca5bef218si4249222qvt.286.2022.09.29.09.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 09:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tH5GV7ne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odwcb-00078j-IW
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 12:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odvTn-0008Kj-Ap
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 11:29:39 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odvTl-0007VA-Lm
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 11:29:39 -0400
Received: by mail-ej1-x633.google.com with SMTP id 13so3565585ejn.3
 for <qemu-arm@nongnu.org>; Thu, 29 Sep 2022 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kOw2PfsqjA9PeHoLDljprV+sUjfX8jWcZQWDNyq0/FY=;
 b=tH5GV7neVLuUWmHNd2ihnnSQSfclGg7WYA/EAjQRTQtxV8mDiS8yUr0cmec6PFz/0o
 pEqtDFpTrtiFkAPFbKy0jeZ7PagII8dRMEKucTFNuenOZQbPa9/VDHcLxoWA6DXzV1JT
 6oUg5S+Fbo+mW0SszZq4Zz1n1WHvrxEAjzPyg1VGAfnzrNHb0m8YyVY7IWv5KzLuo/oY
 MbLvBdPKYBciInW4PvuCSRl5ybSwBsbIHy4DeInV+GfOlldN756buX0U61RCmhhhxz2n
 aEDXaVDgbTk3Sjy5jsl9wQ+HgzdLUHsIalodm/4tkA3iqQ90WweV0A+jwmNMt0Ulx/WU
 3j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kOw2PfsqjA9PeHoLDljprV+sUjfX8jWcZQWDNyq0/FY=;
 b=KL3v7Zdib9NRBULJ3XvDfnZc1AwscT1K+sGyevMLbSB2NtSe+1cjLhNmOlrFqe7+I0
 hLMDEQBPGYoLeWFYwBD/7QbXSAEm2jBckn7UuL5w+v/LF6bcizMLGGgVzf17DIFEHEAK
 i9M8x/U66qKD5E5Hzdxdd3c2EbWHnvBY098CgfdfENUR4O6v7+tPIXvh7JNM4d3VCVZj
 nqGrzwS4ORgCK0ZJUNbrGzS0FWGSpEBY6DkeduCRL8xmfEowv766qnR+fpc/uffck90Z
 GHe3eX3nfL543FI6s3Ss5LiISlRpbIauwevLt6vDvQyoPih8/MihrKKlfugyfYx7vQNd
 lWrA==
X-Gm-Message-State: ACrzQf2AWv1TJce5GmdqVSKy1JXfHalk2FEjlJbl1ufZRNszJB770UFa
 5F5O0pViOPx1dR4vBmeHwC7DoghTriWwJ6pmZiLV3w==
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr3059091ejc.619.1664465374378; Thu, 29
 Sep 2022 08:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
 <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
 <12117a96-6b68-3146-3576-261228f15203@linaro.org>
In-Reply-To: <12117a96-6b68-3146-3576-261228f15203@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 16:29:22 +0100
Message-ID: <CAFEAcA-bXQp=eLs+4orqbRV+E8ATauuGVHv4zhZGVa99ZgqT4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: 0DnVOcYWmzZ4

On Thu, 29 Sept 2022 at 16:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/29/22 04:44, Peter Maydell wrote:
> > Architecturally, Neon implies that you must have 32 dp registers,
> > but not having Neon does not imply that you must only have 16.
> > In particular, the Cortex-A15 always implements VFPv4-D32
> > whether Neon is enabled or not.
>
> A15 requires VFP == NEON in its configuration.

No, it requires that if you have Neon then you have VFP;
but it allows all of:
 * no VFP or Neon
 * VFP, no Neon
 * VFP and Neon

https://developer.arm.com/documentation/ddi0438/i/neon-and-vfp-unit/about-neon-and-vfp-unit

-- PMM
