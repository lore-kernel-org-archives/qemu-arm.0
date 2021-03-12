Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1043505lfg;
        Fri, 12 Mar 2021 01:08:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbxsqWclF1r27JXi+yzuUQEPoTz0Vtn7nNv+8qt3U19RAOTiqfXPDva/5fT08mBCNZPZiQ
X-Received: by 2002:a05:6902:4b2:: with SMTP id r18mr17848813ybs.226.1615540101978;
        Fri, 12 Mar 2021 01:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615540101; cv=none;
        d=google.com; s=arc-20160816;
        b=pPSj7uAGTrzEmq/IMTg1TyVnnLbCWLCfTnLt0knNv+2Ce9e2btU5WAftd7OsA7DBKC
         B5Q0LA/iUxaAGSsDIEKKykrL2zUGvYx8O+yZeplS4+82hissa98Cx9LmKDpi+AHVacdS
         0UFBCZ052YH9A8JQHv8oBcumj+dL5oRkSvNo0xZalFFxiRcxatbtjtd4zHzOtOnHJ0sq
         jYDCqepcP3qvGliNXR1WpynRD5DGgxNXG8tOumhQNJe2slsftMOscjzY99h8bGP/aB+i
         P1PiNYHh8l1RGzBZLGpH2RGFOMuaWzOkCuslm6SPvJckSvkl+AiL+GQ6L9GRMtpd3IyR
         hNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fe92s7IKjpl47+82irgS4fyv88IJ50ODiafDLNyUkqk=;
        b=RYe5ELMf0qBXWG969ez2A3BabAob/FD7d5k+AJahR1tNFJpWQmOcQV0fnOyK00ybRO
         BEdYj01iLURNqLmjz/QSEVmXFV72SwjXEdwDxYeRfGUQGIeJC1jucFieOt0WYrwGkSyX
         t1hdBF4YcJjhZ4LGnnWu4uyJEX/GH74FavCL/89ccXxz9fy5wxf4KU2gjrd+hOCxNk9Y
         E+sv3PoWAzLNeJPRkgTxo3Rs3Ga/8Qv+BfpC3XKmBBHA+CodwYUykQ5vgeRrRT/yG4Fv
         VBIT4SciXQRHnSoi/ytLaSRBp7GBKCpc3rk6r6lp8KV+Zg2xfWEC6oQLfC2T/W1sSXs1
         g8ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EFViMpTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si5697387ybk.441.2021.03.12.01.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Mar 2021 01:08:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EFViMpTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKdmP-0007ox-92
	for alex.bennee@linaro.org; Fri, 12 Mar 2021 04:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdjh-00043p-K1
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:05:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdjb-0002FW-Rs
 for qemu-arm@nongnu.org; Fri, 12 Mar 2021 04:05:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fe92s7IKjpl47+82irgS4fyv88IJ50ODiafDLNyUkqk=;
 b=EFViMpTm0tLx8Ewq1gY/NH1vSJ914CInnWKdiJGum5QZLh9Df8JSDBIDY9Z1Ji4n5RCNlj
 7GP9SFF2WkNpfGipsXbFW8oFZLOd0fxjUYBB6Ik0o8Axx+GEi4cHFnTAi2gFagy8nf60tb
 phch/Y+xyn7s0GNosSBpUGQHKCCzHXI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-CrTbnAK4MMmdzYN5yLm7NQ-1; Fri, 12 Mar 2021 04:05:22 -0500
X-MC-Unique: CrTbnAK4MMmdzYN5yLm7NQ-1
Received: by mail-wr1-f71.google.com with SMTP id v13so10869700wrs.21
 for <qemu-arm@nongnu.org>; Fri, 12 Mar 2021 01:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fe92s7IKjpl47+82irgS4fyv88IJ50ODiafDLNyUkqk=;
 b=ag0a4SHcuRpJMt6JYfQ25mssjQ63OKRO+PsmIrE0Bjp8UGA/EIZ1Q0t8OqP82Jypfa
 4/BYZofxKJVgrQlPUzT5HXeflwWGziawCUTipuySit9+fES8anC/3HYjtNh51jzsxm8o
 0ekkuEprxTsQ+BM+uU2b0+YpYpGLNrW613piMEuTJ7lQa7oyEsVofSm6NPepE6keR8vr
 hqbVF60b0Gt+LErKQluXCFkf/yw8AkdUDuMVUv8NhvRkh9GjP0Q1SDXoiHQpM5LuaBxL
 BLo7T4atSpCQyMzRXLR5hLmf7cJExJEsQyP2Nx2LVj3pDsGLNSJK6T1vQyeqfil+BcOo
 T/jQ==
X-Gm-Message-State: AOAM532sljle7mnMdr8b45/xVYkBLFT6ziymVTIAO6zgfETHOz3uXWTK
 a2LPUcfgZlTmVb6di/D23JMszm6g7BFDSyyyurGdFfBkgeBn7lJRrDlkDP8eGdPS75YHV7Iia3t
 WZXng8Kh0hLlC
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr13042047wrk.406.1615539921110; 
 Fri, 12 Mar 2021 01:05:21 -0800 (PST)
X-Received: by 2002:adf:d4d0:: with SMTP id w16mr13042039wrk.406.1615539920981; 
 Fri, 12 Mar 2021 01:05:20 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j203sm1481696wmj.40.2021.03.12.01.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:05:20 -0800 (PST)
Subject: Re: [PATCH 4/6] qtest/arm-cpu-features: Check KVM availability at
 runtime
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4c8f9841-1fda-db4f-57fd-bf764f3a0962@redhat.com>
Date: Fri, 12 Mar 2021 10:05:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311231202.1536040-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kdIXSzyqNgee

On 12/03/21 00:12, Philippe Mathieu-Daudé wrote:
> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "

Wouldn't qtest_init simply fail here if KVM is not available?

Paolo

