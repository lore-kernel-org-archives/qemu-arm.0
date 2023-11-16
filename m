Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3356966ejc;
        Thu, 16 Nov 2023 01:17:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJNk54cvpsOkYB1SOEJrfJWEtTHBhINLNEqHHaNz3IKoHl5ElbrIUkbLw0NBFBhzqeuOwc
X-Received: by 2002:a25:102:0:b0:d81:bb7e:f47f with SMTP id 2-20020a250102000000b00d81bb7ef47fmr14464501ybb.44.1700126264367;
        Thu, 16 Nov 2023 01:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700126264; cv=none;
        d=google.com; s=arc-20160816;
        b=KnvnIIcwnroxULcpyG+7ZdHVkrdlNmyyTjp9wwV+sEDC5FdzjUmUQx+Z3MBoo0Dvcx
         AolXqP1ovNKEPWpDVwNO153TqAY2tpAvRRDaNkpw5srcnZ5c+LD4qS4QGKu+dEWMStSe
         9y9X8/a9fl9YojwS3gnjDsqIi3jerMzGogJ0XLEzTfCtZ23G8e2crawDlVfUx4ApKi5x
         /9ygs2J55Sk6apmFj3q4PpflGN4xA6ZLLkYmIEPFboi2299RGMGLu2wY5Lx7MCXWv93T
         E+rU0adAPh6gHbuTvEtt90e0D5tUm09g55H482vTGnquzyXfc34y1+X3CyxehsbW+CIY
         iTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JMjI2XfaZPZ8aJPRJ2OB+Zq7VaBJBQrbnLsWTaiaZso=;
        fh=qsNWwcz6aWDVSPKpOJlKo9wkjlB1GRvrz9nLwEd+wjM=;
        b=AHllWSEmuw70fjgDIgjqNX0XFQ9Y+2NXuT47ULTq4e/Ide650JTtkaxyoLHlBGyh/8
         FRorUGWDNl7Zce399tGqDSTwRn0odt00yQRsjqI0Tx8+YM2hTR9xH91Z3Hcih2UETYLL
         ybHNRaHJomOPkmYE+U8IzO45VzU0QyMn8dZhlu7vyYePfj4wWl1D2LLTTUG9970AF/Ms
         jFZyS4JHoQJT+jHbFcFHRT1FSw77ooU6Oab9QraPv3K98KMKamTwcFhYxKYbXtdbrfKo
         bW4TMpGYNEnJek3mFxDPGv2N99IFSFE/zNKuBZOju52z6Np7Ksc/WgUOx1MUbclIuB2n
         Dclw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZX4VG4A6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qd24-20020ad44818000000b00655d728bf7bsi11629552qvb.227.2023.11.16.01.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 01:17:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZX4VG4A6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3YUw-0001zd-Kr; Thu, 16 Nov 2023 04:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1r3YUv-0001zM-6w
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 04:17:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1r3YUq-0002FW-0D
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 04:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700126229;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMjI2XfaZPZ8aJPRJ2OB+Zq7VaBJBQrbnLsWTaiaZso=;
 b=ZX4VG4A6YydvDqZJGTrVTt8hDc/Ckf9igOJWRhabQ8BHVF5EVa0qfMk9uDdUKLslUCcGNC
 Bd1Cv3uBvMhhPXHKiT9JTpBCetuBAvGCEm2Y2TGMb+sYRWafS6U8sitqfTgTH/2SkJeS1B
 LupsmXIGdfUNx61101ntdD915AwIKzw=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-PAwNGo0kOz6NH2ssyj_PbQ-1; Thu, 16 Nov 2023 04:17:05 -0500
X-MC-Unique: PAwNGo0kOz6NH2ssyj_PbQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-da0cb98f66cso746221276.2
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 01:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700126225; x=1700731025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMjI2XfaZPZ8aJPRJ2OB+Zq7VaBJBQrbnLsWTaiaZso=;
 b=jVSQrS5Pf+xE8BQ/nOmpGG1Xja3qD0wavLor4YulyMHGHc4F6BDW9U6L6YaNWVSq4q
 HpJEF4jJDKKqURdk+uEXOJXsht7slfYQQDwwftAPa+L6bjWjfFmEfM/kV3lD3LUPiVZ8
 tD5lBG1VuA2H1eDVhWMesrOtQhzc+uqEYjacu+POLx35F0zALYdtOYMjhP1nqV/y1bcd
 7yMZSjfi7Zq9A98hmJ/zN0I8Fiv2TABV8YFpzTzm2Cdnl8PEbpTWdbFH9ORgG8nvKWxQ
 XvgCR6MfKNL/HSqRgC3CNUrkvlvbtSKpjDtqK22Ju+AR58KciVo/GfLqjDXZz7EtXmM1
 /j5g==
X-Gm-Message-State: AOJu0YzV5ktXKROJshr6/rkwOj4nLfmOinOpy0ANtCDNcpCfOb+VmJ8i
 80AL7kibzyzoJ5B/SR69uSswI7NcjtQ/ANNqYj6VtUkc6a+mURG48+zedKHwS8yfZ+549BgkXt2
 ti8ot1iD5UQlz
X-Received: by 2002:a25:4215:0:b0:daf:936f:4547 with SMTP id
 p21-20020a254215000000b00daf936f4547mr11461010yba.19.1700126225366; 
 Thu, 16 Nov 2023 01:17:05 -0800 (PST)
X-Received: by 2002:a25:4215:0:b0:daf:936f:4547 with SMTP id
 p21-20020a254215000000b00daf936f4547mr11460994yba.19.1700126225117; 
 Thu, 16 Nov 2023 01:17:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p11-20020ad451cb000000b0066d04196c3dsm1240544qvq.49.2023.11.16.01.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 01:17:04 -0800 (PST)
Message-ID: <60f67b6b-a9f8-4bf2-a05a-6edc01c5da7e@redhat.com>
Date: Thu, 16 Nov 2023 10:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/21] hw/arm: Activate IOMMUFD for virt machines
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, jgg@nvidia.com,
 nicolinc@nvidia.com, joao.m.martins@oracle.com, peterx@redhat.com,
 jasowang@redhat.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 yi.y.sun@intel.com, chao.p.peng@intel.com,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20231114100955.1961974-1-zhenzhong.duan@intel.com>
 <20231114100955.1961974-20-zhenzhong.duan@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20231114100955.1961974-20-zhenzhong.duan@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EiCN0DAkDdMa



On 11/14/23 11:09, Zhenzhong Duan wrote:
> From: Cédric Le Goater <clg@redhat.com>
>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3ada335a24..660f49db49 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -8,6 +8,7 @@ config ARM_VIRT
>      imply TPM_TIS_SYSBUS
>      imply TPM_TIS_I2C
>      imply NVDIMM
> +    imply IOMMUFD
>      select ARM_GIC
>      select ACPI
>      select ARM_SMMUV3
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

