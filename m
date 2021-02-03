Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp31947lfo;
        Wed, 3 Feb 2021 00:21:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpUeo1F81yHM/bwgcs9EI5MHzPc5LSG+GgcP2sg23Jym9rBl6B9zqtw8D7u5ZTMxuBR9Ea
X-Received: by 2002:a25:f8a:: with SMTP id 132mr2798460ybp.228.1612340497104;
        Wed, 03 Feb 2021 00:21:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612340497; cv=none;
        d=google.com; s=arc-20160816;
        b=HY2/BEfAdVn7xEN34s4AbYuHxXg8n+GWGiLrpG+3yyJp4ZH1RAcIcy8HHRo4lO203Q
         6/afnCIq3mi+4PXTio+WI7mHTC1BoxA8VWYkxYpsFXr1ROz/UxmHnvtP5+fQWc+k84ye
         YkCIfZZ3aEAtgayZ6rUAFaQ5+Fi5LqFhqoA3AcR1+JQ+bevRwVsq8MES8JWgkV3Hl9kA
         boNy8t0ofdD7m8ZvLtnpijN22Nf2f1698jnPrG47RBqfxWYsghosZ9ZgLpeHTkudK1x1
         l0WsTtbR9PH37Oew1yxBCDYm2qfIG4ZXe7Ay/lC4rreeKR+MHkIAa1t2oZ9OwD3yvQBo
         ezcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0HaMfCeA3mW7tOo+p9WhxttBgAhTD/hBKuTFreACb0Y=;
        b=imMaWa8GsS/obW3MaSHwk5rsFhwh1975EwodLIKbrOrH4vWU71CbcZXhgGeQMEjqV/
         82n4n0QjtKkIjpgZ8iEvUm7wpFbR52Ax4SvQyyEkEcow+YvX1vzTFcqw3dUGu8bILi9T
         3lUXnGSzlbBMtVwPOQZSF89mf8v6ghZMEXL0ZVMkcco2vOAvLaLsdtOR1uVVZ8Li+ZQt
         Z4tgPVPqP3WGT6le/gj6Jgb7YJDCEtsir0PqTq+xh24NnhdOCCr/tAUr3pXCGRN5+Fez
         IIBMUuLhsA517T/UQm2HxYZoxWzQT4LbNWLWJA1zldJl+wzIumXld3zWs50wU/l9KSKY
         uGoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PBtGdY70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si1746005ybm.186.2021.02.03.00.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 00:21:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PBtGdY70;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7DPs-0003Mp-Gv
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 03:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7DPj-0003MN-LE
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 03:21:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7DPh-0000Wm-9F
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 03:21:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612340484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HaMfCeA3mW7tOo+p9WhxttBgAhTD/hBKuTFreACb0Y=;
 b=PBtGdY70oJ3oDSQT8a44153CXZ9H3oqR1c0fmsalX1A6VbV+/2IeLLN1PsENprsslF6y0B
 TLE/sDr3gvjufMOcDcyiIvutfxELr3+XDXNE/3cM8773ht5ofPQIUU0/lrJr/ZyZgZtq7f
 OZnTINXQsL/kfn6++yP87kPgSY9rZoE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-YLlaU4zyMKm9sZDPqtZSGQ-1; Wed, 03 Feb 2021 03:21:21 -0500
X-MC-Unique: YLlaU4zyMKm9sZDPqtZSGQ-1
Received: by mail-wr1-f71.google.com with SMTP id p16so13672566wrx.10
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 00:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0HaMfCeA3mW7tOo+p9WhxttBgAhTD/hBKuTFreACb0Y=;
 b=lgV3+kLXGlDoSivxyh05VsRTMlS+SWBYUXDSTtmLENFiWbl5PV0WsOK/PhYpOoVI05
 WqZHFdibwvk3gAOeVVprcL66ai2VYEJGDxdxC52itEKsvFc3CMCt7DOP3ZcaxiFL3qib
 l7rscJ+NziDX0PhpYuvA7nX2+TW82hg4BZ8EJF43uuEL12YWZtuguBuQY6EIIo2n4jpB
 Q1IzcQFlOnKJlNAerAY9Fkpa0NveF0V7odHMeKIn5fejNUY8MiZXFwZpuPctb9KV5ZIj
 7XnJsBdRbBJR8WaGX76O/wExce2elbY2tqU5+Cp1wBAuuBDiY0U9Iui04EpZ/XmvPw7J
 sCcA==
