Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2457170ejb;
        Wed, 24 May 2023 03:50:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7W7k42Pt9pQq1wDSGvQVWQpfmRXJC7REuWcWeRZAsgUWuIwuo+jmzXz+UYkIa0fIjL435u
X-Received: by 2002:a05:620a:8d0e:b0:75b:23a1:3680 with SMTP id rb14-20020a05620a8d0e00b0075b23a13680mr5591526qkn.65.1684925445547;
        Wed, 24 May 2023 03:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684925445; cv=none;
        d=google.com; s=arc-20160816;
        b=e6LhG2mD3M6C+gS9A9H1JZprFDyyxwx9TEo9LU9Q3/ZczKud0cSGYo7bG1aVSCIPVg
         2uygovMnai2gIFo+g5AIKlHhvRZ/BP9YD2zyl63WgtaZRyKbuhTR8LKzeHN9FFwKGV1K
         K1ri12RHB3eZ00BY/Nv8HNHtNcVZ+ut4PKk8y8ATjIiF9gfkYc1FU29Kx2GfXqZK6PiA
         xexdu6puXDw5qZn6A3SqAMdafEDpPrI3ZGt6r1zvwDMjlZzMYuEpV2coPDajtyzyCyjH
         10OvsdTYfuC3MmajFJbJRiYrBDZWLZr7ZW2sZmO3aOBWneIwhCAvlYaMXTRGk55dFiGV
         bCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Tg9A53sw9YkDVVqjhs6LhBWqtblAEzt4rZTB7Jvd5nM=;
        b=07UPCKTlLHmWbqqmQREJIak/xx0Oo8eFOIrWkjKyY5eVNiqUcenzTtiT6LP+AyThEk
         Xyhvn6Wv1VU1OLPLqhv5MMB9hCdT4ENNcImm84BfpsyhTOipAGwGwk4raFe5IGGvAaD8
         hc4GhG/fOgWJMh4aw0uLUPa8E1JmVXeJRvkqzDAoYPfCOSeWDb9EDcGU5mjIVzmaIA5I
         rHzaHNm0pVqJEeZT7vp7USNMZuSXxqNFjEE0tVriqsNeS+zE8w6v1hJAfiSzmP3yk6H+
         3sg6CA7ULhN2RlCGvj3ayVQbQ+6L80Ht7kYPTneLtKG7NnNNL1oEXtoNBXbRVmv9eXZE
         CjDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=baPQnh3B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z25-20020a05620a101900b0074fc1cfb2c9si6015692qkj.685.2023.05.24.03.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=baPQnh3B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1m4i-0005PE-P0; Wed, 24 May 2023 06:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1m4h-0005Os-86
 for qemu-arm@nongnu.org; Wed, 24 May 2023 06:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1m4f-0005tk-Jg
 for qemu-arm@nongnu.org; Wed, 24 May 2023 06:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684925433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tg9A53sw9YkDVVqjhs6LhBWqtblAEzt4rZTB7Jvd5nM=;
 b=baPQnh3B92GeqYLnk7EaV32lUKwZv5YJLwb5C96h+uUBDIP8S0e3G+FSvvtL63lmAdhDa1
 ZpmNZxYRS6eiQoitw9ec8adC019+fUDPKEjVSw7dMlrLnSBbsntFcsO0Q0/Rf75jviircl
 6fwCHKy2P/xxtzSxb9nrIqiMHpl+ff0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-95LkDtuRNMKpc3C3ZxiGaQ-1; Wed, 24 May 2023 06:50:31 -0400
X-MC-Unique: 95LkDtuRNMKpc3C3ZxiGaQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so3169595e9.2
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 03:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684925430; x=1687517430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tg9A53sw9YkDVVqjhs6LhBWqtblAEzt4rZTB7Jvd5nM=;
 b=e4Vf29Hm/bsUGrPPINtOWDSuSnNLP8mWlZJITHpdmKrRxEkH7HYCJbkE0EaVyRmUC/
 l3q1TsaPodvLeZ3HTkkzqDzlg+10MGLoKmuSHcCAy2hSCHp10cAVqHCqIbrULZ+Hur7v
 ODGGusv6N3JcUOYKQRkgf3z0YX0BVfbGqqJ4HP/RY/5E9vx3mCU5YJ3fMPkZz9sHrriH
 oOnKM1l8KiDA1+n76LYRwcpRrqx8HD/CQ156oLsFP7/FbBqa5o3tgPSw9P4dmwqmFPb/
 WMP2wJDEH2/w/FjMw47h2atXK6S5cPoMDepF1rfV2YH72PArbMNpgoOyiUgjE16ua+fE
 qHTg==
X-Gm-Message-State: AC+VfDwf+EQqCCfU59StYUTvD+gtyquwQP5woHq9t9Qde8XixLa5TkGt
 3EusU/MmeGpy0pjWtRui3Ykinau+yc/a2y4Qwaq83Kb2zk0K/eqk7kSVFDYeX3pXk3ezzKeYf8P
 qKug28Y5NHKQn
X-Received: by 2002:a1c:ed0d:0:b0:3f4:2897:4eb7 with SMTP id
 l13-20020a1ced0d000000b003f428974eb7mr12033328wmh.38.1684925430379; 
 Wed, 24 May 2023 03:50:30 -0700 (PDT)
X-Received: by 2002:a1c:ed0d:0:b0:3f4:2897:4eb7 with SMTP id
 l13-20020a1ced0d000000b003f428974eb7mr12033312wmh.38.1684925430141; 
 Wed, 24 May 2023 03:50:30 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-64.web.vodafone.de.
 [109.43.176.64]) by smtp.gmail.com with ESMTPSA id
 l5-20020a1c7905000000b003f4289b18a7sm1971136wme.5.2023.05.24.03.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 03:50:29 -0700 (PDT)
Message-ID: <c4981714-e3d6-e035-cf88-338d8d018fbd@redhat.com>
Date: Wed, 24 May 2023 12:50:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 3/5] hw/arm/sbsa-ref: honor "-vga none" argument
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
 <20230524102729.810892-4-marcin.juszkiewicz@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230524102729.810892-4-marcin.juszkiewicz@linaro.org>
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
X-TUID: 6H9qlhve9Sd5

On 24/05/2023 12.27, Marcin Juszkiewicz wrote:
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

Once you extended pci_vga_init(), I think you should simply replace this 
line with pci_vga_init(pci->bus) - then you get the handling for VGA_NONE 
and other graphic adapters automatically (especially one could use "-vga 
std" to switch back to the normal VGA card that was used in former times).

  Thomas


