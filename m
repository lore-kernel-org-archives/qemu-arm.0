Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3119927njc;
        Tue, 25 Mar 2025 23:55:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/Nz+1Knp9i1ivDYjKXXYXCwO9GdYeBVY1/XdksBUxhYqUJe5i+RF7hEnOQBduuUS6ypwaVqlr6L7y7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFg6RLLA8so5lCthVd33UfqaG7ETfauIhDueRbLBtj/5I9rcxoPawq8eCcc6Nb6jcYG0Nrm
X-Received: by 2002:a05:620a:244b:b0:7c5:4adb:781b with SMTP id af79cd13be357-7c5ba139e08mr3095094385a.7.1742972131001;
        Tue, 25 Mar 2025 23:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742972130; cv=none;
        d=google.com; s=arc-20240605;
        b=cVVRDkYC19qbQPRzHSHZ6nBwfcizrLVE2MYz65WRXgqauab2YYow2pA7JwoVL5s7DY
         MFso4UiMmBczb5uC31r7hYo5qysS15eNCYGZC5o4wV974fBFgT7IVGxX8fOHs5q6PlGz
         I/UhG2oO7YaD1VaWtRr/84DaQVnTHgufX4u0r4CSzgNTxYAjtmiVF13AnTun35d45Bh5
         fMTVz/7R7fVcP64Gh8sKJOQstmPvesB9DHSNWaiLHAyliF/vtow1UVFvcRKtOql5NLcQ
         sM411UMh5wHR6VMqgqg4HSKb2XcAdkmdYkS9Ja2TvNIbJeKx7iwe5DD1eo3LBH1n7hf+
         VzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=r6HFgaWpGsCe0cUf/qQJ8aW2AJY4tDE2A9JgLWqBZSM=;
        fh=Cs8/KP39VZLA3O2VXVUPZQ1EPGUlePR8GZrdmqOp5Rw=;
        b=U8QoOEf1jZNFiuQELFmWHsbruEwUc9KBAE+atO9GzXMr7yOh3FkLAPbjozWKzcqEdK
         sB+yJiU3/22seiRhMdNgcwm03ck7aMX91Dcgw4VqyV5VIMyIHPFXvtfle/KIR7yiToCs
         rbZrAaYW+52mnkRRCfG35Ar/f2mGhKHi0w/JRFiZcLW+7U39eSoAqlZC1stCPuDxyPhU
         s1ytMB/laEDsz0u9RnpLfXEV49rwRbje5+Bwg26wwST8KHHyBFG9sN4Mh0tVrLpGTBcb
         45aHv7iH7moH0LzSuY5C6vMHjrBN2C5uUm+QwzKM0yM3kLXSEq0tMCm+6cWHRZtn7kka
         ZCGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZ0TVlOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b934701csi1089377685a.319.2025.03.25.23.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 23:55:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KZ0TVlOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txKf7-0004ju-2d; Wed, 26 Mar 2025 02:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKey-0004iQ-Eh
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 02:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKeu-0006fH-LF
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 02:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742972078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r6HFgaWpGsCe0cUf/qQJ8aW2AJY4tDE2A9JgLWqBZSM=;
 b=KZ0TVlOFbOU/LvWWzqB6Jzoh7at2MqEMGF0Wjh8/BLTJegSJ1FnOiTr9RjhD3r2nM3ua88
 XfZ7F0n47jw5FAVxCPoMUDR5AFFj+TpxoZobwiMcvEHtkYLm5obMY6R+WudfEUPQ17O4Ri
 +RXjSVCfegrH/6tvIiJ9IrpmkLTSFec=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-BcUGZpKoNfSeQCj_TFa3bw-1; Wed, 26 Mar 2025 02:54:37 -0400
