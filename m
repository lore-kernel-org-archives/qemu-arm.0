Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2199221njc;
        Mon, 4 Nov 2024 07:36:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8UFPsoImOYhjk9F4DDw4euJUXOy50D2aqB1rm5hfySs44fqkWSP9k9zhDNVs5chWBj7PxMWxV27CHHw==@linaro.org
X-Google-Smtp-Source: AGHT+IHz/AId7C7nvtXXhKriWsbAofRYpeZFwKZCTYB/y4HkbnsQnks3FMCg8+b4VeoJ7Z9GLX8S
X-Received: by 2002:a05:6122:1793:b0:509:e7d:b7b2 with SMTP id 71dfb90a1353d-512270ca7dbmr9981318e0c.2.1730734571344;
        Mon, 04 Nov 2024 07:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730734571; cv=none;
        d=google.com; s=arc-20240605;
        b=RO8KOl+dCwk03QLZKT4YzQLq94x4qzwggK2VbtEtSVZwtGS01dOieh7mFVvRl5S8ug
         +nG8a18QGeKq6fRYxG0N1uz88jxPg4acGZjHKu+8gnflg+uIcKJmWWt48c3SFH35o0FZ
         s77GUDSApjPO/RfUTpRrCc8ulaRytqW61ffF6rzgllT6H+9U8AC/DtGW8Rm4zCkTpzvu
         HfThta2yydX7hjEacSE0HKoztl9uYndRJcwyC4OPzxndHr+WEZ/OadNoWR/Fi2qX26fl
         Vp202cT06fpS3FOfvIgCO/7GhT1tFU86mo3O+ai4lS5dY+dlFGQyZ4wNr2RjYZib5Opr
         SLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=B3T4Y7a84gLEiseyOukDpriSwBSOd9sFWxCqIXjDVVU=;
        fh=8FprZlSMeoqi1J8uJUHhF+YzL2g/Q5jAoXGbf/nCEdE=;
        b=a75kZoS9mNy2NSzWFImtIWGIQN9WOX5lpECzm0OcDuqKnOr0M7ZVeTbxRLVFPYXlVm
         Z2ydOC8B3KGXZbGF4NnP4+oGrOSGFkOTmtsuHOKe02NNpVG0MInPlmaLeO6AtRoyb3Lg
         N/mON3ea9MhqXMhWEE6kaB/1PjiTkC6NqxINFjKKPy3D96TYSoae6nWY5YJjijyGrVPu
         4LVs8LejykMPpDjqmkh55S5HQiS0fdFo5sh0cwOfCexRMLVCUPAbVLFUPfMipiRMxbqk
         cy7+htKOKf8sncjfM+by+48q0uoarRSkYFc0YQtPgpTv46tWyukDSctcmAYGdB3acQQG
         vxMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=blYi3FA2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5106f2be117si2219551e0c.69.2024.11.04.07.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 07:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20230601 header.b=blYi3FA2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7z7K-0003cj-Oe; Mon, 04 Nov 2024 10:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t7z7I-0003cC-4F; Mon, 04 Nov 2024 10:35:44 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1t7z7G-0003it-Ne; Mon, 04 Nov 2024 10:35:43 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-277e6002b7dso1737075fac.1; 
 Mon, 04 Nov 2024 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730734541; x=1731339341; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=B3T4Y7a84gLEiseyOukDpriSwBSOd9sFWxCqIXjDVVU=;
 b=blYi3FA2xnYQmb0i9nnVOwPjl54V7mkcL7pkclmbISQYwSBlK4hOaY226Krj4ivkc6
 Ix08DmNGsd0cJCO6+I4V5kflHBFMX9L69sNmQIfYZz9rrfaOR6JBB53A+cAWI0X3QfTN
 uUhrnMNRRiO/mkTxfpkKS0awLcZgJm5kxUmHiWGmazqTGX0CBcglIvzOj4bGfPhdNz1j
 WUuJpIVYuZ3W+9XXMl5zHuT2+kjMA+r+n8O+dbaKzc9TTWnJyDQBruj0NcjpoSDpLnL/
 wZJBgOwvr11pqWIyrnFrB5DIKr84UBbD+P3lM2ty8KkROycjSp1fDlLDkrufre87Vks4
 B72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730734541; x=1731339341;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B3T4Y7a84gLEiseyOukDpriSwBSOd9sFWxCqIXjDVVU=;
 b=Y2WIRoQqTEAV3sAwY84YMuxGQPf8t7rgjX0RVk1HLkrk7FfVXJta+CbtaRZMIy1oh3
 A7NicurgKC8bJ6cIDd0631yYjOKAe0i8i1WqlL8oUAg0CmszEV45vE6UdG6I6mPXJ4Ru
 2d39kKvQLKqSLR1PT2A2RcxsOi7gvF0KUKWTOrJJSjkGcAFtF+ntK9WprEfuOoVnUbNK
 q5T9Dj03hF5Ut4pLAu3sVUH7NfF8XgziiXqZn9FcySBM6somzf3N4whKk202usPn8f+I
 wHN0OECURX2og9F/DbtDHbFXYAtOFRT1SHDogkaKcLM9M06/aOnd962wj52BXO/+/MQq
 0Jmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRmTluIIIli7pm7CeBZLX4+KZlSmLxadtm1HJTTih9xBJ9fPu4ChNnKRM5XsigL9Nwj+BKmT3U5Q==@nongnu.org
X-Gm-Message-State: AOJu0YynvMXnHzVB5SN7bjwabfkcjAxWQPHrpFM/G9mmA6+NJ1040Oot
 ut8J38gFLXFKx367NbRFNEwRcdMHgTpPAqY+dONXphe2IBK3iN1l
X-Received: by 2002:a05:6870:3324:b0:279:334e:7f93 with SMTP id
 586e51a60fabf-2949ed580c5mr11044799fac.10.1730734540710; 
 Mon, 04 Nov 2024 07:35:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ee45a0ec8bsm7180678a12.79.2024.11.04.07.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 07:35:40 -0800 (PST)
Date: Mon, 4 Nov 2024 07:35:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 2/5] hw/net/lan9118_phy: Reuse in imx_fec and
 consolidate implementations
Message-ID: <f9e72d65-5116-4633-98a1-4f284a2ad5fb@roeck-us.net>
References: <20241102125724.532843-1-shentey@gmail.com>
 <20241102125724.532843-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102125724.532843-3-shentey@gmail.com>
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=groeck7@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CeaAi6K6Gjxo

On Sat, Nov 02, 2024 at 01:57:21PM +0100, Bernhard Beschow wrote:
> imx_fec models the same PHY as lan9118_phy. The code is almost the same with
> imx_fec having more logging and tracing. Merge these improvements into
> lan9118_phy and reuse in imx_fec to fix the code duplication.
> 
> Some migration state how resides in the new device model which breaks migration
> compatibility for the following machines:
> * imx25-pdk
> * sabrelite
> * mcimx7d-sabre
> * mcimx6ul-evk
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>
