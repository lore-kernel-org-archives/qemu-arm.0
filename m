Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2139936ejb;
        Tue, 30 May 2023 05:32:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ttwIvviouObVBQSqlA59DeqjiHlEbjffwirwqE8AaxwXhqgwJBFBw6sN3IyPfxcx1JgKk
X-Received: by 2002:a05:620a:6642:b0:75b:23a1:d8d7 with SMTP id qg2-20020a05620a664200b0075b23a1d8d7mr1820721qkn.27.1685449963036;
        Tue, 30 May 2023 05:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685449963; cv=none;
        d=google.com; s=arc-20160816;
        b=vCuDrXS0qVHW14M4M8u829lvtmB57uOHMcDapQSYlbOP15HmfM5P67hTwOA13TG0Jo
         ic1/3X0FT9tnIAtd31xzwzHK6uVKwz7iyAd0oSVrObVp6/ZVsPMEkZkaoO3reiX8zAm8
         TcMNQM33Hzv4BrROAuvffqS/MolfDwBm6/zQVAcQb+geLLmNcWNyQkwrSKDt94VRoZEl
         /Ey0/qHoGxmnjcZdV5vl42dXItVcGbgwO1PbZVOv1xczJ+ZfCdRzJ4tpsX2qtTgEYQo2
         383ZSC88EcPWudlylT9TjrnVQC3D3d4cJ0L41BJtDiQSQ2n7h95bEz+bLAYYcA6M83wa
         d+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=B0JaErNv7F/pL8tIgBF+HzZ9xHV4CCAiUM32UBVhOuQ=;
        b=zEVivjxgoZcBCcoq4/PIF5DahHW7kzaPfqC6rla4OoMbcM3z0i30H2KxwV6DWxL7Tr
         RZ9yarqnKIxDeBFkpMcFzrUtHT2Do63JltJa2wTIM33/fsJ3cnDYBb83DXgMgx3A+B4a
         ETk/399EKVoI30fbkag/ZsVU+7EMW0vNCkC/GhbCLg58n6w2m8QAd17PdGmzGgB7D2t+
         Q6WWtPI7kgE0/1poy5q5RW5ITMpE/idS1Yak/LJVZJErovNw0Z3XwYyaokJhPjaKuovq
         DYdFW6Tx1BzIwkiWMwIK2osqYAmBPVJazTQMBRfHDazrP6r1fgV5SeltyaJmDCSHdI1o
         +3yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pU85qRSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020a37f513000000b0075b27142b51si1368131qkk.299.2023.05.30.05.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pU85qRSW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yWe-0008M0-F9; Tue, 30 May 2023 08:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yWb-0008DQ-Qf
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:32:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yWZ-0001ic-Oe
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:32:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30aea656e36so1482202f8f.1
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449946; x=1688041946;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B0JaErNv7F/pL8tIgBF+HzZ9xHV4CCAiUM32UBVhOuQ=;
 b=pU85qRSWzstHvCmUip5ePbO8jgrOFXE2IH5bu940270ZQ5pNr0/LC5U26pIXq8pceV
 HboJOk3CqZVL/44n6NHZPyrRcSLv18EbiRpelRy/nqYNwUilU9jvGU9Os4ITPlbgTZxi
 jODQLGZR2/4SLFVaUIci5F4JKFjbOI33+gS64kkQZ6eP2GXWAvcF9XNoqVAhLCDLJtN2
 gUxnQvJHz8MSjJeZGbWNhE/e7DDbTlruFqFyId4GY3iNUccAZ7R8TtqYmJNEpvD1poQf
 1gy2ZqjKo7ZWJMEaPtvjcj+p2gaYQaFPjSXiwL3hsrthbQIUuSu9DjE4gU05/O3EAusp
 rPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449946; x=1688041946;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B0JaErNv7F/pL8tIgBF+HzZ9xHV4CCAiUM32UBVhOuQ=;
 b=JCqNNuOYSGW8xmSvR4Jbu5ZKnco7HS9Xcyg5HlnNisdVonEfOls0p0OsDQAfo+MCDs
 a6z9oSS5zKUgKXDMxTuF6SelugF1OgKGNY+Pxil09O6lDrjjZza6xiL/tkfhEEE2R2nJ
 Nfee+xLMEkHRN/jzFqmB2S47yPyNZvMccdoS0Re25UxKefUeIjm9XoidY5sK0dqn41gL
 lbvz8czT5mpxLO/5y028l2RvKgfw+uNALYSD4c5GhxOxILr7P/y0DJ1o+m0yI0pNtl3Z
 HZccCopLRFqak8lr5W573R1z/K+lPqTbUcEQq/MzosWlrFx8oNqoR0+tZ5QHf4ClMovs
 wFnQ==
X-Gm-Message-State: AC+VfDxDE6FT23Ptg10KkED1Upp/7CEYgr8towAINa0iwM2Km0HnzSmj
 kdn5SOdlwytTZBmJvTT3f/z4ig==
X-Received: by 2002:a5d:490d:0:b0:306:46c4:d313 with SMTP id
 x13-20020a5d490d000000b0030646c4d313mr1552351wrq.28.1685449946111; 
 Tue, 30 May 2023 05:32:26 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfe881000000b0030631a599a0sm3196174wrm.24.2023.05.30.05.32.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:32:25 -0700 (PDT)
Message-ID: <77141281-dc31-a38c-6e40-a5be986cf074@linaro.org>
Date: Tue, 30 May 2023 14:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 04/10] hw/ppc/spapr: Use memory_devices_init()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-5-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230530113838.257755-5-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5+jd+cwENolZ

On 30/5/23 13:38, David Hildenbrand wrote:
> Let's use our new helper and stop always allocating ms->device_memory.
> There is no difference in common memory-device code anymore between
> ms->device_memory being NULL or the size being 0. So we only have to
> teach spapr code that ms->device_memory isn't always around.
> 
> We can now modify two maxram_size checks to rely on ms->device_memory
> for detecting whether we have memory devices.
> 
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/ppc/spapr.c       | 37 +++++++++++++++++++------------------
>   hw/ppc/spapr_hcall.c |  2 +-
>   2 files changed, 20 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

