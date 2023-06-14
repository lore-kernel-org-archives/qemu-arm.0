Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp38800ejt;
        Wed, 14 Jun 2023 05:28:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ZJs4hd8Uz1rrMp+tFZYN2wFPwfbK1PCF3rU4p96KWCRRRf9CwltR8+UlfNtFGZD8fLrQu
X-Received: by 2002:a05:620a:4142:b0:760:83e9:6db2 with SMTP id k2-20020a05620a414200b0076083e96db2mr11476571qko.58.1686745690338;
        Wed, 14 Jun 2023 05:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686745690; cv=none;
        d=google.com; s=arc-20160816;
        b=rD8B3jKOLkn2OGcaqblbQEzymX4zBl8skco1Do7IWzU3wA8o0xz8lCDy1PLIDfZyfm
         lkSTCr8aHrp2E0FNTPim3i1sZVmhH4IJ/FgLRK3BgcizYCEf7WmG8+y1lYdFvZjzib+x
         hJvcZqkK4xHsUfhMsSWQ5/V+gqbHfwaqstZKhIZ1+4q/pEis3P3PZxxkCzdmwY+I3NWf
         YprF12q7aU9oZF8/jQSY/6jOcKX3g/SH4RtUbVFur5PbPZTvlKMGWJDrrq2NRtEpF0na
         04XqjgmMtl+WAOxf6UHpJ/bojAx7Th1QJ+7aX5Ipt3Pke/uGMaaS0Y17/aRbffd3mjGL
         rnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=o37TAqTGrX8tIz+TVOfb7QMBpiIOZavy3chHP9lBUu4=;
        b=yVpo4x4cvATsc/+zCY5F4HFjNuvcXIeE5oriJcL9oRIx+2pTbP1b3on9MirxLuKqTg
         zSU6TU8T9Q6Nzv2Tv5LbcumjZO/LAdDBTG1dyTIlIgiIQEisdF4e4C2v+67eFOulVU+6
         UslUFHfcObBb7x7ufHhbQIR7o02bTWIGlrX15ag8HV/vmhgPZRD+9kv4JA3z2Ta5PEwV
         g3GgvGuQwdDE3/XifALE4DvBOjX2UMbbS/2pAmllNQlarISCksznFDrE65xr3HtxscKP
         bDNC5vU+OFic3hj173s7UXORwlWJtGOfwMp3EHB8cktxTiTZLJ5CQZrmyB4nC+9dPraC
         QiAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B9wFYQWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020ae9c006000000b0075ba62aa25fsi3723506qkk.616.2023.06.14.05.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 05:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B9wFYQWu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9PbF-0006lj-W1; Wed, 14 Jun 2023 08:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q9PbD-0006kP-2c
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 08:27:43 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q9PbB-00009o-F1
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 08:27:42 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98276e2a4bbso67786866b.0
 for <qemu-arm@nongnu.org>; Wed, 14 Jun 2023 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686745659; x=1689337659;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o37TAqTGrX8tIz+TVOfb7QMBpiIOZavy3chHP9lBUu4=;
 b=B9wFYQWuioF04zouqk9X+9G3DUnovCM8iMDesjQuv1gqOcstQ8unoxlqjqNzocfcSj
 EjJ0Pc8bDDx34zhYJVRUInfrWOcxjyGyjT5iP4zFxbKSlKz8g/g/78Lk3FDQFIIudz8t
 skVDaz6AIfDrtdnLLZ34L7ChUcOc/q9LJFICCwejRR/3wZUz4Xuxp0rLWGohqC4YiaUI
 YT6e3CqmvohXEKEDS4Zuggkpet+EOAGL8hDp7kALiC8WuFmgOgGb/1BxJGZ4ruwdyPds
 CS0GE9I2RTZxxREmCJcBgAQJgavWU/vacoUsUd3pQm/46wQxOG3Dac7CkJhh+0I5qK5q
 WTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686745659; x=1689337659;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o37TAqTGrX8tIz+TVOfb7QMBpiIOZavy3chHP9lBUu4=;
 b=gumWguWBEyV+ZCRWpry01L/XWXtXzap+Qt1qDGhT5U1KHpLPQvX8yDpWncdfP/pN9r
 hHwJKNoQD2RA4eXVDPJi5TvydtxTbliIm+jxmhttnkTsbwMrlaVH3zHgX3ArI/BPi/Kl
 R8cYCVWwVQ0mXmtHtPTKy/r0rAsDN2WIslbeTaahGp1sBFcoG6uTNhl+hcE9nPXH0sjz
 T8gWkn2EivC91otxuCHhbYzM/xN9HbWsWpImfbGlQh/VYeJm7SbZVEE6BxRTnGWV8n38
 XTum7H198ufTDhhtuPngLmGPCXks4+8WxEcgQO17i5iY2Cdiloe5O++aoiUW98rGt9N+
 Ka/w==
X-Gm-Message-State: AC+VfDw00YiDmgJoHPLZChVulBl9NoYbrf2KkEtLuyD48es7Jn1TuQ7I
 GJh1ufrj3tbrVb2vGz0CnbusjQ==
X-Received: by 2002:a17:906:fe4d:b0:974:1e0e:91ee with SMTP id
 wz13-20020a170906fe4d00b009741e0e91eemr16521314ejb.13.1686745659393; 
 Wed, 14 Jun 2023 05:27:39 -0700 (PDT)
Received: from [10.14.201.118] ([213.175.39.66])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a1709062c1a00b00974556e50a6sm7992135ejh.114.2023.06.14.05.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 05:27:38 -0700 (PDT)
Message-ID: <dca0331c-66fb-1b38-8d45-1e5d7c118494@linaro.org>
Date: Wed, 14 Jun 2023 14:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 09/10] memory-device: Refactor memory_device_pre_plug()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
References: <20230601121447.272487-1-david@redhat.com>
 <20230601121447.272487-11-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230601121447.272487-11-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: e3fp+hYeJoe9

On 1/6/23 14:14, David Hildenbrand wrote:
> Let's move memory_device_check_addable() and basic checks out of
> memory_device_get_free_addr() directly into memory_device_pre_plug().
> 
> Separating basic checks from address assignment is cleaner and
> prepares for further changes.
> 
> As all memory device users now use memory_devices_init(), and that
> function enforces that the size is 0, we can drop the check for an empty
> region.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/mem/memory-device.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

