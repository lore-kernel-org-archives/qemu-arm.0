Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp371630lfg;
        Tue, 23 Feb 2021 07:08:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzN2shZhMKUSEYxPizvfsEGYJLGm3HByWFeWEVbVl4+0PnTAG/i4vHCNVOIDJ+XmjYBUPpQ
X-Received: by 2002:a5e:8507:: with SMTP id i7mr16013103ioj.9.1614092898682;
        Tue, 23 Feb 2021 07:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614092898; cv=none;
        d=google.com; s=arc-20160816;
        b=crsDjAqEk4ztlfho4+aUW5NYGUfhh2Q7Sj58/wl5qyJy81qFA5gy0ftndiH3lDnCO5
         Fks+G69Ue3GgYjQ1Wl1xMb2VSlamM4X1+e1dPa2M6p13axEWjTvTmNvzxR2M3mXs+DOE
         CllR5i0TQ3Vm6V58f6ufuonFyl/jZ7niSSg3PUv2OPlfWJsMnXjh9IhFL7vsKk0zpLXD
         +f5MWu+3vSTT/IjVyKssMcPAApqqYEUOISxMrtTtRyAlbz4XGxA7Ms0uN5mZrHTok3eI
         jbxCtjR9vAHHKslV2PN0UIX1AuWECZxUqyEP72l1nTVXvRP2tNEifwn7pWshUu7uX1Lt
         uz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tUnt08oW2dZ1VVfk6tmBCSpZHR5vCmYTJ2TPBcdTils=;
        b=zYvgIiNn25EWo5cVwNlIkRQsyn5l0A+/xQG3Xr664VJ1n0OeP9Cd79yuP3HXHO8+r1
         gFR7gYzkzJpkigbpAVB8RQA3T/4joDY3OvPfeup1zwAwa/0u5CEaHWzulBBjK1ba4PUs
         33sc05j0MEmp0xARspso7UzqD02CXwod5gpApgMcePlHgjMFO2GNueT8W6t3jbZcSEE/
         99/lLEoN4vE39b0faClRjH9DceDPbStdcB/CQITcph/qDT3S3aA5N0BXZl3+bFRqFY6c
         LRBYs9EoUz+niilFDeaWDv2o5O0Y4hHVbxU+/ZQ+F1Vb739xyQFwEIoQQLIuwZvVVMPq
         oiiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WzTt/5rr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si20183836ild.98.2021.02.23.07.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Feb 2021 07:08:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WzTt/5rr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEZIQ-00026i-1i
	for alex.bennee@linaro.org; Tue, 23 Feb 2021 10:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEZHz-00024Z-7W
 for qemu-arm@nongnu.org; Tue, 23 Feb 2021 10:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEZHx-0002ig-Ar
 for qemu-arm@nongnu.org; Tue, 23 Feb 2021 10:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614092868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUnt08oW2dZ1VVfk6tmBCSpZHR5vCmYTJ2TPBcdTils=;
 b=WzTt/5rrKbanqSsDMfy73wXUoLRVu0nqWv5f3g4utWcuW6f2hMgw1DDHR5JeIkm07eziLL
 GCoqgOnGZAgPNqrxntYz9oh5TMgK2s12TgISZ6UOV3Tdr3bCnY4vAeoKJUghLXL9YZTBz/
 pEy867/CUdko3qQssRdz5LjArV32j+U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-SswROmt5Or-o4NQiuNkydg-1; Tue, 23 Feb 2021 10:07:39 -0500
X-MC-Unique: SswROmt5Or-o4NQiuNkydg-1
Received: by mail-wm1-f71.google.com with SMTP id p8so1306000wmq.7
 for <qemu-arm@nongnu.org>; Tue, 23 Feb 2021 07:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tUnt08oW2dZ1VVfk6tmBCSpZHR5vCmYTJ2TPBcdTils=;
 b=qatb1Jt6cGbHiJBhhMUNKOcLZZYngX9mUYWJEqpzO6BPxBcpUEK9x92gQj0wDgxTsj
 ufqG6P+Va1gvXZNUgpet3SfErBC8tyaJ5CwH73+YT3clKqZ4YtT4IxBWtgcdZF4H2mGx
 ER7RsExG97KCIaXDhELGkwWl/jQCn5ozZhVGQWimJWzT/PhSCi2+O8ayX2hYG57Y2aL2
 Ejh/+L3VhjjisiW+7UBSe7RVVpQUOfGpxGC5kGlrS1HYkf5HHkIUE3H7DellyT4ZSB5d
 oldHaJFbEVlwTqTNPhKrXLGou2JS951AJwAzDKv0MQ3Wj9by7O/rkxJr52AJvrDQWJfv
 HqMA==
X-Gm-Message-State: AOAM532QbWki/j2l6uRgHT2bQCnA9cxOjJAeE8kGck1/zcOSXZPmCpCo
 CoY+Gudxx/euSkrc1i0swwhT7MMTKPRskeBSGG3gorvLjflEfXwOsZhCdBS9hf/4f0oCZl2/SWI
 uU2Jbdir/oiNz
X-Received: by 2002:a05:600c:203:: with SMTP id
 3mr26080557wmi.187.1614092858650; 
 Tue, 23 Feb 2021 07:07:38 -0800 (PST)
X-Received: by 2002:a05:600c:203:: with SMTP id
 3mr26080521wmi.187.1614092858485; 
 Tue, 23 Feb 2021 07:07:38 -0800 (PST)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id z5sm33629613wrn.8.2021.02.23.07.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 07:07:37 -0800 (PST)
Subject: Re: [PATCH v6 01/11] hvf: Add hypervisor entitlement to output
 binaries
To: Akihiko Odaki <akihiko.odaki@gmail.com>, Alexander Graf
 <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-2-agraf@csgraf.de>
 <a41a39e5-951f-c178-d50e-6041eec63cbe@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <419dbb9c-badd-25d8-1755-00978a592671@redhat.com>
Date: Tue, 23 Feb 2021 16:07:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a41a39e5-951f-c178-d50e-6041eec63cbe@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5klE09TmC/wX

On 23/02/21 12:56, Akihiko Odaki wrote:
> 
> I noticed that the installation process corrupts the code signature 
> because meson modifies the file to fix dynamic shared library install 
> names. Also, stripping apparently does not work because the signed file 
> is not considered as "executable" by meson. Here is some change I wrote 
> for my own use, just for reference:
> https://github.com/akihikodaki/qemu/commit/6a9b5d7e4ea03b1e757be1eedf256871bb6a5bdd 
> 

That seems like a feasible way to do it.  We could also have a single 
script with --build and --install as the first argument.

Since entitlement support is already part of the upstream tree, would 
you like to submit the patch and Cc me so that I can include it?

Thanks,

Paolo

