Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp597353ejb;
        Thu, 22 Jun 2023 10:48:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7O3u8VqFoCJ78nrPPkun9t8zrI6/68XxJTWp5jVUDcvX/V/XIObosQCLT7+9d/4eh2Xt15
X-Received: by 2002:a05:6870:732:b0:1a9:601a:1cfc with SMTP id ea50-20020a056870073200b001a9601a1cfcmr9771330oab.52.1687456136424;
        Thu, 22 Jun 2023 10:48:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687456136; cv=none;
        d=google.com; s=arc-20160816;
        b=dCtAni6+C4GIJpJQ2INRNQhWpAz7vVLZc9PUsZ+zKnknHMGTKqNMUhFeBLMuhVLA+U
         pMWSRhsKc00Sthml6hGFL0Kea7V74jtoHUa7d28VxINxXZVolOz58S4qJx0vDZH/iSDm
         bYwoSPS7mG5Ftf8AiEeNag+ucpKEFZfzId77zoRsGcei6ZCwHrHgnyRm4NxZ95VZwByp
         Jjh1RM/791jtMscnyvSEgHwM6SsM7Z13/mNd9iAMXLHpCZN7P0HDxPEbk8pzGp7366BK
         hrT8SeIC4LKTDA7/6SQplkhQpE2QOga2Ah8XIGsxBfLNY5Dhf7jjtXczp2UbsXhc9sdo
         IbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=dqzSwhmIqLC0pNAcU2LtSNI/E1J8NE7gvDvKGn+6LZQ=;
        b=Zzn4Z0MwQ7iXwmiAvy+O4jqIvqPgGUsZh19O5Aw45NtTpzlulDSelJzUioXCaBhqkk
         +iZJ9GG1dYYUCo29JpHpHRo0itON8B3ZG/HG4C1v5561JiBPqX/vRxLtYjYtDU6ikvAu
         QEAbHHpLlQ2IipX1t+5i/QgEIqS5BsEDFgmSI6ky5v4LmU1W+Ja8O0ydMTcUaRwWvpzV
         zUJgHW8JrddjUEn3WlcmB0wj4DjOnP4aEEaKFzEZ57wPKn01/NXoDiSo3R9eZjg04hzG
         NGl1d+kppF2GLzVwVQoSQbe7fHk5+Yew+eUuUwwn9NGYZF5FOgKvMdbWxZMgURmbbclw
         QWNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuKhnA4x;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id y26-20020a63b51a000000b0054fdf405388si7034546pge.301.2023.06.22.10.48.56;
        Thu, 22 Jun 2023 10:48:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuKhnA4x;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbjFVRsn (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 22 Jun 2023 13:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbjFVRsh (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 22 Jun 2023 13:48:37 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657911988
        for <kvm@vger.kernel.org>; Thu, 22 Jun 2023 10:48:36 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b479d53d48so73394281fa.1
        for <kvm@vger.kernel.org>; Thu, 22 Jun 2023 10:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687456114; x=1690048114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqzSwhmIqLC0pNAcU2LtSNI/E1J8NE7gvDvKGn+6LZQ=;
        b=zuKhnA4x/RPSFsbRDJ0d4Ftiske/KmneH55J9Sv9/ZNVVwbQ3icFYY8MVzx8/+V+SR
         4px+9lMVNc6S6yvGsRMvceKngfoW5pSqqDQQYha/GLw6t5fgE82RkgNXPjSfLlIUq2S8
         74Gy4qNIB83KfhY9VgP7FhCVfKwLiYQM5/Gq9OuvUnzhr4ChZp+/8xcqVOjBMc5OMnXL
         7lZZUBotN2tra15w4fQs0CKbHFSzkmjl5gWKDqCI6yat/f3cTNUnlkQKgFQcHajMXIlS
         Rc93JrOx+coCGdYDTXciBqhdaAn9GSwr36eB+HAU5RTRzwbNQhV9G5MhDRblA/3DLi9f
         Wsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687456114; x=1690048114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqzSwhmIqLC0pNAcU2LtSNI/E1J8NE7gvDvKGn+6LZQ=;
        b=Co5tldJ/CtYJ211obTrXLO62xx98ZXQiimjURQishGsVBlbZRe7a+weyP0NqFj+6wL
         FpFMtQ7njjbL5PzZJjygqXWLir5kCVsY44o0M2b3Rlleh1A/MhJWVc4cZqYGOm5wD2uB
         NoD4gsFqVvra0FmGwLK++Lmq6OGjL9PcQUf5BwlF9czqt63MqUywhiKxjrP54o4uzSmQ
         FtAEHLfJI1gYckz9JM0ngbe5lnTpsKUdXujBY29nMJ6+nvytiU+4hxXt37KZNbocdNHs
         /QYmSPR/zlRhyWMUp7Z9UjNIRnVzLbLnk9S2T49a8HPi6KfYbS4426oeiTTb2ABx/4lg
         v9XA==
X-Gm-Message-State: AC+VfDy/9dBC0mpidxPy9zzCYEiIe3uP89pQvUkPAV2NgkXXD7uRev1u
        IJ52uR4LoUrK/4aRWGCiucClAQ==
X-Received: by 2002:a2e:834b:0:b0:2af:25cf:92ae with SMTP id l11-20020a2e834b000000b002af25cf92aemr12328492ljh.22.1687456114734;
        Thu, 22 Jun 2023 10:48:34 -0700 (PDT)
Received: from [192.168.157.227] ([91.223.100.47])
        by smtp.gmail.com with ESMTPSA id y3-20020a05651c020300b002b4832d0c8esm1421362ljn.118.2023.06.22.10.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 10:48:34 -0700 (PDT)
Message-ID: <d1d63ac7-b0dc-4d8d-73ff-9b693ca163c2@linaro.org>
Date:   Thu, 22 Jun 2023 19:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 12/16] accel: Remove WHPX unreachable error path
Content-Language: en-US
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
        qemu-devel@nongnu.org
Cc:     Reinoud Zandijk <reinoud@netbsd.org>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Roman Bolshakov <rbolshakov@ddn.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul Durrant <paul@xen.org>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Alexander Graf <agraf@csgraf.de>,
        xen-devel@lists.xenproject.org,
        Eduardo Habkost <eduardo@habkost.net>,
        Cameron Esfahani <dirty@apple.com>
References: <20230622160823.71851-1-philmd@linaro.org>
 <20230622160823.71851-13-philmd@linaro.org>
From:   Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230622160823.71851-13-philmd@linaro.org>
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
X-TUID: YATAjlJtMLP1

On 6/22/23 18:08, Philippe Mathieu-Daudé wrote:
> g_new0() can not fail. Remove the unreachable error path.
> 
> https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/whpx/whpx-all.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
