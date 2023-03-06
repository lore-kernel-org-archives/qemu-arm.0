Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4396984ejc;
        Mon, 6 Mar 2023 00:52:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+c94Hnz8bEVfsZJrjHs5+a6X7kzjApzTXARuWSw0g8euvG2hBTIwEXymmTK+NMj8ddHEF6
X-Received: by 2002:ad4:4ea2:0:b0:56e:aa11:da9a with SMTP id ed2-20020ad44ea2000000b0056eaa11da9amr18300883qvb.13.1678092755871;
        Mon, 06 Mar 2023 00:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678092755; cv=none;
        d=google.com; s=arc-20160816;
        b=MuZ3vnkTFKINoyZidY9VIwW3fYXvTLFkaULQSEKYc2SoTV5sRYd9pWV1yqgYT/wxyb
         k8jVkdtiPqzT59UxQbdzvStFcpX5ZIHMMa/kzUYh0qFD5syKrq7i88Ibgz0wzmPsh2mL
         Ja7lu8p3mtO0z1p7wLaVqznz2Uk2Iidg/ebhtOcXjwrd6tWnPHPPj+VL1zgAzmy2d5GM
         Rzf32/zFVxNr9PhhZV92zBayfZIeJ0ECtcSFKMa3zdhSwGrgksCzdwQGkkd1NtnmSzmm
         lGVCVhGE8OhjR8TEdozAEmsUozH240Ock6uEYCev5ImYl+bFBql+FJ3DcKrdm1MvWvc6
         ttFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=YH3W1xqKKBWY/KcpFgZaZQu85P/63mKD/Wkl+AdW+QY=;
        b=DCsO1NtC0g/YcgLSmJtlzN03iIcR0VTnlVtWeUmskagFNKOS9pv1JuJc889W+eJef3
         X1AJyipZfO4U9nfWT5hoBhN8prAmfmXUArLRprhsAUtBxd7xNHu459h5trUUN1U//kNA
         noeZumYuaxsVK7IjMy+ZcTWDzJXxLvpIZBy+2RMkjOWo6P8Ns+w44mgZ9PxRvhvd9bUM
         OJLk0D+Z0dT04grvqNLYTn5XfC/qZc0Wi/Ta0Quu+t3KGHeWhx4pJhi3f7It/pu1IfUJ
         9poXSudIbPFfqO8EwKlJTqbKIzwP4ayPc+z+HGUe4yGBdt7Gl7iK4eNAF35g9wbirqmY
         NJcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6wRyLD5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a0ca915000000b0056c5a40a63csi6761342qva.567.2023.03.06.00.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 00:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O6wRyLD5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZ6Zw-0004Mv-VO; Mon, 06 Mar 2023 03:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pZ6Zt-0004L6-7g
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 03:52:17 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pZ6Zr-0007n9-QP
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 03:52:16 -0500
Received: by mail-ed1-x52e.google.com with SMTP id cy23so35157899edb.12
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 00:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678092733;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YH3W1xqKKBWY/KcpFgZaZQu85P/63mKD/Wkl+AdW+QY=;
 b=O6wRyLD5HBnZERXsPBULeV/By6zvSmtB5+pVxm+J69FmKD0TW3PYf8lbogl2XFH2QR
 NMDQwl2qp5IWGVuOAFauSR3P6xBcSQaDhpS1rAN5Ek5H/Z8XOlCNlCOq+jBPqe2bnASC
 y7/PwHFwHMYgcW+41Nwbs47EZJnPlVMQMKvlR6yKaI//ndxoYJNc324CHeWWyIZap+bq
 sbA6rYGpx6UqeKK39mZLcA2GvHRh4R3HKYr559ZcYAaupIOYR7l5weLlYaX3ykA69VYh
 RB97P9Wrwd2vP7tHm3vEodNsAZ0NMjN387Wm+jX7JytYWFwv9GpBN3QUF+UUji6bkJVi
 S8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678092733;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YH3W1xqKKBWY/KcpFgZaZQu85P/63mKD/Wkl+AdW+QY=;
 b=OvseSjWiKhj0BJFNB59ByzPJgFv3o9Bk0fsSAUtz0L2rJiIJ0t1JScukvTKDpyVKID
 Zcv/Jx8n1q9dKwXIsiggLF6r8dKyWjNDG+AarFE+BIYT/dl4Hyp0+xG1d2IYcCWwcrOY
 76NCughPRtMk3Jw+12QTMS8WBALaSw5ty03l98x4IAqH3hsQarKbPLjOO+8RyykeLTsE
 0+k/rniY2M7mJLfycyCAvVnyr6K3YyR2Y+3FjwFHBYlF3Jlu1nf3MvtcwANRT2ztxXyk
 s9wKWi2vp5x57zxWP3KIZknFt/DwVGXFAWXkzfjJhhTKKmmEuHKGzbdXywOzrEYXdtRg
 LZzw==
X-Gm-Message-State: AO0yUKXfOnX0T++VT85hD1z/Xp/m+VYCux+VrfY/2OByjL4EdQ8QrlGE
 k2JCZAMv3fh9LeTjvdkZL1bOQg==
X-Received: by 2002:a17:906:da82:b0:88f:9f5e:f40 with SMTP id
 xh2-20020a170906da8200b0088f9f5e0f40mr14564027ejb.68.1678092733515; 
 Mon, 06 Mar 2023 00:52:13 -0800 (PST)
Received: from [192.168.200.206] (83.11.36.13.ipv4.supernova.orange.pl.
 [83.11.36.13]) by smtp.gmail.com with ESMTPSA id
 lo2-20020a170906fa0200b008e09deb6610sm4239576ejb.200.2023.03.06.00.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 00:52:13 -0800 (PST)
Message-ID: <19ba6bdf-a676-f25b-1fa4-5c4e64e17c9b@linaro.org>
Date: Mon, 6 Mar 2023 09:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/arm: Add Neoverse-N1 registers
Content-Language: pl-PL, en-GB, en-HK
To: Chen Baozi <chenbaozi@phytium.com.cn>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230303161518.3411149-1-chenbaozi@phytium.com.cn>
 <20230303161518.3411149-2-chenbaozi@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230303161518.3411149-2-chenbaozi@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: VQAxXFE23mS9

W dniu 3.03.2023 o 17:15, Chen Baozi pisze:
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A.
> 
> Signed-off-by: Chen Baozi<chenbaozi@phytium.com.cn>

Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

~ # cat /proc/cpuinfo
processor       : 0
BogoMIPS        : 125.00
Features        : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics 
fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp ssbs
CPU implementer : 0x41
CPU architecture: 8
CPU variant     : 0x4
CPU part        : 0xd0c
CPU revision    : 1

I used TF-A with Chen's N1 patches, EDK2 upstream and Debian 6.1.12 kernel.
