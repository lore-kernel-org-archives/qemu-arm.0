Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1271287lfm;
        Fri, 17 Apr 2020 20:37:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypL73MzYQZfxdE1PNwZp/PMzKBrRuPwfDxRqP+p5BI6A79N04HhQo94DVupjSDBVjTs1tr5H
X-Received: by 2002:a05:6214:15d1:: with SMTP id p17mr5965482qvz.45.1587181042726;
        Fri, 17 Apr 2020 20:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587181042; cv=none;
        d=google.com; s=arc-20160816;
        b=X0nqpmMG+HORbeJhlLiiwbepy4FNx9v1NjkV1EC9/AUTIvAA2Ng62E21YmwtcyCp9W
         Hv/pR7MsWAsNTME00UpNaTVz+CtOTL5u7pW6EImwZ9yWrz6MZY88uhU7jUKD7OOx05nP
         DHTGmNtDt5kNt023xyJ2VnzgeqXQ4+g/NFAhzWn9pIovMuauHhfcxoCDpT9+PusIXux3
         QORPHROAMtiJvjJpkBKD3AXQkDmL6z+U7EmTzXBhH9XrGWj8X0VUfVywh5DsjNtYA0c9
         LPaHNDLGUM5fd/8QxIWfcovbHiK3eSxm8CoUJYVRPVuMWIjvVL8rBKUJCjbV/dSWuxBB
         9ELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7lm71FM8jAywewUQQ6iTxyvXW44ISzsx8AV54B1hpyI=;
        b=iHOGfBeDdbMT4Knf3uHLIMIMIXvgmshkboRnyGGaZ/WXZ6UYvVzCGB7WyzrhEFbjg1
         JVTq0hfERESVC23LfXfFStRf5DgdBG0ntX4W7jJUdGjEAFKLsLlUIKfIrjl2MF7VT6lj
         euaFG09IbYgF01xG1y0doFarfDB3mDZHBbyodPmBaw7N78T2Ye+VjmXG0Tx/p5KoYSjA
         xjAqXLfT03pkN8GX/jgDQXr86qGz55MdzATDtcg2UYfxUBrZYX1lsi0j19PvWHSmNTQo
         HFh+zzA0QhG5g/A9A7SIfy3IYuRIwEeArxKJgzMxWlycJehLb2yxzO6mQX6syREihpbM
         kiiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v7LrDTgX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si2032935qtw.194.2020.04.17.20.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 20:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v7LrDTgX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPeID-0001fn-Q9
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 23:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPeHA-0001fb-IE
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPeH8-0002IN-83
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:36:15 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36300)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPeH7-00028O-Nn
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 23:36:14 -0400
Received: by mail-pl1-x643.google.com with SMTP id g2so1706127plo.3
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 20:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7lm71FM8jAywewUQQ6iTxyvXW44ISzsx8AV54B1hpyI=;
 b=v7LrDTgXAvniXET4W8lZzGr9UA5jT9DNT0w+vLs+it47vdpkw6FN5Q7JZwj482+ZGC
 tvga5Jyvr1LI7PPvW7Cz1emtF8+4ebTWa8CBVsblhLxECS1/7uJLqNE3c3ohy/dqyQQb
 5XiqhW1CKV4V8G9IFxwfezGqxV7B05ibAJFXvS4tteH/QI43o50a3VLL7NWadgTvixYJ
 QJE4NYmZkSscB+8J/pPp1dBhxVZtzL6vNMJhNEbxD6CJENcWQLe4RM2U85QQlecjEAtN
 J9IFac/yGHXj8G1QyTyFCsw9tzfHyLsekz7ZWkcuLwfwdBLCH0jxpnA/+rsSFi3h9HG9
 z4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7lm71FM8jAywewUQQ6iTxyvXW44ISzsx8AV54B1hpyI=;
 b=Kud0rTf8fw3o38V037sdkYCR0fmawiKw2+RFnMRMCK7n5EJgkP10hhu5KDtVr42c59
 7SYsvxjh+46BEMpoSyeyirDCA60ocItPAogyjhGVVVW8jibqC87mTX3cRdtzpyvmXTWd
 dtmH+XfSrRpQctea2FdLcJI3+/6u+4WLM3RIHPFY1Rr+9EVI2HSVMEaLCPKGYktpRMVi
 GyNNasbw30uMSctim+nOjuxfp2AYk6s/lr6SmJXm70qQhq+gp+t9TOWexnmx7HjoHCEN
 1xeSFuY6QL/JenDkQsmUnyGzcAOPjj8zonwt8XrQlHk5y/b1T7BInrj6SIouhBrB1EhC
 YhZg==
X-Gm-Message-State: AGi0Pub1qT///sKkF4hJCVeCxqdkWBCYrcDMi5X/2sG2VH9AVy/dsuM7
 H1KgVaDMPqylL6t4oGTPTd4/KSaLWy4=
X-Received: by 2002:a17:90a:3568:: with SMTP id
 q95mr8369337pjb.47.1587180972138; 
 Fri, 17 Apr 2020 20:36:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id u24sm17456609pgo.65.2020.04.17.20.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 20:36:11 -0700 (PDT)
Subject: Re: [PATCH 11/16] target/arm: Update contiguous first-fault and
 no-fault loads
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-12-richard.henderson@linaro.org>
 <CAFEAcA_V09rpr4X_TTZgo+v5Dj1yZR4zA9-94q+C5xikkhM=BQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea6f727f-a4fc-1106-bb16-5f93c5fdd450@linaro.org>
Date: Fri, 17 Apr 2020 20:36:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_V09rpr4X_TTZgo+v5Dj1yZR4zA9-94q+C5xikkhM=BQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gTbLrB8uG/cV

On 4/16/20 7:15 AM, Peter Maydell wrote:
>> +     * While we do not have access to the memory attributes from the PTE
>> +     * to tell Device memory from Normal memory, we can validly assume that
>> +     * non-RAM has been mapped as Device memory.  Thus we indicate fault
>> +     * on all MMIO.
> 
> I don't think you can assume this; for instance a QEMU 'romd'
> device might reasonably be mapped as Normal memory but currently
> be in "send all accesses to my read/write functions" mode.

If that is so, then TLB_MMIO will be set in the tlb_entry comparator.  See
accel/tcg/cputlb.c:882.


r~
