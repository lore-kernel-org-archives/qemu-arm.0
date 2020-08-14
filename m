Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp718078lfy;
        Fri, 14 Aug 2020 12:28:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxv8vjSDlnhr3GnPcvqLGqVsSeXmWDTVNMe5AJRsdqdT7npoGObHhLWGoaMzpOMvXfltoH
X-Received: by 2002:a25:ca48:: with SMTP id a69mr5506773ybg.124.1597433319597;
        Fri, 14 Aug 2020 12:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597433319; cv=none;
        d=google.com; s=arc-20160816;
        b=MCOP1z19lvdwlOkW9g9ZKLxREt5/34SEgYlCJUBQQW+iDz/sdGkYpm4rohZUMbcIxI
         c3JAL3ZtwInd7qk9JQk1iGjcfXmyqRPvhBoUDrjaC2blnoqSPs0i5HbY/Sl1bubSNUrp
         vvT3B6HijZ6RliofECJxPlsVAgbsiXB01zWFCVQ2uw7JPzJafpruugMAYOfbJL/SRoop
         31Qo8JnG8FV0EQWCRQJRn2UUuQ5+DPsrfi6bzuAnwgQGh4YMhuU7ttxGCnEFEGTTLl3q
         FOp8+knqXT4bDEOAD/XMIOkCXKuQEVA5ujuvdGBj20ZkgisVbo7lu4qk8okC5JOyR0cT
         FhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=aCHU/3by+V6bpLNXZLdWi0og0hkOZhifiWdD2LpfZJc=;
        b=MdXCDOzPQP4I56EPC0H0OYDWvC9ems+oZuQ14RVja29s6qEpOvOgGWiDEDJyE573vd
         ewS4dS3gkFvFH6ijrqzd0x6prz3ymhWCs5qVjhkAeBPcb+me0hkt0QNsOXix/QQFKCGd
         iZgrO6I3BYDISIKZJE82SJb03+nK64wtla+nGCxd5J0y3EzhzXA3ZWSPDepBBBGzI7cY
         0D6hxqMMoVxbtERzfCkRi4eEfataMN7JF/MKYT6lFY9+i+XKmzQ3soZm4oDW397kVNps
         1Y1pWmYtiNoXR0KcpH4MCLgzGmUif/h9mAch7/aiviJfboFBc8kxSDYgbMZ6U5odPFaA
         Mu+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hNqKc/RH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84si10455285ybs.20.2020.08.14.12.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 12:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hNqKc/RH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6fNW-0003RB-Uu
	for alex.bennee@linaro.org; Fri, 14 Aug 2020 15:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6fNP-0003OX-Kv
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 15:28:31 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6fNO-000556-1e
 for qemu-arm@nongnu.org; Fri, 14 Aug 2020 15:28:31 -0400
Received: by mail-pl1-x642.google.com with SMTP id g15so720057plj.6
 for <qemu-arm@nongnu.org>; Fri, 14 Aug 2020 12:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aCHU/3by+V6bpLNXZLdWi0og0hkOZhifiWdD2LpfZJc=;
 b=hNqKc/RHL2RylkfktI4b7CG+2NWfuVeFSGCVg3QiDIFeLWPXVh9vQXSnSLPvAKfOWd
 Fare1V56nrFLyJoaX1OHxUCkDWbF4F9GNjpthqEAQB1XuaBbHbXJisjvczd4/Wz/5x9R
 WGQ8q0f3sXo32OibPkbcFkNKwZ/xC225w+pr73zistVOi5W9N8VB7KNS2sEtlGMf393j
 4IU3n7XWRxS4nMnwEB08K+D6x3pW1OXDWzxxIQiiX6tcmFM1PtK/jULkNIfcbea+Q5bL
 wWBjyFypidKcl3Ah9owvzAoMionbK9Kn5v8N0neXQYLkYKwCf7xAbwaGl3FwMLyYr2JI
 4omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aCHU/3by+V6bpLNXZLdWi0og0hkOZhifiWdD2LpfZJc=;
 b=AerzE+l3xer8UpM1+x77pbkY0q3gWMALeB/uOeioMkQ5DUvR1r2NDAbykuikt8VSj1
 CAsDzIf+ea387iIgpk+yho9FBBxztfHApBk7ZBZKTjLRGv8Iwd38YUCW8qAPEX3goSDd
 5hCQPkQvBRILt7QETVedUH+7TTdFq6CmFUO2dV2NhPK9QKw4FB34BCP1d/qa+PfcoiTW
 Yp8RnJtemdSeXIj/LjqLgSkhlK8uHg09c2nOnAbt4elMejMGmUnmJ6ssoUGca/leVrSC
 y2vk7NBm6rwvopKjI6g8rrn82R2OEhTzAJDNMzZqTllD0lghIkf8vVJVhyqDtrVPKQ4m
 OO7w==
X-Gm-Message-State: AOAM532A2El2CFGLLQofO9VWcrD7HGC5mrJj0o2TjOs5MMhNRusCVf69
 rgxEPxo+DpQDG/7HcMtqH7kSFg==
X-Received: by 2002:a17:90b:128e:: with SMTP id
 fw14mr3511447pjb.66.1597433308462; 
 Fri, 14 Aug 2020 12:28:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w23sm9038217pgj.5.2020.08.14.12.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 12:28:27 -0700 (PDT)
Subject: Re: [PATCH 7/7] target/arm/cpu: spe: Enable spe to work with host cpu
To: Andrew Jones <drjones@redhat.com>, Haibo Xu <haibo.xu@linaro.org>
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <bf909c1f4904a22be0804cae9fd6f38ba4862563.1596768588.git.haibo.xu@linaro.org>
 <20200810111640.ykejphmuyirncjwv@kamzik.brq.redhat.com>
 <CAJc+Z1F_vFdJuy2kZnj0gZSOd_8-=rSfWFHjQSPU5XEKQ2KZkg@mail.gmail.com>
 <20200811164954.s2sdjzpqpdh2orks@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13da2df2-7d90-9512-d1b1-8d7c5f43971c@linaro.org>
Date: Fri, 14 Aug 2020 12:28:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811164954.s2sdjzpqpdh2orks@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OJcrIHA8GB7+

On 8/11/20 9:49 AM, Andrew Jones wrote:
> Yes, except you need to drop the ARM_FEATURE_SPE define and use the ID
> register bit instead like "sve_supported" does.

On a related note, I think we have a latent bug, or at least a mis-feature:

    sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
...
    /* Add feature bits that can't appear until after VCPU init. */
    if (sve_supported) {
        t = ahcf->isar.id_aa64pfr0;
        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
        ahcf->isar.id_aa64pfr0 = t;
    }


Should it in fact be

    if (!sve_supported) {
        t = ahcf->isar.id_aa64pfr0;
        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 0);
        ahcf->isar.id_aa64pfr0 = t;
    }

?

Forcing the value to 1 here is going to be wrong the moment we have an SVE2
enabled cpu.

Similarly, SPE has more than one "enabled" value for PMSVer.


r~
