Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2167154ejb;
        Tue, 30 May 2023 06:12:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qbwPkhd1KMVQ775oPtbQRDXX+ecKMjiUGI3aN4qXVGlc2HmLWa9tUULszoPw6WPDFLoKl
X-Received: by 2002:a05:620a:664b:b0:75c:c99d:e3fd with SMTP id qg11-20020a05620a664b00b0075cc99de3fdmr1574073qkn.26.1685452328760;
        Tue, 30 May 2023 06:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685452328; cv=none;
        d=google.com; s=arc-20160816;
        b=Hmu2lJoh4vnEW5GvfOEADF32zkSXOH/NaaibMNOh9co3F9g9Y94vPtKhfjAGMoJyyt
         RMNDUNrkn+vM4iQk5mZulXdYkpdVkt0bXCQHRBhF1aThcBTlpmrN/Q63+kWCLIVvxCXV
         8aZEwxNyyqJIk3Af33tUxWLXYjrZas+DfTF8KwT96YHm/ZMYiCxujRUXgh5hoVWr4fKm
         7F5HO3seUXHBQGKy8gd2z/7RLsc29U2/0NPHOZ44eUjCdlqJtd/fhQVWsr4nCAYCh19p
         pfHHE1r9hMhrOIgz2gnr30uo7HRmp5RQlnJ+zML4vJlwpQ7yi56Sz+GfYbm5v76BYCDC
         9s1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=on7RpFhJz1BSF98u2+EhG3SopGxsq+FLnRLwSYTszMg=;
        b=mCFLwSt+ZsoR/rRbM2qb/FCz7zGxc3SIM9WdVncsuk/UGy+8RuktLENVmtR47N9vOa
         aXf1fkhIA80v+MekEk74VH/KAWM0yHuaWagnUrFKm3eXIOtDwCHVa4IwKir0P9xQcOKj
         aj6Tg2UNhfmC2dbGz4wEpfayqlbGuh2sjhZAjIrnnUsdTIyKnjPh7iYY/wgzM3Q33hDh
         vpcHZSb6QNeFfSJ+K+vXb1i7TJ2C1mr3e3y2yV/ThhLIlxQTTLb8vv5dx6/j8Fg9yNxh
         FMLC47SzlQSo5Z8rwDu78kAX2JswO+rxwJwB9hxZyfm/swMivGKTSUl2SKqFXLmRhFm6
         bDvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awrO4LUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14-20020a05620a13ee00b00757868b6a0asi6331424qkl.214.2023.05.30.06.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awrO4LUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3z8t-0003iO-23; Tue, 30 May 2023 09:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3z8p-0003hg-2D
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3z8n-00049Q-JU
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685452316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=on7RpFhJz1BSF98u2+EhG3SopGxsq+FLnRLwSYTszMg=;
 b=awrO4LUM6zHb5/n3aEsRCGmSWVz/yDxoxG430DvIs9HLXvW7yKpv6Nwut6SPDps/FlXhUe
 TjEZEoDWXitam8MqGqGnEZ+M+D0GKP0fnvs0eUI3Whak1mvbsygExtQ6XFYeEuVCkE/QvO
 Nwbx/K4oKoGJ936eumwvLhGYY8sm6io=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-i_onaC1LNzmr1Hmm9fdHTQ-1; Tue, 30 May 2023 09:11:54 -0400
X-MC-Unique: i_onaC1LNzmr1Hmm9fdHTQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so18607725e9.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 06:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685452313; x=1688044313;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=on7RpFhJz1BSF98u2+EhG3SopGxsq+FLnRLwSYTszMg=;
 b=YZ2ij56quWziRjRhIztIG2Z4MFt+JRhii0jW6/Ao0+3l1b77WPXCFUe5WE3vPMRy0c
 jckINPE8134o4xEIyPyEP6HutZjkmN9oxOrna/IH3bUT7NbBz45T3FZJvkcdd62Hkp/m
 NYDfm9qxVvwSQFSiYDpcrB2B03yZ+2I3Q6SMAVk76T9HR4xLckKBiXl6O3/YqU8lEWtA
 ez313Ap+/Q94ZO8g6AtOJI34YkgNtB1ANMoZDtZCMUrtdkvE9fqWVuH9V4n6P7mRvi6+
 yiW4CcImxaYvaAzxTBhCCZUDu5ryvTDAkbaeKGQPwrURLH68kZgwDKHDjg3gu49utlOi
 DhRQ==
X-Gm-Message-State: AC+VfDz2QyX55bTwDF2B2KFS9xt09MmH2OErG/Q5WEOrq8iercPmv+p6
 nG0W6n4RRVDGecHNez94Q+/5zWpNvjdnyASdNI6Ai4EVYEPbcPZIng+vS4fJ4ma3IXOh8tFUoG5
 zGcf9vT5PBVwK
X-Received: by 2002:a7b:c044:0:b0:3f6:42ce:a384 with SMTP id
 u4-20020a7bc044000000b003f642cea384mr1420743wmc.11.1685452313724; 
 Tue, 30 May 2023 06:11:53 -0700 (PDT)
X-Received: by 2002:a7b:c044:0:b0:3f6:42ce:a384 with SMTP id
 u4-20020a7bc044000000b003f642cea384mr1420724wmc.11.1685452313422; 
 Tue, 30 May 2023 06:11:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73c:d500:78e5:f448:8bef:a30?
 (p200300cbc73cd50078e5f4488bef0a30.dip0.t-ipconnect.de.
 [2003:cb:c73c:d500:78e5:f448:8bef:a30])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a7bc8ca000000b003f42ceb3bf4sm17229324wml.32.2023.05.30.06.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 06:11:53 -0700 (PDT)
Message-ID: <9d395d6f-4da9-45c6-bf20-ed33f1c4bca5@redhat.com>
Date: Tue, 30 May 2023 15:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/10] hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-9-david@redhat.com>
 <20230530090655-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230530090655-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: asUdOHc2b+ZI

On 30.05.23 15:07, Michael S. Tsirkin wrote:
> On Tue, May 30, 2023 at 01:38:36PM +0200, David Hildenbrand wrote:
>> There are no remaining users in the tree, so let's remove it.
>>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Eduardo Habkost <eduardo@habkost.net>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> 
> This (with previous patches) means any user changing
> device-memory-region-size machine property is now broken, right?

We only had a getter, no setter (for good reason).

> How do we know there are no users?

We don't. A quick google search makes "device-memory-region-size" and 
"qom-get" only pop up in BUG fixes for something that appears to be QEMU 
developer driven.

I don't consider it any useful, but if we want to be careful, sure we 
can leave it around.

-- 
Thanks,

David / dhildenb

