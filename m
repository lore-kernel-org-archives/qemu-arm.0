Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp947566lfg;
        Thu, 1 Apr 2021 17:00:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXy8cdC788ZatTm5IHhFbW2VEtOVXahPyHQ8n+3wElf3xor4NbxjSwLcRF18UQYnS0IsBl
X-Received: by 2002:a05:6102:238f:: with SMTP id v15mr7682373vsr.45.1617321639381;
        Thu, 01 Apr 2021 17:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617321639; cv=none;
        d=google.com; s=arc-20160816;
        b=Db42preUWrULOyuAPIRxPYMoHjsZcI8/QO10f+l4htnjKQcjv7MrKwycGMj4TUZOs5
         +rGFau2TmPzaz/u0rpMQ3CCTM3Kjm15dSSXniKW7FvP8BpxRIWBN1Dta8KX1EWuucFu2
         jit2LhdIU/WtPFN7y1CthQdJdKuVDbLa9LAKtAjIBuaVdgppLo2R+mFkdalFmyDIr/C0
         cGMEz90btDIDzCbeWxxFwPXfd8qQoivvR2lYxEQXZxAzztpA26VS25XFtQnfSXNxTKyl
         pyE5oJp+1AEfnCo3IOHnywj+gJq4D9QznfqWLeYT1gnqDikjXH7c9sndeHHV20mLC/qI
         HS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3m+Yr6+kAs3VVuib5u2CW55NaWN23o+bfD3ft4DRLXM=;
        b=AhzyVLmV4Cv40zrbkO/3VTvxCaDLDnpd/mOqDsqQcHoPLNHOMcsklVA9e8W3j9wHVO
         9dOqo+EXMNtwhjyfSgMEciN37yUT9fMv6MiU4zCSGhPBJHoGvXFHxP2bO9x+Ge5lir4Z
         tfNR0J+Zv2jhOg/jBH9EF2WJQiykgpjJkZ3iG5qWEVD19NYm0n4gSufNfRkh1yNSl65I
         F9Mcjp6XQ0FAhCbBF+5YXo7re+Pv1QqBW2jSjZvzymkIswgVv6Aev9jrIfYRHioOwJdi
         Dqc2MRQC6CVNSKr/dOs9uFElYPwqE61nNskjiVvLDdbl4X0H3wSc20N30GkET2LMEyGI
         3fKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GfkZ+3VA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si2037799vka.84.2021.04.01.17.00.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 17:00:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GfkZ+3VA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lS7Es-0007Wz-KK
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 20:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lS7Ec-0007VG-I0
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 20:00:22 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lS7Ea-0003F4-FK
 for qemu-arm@nongnu.org; Thu, 01 Apr 2021 20:00:22 -0400
Received: by mail-pg1-x530.google.com with SMTP id f10so2569341pgl.9
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3m+Yr6+kAs3VVuib5u2CW55NaWN23o+bfD3ft4DRLXM=;
 b=GfkZ+3VA3opMvysdOt6U8ihd3ydHO7vVuo+h03uU3r+R6xoxcg0KDPBfKQqSZCk+Yb
 1FuqM2dAhOB1d4pmusjM1jp0nu6t+iDYP2ouzVmrHOrKMMLChgYYaxw1W1BDM2iuMnyJ
 y+FklXxqprK8Db4D3oFHOoPr6VY1Fs2qUKhT03wUvtAf/gElBZRf6cGvgBWqLCaKzVPt
 wAMcMso8+gp3AdJNYtTeENn2qJxVZIjzfO/Of/zmCpIyAJqmoAzOyrQPBd7Lr9t696Hw
 VOtLl18jwU/H5UE9PZe+LmxLoo6oWPA9XrppPyr5259yWqy49uH9WwTtGFJNKcaJz9EI
 wtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3m+Yr6+kAs3VVuib5u2CW55NaWN23o+bfD3ft4DRLXM=;
 b=cR8+P2xcSvF+E6Es7KS7L//YLVH/US2q/xpyrhQ9SmtkUirg/3S3sQcfS3MIi7iEl9
 jK5W3FsFLwiQHv2gDl7BfsTMQr183iAAiTfBhgo6I/okPIOJVWVYAaaERrmjQMZ9iRDj
 yoxsWD/Sz0h3Ddil/jF574a0dwDMCix5ASAM2f+Vh1T3HL+pHTJbxFSnlL7V0W11i4UD
 wn2EtDl85Wdz0xALNdXMNnzoIM/Ln2C+iff4C6eUCg/9Y0atl5j3ro+iDPJvtBc0mgd+
 lyywGCKW7jGLH++OmDmqOCnlYvSJAIbkVy7Spoj4MIYuXVDvfr8aXQx94z79aiTD2nnO
 Jr6w==
X-Gm-Message-State: AOAM533ezv8NRtwQJYtkzjsf7qsGPf9hCPVRX/dYyrP//WiJxK+Fsy8E
 V8vgUt2wnOZXKKVu3lxqhHMh2ke5kiDB+g==
X-Received: by 2002:a62:1e46:0:b029:1f3:ad4f:9c6b with SMTP id
 e67-20020a621e460000b02901f3ad4f9c6bmr9992661pfe.64.1617321618147; 
 Thu, 01 Apr 2021 17:00:18 -0700 (PDT)
Received: from [192.168.81.184]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k10sm6421470pfk.205.2021.04.01.17.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 17:00:17 -0700 (PDT)
Subject: Re: Question about MTE and SyS_brk
To: Stephen Long <steplong@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <MWHPR0201MB354790AEB8421F7F8EB98EC3C77B9@MWHPR0201MB3547.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbb3f563-1af1-41b1-daa3-59ebadae65b2@linaro.org>
Date: Thu, 1 Apr 2021 17:00:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <MWHPR0201MB354790AEB8421F7F8EB98EC3C77B9@MWHPR0201MB3547.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FQZ6V+BW8iTR

On 3/31/21 8:57 PM, Stephen Long wrote:
> Hi Richard, do you know if the following is supposed to work?

It works on FVP.  Probably works on qemu-system mode.


> I think it's aborting
> with qemu because qemu is considering the page not anonymous

Yep.  It looks like PAGE_ANON got lost with the mprotect.
Not good.


r~
