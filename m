Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp782193ejc;
        Thu, 23 Feb 2023 06:40:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+kjgiVHunTutzn3thm5AD/lFKQXJ85ihtgCoaEw7AuhO4w21iPNA18P45nz/ka8YSq7/93
X-Received: by 2002:a05:6214:2a8c:b0:56e:bde8:7ab9 with SMTP id jr12-20020a0562142a8c00b0056ebde87ab9mr22310886qvb.41.1677163214883;
        Thu, 23 Feb 2023 06:40:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677163214; cv=none;
        d=google.com; s=arc-20160816;
        b=k00bwPVifncoYcIQzXUjK0K3JKVVrwateX8JnWqknLBHG55eAbPlQGa7aYMx+MymJK
         XTbYEu7I0qIa0AMExceq7CyR/vdeZRXT9b6MZr1OiJ4+6QfoiLaX8w7xtB4hvYOI3SUa
         AKCBtvKyf7KeENCLvasgETEVRZgb3AClY1CD1Ae9C9/bYD/XcG2oFyBz9Wfn544LRhM6
         Wnappa0+DcfB4No1+we2AiaKyuWfLL/TWepvLnM694tLRSWywuPkcRLbZ0uVdlcerAuI
         hsTceQdPBJkhAUdCtJ0MU1eVuajKQu3GJk0x6Ehf5vcIDTkNdLs693r3IcnlXnxsJvEC
         bPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0Hl9gXkEZJCmd5pIKcwwwVPp/k0Rhd8r6eD3LfRdlHs=;
        b=ENdFA7apkVRMOL2iq6R9ett1YZMgfIra3HWi5tdDJB/ulufsNEuuyOC9JNFoV1zx81
         8pC0n2Xh6mZTyZfe3k5FRpjt+VE6sWizCaHV3uaHtGB3klaxeZNLwxI3JfbWk5k5O9Yw
         KPjSE/CpUNSmhE2UUf5WRmtozRga68q9lxU/6ALwytVBTkElRPpP7O35HyBs6j/LuPxW
         jMrkL5zw1zB4bu49qZW/GuqptLly7HFFYl82XttuD9ehPvNqY+QIc0pQBbXwL9lSbazX
         5EDbUiL5GrTBMiXFB/0CEzOk2r9/PKcKkrt1j3o6Y96cZESQX8xHysxCkvs6x1m2xV7a
         od2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gaRGNsXf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020a0ce4d3000000b0056e9b37294esi9309939qvm.213.2023.02.23.06.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 06:40:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gaRGNsXf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVCl7-0002ud-DY; Thu, 23 Feb 2023 09:39:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVCl0-0002tw-0t
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 09:39:38 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVCky-0007dI-IE
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 09:39:37 -0500
Received: by mail-wr1-x433.google.com with SMTP id i11so4691416wrp.5
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 06:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Hl9gXkEZJCmd5pIKcwwwVPp/k0Rhd8r6eD3LfRdlHs=;
 b=gaRGNsXfAvM2K9GLp0LrEKQug7RevYKjAVnDDfPTuirBYBoEiMcjm9A8GqEN9YzS7X
 7lrqTM5GPB2CA4kfclGptg/7fJ0MrKJrhapthFO034brAzfXfEN0+1jtdduSXZ3xxO5O
 Pf6MhbenwLvoF3TboX+oe1154f0g7sYP+3tiY/9Nt61LVDc0d3s+kJeHKba3ojoX0qFV
 gDQ8ysrTCdxDArgwZMxN3I5yA3B2l7MdOLsf8czZds6TpcjHAIIW1rgguEMmScGp12NV
 vJNUe+YlkkmjTp+JoElvmgxeD/yU/9r+7Mw73gtLSgLwdfSl7uTEU6MgK5VnkCeCT0ff
 YkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Hl9gXkEZJCmd5pIKcwwwVPp/k0Rhd8r6eD3LfRdlHs=;
 b=6g8Kd9T/TSW+bj/Ims2viLBg0IgNR1Ew0vEWayze0lIu8Ym3gar5gCTufaimaFKTHg
 FAIZm3YLm8+gjE4z7cSeAZuwM9Gg3NBuincXZpDRV5xCz9AvjGsxqlUqe5skD1lB7cqE
 YleIPfy7DmfUsMJuz/3tuTI0kMTvpdbMBKY/XAUQM75tsI3MC5OsgeoIjPMmPhAzC5lP
 X1W5mzs+8Flq8BtY1ePOznYTTUIyjguq0fqz/R3M9Li+26wGfiV9da/YgxIwySJ276zl
 IxatqoCALL+N1G+T+EVT6ua1jJYAjSh8w4cuDIlmdjPzyohEaKInkBIMuAMMD3aEfrFL
 Dlag==
X-Gm-Message-State: AO0yUKUCK8Oq7r5/u4i8Umq0RV0RbeI8jle92slSrUGXgz+P2NWEpQJo
 hK35VZce4fDHfO+oi7IoK2n/aQ==
X-Received: by 2002:a5d:595e:0:b0:2c5:8d7c:c144 with SMTP id
 e30-20020a5d595e000000b002c58d7cc144mr10641555wri.39.1677163165492; 
 Thu, 23 Feb 2023 06:39:25 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q31-20020a05600c331f00b003e2243cfe15sm5242239wmp.39.2023.02.23.06.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 06:39:24 -0800 (PST)
Message-ID: <5de15c0b-6c54-3de5-c8f6-240f0c883d9b@linaro.org>
Date: Thu, 23 Feb 2023 15:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] qemu/typedefs: Sort in case-insensitive alphabetical
 order (again)
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217141832.24777-2-philmd@linaro.org>
 <7120D9B2-2ED1-4D06-A98B-9FB2CB95C6CE@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7120D9B2-2ED1-4D06-A98B-9FB2CB95C6CE@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GcR4pnJAA6t+

On 18/2/23 01:47, Bernhard Beschow wrote:
> 
> 
> Am 17. Februar 2023 14:18:31 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Following the recommendation added in commit a98c370c46
>> ("typedefs: (Re-)sort entries alphabetically"), and similarly
>> to commit 64baadc272 ("Sort include/qemu/typedefs.h"), sort
>> again the type definitions (in case-insensitive alphabetical
>> order, using 'sort --ignore-case').
> 
> Since it can be done mechanically: Maybe add a checkpach check?

There are 2 different sections in this file, each sorted
alphabetically :/
