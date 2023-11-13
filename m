Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1439447ejc;
        Mon, 13 Nov 2023 08:07:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGW+oth6wYCFKD+EywT/z/DAdqlpGknIEO3LGA4On31LMRyhVNAhkNW8lfX3CuzwvzAuMR
X-Received: by 2002:a05:622a:182:b0:41c:bcd4:19b7 with SMTP id s2-20020a05622a018200b0041cbcd419b7mr8854817qtw.15.1699891655621;
        Mon, 13 Nov 2023 08:07:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699891655; cv=none;
        d=google.com; s=arc-20160816;
        b=iaDBgc6n4TtDy7DqPVXA3nF3UsoE1a3VEdnT9zRpk7ybz5mzBbLH9ioEtlulgWeta4
         sK3ga+66ZXNHq16Frd5OAPaPHpMJPwbrvEgaAyWvmEq/dmAmfdUPxMJC9JNP+OLcMCIk
         DpAPPJ9mxEvOvq0EOMfw/QIcwT8T+Iotp+WmV2mx65Cxc9rIh8prkVdATfxduHDh/ePE
         iqWUSg4AdqTAnZa0QklDjMve4HUVkWqk4BP0yXbGX+3Dk5NWBAlpgGbh/hD6XR9d8cRy
         wDG8At8TnO5y4HDRYD8lI7vj5RcvEdRu5zghbhTzSPAQ7R+C21le4XkVK2thUVJEv5Vs
         JWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=H0FUlj3f6tDnLI7GCuM1w2NSIFvel/178u6D1jD7Bbw=;
        fh=rBaAIodw8WCesbgKbxy42LiGX5alWSuSmEb9LPnOgFY=;
        b=l/xtgR8UZFXAq6WN2NzKr6+U+ggJyoIy3DNdWJDuMVIj8tc73iWJYsTMzHH71NRSw+
         gcL4xpnkGSl5Z9mRPqJ162/v2X/U7YQv1OYPlKBLv5AyPneyhbJezG5DSTd1GHb7gAH8
         q1WQ3e0UCRCTzW4XLoZpmRQrr2tQd72rO9JXY8mwl3M2VaUQ/635njmEtaD3aIzGU5yS
         6s2S6c6TAdNNfedWTGB87MQ3uS1UBLr9CvCAHXBSl9oWJb8WXm9YYuoJuDopUngxrX18
         8dlfVFs0rbIgT9ifGcPw/8+9+VSs5LV+oignWcqGqoovYrKRatjSh4jXx2DG6BobOrDX
         5ExA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Co7o30jy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05622a008a00b0041e4be2d3c7si4969937qtw.360.2023.11.13.08.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Nov 2023 08:07:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Co7o30jy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2ZSu-0007xw-No; Mon, 13 Nov 2023 11:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2ZSs-0007xF-Qg
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 11:07:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2ZSn-000339-Sq
 for qemu-arm@nongnu.org; Mon, 13 Nov 2023 11:07:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699891619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=H0FUlj3f6tDnLI7GCuM1w2NSIFvel/178u6D1jD7Bbw=;
 b=Co7o30jyAtdaZiE2nsMuNNIctMglU1tTdeGTkMYhlz5ejf6rvuXUS4q71POCdBv4K2vYkh
 s/K5N93P+yvctUDR+6tlS2ZyIbhRqAkJuGdjZryx+vtbdZEMif9vp4RBSJcmkrzfxWCcoi
 tFqXKlkRyyM3/hku+6No/7EgqslN8Ic=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-GApZBeguOpqcRaWdrCyzZA-1; Mon, 13 Nov 2023 11:06:58 -0500
X-MC-Unique: GApZBeguOpqcRaWdrCyzZA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-66fbd02d104so59185156d6.1
 for <qemu-arm@nongnu.org>; Mon, 13 Nov 2023 08:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699891617; x=1700496417;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H0FUlj3f6tDnLI7GCuM1w2NSIFvel/178u6D1jD7Bbw=;
 b=fdD+3qYpTLKVd4bHn9Vf+AMYqvYBaobcKhaRgGszrL40fHC39G7LEm4lZFsF9zpYsR
 6yVKy0h8z3jyt7lkJc5fuXDWm9eaApATHad5GvrdqmHlDK1KxUxSLySCye4TkJTJvh9f
 lbdgJI2FpAl9g8GBwz3iocwG1r+w/3zfhw9whCUGZkNWJSp9bPcqx2k8aWvIVUTC7bqJ
 Te1WBPnK23PtlvfyS3JvhO5g1IXByfbo5obeW7KraP+futCnMp3jnSIaAaa42J8WyeUP
 AvoAX9WgpoL1dDm9sRqPe+j4Q+g9TOZ6fPDBhYYXsybKWQ/ThPyPCE/h5+ZCWRn2b5/q
 yiag==
