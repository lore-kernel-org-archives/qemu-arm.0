Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2122108lfc;
        Mon, 22 Feb 2021 14:48:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+EX+Jh+ARf2b09xgihMhkj8Qx74d4z9tnVewmrthOmKoX0EayQ47K/UJJIynA4lMj0SHN
X-Received: by 2002:a05:6e02:1c2c:: with SMTP id m12mr17703248ilh.173.1614034085907;
        Mon, 22 Feb 2021 14:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614034085; cv=none;
        d=google.com; s=arc-20160816;
        b=lxXgey5Px6DCjhjQVxA84VvnT4eMAnUZJHKPtiHPFgmzuUl9L9qxSG2hC/P8hjAV7u
         bIsfgd4Nc44EAsEU4wAGPi1rwalgM1cwSEYi67yzBXuwx/1b1S2Al1R4SQUfx/1RIRBS
         9EwrXHhoyhIzU0T8MO29B8ZyhojEiCvC6lCz4iFZRcmjOXHrzRzCYS3BRrH9BEbVXenX
         UJgAt5evcOEL9V32GGSZMy7NOAA0jLskcobwsw5RZr+Hat1ua3jFugaOQrwRrUaUGfGN
         K23dn3PQCt7AgbOc87fCeTob2L7mYF8a/l1pKef9Brjt+qOv1m1T5zwgFUAKYr4bmPQU
         AAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=U5n7ELO++M+VzahdFR6JSW1dMohOB0Vs4VTA+kbowmg=;
        b=YY1dCyVlWeOiYBvsg1psH97DziQGs3m22ZXe69Ji7TYwx5LvkTI3P3tlJe3w1SHymo
         jO/SV6Plg8Z+uC9MRe8cOUmlHlnWGmwA9R6njwdghfrMPMWBB8CjDh4yLUso299x5Wom
         F+/AMRsLISm4KscJo+WOI3BwfLnQfwrCy1Z1Vt1ciMjsoZS96A6eV+KJIcpG3Y4QNneZ
         0xIqOa5hhDhI8BYNK4v4nZGijzIbzO93fUMlZ43lpIdLAJcVqPSMgLTpewELq7hwD2jX
         eIb8HoOxSfujhubD3AOOBgcUUj8HdUo5UkAHXDEW1T7DKOrx40yLGio3QvDNMNf/f7Nv
         bs3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EXjf5zzx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si9321597jas.9.2021.02.22.14.48.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 14:48:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EXjf5zzx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lEJzp-00015k-73
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 17:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEJzO-00013E-Jy
 for qemu-arm@nongnu.org; Mon, 22 Feb 2021 17:47:38 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEJzL-0000gl-QY
 for qemu-arm@nongnu.org; Mon, 22 Feb 2021 17:47:38 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 75so11152500pgf.13
 for <qemu-arm@nongnu.org>; Mon, 22 Feb 2021 14:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U5n7ELO++M+VzahdFR6JSW1dMohOB0Vs4VTA+kbowmg=;
 b=EXjf5zzxFi+K09OhaznlcSr5Enn2Hc3oIWBbI/eJ82dDm2OJArEsarxqjyfZBdHOGm
 Mbb9evptlsnCsL/aybkAvK/0Aepoxyq3MOMb1CggxYst8ugfgOHrUG/ZZhPKLm4eFg/6
 UBs9u/48/uh13djYEq1Gh8hR6jBa4aY16GFvkgM/Qf/aGR4E5JB6U15SxODHrouTVMpe
 evZMf55Ima2GmggzWgRHe/Cwc6kjmt9J5diU9Qu8uB5wRHNA4DYdTsN3ntnYLnjfD6mD
 5/YBf8epapMuGFfh/5XZ3zeaQMAONxjV0bZ3GBlPH5QpCsPZsubTJVjFHs5YP5cAk62B
 Wlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U5n7ELO++M+VzahdFR6JSW1dMohOB0Vs4VTA+kbowmg=;
 b=L/MW8xAyC7fmkEEPNWtbMrzwrNRQp2sVVoD2mNJauaxsuBr6tt/JxllQImFK03yI44
 1a7edIFQHrE/TKxcHI7ETcLdGCXCfM/L/ToCajbjd/FbUOLgXp8WZ2nUuNcmA47TkIMJ
 4jaGA1HsrV3MDbZihM4j3nAs/7FJdjQ279lUNfUF8us70oz8EZNgY9OwnWcz4fw7se1F
 Kucty+AeD2Wi9XochWANeYAhbqn+7Zd2w0VD/MMJTcJ3pevpnlut8O6uQYDMwpPSGKco
 4Qd4fcKjjJS4HGdzNnii5m/wuF05/8ivJC8f+5Wtd1waREjbfC8I/LvXZ9ZHsgOvlkPK
 wg4A==
X-Gm-Message-State: AOAM530GkSaypns4KfxmsXpl4x9EuDX4Rn/31ahWdqTNybYk4EMcPWXO
 RZG8A1jpRjjEKiMv2M4eQkX8oQ==
X-Received: by 2002:a65:6096:: with SMTP id t22mr21455082pgu.66.1614034054100; 
 Mon, 22 Feb 2021 14:47:34 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r13sm1741496pfh.159.2021.02.22.14.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 14:47:33 -0800 (PST)
Subject: Re: [RFC PATCH 4/5] Add migration support for KVM guest with MTE
To: Haibo Xu <haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
 <25a922038d256e47f3eb99683c5e3bd9c34753ac.1612747873.git.haibo.xu@linaro.org>
 <ae0326e2-8766-803a-ef89-1155d45fdd2a@linaro.org>
 <CAJc+Z1EERnkp1QhZu0Xkrxuw3u8bFM02x0=QVfXYxCRSbXiZeA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eaa33646-f25b-a5df-a5f7-0c0ed9fd847b@linaro.org>
Date: Mon, 22 Feb 2021 14:47:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJc+Z1EERnkp1QhZu0Xkrxuw3u8bFM02x0=QVfXYxCRSbXiZeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QmIBvzy/EFbv

On 2/22/21 1:46 AM, Haibo Xu wrote:
> As I mentioned in the cover later, the reason to let the tag go with the
> memory data together is to make it easier to sync with each other. I think
> if we migratie them separately, it would be hard to keep the tags to sync
> with the data.
Well, maybe, maybe not.  See below.


> Saying if we migration all the data first, then the tags. If the data got
> dirty during the migration of the tag memory, we may need to send the data
> again, or freeze the source VM after data migration? What's more, the
> KVM_GET_DIRTY_LOG API may not be able to differentiate between a tag and
> data changes.
I would certainly expect KVM_GET_DIRTY_LOG to only care about the normal
memory.  That is, pages as viewed by the guest.

I would expect the separate tag_memory block to be private to the host.  If a
normal page is dirty, then we would read the tags into the tag_memory and
manually mark that dirty.  Migration would continue as normal, and eventually
both normal and tag memory would all be clean and migrated.

But I'll admit that it does require that we retain a buffer 1/16 the size of
main memory, which is otherwise unused, and thus this is less than ideal.  So
if we do it your way, we should arrange for tcg to migrate the tag data in the
same way.

I'll still wait for migration experts, of which I am not one.


r~
