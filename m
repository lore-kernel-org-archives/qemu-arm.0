Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2421031ejb;
        Wed, 24 May 2023 02:27:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ZMoz/Vfm7ldmH2p1cvP64jkNlekZxEJYRPSLiQucoDrs/ZC14XxFN1AJTMN/B88wjTTpb
X-Received: by 2002:a05:6214:20ef:b0:623:7108:362d with SMTP id 15-20020a05621420ef00b006237108362dmr29665078qvk.9.1684920457183;
        Wed, 24 May 2023 02:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684920457; cv=none;
        d=google.com; s=arc-20160816;
        b=n4ngN0HmNkGFbks84mBNyrwM+A4GJYbc8vxcxtDR6KFbFKqH7JEq4Vu9Z/R7mc++wv
         Nuqw5KzCgclyHM4GYHnnflBR1fnG7TwVtq0wWAhSDpU3+cAOI6N9j/DfGcqSUhcFdNE/
         JzedDoMzN3gUKQFhjwNisnUVMu9e0mHzk9GQxgnmhzDEKI7UEsBrT/empY2ZyBXTdXFq
         QXSgE2ByAJQsuSgjQQDtdRXK3gAv1KgSQr1uRd9zVN2gttRlp+bL2aeYb1WDktoO8LV+
         Js7NQ+s8Klomhj+rXbiJPEWaH6nABpLrrzcTEnicjGCB9pdq5GfJPiHiB7JB4COU58/4
         dBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=l8doqJFucJygx1DAUBs42oslGuibioM5nA5nbvNdNto=;
        b=0HV2vSgr3N3/DAl/0f7jSQrXjFWaqClZRiWLMVGrCJbfQ9e9YitrqWuyynFudLtiwd
         NTEWt/EqvnOwH4LqHSgKYGEZyRVMUewFe7fY85PW7soa+druc3pxqSYY43daxKmgj7sy
         VRNgPOh0vAu7Mm9cd+IrO+yxulj9Ra+KRLyh8LJ29+PmcimuHXh6Fzf9W/NVY3Ic44MC
         MC2tXuGLB9UmbnHermV/p9PYzJjxNoe2i1QzdwwJD/0cvOrOsmzxiXHeHG+Q+4HlEGxs
         wCP61OugfhNiecmvM20NteTB9Jut4+iN5q49GXXH2xvqylB7X9xWrROJZ5A65tGOYDHH
         VkWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TM5fhlVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if13-20020a0562141c4d00b006238b0d1487si2757838qvb.541.2023.05.24.02.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 02:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TM5fhlVK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1km2-0005q3-7W; Wed, 24 May 2023 05:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1km1-0005pj-5d
 for qemu-arm@nongnu.org; Wed, 24 May 2023 05:27:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1klz-0004lW-OW
 for qemu-arm@nongnu.org; Wed, 24 May 2023 05:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684920430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8doqJFucJygx1DAUBs42oslGuibioM5nA5nbvNdNto=;
 b=TM5fhlVK7o9DGv5jhO9E5qlFWWi9eN92mfqndBfRgfk1S48XME/98C7lyo05kL0OiowvwO
 +pL7rRc4axWDiAYyx/hskCLRHl9glW+oD7lxBntQOAOsd3pkItRmggphRo41VbspAF8WFM
 8bkR0hMVjEPSzXSW7qgLao2LwC5KNFA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-RQmd0pTxMn20FsxPcXnP0g-1; Wed, 24 May 2023 05:27:09 -0400
X-MC-Unique: RQmd0pTxMn20FsxPcXnP0g-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f604260ef3so4644825e9.3
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 02:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684920428; x=1687512428;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l8doqJFucJygx1DAUBs42oslGuibioM5nA5nbvNdNto=;
 b=Ner/ljQhrOpTauSASuNMFkDzqdAmLB+QjADqynkpxebPllOLpgTfQkQFJ79KbbmYGD
 ldUQw/hfWdn+xCC63H789p+ilZ7zjovpaJdb4Ihq+W1MWha9H9xqdJhPjdb2THc/2yhZ
 3DcMEJU3U+gF+7qhCUSVZjierSt4L93nErn+AiElYycJh1bwcwvnQAC9N0yro6dPjopk
 bT/I1bwq4faNgIbaX+GMVmRwgMsaIcSI7Ib/xe7SRTB9GomqRpq7uwjxnJH+Q950psG2
 4Bh+jCodUK4lZjhw4hdTRgPXnfWnGTvEk2B6m+5EACZiZdZKEUokDFhg2w8qGfxMQvlP
 ZNew==
X-Gm-Message-State: AC+VfDzM2SqjDxSJzbvIi0/twt7+HBlDguoueUH0BHVCHU4tp+9fsBoH
 yD1ipoL/hNzVZkwxK82kj2yEAy0D3iTAYHurL1ddHKYfuObv/ar4iOfxL/DQqvKgaCjA6rz37vz
 h3VkYbzBQ2pN2
X-Received: by 2002:a1c:7311:0:b0:3f5:6e5:1689 with SMTP id
 d17-20020a1c7311000000b003f506e51689mr12705633wmb.17.1684920428689; 
 Wed, 24 May 2023 02:27:08 -0700 (PDT)
X-Received: by 2002:a1c:7311:0:b0:3f5:6e5:1689 with SMTP id
 d17-20020a1c7311000000b003f506e51689mr12705621wmb.17.1684920428417; 
 Wed, 24 May 2023 02:27:08 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-64.web.vodafone.de.
 [109.43.176.64]) by smtp.gmail.com with ESMTPSA id
 g5-20020a7bc4c5000000b003f427687ba7sm1634124wmk.41.2023.05.24.02.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 02:27:08 -0700 (PDT)
Message-ID: <f1dde9bc-4b45-5a76-2cb0-edb0df2a22d8@redhat.com>
Date: Wed, 24 May 2023 11:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] hw/arm/sbsa-ref: honor "-vga none" argument
To: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lWn1tiDDxLsk

On 24/05/2023 10.39, Marcin Juszkiewicz wrote:
> In case someone wants to run without graphics card.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 9c3e670ec6..c540b2f1ba 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -649,7 +649,9 @@ static void create_pcie(SBSAMachineState *sms)
>           }
>       }
>   
> -    pci_create_simple(pci->bus, -1, "bochs-display");
> +    if (vga_interface_type != VGA_NONE) {
> +        pci_create_simple(pci->bus, -1, "bochs-display");
> +    }
>   
>       create_smmu(sms, pci->bus);
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>