X-Gm-Message-State: AOJu0YyXYqdVpvlwKj6QUQk79ut0oeN5l5f3elHYiEs+RoER7sfso6do
 mSjjkIBS+i7VBkA2kq+Von9OLHqNPr1EQAgnuue5eZkttrHBgsz0UJP3wWf6Y8PpiAyaxQimgvc
 NqEc/+EJwDG1G
X-Received: by 2002:a05:6214:882:b0:66d:35b8:e661 with SMTP id
 cz2-20020a056214088200b0066d35b8e661mr7152708qvb.45.1699891617516; 
 Mon, 13 Nov 2023 08:06:57 -0800 (PST)
X-Received: by 2002:a05:6214:882:b0:66d:35b8:e661 with SMTP id
 cz2-20020a056214088200b0066d35b8e661mr7152689qvb.45.1699891617293; 
 Mon, 13 Nov 2023 08:06:57 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-177-79.web.vodafone.de.
 [109.43.177.79]) by smtp.gmail.com with ESMTPSA id
 g1-20020a0cf841000000b00656329bb3b1sm2171472qvo.10.2023.11.13.08.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 08:06:57 -0800 (PST)
Message-ID: <6ef83710-0e79-450e-a3da-5780f97430ac@redhat.com>
Date: Mon, 13 Nov 2023 17:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw: Replace anti-social QOM type names (again)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: alistair@alistair23.me, edgar.iglesias@gmail.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com, qemu-arm@nongnu.org,
 Tong Ho <tong.ho@xilinx.com>
References: <20231113134344.1195478-1-armbru@redhat.com>
 <20231113134344.1195478-3-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231113134344.1195478-3-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 81/QWheq+tjq

On 13/11/2023 14.43, Markus Armbruster wrote:
> QOM type names containing ',' result in awful UI.  We got rid of them
> in v6.0.0 (commit e178113ff64 hw: Replace anti-social QOM type names).
> A few have crept back since:
> 
>      xlnx,cframe-reg
>      xlnx,efuse
>      xlnx,pmc-efuse-cache
>      xlnx,versal-cfu-apb
>      xlnx,versal-cfu-fdro
>      xlnx,versal-cfu-sfr
>      xlnx,versal-crl
>      xlnx,versal-efuse
>      xlnx,zynqmp-efuse
> 
> These are all device types.  They can't be plugged with -device /
> device_add, except for "xlnx,efuse" (I'm not sure that one is
> intentional).
> 
> They *can* be used with -device / device_add to request help.
> Usability is poor, though: you have to double the comma, like this:
> 
>      $ qemu-system-aarch64 -device xlnx,,pmc-efuse-cache,help
> 
> They can also be used with -global, where you must *not* double the
> comma:
> 
>      $ qemu-system-aarch64 -global xlnx,efuse.drive-index=2
> 
> Trap for the unwary.
> 
> "xlnx,efuse", "xlnx,versal-efuse", "xlnx,pmc-efuse-cache",
> "xlnx-zynqmp-efuse" are from v6.2.0, "xlnx,versal-crl" is from v7.1.0,
> and the remainder are new.
> 
> Rename them all to "xlnx-FOO", like commit e178113ff64 did.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   docs/system/arm/xlnx-versal-virt.rst     | 2 +-
>   include/hw/misc/xlnx-versal-cframe-reg.h | 2 +-
>   include/hw/misc/xlnx-versal-cfu.h        | 6 +++---
>   include/hw/misc/xlnx-versal-crl.h        | 2 +-
>   include/hw/nvram/xlnx-efuse.h            | 2 +-
>   include/hw/nvram/xlnx-versal-efuse.h     | 4 ++--
>   include/hw/nvram/xlnx-zynqmp-efuse.h     | 2 +-
>   7 files changed, 10 insertions(+), 10 deletions(-)
>
Reviewed-by: Thomas Huth <thuth@redhat.com>

