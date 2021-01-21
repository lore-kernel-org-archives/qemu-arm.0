Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp190886lfq;
        Wed, 20 Jan 2021 23:29:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnbPpHSsTCE9Xs5yn4bnXyg1FiMGLQvtwa9cHudi0JklVv1gTuvfh+7FgpyTOWfpXDP1x6
X-Received: by 2002:a25:296:: with SMTP id 144mr18828430ybc.212.1611214197713;
        Wed, 20 Jan 2021 23:29:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611214197; cv=none;
        d=google.com; s=arc-20160816;
        b=WgYopXAGe6t5NtVnmVyAjb3Asx5ZfRr1gEc//aG6ECFIw20ufKVbC6jVPWkzSpX8Y5
         Q4MBbj+/0mqMgXzFIvjfwnu4TyH/+9QP4+zZ3nuPYmOGlvjjjBG5pMmmJeOb/f2o6DQU
         jMqf4Vc/HUa6efe3QEBtZycT/G/BbgCtwYvQU9fn50+719BtYqrx9jxuZPP3B3SNrHAH
         9q+Nhfe5LEZIsmu0prUQckpAZ339j5d5HCL+PEu53VD//rYf46hb9av2paLQJkcqJITI
         xX2O/ZWhNjF/cmL3UiRxWoeVEtl3uWHy9An7E8xipCzGe4mX9QKrslcRfvD1ud5nuHwm
         gNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kuRBfY316bu+rPk/o/xoEShIeY5OdTFwwTSZR0dof64=;
        b=RtMHI2DLK9xt8C1ntnF0yz92uNS98SsRgkB/ZKrJu0QWR9oTqcdv9KCHgIq3WAt34a
         yHCQimy2EMaf1TjOCn/SS1dYDabo2PsO1SDbf2M5zdwDP5/GIU8VSCVk3V20HMiLMyVm
         usf7SqebufihRdXHaZJLBGppLdNBS18Yc8ITfSWqkdmVvYFB7OujU7/zz7tWe0qlrsbc
         yvSaeZ/Q4zHFVStDGxqfWg/TV1djd7WKAlByUQDQNgs4gWgJmK2tIr7lTT5/S+YQueMq
         NlRThQBPUjyT/J2XDZwpK3JSYNO9a58+IbH8HySMndxBbR0xvVnxFflFapeS7d2KWr1Q
         E89Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gt6T1kSt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o202si4270053ybg.154.2021.01.20.23.29.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 23:29:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Gt6T1kSt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2UPl-000172-3s
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 02:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2UN6-0007x8-5W
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 02:27:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2UN4-0005yh-Hn
 for qemu-arm@nongnu.org; Thu, 21 Jan 2021 02:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611214029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuRBfY316bu+rPk/o/xoEShIeY5OdTFwwTSZR0dof64=;
 b=Gt6T1kStMHSToBI8cBV6hDr2s6FKQE0TqPqeAzXHTF3q5GAvg3yKbs67INvMQrUX852HPd
 dH1p5KVd2a5YPIj0lDUxWfgNEeIj9VH5cJxt3nbjqcSEfV0fiXY9vJVpe0Nayr2WWpx4QW
 J+inVCPNXzN/riWZ/8i4ZvSWf2/yeMY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-orsvxbYXMPWIloeR-9CFuw-1; Thu, 21 Jan 2021 02:27:08 -0500
X-MC-Unique: orsvxbYXMPWIloeR-9CFuw-1
Received: by mail-ej1-f72.google.com with SMTP id q11so423110ejd.0
 for <qemu-arm@nongnu.org>; Wed, 20 Jan 2021 23:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kuRBfY316bu+rPk/o/xoEShIeY5OdTFwwTSZR0dof64=;
 b=cecu7ZQf2V/QWpcUBERH62ZLtwB2cm5AFWHU5bKMJTmzoVHe9C8c41cS1+kl1lP318
 AbdG1CJeNTQGSSrB+dxrvdOSOBLaYPUgGphmYlRr+D83Sw5paLb6w4DBNuZ0pUxVifQ1
 iBI/fWVMglBer1CWGziTWZ66hiImlYsX7N4UET8FnR65QXNgTItE85XfUdA9Pd0bIY1V
 i89w1UqNTg+pSBFNTsB4OLYBpv/sfkoBZs+RXi5+uhhw/m+3GXBzR75ekqlWSWhPfkEU
 c0b8jf0+gTjpIcyU94UDQ98dDzDJY9JC/IwDMZLqsb7+mKsqYImil9vrnjvFUMcVzh/I
 L/Hg==
X-Gm-Message-State: AOAM531IthtHFxy0Qs7brPQASaomM2sngT4ugNeUZJuCzPB7fELKQYyI
 e8LUuZDVipGClojn54X1z1M3pbWGNiYVBhmXpSZuHPFA7HCdnUkYfRKjsbptzEvVFun4e2j1fgn
 wzgVGe8aeIKcx
X-Received: by 2002:a05:6402:1e5:: with SMTP id
 i5mr10462600edy.86.1611214027015; 
 Wed, 20 Jan 2021 23:27:07 -0800 (PST)
X-Received: by 2002:a05:6402:1e5:: with SMTP id
 i5mr10462586edy.86.1611214026874; 
 Wed, 20 Jan 2021 23:27:06 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u9sm1845230ejc.57.2021.01.20.23.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 23:27:06 -0800 (PST)
Subject: Re: [PATCH v6 02/11] hvf: x86: Remove unused definitions
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-3-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ce1bd2db-36a6-0f34-ec77-063a97320e4b@redhat.com>
Date: Thu, 21 Jan 2021 08:27:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120224444.71840-3-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mf2igGLeiIZK

On 1/20/21 11:44 PM, Alexander Graf wrote:
> The hvf i386 has a few struct and cpp definitions that are never
> used. Remove them.
> 
> Suggested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  target/i386/hvf/hvf-i386.h | 16 ----------------
>  1 file changed, 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

