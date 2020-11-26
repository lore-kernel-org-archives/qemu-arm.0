Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1802081lfb;
        Thu, 26 Nov 2020 14:19:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUMt0BlN3ZmyKf82IGQfgs+k4Ugafsc0FjsoBq5bm/+1RFiJQXr60p4+oqFCVNgISOA//w
X-Received: by 2002:a25:2f51:: with SMTP id v78mr7364116ybv.235.1606429166383;
        Thu, 26 Nov 2020 14:19:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606429166; cv=none;
        d=google.com; s=arc-20160816;
        b=O43bT8bGc/W9eP4sim7YMJChSY0Fy7lyP13Xa37xfDx/3ooCit3310S6g4EJIj3J4H
         9ojpstccJT8cjUOPCc/qgh4q9GLfmhmlR5UsKUyf3AY3OlZMWjRTd9YT2BOT0KOgxsZ/
         jrZJ0GX4oh4q3WEWj4KhfcnVVUQqKqUW92wczpkdOC1/9YGdiUcn/6ZuuTbVXfxM89iQ
         D7mrAj9iwXWu3Wd4PknambtYEFbEHpfS4lZJf+ma2Dv2B+6ZvcuGfOX2CiAon1bVDHID
         286xb5yGWuzAeNQUC5303dmOEo8kZIurn2BkS8tU5XMfZC6DfJYkbnXfYGgSu1NHlXhx
         nK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=/ruqhrLJjszz8lStQzDi0gK/k9q7ZkzpEdB2qxSbYSQ=;
        b=P/3xz8Cs5QdZ0gpPGiuPCMcjfnyJcjtWP51/3DzefqyK73fqCmkiID0CzKjkSQBcwi
         xIgHaK8EP/ns3A9LN8MVAeltD8/YrOMZDIrA/BSNBLfRD1NP6yvh8T4cY0aa8ojohon9
         h7xdtG6+D5UGiajieABiowaAmNSTZjx3er0GM7p2h3zo032llLVx8wOjG959K1Ut779R
         rn1L/74R06nthsKIe5UpubqoaE2KWfacUZJYhJ14g7WQflkg+1s9ShTX1FfzyQYdz+sr
         bBPYN1GJ84xSwlyL88k87fgiuztQFPqt/bOCICgsZgFqoZWDE+IJ8amcCii2IakbpIzP
         hUkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si8422332ybj.288.2020.11.26.14.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 14:19:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPbp-000287-PY
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 17:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiPa3-0001Jv-Jz; Thu, 26 Nov 2020 17:17:35 -0500
Received: from mail.csgraf.de ([188.138.100.120]:33806
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiPa0-0006Vr-H8; Thu, 26 Nov 2020 17:17:35 -0500
Received: from Alexanders-Air.alex.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id 180A8390015A;
 Thu, 26 Nov 2020 23:17:29 +0100 (CET)
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-9-agraf@csgraf.de>
 <CAFEAcA95L=25QM4BTPbDV6HXLXD5zh+50WTVtrK=fKPwynV=vg@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <54b287f7-5240-5e98-d5d8-581cccb14b82@csgraf.de>
Date: Thu, 26 Nov 2020 23:17:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA95L=25QM4BTPbDV6HXLXD5zh+50WTVtrK=fKPwynV=vg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DWwkqs2Vsug0


On 26.11.20 22:54, Peter Maydell wrote:
> On Thu, 26 Nov 2020 at 21:36, Alexander Graf <agraf@csgraf.de> wrote:
>> The Apple M1 only supports up to 36 bits of physical address space. That
>> means we can not fit the 64bit MMIO BAR region into our address space.
>>
>> To fix this, let's not expose a 64bit MMIO BAR region when running on
>> Apple Silicon.
>>
>> I have not been able to find a way to enumerate that easily, so let's
>> just assume we always have that little PA space on hypervisor.framework
>> systems.
> If you have direct access to the host ID_AA64MMFR0_EL1 you can look
> at the PARange field; otherwise start a stunt VM and look at its
> ID_AA64MMFR0_EL1.PARange (this is what we do for KVM to query various
> things about the VM's capabilities/ID regs).


When I tried, I couldn't fetch IID_AA64MMFR0_EL1 as sysreg via hvf.

Are you suggesting that on boot, we start a tiny mini-VM to enumerate 
the PARange and set highmem based on it? That sounds like absolute 
overkill to me ...


Alex


