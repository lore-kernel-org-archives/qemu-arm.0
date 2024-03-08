Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1666568ejb;
        Fri, 8 Mar 2024 00:26:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXACfjXWpnyoiiArU7yshYTzdg050K+J/7dHB4AIoTu04BJu+a07YE7q/GqJhPteM7C1Gz2Adzy4dzeDPctgbR7AeNZn/g
X-Google-Smtp-Source: AGHT+IHBUt/E3MvhDamHcZ1rXO9wIpI1a8wDbjqjLdMrVg9gZwVUTQNH+VWcLLuujCdY96eoNFgT
X-Received: by 2002:a37:c446:0:b0:787:f411:4285 with SMTP id h6-20020a37c446000000b00787f4114285mr10891612qkm.16.1709886373840;
        Fri, 08 Mar 2024 00:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709886373; cv=none;
        d=google.com; s=arc-20160816;
        b=Fb+fal2xEUyFdUxQx45ePj0Pvx0KbKm7RHiIzzB7mo8VJSGwSsv38ny2HSE2FgeIxt
         cr+SjBvLHZJ9Fa9/qXitEthF8y+eYgpygWtmVuHeqfbFm2eHzItxKi3o1Av6etfp25z4
         IbWPm5gduPGGqlLcz3n0hmBiAa8FqpMf6eOhSMZJNmXebW9ge3RxzitF01DAxlpGLM8n
         eS3oUi9yrhsfITj2nDlihW/IkExOsSwalUzTT5FFIiKg0MEaxe/0Kz9/9cZBtzxRhH2D
         JKaYJYt/kJTzGLdRxr4pU4G74Gko92vZDoBQDV0FVW4yypYQFTVv5K0ppcZjnWWcPHGg
         kfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2UtfhWlT/vgxdO7tkYN9dNOMDxmAQmSmTg+7eTDb7Ek=;
        fh=VHMYgpzA19bZ4xSkhdMhbFtJXnJqoQ2365FvW+xTMFM=;
        b=M+tscWdufmoXEpKfrJiyp/WrRj3b3K63UJSOZ/VN4z2Jt6oNR/u8TKX4xt9yGXMEFW
         t5qoUbTz4p9fIJxZrLyP0m6QI4B/wSCI1hxkuNPJOAQ0PhPl5cS/1yeuBOhYtlF1/SSM
         Jdtl18OxVgFfYBYC5BEZ788zSrhbS6DnprO1CCbhi1xCpYev4OrkBFH+X42A6UvKfVca
         96AlTwfBwUA/ihOHiGhoQCcOO5kvnqvN24eB3dbaSEfSdfZXOiVOA6M91tK1IOxK9Q4I
         bl4t18bB/ihmlCwlgWhGCb6tlSIEd/rrKLi8kpRhwnubEgVPLGiT/rt1ZzVmsAlZVj+o
         xsrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HaSg9JiN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a05620a44d500b007883416fe6fsi9197398qkp.32.2024.03.08.00.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 00:26:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HaSg9JiN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riVY5-00044C-Hk; Fri, 08 Mar 2024 03:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1riVY3-00042Q-AZ
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 03:25:47 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1riVXy-0001Bg-De
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 03:25:46 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33e151a1434so618541f8f.2
 for <qemu-arm@nongnu.org>; Fri, 08 Mar 2024 00:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709886340; x=1710491140; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2UtfhWlT/vgxdO7tkYN9dNOMDxmAQmSmTg+7eTDb7Ek=;
 b=HaSg9JiNKWCtryMBje0dp4EXcO0LYWGVo89PiGASNMWnknGT0+r0qyrHGroRziSh9k
 DJRdis49Z+APZj3Gc/AD7v40MB7BJGOOQuDDdCTOUbacQRaGQ7W/ODEkTKoxHooyhH7I
 K3HhXUjTPu9JYPsnHgSvKxiwSsaQ0hig4qFANSr6+VjFdFpQYXKAfgP7sye493rNKsRa
 9kaoVynsgcIzp71CXXPi8FGCQFVMV+inqg+QnuxlC7JFUQzpCNcOLpOlVoB7HrZgXmb/
 gFsLQTUSNgxIoveN8cJLTaijh9I+u/A6aULD1DLN6YuE9suO0HicJlfvZPqO2HURBsQe
 +DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709886340; x=1710491140;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2UtfhWlT/vgxdO7tkYN9dNOMDxmAQmSmTg+7eTDb7Ek=;
 b=m0EsF7qj/2/OaXg2hvbFUtnP//+eLo5+lBBYIklUWrqLXW+WOo231yZLlglVXY7t5G
 ClTIic15dhV8Qpq+qs9MAZeWCMCmCzNimwNLnfIYWWqS4J0LwejTDx54hZlYNRFhsHjs
 4DArYXxfe+lPJJrg8ne2KA+rVdOuSdK+2fl6aPORcnEIlsa4eFRE7hgUoVtOBiR8Zmqg
 UfiYriKu3IKq8iMWSHIaztx+W2iOX4DzttTZMyjkrOtrMINs/cn83Sitc87X/plu+Rcf
 ZDiQeBZGQ9O4lBaw9QJJ/d/3uXwd0QkKc2z041yvLoRXvbzuethgcehlHw/Wlkd/Ow/F
 vSTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQXewYAhdFDL+KMVLDmPyHkYEHczZhr3RVFSmfUCxROAKu4YB16F4OzgYxluMnPjLLqEyOXuqRY8pV/MteZ7xA7NKY
X-Gm-Message-State: AOJu0YyfAnWXGjvImH1C+bPCf62YZSrmOWAcOcpRsHHoYqni/N6zrhTA
 Uq9eG+QMZ9/sLV0VZgUmjbS/IRPArSCcLVV4ruRanT7tCoOYiQHlQn/GiMTxmuQ=
X-Received: by 2002:a05:6000:1547:b0:33e:79c5:587a with SMTP id
 7-20020a056000154700b0033e79c5587amr231519wry.36.1709886340626; 
 Fri, 08 Mar 2024 00:25:40 -0800 (PST)
Received: from [192.168.69.100] (pir44-h02-176-184-37-132.dsl.sta.abo.bbox.fr.
 [176.184.37.132]) by smtp.gmail.com with ESMTPSA id
 f15-20020adffccf000000b0033dedd63382sm22328095wrs.101.2024.03.08.00.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 00:25:40 -0800 (PST)
Message-ID: <2241e6fa-b40a-4fdf-909c-b3a7ef7ff5a1@linaro.org>
Date: Fri, 8 Mar 2024 09:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] qemu-options.hx: Document the virtio-iommu-pci
 aw-bits option
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, imammedo@redhat.com, peter.maydell@linaro.org,
 clg@redhat.com, yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240307134445.92296-1-eric.auger@redhat.com>
 <20240307134445.92296-10-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240307134445.92296-10-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: wndq0VjIoZ7I

On 7/3/24 14:43, Eric Auger wrote:
> Document the new aw-bits option.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v7 -> v8:
> - remove "it defaults"
> - removed Cedric's R-b
> 
> v4 -> v5
> - tweek the aw-bits option description according to Cédric's
>    suggestion
> ---
>   qemu-options.hx | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
