Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp819370ejx;
        Mon, 26 Jun 2023 03:10:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XcopqPOcnRT/18meiW23xr8MZQ8EaVWyGGuwAeb1GNBMbPadglNpljQ+JuxUHDGag76m2
X-Received: by 2002:a05:6402:111a:b0:514:a110:6bed with SMTP id u26-20020a056402111a00b00514a1106bedmr18425521edv.27.1687774219336;
        Mon, 26 Jun 2023 03:10:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687774219; cv=none;
        d=google.com; s=arc-20160816;
        b=RnbvXRilLn42bDDojkWSZkGTjHXCVasfE59CeDy164w0LSWaajNnrX4YWwDJg5c/K3
         aOhhNK1KcsAG6je2zMXIjTZK880ktLn8ZxHmCsNyxEpiK5yBMgtrIrVyeoQQ6IYBUQ0F
         S6O6UmX0Nmp0oIhdQnDw/sEevgmSB2L8tD1DUovwOWGSA2WzR6wLnH69GXdb1d+TnoRU
         jEeRXMyGJ6Cw6CUvv1T0tREDsd+LK6C0Fm6WS7Anba8SWttkwYUICj0DT8sPxZj8KnUt
         ZQJDtX9YaZphJ8An5/WoTsIQatXNe7eplZRz/tMYlGYpGOSm4yXc/LVGt1dgFEBTOLmX
         alXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=74FM579RKOmTf3FtTjRf/xU5EA/KuNtZjlzUaBEQ9kQ=;
        fh=8xkMP+8sXOzLm6NlYFK2jHx+oIOzZAanUlb5WujNbtM=;
        b=TEw039iTSdaovCBTh1lwsVVVppzfJiSB7HBEHQvt6w8qROewX9BhCfK8NTsNP8ncl2
         hIuqb0D0fxkFtPnII2wphXxQKIFfKJS5CRDyEq4hlvynju9GBWROUl6eB7Yo4IPT3jYQ
         lXzeBW510bo1h3g35Q7/SZBco9I3qiZVRkiPhCdpXjprKMUt/CsRDwyhExLOE2nPvnxj
         /rImUq8bNYIhmE1t+h4yYAF/HeRj3LxyASWqnwXjeaNJza/Ny2aBA2mxXgYZ+SpkkRtC
         VQ3ngN+3G79EAo+rJ6Hi1xZqFI8nC1MD2RgYjEwLauNXGe4IqNCsKcbXV9ta6e5IPyYB
         IX/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S8VAOmGa;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id g11-20020a056402114b00b0051bde65fb79si2447797edw.572.2023.06.26.03.10.19;
        Mon, 26 Jun 2023 03:10:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S8VAOmGa;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjFZKKS (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Mon, 26 Jun 2023 06:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFZKKO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 26 Jun 2023 06:10:14 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F06511C
        for <kvm@vger.kernel.org>; Mon, 26 Jun 2023 03:10:13 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so4002545e87.2
        for <kvm@vger.kernel.org>; Mon, 26 Jun 2023 03:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687774211; x=1690366211;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74FM579RKOmTf3FtTjRf/xU5EA/KuNtZjlzUaBEQ9kQ=;
        b=S8VAOmGaHb+ynWL6PZdVTf20DDVl7Z0It/rfFFEA3rSrWW+j7oWDON4RLsGfkPpCqg
         5K6cTpsgQ/ww7o9lKt0rscznpi0y3ON8sIMjAotM5fWDSWqhA2sWG/QGwe6xuOPyTbgu
         TYNlDvI/QyqlbLGhnBaJ/x1CdnyNNWscnSzCSnH3cVi1dvHW9i/qn8ytvt5RZg2BcSxY
         JAqOG8lDnR76XNPVCf8bQuQBr0C1oux9e3zeBHuaJ35patRNb5yVtEzDD4NinVJuEZ09
         w5m4X5x6pIzlQvYSzuUAYIMRreEMGvvUVLY1IEIXa36eyW8RjH0UxtomgZPp9sG1XXId
         Bm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687774211; x=1690366211;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74FM579RKOmTf3FtTjRf/xU5EA/KuNtZjlzUaBEQ9kQ=;
        b=gycj2MdLwqj9JTC4MHeJt2dRQjiGskIILNNl5ivIbLOfFkYuqA8QDC0Y3Uol5oSw+x
         Kc/GSDSV/t3iMxgrlkqlIMngHFrMyFWFyGipGgpPRswy9pVW59uFWLjh90jSI2/tM42C
         Y1xlNbM16LSLu3LuJ7lZ3KBkjcrhVaEJcqTynqtsnUfTtSc3ZiIgl+D9vnmXCyAS+McF
         1cZfZoLqtiMfq5/UBI6x86NNoUguALkg+u91WdnVU5eZpXrpYQpvBLI6GH/BXFovwzI1
         6nKIesQsHAySWgH5eHl/D0cD2g3/1SOLe3gdSGa6ttKC8/vhjsK8WnyGLgS+nZlup9vC
         wrNA==
X-Gm-Message-State: AC+VfDzD1fc2jTiAu2gT5VIN1Ddcr51CzAyGb31ASFUE8d7lY6mCMsn9
        rAJQHId8NfmEPrz3MIq4WO/yZA==
X-Received: by 2002:a19:7108:0:b0:4ef:f11c:f5b0 with SMTP id m8-20020a197108000000b004eff11cf5b0mr15203630lfc.54.1687774210741;
        Mon, 26 Jun 2023 03:10:10 -0700 (PDT)
Received: from [192.168.157.227] (141.pool92-176-132.dynamic.orange.es. [92.176.132.141])
        by smtp.gmail.com with ESMTPSA id j19-20020a5d4533000000b0030fafcbbd33sm6833820wra.50.2023.06.26.03.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 03:10:10 -0700 (PDT)
Message-ID: <93dda239-00cb-3c5a-c7c2-6ade248e147b@linaro.org>
Date:   Mon, 26 Jun 2023 12:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 07/16] accel: Rename HAX 'struct hax_vcpu_state' ->
 AccelCPUState
Content-Language: en-US
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org
Cc:     kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
        Alexander Graf <agraf@csgraf.de>,
        xen-devel@lists.xenproject.org,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Yanan Wang <wangyanan55@huawei.com>,
        Paul Durrant <paul@xen.org>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Eduardo Habkost <eduardo@habkost.net>,
        Cameron Esfahani <dirty@apple.com>,
        Paolo Bonzini <pbonzini@redhat.com>
References: <20230624174121.11508-1-philmd@linaro.org>
 <20230624174121.11508-8-philmd@linaro.org>
From:   Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230624174121.11508-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Yji/O9hHLDN6

On 6/24/23 19:41, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState. Start with the HAX context, renaming its forward
> declarated structure 'hax_vcpu_state' as 'AccelCPUState'.
> Document the CPUState field. Directly use the typedef.
> 
> Remove the amusing but now unnecessary casts in NVMM / WHPX.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h         |  5 ++---
>   include/qemu/typedefs.h       |  1 +
>   target/i386/hax/hax-i386.h    |  9 +++++----
>   target/i386/hax/hax-all.c     | 16 ++++++++--------
>   target/i386/hax/hax-posix.c   |  4 ++--
>   target/i386/hax/hax-windows.c |  4 ++--
>   target/i386/nvmm/nvmm-all.c   |  2 +-
>   target/i386/whpx/whpx-all.c   |  2 +-
>   8 files changed, 22 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
