Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1834248njc;
        Mon, 22 Jul 2024 03:59:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCgSs/Ylsc1Zofi86n5M099WlKBbwhC/6kxKHFC9JUXY3FfEdWZR0J/5bLIsaUTXNu3NIq60TmLpmibwWv3Xov5Ei/qbR+
X-Google-Smtp-Source: AGHT+IEJa+sgKlXm5vBaalrWVkDBvKXDyjTeaZZ/k3Mp7HaG+YeS43GIX4pUZJVbmIl0R/KWP5Yo
X-Received: by 2002:a05:622a:54d:b0:447:f361:e2d7 with SMTP id d75a77b69052e-44fa531d965mr88311481cf.47.1721645946458;
        Mon, 22 Jul 2024 03:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721645946; cv=none;
        d=google.com; s=arc-20160816;
        b=bHxlrDIQo3omh3ifqsViEBpNYByuD0pykIi1nNwwqPpRlQni5nGa8ZQo3RnyhwQI2N
         tkSBTRDJWEBLs5/YzVQs/fYeIurmOXYWR8fMya4lb/2YFB7Erc/r/VjvKvuGY3OgWEnO
         n+BlLXptUgJbKNi7DCgUvIYM1/prq1MuU8JOSpThw2YyjkfeSPw8iPad0Cx8xDlov/ei
         ToiKRCl+Hl3z4HRSyd1JTJXmQD3OfC25WnOTo9KSJovsylK0PRRGuNhKlEfmm5VaU8Pq
         66pYyZCh1b5jvNOo7/eyQItL/MWRWYDNLMSLBoy9WNDRqz26ovb9ICScRYbABnZjVQrv
         CUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7Cpy42h4QR0dQi4xrDY4msMCkizRDfkPfMeN4kHHSHY=;
        fh=Jj7Bk11u+1xAKs5Vj4psg48h4BZTj0DEAFuwDx6b4+0=;
        b=Lfmj+O7s6qj9A5xK3dt6aynsL+A1UmrCRXQePqr/Xpj8CyHsDkVH7Xe8vKCcTyQ1Z8
         kiVZMzol1LOf3EhoGyIvmmRNYOm+3I19h4ikiZnAj7UUDwW5SWykDVpCmLdLF+jwPvCt
         4nqWKlbMAeVpm/ynA53Z6oZmtp5rYWrQrrU10HwvjZXk+f0IrrUM6MJD3pRNb1jxWjwl
         a54Ubj1Ec3Y3Oi+PFHsb5FpiVCglNcN7ktLPIe/cO0emLlGtm+1C/augsy49pOOX2BxX
         7Cf7EaqYeWu9qO4S/O7SFSOLHWem100/4IVbUmxOAjqPXPYyTkC23krw6meK7a8WAauw
         7Ffw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NAsa/plu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccfb68asi74780041cf.93.2024.07.22.03.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 03:59:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NAsa/plu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVqkS-0008TT-HL; Mon, 22 Jul 2024 06:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sVqkQ-0008Ro-SA
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 06:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sVqkO-00014e-RC
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 06:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721645907;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Cpy42h4QR0dQi4xrDY4msMCkizRDfkPfMeN4kHHSHY=;
 b=NAsa/plupVYVLJkw/z2OtQWq6BCg27GAM7jB4YP8nc3kA35t+5HWNhsEdqgVWXBi3eEk7X
 2Hs1YFPsB/gi8kppmlC+Z12ELiT1V7z9/ApKdzIH6aA9483oV8JNv6Qmvp+MA0JAkE2UDH
 1gn7X8Oj4lF4/ga2QdYNjeka+inwVRw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-kdWIZRMXMha21Sb4Ov4LUQ-1; Mon, 22 Jul 2024 06:58:26 -0400
X-MC-Unique: kdWIZRMXMha21Sb4Ov4LUQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6b7a185175bso73771866d6.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 03:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721645904; x=1722250704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Cpy42h4QR0dQi4xrDY4msMCkizRDfkPfMeN4kHHSHY=;
 b=CiN0kgq+rL+iopPMwdRE0URud+JMipfYk3y8T2x3VyDjvRjXc1hPSVinosLC7E631E
 FtbSTRy0CdzQnmkbnwTG/CzymfsScEjyoOeY4x9kT2pmYaGubYml8YgXBIpq0Mg5xMYj
 /WvhgInHx+3yrlv+m/WlTsn4OD+JZ/nYqVGSLDI2ftnZo0bl/wINBkCyt1IOkcLH7Bb2
 C8bQGFoXKUCMu12Wqu6sCcreRaAod2v4RGowvuKMGzsU/PDZReCx9W02R7q1OUwrNpJM
 NjUKcNLU0VkhQ4HcMHmmyhMQHu0EPTOifglWi3iEIgbVrVV3dm6X5aGQ9OlvdvJoO0UO
 MUuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaxnTH9D3ymqaf1DsgtIGDiyWe4h+kYmzKCxQttb5gq7XzrVl2H67UT0iZRMZwDbgiXVP3qqoA8WegT1TvQkWXEBhY
X-Gm-Message-State: AOJu0Yw+21eVzecyqiIiAZUVJXbM9yh4pMskX2bvhiNsYgfmqYUmg+Jc
 zAfFgO2y3d7yh/42th+m78a+vIlpRmcclAgjMrU86ZeELaR9SF+abp4FyqmFFgch77ZVh6FF6qg
 0RGLBt9CyAXzOJQ2liuCz5CycMF+O7vG2MPMqMhweLbIIhm1M5g==
X-Received: by 2002:a05:6214:e67:b0:6b7:a248:3949 with SMTP id
 6a1803df08f44-6b95a6e872cmr97192536d6.38.1721645904542; 
 Mon, 22 Jul 2024 03:58:24 -0700 (PDT)
X-Received: by 2002:a05:6214:e67:b0:6b7:a248:3949 with SMTP id
 6a1803df08f44-6b95a6e872cmr97192346d6.38.1721645904115; 
 Mon, 22 Jul 2024 03:58:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b96a49d2aesm14917726d6.84.2024.07.22.03.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 03:58:23 -0700 (PDT)
Message-ID: <24401da3-596f-4ded-a367-4048d0565582@redhat.com>
Date: Mon, 22 Jul 2024 12:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/smmuv3: Assert input to oas2bits() is valid
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org
References: <20240722103531.2377348-1-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240722103531.2377348-1-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.133,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JEQ0s8PQdhSg



On 7/22/24 12:35, Mostafa Saleh wrote:
> Coverity has spotted a possible problem with the OAS handling
> (CID 1558464), where the error return of oas2bits() -1 is not
> checked, which can cause an overflow in oas value.
>
> oas2bits() is only called with valid inputs, harden the function
> to assert that.
>
> Reported-By: Peter Maydell <peter.maydell@linaro.org>
> Link: https://lore.kernel.org/qemu-devel/CAFEAcA-H=n-3mHC+eL6YjfL1m+x+b+Fk3mkgZbN74WNxifFVow@mail.gmail.com/
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3-internal.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 0ebf2eebcf..b6b7399347 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -599,7 +599,8 @@ static inline int oas2bits(int oas_field)
>      case 5:
>          return 48;
>      }
> -    return -1;
> +
> +    g_assert_not_reached();
>  }
>  
>  /* CD fields */

