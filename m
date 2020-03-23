Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1796230lfi;
        Mon, 23 Mar 2020 11:44:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsplcanbZYAXrDU4TBNq+FgBmfK4/dArHsQISwT/p5rYkk8YiyymX1ULaYG5zMv851LqH8m
X-Received: by 2002:ac8:3630:: with SMTP id m45mr21178147qtb.330.1584989079526;
        Mon, 23 Mar 2020 11:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584989079; cv=none;
        d=google.com; s=arc-20160816;
        b=hmab5d6gcZpvR2RXJr0TvCCldjT+aeFfzB4wl3nFZ2OknMtog03Q4WBm+/n+plO1F1
         mgGIyA/oxWJtM6WaWgu7Hsm0UYw7Ozf3SWdVS5PXsjWVhabTIdo9fO7MxRZBC0XzU42+
         VErOl+camjDtyCnvxMieclj4sgl0AllpzRDvyHzBNLQEnO1mFuzHeqQn7lB2QjmmwD/J
         1azgOVDrmkACXz3TL6+F+AdCCzw+RAuiDVrRSZTu8ezTzKlUEOl6+hLe1S2J5+qcEgfM
         tl8f2KJeqvA5IpQBEv1iqp6eBLY2RMgbi2oBc4qpt2F1DR08YAg3sidR4PgzYdYO7n+W
         pcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cWZf8Ob1OHd4Kq+/oQzay+HP2CCWm9Xm8SwXjWqnvi4=;
        b=qf0IMuj//y15w5pxbIQoCsxACdg55RTG+j7RYMCZdUPibk37vXKD26SUqn1/OC6puc
         sLQWRNJPsi8P4mqVrkplTUpa/kGDZhQYWbj/EIL5c5oLf9/QC14mM2dIY3owsZv/mpJB
         Y4ey+5lSH9xpdSvp1gaCHaUMDtCjvqsQG56ucNabTaaULrRAOwiGU4Z1S39CR2eiGtTL
         x2FRTzECaim1U3JkEHQQj/Gf28Zf3SvSE7KSpx6STSSsX3QOsVsqOs9YPk2KFkaaD6J9
         QhGfRT5LNDdbfaJMmpO98pHYXRnPL+6k1gwc4EP2p074xHyHDQRdDvLzL3I7iKyRUjtS
         ZHlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=X5mJe48f;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id h10si6463875qvf.219.2020.03.23.11.44.39;
        Mon, 23 Mar 2020 11:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=X5mJe48f;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 134A44B09D;
	Mon, 23 Mar 2020 14:44:39 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDO5Qi7kr+OD; Mon, 23 Mar 2020 14:44:38 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1C8AB4B093;
	Mon, 23 Mar 2020 14:44:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 27F694B097
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 14:44:37 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o5Wink0g++l9 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 23 Mar 2020 14:44:36 -0400 (EDT)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 2F71F4B093
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 14:44:36 -0400 (EDT)
Received: by mail-pf1-f196.google.com with SMTP id q3so3387888pff.13
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 11:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zu1HzY3aEP2K2cAbQ8V3zxh8z4+CS8uVqTPxmTq4MhI=;
 b=X5mJe48f8ChUHa2asCEWjZmC1IXYoskxXyCP1FOs7boDLks2wUSggDI/Py2yl/5Rw5
 8JPl0l4iVY02qV/NbTiV9HeF07BkjSyNv+ZnunX4TYFTnov+XkWX8cFyQcuXWvN1VV97
 3gEs+SP4uNu32E/+Yb+pY0iqCDjuunH2T9+7JiwtVZqmYaHnMV4beZ07z+r4l6mGStgX
 igrmQrLeuF9yI4zj2wCpcb5xqM6fe63Fph5nQYpEj2hsK6IiP0DSHyb1vYYcHmP9SBNK
 EBx9ZvcRAld3/FJkda+AR9/pfx7ww7f1Zh3biGLSq0OWpmeIzGsAz5VSnb5iZ0Hmil0k
 TVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zu1HzY3aEP2K2cAbQ8V3zxh8z4+CS8uVqTPxmTq4MhI=;
 b=lEJfY5DRwn+lK8qK6x4dpI4IYfp8xh5DK3mG1hl2Y+hT81oLfe/PV6kYOpeLrP0aJx
 CY8N0D2WUtLdwDt1GImfjjTuxcgHKdUHyvbKNT2K/kbTCICtTUBa0XX2PvjxfgcliGpC
 DE+RS7f6poQhLehtBE1F8K1EqA5c0B5Tme03rPmShLQq+mb+GyUUJBhRQdPHJ/zmKYIC
 zS1k6aOcrM4WGcrKrPFNqkmSooIoCMohHUENI3UHrLcpCcFKLLBDwq9fT5l+BO06OYn1
 qXTiBscT9E4Fm51iE8Q6aEP8gQpnWIlXPx2XcdVxswpdEbo6yI1qcsEO2ig9eQBAvYtH
 xNAQ==
X-Gm-Message-State: ANhLgQ3DjxL7g+O+nru4hg7g3DLO0+dNl5YK2eBuSl2WV3ule/u4Btq4
 fZUXSh3CLIncvROQviZIwQK53jrvqrc=
X-Received: by 2002:a05:6a00:8d:: with SMTP id
 c13mr26545393pfj.68.1584989074696; 
 Mon, 23 Mar 2020 11:44:34 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 j1sm14026922pfg.64.2020.03.23.11.44.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 11:44:34 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] target/arm: kvm: Handle potential issue with dabt
 injection
To: Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org
References: <20200323113227.3169-1-beata.michalska@linaro.org>
 <20200323113227.3169-3-beata.michalska@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdf4d6f2-ecab-6358-9f74-480f1fa6fdef@linaro.org>
Date: Mon, 23 Mar 2020 11:44:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323113227.3169-3-beata.michalska@linaro.org>
Content-Language: en-US
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: rJ8CaWlJbyuM

On 3/23/20 4:32 AM, Beata Michalska wrote:
>      uint8_t ext_dabt_pending; /* Request for injecting ext DABT */
> +    uint8_t ext_dabt_raised; /* Tracking/verifying injection of ext DABT */

Is there a reason these are uint8_t and not bool?


r~
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
