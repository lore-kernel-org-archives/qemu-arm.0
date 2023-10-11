Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp493334ejr;
        Tue, 10 Oct 2023 17:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrIoGs7zx1bZ1FzDoMEr/+sifkO46PkliXNjfbIBKpaIs0Ei5NrL2jPQUlwLVpXALljsPM
X-Received: by 2002:a67:fb05:0:b0:44e:a216:59a6 with SMTP id d5-20020a67fb05000000b0044ea21659a6mr18125592vsr.4.1696982587009;
        Tue, 10 Oct 2023 17:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696982586; cv=none;
        d=google.com; s=arc-20160816;
        b=lrgANCvXkl+VQeiVPdSjstVcrH7FceLo5W0eDz74/PSkRARycrHcKJfZNECVKnR8Je
         56ErbaR8rUar0hCMkC7V2E9oLYKTXKqUuj86pO9WTysWwi4wZ6RXt5GgXyxW+x5ka5Zn
         Wy8k7tQqD4eQxYp+smhBxLN6Wq4zWgotlHPLAMWdHtLg+G/qjOBpESRQXd5xCoeLpbx2
         G0gpqzm48lXBa2x+cCf9expBtBFVBxPT/037c2r6WcvEK3I4rog8xkDUe8uweCREzTWY
         vbQWcaNfl2vh+bBk384dU8muX5dP3PeEXZ6m9cxygmQDQHEZc5PUY8KKJY4p9b2UHvcX
         vd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=wbEkRtqvEkJnBkKWslIkyHNkNJTQaP9y02JA7x1NPWU=;
        fh=g+u3QZOMfN2u16t5OAuQiBlGw7cnzLhqSLk35nY6wpc=;
        b=deFn/wgeNMUMOc/BixZYeOnI7XzPNVegQb9ih/+WI/HANUL5bftTyPx4oJp0qz19S8
         HuU60ndlH8oh24NrTWe/4wgsDET/Wh8LM9V/0l3uvcn4kmhZ54GFLqTyjZTT40OCjnuJ
         e8Ch/NAdfCrvkxt7bI6YnBtTgLrGhMKx2Sw+pQcC48Gs0YIvF6B0ZslPeALIgLpLjWqi
         iVdtMTgbhDOlvyW5gIi9nHxbbUQHWkFP1LE6VxNMCJvhJHChgV+n4L85Szpk3JI5ip/s
         5pDa8+wCiSJBpzyrrzbEookV0PsbYcwNQiGxOggdZX/UAxabJJNpj3dfMt9UQhgOFMCc
         yFxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D6tYo0q6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a056102108700b00452b20ff998si1222502vsr.261.2023.10.10.17.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 17:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D6tYo0q6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqMgZ-0003Cm-Od; Tue, 10 Oct 2023 20:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qqMgY-0003Ca-Jr
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 20:02:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qqMgT-0000S8-4C
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 20:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696982559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbEkRtqvEkJnBkKWslIkyHNkNJTQaP9y02JA7x1NPWU=;
 b=D6tYo0q6YGcCvuCGZpa8iaXpUjdD8VvrPU4tZjgt2uxBzvXO2DJWDOFQbLkx8m1pEe44sv
 C4BVeBf7UEOVenXfQrzUF1Vx6djnjVzgNUSUfMTRrw1yWZKVH28VjjVpvQ+NeUjJV28IF+
 4id2dnH5AjxBNvIvYtH1V1j7yKP5ICM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-lVMfnAqiPeuUkPotG5fI_A-1; Tue, 10 Oct 2023 20:02:22 -0400
X-MC-Unique: lVMfnAqiPeuUkPotG5fI_A-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-690f8b7058bso5304602b3a.1
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 17:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696982541; x=1697587341;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wbEkRtqvEkJnBkKWslIkyHNkNJTQaP9y02JA7x1NPWU=;
 b=h78Iq7YuLzlq0f5ndzbFRZYI8GTLuinCyPTaRePR7uG35K6xp8XN6IX9nr2/tFYAVC
 6PAbwFNbqrsv3TzTfoQBO3z8ZhTMvAcJBoZgqVTG36we9hWrVi5S0fvvvy7GQmTMXhzX
 HI2QXENm2WU8d0Kivb8j9C2NsCJAwy1nBat2DkWOAMW+OXPZGGl2jpxE9NegdogER0Y5
 nRsuKbLp4ikrlI8dbS0oRf0SdY7vh5NL6I3Qr0cWGwVmh5RJDQNKPDUuFQK3JRPEoJPt
 cnRFFcZi6uI9ljItS56gMb+Am1fXbOtEytp9XHwYscuoM/RLY4DSCVeYtnPWgBGOCDVr
 Dreg==
X-Gm-Message-State: AOJu0Yy+yKzU0DcZaThrtSXjM2I+z3X6yxVdvBxJiJNebrll70eyv5bd
 A02Gmdfb2J+AUeb82oW4bQ0PLKTXje/myZ10pPS5sbAbb0l15PqNghBHR4y9szvyY6F/OLGKlzT
 PU+f/S/Vb9iEM
X-Received: by 2002:a05:6a00:1a0c:b0:68e:2478:d6c9 with SMTP id
 g12-20020a056a001a0c00b0068e2478d6c9mr17909421pfv.2.1696982541522; 
 Tue, 10 Oct 2023 17:02:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a0c:b0:68e:2478:d6c9 with SMTP id
 g12-20020a056a001a0c00b0068e2478d6c9mr17909398pfv.2.1696982541203; 
 Tue, 10 Oct 2023 17:02:21 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 d25-20020aa78699000000b0068790c41ca2sm8781183pfo.27.2023.10.10.17.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 17:02:20 -0700 (PDT)
Message-ID: <94951adc-4770-7bba-15c4-f63a5d566d56@redhat.com>
Date: Wed, 11 Oct 2023 10:02:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 3/3] arm/kvm: convert to read_sys_reg64
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20231010142453.224369-1-cohuck@redhat.com>
 <20231010142453.224369-4-cohuck@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231010142453.224369-4-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: h4Vn0eZtuo1+

On 10/11/23 00:24, Cornelia Huck wrote:
> We can use read_sys_reg64 to get the SVE_VLS register instead of
> calling GET_ONE_REG directly.
> 
> Suggested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/kvm64.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 558c0b88dd69..d40c89a84752 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -500,10 +500,6 @@ uint32_t kvm_arm_sve_get_vls(CPUState *cs)
>               .target = -1,
>               .features[0] = (1 << KVM_ARM_VCPU_SVE),
>           };
> -        struct kvm_one_reg reg = {
> -            .id = KVM_REG_ARM64_SVE_VLS,
> -            .addr = (uint64_t)&vls[0],
> -        };
>           int fdarray[3], ret;
>   
>           probed = true;
> @@ -512,7 +508,7 @@ uint32_t kvm_arm_sve_get_vls(CPUState *cs)
>               error_report("failed to create scratch VCPU with SVE enabled");
>               abort();
>           }
> -        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &reg);
> +        ret = read_sys_reg64(fdarray[2], &vls[0], KVM_REG_ARM64_SVE_VLS);
>           kvm_arm_destroy_scratch_host_vcpu(fdarray);
>           if (ret) {
>               error_report("failed to get KVM_REG_ARM64_SVE_VLS: %s",