X-Gm-Message-State: AOAM533Vv9Wws/CT68x5hWCh7tI3TPWEfrMgJ7uAVpJ9KTL29RMSV0S+
 t/dCKEgo3txa6IeOQTnhPRJlnrUxXnfde0KXKuxG7f8u4c5Zxi89k7iHuazjelqB+LoScmwBqC+
 ZiHpddpbz+0ir
X-Received: by 2002:a05:600c:35ce:: with SMTP id
 r14mr1697978wmq.136.1612340480154; 
 Wed, 03 Feb 2021 00:21:20 -0800 (PST)
X-Received: by 2002:a05:600c:35ce:: with SMTP id
 r14mr1697960wmq.136.1612340479881; 
 Wed, 03 Feb 2021 00:21:19 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id i8sm2435645wry.90.2021.02.03.00.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 00:21:19 -0800 (PST)
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: Aaron Lindsay <aaron@os.amperecomputing.com>
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <153e5c54-f8bf-d088-502d-502309f5d2a6@redhat.com>
Date: Wed, 3 Feb 2021 09:21:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YBogDGJRU5pcDKmi@strawberry.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: krccVMTMkpz2

Cc'ing migration team and qemu-arm@ list.

On 2/3/21 5:01 AM, Aaron Lindsay wrote:
> Hello,
> 
> I'm attempting to restore an AArch64 snapshot taken on QEMU 4.1.0 on
> QEMU 5.2.0, using system mode. My previous impression, possibly from
> https://wiki.qemu.org/Features/Migration/Troubleshooting#Basics was that
> this ought to work:
> 
>> Note that QEMU supports migrating forward between QEMU versions
> 
> Note that I'm using qemu-system-aarch64 with -loadvm.
> 
> However, I've run into several issues I thought I should report. The
> first of them was that this commit changed the address of CBAR, which
> resulted in a mismatch of the register IDs in `cpu_post_load` in
> target/arm/machine.c:
> https://patchwork.kernel.org/project/qemu-devel/patch/20190927144249.29999-2-peter.maydell@linaro.org/
> 
> The second was that several system registers have changed which bits are
> allowed to be written in different circumstances, seemingly as a result
> of a combination of bugfixes and implementation of additional behavior.
> These hit errors detected in `write_list_to_cpustate` in
> target/arm/helper.c.
> 
> The third is that meanings of the bits in env->features (as defined by
> `enum arm_features` in target/arm/cpu.h) has shifted. For example,
> ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
> ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
> added since 4.1.0. Heck, even I have added a field there in the past.
> Unfortunately, these additions/removals mean that when env->features is
> saved on one version and restored on another the bits can mean different
> things. Notably, the removal of the *VFP features means that a snapshot
> of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
> ARM_FEATURE_M on 5.2.0!
> 
> My guess, given the numerous issues and the additional complexity
> required to properly implement backwards-compatible snapshotting, is
> that this is not a primary goal. However, if it is a goal, what steps
> can/should we take to support it more thoroughly?
> 
> Thanks!
> 
> -Aaron
> 
> p.s. Now for an admission: the snapshots I'm testing with were
> originally taken with `-cpu max`. This was unintentional, and I
> understand if the response is that I can't expect `-cpu max` checkpoints
> to work across QEMU versions... but I also don't think that all of these
> issues can be blamed on that (notably CBAR and env->features).
> 

