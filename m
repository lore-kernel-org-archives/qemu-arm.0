Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3177582ejb;
        Sat, 11 Feb 2023 15:28:24 -0800 (PST)
X-Google-Smtp-Source: AK7set+jeVXcmRmzBEdJm+Y697s85Y2V/lnd4R05ssuLWMQzFq4apryLmHRiyE76q+zGnHJj9wTL
X-Received: by 2002:ac8:570b:0:b0:3b8:6d57:93ab with SMTP id 11-20020ac8570b000000b003b86d5793abmr38081796qtw.0.1676158104258;
        Sat, 11 Feb 2023 15:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676158104; cv=none;
        d=google.com; s=arc-20160816;
        b=vPgc4OWkUBICRgEq3mUyiNdHRlGdeaaT2V6ekIbrRzNhf2UuhK2Lh5Tu2xPpp/xEhI
         aAUC2gWphAD3+VEiund/TpqZurYAJAikpLArTxyIsTW+LtwScDO010rzn55clbPvo5Nm
         2Y2K/lxNDR/QuPRRGKya37/xn375DzxTDbleXasB17fDRS2TSHSz/fLgjzaVFq93qBUA
         VxTsmFg76co7usBt8ySs2Qy9nRV1wLidyxcIPNiGH7OxMUuqaZlZmdWqEx6iJJhsmEIr
         DusoeBAkHkLiMliDk4b0/l8pAs3G1eZUxBe0iBUC1GMPoPqJ6Uk/bSAh4NLA1QltHjO3
         Ri4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fIL98+Qa1gx5dHGtJuKzFqNV7jMKWI2izJuLXLIQ9mc=;
        b=jDN4Wg/81uorKOT65P7Y277s/lzdLtL5G+vG1tQWti2yGz513Eib3OEVTwCJ0TvrfP
         aLmAWlYP/wK8GL3kveSk4d0O/6xR7d8KW6oNJINvsoVhBRBEOGLiGN6HXRZhCBWVUtnt
         ohsCoi/QpZlv3mIgL0goR1b7JEG1jthuRi1zWPReSwk3NWKqpsT9HNTIctP8nL/c4VC+
         1LaQyNueLbOc9eV50cqj2C/vrxUquATyAcWMWDQSpFVSCWv2FBbJ5lKvqNsm+0dfdcYP
         oWyjQ1uxvT41V6P14QCK+m7/qVQWdPnk8OMEwaQBHpDIMEpE2YOQAXFJ2bLnSCm//n2d
         uJdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVJlUMhS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5-20020a05622a028500b003b824b0e605si6683207qtw.32.2023.02.11.15.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Feb 2023 15:28:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kVJlUMhS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQzHz-0005aX-1O; Sat, 11 Feb 2023 18:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzHx-0005a9-6X
 for qemu-arm@nongnu.org; Sat, 11 Feb 2023 18:28:13 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzHv-0003m3-KE
 for qemu-arm@nongnu.org; Sat, 11 Feb 2023 18:28:12 -0500
Received: by mail-pl1-x633.google.com with SMTP id ja21so2598841plb.13
 for <qemu-arm@nongnu.org>; Sat, 11 Feb 2023 15:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fIL98+Qa1gx5dHGtJuKzFqNV7jMKWI2izJuLXLIQ9mc=;
 b=kVJlUMhSdLQG62ZmZeLpRQkHwHHsGEKederIprRZqODfNdz/c+K05Dtz0Zr6aQOYT8
 Z7KSojcN3ugSJtM7/5I5MYLzv1iUrfRxPTRuZQnZwFUwIKJ2LkuMyTkNYI1Tp8it2iTg
 Qfxpk7gZMeXKnCEaQ+jnt9jzp4yiUTekhNqWUdp/fz/KwHYgVQhrwqDpAGlxqqhwRR3Q
 8QONbSPCPtUrjOdvcH/rPJEluFNFf2rr3WtBfaBoBpaHa2ZiUYwbRaNQcZtffq4OV5Pu
 ENN3hdlJd9HjRNHsXtEo11kecnJoCUMwtU8hNTxFIp8zlMi6pLDwpNJrCXMQ7CmJ04Un
 +piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fIL98+Qa1gx5dHGtJuKzFqNV7jMKWI2izJuLXLIQ9mc=;
 b=1TSHxlfCWB8ZDiHWslhsD2DEUPNRrbQCR9vUctjgg2wYgC70ULY/dQfmBGzsC8X9Y3
 A8384Kx7l/IUmbv1BfJmeDi9LPQvwzIN/gFWI9rvrJAZHn6T2vTkvXiszxkgzrEsfn+Q
 1WvjXvWIe0655C9wopAlVJ2K3wz8s+yThm6AcDYYmZ3rNb77l07ebazuZicirsIG0nOL
 nRTghJxl3S0JmOTbu6sON3IVH0P9eFYBl/8ZTHRnsy/ZSDaXcogNeWgpNJfxUMRdIyBm
 Py456bml14ycorRfu8syG3rmbUj4wVjsLSLXHtv/APfoqZTqvb3LJzfZsyb81HCpE3QC
 AwSA==
X-Gm-Message-State: AO0yUKWdT/HrHrQcWWFT0jHnTqQcw2M5HrwX4/TAZwTAsAVpv7vXVNUp
 FovDOaXPq64I9fJa4KC+v05MdA==
X-Received: by 2002:a05:6a20:3c92:b0:bb:9aee:f6d3 with SMTP id
 b18-20020a056a203c9200b000bb9aeef6d3mr22829736pzj.46.1676158090177; 
 Sat, 11 Feb 2023 15:28:10 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 m23-20020a170902bb9700b00198d1993b4esm5485501pls.69.2023.02.11.15.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:28:09 -0800 (PST)
Message-ID: <35c28b39-53d7-dcc5-3add-41bb0504f593@linaro.org>
Date: Sat, 11 Feb 2023 13:28:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] hw/arm/smmu-common: Support 64-bit addresses
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-2-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163731.970130-2-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: R9R3Mx2uZJw1

On 2/10/23 06:37, Jean-Philippe Brucker wrote:
> Addresses targeting the second translation table (TTB1) in the SMMU have
> all upper bits set. Ensure the IOMMU region covers all 64 bits.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   hw/arm/smmu-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