X-MC-Unique: BcUGZpKoNfSeQCj_TFa3bw-1
X-Mimecast-MFC-AGG-ID: BcUGZpKoNfSeQCj_TFa3bw_1742972076
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d4d15058dso45522745e9.0
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 23:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742972076; x=1743576876;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r6HFgaWpGsCe0cUf/qQJ8aW2AJY4tDE2A9JgLWqBZSM=;
 b=P/IBI3buuEl7l5ukPJRE8+qqrFHXzmhOZhrYWSGvwn/qpHGWjus3ROqXkg3ip1jtqP
 fwU1QMKBPdb+VNvk5ySfxgw97ozqFbJDD+npqTY0633XPz013zrhq3RUI7Tdabz09kbQ
 O8lwHorvdKMXejmafyqtgBCUhSIJ+TA9fUM97qdjxkA5mCN6uXrCJAmaKUCotX250djZ
 ALYHfFweqm3t3aYR90/9bX8tlNbHtUeMkMTS3jqtIyilrKwOV4yidTb3rCOjB04DR024
 DU683T64KjkAqhp/wafcNNOSFQ/lU5CpJ2KeAHS9Sv9SpZpu1Lvkjb2YvRKyEfd3xs1J
 s2mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFppjshsyBKrReK6BkS10ewjxeKMWJvBcrI2R0WCShVo2xaUd8wQL5HQ//iass4DGuyVsFY0A9dw==@nongnu.org
X-Gm-Message-State: AOJu0Yxsng6i1R5OkrOxA47aUpeRBVjWb4ay277tkqd1f+PTB/x+h99A
 rkoIQK7cTu8vFRxJMqRapE3FXU2HM/I8m91knUUpwQ9G3sn+2JDP/9L2ufFcNjDIvTt4oqyL1LN
 xwYLvgCPsXFTxXOtvQPNIcHTKCEash8N/8uDtgVrR0+WKc77g4A==
X-Gm-Gg: ASbGncs8Gi5Lxg4mlvrHomo4I8p2IqHux/nCYRk2gOIX4isy8SJmEmhpKH+s/R4amIy
 B4aJ1BpZexc0gfw5w8hv0TwHThT58uBBasfy5S/76ux1KtQECSk34B7CfI3ckKN9JHh0eVapdgO
 LnK5rT/RT9XhX/yD/bYZWyYFlqfIfH11pM8dazBPmlGfqCCELW/e9Mf7DP5OmxoKFdgifgcTN+X
 bNvVy6bFFKo4tykFC0SS+lj1No+JQe1N9PsgoH+2JEFbLIk1mRqlepvc6n1WF92oUAZZwfGYWDP
 cj0Dp1l4HyiROvavzxNCX4bSYnbmVb9PjsQoj9V3Ji23ues=
X-Received: by 2002:a05:600c:3489:b0:43c:efae:a73 with SMTP id
 5b1f17b1804b1-43d509ea0f8mr221007005e9.10.1742972075841; 
 Tue, 25 Mar 2025 23:54:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3489:b0:43c:efae:a73 with SMTP id
 5b1f17b1804b1-43d509ea0f8mr221006805e9.10.1742972075396; 
 Tue, 25 Mar 2025 23:54:35 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-43-49-206.web.vodafone.de.
 [109.43.49.206]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f33242sm224529015e9.5.2025.03.25.23.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 23:54:34 -0700 (PDT)
Message-ID: <23a964b8-dd02-4160-b03d-8fba70611ac8@redhat.com>
Date: Wed, 26 Mar 2025 07:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-10.0 12/12] hw/s390x/zpci: Re-categorize as BRIDGE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Samuel Tardieu <sam@rfc1149.net>, qemu-block@nongnu.org,
 Patrick Leis <venture@google.com>, David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250325224310.8785-1-philmd@linaro.org>
 <20250325224310.8785-13-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250325224310.8785-13-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bNE3vokczjmF1RvGsRn_uWlYT24E7y-2iiaOUnZ-CUM_1742972076
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: E8/UVCNmiMh1

On 25/03/2025 23.43, Philippe Mathieu-Daudé wrote:
> A 'zpci' device encapsulate a PCI device to be usable
> by System/Z. Categorize it as bridge.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/s390x/s390-pci-bus.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 2591ee49c11..dbfe24f6eca 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -1562,7 +1562,7 @@ static void s390_pci_device_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
>       dc->desc = "zpci device";
> -    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);

It's not really a bridge (in the sense of a PCI bridge) ... I think it's 
maybe better to keep it in the MISC category to avoid confusion.

  Thomas

