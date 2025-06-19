Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp113540njc;
        Thu, 19 Jun 2025 01:20:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2LznGj8Kkd28T69BIsXQdyd6pJ3EuLSX9uggmol0ayBitLDoRj9ihjSuStvM0VKFUDjzXl7icNOujPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEWAdtp7aefbcVHwKd1u2ht7WU7hAz1KnLuNLXrgKusiqTHsAw9nIJf6LJEP6AJijnt1xJ9
X-Received: by 2002:a05:620a:1a86:b0:7d3:8d53:c509 with SMTP id af79cd13be357-7d3c6c0c794mr2739984485a.2.1750321211880;
        Thu, 19 Jun 2025 01:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750321211; cv=none;
        d=google.com; s=arc-20240605;
        b=N8OOe89+JOg6LppDNzY0ccZI+8vRHCcRx6AI/7lFq8dBXwyx1KUcEPtK0yyFWdjJhw
         5gdurvzLSmqmn9jzBpN4cRvrGmbVc57pcaauyvCvc9Jeo7c7FvHPW0P/xSvQ/EcqE5SL
         PHd+Y/gaHDMcY3Lfc5KgPCEqutFYVlUg8Phj4DodjpiQVQ8nA5sW5hHy43GXHFarEJ4u
         K+yFvmNFAzB3ClI3r4PBEgFFEyoL2aGfPmX6JaD8tH0S2eteoM6ntALKqYg6X7+4MWP1
         XBojOlGzkSsHN1/yuVeluCwjCRQtOzPpwV7ThaTRfsduN7W05Wm3uP6A3xmV+aXc6Pof
         a7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qX1ZSkd//NoJquOm66zsf8L4UNYjr2aiShByP7TVuNk=;
        fh=umv0g16Y1mxyNGP4aYnqo0p15oygslLK09ApZ4g1jOE=;
        b=GHKeQ5j1NfGmawgB1vseiXVyLu8gTbYex/2Xy63aY1aQCcjzs7wFbdBT/dnuycWukW
         H/vH8N/TgLBbQtclEekTgvqHjf2bDS58ubXS5HRxxf2BnV4PLuH7Vugh9JYfoZpH3Lxo
         /vQ+221fxG1Aw3z6B08j+p/WwZkSKm9qjz192fa0yhQ0H6gP5vG6i08S1TfrPZdrJoap
         9Y9ViuoEYcrZOheBh7E2cFAk5Kh/XoJL3kn0XaplIsV20FILPIG9WBLtAN3qK27x4dzF
         ypvD4lkpGRs2JxoRQFZXGOvKZbBa6raOtjAWCPYIDYxJsRVAtOdrBDFvU6u+QnO3r3sF
         LP/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMABH14N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f17f90si1577771485a.480.2025.06.19.01.20.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 01:20:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FMABH14N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uSAUq-0006SN-VL; Thu, 19 Jun 2025 04:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSAUo-0006NN-Il
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 04:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uSAUl-0004xw-He
 for qemu-arm@nongnu.org; Thu, 19 Jun 2025 04:19:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750321176;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qX1ZSkd//NoJquOm66zsf8L4UNYjr2aiShByP7TVuNk=;
 b=FMABH14N5O7FyMdU+StOr4lkkbmA7z71YTR4Z4UGV0WddVHQ0HyZxeA5M6vhiBkeiW1RwC
 8Yil+3uJSxstvlBoUEgfIiNKMQczz3k2/YirVWltM+EiwwUcKnlKnIz2CpPKypp93M73mG
 B7xFWlTeIiflR47U5CmFIklRw+fsbs4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-Yd2f2-wpPuy95KVhQHvGdw-1; Thu, 19 Jun 2025 04:19:34 -0400
X-MC-Unique: Yd2f2-wpPuy95KVhQHvGdw-1
X-Mimecast-MFC-AGG-ID: Yd2f2-wpPuy95KVhQHvGdw_1750321174
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4e713e05bso245594f8f.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jun 2025 01:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750321173; x=1750925973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qX1ZSkd//NoJquOm66zsf8L4UNYjr2aiShByP7TVuNk=;
 b=aPpBXmPskl/bsd4Nd1hhS/xqNXNhHSDoVU7Ou8IsbwOV9TULyEjwztYhNjxQKoQoF1
 oU+vxW/P2HB3Iu+qyUBG/mWbUBb93YKTSZWSDcG/hful35qaImyovJASv0k1HWDhgeWs
 ZAjJW/Uh61WlLisS7U/326xlUNEOf1BSzymz0lWAYG8W7aSqzcNoxBod+b7vdiAVKvBH
 H3ceWzQrk2rXC7KRwjRm4EQoYJ29KcgisQvjsU+xLw1p6Eop1D16SgO4Ll9aIvsOdzrR
 r5o8UdKafKH+tiGVLcK4D3IFy75FgYORDm/sNnOH+u8EjVSB6+YaDaQhSdJZoTUBr/Rj
 1pxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbZ0msGWqWuzi6klV+SlqIg/1Z8H7BwcgbgQ4R+qmZybY9LIODQOr1GRybwdzQ6pTJclzAsZnbqg==@nongnu.org
