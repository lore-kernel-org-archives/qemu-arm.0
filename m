Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3982134lfk;
        Sun, 6 Feb 2022 10:57:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxa0g1Nkutwkv+w+nOoRORCGJytfqfjgLxZvwXpmxAGJEeJ/oYdw3BGv+0dvH58ehkHzZ//
X-Received: by 2002:a05:6902:725:: with SMTP id l5mr7762869ybt.544.1644173867582;
        Sun, 06 Feb 2022 10:57:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644173867; cv=none;
        d=google.com; s=arc-20160816;
        b=Su/AUwxxhcR+aMJBJu9PV4AWAp/FIJcwHJVo1uSmdme5o21gPOrEBHE1crjxx3H51Z
         8DTPQtx9PoYa1kaKYLJx0PdEIuQD8TfgxIszVcRx77+67fEvaKJfandU3T1CVPTNHG4G
         /QKEw5cKQYmKaykgIE/s/x95tjoWLbJOqBeVaezYveQalA/ywJoweVeXjRRYHAA5jRCy
         96v79boczXusKU/RL9HV8/BBNOikvlAn4kVs1c9VTtw2Qxd69FFHl1EFZtor8EwYhh/9
         KySzaqKoKuJwiddHg9ZjQEAbGECm4V/GbyTihzo4HDeK6xOOXRmAwt0CISKEAU3D2Lc4
         vCXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8bjp5lU3aM8d2oXyWGloL2jGyafpuV2z1p3Sae+APu4=;
        b=qpIe02CnkOXOXB+vHNT0ZfbWqn9yZikQMqe2owYXS+HheLnBUEC3DgXOWD658swdCB
         wz4/LoIldQhQ2HKWCxwSYT6izLfhME5F9xELFhdmg7XglMb9iiLU7yVRLpzQkBEtBcca
         Rkvr3rSk3VRHC/9oGYOTqNmorfPFLUX00tQrRa4fMHNjWrEnbFl4jUvOkstd/+hIB8GE
         NvlMvUl3xFMfcKtJ2dlaMH4lbR0l1L2oXrbxdTI1xP6mTb3j90UMI5ZWrKxVDG3wAN94
         IOVH6Kgo8Oo2eQ3KwD6NTYH6EWAD7o8aKkXA619N+HSFb6dIw2M/7lXS2Qrw7DmNSsGx
         VJpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="G/Vko+Rc";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si5066224ywn.541.2022.02.06.10.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Feb 2022 10:57:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="G/Vko+Rc";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nGmjK-0007OB-PG
	for alex.bennee@linaro.org; Sun, 06 Feb 2022 13:57:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGmY2-0002VK-EI; Sun, 06 Feb 2022 13:46:07 -0500
Received: from [2a00:1450:4864:20::430] (port=39609
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGmXz-0007YO-9G; Sun, 06 Feb 2022 13:46:05 -0500
Received: by mail-wr1-x430.google.com with SMTP id v19so6272504wrv.6;
 Sun, 06 Feb 2022 10:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8bjp5lU3aM8d2oXyWGloL2jGyafpuV2z1p3Sae+APu4=;
 b=G/Vko+Rc05o+9miNDBC8ssBuJGr7t1KB+mAGxRbW7wdtNqWwE3mUzvIiNz3eBY/79P
 YKXOvVKSrcb5qDXCLIZP4Shy/9zYPXfvSqVnUSYPKXuCG4NrB4zihZOnduJOkYYWy1Dp
 /BZysSo6Xw+Gzf/tjwVU9KesYKqjGbWx3EBRgraA8qDzPnc1ma1uP8yeTSu6FPz9D5gz
 PFXgVEX94xrnFw3nB4Qh/X1SfvjTKYb63MJSGZQqglf/Gk5+glj6sPeMauKxaCQOmIER
 kjPl0661vFFHrSarV/gFb4bziayHFXpk9U//O+4U9hIqZUlTb35d+0XMqOfR2lQfB+NS
 JHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8bjp5lU3aM8d2oXyWGloL2jGyafpuV2z1p3Sae+APu4=;
 b=A0hw0PDQFC/+EdyyMtSc9awfxrS8R4ayRFwGhEbMhgnpOllgccEvieYLbX4nU5Av4p
 6r3h3u8tPO6+7Lv4T52ongfJRlWTs6mJk2klStOObYTkB4jZpRxInpBv51aS0T5+/bYw
 wbh//AgQTCCq8PJMevErw71iHpBcUDj/86UUPyqifB38KVTB+i0jNfoWBktLMH7EwtUk
 AhmOqfhmk08j/J2+ouA8w+eazTq1OG/UoUygUlWkx0cP+kwWDv7kx4kalrDsOU0mya8v
 LLSmxfDgaCfDqYcnBSjNlDN6m4pKb7KXnZLiWG7U/IW5jcrdBoMZuvby7UNNKZKnt1eh
 17ww==
X-Gm-Message-State: AOAM532x0bXZ2OyeJWC2HEpWoPVBJOya9Yymg0LYti6o1Ol01hdb/YI3
 oVoKghp+KjO5J5vKVFCNipc=
X-Received: by 2002:a05:6000:16c7:: with SMTP id
 h7mr7126767wrf.93.1644173161428; 
 Sun, 06 Feb 2022 10:46:01 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g22sm1660408wmh.7.2022.02.06.10.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 10:46:01 -0800 (PST)
Message-ID: <e055ee7b-dc4b-4c10-5067-39fd0ae3838e@amsat.org>
Date: Sun, 6 Feb 2022 19:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 0/6] target/arm: -cpu host/max KVM and HVF fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: ea3rpnDpQOKf

On 4/2/22 17:55, Peter Maydell wrote:

> Peter Maydell (6):
>    target/arm: Move '-cpu host' code to cpu64.c
>    target/arm: Use aarch64_cpu_register() for 'host' CPU type
>    target/arm: Make KVM -cpu max exactly like -cpu host
>    target/arm: Unindent unnecessary else-clause
>    target/arm: Fix '-cpu max' for HVF
>    target/arm: Support PAuth extension for hvf

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
