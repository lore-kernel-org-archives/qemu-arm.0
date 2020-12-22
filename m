Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp5985439lfq;
        Tue, 22 Dec 2020 14:46:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTlKjKk5EAQw9FJmcP1SLyW6c3Zb/TaSwYAkZJK7/7AgDzw+7G4LZ+KFHNPMwrvIRSLhMS
X-Received: by 2002:a25:ce8b:: with SMTP id x133mr33121069ybe.150.1608677210626;
        Tue, 22 Dec 2020 14:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608677210; cv=none;
        d=google.com; s=arc-20160816;
        b=BKCe0vHPSkhWWRhCyq7slK+CI4EFxDw2D0XgHJ1IEOUUqEDrPzEFOJr3Oa+aK8VSld
         Bjmxp1cyMoXSiVtkreuawKsACeihoPu0rMJtRkjaNCmjRUlAhLgBDnaCRtYEs+62S5lI
         /3+FReaE58XS5TkCzopQZRftBy41u9Juedlsxwc4SXB3KIue7iwoB5mUvku7l1lWGkKL
         v9PLYt77XCAXNcg2hkUrN6CL9NukgzLdmh0bSVGgf8fsXKV5g7IZLRq4P2K/2rEKXiPy
         CxJd+N/bgW92kJGrwtLCVre0HGKPERyg/wlxNkKoLTEhv7vvoqHZetzLSeN4q+3fIHIQ
         BrGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Zcv+1HCD/fKgEPgvYsqqGxDRGBg/7PvlssguwhRDFLg=;
        b=feP96R0ykuReYRpvegizQKUdOuuHI+07mgoOrIF6wiLN5D2GniSHg8qGiEJuevcwCL
         3Ia2TXJHMbQjM0XPDiJpa6VfvgvZgLU9YUsqYsgyeZg46PfsKUl4fY6wSdN6CufNGyqz
         dO3xkhZDlWXjjXdWaUedh9EqLe3sfGMoC/q1Ct303ff+zqUadLIVZSlEM+LySDERp2sr
         pk3vHZV9hb5hfFY4T8IHNf3vSozUf6EDFoaz6wseRRP+PAjXSfwoSH/N+8cMFRZsoVYM
         XJp6Hfd6PLlTkWGKLqk+AFq+mZf6q6aPVCMei+/LHHL68tU0HATO+B6pmoTdegferbin
         onsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HfZz97nx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b73si7756970yba.231.2020.12.22.14.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Dec 2020 14:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HfZz97nx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1krqQb-00030N-UQ
	for alex.bennee@linaro.org; Tue, 22 Dec 2020 17:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krqQO-0002wY-Bj
 for qemu-arm@nongnu.org; Tue, 22 Dec 2020 17:46:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krqQD-0004uf-Ln
 for qemu-arm@nongnu.org; Tue, 22 Dec 2020 17:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608677181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zcv+1HCD/fKgEPgvYsqqGxDRGBg/7PvlssguwhRDFLg=;
 b=HfZz97nxEcD450kN8mleH8GgJ9paIoZyz9KGEmHUcU8tyEdNlaRpXNVN/S2cw+vnqSu+zY
 zXYn7wfe/MmTwt/LsTZqsReH0cERWi5E6gaPVE9bs0ceYmPoInIwDrPDE+uJ3WSaGuWrv0
 Y/HcG5hmIUn++8h0xSj+ABYC1eqzJXQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-v7RhREC1O4qottsfkle8fQ-1; Tue, 22 Dec 2020 17:46:20 -0500
X-MC-Unique: v7RhREC1O4qottsfkle8fQ-1
Received: by mail-wm1-f72.google.com with SMTP id z12so2282965wmf.9
 for <qemu-arm@nongnu.org>; Tue, 22 Dec 2020 14:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zcv+1HCD/fKgEPgvYsqqGxDRGBg/7PvlssguwhRDFLg=;
 b=IpKaj5kM8uwXNSNIvK54YwsjmEtvqhIk0iSyCqAlKOxkXO+IGQOgvZET/xV2AwL3mK
 5m+23Et0rbIq+O1Jqa0L3N5ut/UnmcUUVAO0b1zKXaEw4eFoFM6twHzr/zqizFdtgBZC
 rvPlwPHXivD4hlzTxKmno2bktXeRSmi1aTV6pEJsGQIu0bokYd5USE5RYB7nSvi/1Xxp
 TL/ppiTYQD4lac58nT0/hO1OI3o2gma71geU50m/WcZN8TX0ebgM/I8fFZUurpU0iWh7
 GtzrirNfnspPU0tOOMN9JPboCtU20w0Js4XqXceyafl8btU9e3PQeFLaUvFfH8aUsJg9
 MrNQ==
X-Gm-Message-State: AOAM530ofxDl4yfUUYzlZKD13cGJnsdUX+mSQGRJGF68je8j3PPWLnIj
 snRvrj0I4ox1TPpG/Ise4afTWw5NA1zGM3LWAS0QzVdOvf++0/bytC08bIRd1itWIg4xK8r3kKP
 l9ma4PmpiVYSO
X-Received: by 2002:a1c:454:: with SMTP id 81mr23928941wme.178.1608677178886; 
 Tue, 22 Dec 2020 14:46:18 -0800 (PST)
X-Received: by 2002:a1c:454:: with SMTP id 81mr23928909wme.178.1608677178561; 
 Tue, 22 Dec 2020 14:46:18 -0800 (PST)
Received: from [192.168.1.124] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id r20sm35103418wrg.66.2020.12.22.14.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 14:46:17 -0800 (PST)
Subject: Re: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be
 changed
To: Marian Posteuca <posteuca@mutex.one>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
References: <20201222113353.31224-1-posteuca@mutex.one>
 <d04375f8-f6bc-91d6-cd6e-217a689002e3@msgid.tls.msk.ru>
 <87eejh4zpq.fsf@mutex.one>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <93c58d9d-63c6-b2d8-2b12-d7ed4aa1b171@redhat.com>
Date: Tue, 22 Dec 2020 23:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87eejh4zpq.fsf@mutex.one>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xFkgtXq64mys

On 22/12/20 16:39, Marian Posteuca wrote:
>>> Qemu's ACPI table generation sets the fields OEM ID and OEM table ID
>>> to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI
>>> table name.
>>>
>>> Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID
>>> and OEM table ID for the strings "BOCHS" and "BXPC" and if they are
>>> found, the game crashes(this may be an intentional detection
>>> mechanism to prevent playing the game in a virtualized environment).
>> This isn't a technical question/comment about the patch itself, but
>> about something different.  Do we really want to play this whack-a-mole
>> game? If we change ACPI table IDs, those who want to disallow running
>> their software inside qemu/kvm will find some other way to check for
>> this environment. We will change that, - just to be found again. And
>> so on.. is it productive? I don't think so.
>
> My personal opinion is that as long as it's not too difficult to mask
> that the guest is running in a virtualized environment we should try to
> do these changes. But I guess this can only be judged on per change basis.

I don't have any particular opinion against the "arms 
race"/"whack-a-mole" situation.  We played the game (and sort of won, 
they got tired of changing the drivers) against NVIDIA already.

For 6.0 I'm already planning to revamp a bunch of machine properties, 
for example making -acpitable file=xxx a synonym for "-machine 
acpi.tables.N.file=xxx".  Perhaps we could plan for that and make the 
option "-machine acpi.oem_id".

Paolo

