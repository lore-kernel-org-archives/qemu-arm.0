Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp229258ejc;
        Thu, 19 Jan 2023 02:38:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu9bM4LIrznjjH1ktMSvYi26/ZKhr1G3qjzadP6U0uAuTRzN1kUliW0RGG3X64gh+YKiQXI
X-Received: by 2002:a5d:6149:0:b0:242:10ac:ac42 with SMTP id y9-20020a5d6149000000b0024210acac42mr7890142wrt.55.1674124738602;
        Thu, 19 Jan 2023 02:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674124738; cv=none;
        d=google.com; s=arc-20160816;
        b=OAMtmslCbwCkWGSljEval2mC4xTpKDomU8lWF4IkmSTvUTiK8R51+Boa6ZBtao9Yea
         pZDmeufFYPKiziDCyQRJLjzljUTmJ0DUd603Hd+bkvIZi5AWEWoU8pJw+BwmFP+60trJ
         KFQFyYmBlsWbWB3w2eOTD/qAnZPb1eEA9aMRwt/cGyssByXJRZ/EXKI6EnssHEg/oRAl
         vIkRyOOT1quxWqkoHQMxFo1vEbYyIQu1Wp82yMMZ3ycZf+O0smZcl2LNpPXc5H98QkjJ
         wCmtIAknNLFmGs/2oBYA9y1X2a0wU1YMyUVMGEdk5315m5i1WVLPSlRzKXnAIDUNkLSa
         KYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=F0HBHX3hyypBYhXigsY26PuMsCMCNOc5/9wqYOiHA6U=;
        b=ZEhDyXxgGFV8HXrCIgAGZmfjSOZ+V8/of93xEppURxtxhc+YKaeuxhVft/byohZlx4
         7wVj6TGFcpJhh5zWYdHqc0rJzq+UdCu75m+9yT+hns+xUmRrv/+T/yydY2Kr02ZOSqev
         erCg3pq3nDOsEkxWnuCjPTvd6uKOqQxvNWenTzR+RWOb49RKBfIb/LEvQ8yYk16b2rg8
         N4NLSeqx1YUVz6n8p6hy0/SrLzCKMxjiAUBmum44nyqcKNGOqJ00a6hYaLI1AgtUSPee
         gdhwBmwdA5pRWYqzLvWfeAWYBL4683lWIgF60gEHpDVLDlQB2p8e0KnU8MrpZ36vzGcZ
         wnfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKfzLKP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bh1-20020a05600005c100b002bddc0f24a0si18658957wrb.468.2023.01.19.02.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 02:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKfzLKP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pISJX-0002ft-Aj; Thu, 19 Jan 2023 05:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISJV-0002dX-R2
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:38:33 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISJT-0003kD-6u
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:38:33 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso908677wms.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F0HBHX3hyypBYhXigsY26PuMsCMCNOc5/9wqYOiHA6U=;
 b=aKfzLKP6yG1wCb3Rplcc8IDAO4pGWAuVupnuLFpcvd8FsZU7LQAq/SN8lqV+hzeGdz
 jvflIebRkF19xdnANkb1iQCYpOwpvnLMRluY3y/un2niEhaPCveWnR6z2XPzc7C7zuRk
 Cat4b9KNtWmLjKkm/Egq9Kva7Zrt1P7VbziZBTejW1QotuchrqswQtlfmPZtOvyscZCq
 FjZ5Q7HS34hQ3Vn6oxEHOdz3+0bMgWgg5HgEE0p6ILsN8rcQLzw4/sF4EPctUw0CF9+I
 B6scmW/LvSCib8C9RPSw2XUzOORZ2tb3Ym7yMqNsuG3fiSarpTRqqRZQdi1tC5RTSER2
 AOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F0HBHX3hyypBYhXigsY26PuMsCMCNOc5/9wqYOiHA6U=;
 b=AYh8km2K/S7oaO4bU9uQU7qeD1GdHsp6yLTi+celdzf0q80Nw/Dqtr5RxY1ky56Y5g
 An3tobW+xudJWUiyqHGNtCMuZslQ1j8fHnGiT+novgWSKuFnCeUkHoQTFI7Tw8smBpz+
 4SAFyAZJnJ2cvIaAdxTE4Z7TzCz65Mn+T5TYWvK690yJiBbiOTLdmLghr+ElQ8MkPBr/
 1Vt//D36Gxl86fBNJ67WQ7fDGPSXRX1Y6X517VoV/fvFaI/PCK9ZRxGwxPnwO7asJzw/
 i4V3DTKvyWASJqj7drbFZekrYgJ0GBMTLMuWSTasyFj2MspaR1OwIY5xTYGOwzFgmLZk
 FWzQ==
X-Gm-Message-State: AFqh2kq3QOmcwBCjnJDyMhC9o81mjqKi+pSknTxTKzGVUG5VPrRpT24t
 ZilB35WmGfiey9Vm/kSXz+eKrw==
X-Received: by 2002:a05:600c:1d22:b0:3da:f66c:795d with SMTP id
 l34-20020a05600c1d2200b003daf66c795dmr10106071wms.9.1674124709291; 
 Thu, 19 Jan 2023 02:38:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w1-20020a1cf601000000b003daf681d05dsm4483347wmc.26.2023.01.19.02.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:38:28 -0800 (PST)
Message-ID: <802eb2a3-e7bf-ca38-daf2-75275980e865@linaro.org>
Date: Thu, 19 Jan 2023 11:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 13/19] riscv: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-14-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-14-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bozEdlnDgRZN

On 19/1/23 07:59, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   target/riscv/pmu.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