X-Gm-Message-State: AOJu0YwzZES/mZ8DL3Iwlom+Wry/Z70XcLkwZL0NU/siIyS0HIeXcMFe
 2oJixi8W26qJB41ak2XVUmlW+Y5rbaKvT+H1G7dwBDTH/fbMFM5twGSAOK4V18BWFYWIerOn5oc
 KyePDATwIsIZdZry4BrhdCl50cpbhQsBTooVR/SdWXeWnZg6hAjtQoA==
X-Gm-Gg: ASbGncuJp/IQqhdTkBGEoODljL6ch5+qvk4/jiyJ+sG4JFGPVowCAAVqfChY+kB5Hfe
 LMnxU0xkaLNlm97/HmdEb4Au2QGOkG74ooM7Ql0Xx1SK52mCNfUdt8AFnrLDKOtyaoLtGSl40lk
 hMBamqTOML3DQ/Bs7OYWlm0bGpTZ6REKj1hnqPqKJXtU27ENCkmjzQyodalkG2GEoJlZD4vogjL
 ojG5CTtYd4VRyA8POqVyrGi8BAbwqsp+/0bkUeYtF+Nlyv+k0x9HTI00UF1vNlPPBcHe9GymdnY
 cu1ItYJl3O84lHjfpXLyEC1OsjsHjl3HKfAgq7iMC4ArbuscaqA5LCv/Yt1m1ODFe4aOVg==
X-Received: by 2002:a05:6000:2308:b0:3a5:25e0:ab53 with SMTP id
 ffacd0b85a97d-3a5723a399cmr16341971f8f.32.1750321173595; 
 Thu, 19 Jun 2025 01:19:33 -0700 (PDT)
X-Received: by 2002:a05:6000:2308:b0:3a5:25e0:ab53 with SMTP id
 ffacd0b85a97d-3a5723a399cmr16341944f8f.32.1750321173162; 
 Thu, 19 Jun 2025 01:19:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a58963561csm6485934f8f.47.2025.06.19.01.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 01:19:32 -0700 (PDT)
Message-ID: <5813ae16-c898-4620-9622-3c12e8a7b22e@redhat.com>
Date: Thu, 19 Jun 2025 10:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] ARM Nested Virt Support
To: Marc Zyngier <maz@kernel.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, gkulkarni@amperecomputing.com,
 gankulkarni@os.amperecomputing.com
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <86msayec3a.wl-maz@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <86msayec3a.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -LP84RsxuOLQ-lHmGuxwcxzKWB_nVE2_PGKIUxdFD6g_1750321174
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.895,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: BNlRWkCQnjc8

Hi Marc, Miguel,

On 5/27/25 9:39 AM, Marc Zyngier wrote:
> Hi Eric,
>
> On Tue, 27 May 2025 07:24:32 +0100,
> Eric Auger <eric.auger@redhat.com> wrote:
>> Now that ARM nested virt has landed in kvm/next, let's turn the series
>> into a PATCH series. The linux header update was made against kvm/next.
>>
>> For gaining virt functionality in KVM accelerated L1, The host needs to
>> be booted with "kvm-arm.mode=nested" option and qemu needs to be invoked
>> with: -machine virt,virtualization=on.
> Thanks for respinning this series.
>
> Do you have any plan to support the non-VHE version of the NV support
> (as advertised by KVM_CAP_ARM_EL2_E2H0)? It would allow running lesser
> hypervisors (such as *cough* Xen *cough*), which completely rely on
> HCR_EL2.E2H being 0?
While respinning I'd rather not support KVM_ARM_VCPU_HAS_EL2_E2H0 in
next respin. The code is mostly reviewed and I would rather add support
for this in a separate series. It will most probably rely on a change of
the virtualization property type to support a "restricted" enum value.

Thanks

Eric
>
>
> Thanks,
>
> 	M.
>

