Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17134C61DBE
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 11:19:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wypAO-0008UF-11; Tue, 25 Aug 2026 07:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wypAJ-0008Sl-NO
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 07:18:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wypAH-0001XT-4T
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 07:18:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso25134005e9.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787656679; x=1788261479; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=NXEB9Wku5bRHDkNsh9wY6W5EuW8k1uhaqYa1LQ+jfcE=;
 b=Ep49Npyf6OxwM5r7TnKQkHpokGSe0pVbT+1z4WT8eE+4VWkmXhKumSabVHmZ2+BGpd
 9Lpq+jO8LPmDpL25vR+S33GDe55kYzbvHwCJSM7IYj/FKgPKNB2rPFAUJ18MFGIA61j6
 THCKgijEK2/ev/R+rCXj4p39Gusbk9UMq5zgnTON7SgSwarmxhAl70K683R93VneTqYL
 zH0R2nmpTEjiIunJuhqNqrycsHtdwRrL3pnv0vzszGTh2HdJWCjSMmkKUvb5mUdxZBY8
 N/gqaL/hwGsYVxxaMyKilOJA3lSedofDWs1hf3tzrL6k49623F9wSZNbILF1ow07z5Cg
 HUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787656679; x=1788261479;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=NXEB9Wku5bRHDkNsh9wY6W5EuW8k1uhaqYa1LQ+jfcE=;
 b=B3y6ojmwFxkdLaQxu2d+0+ra4XUa3JUun/948A7vH6Wxiymf84LY1zdc9BHKQcqg6p
 hA2DmwGRCEJb9EdSgoFYP7B79UNKEmJfLFR0yGtJJOT8HC7VZU/KDt0lQAeNk/iKOjxh
 x0qTpuDllYBv7TfA7JM65/Fi34gUizDTjHcwSboSGzIw326lYlPw6pDZrNPT3onPeSVC
 sZa4l1gNEXaPTLngV83Yq0F25/BIITO6MAXWXIBZbCZk7Ac5xcrHp7Ytm4Fq3N33p/dz
 2Q4DrX/JNaeUP0Xv/t2lMWPQ0gOwiLHM0nEGGxByFh7Dz623/P1wXcVXSDfKSLH1ULVb
 3DQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp61aMA8Fg/xG+aRUNKl4fFfNrZYfCX427r0nr7s0s7HrGud4MA7UtfnTRfJxv1dg5B/hUqUdmf8g==@nongnu.org
X-Gm-Message-State: AFuF++m9M0zGSf6WF/+UYai9SFNF0xK7RnbrpXVftjl+NCJbnZR3vgop
 Uec9+w3c0ZVuyP1e+aHqMI4kE5PvdzylpTZ7DrTBOol/6bGPYxaYeZNLWWVJldBaiJc=
X-Gm-Gg: AR+sD10DNNlJLREXuhaBX9o8tuflMUUR98tLn5+G90uwPJ7H+GZKBb/mEiDBnkBun5X
 Z+f14oKA+DCqusfFvatcpIdqoGE3psCY3lM+ZbKlSROVMu3fWpSsfj38QIjLfX99WpIlLP4aGtK
 D8tuStdA/0Sd00DFlQgfGYk7FACyWYbmDoDNG5LYj9NGzT6B62VU5zxOy0+JXsJnhif3gwm4XDm
 UOqL1UX3ZRy0wmKJnWxFbLtrLVutkJOcLtIEwMXBxaD/YdVZjn0k/0wHPL+lHHe4gG8CjQ0gysz
 +dVTarLYZysfREUtnAiWhLY8qI48nG0s0Pqy2ZueNppFjoLl/LZFrx6j7h1Pi6DaTkbXEaOW2GY
 MXWb713LMVa/XZO9c+uKoXH/kPearvee+Mn2kjCekV0cwYbucJ3XC962am9LUqsOJqcTFy9xRw+
 y3hAA3tG4TiMYsbbAL2927Pc2eoIrw2dp38mLvyUM3SO7kUEukgUKBJYPYQRl8vgI7r1dkxKJ1M
 3o=
X-Received: by 2002:a05:600c:a01:b0:499:bdf1:7578 with SMTP id
 5b1f17b1804b1-499c19bfd2dmr256070885e9.3.1787656678581; 
 Tue, 25 Aug 2026 04:17:58 -0700 (PDT)
Received: from linaro.org ([2a10:d582:31e:0:8679:ff59:1b3a:5e93])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499d5cbd702sm18213095e9.0.2026.08.25.04.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 04:17:58 -0700 (PDT)
Date: Tue, 25 Aug 2026 12:17:56 +0100
From: Jim MacArthur <jim.macarthur@linaro.org>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>
Subject: Re: [RFC v5 19/28] hw/arm/smmuv3: Determine register bank from MMIO
 offset
Message-ID: <ao155KStbs_MFr7m@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162558.2808607-4-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162558.2808607-4-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32f.google.com
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

On Fri, Aug 14, 2026 at 12:25:57AM +0800, Tao Tang wrote:
> Modify the main MMIO handlers to select the target register bank from the
> memory-mapped offset.
> 
> Offsets in the Secure register window select SMMU_SEC_SID_S and are
> normalized by subtracting SMMU_SECURE_REG_START. Other offsets select the
> Non-secure bank. Pass the selected SEC_SID to the register access helpers,
> where the normalized bank-local offset identifies the register.
> 
> Keep bank-specific differences explicit, such as S_IDR5 being unimplemented.
> This patch implements Non-secure and Secure bank dispatch and prepares for
> later access checks; Realm and Root programming interfaces are not modeled.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c | 44 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 12 deletions(-)
> 

Reviewed-by: Jim MacArthur <jim.macarthur@linaro.org>


